#!/usr/bin/env python
#
# Copyright (C) 2011, 2012  Google Inc.
#
# This file is part of YouCompleteMe.
#
# YouCompleteMe is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# YouCompleteMe is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with YouCompleteMe.  If not, see <http://www.gnu.org/licenses/>.

import os
import logging
import ycm_core
from collections import defaultdict
from ycmd.completers.general_completer import GeneralCompleter
from ycmd import identifier_utils
from ycmd import utils
from ycmd.utils import ToUtf8IfNeeded
from ycmd import responses

SYNTAX_FILENAME = 'YCM_PLACEHOLDER_FOR_SYNTAX'


class IdentifierCompleter( GeneralCompleter ):
  def __init__( self, user_options ):
    super( IdentifierCompleter, self ).__init__( user_options )
    self._completer = ycm_core.IdentifierCompleter()
    self._tags_file_last_mtime = defaultdict( int )
    self._logger = logging.getLogger( __name__ )
    self._max_candidates = user_options[ 'max_num_identifier_candidates' ]


  def ShouldUseNow( self, request_data ):
    return self.QueryLengthAboveMinThreshold( request_data )


  def ComputeCandidates( self, request_data ):
    if not self.ShouldUseNow( request_data ):
      return []

    completions = self._completer.CandidatesForQueryAndType(
      ToUtf8IfNeeded( utils.SanitizeQuery( request_data[ 'query' ] ) ),
      ToUtf8IfNeeded( request_data[ 'filetypes' ][ 0 ] ) )

    completions = completions[ : self._max_candidates ]
    completions = _RemoveSmallCandidates(
      completions, self.user_options[ 'min_num_identifier_candidate_chars' ] )

    def ConvertCompletionData( x ):
        return responses.BuildCompletionData(
                insertion_text = x,
                extra_menu_info='[ID]' )

    return [ ConvertCompletionData( x ) for x in completions ]


  def AddIdentifier( self, identifier, request_data ):
    try:
      filetype = request_data[ 'filetypes' ][ 0 ]
    except KeyError:
      filetype = None
    filepath = request_data[ 'filepath' ]

    if not filetype or not filepath or not identifier:
      return

    vector = ycm_core.StringVector()
    vector.append( ToUtf8IfNeeded( identifier ) )
    self._logger.info( 'Adding ONE buffer identifier for file: %s', filepath )
    self._completer.AddIdentifiersToDatabase( vector,
                                              ToUtf8IfNeeded( filetype ),
                                              ToUtf8IfNeeded( filepath ) )


  def AddPreviousIdentifier( self, request_data ):
    self.AddIdentifier(
      _PreviousIdentifier(
        self.user_options[ 'min_num_of_chars_for_completion' ],
        request_data ),
      request_data )


  def AddIdentifierUnderCursor( self, request_data ):
    cursor_identifier = _GetCursorIdentifier( request_data )
    if not cursor_identifier:
      return

    self.AddIdentifier( cursor_identifier, request_data )


  def AddBufferIdentifiers( self, request_data ):
    try:
      filetype = request_data[ 'filetypes' ][ 0 ]
    except KeyError:
      filetype = None
    filepath = request_data[ 'filepath' ]
    collect_from_comments_and_strings = bool( self.user_options[
      'collect_identifiers_from_comments_and_strings' ] )

    if not filetype or not filepath:
      return

    text = request_data[ 'file_data' ][ filepath ][ 'contents' ]
    self._logger.info( 'Adding buffer identifiers for file: %s', filepath )
    self._completer.ClearForFileAndAddIdentifiersToDatabase(
        _IdentifiersFromBuffer( text,
                                filetype,
                                collect_from_comments_and_strings ),
        ToUtf8IfNeeded( filetype ),
        ToUtf8IfNeeded( filepath ) )


  def AddIdentifiersFromTagFiles( self, tag_files ):
    absolute_paths_to_tag_files = ycm_core.StringVector()
    for tag_file in tag_files:
      try:
        current_mtime = os.path.getmtime( tag_file )
      except:
        continue
      last_mtime = self._tags_file_last_mtime[ tag_file ]

      # We don't want to repeatedly process the same file over and over; we only
      # process if it's changed since the last time we looked at it
      if current_mtime <= last_mtime:
        continue

      self._tags_file_last_mtime[ tag_file ] = current_mtime
      absolute_paths_to_tag_files.append( ToUtf8IfNeeded( tag_file ) )

    if not absolute_paths_to_tag_files:
      return

    self._completer.AddIdentifiersToDatabaseFromTagFiles(
      absolute_paths_to_tag_files )


  def AddIdentifiersFromSyntax( self, keyword_list, filetypes ):
    keyword_vector = ycm_core.StringVector()
    for keyword in keyword_list:
      keyword_vector.append( ToUtf8IfNeeded( keyword ) )

    filepath = SYNTAX_FILENAME + filetypes[ 0 ]
    self._completer.AddIdentifiersToDatabase( keyword_vector,
                                              ToUtf8IfNeeded( filetypes[ 0 ] ),
                                              ToUtf8IfNeeded( filepath ) )


  def OnFileReadyToParse( self, request_data ):
    self.AddBufferIdentifiers( request_data )
    if 'tag_files' in request_data:
      self.AddIdentifiersFromTagFiles( request_data[ 'tag_files' ] )
    if 'syntax_keywords' in request_data:
      self.AddIdentifiersFromSyntax( request_data[ 'syntax_keywords' ],
                                     request_data[ 'filetypes' ] )


  def OnInsertLeave( self, request_data ):
    self.AddIdentifierUnderCursor( request_data )


  def OnCurrentIdentifierFinished( self, request_data ):
    self.AddPreviousIdentifier( request_data )


# This looks for the previous identifier and returns it; this might mean looking
# at last identifier on the previous line if a new line has just been created.
def _PreviousIdentifier( min_num_candidate_size_chars, request_data ):
  def PreviousIdentifierOnLine( line, column ):
    nearest_ident = ''
    for match in identifier_utils.IdentifierRegexForFiletype(
        filetype ).finditer( line ):
      if match.end() <= column:
        nearest_ident = match.group()
    return nearest_ident

  line_num = request_data[ 'line_num' ] - 1
  column_num = request_data[ 'column_num' ] - 1
  filepath = request_data[ 'filepath' ]
  try:
    filetype = request_data[ 'filetypes' ][ 0 ]
  except KeyError:
    filetype = None

  contents_per_line = (
    request_data[ 'file_data' ][ filepath ][ 'contents' ].split( '\n' ) )

  ident = PreviousIdentifierOnLine( contents_per_line[ line_num ], column_num )
  if ident:
    if len( ident ) < min_num_candidate_size_chars:
      return ''
    return ident

  prev_line = contents_per_line[ line_num - 1 ]
  ident = PreviousIdentifierOnLine( prev_line, len( prev_line ) )
  if len( ident ) < min_num_candidate_size_chars:
    return ''
  return ident


def _RemoveSmallCandidates( candidates, min_num_candidate_size_chars ):
  if min_num_candidate_size_chars == 0:
    return candidates

  return [ x for x in candidates if len( x ) >= min_num_candidate_size_chars ]


def _GetCursorIdentifier( request_data ):
  try:
    filetype = request_data[ 'filetypes' ][ 0 ]
  except KeyError:
    filetype = None
  return identifier_utils.IdentifierAtIndex( request_data[ 'line_value' ],
                                             request_data[ 'column_num' ] - 1,
                                             filetype )


def _IdentifiersFromBuffer( text,
                            filetype,
                            collect_from_comments_and_strings ):
  if not collect_from_comments_and_strings:
    text = identifier_utils.RemoveIdentifierFreeText( text )
  idents = identifier_utils.ExtractIdentifiersFromText( text, filetype )
  vector = ycm_core.StringVector()
  for ident in idents:
    vector.append( ToUtf8IfNeeded( ident ) )
  return vector

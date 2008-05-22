#!/usr/bin/env ruby

# Ruby Title Case
# A Ruby implementation of John Gruber's Title Case
# http://daringfireball.net/2008/05/title_case
#
# Copyright (c) Paul Mucur (http://mucur.name), 2008.
# Dual-licensed under the BSD (BSD-LICENSE.txt) and GPL (GPL-LICENSE.txt)
# licenses.
# 
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

class String

  # A regular expression to match small words that should not be
  # titleized.
  SMALL_WORDS_RE = /^(a|an|and|as|at|but|by|en|for|if|in|of|on|or|the|to|v\.?|via|vs\.?)$/
  
  def titleize_if_appropriate

    # If a word does not contain a full-stop within itself and it doesn't
    # contain any capital letters apart from its first letter, titleize it.
    if !self[/\w\.\w/] && !self[/^.+[A-Z]/]
      
      # Capitalise the first *word* character (therefore avoiding problems
      # where the first character is some punctuation).
      self[/^\W*\w/] = self[/^\W*\w/].upcase
    end
    self
  end

  def title_case

    # Keep track when a colon has been used at the end of a word.
    colon_preceding = false
    
    # Split the string by any whitespace and then inspect each word
    # at a time.
    words = split(/\s+/).map do |word|
      title_cased_word = if colon_preceding
        
        # If there was a colon preceding this word then titleize
        # it even if it is a small word.
        colon_preceding = false
        word.titleize_if_appropriate
      elsif word.downcase[SMALL_WORDS_RE]
        
        # If this is a small word, make it lowercase.
        word.downcase
      else
        
        # In all other cases, titleize the word.
        word.titleize_if_appropriate
      end

      # If this word ends in a colon, set the flag so that the
      # following word can be titleized.
      colon_preceding = true if word[/:$/]

      title_cased_word
    end

    # Always capitalise the first and last words.
    words[0] = words[0].titleize_if_appropriate
    words[-1] = words[-1].titleize_if_appropriate
    
    words.join(" ")
  end
end

if $0 == __FILE__
  
  # If this file is being executed, read in from the command line
  # and STDIN.
  input = ARGV.first || STDIN.read
  
  if input.empty?
    
    # If no input was given, print simple usage instructions
    puts "usage: ruby title_case.rb [TEXT_TO_TITLE_CASE]"
  else
    puts input.title_case
  end
end
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

  SMALL_WORDS_RE = /^(a|an|and|as|at|but|by|en|for|if|in|of|on|or|the|to|v\.?|via|vs\.?)$/
  
  def titleize_if_appropriate

    # If a word contains a full-stop within itself or if it has
    # a capital letter that is not its first letter, leave it alone.
    if !self[/\w\.\w/] && !self[/^.+[A-Z]/]
      self[/^\W*(\w)/] = self[/^\W*(\w)/].upcase
    end
    self
  end

  def title_case

    # Keep track when a colon has been used at the end of a word.
    colon_preceding = false

    words = split(/\s+/).map do |word|
      title_cased_word = if colon_preceding
        colon_preceding = false
        word.titleize_if_appropriate
      elsif word.downcase[SMALL_WORDS_RE]
        word.downcase
      else
        word.titleize_if_appropriate
      end

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
  input = ARGV.first || STDIN.read
  if input.empty?
    puts "usage: ruby title_case.rb [TEXT_TO_TITLE_CASE]"
  else
    puts input.title_case
  end
end
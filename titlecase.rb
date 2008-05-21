#!/usr/bin/env ruby

# Ruby Title Case
# A Ruby implementation of John Gruber's Title Case
# http://daringfireball.net/2008/05/title_case
#
# By Paul Mucur
# http://mucur.name/posts/ruby-title-case

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

    words[0] = words[0].titleize_if_appropriate
    words[-1] = words[-1].titleize_if_appropriate
    words.join(" ")
  end
end

if $0 == __FILE__
  if ARGV.empty?
    puts "Usage: ruby titlecase.rb TEXT_TO_TITLE_CASE"
  else
    puts ARGV.first.dup.title_case
  end
end
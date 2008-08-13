#!/usr/bin/env ruby
require 'test/unit'
require 'title_case'

class String
  include TitleCase
end

class TitleCaseTest < Test::Unit::TestCase
  def test_qa_with_steve_jobs
    assert_equal "Q&A With Steve Jobs: 'That's What Happens in Technology'", 
      "Q&A With Steve Jobs: 'That's What Happens In Technology'".title_case
  end
  
  def test_atts_problem
    assert_equal "What Is AT&T's Problem?", 
      "What Is AT&T's Problem?".title_case
  end
  
  def test_apple_deal_falls_through
    assert_equal "Apple Deal With AT&T Falls Through", 
      "Apple Deal With AT&T Falls Through".title_case
  end
  
  def test_this_v_that
    assert_equal "This v That", "this v that".title_case
  end
  
  def test_this_vs_that
    assert_equal "This vs That", "this vs that".title_case
  end
  
  def test_this_v__that
    assert_equal "This v. That", "this v. that".title_case
  end
  
  def test_this_vs__that
    assert_equal "This vs. That", "this vs. that".title_case
  end
  
  def test_sec_apple_probe
    assert_equal "The SEC's Apple Probe: What You Need to Know", 
      "The SEC's Apple Probe: What You Need to Know".title_case
  end
  
  def test_small_word_at_start_in_quotes
    assert_equal "'By the Way, Small Word at the Start but Within Quotes.'", 
      "'by the Way, small word at the start but within quotes.'".title_case
  end
  
  def test_small_word_at_end
    assert_equal "Small Word at End Is Nothing to Be Afraid Of", 
      "Small word at end is nothing to be afraid of".title_case
  end
  
  def test_sub_phrase_small_word
    assert_equal "Starting Sub-Phrase With a Small Word: A Trick, Perhaps?",
      "Starting Sub-Phrase With a Small Word: a Trick, Perhaps?".title_case
  end
  
  def test_sub_phrase_small_word_single_quotes
    assert_equal "Sub-Phrase With a Small Word in Quotes: 'A Trick, Perhaps?'",
      "Sub-Phrase With a Small Word in Quotes: 'a Trick, Perhaps?'".title_case
  end
  
  def test_sub_phrase_small_word_double_quotes
    assert_equal 'Sub-Phrase With a Small Word in Quotes: "A Trick, Perhaps?"',
      'Sub-Phrase With a Small Word in Quotes: "a Trick, Perhaps?"'.title_case
  end
  
  def test_nothing_to_be_afraid_lowercase_of
    assert_equal '"Nothing to Be Afraid Of?"', '"Nothing to Be Afraid of?"'.title_case
  end
  
  def test_nothing_to_be_afraid_uppercase_of
    assert_equal '"Nothing to Be Afraid Of?"', '"Nothing to Be Afraid Of?"'.title_case
  end
  
  def test_a_thing
    assert_equal "A Thing", "a thing".title_case
  end
  
  def test_known_issues
    assert_equal "2lmc Spool: 'Gruber on OmniFocus and Vapo(u)rware'",
      "2lmc Spool: 'Gruber on OmniFocus and Vapo(u)rware'".title_case
  end
  
  def test_url_after_colon
    assert_equal "A Word: del.icio.us Site",
      "A Word: del.icio.us Site".title_case
  end
  
  def test_url_at_beginning
    assert_equal "mucur.name Is a Treasure Trove",
      "mucur.name Is a Treasure Trove".title_case
  end
  
  def test_url_at_end
    assert_equal "I Like google.com", "I Like google.com".title_case
  end
  
  def test_step_by_step
    assert_equal "For Step-by-Step Directions Email someone@gmail.com", "For Step-by-Step Directions Email someone@gmail.com".title_case
  end
  
  def test_lottery
    assert_equal "Have You Read \"The Lottery\"?", "Have You Read \"The Lottery\"?".title_case
  end
  
  def test_haircut
    assert_equal "Your Hair[cut] Looks (Nice)", "Your Hair[cut] Looks (Nice)".title_case
  end
  
  def test_people_probably
    assert_equal "People Probably Won't Put http://foo.com/bar/ in Titles", "People Probably Won't Put http://foo.com/bar/ in Titles".title_case
  end
  
  def test_scott_moritz
    assert_equal "Scott Moritz and TheStreet.com’s Million iPhone La‑La Land", "Scott Moritz and TheStreet.com’s Million iPhone La‑La Land".title_case
  end
  
  def test_blackberry
    assert_equal "BlackBerry vs. iPhone", "BlackBerry vs. iPhone".title_case
  end
  
  def test_notes
    assert_equal "Notes and Observations Regarding Apple’s Announcements From ‘The Beat Goes On’ Special Event", "Notes and Observations Regarding Apple’s Announcements From ‘The Beat Goes On’ Special Event".title_case
  end
  
  def test_read_markdown
    assert_equal "Read markdown_rules.txt to Find Out How _Underscores Around Words_ Will Be Interpretted", "Read markdown_rules.txt to Find Out How _Underscores Around Words_ Will Be Interpretted".title_case
  end
end
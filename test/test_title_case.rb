# encoding: UTF-8
require 'test/unit'
require 'title_case'

# In order to test mixing directly into the String class, create a separate
# String class to keep from interfering with other tests.
class TitleCaseString < String
  include TitleCase
end

class TitleCaseTest < Test::Unit::TestCase
  def assert_title_case(expected, actual)

    # Test that it works when mixing into the whole String class.
    title_case_string = TitleCaseString.new(actual)
    assert_equal expected, title_case_string.title_case

    # Test that it works when extending a single instance.
    actual.extend(TitleCase)
    assert_equal expected, actual.title_case
  end

  def test_string_is_not_polluted
    assert !String.new.respond_to?(:title_case),
        "Strings should not have a title_case method by default."
  end

  def test_qa_with_steve_jobs
    assert_title_case "Q&A With Steve Jobs: 'That's What Happens in Technology'",
      "Q&A With Steve Jobs: 'That's What Happens In Technology'"
  end

  def test_atts_problem
    assert_title_case "What Is AT&T's Problem?",
      "What Is AT&T's Problem?"
  end

  def test_apple_deal_falls_through
    assert_title_case "Apple Deal With AT&T Falls Through",
      "Apple Deal With AT&T Falls Through"
  end

  def test_this_v_that
    assert_title_case "This v That", "this v that"
  end

  def test_this_vs_that
    assert_title_case "This vs That", "this vs that"
  end

  def test_this_v__that
    assert_title_case "This v. That", "this v. that"
  end

  def test_this_vs__that
    assert_title_case "This vs. That", "this vs. that"
  end

  def test_sec_apple_probe
    assert_title_case "The SEC's Apple Probe: What You Need to Know",
      "The SEC's Apple Probe: What You Need to Know"
  end

  def test_small_word_at_start_in_quotes
    assert_title_case "'By the Way, Small Word at the Start but Within Quotes.'",
      "'by the Way, small word at the start but within quotes.'"
  end

  def test_small_word_at_end
    assert_title_case "Small Word at End Is Nothing to Be Afraid Of",
      "Small word at end is nothing to be afraid of"
  end

  def test_sub_phrase_small_word
    assert_title_case "Starting Sub-Phrase With a Small Word: A Trick, Perhaps?",
      "Starting Sub-Phrase With a Small Word: a Trick, Perhaps?"
  end

  def test_sub_phrase_small_word_single_quotes
    assert_title_case "Sub-Phrase With a Small Word in Quotes: 'A Trick, Perhaps?'",
      "Sub-Phrase With a Small Word in Quotes: 'a Trick, Perhaps?'"
  end

  def test_sub_phrase_small_word_double_quotes
    assert_title_case 'Sub-Phrase With a Small Word in Quotes: "A Trick, Perhaps?"',
      'Sub-Phrase With a Small Word in Quotes: "a Trick, Perhaps?"'
  end

  def test_nothing_to_be_afraid_lowercase_of
    assert_title_case '"Nothing to Be Afraid Of?"', '"Nothing to Be Afraid of?"'
  end

  def test_nothing_to_be_afraid_uppercase_of
    assert_title_case '"Nothing to Be Afraid Of?"', '"Nothing to Be Afraid Of?"'
  end

  def test_a_thing
    assert_title_case "A Thing", "a thing"
  end

  def test_known_issues
    assert_title_case "2lmc Spool: 'Gruber on OmniFocus and Vapo(u)rware'",
      "2lmc Spool: 'Gruber on OmniFocus and Vapo(u)rware'"
  end

  def test_url_after_colon
    assert_title_case "A Word: del.icio.us Site",
      "A Word: del.icio.us Site"
  end

  def test_url_at_beginning
    assert_equal "mucur.name Is a Treasure Trove",
      "mucur.name Is a Treasure Trove"
  end

  def test_url_at_end
    assert_title_case "I Like google.com", "I Like google.com"
  end

  def test_step_by_step
    assert_title_case "For Step-by-Step Directions Email someone@gmail.com", "For Step-by-Step Directions Email someone@gmail.com"
  end

  def test_lottery
    assert_title_case "Have You Read \"The Lottery\"?", "Have You Read \"The Lottery\"?"
  end

  def test_haircut
    assert_title_case "Your Hair[cut] Looks (Nice)", "Your Hair[cut] Looks (Nice)"
  end

  def test_people_probably
    assert_title_case "People Probably Won't Put http://foo.com/bar/ in Titles", "People Probably Won't Put http://foo.com/bar/ in Titles"
  end

  def test_scott_moritz
    assert_title_case "Scott Moritz and TheStreet.com’s Million iPhone La‑La Land", "Scott Moritz and TheStreet.com’s Million iPhone La‑La Land"
  end

  def test_blackberry
    assert_title_case "BlackBerry vs. iPhone", "BlackBerry vs. iPhone"
  end

  def test_notes
    assert_title_case "Notes and Observations Regarding Apple’s Announcements From ‘The Beat Goes On’ Special Event", "Notes and Observations Regarding Apple’s Announcements From ‘The Beat Goes On’ Special Event"
  end

  def test_read_markdown
    assert_title_case "Read markdown_rules.txt to Find Out How _Underscores Around Words_ Will Be Interpretted", "Read markdown_rules.txt to Find Out How _Underscores Around Words_ Will Be Interpretted"
  end
end

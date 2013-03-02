# Ruby Title Case [![Build Status](https://secure.travis-ci.org/mudge/title_case.png)](http://travis-ci.org/mudge/title_case)

This is a Ruby implementation of [John Gruber's Title Case][gruber] by Paul
Mucur.

  [gruber]: http://daringfireball.net/2008/05/title_case

## Usage

Simply pass any string to which you wish to apply title casing to the `Title`
initializer and then use the `to_title_case` method. A `Title` instance has
all the methods of the original string and so should be suitable for using
interchangably with it.

For example:

```ruby
require 'title'

greeting = Title.new("Hello there")
greeting.to_title_case
# => "Hello There"
```

## Didn't this library previously re-open the `String` class and use DCI?

Yes, but I have since learnt the [error of my
ways](http://evan.tiggerpalace.com/articles/2011/11/24/dci-that-respects-the-method-cache/).

## Known Issues

Unlike the original Perl implementation, this version does not correctly
capitalise characters such as é and is therefore limited in scope to strings
consisting only of [ASCII](http://en.wikipedia.org/wiki/Ascii) printable
characters. A workaround would be to stop relying on the Ruby regular
expression patterns of `[A-Z]`, `\w` and `\W` for detecting capital letters,
alphanumeric characters and non-alphanumeric characters respectively.

While it will deal with most common usage where you need a
reasonably-correctly-cased sentence to be made suitable for a title, it will
not correct mistakes such as lowercase acronyms or errant capital letters:

    "at&t"  => "At&t"
    "HellO" => "HellO"

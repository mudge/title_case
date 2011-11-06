Ruby Title Case
===============

This is a Ruby implementation of [John Gruber's Title Case][gruber] by Paul Mucur.

  [gruber]: http://daringfireball.net/2008/05/title_case

Usage
-----

Simply `extend` any string you wish to apply title casing to and then use the
`title_case` method. For example, inside a Ruby script or an `irb` session:

```ruby
require 'title_case'

greeting = "Hello there"
greeting.extend(TitleCase)
greeting.title_case
```

Alternatively, it can be used from the command-line:

```console
$ ruby title_case.rb "Hello there"
$ echo "An amazing headline" | ruby title_case.rb
```

If you wish to make the `title_case` method available to all strings then you
can re-open the `String` class like so:

```ruby
class String
  include TitleCase
end
```

Known Issues
------------

Unlike the original Perl implementation, this version does not correctly capitalise characters such as é and is therefore limited in scope to strings consisting only of [ASCII](http://en.wikipedia.org/wiki/Ascii) printable characters. A workaround would be to stop relying on the Ruby regular expression patterns of `[A-Z]`, `\w` and `\W` for detecting capital letters, alphanumeric characters and non-alphanumeric characters respectively.

While it will deal with most common usage where you need a reasonably-correctly-cased sentence to be made suitable for a title, it will not correct mistakes such as lowercase acronyms or errant capital letters:

    "at&t"  => "At&t"
    "HellO" => "HellO"

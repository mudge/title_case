Ruby Title Case
===============

This is a Ruby implementation of [John Gruber's Title Case][gruber] by Paul Mucur.

  [gruber]: http://daringfireball.net/2008/05/title_case
  
Usage
-----

Inside a Ruby script or an `irb` session:

    require 'title_case'
    "Hello there".title_case
    
From the command-line:

    ruby title_case.rb "Hello there"
    echo "An amazing headline" | ruby title_case.rb

Known Issues
------------

Unlike the original Perl implementation, this version does not correctly capitalise characters such as é and is therefore limited in scope to strings consisting only of [ASCII](http://en.wikipedia.org/wiki/Ascii) printable characters. A workaround would be to stop relying on the Ruby regular expression patterns of `[A-Z]`, `\w` and `\W` for detecting capital letters, alphanumeric characters and non-alphanumeric characters respectively.

While it will deal with most common usage where you need a reasonably-correctly-cased sentence to be made suitable for a title, it will not correct mistakes such as lowercase acronyms or errant capital letters:

    "at&t"  => "At&t"
    "HellO" => "HellO"
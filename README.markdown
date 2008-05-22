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

Caveats
-------

It will not properly handle non-ASCII printable characters such as é.

While it will deal with most common usage where you need a reasonably-correctly-cased sentence to be made suitable for a title, it will not correct mistakes such as lowercase acronyms or errant capital letters:

    "at&t"  => "At&t"
    "HellO" => "HellO"
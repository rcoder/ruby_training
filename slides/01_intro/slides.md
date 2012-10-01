!SLIDE title-slide

# Ruby 101 #

## Lennon Day-Reynolds ##
## @rcoder // lennon@twitter.com ##

!SLIDE bullets incremental

# Ruby is... #

* ...and object-oriented language
* inspired by many other languages
* (Smalltalk, Scheme, Perl)

!SLIDE bullets incremental

# Ruby has... #

* Lisp-y features
* Pragmatic scripting/POSIX support

!SLIDE bullets

# Public resources #

* http://www.ruby-lang.org/en/documentation/ruby-from-other-languages/
* http://tryruby.org
* http://guides.rubyonrails.org/getting_started.html

!SLIDE bullets

# Internal resources #

* http://go/rubystyle
* http://go/rubycafe
* http://go/gems

!SLIDE bullets incremental

# Why do we use Ruby? #

* Rails
* Glue code
* Speaks POSIX/UNIX natively
* Automation, CLI tools

!SLIDE

# Just enough Ruby syntax #
## Built-in types ##

!SLIDE

# Strings #

    @@@Ruby
    s = "This is a string"
    t = 'So is this'

    some_html = "<span>#{s}</span>"

!SLIDE

# Strings, cont. #

    haiku = <<END
    for a longer string
    you use multiline syntax
    refrigerator
    END

!SLIDE

# Numbers #

    @@@Ruby
    i = 3
    j = 4.5
    k = 1e7
    m = 30_000_000

!SLIDE

# Collections #
## Arrays ##

    @@@Ruby
    mixed_array = [1, 2, "text", true, nil]

!SLIDE

# Collections #
## Hashtables ##

    @@@Ruby
    params = {
      :count => 10,
      :page_num => 1
    }
    params[:count] = 20
    params.keys # => [:count, :page_num]

    h = Hash.new(0)
    h["some_key"] # => 0

!SLIDE

# Classes and Objects #

    @@@Ruby
    class Bar
      def initialize(s)
        @s = s
      end

      def baz(x)
        x * @s
      end

      def frob(x, y)
        baz(y) / (1-x)
      end
    end

!SLIDE

# Blocks #

    @@@Ruby
    a = [1, 2, 3, 4]

    evens = a.select {|i| i % 2 == 0 }
    odds = a.reject {|i| evens.member?(i) }

    sum_of_odds = (1..100).inject(0) do |a, i|
      if i % 2 == 0
        a + i
      else
        a
      end
    end

!SLIDE

# Files, Regexps #

    @@@Ruby
    commands = File.read(".bash_history")

    open("some_file.txt") do |fh|
      text = fh.chomp
      puts text if test =~ /^[hostname]:\s+/
    end

!SLIDE

# Miscellany #

    @@@Ruby
    puts "a string"

    require 'set'
    s = Set.new
    s << :some_value

    Object.new.to_s 
     => "#<Object:0x10db371e0>"

!SLIDE

# How to run code #

    [user@host ~] $ ruby myfile.rb

    [user@host ~] $ irb
    1.9.3 :001 > "hello"
     => "hello"
    1.9.3 :002 >

!SLIDE

# Puzzle #1 #

Write a method which takes a number as an argument, and returns an array of the even numbers less than the argument.

!SLIDE

# Hint #1 #

    @@@Ruby
    def evens_upto(n)
      # Hint: use (1..n)
    end

!SLIDE

# Solution #1 #

    @@@Ruby
    def evens_upto(n)
      (1..n).select {|i| i % 2 == 0 }
    end

!SLIDE

# Puzzle #2 #

Write a "greeter" class whose constructor takes a string. It should also have a "greet" method which takes another string, and returns both strings joined by ", ".

!SLIDE

# Hint #2 #


    @@@Ruby
    class Greeter
      def initialize(msg)
        # ...
      end

      def greet(whom)
        # ...
      end
    end

!SLIDE

# Solution #2 #

    @@@Ruby
    class Greeter
      attr_reader :msg

      def initialize(msg)
        @msg = msg
      end

      def greet(whom)
        "#{msg}, #{whom}"
      end
    end

!SLIDE

# Puzzle #3 #

Write a method which takes two hashes mapping keys to numbers, and returns the a new hash mapping keys shared by both dictionaries to the sums of the values.

!SLIDE

# Hint #3 #

    @@@Ruby
    def merged_hashes(fst, snd)
      # Hint: use fst.keys to get an array of keys
    end

!SLIDE

# Solution #3 #

    @@@Ruby
    def merged_hashes(fst, snd)
      shared_keys = fst.keys.select do |k|
        snd.has_key?(k)
      end

      new_hash = {}

      shared_keys.each do |k|
        new_hash[k] = fst[k] + snd[k]
      end

      new_hash
    end

!SLIDE

# Solution #3 (alt., per David Lee) #

    @@@Ruby
    def merged_hashes(fst, snd)
      fst.merge(snd) do |key, first, second|
        first + second
      end
    end

!SLIDE

# Puzzle #4 #

Write a script which receives a file name on the command line (via the ARGV array). Each line will contain a numeric ID, followed by a space, followed by some text. Your script should echo the numeric of ID of all lines that contain the word "tweet".

!SLIDE

# Puzzle #4, cont. #

## input.txt ##

    1 Just setting up my twttr
    2 Can I tweet now?
    3 #YOLO
    4 I don't know how to tweet
    5 Ruby FTW

# Puzzle #4, cont. #

## output ##

    [user@host ~] $ ruby filter_script.rb input.txt
    2
    4
    [user@host ~] $

!SLIDE

# Solution #4 #

    @@@Ruby
    filename = ARGV.shift
    lines = File.readlines(filename)
    lines.each do |line|
      if line.index("tweet")
        puts line.split(" ")[0]
      end
    end


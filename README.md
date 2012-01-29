# ~~~ Curby ~~~

Allows using partial applications.

## How it works

    require 'Curby'
    include Curby
    
    def plus_one n
      1.c( :+ ).call( n )
    end

    plus_one 1 # => 2

It basically adds a 'c' method (for curry), which takes the name of the
method to be curried, and parameters. It returns a partially applied
function, as a lamda.

    class MyClass
      include Curby
    
      def my_method a, b, c
        a + b + c
      end
    end

    m = MyClass.new

Let's fix the first parameter

    my_method_a = m.c(:my_method, 1)

It can be read as "curry the method 'my_method' on the m object with the
first parameter being 1.

    my_method_a_b = my_method_a.call(2)

We fixed the second parameter.

    my_method_a_b.call(3) # => 6

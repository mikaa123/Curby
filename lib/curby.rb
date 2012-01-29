require "curby/version"

module Curby

  # The c (curry) method returns a partially
  # applied lambda
  def c( method_name, *args )
    # Get the method object
    m = method(method_name)

    if m.arity == args.size
      # Returns the method if the number of
      # argument is equal to the arguments
      # provided

      return m

    else
      # Returns a lambda that takes i-j args,
      # where i is the total number of arguments for
      # m, and j is args.size

      ->(*remaining_args) do
        total_args = remaining_args + args

        if total_args.size < m.arity
          # Return a curried method with the new
          # parameters applied
          c( method_name, *total_args )

        elsif m.arity == total_args.size
          # Calls m if the number of
          # arguments satisfies m's arity

          m.call( *total_args )
        end
      end

    end

  end

end

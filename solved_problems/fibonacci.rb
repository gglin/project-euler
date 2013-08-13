class Fibonacci

  def self.fib1(n)
    if n <= 1
      1
    else
      fib1(n-1) + fib1(n-2)
    end
  end

  def self.fib2(n)
    @fib2    ||= []
    @fib2[n] ||= if n <= 2
                   1
                 else
                   self.fib2(n-1) + self.fib2(n-2)
                 end
  end

  # return the n-th term in the Fibonacci sequence
  def self.fib(n)
    @fib    ||= {}
    return @fib[n] if @fib.has_key?(n)
    @fib[n] ||= if n <= 2
                  1
                else
                  self.fib(n-1) + self.fib(n-2)
                end
  end

end
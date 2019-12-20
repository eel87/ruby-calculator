class CalculatorController
  def start
    system "clear"

    print "Welcome to Calculator!\n"
    print "Enter any +, -, * or / problem\n"
    print ">> "
    calculator(gets.strip)
  end
  
  def calculator(input)
    # split input string into integer values and operators, save to an inputArray
    inputArray = input.gsub(" ", "").split(/(\d+)/).reject(&:empty?)
    
    # until inputArray length is one, work through input from left to right.
    # inputArray[0..2] is computed first (a, operator, b) and stored in @result
    # inputArray[0..2] is replaced by @result, loop continues
    until inputArray.length == 1
      a = inputArray[0]
      b = inputArray[2]
      operator = inputArray[1]
      
      compute(a, b, operator)
      
      range = 0..2
      inputArray = inputArray.reject!.with_index { |v, i| range.include?(i) }
      
      inputArray = inputArray.insert(0, @result)
    end
    
    print "#{@result}\n"
    selection
  end
  
  def compute(a, b, operator)
    if a == nil || b == nil || operator ==  nil
      puts "Exiting..."
      exit(0)
    end
    operator = operator.to_s
    a = a.to_i.to_f
    b = b.to_i.to_f

		@result = 0
    case operator
      when "+" then @result += (a + b)
      when "-" then @result += (a - b)
      when "/" then @result += (a / b)
      when "*" then @result += (a * b) 
			else puts
			"invalid input"   
    end
    @result
  end
  
  def selection
    puts "What next?"
    puts "1 - More calculations"
		puts "2 - Exit"
    selection = gets.to_i
    case selection 
      when 2 || nil
        puts "Exiting..."
        exit(0)
      when 1
        system "clear"
        start
      else
        system "clear"
        start
    end
  end
end
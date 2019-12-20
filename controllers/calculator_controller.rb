class CalculatorController
  def go
    print ""
  end
    
  def add(*args)
    numbers = args.shift()
    result = 0
    
    numbers.each_char do |num|
      num = num.to_i
      result = result + num
    end
  print result  
  end
  
end
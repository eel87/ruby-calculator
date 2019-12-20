require_relative "controllers/calculator_controller.rb"

system "clear"

print "Welcome to Calculator!\n"

calc = CalculatorController.new

calc.add(gets.chomp)
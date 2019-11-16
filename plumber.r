# plumber.R

#* Echo back the input
#* @param msg The message to echo
#* @get /echo
function(msg=""){
  list(msg = paste0("The message is: '", msg, "'"))
}

#* Return the sum of two numbers
#* @param a The first number to add
#* @param b The second number to add
#* @get /sum
function(a, b){
  # Get the calculator module
  calculator <- modules::use('./calculator.r')

  # Return the sum
  calculator$sum(a, b)
}

#* Return the difference of two numbers
#* @param a The first number
#* @param b The second number
#* @get /difference
function(a, b){
  # Get the calculator module
  calculator <- modules::use('./calculator.r')

  # Return the sum
  calculator$difference(a, b)
}

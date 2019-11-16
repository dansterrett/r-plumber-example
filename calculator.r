# ------------------------------------------------------------------------------
# Usage example:
#   calculator <- modules::use('calculator.r')
#   calculator$sum(3, 5)   # Returns 8
# ------------------------------------------------------------------------------

sum <- function(num1, num2) {
  as.numeric(num1) + as.numeric(num2)
}

difference <- function(num1, num2) {
  as.numeric(num1) - as.numeric(num2)
}

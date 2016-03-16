

# Function to calculate the fibonacci number
fibonacci <- function(n) {
  if(n == 0) return (1)

  fibonacci_rec(1, 1, n)
}


fibonacci_rec <- function(prev=1, acc=1, n=1) {
  if(n == 1) return (acc)
  else {
    fibonacci_rec(acc, acc+prev, n-1)
  }
}



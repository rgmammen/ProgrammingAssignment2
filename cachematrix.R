## First function creates an invertible matrix using sample fn
## Second matrix checks if recd matrix has changed and returns previous solution
## Second matrix calculates solution if recd matrix is new

## First function generates new matrix each time it is run

makeCacheMatrix <- function(x = matrix()) {
  #Create 2 rows for an invertible matrix 
  first_row <- sample(1:10, 2, replace = FALSE)
  second_row <- numeric(2)
  second_row[1] <- first_row[2]
  second_row[2] <- first_row[1]
  #Create the matrix
  my_matrix <- matrix( c(first_row, second_row), nrow = 2, ncol = 2, byrow = TRUE, dimnames = NULL)
  #Return the created matrix
  return(my_matrix)
}


## Second function checks if matrix has changed

cacheSolve <- function(x, ...) {
        
  #Check if matrix has changed 
  if (!is.null(old_matrix)) old_matrix <- matrix(0, nrow = 2, ncol = 2)
  check_matrix <- the_matrix == old_matrix
  true_matrix <- matrix(c(TRUE,TRUE,TRUE, TRUE), nrow = 2, ncol = 2)
  if (sum(check_matrix == true_matrix) >3) return(cached_inverse)
  
  #If matrix has changed
  if (sum(check_matrix == true_matrix) <4) {
    matrix_inverse <- solve(the_matrix)
    return(matrix_inverse)
    cached_inverse <<- matrix_inverse
    old_matrix <<- the_matrix
  }
}
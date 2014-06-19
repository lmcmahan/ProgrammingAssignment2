## Below are two functions, makeCacheMatrix and cacheSolve,
## that are used to create a special object to store a 
## matrix and caches its inverse.

## This makeCacheMatrix function takes the user input matrix x
## and creates a special object to store the matrix.  It also
## defines 4 functions: (1) set function to set the value of 
## matrix, (2) get function to get the value of the matrix,
## (3) setinversematrix to set the value of the inverse matrix,
## and (4) getinversematrix to get the value of the inverse matrix.
## It then returns the created special object which is a list
## containing those four functions associated with the object.

makeCacheMatrix <- function(x = matrix()) {
  inversematrix <- NULL
  set <- function(y){
    x <<- y  # Operator <<- used to assign a value to an object 
    inverse.matrix <- NULL
  }
  get <- function() x
  setinversematrix <- function(solve) inversematrix <<- solve
  getinversematrix <- function() inversematrix
  list(set = set, get = get, setinversematrix = setinversematrix, getinversematrix = getinversematrix)
}


## This cacheSolve function takes the special matrix object created by 
## the makeCacheMatrix function above, gets its inverse matrix via 
## getinversematrix function, and checks if the inverse matrix exists. 
## If so, it returns the inverse matrix of 'x' from the cache. If not, 
## it gets the value of matrix 'x' via get function, computes the inverse 
## matrix of 'x', cache the value of the inverse matrix via setinversematrix 
## function, and return the computed inverse matrix of 'x'. 

cacheSolve <- function(x, ...) {
  inversematrix <- x$getinversematrix()
  if(!is.null(inversematrix)){
    message("getting cached data")
    return(inversematrix)
  }
  data <- x$get()
  inversematrix <- solve(data)
  x$setinversematrix(inversematrix)
  inversematrix
}

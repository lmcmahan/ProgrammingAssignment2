## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  inversematrix <- NULL
  set <- function(y){
    x <<- y
    inverse.matrix <- NULL
  }
  get <- function() x
  setinversematrix <- function(solve) inversematrix <<- solve
  getinversematrix <- function() inversematrix
  list(set = set, get = get, setinversematrix = setinversematrix, getinversematrix = getinversematrix)
}


## This function return a matrix that is the inverse of 'x'

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

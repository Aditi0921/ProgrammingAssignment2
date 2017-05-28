## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

######## this function stores a matrix and caches its inverse

setwd("D:/Coursera/ProgrammingAssignment2-master")
makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        inv <- NULL
    }
    get <- function() x
    setinverse <- function(inverse) inv <<- inverse
    getinverse <- function() inv
    list(set = set, get = get,
         setinverse = setinverse,
        getinverse = getinverse)
}


## Write a short comment describing this function

####This function computes the inverse of the special "matrix" created by "makeCacheMatrix" above
#if the inverse is already created, then this function should be able to retrive the inverse from the cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    inv <- x$getinverse()
    if(!is.null(inv)){
        message("getting cached data")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data, ...) # 'Solve' function creates the inverse of a square matrix
    x$setinverse(inv)
    inv
}

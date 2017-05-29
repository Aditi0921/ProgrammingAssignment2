## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

######## this function stores a matrix and caches its inverse

setwd("D:/Coursera/ProgrammingAssignment2-master")
makeCacheMatrix <- function(x = matrix()) { # defines the function 'matrix'
    inv <- NULL                             # initialises inv
    set <- function(y) {                    # defines function y in set
        x <<- y                             # assigns the input argument to x in the parent environment
        inv <- NULL                         # assigns the inv variable to Null
    }
    get <- function() x                     # get function retrieves the argument x from the parent environment
    setinverse <- function(inverse) inv <<- inverse # setinverse function assigns the inverse variable for the parent environment
    getinverse <- function() inv            # getinverse function retrieves  the inverse var
    list(set = set, get = get,              #finally a list of object type is returned
         setinverse = setinverse,
        getinverse = getinverse)
}


## Write a short comment describing this function

####This function computes the inverse of the special "matrix" created by "makeCacheMatrix" above
#if the inverse is already created, then this function should be able to retrive the inverse from the cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    inv <- x$getinverse()              #retrieves the inverse of the matrix x
    if(!is.null(inv)){                 # checks whether inv is null
        message("getting cached data") # if not null , returns the inverse from the cache
        return(inv)
    }
    data <- x$get()                    #if null, then calculates the inverse of the function
    inv <- solve(data, ...)            # 'Solve' function creates the inverse of a square matrix
    x$setinverse(inv)
    inv                                #returns the inverse of the object in the parent environment     
}

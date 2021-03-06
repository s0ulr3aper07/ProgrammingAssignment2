## The pair of functions help in speeding up the process of 
## evaluating the inverse of a matrix. 

## The makeCacheMatrix function will take a matrix as an argument and give a named
## list of four functions as output. The reason why makeCacheMatrix works well
## is that it uses lexical scoping to assign the values of free variables x 
## and inverse in the getmatrix and the getinverse function respectively.

makeCacheMatrix <- function(x = matrix()) {
    inverse <- NULL
    setmatrix <- function(y){
        x <<- y
        inverse <<- NULL
    }    
    getmatrix <- function() x
    setinverse <- function(i) inverse <<- i
    getinverse <- function() inverse 
    list(setmatrix = setmatrix, getmatrix = getmatrix, setinverse = setinverse, 
         getinverse = getinverse)
} 
        
        




## CacheSolve checks to see if inverse has already been calculated for an object
## by calling the getinverse function present in the special list generated by
## the makeCacheMatrix function. In such a case it will retrieve that value, 
## otherwise it will evaluate the inverse and then store that output in 
## makeCacheMatrix.

cacheSolve <- function(x, ...) {
    m <- x$getinverse()
    if (!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$getmatrix()
    m <- solve(data)
    x$setinverse(m)
    m
}

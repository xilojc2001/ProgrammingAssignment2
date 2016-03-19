
## Functions that cache the inverse of a matrix
##
## How to Use:
##
## > source('cachematrix.R')
## > m <- makeCacheMatrix(matrix(c(2, 0, 0, 2), c(2, 2)))
## > cacheSolve(m)
## [,1] [,2]
## [1,]  0.5  0.0
## [2,]  0.0  0.5

## makeCacheMatrix is a function that returns a list of functions that we will use
## Its puspose is to store a matrix and a cached value of the inverse of it.
## It'll return:
##   - set the value of the matrix
##   - get the value of the matrix
##   - set the value of the inverse matrix
##   - get the value of the inverse matrix

makeCacheMatrix <- function(objMatrix = matrix()) {
        result <- NULL
        set <- function(newMatrix) {
                objMatrix <<- newMatrix
                result <<- NULL
        }
        get <- function() objMatrix
        setinverse <- function(inv) result <<- inv
        getinverse <- function() result
        list(
                set = set,
                get = get,
                setinverse = setinverse,
                getinverse = getinverse
        )
}

## The following function calculates the inverse of a "special" matrix created with makeCacheMatrix
cacheSolve <- function(objMatrix, ...) {
        result <- objMatrix$getinverse()
        if(!is.null(result)) {
                message("Getting cached data!")
                return(result)
        }
        newMatrix <- objMatrix$get()
        result <- solve(newMatrix, ...)
        objMatrix$setinverse(result)
        result
}

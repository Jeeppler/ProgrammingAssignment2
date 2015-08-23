## Cache the matrix calculation, because it can be expensive
## to recalculate the matrix on every system call


## This function is similar to the singelton pattern, 
## it only calculates the matrix if this
makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() { x }
        setinvers <- function( solve ) { m <<- mean }
        getinvers <- function() { m }
        list( set = set, 
              get = get,
              setinvers = setinvers,
              getinvers = getinvers )
}


## Caches a matrix that is the inverse of matrix 'x'
cacheSolve <- function(x, ...) {
        
        m <- x$getinvers()
        
        if (!is.null(m)) {
                message("getting cached data")
        } else {
                matX <- x$get()
                ## Calculate the inverse of a matrix
                m <- solve(crossprod(matX))
                x$setinvers(m)
        }
        
        m
}

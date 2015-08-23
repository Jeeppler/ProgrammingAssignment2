loadscript <- function() {
        source("cachematrix.R")
        makeCacheMatrix()
}

test <- function() {
        loadscript()
        
        ## matrix example from: http://www.mathwords.com/i/inverse_of_a_matrix.htm
        m1 <- matrix( c(4, 3, 3, 2), nrow = 2, ncol = 2, byrow = TRUE )
        m1inv <- solve(m1)
        
        m1test <- makeCacheMatrix(m1)
        
        print( m1inv )
        print( "does the matrix above equals the matrix below?" )
        print( cacheSolve(m1test) )
        
        print( "if they are equal, the function works!" )
        print( "-------------------------" )
        print( "does the cache works?" )
        print( cacheSolve(m1test) )
}

## "cachematrix.R" includs two functions "makeCacheMatrix" and "cacheSolve" 
##  which create a list of function to 
##  1. store(cache) the input matrix 
##  2. show  the stored matrix
##  3  calculate the inverse matrix
##  4. show th cached inverse matrix  


## makeCacheMatrix()
## Description ##
##   makeCacheMatrix creates(return) a special vector,
##   which is actually a list of 4 functions:
##   1. setM : to set the value of the input matrix   
##   2. getM : to get(show) the value of the matrix
##   3. setInverseM: to set the value of the inverse matrix
##   4. getInverseM: to get the value of the inverse matrix   
## Usage ##
## 	 makeCacheMatrix(x)
## Arguement ##
##   x    an input squared matrix


makeCacheMatrix <- function(x = matrix()) {

	    inverseM <- NULL
        setM <- function(y) {
                x <<- y
                inverseM <<- NULL
        }
        getM <- function() x
        setInverseM <- function(iM) inverseM <<- iM
        getInverseM <- function() inverseM
        
        list(setM         = setM, 
        	 getM         = getM,
             setInverseM  = setInverseM,
             getInverseM  = getInverseM)


}


## cacheSolve()
## Description ##
## cacheSolve is a function
##   1. to calculates the inverse of the matrix stored in the list by makeCacheMatrix,
##      if the inverse doesn't exists,
##   2. to show the cached inverse matrix if it has been stroed in the cache
## Usage ##
## cacheSolve(x)
## Arguement ##
##   x   is a list of functions created (returned) by the function makeCacheMatrix


cacheSolve <- function(x) {
        ## Return a matrix that is the inverse of 'x'
        inverseM <- x$getInverseM()
        if(!is.null(inverseM)) {
                message("getting cached inverse matrix")
                return(inverseM)
        }
        data <- x$getM()
        inverseM <- solve(data)
        x$setInverseM(inverseM)
        inverseM

}


## round(z %*% mm,digits=9)
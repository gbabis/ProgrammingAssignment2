## Creates a special matrix object that can cache its inverse

makeCacheMatrix <- function(m = matrix()) {
        
        ##Initialize the inverse property
        
        i<- NULL
        
        ## Method to set the matrix
        set<- function(matrix){
                m<<- matrix
                i<<- NULL                
        }
        
        ## Method to get the matrix
        get<- function() m 
        
        ## Method to set the inverse of the matrix
        setInv<- function(inverse) i<<- inverse
        
        ## Method to get the inverse of the matrix
        getInv<- function() i
        
        ## Return a list of the methods
        list(set = set, get = get,
             setInv = setInv,
             getInv = getInv)

}


## Compute the inverse of the special matrix returned by "makeCacheMatrix"
## above. If the inverse has already been calculated (and the matrix has not
## changed), then the below function should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        
        ## Return a matrix that is the inverse of 'x'
        
        m<- x$getInv()
        if(!is.null(m)){
                message("getting cached data")
                return(m)
        }
        
        ## Get the matrix from the object
        data<- x$get()
        
        ## Calculate the inverse using matrix multiplication
        m<- solve(data, ...) %*% data
        
        ## Set the inverse to the object
        x$setInv(m)
        
        ## Return the matrix object
        m
}

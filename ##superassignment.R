## assignment(<-) vs superassignment(<<-)         
## Example to distinguish <- and <<-







crazy <- function() {     # create a new environment with a local variable 'x' and access to another variable 'x'
                                                # declared somewhere outside this function
  x <- 3.14                                # assign the numeric value 3.14 to local variable 'x'
  print(x)                                   # output the current value of local variable 'x' (1)

   { print(x);                                 # output the current value of local variable 'x' (2)
      x <<- 42;                              # assign the numeric value 42 to variable 'x' declared outside this function (3)
      print(x)                                 # output the current value of local variable 'x' (4)
   }
                          
  print(x)                                   # output the current value of local variable 'x' (5)
}



x <- 0                                    # Declare and define a local variable named 'x'
                                         



> x                                           # output the current value of local variable 'x'
0

> crazy()                                  # Call function crazy()
3.14                                         # (1) inner variable 'x'
3.14                                         # (2) inner variable 'x'
3.14                                         # (4) inner variable 'x'
3.14                                         # (5) inner variable 'x'

> x                                           # (3) containing environment variable 'x'
42
THIS WAS A COLLEGE PROJECT.

## Program

The program structure was given, I just had to change the content of the src folder IIRC, and I decided to write the test generator program.

The idea was to extend the given classes with a "Binary search tree priority queue" and with a "Bucket queue", but that is all I know. I was then supposed to compare their efficiency. I remember the BST was only more asymptotically efficient for a very specific data sample, so there is that. It was an ok experience nonetheless, my very first class writing, but the project was just huge and I got stuck because the given structures defined the first item of a sequence as item 1. I learned to interpret exception logs the bad way.

The test generator was fun to write though, my very first experience both with random data generation and file writing, although it looks like I deleted the random functions, probably to prove a point about the time efficiency of both structures.

## Usage

The program just prints a log of the time taken to complete the tasks specified in the input.txt file passed as an argument. I don't remember the content the output.txt file is supposed to have, but I'd assume a copy of the errors found during runtime. The tasks can be run through the BST or the BQ classes, so this mode has to be specified in the arguments too.  
The batch file is also runnable, although it has to be edited with the correct paths.
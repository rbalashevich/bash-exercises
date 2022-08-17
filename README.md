# bash-exercises

Here we're trying to implement a script in pure Bash code that:
- [√] Gets 2 positional arguments: name, count and any number of additional arguments
- [√] Checks that all additional arguments are non-numeric strings (fails if not)
- [√] Creates a directory $HOME/mylogs
- [√] Creates a file called [name].log in the directory

For <count> times [x] iterates over the list of additional arguments.
And [√] writes a line with a the argument string and a random word (you can use echo $(($RANDOM%7)) for bash) out of the following list : 
["normal" "request" "failure" "error" "warning" "alert" "notice" "note"].

Parameters:
./exercise1.sh [Apple] [2] [Fruit]
  
  

# Cheatsheet

## Difference between terminal and command line

#### Bash

    • Text in, text out

#### Terminal:
    • Handles key presses
    • Draws text
    • Colors
    • Scrolling
    • Copy/paste


## TIPS


+ Tip: Add all your script files inside `/bin/` and add `/bin/` to your PATH env variable.

  All the scripts added inside that folder would be accepted as simple commands to be executed (you can run `notes.sh` instead of `./file_location/notes.sh`)

+ Tip: All scripts must start with `#! /bin/zsh`. Notice that bash might be in another location.

+ Tip: As a good practice, variables with dollar sign should be surounded by double quotes.



## VARIABLES

#### $1
  * Gets the first argument passed. Example: echo $1 >> notes.txt, when running script with ` example.sh hola mundo `, $1 will contain only `hola `
***
#### $*
  * Gets all the arguments passed. Example: echo $* >> notes.txt, when running script with ` example.sh hola mundo `, $* will contain  `hola mundo `
***
#### variable="somefile.txt"
  * Assign the value to the variable (Obs: No spaces between)
***
#### $variable
  * Returns the value stored in `variable`. Example: `touch $filename` creates a filename with the name `somefile.txt`
***
#### "$var1 $var2"
  * Allow to return two variables value in a single string
***
#### declare -i num
  * Set a variable as an integer
***
#### declare +i num
  * Unset an attribute with +
***
#### declare -r num
  * Sets a variable read-only
***
#### ((x = x / 2))
  * Double parenthesis allows to evaluate arithmetic expressions
***



## ARRAYS

#### arr=(1 2 3 4)
  * Initialize an array [1, 2, 3, 4]
***
#### arr[0]={value}
  * Stores a value in array
***
#### ${arr[0]}
  * Returns a value from array
***
#### ${arr[@]}
  * retrieve all values from array
***
#### ${#arr[@]}
  * Count the number of elements in arr
***
#### ${!arr[@]}
  * List all indices it holds
***
####



## SCRIPT PARAMETERS

#### $1, $2, etc
  * Holds n-th command line argument for a script
***

#### $@
  * Returns all the arguments given for a script
***

## SHELL FUNCTIONS

#### name () {...}
  * Define a function
***



## CONTROL LOOP

### WHILE

```bash
while test; do
  ;; code here
done
```

### FOR STATEMENT

```bash
for VAR in WORDS; do
    ;; code here
done
```

### CASE STATEMENT
```bash
case $1 in
  cat)
    echo "miau"
  rooster)
    echo "quiquiriqui"
  *)
    echo "unknown animal"
esac
```

## CONDITIONAL STATEMENTS

### IF STATEMENT

#### Inline
```bash
if testcode; then success; else fail; fi
```

#### Multiple lines
```bash
if testcode; then
  # Do somethting
else
  # Do something else
fi
```

## AND, OR, NOT

#### [[! -e $file]]
  * Use ! to negate a test (file $filename exists)
***

#### [[! -d $file]]
  * Use ! to negate a test (dir $dirname exists)
***

#### [[$eq 1 && $1 ="foo"]]
  * Use && for AND
***

#### [[$a || $b]]
  * Use || for OR
***

#### [[$filename == *.txt]]
  * Pattern matching is allowed
***

## DEBUGGING

#### #!bin/bash -x
  * Using the `-x` option, prints every single value that executes
***

#### set -x
  * Debug mode on
***

#### set +x
  * Debug mode off
***


## INPUT and OUTPUT

#### echo "Hello world" >> file.txt
  * Append (or create) the echo string to file.txt
***
#### printf "Hello %s" $USER
  * More sophisticated output method, using format string
***
#### read -p "Fav colors:" col1 col2
  * Reads inputs from the command line and assign them to the variables `$col1` `$col2`

    `-n` or `-N` specifies the amount of characters to read

    `-s` will suppress output (useful for passwords)

    `-r` disallows escape sequences, line continuation

    `-p` prints the string prompt, without a newline, before beginning to read.

    Uses IFS for delimiters (can be set to anything. Newline by default)
***


## REDIRECTIONS

#### grep milk < notes.txt
  * Take its input from some file (in this case, notes.txt)
***
#### ls > listing.txt
* Redirect the output to some file (Will override existing files!)
***

#### ls >> listing.txt
  * Appends (instead of override) the output to the end of some file
***

#### ls | grep .*\.rb
  * Pipe (|) command take the output of the first command and add it as an input of the second one.

  _A more complex example could be:_
  ```bash
  grep foo file.txt | sort >> new_file.txt
  ```
***

## PARAMETER EXPANSION

#### ${var#pattern}
  * Remove the shortest path from begin of a string

*Example:*
```bash
  i="/Users/gak/file.txt"

  ${i#*/}  # returns "Users/gak/file.txt"
```
***

#### ${var##pattern}
  * Remove the longest path from begin of a string.

  *Example:*
```bash
  i="/Users/gak/file.txt"

  ${i##*/}  # returns "file.txt"
```
***

#### ${var%pattern}

  * Remove the shortest path from end of a string

*Example:*
```bash
  i="/Users/gak/file.txt"

  ${i%.*/}  # returns "Users/gak/file"
```
***

#### ${var%%pattern}
  * Remove the longest path from end of a string

  *Example:*
```bash
  i="/Users/gak/file.txt"

  ${i%%*/}  # returns empty
```
***

## BACKGROUND AND NOHUP

#### myscript &
  * By adding & at the end, it runs the process in background (but still send input to the console.)

    Just backgrounding the script (./myscript &) will not daemonize it.

    You must disconnect it from the terminal so that SIGHUP does not kill it.
***

#### nohup myscript &
  * Keep myscript running when you exit the terminal session (useful for keeping scripts running when exiting remote sessions)

    Daemonize a script (runs as a background process, dissociated from any controlling terminal (tty).)
***

#### nice myscript
  * Run myscript with a lower priority (for example, to optimize resources)
***

#### ctrl + Z
  * Suspend a process running (for example, send the server running to background)
***

#### bg
  * Send a process to the background
***

#### fg
  * Brings the process to the foreground again
***


## AT and CRON

#### at now +8 hours -f ~/myscript.sh
  * Schedule a script to run at a certain time (can be combined like echo "tweet fore" | at teatime )
***

## MISCELLANEOUS


#### cat
  * Concatenate different files.

*Example:*
```bash
cat file1 file2 > file3
```

  You can use `cat file1` just to see the content of it.
***


#### touch {file1, file2, file3}.rb
  * Creates the three files at a time
***

#### head file
  * See the first lines of file
***

#### tail file
  * See the last line of file
***
#### chmod u=rwx,g=rx,o=r myfile
  * Defines who can access that file, and how they can access it. User can Read, Write and Xecute.

    Group can Read and Xecute and Others can only read myfile.

    __Note__: _You need to add Xecutable permissions to actually run a .sh file._
***

#### less file1.txt
  * Show the content as pages to go up and down
***

#### grep 'word' file.txt
  * Search a word in a file
***

#### sort file.txt
  * Sort the information passed as a parameter

*Example:*
```bash
ls | sort
```
***

#### !v
  * Will run the last command starting with the letter `v`
***

#### !$
  * Represents the last argument
***

#### $()
  * Command substitution replaces a command with his output.

*Example:*
```bash
echo "hello world" >> "notes$(date).txt"
```
***

#### ps -e | grep tcp
  * Shows a list of running processes
***

#### lsof -i tcp:3000
  * `lsof` is very similar to the `ps` command, but instead of finding out what processes are running, it focuses on what is using what port.
***

#### top
  * Shows a list of all the top running processes that consumes more CPU in the machine
***

#### tty
  * Shows which terminal connection I'm connected at
***

#### w
  * Show a list of the connections connected
***

#### cat /etc/shells
  * List all shells in our system
***

#### env
  * Shows all the defined enviroment variables. The most important one is $PATH

    It tells the command line where to look for the commands given. First look at this path, if not found, look at here, etc.


  * For example, let's say you write an script foo.sh . You can run it like `./foo`

    But if you add it to PATH like ` PATH="PATH:$HOME" `. Now you can simply run foo without specifiying anything and foo will be looked at $HOME dir.

    Variables needs to be exported so they can be reached from other CLI. To do that just export it when set it. Ex: ` export PATH="PATH:$HOME" `

    Always append new directories to the PATH variable at the end to avoid overwrite actions defined by the OS.


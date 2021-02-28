#!/bin/bash


## see
##	https://unix.stackexchange.com/questions/470440/is-the-callback-concept-of-programming-existent-in-bash

scripttmp=$(mktemp -d)           # Create a temporary directory (these will usually be created under /tmp or /var/tmp/)
									#   /tmp/XXXXXXX
cleanup() {                      # Declare a cleanup function
    rm -rf "${scripttmp}"        # ... which deletes the temporary directory we just created
}

trap cleanup EXIT 				#  trap [options] [[ARGUMENT] SIGNAL]
								#  on EXIT signal, do this ....

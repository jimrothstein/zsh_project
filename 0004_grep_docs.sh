#!/bin/bash

str="hello"
r="h"
echo $str | grep -E "$r" -

#2

str="Surely this regular expression should match this."; r="this."
echo $str | grep -E "$r" -

```


There is no theory of evolution. Only a list of animals Chuck Norris allows to live.

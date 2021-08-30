---
title: "`r knitr::current_input()`"
date: "`r paste('last updated', 
    format(lubridate::now(), ' %d %B %Y'))`"
output:   
  html_document:  
        code_folding: show
        toc: true 
        toc_depth: 2
        toc_float: true
        mathjax: default
  pdf_document:   
    latex_engine: xelatex  
    toc: true
    toc_depth:  2   
    fontsize: 10pt   
    geometry: margin=0.5in,top=0.25in   
    TAGS:  
---

<!-- 
!pandoc % -f markdown -o %.pdf

-->

[~/code/MASTER_INDEX.md]
[~/code/zsh_scripts_project]


## setup tmux; scripts test if running.
[~/code/zsh_scripts_project/016_tmux_experiments.sh]

[~/code/zsh_scripts_project/021_bash_experiments.sh"]

## positional params | many ${X}  where X is short cut to path, pid, IFS and
many others 
~/code/zsh_scripts_project/014_positional_params.sh


## try-catch (zsh)
033_try_catch.sh

as of \today


### README.md

### Collect simple zsh commands here:

```
ls -1
```

### SORT
#### list files, 1 per line |  reverse dictionary order | based on column 7 of field 1 |
```

ls -1 | sort -r -k 1.7d
```

#### Use arg 1, from script
```
ls -1 | sort -r -k 1.${1}d
```

####  field 1, columns 4,5 in numeric order | then columns 14,15 numeric
```
ls -1 * | sort -k 1.4,1.5n -k 1.14,1.15n
```

-k  = key
-d  = dictionary order
-n  = numeric order
-r  = reverse order


#### Examples: tar, backup, theDate=$(date -I), -X exclude 
SEE /home/jim/code/make_project/make_backup/0999_backup_legal.mk




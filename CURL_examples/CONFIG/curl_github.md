
```
#   file <- "02_curl_config_github.txt"
#============================================================================
## PURPOSE: Authenicate with Github using --config form of curl
## USAGE:  curl -u jimrothstein$token --config <file> 
## else where I know curl will authenticate me for github.
##  curl -s -u jimrothstein:$token https://api.github.com/repos/jimrothstein/try_things_here/collaborators 
#============================================================================
```


```
# To obtain token

# token=$(Rscript -e "cat(Sys.getenv('GITHUB_PAT'))") 
# echo $token

```

-s

```
## if put -u on cmd line, works.
## if I keep -u here, fails.
## none below work

#--anyauth
#   --basic
#-u "jimrothstein:$token"
# -H "Authorization: token $token"

#   this enpoint for collaborators, private by Github, and must be
authenticaled

```

url=https://api.github.com/repos/jimrothstein/try_things_here/collaborators 

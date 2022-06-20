# =======================================================
####    SHELL environment variables base on ~/.Renviron
# =======================================================
#
###		PURPOSE:	Given an authorization code from Dropbox, what can we do with
CURL?

NOTES:	In Dropbox app, once scope set can not modify.  Create new app, which
means new authorization code for this app?
# In shell:
#       key=$(Rscript -e "cat(Sys.getenv('nyt_key'))") 
#       echo $key
# =======================================================


###	Configure for Dropbox
```
auth_url="https://www.dropbox.com/oauth2/authorize"
token_url="https://api.dropboxapi.com/oauth2/token"
request_url="https://api.dropboxapi.com/2/file_requests/list"
client_id = Sys.getenv("dropbox_client_id")
client_secret = Sys.getenv("dropbox_client_secret")
response_type="code"
scope = "account_info.read files.metadata.read"
```


code_verifier=foobar 
code_challenge=echo -n foobar | sha256sum
code_challenge_method=S256

redirect_uri=	"http://localhost:8080/callback"
```

#auth_params=list(scope=scope, response_type=response_type) 

#token_params = list( scope=scope, grant_type="authorization_code"),
}

#
curl -s -i https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=yourkey

## endpoint https:://api.nytimes.com/svc/books/v3/
## append , one of 

##  lists.json
##  reviews.json
##  lists/{}.json several possibilities

##  
    params
#   curl -s https://api.nytimes.com/svc/books/v3/lists.json
# paams  list=hardcover-fiction

# =======
# WORKS
curl -s -i  -d 'list=hardcover-fiction' -d "api-key=$key" -G https://api.nytimes.com/svc/books/v3/lists.json

# WORKS
curl -s -i -o nyt -d 'list=hardcover-fiction' -d "api-key=$key" -G https://api.nytimes.com/svc/books/v3/lists.json

cat nyt | less
# =======

Works note double quotes because query paramaters
curl -s -i "https://api.nytimes.com/svc/books/v3/lists.json?api-key=$key&list=hardcover-fiction"

# =======








# ==================
# WORKS in Browser
https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=XK..snip
# ==================

vim:nospell

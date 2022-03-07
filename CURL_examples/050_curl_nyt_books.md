# =======================================================
####    SHELL environment variables base on ~/.Renviron
# =======================================================
#
Examples on this page need only nyt_key
#   nyt_app_id
#   nyt_secret
#   nyt_key
# In shell:
#       key=$(Rscript -e "cat(Sys.getenv('nyt_key'))") 
#       echo $key
# =======================================================

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


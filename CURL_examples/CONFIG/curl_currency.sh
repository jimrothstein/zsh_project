# =======================================================
####    SHELL environment variables base on ~/.Renviron
# =======================================================
# file <- "curl_currency.sh"



# In shell:
app_id=$(Rscript -e "cat(Sys.getenv('app_id'))") 
       echo $app_id
echo $app_id



# ===================================
#       FAILS
# ===================================
# 405 Method Not Allowed, none work
echo \
curl -s -i -I --header "Accept: application/json"  \
--trace-ascii request.txt \
-G \
#--data-urlencode "app_id=$app_id&symbols=RUB&prettyprint=true" \
#--data-urlencode 'app_id=ABC123' \
#--data-urlencode "&symbols=RUB&prettyprint=true" \
# -d "app_id=$app_id" \
# -d '{"app_id":"$app_id"}' \
# -d {"app_id" : $app_id } \  # parse error
#   --data-urlencode "app_id=$app_id" \
https://openexchangerates.org/api/latest-json

cat "request.txt"



# ================================================
#    SOLUTION
# ================================================
echo "app_id=$app_id" https://openexchangerates.org/api/latest-json
# BROWSER:
# - use no quotes 
# https://openexchangerates.org/api/latest.json?app_id=123ABC&symbols=RUB&prettyprint=true

# AND below works in https://reqbin.com/req/curl/c-2cd3jxee/curl-post-with-basic-authentication-example


# ZSH:
# BUT zsh gives parse error near '&' (when using actual app_id)
# curl https://openexchangerates.org/api/latest.json?app_id=123ABC&symbols=RUB&prettyprint=true



###   & is special character in zsh, bash etc ..
###   MUST BE in Quotes (single in this case)

# CURL WORKS
curl 'https://openexchangerates.org/api/latest.json?app_id='$app_id'&symbols=RUB&prettyprint=true'





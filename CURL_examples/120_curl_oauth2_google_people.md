```
file <- "/home/jim/code/zsh_scripts_project/CURL_examples/120_oauth2_curl_google_people.md"

# PURPOSE: Access Protected Resource in Google People API 
#
# GIT:  ignores this file.
## REF:  https://www.daimto.com/how-to-get-a-google-access-token-with-curl/
### ====================================================

####	For google people api, NEED:
```
auth.code

api_key (not used)

PEOPLE_CLIENT_ID
PEOPLE_CLIENT_SECRET
```

#### Step 0, get keys from ~/.Renviron 
```
 In shell:
PEOPLE_CLIENT_ID=$(Rscript -e "cat(Sys.getenv('PEOPLE_CLIENT_ID'))")
echo $PEOPLE_CLIENT_ID

PEOPLE_CLIENT_SECRET=$(Rscript -e "cat(Sys.getenv('PEOPLE_CLIENT_SECRET'))")
echo $PEOPLE_CLIENT_SECRET

## OAUTH2 is for YOUTUBE app, FIX!
client_id=$(Rscript -e "cat(Sys.getenv('OAUTH2_ID'))")
echo $client_id
```

Step 1: get Auth.code (via browser) (AS of 2APR returns auth token)
NOTE:  DEPRECATED FEB 2022
for Google People, this is request (in browser)
```
echo \
'https://accounts.google.com/o/oauth2/v2/auth?'\
'client_id='$client_id'&redirect_uri=urn:ietf:wg:oauth:2.0:oob'\
'&scope=https://www.googleapis.com/auth/userinfo.profile&response_type=code'
```


# redirect_url updated (march 2022)
# As of 1APR 2022, paste resulting string (from terminal) into browser, I
think it worked!   Even though no server running!  Browser returned error, but
in the url field was 127.0.0.1?code=AUTH.CODE 

echo "https://accounts.google.com/o/oauth2/v2/auth?\
client_id=$PEOPLE_CLIENT_ID&\
redirect_uri=https://127.0.0.1:8080&\
scope=https://www.googleapis.com/auth/userinfo.profile&\
response_type=code"

# For youtube
echo "https://accounts.google.com/o/oauth2/v2/auth?\
client_id=$client_id\
redirect_uri=https://127.0.0.1:8080&\
scope=https://www.googleapis.com/auth/userinfo.profile&\
response_type=code"
```

#### Browser returns:  (short term, so not worried about pasting here)
```
https://127.0.0.1/?code=4%2F0AX4XfWj5eFpno5VaQBorMnQOzVF1_HsN2rJCykiJ2wuIz7WnQgcI4moySshTSkGrIGtM0g&scope=profile+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.profile
# as of march 2022
code=4%2F0AX4XfWj5eFpno5VaQBorMnQOzVF1_HsN2rJCykiJ2wuIz7WnQgcI4moySshTSkGrIGtM0g

# old
code=4/1AX4XfWjIf-IV6VEQnqfKNeDhJwfO5Cg00NHhvChQM0JFi472QCjr1v-wN6E
echo $code  
```


# =====================================
# Step 2: With Auth.code:  get Access Token (via curl)
# =====================================

```
## setup for request with curl
##  NOPE this fails
data='code='$code\
'&client_id='$PEOPLE_CLIENT_ID\
'&client_secret='$PEOPLE_CLIENT_SECRET\

'&redirect_uri=urn:ietf:wg:oauth:2.0:oob\

'&redirect_uri=https://127.0.0.1\
&grant_type=authorization_code' 



## returns access token (WORKS)
echo " " 
echo "=== request for access token  ==="
echo "data is $data"
echo " "

curl -s https://oauth2.googleapis.com/token \
--request POST \
--data $data  


#RETURNS tokens in JSON:
{
access_token
expires_in
refresh_token
scope
token_type:_"Bearer"
id_token
}


```


#### Step #3, use access_token piece, to get BEARER TOKEN
_no matches found
```
access_token=

echo $access_token


auth='Authorization: Bearer '$access_token
echo $auth

curl -H 'Accept: application/json' \
    -H $auth \
https://people.googleapis.com/v1/people/me?personFields=names


Works! Bearer Token:  Cut and paste from Google oauth playground
#### Scratch
curl -H 'Accept: application/json' \
-H 'Authorization: Bearer <snip>' \
https://people.googleapis.com/v1/contactGroups

# QUOTE the URL ! 
bearer="Authorization: Bearer snip"
echo $bearer

curl -H 'Accept: application/json' \
 -H $bearer
 "https://people.googleapis.com/v1/people/me?personFields=emailAddresses,genders"



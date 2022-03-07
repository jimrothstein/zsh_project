```
file <- "/home/jim/code/zsh_scripts_project/CURL_examples/120_oauth2_curl_google_people.md"

# PURPOSE:  Store various api id's, secrets etc.
#
# GIT:  ignores this file.
#
### ====================================================

#
# For google people api, NEED:
auth.code

api_key

PEOPLE_CLIENT_ID
PEOPLE_CLIENT_SECRET


#
#
# ===============
# Step 1: get Auth.code (via browser)
# ===============
#
#  for Google People, this is request (in browser)
#   https://accounts.google.com/o/oauth2/v2/auth?client_id=<SNIP>&redirect_uri=urn:ietf:wg:oauth:2.0:oob&scope=https://www.googleapis.com/auth/userinfo.profile&response_type=code

```
 In shell:
       PEOPLE_CLIENT_ID=$(Rscript -e "cat(Sys.getenv('PEOPLE_CLIENT_ID'))")
       echo $PEOPLE_CLIENT_ID

PEOPLE_CLIENT_SECRET=$(Rscript -e "cat(Sys.getenv('PEOPLE_CLIENT_SECRET'))")
echo $PEOPLE_CLIENT_SECRET


echo "https://accounts.google.com/o/oauth2/v2/auth?\
client_id=$PEOPLE_CLIENT_ID&\
redirect_uri=urn:ietf:wg:oauth:2.0:oob&\
scope=https://www.googleapis.com/auth/userinfo.profile&\
response_type=code"
```
#### Browser returns:  (short term, so not worried about pasting here)
```
code=4/1AX4XfWjIf-IV6VEQnqfKNeDhJwfO5Cg00NHhvChQM0JFi472QCjr1v-wN6E
echo $code  
```


# =====================================
# Step 2: get Access Token (via curl)
# =====================================

```
## setup for curl

data='code='$code'&client_id='$PEOPLE_CLIENT_ID'&client_secret='$PEOPLE_CLIENT_SECRET\
'&redirect_uri=urn:ietf:wg:oauth:2.0:oob&grant_type=authorization_code' 



## returns access token (WORKS)
echo " " 
echo "=== request for access token  ==="
echo "data is $data"
echo " "

curl -s https://oauth2.googleapis.com/token \
--request POST \
--data $data  


#RETURNS JSON:
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





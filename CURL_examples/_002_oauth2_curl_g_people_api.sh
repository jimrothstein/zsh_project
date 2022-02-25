#!/usr/bin/zsh

## ====================================================
#file <- "002_people.sh# "

# PURPOSE:  Store various api id's, secrets etc.
#
# GIT:  ignores this file.
#
# LONGER TERM:  Move these codes to ~/.Renviron and write Rscript to extract
# and place into environment variables so zsh scripts can access.
### ====================================================

# api_key=AIzaSyBNzjqVeBuz4WPeR-UhTVuwIEcEI2hMBGU
#
# For google people api
# oauth2  client_id=358088442289-amr4b5f5l1h9jicffu12d9t1vooiv10d.apps.googleusercontent.com
# client_secret=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
#
#
# ===============
# Step 1: get Auth.code (via browser)
# ===============
#
#  for Google People, this is request (in browser)
#   https://accounts.google.com/o/oauth2/v2/auth?client_id=358088442289-amr4b5f5l1h9jicffu12d9t1vooiv10d.apps.googleusercontent.com&redirect_uri=urn:ietf:wg:oauth:2.0:oob&scope=https://www.googleapis.com/auth/userinfo.profile&response_type=code

#   returns
code=4/1AX4XfWisGY43zYSJG_Cd3RiZOS0sg9jg3VjaEmSocGfeUaDrcflvlwBauYU


# =====================================
# Step 2: get Access Token (via curl)
# =====================================


## setup for curl
client_id=358088442289-amr4b5f5l1h9jicffu12d9t1vooiv10d.apps.googleusercontent.com
client_secret=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

data='code='$code'&client_id='$client_id'&client_secret='$client_secret\
'&redirect_uri=urn:ietf:wg:oauth:2.0:oob&grant_type=authorization_code' 



## returns access token (WORKS)
echo " " 
echo "=== request for access token  ==="
echo "data is $data"
echo " "

curl -s https://oauth2.googleapis.com/token \
--request POST \
--data $data  


#RETURNS access token: (see below exit)

access_token="ya29.A0ARrdaM_5CGCO8eamoYWP1t3RLq_lsyGMlPqvuePuW9vTmk25sWX5mSqEpD8L4zHxdyp4P7R
ZfTc_HWlR0Wk7DGY_IrrSBw86Kl7r-BvoYL1M_CB5udyEckBoBUnTjhbKqlDKhCfV1ceuyigPgJedyNOnayS"



# =================================================
# Step #3:  use Access Token, to get Bearer Token
# Not working yet
# =================================================

auth='Authorization: Bearer '$access_token
echo "===== Bearer ====="
echo $auth

echo "==================="

curl -H 'Accept: application/json' \
    -H $auth \
https://people.googleapis.com/v1/people/me?personFields=names

exit

{
  "access_token": "ya29.A0ARrdaM_5CGCO8eamoYWP1t3RLq_lsyGMlPqvuePuW9vTmk25sWX5mSqEpD8L4zHxdyp4P7R
ZfTc_HWlR0Wk7DGY_IrrSBw86Kl7r-BvoYL1M_CB5udyEckBoBUnTjhbKqlDKhCfV1ceuyigPgJedyNOnayS",
  "expires_in": 3599,
  "refresh_token": "1//06mX1fYDszywXCgYIARAAGAYSNwF-L9IrQPomg3V-GIiS3XWKQgFV5wW1PjzcGog9eocYA9M2w
1HUUUzVfqpTBramFOwal9ppKI",
  "scope": "https://www.googleapis.com/auth/userinfo.profile",
  "token_type": "Bearer",
  "id_token": "eyJhbGciOiJSUzI1NiIsImtpZCI6IjE4MmU0NTBhMzVhMjA4MWZhYTFkOWFlMWQyZDc1YTBmMjNkOTFkZj
iLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJhenAiOiIzNTgwODg0NDIyODktY
1yNGI1ZjVsMWg5amljZmZ1MTJkOXQxdm9vaXYxMGQuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiIzNTgwODg
NDIyODktYW1yNGI1ZjVsMWg5amljZmZ1MTJkOXQxdm9vaXYxMGQuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiO
IxMTE3MTI2OTcwMDQ5MzQ3MzAzMzMiLCJhdF9oYXNoIjoidzliclJWa1Z6amdNZHh4MU9BSXBMQSIsIm5hbWUiOiJqaW0gcm9
aHN0ZWluIiwicGljdHVyZSI6Imh0dHBzOi8vbGgzLmdvb2dsZXVzZXJjb250ZW50LmNvbS9hLS9BT2gxNEdncUt0eENsSENKb
FZTmQ4cGRsZ3NxUlpFaUo5VTNkZnVwU2JXbGR3PXM5Ni1jIiwiZ2l2ZW5fbmFtZSI6ImppbSIsImZhbWlseV9uYW1lIjoicm9
aHN0ZWluIiwibG9jYWxlIjoiZW4iLCJpYXQiOjE2NDQxODcyNTIsImV4cCI6MTY0NDE5MDg1Mn0.BhqS_Ubxvv6-2iKmrNFmp
zFIrdpthlL_VVPIfuEpMFHa79G0AG5thQGcysTWGlr3bNAxPbXPOa3S25njZf9_6QQJD5TD7z3P_g1oOI-BO1B-4tJNoYUmVe
ehxsHcioodgNN9_6f3QNqVNhyrS95a8GXDnP9x9u6ggK7950LpC0ySlSsxjDfschS-WRvgw4_XQGTfss8VcLpG3URES1Q4dKt
4k0Ow7-Fs5XWExU-fp8m55rym0pFdf6BkHD62IL3QlDl0BiVHAiACLJfs7NosRnUj5OXEjM1DEALkBkhXFb2N3NgaOJWOHiqQ
sYE7DSk0n6Dfc4JsLe0x2IlgEg"
}%



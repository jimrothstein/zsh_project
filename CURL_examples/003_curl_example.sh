#!/usr/bin/zsh

# ----------------------------
# file <- "003_curl_example.sh "
# ----------------------------
#
# =========================
#   FROM POSTMAN Tutorial
#   PURPOSE:  practice curl as shell script. 
#
#   DESCRIPTION:    
#       variables `base` and `endpoint` are defined.
#       curl is then executed
#
#   USAGE: Run as shell script
#
# =========================
#   BASE: https://simple-books-api.glitch.me
#   ENDPOINT: https://simple-books-api.glitch.me/status/status
# 
# WORKS
#   curl --head https://simple-books-api.glitch.me

# WORKS !
base=https://simple-books-api.glitch.me
curl --head $base
echo "==========="


# WORKS!
endpoint=/status
curl ${base}${endpoint}
#
exit


# =======================================================
####    SHELL environment variables base on ~/.Renviron
# =======================================================
#
#   Suppose HTTR2_GIST is set in ~/.Renviron
# In shell:
#       var=$(Rscript -e "Sys.getenv('HTTR2_GIST')") 
#       echo $var
# =======================================================
#
#https://docs.github.com/en/rest/guides/getting-started-with-the-rest-api

#!/bin/zsh

# ----------------------------
# file <- "CURL_examples/004_curl_opensecrets.sh,"
# ----------------------------
#
# =========================
#   PURPOSE:  practice curl  
# =========================
#
# Works in browser !
#
# From saveas as curl (in browser) appears that tranmis a cookie with session
# info.   Does this explain??   
#
# STEP #1   get OS_API_KEY = (see bottom)
#
# STEP #2   curl --config 004_config_opensecrets.txt
#
url="www.opensecrets.org/api/?method=getLegislators&id=NJ&apikey=$key"
-w "Why does this not work? \n"
-D headers.txt
# fail-with-body  (I have old version)
-w "http_code= %{http_code}" (i have old curl version)
-v



#
#
#
# ===============================================================================
# http://www.opensecrets.org/api/?method=getLegislators&id=NJ&apikey=__apikey__
#
# ===============================================================================
#
# =======================================================
#
#   Suppose OS_API_KEY is set in ~/.Renviron
# In shell:
#       key=$(Rscript -e "cat(Sys.getenv('OS_API_KEY'))")
#       echo $var
# =======================================================

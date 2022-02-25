#!/bin/zsh
#   file <- "/home/jim/code/zsh_scripts_project/CURL_examples/_020_curl_github_starting_with_REST_api.sh#"
# This file begins with _.   Git ignores.  It contains Githup PAT
#
## ===========================================
GITHUB_PAT=
# ===========================================
#   GITHUB API:   Starting with RESTFUL API
# ===========================================
#
# REFERENCE:
# https://docs.github.com/en/rest/guides/getting-started-with-the-rest-api
#
#
# ===========================================
# WORKS
curl https://api.github.com/zen
# ===============================

#
## ===========================================
# WORKS
# GET /users/defunkt
$ curl https://api.github.com/users/defunkt
#
#
# 
#   TO include HEADERS
# curl -i https://api.github.com/users/defunkt
#
#   TO see HEADERS Only:
# curl --head https://api.github.com/users/defunkt
#
#
# ======================
#       AUTHENTICATION
# ======================
#
#   Asks for username (anything seems ok)
# curl -i -u your_username https://api.github.com/users/octocat
#
# WORKS
#  (updated 20FEB22)
#   To retrieve my Github_PAT (stored in ~/.Renviron) and put into zsh shell
#   token=$(Rscript -e "cat(Sys.getenv('GITHUB_PAT'))")
#   echo $token
#
#   # note `x-ratelimit-limit: 5000`
#  curl -si -u jimrothstein:$token https://api.github.com/users/octocat
#  
#
#
#   To get info about me (if authenticated)
# curl -i -u jimrothstein:$token https://api.github.com/users/user
# curl -i -u jimrothstein:$token https://api.github.com/users/jimrothsein
# =========================================================================
#
# WORKS!
endpoint=/status
curl ${base}${endpoint}
#
exit


# ===============================================================================
#  `Contributors` is public
#  But `collobrators` is private
# ===============================================================================
#   
# curl -s https://api.github.com/repos/google/go-github/contributors | head -40
# curl -s https://api.github.com/repos/jimrothstein/try_things_here/contributors | head -40 
#
# ===============================================================================
# `Colloboraters` (project manger) is privid and requires authorization.
# FAILS
# curl -s  https://api.github.com/repos/jimrothstein/try_things_here/collaborators 
#
#
#  WORKS   
## curl -s -u jimrothstein:$token https://api.github.com/repos/jimrothstein/try_things_here/collaborators 
# ===============================================================================

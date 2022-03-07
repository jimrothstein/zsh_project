"#!/usr/bin/zsh"

# file <- /home/jim/code/zsh_scripts_project/CURL_CONFIG_examples/opensecrets.sh

#REF:
# http://www.opensecrets.org/api/?method=getLegislators&id=NJ&apikey=__apikey__


export token=$(Rscript -e "cat(Sys.getenv('OS_API_KEY'))")
echo $token

echo "https://www.opensecrets.org/api/?method=getLegislators&id=NJ&apkey=$token"

echo "----- -----"

#curl -s  \
# https://www.opensecrets.org/api/?method=getLegislators&id=NJ&apkey=$token



curl -s --config opensecrets.txt  
#https://www.opensecrets.org/api/?method=getLegislators 


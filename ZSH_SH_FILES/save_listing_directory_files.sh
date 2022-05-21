
#!/usr/bin/zsh
#	file <- "save_listing_directory_files.sh"

#		TODO:
#		-	What directory add $1 arg
#		-	Error check


#		PURPOSE:	Given a directory, create file listing and save to
#		~/Downloads/print_and_delete/


#ls -la > $(date -I)_list
ls -la > ~/Downloads/print_and_delete/"$(date -I)"_file_listing.txt


#	NOTE:   $(date -I) means run command date with OPTION -I

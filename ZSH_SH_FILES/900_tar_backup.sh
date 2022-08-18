#	file <- "/home/jim/code/zsh_project/ZSH_SH_FILES/900_tar_backup.sh#"
#
# #######
# PURPOSE:  
# Using tar, create a backup of specific important files that should
# NOT go to github.   Instead, this backup should go to DRIVE.
#
#
########

####	the date and the_file_name
{
date +%d%b%Y

##	create variable
	export theDate=$(date +%d%b%Y)
	theDate
	echo ${theDate}

	export the_file_name=${theDate}_test.tar.gz
	echo ${the_file_name}

}

####	Use tar
#		-c 		create
#		-v		verbose
#		-f		use specified file name	
#
##	tar [options] <backup_to.tar.gz> -X <exclude> <files>

##	just some practice
{
tar -cvzf test.tar.gz *

tar -cvzf ${theDate}_test.tar.gz *
}

##	for real backup
{
tar -cvzf ${the_file_name} *
ls -la 

mv ${the_file_name}  ~/Downloads/to_Drive
ls -lha ~/Downloads/to_Drive
}

##	list contents
{
	tar --list -f ${theDate}_test.tar.gz
	tar --list -f ${the_file_name}

##	Remove it
{
 	rm test.tar.gz	
}	



##-------------
##		LEGACY
##-------------

theDate
1:
	@echo $(theDate)
	@echo $(.SHELLSTATUS)


2:	1
	@echo $(theDate)

date:
		@echo $(shell whoami)			# jim
		@echo $(shell arch)				# x86_64
		@echo $(theDate)				# WED Sept 26 ....
		@echo $(shell date +%Y%m%d)     # 20200301
		@echo $(shell date +"%^a %d%b%Y") # WED Sept 26 


test:
	# works
	tar -cvzf test.tar.gz *

test_mess:
	tar -cvzf test_'$(theDate)'_.tar.gz *

backup: 
	@#	Something still wrong with date.... extra ???
	@#	tar [options] <backup_to.tar.gz> -X <exclude> <files>

	@echo $(theDate)
	@tar -cvpzf ~/Downloads/toGoogle/legal_backup_"$(theDate)".tar.gz -X exclude_files.txt *
	@echo $(theDate)

backup_list:
	@tar -tf ~/Downloads/toGoogle/legal_backup_"$(theDate)".tar.gz
	@echo $(theDate)


find:
	find ~ -name "*.tar.gz"





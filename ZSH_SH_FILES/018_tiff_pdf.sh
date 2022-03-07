#!/bin/bash
# ~./018_tiff_pdf.sh

# ./018_tiff_pdf <files>
# converts each .tif file to .pdf
# some warnings, but ignore



#

echo "${#}"
#  echo "${*}"
#  echo "${@}"


for file in "${@}" 				
do
	echo "${file}"
	tiff2pdf "${file}" -o "${file}".pdf	
done
exit



contents_file="$1"
specifier="$2"
result_file="$3"

#find local file path to the contents_file that will be put in the middle
contents_file_path=$(find . -name $contents_file)

header_file="${specifier}_header.html"
footer_file="${specifier}_footer.html"

#find local file path to the header file that will be put on top
specifier_header_path=$(find . -name $header_file)

#find local file path to the footer file that will be put on the bottom
specifier_footer_path=$(find . -name $footer_file)

#get string contents of all needed files

middle=$(< $contents_file_path)

top=$(< $specifier_header_path)

bottom=$(< $specifier_footer_path)

contents="${top}
${middle}
${bottom}"

#create html file and add the contents to it

cat > $result_file << EOF

$contents

EOF


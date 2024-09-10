# Regex 0: Extract names and breakfast items from r0_input.txt
awk '/\* [A-Za-z]+, [A-Za-z]+/ {sub(/\* /, "", $0)
  split($0, arr, ", ")
  print "1. " arr[1] "\n2. " arr[2] "\n"
}' r0_input.txt > r0_output.txt

# Regex 1: Extract names and favorite sandwiches from r1_input.txt
awk '/\* I am [A-Za-z]+\. My favorite sandwich is [A-Za-z]+./ {
  sub(/\* I am /, "", $0)                 
  sub(/\. My favorite sandwich is /, ",", $0) 
  split($0, arr, ",")                    
  gsub(/\./, "", arr[2])                 
  print "1. " arr[1] "\n2. " arr[2] "\n"
}' r1_input.txt > r1_output.txt

# Regex 2: Extract sandwich ingredients and whether it's for here or to go from r2_input.txt
awk '/\* sandwich with [A-Za-z0-9.]+\. (for here|to go)/ {
  sub(/\* sandwich with /, "", $0)             
  
  # Split the line at the ". " to separate the sandwich and the order type
  split($0, arr, "\\. ")
  
  sandwich = arr[1] "."                        
  order_type = arr[2]                           
  
  print "1. " sandwich "\n2. " order_type "\n"
}' r2_input.txt > r2_output.txt

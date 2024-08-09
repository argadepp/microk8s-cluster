
echo "into the script"
cat /var/snap/microk8s/current/certs/csr.conf.template


# Define the file location
file_path="/var/snap/microk8s/current/certs/csr.conf.template"

# Define the dynamic values
dynamic_dns_values=("DNS.0 = eks.pratikargade.online")
dynamic_ip_values=("IP.0 = $1")

# Combine the dynamic values into a single string
new_values="${dynamic_dns_values[@]}
${dynamic_ip_values[@]}"

# Insert the dynamic values after the #MOREIPS line
sed -i "/#MOREIPS/a $new_values" "$file_path"

# Verify the changes
echo "Updated $file_path with the following entries:"
echo "$new_values"

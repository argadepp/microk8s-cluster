echo "Into the script"
cat /var/snap/microk8s/current/certs/csr.conf.template

# Define the file location
file_path="/var/snap/microk8s/current/certs/csr.conf.template"

# Define the dynamic values
dynamic_dns="DNS.0 = eks.pratikargade.online"
dynamic_ip="IP.0 = $1"

# Backup the original file
cp "$file_path" "$file_path.bak"

# Insert the dynamic values after the #MOREIPS line using awk
awk -v dns="$dynamic_dns" -v ip="$dynamic_ip" '
  /#MOREIPS/ { print; print dns; print ip; next }
  { print }
' "$file_path.bak" > "$file_path"

# Verify the changes
echo "Updated $file_path with the following entries:"
cat "$file_path"
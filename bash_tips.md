# Loop through multiple elements per line

```bash
# Open file descriptor 3
while IFS='|' read -r i j rest <&3; do
  {
    printf '%s\n' "something with $i and $j"
    # Close file descriptor 3 for the chile process
  } 3<&-
done 3< <(kubectl get --no-headers po -A |awk '{print $1"||$2"}')
```

# Open a TCP connection without telnet

```bash
# Open file descriptor
exec 3<>/dev/tcp/localhost/8001

# send and receive
echo -e "GET / HTTP/1.1\r\nHost: localhost\r\nConnection: close\r\n\r\n" >&3
cat <&3

# close
exec 3>&-
```
# SSL Certificate Expiry Checker

```bash
DOMAIN="example.com"
EXPIRY_DATE=$(echo | openssl s_client -servername $DOMAIN -connect $DOMAIN:443 2>/dev/null | openssl x509 -noout -dates | grep notAfter | cut -d= -f2)
DAYS_LEFT=$(( ($(date -d "$EXPIRY_DATE" +%s) - $(date +%s)) / 86400 ))
echo "SSL certificate for $DOMAIN expires in $DAYS_LEFT days."
```

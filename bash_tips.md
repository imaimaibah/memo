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

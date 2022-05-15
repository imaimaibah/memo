# Open file descriptor
exec 3<>/dev/tcp/localhost/8001

# send and receive
echo -e "GET / HTTP/1.1\r\nHost: localhost\r\nConnection: close\r\n\r\n" >&3
cat <&3

# close
exec 3>&-

#!/usr/bin/bash


cat <<EOF | sed '{:a;s!\(<data>\).*\(</data>\)!\1\n\timaimaibah\n\2!;N;Ta;P;D}'
hello world
<data> jiiijij
sfafewaef
</data>
shin.imai
EOF

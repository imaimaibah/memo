cat <<EOF | sed -n '/^pattern1/,/^pattern2/{p;/^pattern2/q}'
aaa
bbb
pattern1
aaa pattern2
bbb
ccc
pattern2
ddd
eee
pattern1
fff
ggg
EOF

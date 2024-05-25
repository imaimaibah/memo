# Map vs {}

# Named group / Backreference by name

You can backreference by name like below.

```sh
echo '{"date": "'$(date +"%Y-%m-%dT%H:%M:%S+0100")'"}' | jq -r '.date|sub(".*T(?<x>.*)\\+....$"; .x)'
```

FYI:
[pcre2pattern](https://www.pcre.org/current/doc/html/pcre2pattern.html#SEC16)

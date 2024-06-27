# Map vs {}

# Named group / Backreference by name

You can backreference by name like below.

```sh
echo '{"date": "'$(date +"%Y-%m-%dT%H:%M:%S+0100")'"}' | jq -r '.date|sub(".*T(?<x>.*)\\+....$"; .x)'
```

FYI:
[pcre2pattern](https://www.pcre.org/current/doc/html/pcre2pattern.html#SEC16)

# Return index in search

You can use `map()` and `index()` to get an index. 

```
JSON='{
"items": [{
  "name": {
    "first": "James",
    "last": "Mcavoy"
  },
  "age": 40
},
{
  "name": {
    "first": "Taro",
    "last": "Yamada"
  },
  "age": 42
},
{
  "name": {
    "first": "Hanako",
    "last": "Sato"
  }, 
  "age": 28
}]

}'

echo $JSON | jq -r '.items|map(.name.first=="Taro")|index(true)'
```

# demo

## Install and test locally

```bash
luarocks make --local
luarocks pack demo
luarocks install demo-1.0.0-1.all.rock --local
```

## Logging 

* [dump table](https://stevedonovan.github.io/Penlight/api/libraries/pl.pretty.html)

```lua
-- pretty dump
pl.pretty.write(t)

-- dump into one line
pl.pretty.write(tbl, '')
```

## Reference
- [kong plugin template](https://github.com/Kong/kong-plugin)
- [kong lua pdk](https://docs.konghq.com/gateway-oss/2.3.x/pdk/)
- [lua-resty-http library](https://github.com/ledgetech/lua-resty-http)


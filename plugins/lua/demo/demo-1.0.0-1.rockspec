package = "demo"
version = "1.0.0-1"

source = {
  url = "git://github.com/Kong/kong-plugin-demo",
  tag = "1.0.0"
}

supported_platforms = {"linux", "macosx"}
description = {
  summary = "Demo plugin",
  license = "Apache 2.0",
}

dependencies = {
 -- "lua-resty-counter >= 0.2.0",
  --"kong >= 0.13.0",
 "lua-resty-http == 0.15.0"
}

build = {
  type = "builtin",
  modules = {
    ["kong.plugins.demo.handler"] = "kong/plugins/demo/handler.lua",
    ["kong.plugins.demo.schema"] = "kong/plugins/demo/schema.lua",
  }
}

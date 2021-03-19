-- If you're not sure your plugin is executing, uncomment the line below and restart Kong
-- then it will throw an error which indicates the plugin is being loaded at least.

--assert(ngx.get_phase() == "timer", "The world is coming to an end!")

---------------------------------------------------------------------------------------------
-- In the code below, just remove the opening brackets; `[[` to enable a specific handler
--
-- The handlers are based on the OpenResty handlers, see the OpenResty docs for details
-- on when exactly they are invoked and what limitations each handler has.
---------------------------------------------------------------------------------------------



local plugin = {
    PRIORITY = 1000, -- set the plugin priority, which determines plugin execution order
    VERSION = "0.1",
  }
  
  
  
  -- do initialization here, any module level code runs in the 'init_by_lua_block',
  -- before worker processes are forked. So anything you add here will run once,
  -- but be available in all workers.
  
  
  
  -- handles more initialization, but AFTER the worker process has been forked/created.
  -- It runs in the 'init_worker_by_lua_block'
  function plugin:init_worker()
  
    -- your custom code here
    kong.log.debug("saying hi from the 'init_worker' handler")
  
  end --]]
  
  
  
  --[[ runs in the 'ssl_certificate_by_lua_block'
  -- IMPORTANT: during the `certificate` phase neither `route`, `service`, nor `consumer`
  -- will have been identified, hence this handler will only be executed if the plugin is
  -- configured as a global plugin!
  function plugin:certificate(plugin_conf)
    -- your custom code here
    kong.log.debug("saying hi from the 'certificate' handler")
  end --]]
  
  
  
  --[[ runs in the 'rewrite_by_lua_block'
  -- IMPORTANT: during the `rewrite` phase neither `route`, `service`, nor `consumer`
  -- will have been identified, hence this handler will only be executed if the plugin is
  -- configured as a global plugin!
  function plugin:rewrite(plugin_conf)
    -- your custom code here
    kong.log.debug("saying hi from the 'rewrite' handler")
  end --]]
  
  
  
  -- runs in the 'access_by_lua_block'
  function plugin:access(plugin_conf)
  
    -- your custom code here
    kong.log.inspect(plugin_conf)   -- check the logs for a pretty-printed config!
    ngx.req.set_header(plugin_conf.request_header, "this is on a request")

    -- canary plugin demo
    local env = kong.request.get_header("track")
    if env and env == "canary" then
      kong.log.debug("environment is "..env)
      local ok, err = kong.service.set_upstream("foo-service")
      if not ok then
        kong.log.err(err)
        return
      end
    end


      -- http demo
      local http = require "resty.http"
      local httpc = http.new()
      local res, err = httpc:request_uri("http://example.com/helloworld", {
        method = "POST",
        body = "a=1&b=2",
        headers = {
          ["Content-Type"] = "application/x-www-form-urlencoded",
        },
        keepalive_timeout = 60000,
        keepalive_pool = 10
      })

      if not res then
        ngx.say("failed to request: ", err)
        return
      end

      -- In this simple form, there is no manual connection step, so the body is read
      -- all in one go, including any trailers, and the connection closed or keptalive
      -- for you.

      ngx.status = res.status

      for k,v in pairs(res.headers) do
          --
      end

      ngx.say(res.body)
  
  end --]]
  
  
  -- runs in the 'header_filter_by_lua_block'
  function plugin:header_filter(plugin_conf)
  
    -- your custom code here, for example;
    ngx.header[plugin_conf.response_header] = "this is on the response"
  
  end --]]
  
  
  --[[ runs in the 'body_filter_by_lua_block'
  function plugin:body_filter(plugin_conf)
    -- your custom code here
    kong.log.debug("saying hi from the 'body_filter' handler")
  end --]]
  
  
  --[[ runs in the 'log_by_lua_block'
  function plugin:log(plugin_conf)
    -- your custom code here
    kong.log.debug("saying hi from the 'log' handler")
  end --]]
  
  
  -- return our plugin object
  return plugin
  

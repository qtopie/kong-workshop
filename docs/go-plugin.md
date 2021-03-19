# How does kong support go plugin?

By exploiting `Go Plugin` and `Unix domain socket`.

> Kong employs a sidecar process to run Go plugins: the go-pluginserver. The role of this process is to dynamically load a `Go plugin` and execute its code on demand, based on communication with Kong (performed through a `Unix domain socket`). Kong is responsible for managing the lifecycle of the go-pluginserver, and, as you will see below, it only needs to know where to find the go-pluginserver’s executable to do so.


* go-pdk

> The go-pdk allows your Go plugins to access functionality provided by the Kong PDK. To use it, you need to add "github.com/Kong/go-pdk" to the list of packages imported by your plugin. The kong parameter received on the phase handler methods is the entry point for the Go PDK functions. Most of these functions work the same as the corresponding functions in the Lua PDK.


## Reference 
- [Go Plugin Development Kit
Permalink](https://docs.konghq.com/enterprise/2.1.x/go/)
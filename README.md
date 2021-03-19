# kong-workshop

*Workshop for playing or develop with kong locally.*

## Setup Locally

```bash
cd plugins/go-pluginserver && make && cd -
cd plugins/go && make && cd

docker-compose up
```

## Testing

* Run demo api

```bash
cd examples
go run main.go
```

* Config demo service with go plugins

* Test with `curl`

```bash
curl -v http://127.0.0.1:8000/ping
```


## Resources

- [Go bindings for Kong's Admin API](https://github.com/Kong/go-kong)
- [Kong admin ui only for testing localy](http://kong-admin.pocketdigi.com/)

## Reference

- [kubernetes ingress](https://github.com/Kong/kubernetes-ingress-controller/tree/master/deploy/manifests/)
- [kong image](https://hub.docker.com/_/kong)
- [konga](https://github.com/pantsel/konga#running-konga)
- [KONG Admin API](https://docs.konghq.com/2.1.x/admin-api/#consumer-object)
- [go plugins](https://docs.konghq.com/2.0.x/go/)


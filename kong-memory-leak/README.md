
## Setup with multipass

```bash
multipass launch -n kong-dp --cloud-init cloud-config.yaml --disk 12G 18.04

# image location /var/snap/multipass/common/data/multipassd/vault/instances/kong-dp/
sudo $(which qemu-img) resize --preallocation='full' ubuntu-18.04-server-cloudimg-amd64.img +8G

multipass mount certs kong-dp:/usr/local/kong/certs
```

## Memory Leak analysis

See flame-graphs generated with openresty xray

## Reference
- [kong hybrid mode](https://docs.konghq.com/gateway-oss/2.0.x/hybrid-mode/)
- https://hadibrais.wordpress.com/2017/03/13/installing-ubuntu-kernel-debugging-symbols/
- [cloud-init](https://cloudinit.readthedocs.io/en/latest/topics/examples.html)
- [kong-vagrant setup openresty-systemtap-toolkit](https://github.com/Kong/kong-vagrant/blob/master/provision.sh)
- [flame graph](https://github.com/brendangregg/FlameGraph)
- [中文openresty-systemtap-toolkit usage](https://phenix3443.github.io/notebook/openresty/openresty-systemtap-toolkit.html)
- [kong conf reference](https://github.com/Kong/kong/blob/2.3.1/kong.conf.default)
- https://discuss.konghq.com/t/kong-memory-usage-doesnt-come-down/3928/5
- [kong 2.2.2 memory leak isssues](https://github.com/Kong/kong/issues/6547)
- [kong 2.2.2 memory leak patch](https://github.com/Kong/kong/commit/bebd48304296528082ac61e84932a8b54eb1cee0)


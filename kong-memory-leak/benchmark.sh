#!/bin/bash

hey -z 15m -m PUT -T 'application/json' -d '{"host":"test"}' "http://192.168.50.239:8001/services/cb11548c-8374-462d-8b54-1544caad45f5"

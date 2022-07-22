#!/bin/bash

go tool pprof -seconds 60 -http 0.0.0.0:8080 http://localhost:6060/debug/pprof/profile
#!/bin/bash

dlv debug src/isubata/app.go --headless --listen=:$REMOTE_DEBUG_PORT --accept-multiclient --continue
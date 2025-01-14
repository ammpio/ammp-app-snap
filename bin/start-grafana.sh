#!/bin/bash

# Grafana configuration
export GF_PATHS_DATA=$SNAP_DATA
export GF_PATHS_PLUGINS=$SNAP/plugins
export GF_PATHS_PROVISIONING=$SNAP/provisioning

export GF_SERVER_HTTP_PORT=80
export GF_SERVER_ENABLE_GZIP=true
export GF_ANALYTICS_REPORTING_ENABLED=false
export GF_ANALYTICS_CHECK_FOR_UPDATES=false
export GF_SECURITY_DISABLE_GRAVATAR=true
export GF_SNAPSHOTS_EXTERNAL_ENABLED=false
export GF_LOG_MODE=console
export GF_ALERTING_ENABLED=false
export GF_EXPLORE_ENABLED=false

export EXTRA_CONFIG_FILE=$SNAP/provisioning/env_config.sh
test -f $EXTRA_CONFIG_FILE && source $EXTRA_CONFIG_FILE

exec "$SNAP/bin/grafana-server" -homepath $SNAP "$@"

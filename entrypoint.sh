#!/bin/bash

mv -f /tmp/grafana-piechart-panel /var/lib/grafana/plugins/
mv -f /tmp/kubegraf /var/lib/grafana/plugins/

exec /run.sh

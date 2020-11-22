#!/bin/bash

mkdir -p /tmp/kubegraph

rm -fr grafana-piechart-panel
wget -nv https://grafana.com/api/plugins/grafana-piechart-panel/versions/latest/download -O grafana-piechart-panel.zip
unzip -q grafana-piechart-panel.zip -d .
rm -f grafana-piechart-panel.zip

rm -fr kubegraf
git clone --depth 1 https://github.com/devopsprodigy/kubegraf
rm -fr kubegraf/.git

rm -fr /tmp/kubegraph
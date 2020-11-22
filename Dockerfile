FROM grafana/grafana:6.7.4

COPY --chown=472:472 grafana-piechart-panel /tmp/grafana-piechart-panel
COPY --chown=472:472 kubegraf /tmp/kubegraf
COPY entrypoint.sh /entrypoint.sh

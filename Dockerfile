FROM grafana/grafana:6.7.0

COPY --chown=472:472 grafana-piechart-panel /var/lib/grafana/plugins/grafana-piechart-panel
COPY --chown=472:472 kubegraf /var/lib/grafana/plugins/kubegraf

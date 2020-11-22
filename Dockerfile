FROM grafana/grafana:7.3.3

COPY --chown=472:472 grafana-piechart-panel /tmp/grafana-piechart-panel
COPY --chown=472:472 kubegraf /tmp/kubegraf
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
# grafana-with-plugins

Grafana with installed DevOpsProdigy KubeGraf (https://github.com/devopsprodigy/kubegraf)

### Installation


1. Go to the plugins directory in Grafana:

    `cd $GRAFANA_PATH/data/plugins`

2. Copy the repository:

    `git clone https://github.com/devopsprodigy/kubegraf  /var/lib/grafana/plugins` and restart grafana-server

    or

    `grafana-cli plugins install devopsprodigy-kubegraf-app` and restart grafana-server.

3. Apply Kubernetes manifests from [kubernetes/](kubernetes/) directory to give
     required permissions to the user `grafana-kubegraf`:
      ```
      kubectl apply -f https://raw.githubusercontent.com/devopsprodigy/kubegraf/master/kubernetes/serviceaccount.yaml
      kubectl apply -f https://raw.githubusercontent.com/devopsprodigy/kubegraf/master/kubernetes/clusterrole.yaml
      kubectl apply -f https://raw.githubusercontent.com/devopsprodigy/kubegraf/master/kubernetes/clusterrolebinding.yaml
      kubectl apply -f https://raw.githubusercontent.com/devopsprodigy/kubegraf/master/kubernetes/secret.yaml
      ```

4. Create a `grafana-kubegraf` user private key and certificate on one of the
      master nodes:
      ```
      openssl genrsa -out ~/grafana-kubegraf.key 2048
      openssl req -new -key ~/grafana-kubegraf.key -out ~/grafana-kubegraf.csr -subj "/CN=grafana-kubegraf/O=monitoring"
      openssl x509 -req -in ~/grafana-kubegraf.csr -CA /etc/kubernetes/pki/ca.crt -CAkey /etc/kubernetes/pki/ca.key -out /etc/kubernetes/pki/grafana-kubegraf.crt -CAcreateserial
      ```
     Copy /etc/kubernetes/pki/grafana-kubegraf.crt to all other master nodes.

    or

    Get the token
    ```
    kubectl get secret grafana-kubegraf-secret -o jsonpath={.data.token} | base64 -d
    ```

5. Go to /configuration-plugins in Grafana and click on the plugin. Then click “enable”.

6. Go to the plugin and select “create cluster”.

7. Enter the settings of http-access to the Kubernetes api server:
    * Kubernetes master's url from `kubectl cluster-info`
    * Enter the certificate and key from step #4  "TLS Client Auth" section
      Or
      The token from step #4 in "Bearer token access" section

8. Open the “additional datasources” drop-down list and select the prometheus that is used in this cluster.

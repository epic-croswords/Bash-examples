## This repo dedicated to prometheus and grafana config/yaml files.

### ``files:``
- **nvidia.yaml:** 
  > install nvidia_gpu_exporter and export values to prometheus. before to use need to change values such as hosts, perticular version of exporter etc.
- **node_exporter.yml:** 
  > config file of node_exporter, nvidia_exporter, snmp_exporter, blackbox etc. 

### ``ports used by services``
- **9100** node exporter
- **9835** nvidia exporter
- **9116** SNMP exporter
- **9115** blackbox exporter

### ``Links to donwload exporters and there repo``
- Node exporter [link](https://github.com/prometheus/node_exporter).
- Nvidia exporter [link](https://github.com/utkuozdemir/nvidia_gpu_exporter).
- SNMP exporter [link](https://github.com/prometheus/snmp_exporter).
- blackbox and any other exporters [link](https://prometheus.io/download/).

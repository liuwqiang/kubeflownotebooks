FROM docker.wanfangdata.com.cn/wfk8s/pyspark-notebook:spark-3.3.1

ENTRYPOINT jupyter lab \
  --notebook-dir="${HOME}" \
  --ip=0.0.0.0 \
  --no-browser \
  --allow-root \
  --port=8888 \
  --ServerApp.token="" \
  --ServerApp.password="" \
  --ServerApp.allow_origin="*" \
  --ServerApp.base_url="${NB_PREFIX}" \
  --ServerApp.authenticate_prometheus=False

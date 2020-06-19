FROM tomsquest/docker-radicale
COPY data /data

CMD radicale --server-hosts 0.0.0.0:$PORT --config /config/config

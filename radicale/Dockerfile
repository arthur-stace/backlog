FROM tomsquest/docker-radicale

RUN apk add make jq

WORKDIR /

COPY Makefile $WORKDIR
COPY .Radicale.props.jq $WORKDIR

RUN make -e APPLICATION=radicale -e DOMAIN=ocw.mit.edu

CMD radicale --server-hosts 0.0.0.0:$PORT --config /config/config


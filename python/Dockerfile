FROM alpine

RUN apk add --no-cache python3

RUN pip3 install --upgrade --no-cache-dir pip

RUN ln -s /usr/bin/python3 /usr/bin/python

CMD ["/usr/bin/python"]

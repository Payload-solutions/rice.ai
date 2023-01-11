FROM golang:1.19.5

RUN mkdir /app

WORKDIR $GOPATH/src/github.com/Payload-solutions/

COPY . .

RUN git clone https://github.com/Payload-solutions/iot-microservice.git

RUN go get -d -v .

RUN go install -v .


# here
# COPY --from=client_builder /app/dist ./client/dist

EXPOSE 3000

# ENTRYPOINT measurements-realtime --build="go build main.go" --command=./main

CMD ["iot-microservice"]

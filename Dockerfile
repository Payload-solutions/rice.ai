FROM golang:1.19.2

RUN mkdir /app

WORKDIR $GOPATH/src/github.com/Arturo0911/measurements-realtime

COPY . .

RUN go get -d -v ./...

RUN go install -v ./...


# here
# COPY --from=client_builder /app/dist ./client/dist

EXPOSE 8000

# ENTRYPOINT measurements-realtime --build="go build main.go" --command=./main

CMD ["measurements-realtime"]
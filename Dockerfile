FROM arm64v8/golang:alpine
RUN go install github.com/tsenart/vegeta@latest

FROM arm64v8/alpine
RUN apk --no-cache add curl jq
COPY --from=0 /go/bin/vegeta /bin/
CMD [ "/bin/vegeta", "-h" ]

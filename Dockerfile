FROM golang AS build
WORKDIR /go/src/app
ADD . .
RUN CGO_ENABLED=0 go build -o /go/bin/app .

FROM scratch
COPY --from=build /go/bin/app /
EXPOSE 80
ENTRYPOINT ["/app"]

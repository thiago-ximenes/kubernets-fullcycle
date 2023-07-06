FROM golang:1.20
COPY . .
RUN go env -w GO111MODULE=off
RUN go build -o server .
CMD ["./server"]
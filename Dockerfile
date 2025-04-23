FROM golang:1.19 AS build

WORKDIR /app

COPY ./fullcyclerocks.go /app

RUN CGO_ENABLED=0 GOOS=linux go build -o fullcyclerocks fullcyclerocks.go

FROM scratch

WORKDIR /app

COPY --from=build /app/fullcyclerocks ./

EXPOSE 8000

CMD ["./fullcyclerocks"]
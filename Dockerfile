FROM hashicorp/http-echo:latest

EXPOSE 5678

CMD ["-text=Hello World!"]
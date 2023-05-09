FROM golang:1.11-alpine

# Set maintainer label: maintainer=[YOUR-EMAIL]
LABEL maintainer="<s2210455017@fhooe.at>"


# Set working directory: `/src`
WORKDIR /src

# solve gcc error
RUN apk update && apk add gcc musl-dev

# Copy local file `main.go` to the working directory
COPY main.go .

# List items in the working directory (ls)
RUN ls -la

# Build the GO app as myapp binary and move it to /usr/
RUN go build -o myapp
RUN mv ./myapp /usr/

#Expose port 8888
EXPOSE 8888

# Run the service myapp when a container of this image is launched
CMD ["/usr/myapp"]

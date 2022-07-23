isuports: test go.mod go.sum *.go cmd/isuports/*
	/usr/local/go/bin/go build -o isuports ./cmd/isuports

test:
	/usr/local/go/bin/go test -v ./...

build:
	/usr/local/go/bin/go mod tidy
	/usr/local/go/bin/go mod vendor
	/usr/local/go/bin/go build -o isubata src/isubata/app.go

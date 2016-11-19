default: test

test:
	go run script/check-MakeGitError-thread-lock.go
	go test ./...

install:
	go install ./...

build-libgit2:
	./script/build-libgit2-static.sh

static: build-libgit2
	go run script/check-MakeGitError-thread-lock.go
	go test --tags "static" ./...

install-staic: build-libgit2
	go install --tags "static" ./...

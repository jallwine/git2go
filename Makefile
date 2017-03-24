default: test

build-libgit2:
	./script/build-libgit2-static.sh

test: build-libgit2
	CC=o64-clang CXX=o64-clang++ GOOS=darwin GOARCH=amd64 CGO_ENABLED=1 go run script/check-MakeGitError-thread-lock.go
	CC=o64-clang CXX=o64-clang++ GOOS=darwin GOARCH=amd64 CGO_ENABLED=1 go test ./...

install: build-libgit2
	CC=o64-clang CXX=o64-clang++ GOOS=darwin GOARCH=amd64 CGO_ENABLED=1 CGO_LDFLAGS='-lssh2 -lssl -lcrypto -lcurl' go install ./...

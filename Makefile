default: test

build-libgit2:
	./script/build-libgit2-static.sh

test: build-libgit2
	CC=x86_64-w64-mingw32-gcc-posix CXX=x86_64-w64-mingw32-g++-posix GOOS=windows GOARCH=amd64 CGO_ENABLED=1 CGO_CFLAGS="-D_WIN32_WINNT=0x0400" CGO_CXXFLAGS="-D_WIN32_WINNT=0x0400" go run script/check-MakeGitError-thread-lock.go
	CC=x86_64-w64-mingw32-gcc-posix CXX=x86_64-w64-mingw32-g++-posix GOOS=windows GOARCH=amd64 CGO_ENABLED=1 CGO_CFLAGS="-D_WIN32_WINNT=0x0400" CGO_CXXFLAGS="-D_WIN32_WINNT=0x0400" go test ./...

install: build-libgit2
	CC=x86_64-w64-mingw32-gcc-posix CXX=x86_64-w64-mingw32-g++-posix GOOS=windows GOARCH=amd64 CGO_ENABLED=1 CGO_CFLAGS="-D_WIN32_WINNT=0x0400" CGO_CXXFLAGS="-D_WIN32_WINNT=0x0400" go install -v ./...

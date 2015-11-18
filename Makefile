.PHONY: \
	all \
	deps \
	updatedeps \
	testdeps \
	updatetestdeps \
	build \
	test \
	testrace \
	clean \

all: test testrace

deps:
	go get -d -v github.com/alexanderfahlke/go-read-dmesg/...

updatedeps:
	go get -d -v -u -f github.com/alexanderfahlke/go-read-dmesg/...

testdeps:
	go get -d -v -t github.com/alexanderfahlke/go-read-dmesg/...

updatetestdeps:
	go get -d -v -t -u -f github.com/alexanderfahlke/go-read-dmesg/...

build: deps
	go build github.com/alexanderfahlke/go-read-dmesg/...

test: testdeps
	go test -v -cpu 1,4 github.com/alexanderfahlke/go-read-dmesg/...

testrace: testdeps
	go test -v -race -cpu 1,4 github.com/alexanderfahlke/go-read-dmesg/...

clean:
	go clean github.com/alexanderfahlke/go-read-dmesg/...

coverage: testdeps
	./coverage.sh --coveralls

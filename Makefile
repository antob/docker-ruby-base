TAG = 1.0
RUBY_VERSION = 2.3.3
PREFIX = antob/ruby-base

all: build push

build:
	docker build -t $(PREFIX)-$(RUBY_VERSION):$(TAG) .

push:
	docker push $(PREFIX)-$(RUBY_VERSION):$(TAG)

TAG = 1.5
RUBY_VERSION = 2.2.2
PREFIX = antob/ruby-base

all: build push

build:
	docker build -t $(PREFIX)-$(RUBY_VERSION):$(TAG) .

push:
	docker push $(PREFIX)-$(RUBY_VERSION):$(TAG)

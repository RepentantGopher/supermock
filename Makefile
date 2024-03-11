PROJECT=supermock
VERSION=1.3.0

.PHONY: openapi vendor

openapi:
	docker run --rm -i -v "$(PWD):/src" -w /src onrik/gaws:1.6.0 sh -c "gaws -t 'Supermock API' -path=/src > /src/openapi.yml"

build:
	docker build -t $(PROJECT):$(VERSION) .

push:
	docker tag $(PROJECT):$(VERSION) onrik/$(PROJECT):$(VERSION)
	docker tag $(PROJECT):$(VERSION) onrik/$(PROJECT):latest
	docker push onrik/$(PROJECT):$(VERSION)
	docker push onrik/$(PROJECT):latest

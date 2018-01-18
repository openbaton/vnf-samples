%.tar: %/vnfd.json %/Metadata.yaml %/scripts
	@tar -C $(<D) -chvf $@ $(^F)

.PHONY: all
all: client server

.PHONY: client server
client: client.tar
server: server.tar

.PHONY: clean
clean:
	@rm -f *.tar

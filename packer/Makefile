VERSION ?= v2.38.0+rev1
OUTPUT ?= ./output

RAW_DISK = balena-qemux86-64-$(VERSION).img
QEMU_IMG = $(OUTPUT)/balenaos.qcow2
BOX = $(QEMU_IMG:qcow2=box)

all: $(BOX)

import:
	vagrant box add -f \
		--provider libvirt \
		--name balena/os \
		$(BOX)

$(BOX): $(QEMU_IMG)
	@echo $@
	env \
	TMPDIR="/var/tmp" \
	VERSION=$(VERSION) \
	DISK_SHASUM=$(shell sha256sum $< | cut -d' ' -f1) \
		packer build balenaos.json

$(QEMU_IMG): $(RAW_DISK)
	@echo $@
	qemu-img convert -f raw -c -O qcow2 $< $@

$(RAW_DISK):
	balena os download qemux86-64 --version $(VERSION) --output $@

clean:
	rm -rf $(RAW_DISK)
	rm -rf $(QEMU_IMG)
dist-clean:
	rm -rf $(BOX) $(BOX:box=box.sha256)

.PHONY: all clean dist-clean import

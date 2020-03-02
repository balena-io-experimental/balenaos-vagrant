# balenaOS + Vagrant = <3

## ./packer

A packer template generating Vagrant boxes from balenaOS disk images.

### usage

```
$ cd packer
$ make
$ make import
```

This assumes you have balena-cli installed (the makefile will try to download
the disk image for you).

Otherwise you can use `make RAW_DISK=<path to IMG>` to use your own.

## ./vagrant-balenaos

A vagrant plugin that adds support for running balenaOS guests.

### building

```
$ cd vagrant-balenaos
$ bundle install --path vendor/bundle
$ bundle exec rake build
```

### installing

```
$ vagrant plugin install --local /path/to/vagrant-balenaos/pkg/vagrant-balenaos-*.gem
```


### usage

```
$ vagrant init -m balena/os
$ vagrant up
```

Fpm
===

Build image:

	docker build --rm=true --tag=githubenr/fpm .

Usage
-----

Enter in container:

	docker run -it --rm dockerfile/fpm

Run `fpm`:

	docker run -it --rm dockerfile/fpm fpm

**Examples**

You want to create packages for an app with this structure:

```sh
$ ls build/app/
bin  etc  lib  libexec  resources

```

Build deb:

```sh
docker run -it --rm -v `pwd`/build/app:/data githubenr/fpm \
  fpm -s dir -t deb -n myproject -v 0.0.1 --prefix /opt/myproject \
  bin/ etc/ lib/ libexec/
```

Build rpm:

```sh
docker run -it --rm -v `pwd`/build/app:/data githubenr/fpm \
  fpm -s dir -t rpm -n myproject -v 0.0.1 --epoch 0 \
  --prefix /opt/myproject bin/ etc/ lib/ libexec/
```

Final packages will be created in the volume dir:

```sh
$ ls build/app/
bin  etc  lib  libexec  myproject-0.0.1-1.x86_64.rpm
myproject_0.0.1_amd64.deb  resources
```

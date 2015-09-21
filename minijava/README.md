Minimal image containing Oracle Java 8
======================================

Lightweight image for Java based on Alpine.

Build image:

	docker build -f Dockerfile  --rm=true --tag=githubenr/minijava .

Run:

	docker run -it githubenr/minijava java -version
	java version "1.8.0_45"
	Java(TM) SE Runtime Environment (build 1.8.0_45-b14)
	Java HotSpot(TM) 64-Bit Server VM (build 25.45-b02, mixed mode)


Files
-----

- scripts/install-java-oracle.sh : script to download and install Java.

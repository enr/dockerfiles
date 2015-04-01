Minimal image containing Oracle java 8
======================================

Lightweight image for java.

Build image:

	docker build -f Dockerfile  --rm=true --tag=githubenr/minijava .

Run:

	docker run -it githubenr/minijava /opt/java/current/bin/java -version
	java version "1.8.0_31"
	Java(TM) SE Runtime Environment (build 1.8.0_31-b13)
	Java HotSpot(TM) 64-Bit Server VM (build 25.31-b07, mixed mode)

Files
-----

- scripts/install-java-oracle.sh : script to download and install Java.

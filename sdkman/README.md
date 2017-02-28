Alpine, Openjdk 8 and Sdkman
============================

Build image:

	docker build -f Dockerfile  --rm=true --tag=denr/sdkman .

Run:

	docker run -it denr/sdkman java -version

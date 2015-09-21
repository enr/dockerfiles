Asciidoctor
===========

Image containing `asciidoctor`, `asciidoctor-pdf` and `asciidoctor-epub3`.

Build image:

	docker build -f Dockerfile  --rm=true --tag=githubenr/asciidoctor .

Run:

    docker run -it githubenr/asciidoctor asciidoctor --version
    Asciidoctor 1.5.2 [http://asciidoctor.org]
    Runtime Environment (ruby 2.2.1p85 (2015-02-26 revision 49769) [x86_64-linux]) (lc:US-ASCII fs:US-ASCII in:- ex:US-ASCII)
    docker run -it githubenr/asciidoctor asciidoctor-pdf --version
    Asciidoctor PDF 1.5.0.alpha.9 using Asciidoctor 1.5.2 [http://asciidoctor.org]
    Runtime Environment (ruby 2.2.1p85 (2015-02-26 revision 49769) [x86_64-linux]) (lc:US-ASCII fs:US-ASCII in:- ex:US-ASCII)

The container expects asciidoctor docs in /documents/:

    docker run -it --rm -v $PWD:/documents/ githubenr/asciidoctor asciidoctor -b html5 index.adoc
    docker run -it --rm -v $PWD:/documents/ githubenr/asciidoctor asciidoctor-pdf index.adoc

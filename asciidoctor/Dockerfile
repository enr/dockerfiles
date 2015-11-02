FROM ruby

RUN gem install --no-ri --no-rdoc asciidoctor --version 1.5.3
RUN gem install --no-ri --no-rdoc asciidoctor-diagram --version 1.3.1 && \
    gem install --no-ri --no-rdoc asciidoctor-epub3 --version 1.5.0.alpha.5 && \
    gem install --no-ri --no-rdoc asciidoctor-pdf --version 1.5.0.alpha.10

RUN mkdir /documents
WORKDIR /documents
VOLUME /documents

CMD ["/bin/bash"]

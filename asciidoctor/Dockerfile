FROM ruby

RUN gem install --no-ri --no-rdoc asciidoctor --version 1.5.4
RUN gem install --no-ri --no-rdoc asciidoctor-diagram --version 1.3.1 && \
    gem install --no-ri --no-rdoc asciidoctor-epub3 --version 1.5.0.alpha.6 && \
    gem install --no-ri --no-rdoc asciidoctor-pdf --version 1.5.0.alpha.11

RUN mkdir /documents
WORKDIR /documents
VOLUME /documents

CMD ["/bin/bash"]

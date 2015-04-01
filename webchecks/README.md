Docker container for web checks
===============================

Build image:

    docker build --rm=true --tag=githubenr/webchecks .

To see installed tools:

    docker run -it githubenr/webchecks

Output will be something similar to:

    --- Tool node
    /nodejs/bin/node
    v0.12.2

    --- Tool npm
    /nodejs/bin/npm
    2.7.4

    --- Tool pageres
    /home/node/npm/bin/pageres
    1.2.2

    --- Tool phantom-check
    /home/node/npm/bin/phantom-check
    1.1.0-beta3

    --- Tool tmi
    /home/node/npm/bin/tmi
    1.0.2

    --- Tool psi
    /home/node/npm/bin/psi
    1.0.6

    --- Tool phantomjs
    /home/node/npm/bin/phantomjs
    1.9.8

    --- Tool casperjs
    /home/node/npm/bin/casperjs
    1.1.0-beta3

    --- Tool dnc
    /home/node/npm/bin/dnc

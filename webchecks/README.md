# Docker container for web checks

Installed tools:

- [dnc](https://www.npmjs.com/package/dnc): CLI tool to check domain names configuration and statistics
- [tmi](https://www.npmjs.com/package/tmi): Discover your image weight on the web
- [psi](https://www.npmjs.com/package/psi): PageSpeed Insights with reporting

Build image:

    docker build --rm=true --tag=denr/webchecks .

To see installed tools:

    docker run -it denr/webchecks

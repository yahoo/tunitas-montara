# Tunitas Montara

A Northbound API server for the IAB Privacy Chain.

## Table of Contents

- [Background](#background)
- [Build](#build)
- [Usage](#usage)
- [API](#api)
- [Security](#security)
- [References](#references)
- [Contribute](#contribute)
- [License](#license)

## Background

The Montara service is a member of the Tunitas famiy of  of the Tunitas. It depends upon the the other core components of the Tunitas family.  These are
  * [Tunitas Basics](https://github.com/yahoo/tunitas-basics) package for core components.
  * [Temerarious Flagship](https://github.com/yahoo/temerarious-flagship), the build system

## Build

The service can be built with the following recipe:

``` bash
./buildconf &&
./configure &&
make &&
make check &&
make install &&
echo OK DONE
```

Alternatively, if your organization already has made available the packaged version, then the following recipe will install the service:

``` bash
sudo dnf install tunitas-montara
```

## Usage

The configuration of the service is through the systemd unit files which are supplied.

``` bash
systemctl enable montara-service
systemctl start montara-service
```

## API

The Montara service implements the [IAB PrivacyChain](https://github.com/Interactive-Advertising-Bureau/PrivacyChain) "Northbound" REST API.  The specifics of the API in this implementation are documented nearby in the [REST-API](https://github.com/yahoo/tunitas-montara/blob/master/REST-API.md).

## Security

The Montara service is intended to facilitate database to the PrivacyChain database. It is intended to be operated from within secure facilities in support of consumer-facing applications.  It is _not_ intended for direct exposure to the internet.  Best practices for intra-datacenter (micro-)service secure options are expected.  These include the use of TLS and controled access networks.

## References

### IAB PrivacyChain

The [IAB PrivacyChain](https://github.com/InteractiveAdvertisingBureau/PrivacyChain) governance and a separate reference implementation are available at the main site.

### On the Origin of the Name

Montara is a place in San Mateo County, California.  There is a mountain and a state beach which carry the name. [Wikipedia](https://en.wikipedia.org/wiki/Montara,_California).

## Contribute

Please refer to [the contributing.md file](Contributing.md) for information about how to get involved. We welcome issues, questions, and pull requests. Pull Requests are welcome.

## Maintainers
Wendell Baker <wbaker@verizonmedia.com>

## License

This project is licensed under the terms of the [Apache 2.0](LICENSE-Apache-2.0) open source license. Please refer to [LICENSE](LICENSE) for the full terms.

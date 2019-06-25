# Tunitas Montara

This repository contains a reference implementation of the "North-Facing" API Service for the Interactive Advertising Bureau's (IAB) [PrivacyChain](https://github.com/InteractiveAdvertisingBureau/PrivacyChain). It is an an application hosted within the <em>httpserver</em> surface of [microhttpd](https://www.gnu.org/software/libmicrohttpd/).  As such, it is a "<em>micro</em>service" approach to delivering the north-facing API services.

The main body of documentation for the Tunitas family of components and services can be found with the [packaging](https://github.com/yahoo/tunitas-packaging) and with [build system](https://github.com/yahoo/temerarious-flagship]).  The overview and administrative declarations herein are necessarily summary in nature. The declarations and definitions in the packaging and build system areas are complete and should be interpreted as superceding these when the two are in conflict.

## Table of Contents

- [Background](#background)
- [Dependencies](#dependencies)
- [Installation](#installation)
- [Configuration](#configuration)
- [Build](#build)
- [Usage](#usage)
- [References](#references)
- [Security](#security)
- [Contribute](#contribute)
- [License](#license)
- [Origin of the Name](#Origin_of_the_name)

## Background

The Montara service is a member of the Tunitas family of components and services. It depends upon certain other core components of the Tunitas family.  These are:
  * [Tunitas Basics](https://github.com/yahoo/tunitas-basics) package for core components.
  * [Tunitas Butano](https://github.com/yahoo/tunitas-butano) package of components for the IAB's Transparency & Consent Framework.
  * [Temerarious Flagship](https://github.com/yahoo/temerarious-flagship), the build system

* [Design Changes](https://git.ouroath.com/tunitas/montara/blob/master/doc/Design-Changes.md)
* [The Data Types](https://git.ouroath.com/tunitas/montara/blob/master/doc/Data-Types.md)
* [The Response Codes](https://git.ouroath.com/tunitas/montara/blob/master/doc/Response-Codes.md)
* [The REST API Endpoints](https://git.ouroath.com/tunitas/montara/blob/master/doc/REST-Endpoints.md)

## Dependencies

The [configuration](#configuration) step will check for many but not all required packages and operating system features.  There is a list of known [package-dependencies](https://github.com/yahoo/tunitas-montara/blob/master/PACKAGES.md) which you will need to install beyond your base operating system.

Generally, the dependencies are among:
- Certain other components of the Tunitas system; <em>e.g.</em> the [Basic Components](https://github.com/yahoo/tunitas-basic).
- A modern (C++2a) development environment.
- A recent Fedora, but any recent Linux distro should suffice.

The Tunitas project was developed on Fedora 27 through Fedora 30 using GCC 7 and GCC 8 with `-fconcepts` and at least `-std=c++1z`.  More details on the development environment and the build system can be found in [temerarious-flagship](https://github.com/yahoo/temerarious-flagship/blob/master/README.md).

## Installation

You may install this repo and its dependents by running the following command:

``` bash
git clone https://github.com/yahoo/tunitas-montara.git
```

This will create a directory called `tunitas-montara` and download the contents of this repo to it.

Alternatively, if your organization already has made available the packaged version, then the following recipe will install the service:

``` bash
sudo dnf install tunitas-montara
```

## Configuration

The build system is based upon [GNU Autotools](https://www.gnu.org/software/automake/manual/html_node/index.html).

The configuration of the repo consists of two steps which must be done once.
1. `./buildconf`
2. `./configure`

The first step performs some crude assessments of the build environment and creates the site-specific `configure'. Of course `configure --help` will explain the build options.  The general options to `configure` are widely [documented](https://www.gnu.org/prep/standards/html_node/Configuration.html).

The `buildconf` component is boilerplate and can be updated from [temerarious-flagship](https://github.com/yahoo/temerarious-flagship/blob/master/bc/template.autotools-buildconf) as needed.  The [Tunitas Build System](https://github.com/yahoo/temerarious-flagship) should be available in `/opt/tunitas` and the template at `/opt/tunitas/share/temerarious-flagship/bc/template.autotools-buildconf`

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
systemctl enable montara
systemctl start montara
```

## References

### IAB PrivacyChain

The authoritative specification can be found the IAB as [REST-API](https://github.com/Interactive-Advertising-Bureau/PrivacyChain/blob/master/doc/REST-API.md). Documents pertaining to the the [IAB PrivacyChain](https://github.com/InteractiveAdvertisingBureau/PrivacyChain) operation and governance as well as a separate reference implementation of the Technology Specification are available at the [main site](https://github.com/InteractiveAdvertisingBureau).

### API

The Montara service implements the [IAB PrivacyChain](https://github.com/Interactive-Advertising-Bureau/PrivacyChain) "Northbound" REST API.  The specifics of the API in this implementation are documented nearby in the [REST-API](https://github.com/yahoo/tunitas-montara/blob/master/REST-API.md).

### Server Containers

* [etr/libhttpserver](https://github.com/etr/libhttpserver)
* [microhttpd](https://www.gnu.org/software/libmicrohttpd/)
* [libmicrohttpd](https://git.gnunet.org/libmicrohttpd.git), forked as [libmicrohttpd](https://github.com/scottjg/libmicrohttpd)

## Security

The Montara service is intended to facilitate access to a data base technology which conforms to the IAB's PrivacyChain Technology Specification. It is intended to be operated from within secure facilities in support of consumer-facing applications.  It is _not_ intended for direct exposure to the internet.  Best practices for intra-datacenter (macro-)service secure options are expected.  These practices include at least the use of TLS and controled access networks.

## Contribute

Please refer to [the contributing.md file](Contributing.md) for information about how to get involved. We welcome issues, questions, and pull requests. Pull Requests are welcome.

## Maintainers
- Wendell Baker <wbaker@verizonmedia.com>
- The Tunitas Team at Verizon Media.

You may contact us at least at <tunitas@verizonmedia.com>

## License

This project is licensed under the terms of the [Apache 2.0](LICENSE-Apache-2.0) open source license. Please refer to [LICENSE](LICENSE) for the full terms.

## Origin of the Name

Montara is a place in San Mateo County, California.  There is a mountain and a state beach which carry the name. [Wikipedia](https://en.wikipedia.org/wiki/Montara,_California).

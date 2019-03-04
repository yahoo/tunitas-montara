# Design Changes

## Subscription API

* The subscription API is not implemented and is considered deprecated.  It will not appear in future versions of the API..

## Notifications Subsystem

* The notification subsystem will not be part of the PrivacyChain database.

## Find by Entity

* The _Find By Entity_ aspects API is implemented for small databases in this reference implementation.
* It is _unspecified_ whether the service, even this reference implementation, produces a document containing all possible such records in a streaming fashion or it truncates the output after some finite amount of time.  

## Create by Array or List

* These interfaces are deprecated and will not appear in future versions of the API.
* These interfaces are defined to have the semantic of the repeated invocation of the corresponding singleton `POST` operation.


[comment]: <> (this is really -*- markdown -*-)

IAB PrivacyChain after Montara Mountain

## Overview

The PrivacyChain specification is documented in the [IAB PrivacyChain Specification](https://github.com/InteractiveAdvertisingBureau/PrivacyChain). There is a reference implementation therein which is based on Java.  This is the C++2a implementation which uses ModulesTS.

## The REST API of PrivacyChain

`POST /consent` Add a new consent record to the chain.

{id}{consentType}{entity}{expires}{attributes}{status}

`PUT /consent/{consentId} Update an existing consent.

{id}{consentType}{entity}{expires}{attributes}{status}

`POST /consent/createWithArray` Create multiple consents with given input array.

{id}{consentType}{entity}{expires}{attributes}{status}

`POST /consent/createWithList` Create multiple consents with the input list.

{id}{consentType}{entity}{expires}{attributes}{status}

`GET /consent/findIdsByEntity` Find consent IDs by entity.

`GET /consent/{consentId}` Find consent by consent ID.

{id}{consentType}{entity}{expires}{attributes}{status}

`POST /consent/revokeWithArray` Revoke multiple consent records.

`POST /consent/revokeWithList` Revoke multiple consent records.

`POST /consent/revoke/{consentId}` Revoke single consent record

`POST /datatransfer Log data transfer action

{id}{consentId}{source}{destination}{attributes}{status}

`PUT /datatransfer` Update an existing data transfer

{id}{consentId}{source}{destination}{attributes}{status}

`POST /datatransfer/createWithArray` Create data transfers with given input array.

{id}{consentId}{source}{destination}{attributes}{status}

`POST /datatransfer/createWithList` Create data transfer with given input list.

{id}{consentId}{source}{destination}{attributes}{status}

`GET /datatransfer/findByConsentID` Find data transfers by consent ID.

{id}{consentId}{source}{destination}{attributes}{status}

`GET /datatransfer/{datatransferId}` Find data transfer by data transfer ID.

{consentId}{source}{destination}{attributes}{status}	GET	

`POST /subscription` Subscribe to notifications for all events related to a consent record.

{id}{consentId}{entity}{subscriptionDate}{email}{status}

`GET /subscription/findByEntity` Return subscriptions for an entity.

`GET /subscription/{subscriptionId}` Find subscription by subscription ID

`PUT /subscription/{subscriptionId}` Update subscription by subscription ID

`DELETE /subscription/{subscriptionId}` Delete subscription by subscription ID.

# On the Origin of the Name

Montara is a place in San Mateo County, California.  There is a mountain and a state beach which carry the name. [Wikipedia](https://en.wikipedia.org/wiki/Montara,_California).

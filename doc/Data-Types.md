# The Data Types

## Identifiers

An identifier is the primary key of a record type.

* `{id}` is a 64-bit integer coded in decimal.

When used in a reference context, it is prefixed with the name of the data type being referenced:

 * `{consentId}` an identifier which references a consent record.
 * `{transferId}` an identifier which references a (data) transfer record.
 * `{subscriptionId}` an identifier which references a (data) transfer record.

## Names

A name is the cultural denotation of a legal entity, a structure such as an organization or corporation to which a granted consent may be received.

So thus an _entity_ is not freeform text,
but rather is a {{vendorId}}
as recorded in the IAB Transparency & Consent Framework's Global Vendor List (GVL)
Clarify.

* `{entity}` is _something_ that references an _entity_.

The general intent is that the referenced _entity_ is the canonical legal name of a governed organizaiton operating withn a covered jurisdication.  An _entity_ is not expected to be the referencable name of a natural person.

Matching, as known to the PrivacyChain service, is exact (`operator==` is numerical or lexicographic equality).  The values expressible in an `{entity}` are those expressible in a JSON string, _i.e._ UTF-8 and of "reasonable" length. 

## Dates

* `{expires}` is a date denominated in seconds since The Epoch (1970-01-01T00:00:00 UTC).

Dates are therefore expressed as decimal integers, assuming a 64-bit underlying integer type.

## Attributes

* `{attributes}` is a representation of the Transparency & Consent Framework (TCF) object.

The preferred encoding of TCF is as a string as if it were to be transmitted an HTTP header, an HTML4 Cookie, or over IAB's OpenRTB.  

Alternatively:

The _attributes_ may or may not be stored by a conforming implementation.
The current implementation does not guarantee to store the values.
Of course, there is an implementation-specified limit on the size of the attributes that can be stored in any implementation.

## Status

* `{status}` is an indication of the status of a record.
 * good status
 * bad status

The universe of values available for `{status}` is unspecified.
The following values are assumed

* `true`, `1` implies that the record is valid, that such consent has been asserted.
* `false`, `0` impiles that the record is invalid, that the consent has been _revoked_.

There is no meaningful semantic difference between an absent consent record and a revoked consent record.

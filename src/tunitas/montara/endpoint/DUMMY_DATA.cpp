// This is -*- c++ -*- (as close to C++2a as possible)
#include "tunitas.montara.endpoint"
using namespace tunitas::montara::endpoint;
#include "tunitas.montara.endpoint.Consent_CreateWithArray"
#include "tunitas.montara.endpoint.Consent_CreateWithList"
#include "tunitas.montara.endpoint.Consent_FindIdentifiersByEntity"
std::string const Consent_FindIdentifiersByEntity::DUMMY_DATA{"dummy-consent-identifier-found-by-entity"};
#include "tunitas.montara.endpoint.Consent_RevokeWithArray"
#include "tunitas.montara.endpoint.Consent_RevokeWithList"
#include "tunitas.montara.endpoint.Consent_Revoke_Identifier"
#include "tunitas.montara.endpoint.Transfer_CreateWithArray"
#include "tunitas.montara.endpoint.Transfer_CreateWithList"
#include "tunitas.montara.endpoint.Transfer_FindByConsentIdentifier"
std::string const Transfer_FindByConsentIdentifier::DUMMY_DATA{"dummy-datatransfer-found-by-consent-identifier"};
#include "tunitas.montara.endpoint.Subscription_FindByEntity"
std::string const Subscription_FindByEntity::DUMMY_DATA{"dummy-subscription-found-by-entity"};



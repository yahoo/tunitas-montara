// This is -*- c++ -*- (as close to C++2a as possible)
#include "tunitas.montara.endpoint"
using namespace tunitas::montara::endpoint;
#include "tunitas.montara.endpoint.Consent"
#include "tunitas.montara.endpoint.Consent_CreateWithArray"
#include "tunitas.montara.endpoint.Consent_CreateWithList"
#include "tunitas.montara.endpoint.Consent_FindIdentifiersByEntity"
std::string const Consent_FindIdentifiersByEntity::DUMMY_DATA{"dummy-consent-identifier-found-by-entity"};
#include "tunitas.montara.endpoint.Consent_Identifier"
#include "tunitas.montara.endpoint.Consent_RevokeWithArray"
#include "tunitas.montara.endpoint.Consent_RevokeWithList"
#include "tunitas.montara.endpoint.Consent_Revoke_Identifier"
#include "tunitas.montara.endpoint.Datatransfer"
#include "tunitas.montara.endpoint.Datatransfer_CreateWithArray"
#include "tunitas.montara.endpoint.Datatransfer_CreateWithList"
#include "tunitas.montara.endpoint.Datatransfer_FindByConsentIdentifier"
std::string const Datatransfer_FindByConsentIdentifier::DUMMY_DATA{"dummy-datatransfer-found-by-consent-identifier"};
#include "tunitas.montara.endpoint.Datatransfer_Identifier"
std::string const Datatransfer_Identifier::DUMMY_DATA{"dummy-datatransfer-by-identifier"};
#include "tunitas.montara.endpoint.Subscription"
#include "tunitas.montara.endpoint.Subscription_FindByEntity"
std::string const Subscription_FindByEntity::DUMMY_DATA{"dummy-subscription-found-by-entity"};
#include "tunitas.montara.endpoint.Subscription_Identifier"
std::string const Subscription_Identifier::DUMMY_DATA{"dummy-subscription-by-identifier"};


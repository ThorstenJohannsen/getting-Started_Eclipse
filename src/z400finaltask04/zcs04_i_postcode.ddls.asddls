@AbapCatalog.sqlViewName: 'Z04_PLZ'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View für Postcode'
@Metadata.ignorePropagatedAnnotations: true
define view ZCS04_I_Postcode as select from zcs04_plz
{
    key postcode as Postcode,
    city as City,
    country as Country
}

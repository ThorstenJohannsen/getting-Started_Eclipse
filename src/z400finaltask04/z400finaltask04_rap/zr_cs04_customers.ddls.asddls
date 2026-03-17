@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZCS04_CUSTOMERS'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_CS04_CUSTOMERS
  as select from zcs04_customers as Customers
{
  key customerid as Customerid,
  salutation as Salutation,
  last_name as LastName,
  first_name as FirstName,
  street as Street,
  city as City,
  @Consumption: {
    valueHelpDefinition: [ {
      entity.element: 'Country', 
      entity.name: 'I_Country', 
      useForValidation: true
    } ]
  }
 
  country as Country,
@Consumption.valueHelpDefinition: [{
    entity: {
        name: 'ZCS04_I_Postcode', // Die Wertehilfe-Entität
        element: 'Postcode'    // Das Hauptfeld in der Wertehilfe
    },
    // Hier können mehrere Elemente gemappt werden
    additionalBinding: [
//        { localElement: 'Postcode', element: 'Postcode', usage: #FILTER_AND_RESULT },
        { localElement: 'City', element: 'City', usage: #RESULT },
        { localElement: 'Country', element: 'Country', usage: #RESULT }
    ]
}]
  postcode as Postcode,
  @Semantics.user.createdBy: true
  @UI.hidden: true
  created_by as CreatedBy,
  @Semantics.systemDateTime.createdAt: true
  @UI.hidden: true
  created_at as CreatedAt,
  @Semantics.user.localInstanceLastChangedBy: true
  @UI.hidden: true
  local_last_changed_by as LocalLastChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  @UI.hidden: true
  local_last_changed_at as LocalLastChangedAt,
  @Semantics.systemDateTime.lastChangedAt: true
  @UI.hidden: true
  last_changed_at as LastChangedAt
}

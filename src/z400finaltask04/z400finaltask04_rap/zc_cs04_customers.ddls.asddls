@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@EndUserText: {
  label: '###GENERATED Core Data Service Entity'
}
@ObjectModel: {
  sapObjectNodeType.name: 'ZCS04_CUSTOMERS'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_CS04_CUSTOMERS
  provider contract transactional_query
  as projection on ZR_CS04_CUSTOMERS
  association [1..1] to ZR_CS04_CUSTOMERS as _BaseEntity on $projection.Customerid = _BaseEntity.Customerid
{
  key Customerid,
  Salutation,
  LastName,
  FirstName,
  Street,
//  @Consumption.valueHelpDefinition: [{
//    entity: {
//        name: 'ZCS04_I_Postcode', // Die Wertehilfe-Entität
//        element: 'City'    // Das Hauptfeld in der Wertehilfe
//    },
//    // Hier können mehrere Elemente gemappt werden
//    additionalBinding: [
//        { localElement: 'Postcode', element: 'Postcode', usage: #RESULT },
////        { localElement: 'City', element: 'City', usage: #RESULT },
//        { localElement: 'Country', element: 'Country', usage: #RESULT }
//    ]
//}]
  City,
  @Consumption: {
    valueHelpDefinition: [ {
      entity.element: 'Country', 
      entity.name: 'I_Country', 
      useForValidation: true
    } ]
  }
 
  Country,
  @Consumption.valueHelpDefinition: [{
    entity: {
        name: 'ZCS04_I_Postcode', // Die Wertehilfe-Entität
        element: 'Postcode'    // Das Hauptfeld in der Wertehilfe
    },
    // Hier können mehrere Elemente gemappt werden
    additionalBinding: [
//        { localElement: 'Postcode', element: 'Postcode', usage: #FILTER_AND_RESULT },
        { localElement: 'City', element: 'City', usage: #RESULT },
        { localElement: 'Country', element: 'Country', usage: #RESULT } ]

}]
  Postcode,
  @Semantics: {
    user.createdBy: false
  }
  @UI.hidden: true
  CreatedBy,
  @Semantics: {
    systemDateTime.createdAt: false
  }
  @UI.hidden: true
  CreatedAt,
  @Semantics: {
    user.localInstanceLastChangedBy: false
  }
  @UI.hidden: true
  LocalLastChangedBy,
  @Semantics: {
    systemDateTime.localInstanceLastChangedAt: false
  }
  @UI.hidden: true
  LocalLastChangedAt,
  @Semantics: {
    systemDateTime.lastChangedAt: false
  }
  @UI.hidden: true
  LastChangedAt,
  _BaseEntity
}

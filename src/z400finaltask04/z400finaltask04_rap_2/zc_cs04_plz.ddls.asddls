@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'ZCS04_PLZ'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_CS04_PLZ
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_CS04_PLZ
  association [1..1] to ZR_CS04_PLZ as _BaseEntity on $projection.POSTCODE = _BaseEntity.POSTCODE
{
  key Postcode,
  City,
  Country,
  @Semantics: {
    User.Createdby: true
  }
  CreatedBy,
  @Semantics: {
    Systemdatetime.Createdat: true
  }
  CreatedAt,
  @Semantics: {
    User.Localinstancelastchangedby: true
  }
  LocalLastChangedBy,
  @Semantics: {
    Systemdatetime.Localinstancelastchangedat: true
  }
  LocalLastChangedAt,
  @Semantics: {
    Systemdatetime.Lastchangedat: true
  }
  LastChangedAt,
  _BaseEntity
}

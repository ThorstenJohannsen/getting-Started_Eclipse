*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lcl_KDVerw DEFINITION.

  PUBLIC SECTION.
    CLASS-DATA conn_counter TYPE i READ-ONLY.

    METHODS constructor
      IMPORTING
                li_customer_id TYPE zcs04_customers-customerid
      RAISING   cx_abap_invalid_value.

    METHODS get_output RETURNING VALUE(rv_output) TYPE string_table.

  PROTECTED SECTION.

  PRIVATE SECTION.

    TYPES BEGIN OF st_kd_details.
    TYPES customerid TYPE zcs04_customers-customerid.
    TYPES salutation TYPE zcs04_customers-salutation.
    TYPES first_name TYPE zcs04_customers-first_name.
    TYPES last_name TYPE zcs04_customers-last_name.
    TYPES postcode TYPE zcs04_customers-postcode.
    TYPES street TYPE zcs04_customers-street.
    TYPES city TYPE zcs04_customers-city.
    types country Type zcs04_customers-country.
    TYPES END OF st_kd_details.

    DATA details TYPE st_kd_details.

ENDCLASS.

CLASS lcl_kdverw IMPLEMENTATION.

  METHOD constructor.
    IF li_customer_id IS INITIAL.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ELSE.


        SELECT SINGLE FROM zcs04_customers
           FIELDS customerid, salutation, first_name, last_name, postcode,
                  street, city, country
           WHERE customerid = @li_customer_id
           INTO CORRESPONDING FIELDS OF @details.

        IF sy-subrc <> 0.
          RAISE EXCEPTION TYPE cx_abap_invalid_value.
        ENDIF.
        conn_counter = conn_counter + 1.
    ENDIF.
  ENDMETHOD.

  METHOD get_output.
    APPEND |------------------------------------| TO rv_output.
    APPEND |KDNr    : { details-customerid }| TO rv_output.
    APPEND |Anrede  : { details-salutation }| TO rv_output.
    APPEND |Vorname : { details-first_name }| TO rv_output.
    APPEND |Nachname: { details-last_name }| TO rv_output.
    APPEND |Straße  : { details-street }| TO rv_output.
    APPEND |PLZ     : { details-postcode }| TO rv_output.
    APPEND |Stadt   : { details-city } | TO rv_output.
    APPEND |Land    : { details-country } | TO rv_output.

  ENDMETHOD.

ENDCLASS.

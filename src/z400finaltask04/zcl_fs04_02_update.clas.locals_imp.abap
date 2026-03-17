*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lcl_KDVerw DEFINITION.

  PUBLIC SECTION.
    DATA customer_id TYPE zcs04_customers-customerid.
    DATA first_name TYPE zcs04_customers-first_name.
    DATA last_name TYPE zcs04_customers-last_name.
    DATA salutation TYPE zcs04_customers-salutation.
    DATA postcode TYPE zcs04_customers-postcode.
    DATA street TYPE zcs04_customers-street.
    DATA city TYPE zcs04_customers-city.
    DATA country TYPE zcs04_customers-country.

*METHODS constructor
*      IMPORTING
*                li_customer_id TYPE zcs04_customers-customerid
*      RAISING   cx_abap_invalid_value.


    METHODS get_data
      IMPORTING
                i_customer_id TYPE zcs04_customers-customerid
                i_first_name  TYPE zcs04_customers-first_name
                i_last_name   TYPE zcs04_customers-last_name
                i_salutation  TYPE zcs04_customers-salutation
                i_postcode    TYPE zcs04_customers-postcode
                i_street      TYPE zcs04_customers-street
                i_city        TYPE zcs04_customers-city
                i_country     TYPE zcs04_customers-country
      RAISING   cx_abap_invalid_value.

  PROTECTED SECTION.

  PRIVATE SECTION.
*    DATA i_customer_id TYPE zcs04_customers-customerid.
*    DATA i_first_name TYPE zcs04_customers-first_name.
*    DATA i_last_name TYPE zcs04_customers-last_name.
*    DATA i_salutation TYPE zcs04_customers-salutation.
*    DATA i_postcode TYPE zcs04_customers-postcode.
*    DATA i_street TYPE zcs04_customers-street.
*    DATA i_city TYPE zcs04_customers-city.
*    DATA i_country TYPE zcs04_customers-country.

ENDCLASS.

CLASS lcl_kdverw IMPLEMENTATION.




  METHOD get_data.

    IF i_customer_id IS INITIAL.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ELSE.
     customer_id = i_customer_id.
     first_name = i_first_name.
     last_name = i_last_name.
     salutation = i_salutation.
     postcode = i_postcode.
     street = i_street.
     city = i_city.
     country = i_country.
    ENDIF.


  ENDMETHOD.

*  METHOD constructor.
*     IF li_customer_id IS INITIAL.
*      RAISE EXCEPTION TYPE cx_abap_invalid_value.
*    ELSE.
*     customer_id = li_customer_id.
*    ENDIF.
*  ENDMETHOD.

ENDCLASS.

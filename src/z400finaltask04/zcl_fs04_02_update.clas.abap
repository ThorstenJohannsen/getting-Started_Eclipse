CLASS zcl_fs04_02_update DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_fs04_02_update IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA lt_customers TYPE zcs04_customers.
    DATA customers TYPE REF TO lcl_kdverw.
    DATA connections TYPE TABLE OF REF TO lcl_kdverw.

    DATA lv_nr TYPE i.

    DATA c_id TYPE string.
    DATA lx_invalid_value TYPE REF TO cx_abap_invalid_value.
    DATA customer_id TYPE zcs04_customers-customerid.
    DATA first_name TYPE zcs04_customers-first_name.
    DATA last_name TYPE zcs04_customers-last_name.
    DATA salutation TYPE zcs04_customers-salutation.
    DATA postcode TYPE zcs04_customers-postcode.
    DATA street TYPE zcs04_customers-street.
    DATA city TYPE zcs04_customers-city.
    DATA country TYPE zcs04_customers-country.


    lt_customers-customerid = '000006'.
    lt_customers-street = 'Kultur Allee 6'.
    lt_customers-first_name = 'Ava Sophi'.
    lt_customers-city = 'Wedel'.
    lt_customers-postcode = '22536'.
    lt_customers-salutation = 'Frau'.
    lt_customers-last_name = 'Göben'.
    lt_customers-country = 'DE'.

    UPDATE zcs04_customers from @lt_customers.

    CLEAR lt_customers.
    lt_customers-customerid = '000007'.
    lt_customers-street = 'Bauhofstrasse 7'.
    lt_customers-first_name = 'Jola'.
    lt_customers-city = 'Wedel'.
    lt_customers-postcode = '22536'.
    lt_customers-salutation = 'Frau'.
    lt_customers-last_name = 'Göben'.
    lt_customers-country = 'DE'.

    UPDATE zcs04_customers FROM @( CORRESPONDING #( lt_customers ) ).

    CLEAR lt_customers.
    lt_customers-customerid = '000008'.
    lt_customers-street = 'Kleine Strasse 8'.
    lt_customers-first_name = 'Kira Kiki'.
    lt_customers-city = 'Wedel'.
    lt_customers-postcode = '22536'.
    lt_customers-salutation = 'Frau'.
    lt_customers-last_name = 'Göben'.
    lt_customers-country = 'DE'.

    UPDATE zcs04_customers FROM @( CORRESPONDING #( lt_customers ) ).

    CLEAR lt_customers.
    lt_customers-customerid = '000009'.
    lt_customers-street = 'Große Strasse 8'.
    lt_customers-first_name = 'Vanessa'.
    lt_customers-city = 'Wedel'.
    lt_customers-postcode = '22536'.
    lt_customers-salutation = 'Frau'.
    lt_customers-last_name = 'Göben'.
    lt_customers-country = 'DE'.

    UPDATE zcs04_customers FROM @( CORRESPONDING #( lt_customers ) ).

    CLEAR lt_customers.
    lt_customers-customerid = '000001'.
    lt_customers-street = 'Rosenhofstrasse 1'.

    UPDATE zcs04_customers set street = @lt_customers-street
            WHERE customerid = @lt_customers-customerid.

    CLEAR lt_customers.
    lt_customers-customerid = '000002'.
    lt_customers-street = 'Rosenhofstrasse 1'.

    UPDATE zcs04_customers set street = @lt_customers-street
            WHERE customerid = @lt_customers-customerid.

    CLEAR lt_customers.
    lt_customers-customerid = '000003'.
    lt_customers-street = 'An der Schleuse 3'.

   UPDATE zcs04_customers set street = @lt_customers-street
            WHERE customerid = @lt_customers-customerid.

    CLEAR lt_customers.
    lt_customers-customerid = '000004'.
    lt_customers-street = 'Hunde Allee 4'.

   UPDATE zcs04_customers set street = @lt_customers-street
            WHERE customerid = @lt_customers-customerid.

     CLEAR lt_customers.
    lt_customers-customerid = '000005'.
    lt_customers-street = 'Hunde Allee 4'.

    UPDATE zcs04_customers set street = @lt_customers-street
            WHERE customerid = @lt_customers-customerid.


  ENDMETHOD.
ENDCLASS.

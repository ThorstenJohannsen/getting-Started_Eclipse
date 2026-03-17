CLASS zcl_fs04_01insert DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_fs04_01insert IMPLEMENTATION.


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

    CLEAR lv_nr.

*    DO 9 TIMES.
*
*      lv_nr += 1.
*      c_id = '00000' && lv_nr.
*      DELETE FROM zcs04_customers WHERE customerid = @c_id.
*
*    ENDDO.
*    DELETE FROM zcs04_customers WHERE customerid = '000000'.
*
*    RETURN.

    DO 5 TIMES.
      lv_nr += 1.

      lt_customers-customerid = '00000' && lv_nr.
      lt_customers-street = 'Musterstrasse' && lv_nr.
      lt_customers-last_name = 'Johannsen'.
      lt_customers-country = 'DE'.

      IF lv_nr = 1.
        lt_customers-first_name = 'Thorsten'.
        lt_customers-salutation = 'Herr'.
        lt_customers-city = 'Hamburg'.
        lt_customers-postcode = '20357'.
      ELSEIF lv_nr = 2.
        lt_customers-first_name = 'Trini'.
        lt_customers-salutation = 'Frau'.
        lt_customers-city = 'Hamburg'.
        lt_customers-postcode = '20357'.
      ELSEIF lv_nr = 3.
        lt_customers-first_name = 'Nils'.
        lt_customers-salutation = 'Herr'.
        lt_customers-city = 'Brunsbüttel'.
        lt_customers-postcode = '25790'.
      ELSEIF lv_nr = 4.
        lt_customers-first_name = 'Astrid'.
        lt_customers-salutation = 'Frau'.
        lt_customers-city = 'Heide'.
        lt_customers-postcode = '25799'.
      ELSEIF lv_nr = 5.
        lt_customers-first_name = 'Volker'.
        lt_customers-salutation = 'Herr'.
        lt_customers-city = 'Heide'.
        lt_customers-postcode = '25799'.
      ENDIF.

      INSERT INTO zcs04_customers VALUES @lt_customers.

    ENDDO.


*return.

    DO 4 TIMES.
      CREATE OBJECT customers.
      lv_nr += 1.
      TRY.
          customers->get_data(
            EXPORTING
              i_customer_id = '00000' && lv_nr
              i_first_name  = 'Thorsten'
              i_last_name   = 'Johannsen'
              i_salutation  = 'Herr'
              i_postcode    = '20357'
              i_street      = 'Musterstrasse'
              i_city        = 'Hamburg'
              i_country     = 'DE' ).

          APPEND customers TO connections.

        CATCH cx_abap_invalid_value INTO lx_invalid_value.
          out->write( lx_invalid_value->get_text( ) ).
      ENDTRY.
    ENDDO.

    LOOP AT connections INTO customers.
      out->write( customers ).

      "BUHL->
      DATA ls_zcs04_customers TYPE zcs04_customers.
      ls_zcs04_customers-customerid = customers->customer_id.
      ls_zcs04_customers-city = customers->city.
      ls_zcs04_customers-first_name = customers->first_name.
      ls_zcs04_customers-last_name = customers->last_name.
      ls_zcs04_customers-postcode = customers->postcode.
      ls_zcs04_customers-salutation = customers->salutation.
      ls_zcs04_customers-street = customers->street.
      ls_zcs04_customers-country = customers->country.
      INSERT INTO zcs04_customers VALUES @ls_zcs04_customers.
      "BUHL<-


    ENDLOOP.



  ENDMETHOD.
ENDCLASS.

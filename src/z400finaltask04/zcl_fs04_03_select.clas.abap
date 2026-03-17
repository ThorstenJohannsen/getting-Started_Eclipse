CLASS zcl_fs04_03_select DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_fs04_03_select IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
*    DATA lt_customers TYPE zcs04_customers.
    DATA customers TYPE REF TO lcl_kdverw.
    DATA connections TYPE TABLE OF REF TO lcl_kdverw.

    DATA lv_nr TYPE i.

    DATA c_id TYPE c LENGTH 6.
    DATA lx_invalid_value TYPE REF TO cx_root.

    SELECT customerid FROM zcs04_customers ORDER BY customerid INTO TABLE @DATA(kdtable).

    LOOP AT kdtable INTO c_id.
      TRY.
          customers = NEW lcl_kdverw( c_id ).
          APPEND customers TO connections.
        CATCH cx_root INTO lx_invalid_value.
          out->write( lx_invalid_value->get_text( ) ).
      ENDTRY.
    ENDLOOP..

    out->write( |Insgesamt vorhandene Kunden | ).
    out->write( |in der Kundenverwaltung: | && CONV string( lcl_kdverw=>conn_counter ) ).
    LOOP AT connections INTO customers.
      out->write( customers->get_output( ) ).
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.

CLASS zcl_04_konstruktor DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_04_konstruktor IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA connection TYPE REF TO lcl_connection.            "Objektreferenz kann max. ein Objekt referenzieren
    DATA connections TYPE TABLE OF REF TO lcl_connection.  "Collection, kann mehrere Objekte enthalten
    DATA lx_invalid_value TYPE REF TO cx_abap_invalid_value.

    TRY.
        connection = NEW lcl_connection(
          i_carrier_id    = 'TJ'
          i_connection_id = '0001' ).
        APPEND connection TO connections.
      CATCH cx_abap_invalid_value INTO lx_invalid_value.   "Musterlösung!!!
        out->write( lx_invalid_value->get_text( ) ).
    ENDTRY.


    TRY.
        connection = NEW lcl_connection(
          i_carrier_id    = 'TJ'
          i_connection_id = '0002' ).
        APPEND connection TO connections.
      CATCH cx_abap_invalid_value INTO lx_invalid_value.   "Musterlösung!!!
        out->write( lx_invalid_value->get_text( ) ).
    ENDTRY.


    TRY.
        connection = NEW lcl_connection(
          i_carrier_id    = ''
          i_connection_id = '9876' ).
        APPEND connection TO connections.
      CATCH cx_abap_invalid_value INTO lx_invalid_value.   "Musterlösung!!!
        out->write( lx_invalid_value->get_text( ) ).
    ENDTRY.

    TRY.
        connection = NEW lcl_connection(
          i_carrier_id    = 'TJ'
          i_connection_id = '0003' ).
        APPEND connection TO connections.
      CATCH cx_abap_invalid_value INTO lx_invalid_value.   "Musterlösung!!!
        out->write( lx_invalid_value->get_text( ) ).
    ENDTRY.

    out->write( `Anzahl der Flugverbindungen: `  && CONV string( lcl_connection=>conn_counter ) ).   "Optional
    LOOP AT connections INTO connection.
      out->write( connection->get_output( ) ).
    ENDLOOP.



  ENDMETHOD.
ENDCLASS.

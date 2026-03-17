CLASS zcl_04_methods DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_04_methods IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    " Objektreferenz für max. ein Objekt
    DATA connection TYPE REF TO lcl_connection.

    "" Connections kann mehrere Objekte enthalten,
    "" eine Tabelle mit verschiedenen Referenzen
    ""Die Variablen können verschachtelt sein
    DATA connections TYPE TABLE OF REF TO lcl_connection.

    ""Variable für den Fehler
    DATA lx_invalid_value TYPE REF TO cx_abap_invalid_value.

    connection = NEW lcl_connection(  ).

    TRY.
        connection->set_attributes(
          i_carrier_id    = 'TJ'
          i_connection_id = '0001' ).

      APPEND connection TO connections.
      CATCH cx_abap_invalid_value INTO lx_invalid_value.
        out->write( lx_invalid_value->get_text( ) ).
    ENDTRY.

    connection = NEW lcl_connection(  ).

    TRY.
        connection->set_attributes(
          i_carrier_id    = ''
          i_connection_id = '0400' ).

      APPEND connection TO connections.
      CATCH cx_abap_invalid_value INTO lx_invalid_value.
        out->write( lx_invalid_value->get_text( ) ).
    ENDTRY.

    connection = NEW lcl_connection(  ).
    TRY.
        connection->set_attributes(
          i_carrier_id    = 'LH'
          i_connection_id = '0401' ).

      APPEND connection TO connections.
      CATCH cx_abap_invalid_value INTO lx_invalid_value.
        out->write( lx_invalid_value->get_text( ) ).
    ENDTRY.

    connection = NEW lcl_connection(  ).
    TRY.
        connection->set_attributes(
          i_carrier_id    = 'TJ'
          i_connection_id = '0002' ).

      APPEND connection TO connections.
      CATCH cx_abap_invalid_value INTO lx_invalid_value.
        out->write( lx_invalid_value->get_text( ) ).
    ENDTRY.

    LOOP AT connections INTO connection.
      out->write( connection->get_output( ) ).
    ENDLOOP.
    out->write( `Anzahl der Flugverbindungen: `  && conv string( lcl_connection=>conn_counter ) ).   "Optional


  ENDMETHOD.






ENDCLASS.

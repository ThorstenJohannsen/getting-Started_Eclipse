CLASS zcl_04_methods_meine DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_04_methods_meine IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA connection TYPE REF TO lcl_connection.
    DATA connection2 TYPE REF TO lcl_connection.
    DATA connections TYPE TABLE OF REF TO lcl_connection.
    DATA connections2 TYPE TABLE OF REF TO lcl_connection.
    DATA lx_invalid TYPE REF TO cx_abap_invalid_value.
    data lv_nr type i.

    connection = NEW lcl_connection( ).
    "die Variablen carrier_id, connection_id und conn_counter wurden unter
    " 'Local Types' als PUBLIC angelegt
    TRY.
        connection->set_attributes(
                     i_carr_id = 'LH'
                     i_connection_id = '0400' ).
        APPEND connection TO connections.

      CATCH cx_abap_invalid_value INTO lx_invalid.
        out->write( lx_invalid->get_text( ) ).

    ENDTRY.

    connection = NEW #( ).
    TRY.
        connection->set_attributes(
            i_carr_id       = 'TJ'
            i_connection_id = '2603' ).
        APPEND connection TO connections.

      CATCH cx_abap_invalid_value INTO lx_invalid.
        out->write( lx_invalid->get_text( ) ).
    ENDTRY.

    CREATE OBJECT connection.

    TRY.
        connection->set_attributes(
                         i_carr_id = 'TJ'
                         i_connection_id = '9999' ).
        APPEND connection TO connections.

      CATCH cx_abap_invalid_value INTO lx_invalid.
        out->write( lx_invalid->get_text( ) ).

    ENDTRY.

    CREATE OBJECT connection.

    TRY.
        connection->set_attributes(
                         i_carr_id = 'TJ'
                         i_connection_id = '0001' ).
       APPEND connection TO connections.

      CATCH cx_abap_invalid_value INTO lx_invalid.
        out->write( lx_invalid->get_text( ) ).
    ENDTRY.


    connection = NEW #( ).
    TRY.
        connection->set_attributes(
                         i_carr_id = 'TJ'
                         i_connection_id = '0002' ).
        APPEND connection TO connections.

      CATCH cx_abap_invalid_value INTO lx_invalid.
        out->write( lx_invalid->get_text( ) ).
    ENDTRY.

**** output hier gemacht ohne get_output => ist in zcl_04_methods_meine_2 drin!
    LOOP AT connections INTO connection.
      out->write( connection->get_output( ) ).
    ENDLOOP.
    out->write( '-----------------------------------------------' ).
    out->write( `Anzahl der Flugverbindungen: `  && CONV string( lcl_connection=>conn_counter ) ).   "Optional


    LOOP AT connections INTO connection2.
      IF connection2->carrier_id = 'TJ'.
        APPEND connection2 TO connections2.
        lv_nr = lv_nr + 1.
      ENDIF.
    ENDLOOP.
    out->write( '*********************************************' ).
    out->write(  EXPORTING data = connections2
                           name = 'Flugverbindungen mit TJ -->' && CONV string( lv_nr ) ).

  ENDMETHOD.
ENDCLASS.

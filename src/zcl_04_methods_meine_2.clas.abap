CLASS zcl_04_methods_meine_2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_04_methods_meine_2 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  data connection type ref to lcl_connection.
  data connections type table of ref to lcl_connection.
  data lx_invalid type ref to cx_abap_invalid_value.
  data carr_id type /dmo/carrier_id.
  data conn_id type /dmo/connection_id.

  try.
    connection = new #( ).
    carr_id = 'TJ'.
    conn_id = '0001'.
    connection->set_attributes(
                i_carrier_id = carr_id
                i_connection_id = conn_id ).
    append connection to connections.

    catch cx_abap_invalid_value into lx_invalid.
      out->write( lx_invalid->get_text( ) ).
      out->write( | Carrier: { carr_id } Connection: { conn_id } | ).

  endtry.

 try.
    connection = new #( ).
    carr_id = ''.
    conn_id = '0001'.
    connection->set_attributes(
                i_carrier_id = carr_id
                i_connection_id = conn_id ).
    append connection to connections.

    catch cx_abap_invalid_value into lx_invalid.
      out->write( lx_invalid->get_text( ) ).
      out->write( | Carrier: { carr_id } Connection: { conn_id } | ).

  endtry.

   try.
    connection = new #( ).
    carr_id = 'TJ'.
    conn_id = '0000'.
    connection->set_attributes(
                i_carrier_id = carr_id
                i_connection_id = conn_id ).
    append connection to connections.

    catch cx_abap_invalid_value into lx_invalid.
      out->write( lx_invalid->get_text( ) ).
      out->write( | Carrier: { carr_id } Connection: { conn_id } | ).

  endtry.

  try.
    connection = new #( ).
    carr_id = 'TJ'.
    conn_id = '0002'.
    connection->set_attributes(
                i_carrier_id = carr_id
                i_connection_id = conn_id ).
    append connection to connections.

    catch cx_abap_invalid_value into lx_invalid.
      out->write( lx_invalid->get_text( ) ).
      out->write( | Carrier: { carr_id } Connection: { conn_id } | ).

  endtry.

  loop at connections into connection.
     out->write( connection->get_output( ) ).
  endloop.


  ENDMETHOD.
ENDCLASS.

CLASS lcl_connection DEFINITION.
  PUBLIC SECTION.
    DATA carrier_id TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.
    CLASS-DATA conn_counter TYPE i.


    METHODS get_output RETURNING VALUE(r_output) TYPE string_table.

    METHODS set_attributes IMPORTING
                             i_carr_id       TYPE /dmo/carrier_id
                             i_connection_id TYPE /dmo/connection_id
                           RAISING
                             cx_abap_invalid_value.


  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_connection IMPLEMENTATION.

  METHOD get_output.
    APPEND |------------------------------------| TO r_output.
    APPEND |Carrier: { carrier_id }| TO r_output.
    APPEND |Connection: { connection_id }| TO r_output.

  ENDMETHOD.

  METHOD set_attributes.
    IF i_carr_id IS not INITIAL OR i_connection_id IS not INITIAL.
      carrier_id = i_carr_id.
      connection_id = i_connection_id.
      conn_counter = conn_counter + 1.

    ELSE.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.

  ENDMETHOD.

ENDCLASS.

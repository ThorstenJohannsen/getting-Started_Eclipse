CLASS lcl_connection DEFINITION.

  PUBLIC SECTION.

    CLASS-DATA conn_counter TYPE i READ-ONLY.



    METHODS get_output RETURNING VALUE(r_output) TYPE string_table.

    METHODS constructor IMPORTING i_carrier_id    TYPE /dmo/carrier_id
                                  i_connection_id TYPE /dmo/connection_id
                        RAISING   cx_abap_invalid_value.


  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA carrier_id TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.
    DATA airport_from_id TYPE /dmo/airport_from_id.
    DATA airport_to_id TYPE /dmo/airport_to_id.

ENDCLASS.

CLASS lcl_connection IMPLEMENTATION.

  METHOD get_output.
    append |---------------------------------| TO r_output.
    append |Carrier: { carrier_id }   | TO r_output.
    append |Connection: { connection_id }   | TO r_output.
    append |Departure: { airport_from_id }   | TO r_output.
    append |Destination: { airport_to_id }   | TO r_output.

  ENDMETHOD.

  METHOD constructor.
    IF i_carrier_id IS INITIAL OR i_connection_id IS INITIAL.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.

    SELECT SINGLE FROM /dmo/connection
        FIELDS airport_from_id, airport_to_id
        WHERE carrier_id = @i_carrier_id
        AND connection_id = @i_connection_id
        INTO ( @airport_from_id, @airport_to_id ).

    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.

    carrier_id = i_carrier_id.
    connection_id = i_connection_id.
    conn_counter += 1. "Kurzschreibweise
*    conn_counter =  conn_counter + 1. ""normale Schreibweise

  ENDMETHOD.

ENDCLASS.

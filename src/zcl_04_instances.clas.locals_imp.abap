CLASS lcl_connection DEFINITION.

  PUBLIC SECTION.
    DATA carrier_id TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.
    CLASS-DATA conn_counter TYPE i.

    METHODS get_output retURNING VALUE(r_output) type string_table.

    methods set_attributes imPORTING i_carrier_id type /dmo/carrier_id
                                     i_connection_id type /dmo/connection_id.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_connection IMPLEMENTATION.

  METHOD get_output.

    append |-------------------------------------------------------| to r_output.
    appEND |carrier: { carrier_id } | to r_output.
    appEND |connection: { connection_id } | to r_output.

  ENDMETHOD.

  METHOD set_attributes.
    IF i_carrier_id is initIAL or i_connection_id is inITIAL.

    endif.

  ENDMETHOD.

ENDCLASS.

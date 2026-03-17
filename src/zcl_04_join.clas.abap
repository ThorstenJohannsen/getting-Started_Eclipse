CLASS zcl_04_join DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_04_join IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA connection TYPE REF TO lcl_connection.            "Objektreferenz kann max. ein Objekt referenzieren
    DATA connections TYPE TABLE OF REF TO lcl_connection.  "Collection, kann mehrere Objekte enthalten
    DATA lx_invalid_value TYPE REF TO cx_abap_invalid_value.

    TRY.
        connection = NEW lcl_connection(
          i_carrier_id    = 'SQ'
          i_connection_id = '0001' ).
        APPEND connection TO connections.
      CATCH cx_abap_invalid_value INTO lx_invalid_value.   "Musterlösung!!!
        out->write( lx_invalid_value->get_text( ) ).
    ENDTRY.


    TRY.
        connection = NEW lcl_connection(
          i_carrier_id    = 'LH'
          i_connection_id = '0400' ).
        APPEND connection TO connections.
      CATCH cx_abap_invalid_value INTO lx_invalid_value.   "Musterlösung!!!
        out->write( lx_invalid_value->get_text( ) ).
    ENDTRY.


    TRY.
        connection = NEW lcl_connection(
          i_carrier_id    = 'LH'
          i_connection_id = '0401' ).
        APPEND connection TO connections.
      CATCH cx_abap_invalid_value INTO lx_invalid_value.   "Musterlösung!!!
        out->write( lx_invalid_value->get_text( ) ).
    ENDTRY.

    TRY.
        connection = NEW lcl_connection(
          i_carrier_id    = 'LH'
          i_connection_id = '0402' ).
        APPEND connection TO connections.
      CATCH cx_abap_invalid_value INTO lx_invalid_value.   "Musterlösung!!!
        out->write( lx_invalid_value->get_text( ) ).
    ENDTRY.

    out->write( `Anzahl der Flugverbindungen: `  && CONV string( lcl_connection=>conn_counter ) ).   "Optional
    LOOP AT connections INTO connection.
      out->write( connection->get_output( ) ).
    ENDLOOP.

**********************************************************************
" JOIN hier zweimal left outer um Departure Airport und Destination Airport zu bekommen
select from /dmo/connection as conn
    left outer join /dmo/airport as a
        on conn~airport_from_id = a~airport_id
    left outer join /dmo/airport as b
        on conn~airport_to_id = b~airport_id
    left outer join /dmo/flight as fly
        on conn~carrier_id = fly~carrier_id
         and conn~connection_id = fly~connection_id
    fields conn~carrier_id, conn~connection_id,
            fly~seats_max as MaxSeats, fly~seats_occupied as OccupiedSeats,
            a~airport_id as DepartureShort, a~name as Departure,
            b~airport_id as DestinationShort, b~name as Destination
    where conn~carrier_id = 'LH'
           and fly~flight_date >= '20260101'
    into @Data(conn_join).

    out->write( |------------------------------------------------------| ).
    out->write( conn_join ).
endselect.

  ENDMETHOD.
ENDCLASS.

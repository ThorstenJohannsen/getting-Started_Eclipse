CLASS lcl_connection DEFINITION.

  PUBLIC SECTION.


    CLASS-DATA conn_counter TYPE i READ-ONLY.
    ""Übung 15 Klassenkonstruktor erstellen
    CLASS-METHODS class_constructor.



    METHODS get_output RETURNING VALUE(r_output) TYPE string_table.

    METHODS constructor IMPORTING i_carrier_id    TYPE /dmo/carrier_id
                                  i_connection_id TYPE /dmo/connection_id
                        RAISING   cx_abap_invalid_value.


  PROTECTED SECTION.
  PRIVATE SECTION.
    TYPES BEGIN OF st_details.
    types AirlineID type /dmo/carrier_id.
    TYPES DepartureAirport TYPE /dmo/airport_from_id.
    TYPES DestinationAirport TYPE /dmo/airport_to_id.
    TYPES AirlineName TYPE /dmo/carrier_name.
    TYPES airportfrom TYPE /dmo/airport_name.
    TYPES airportto TYPE /dmo/airport_name.
    TYPES END OF st_details.

    DATA carrier_id TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.
    DATA airport_from_id TYPE /dmo/airport_from_id.
    DATA airport_to_id TYPE /dmo/airport_to_id.
    DATA airportfrom TYPE /dmo/airport_name.
    DATA airportto TYPE /dmo/airport_name.
*    data carrier_name type /dmo/carrier_name.
*    data carrier_name type /dmo/carrier-name.
*    data carrier_name type /dmo/i_carrier-name.
    DATA carrier_name TYPE /dmo/carrier_name.
    DATA details TYPE st_details.
"" Übung 15 Seite 281
    ""Definition Zeilentyp
    TYPES BEGIN OF st_flughafen.
    TYPES AirportID TYPE /dmo/airport_id.
    TYPES Name TYPE /dmo/airport_name.
    TYPES END OF st_flughafen.
    ""Definition interne Tabelle
    TYPES tt_flughafen TYPE STANDARD  TABLE OF st_flughafen
            WITH NON-UNIQUE DEFAULT KEY.
""Definition statisches Attribut interne Tabelle für Flughafen
    CLASS-DATA airports TYPE tt_flughafen.

    TYPES BEGIN OF st_airlines.
    TYPES carr_id TYPE /dmo/carrier_id.
    TYPES carr_name TYPE /dmo/carrier_name.
    TYPES END OF st_airlines.

    TYPES tt_airlines TYPE STANDARD  TABLE OF st_airlines
            WITH NON-UNIQUE DEFAULT KEY.

    CLASS-DATA airlines TYPE tt_airlines.

ENDCLASS.

CLASS lcl_connection IMPLEMENTATION.

  METHOD class_constructor."" Hier wird die interne Tabelle mit Daten
                            ""gefüllt bei Aufruf des Objektes ein einziges Mal
    SELECT FROM /dmo/i_airport FIELDS airportid, name INTO TABLE @airports.
    SELECT FROM /dmo/carrier FIELDS carrier_id, name INTO TABLE @airlines.

  ENDMETHOD.

  METHOD get_output.
    APPEND |---------------------------------| TO r_output.
    APPEND |Carrier: { carrier_id } // { airlines[ carr_id = details-airlineid ]-carr_name }  | TO r_output.
    APPEND |Connection: { connection_id } | TO r_output.
    "" hier wurden die ausgeschriebene Airline in der Select-Anweisung
    "" für details mit übernommen und über details ausgegeben
*    APPEND |Carrier: { carrier_id } // { details-airlinename }  | TO r_output.

    "" Hier wird auf die mit CLASS Methods erstellte Tabelle airports zugegriffen
    "" und die Verküpfung in der [=Suchmuster] Klammer bestimmt welcher Name ausgegeben wird
    "" einmal für Departure und Destination
    APPEND |Departure: { details-departureairport } // { airports[ Airportid = details-departureairport ]-name }  | TO r_output.
    APPEND |Destination: { details-destinationairport } // { airports[ Airportid = details-destinationairport ]-name }   | TO r_output.

    "" hier wurden die ausgeschriebenen Flughäfen in der Select-Anweisung
    "" für details mit übernommen und über details ausgegeben
*    APPEND |Departure: { details-departureairport } // { details-airportfrom }  | TO r_output.
*    APPEND |Destination: { details-destinationairport } // { details-airportto }   | TO r_output.

  ENDMETHOD.
  METHOD constructor.
    IF i_carrier_id IS INITIAL OR i_connection_id IS INITIAL.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.

    SELECT SINGLE FROM /DMO/I_Connection
            FIELDS AirlineID, DepartureAirport, DestinationAirport,
                    \_Airline-Name AS AirlineName
*                    \_DepartureAirport-name AS airportfrom, "" Diese Anweisung brauche ich nun nicht mehr!!
*                    \_DestinationAirport-name AS airportto "" das macht jetzt airports
            WHERE airlineID = @i_carrier_id
              AND ConnectionID = @i_connection_id
            INTO CORRESPONDING FIELDS OF @details.

*    SELECT SINGLE FROM /DMO/I_Connection
*            FIELDS DepartureAirport, DestinationAirport, \_Airline-Name
*            WHERE airlineID = @i_carrier_id
*              AND ConnectionID = @i_connection_id
*            INTO (@airport_from_id, @airport_to_id, @carrier_name).

*    SELECT SINGLE FROM /dmo/connection
*        FIELDS airport_from_id, airport_to_id
*        WHERE carrier_id = @i_carrier_id
*        AND connection_id = @i_connection_id
*        INTO ( @airport_from_id, @airport_to_id ).

    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.

    carrier_id = i_carrier_id.
    connection_id = i_connection_id.
    conn_counter += 1. "Kurzschreibweise
*    conn_counter =  conn_counter + 1. ""normale Schreibweise

  ENDMETHOD.

ENDCLASS.

CLASS zcl_04_instances__meine DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_04_instances__meine IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA connection TYPE REF TO lcl_connection.
    DATA connection2 TYPE REF TO lcl_connection.
    DATA connections TYPE TABLE OF REF TO lcl_connection.
    data connections2 tYPE taBLE of ref to lcl_connection.

    connection = NEW lcl_connection( ).
    "die Variablen carrier_id, connection_id und conn_counter wurden unter
    " 'Local Types' als PUBLIC angelegt
    connection->carrier_id = 'LH'.
    connection->connection_id = '0400'.
    connection->conn_counter = connection->conn_counter + 1.
    "Die Attribute von connection werden in der Tabelle connections gespeichert
    "und können alle zusammen am Ende wieder ausgegeben werden.
    "Oder mittels Loop Schleife kann nach Attributwerten gesucht werden! => mit connections2
    APPEND connection TO connections.

    CREATE OBJECT connection.
    connection->carrier_id = 'TJ'.
    connection->connection_id = '0001'.
    connection->conn_counter = connection->conn_counter +  1.

    APPEND connection TO connections.

    connection = NEW #( ).
    connection->carrier_id = 'TJ'.
    connection->connection_id = '0002'.
    connection->conn_counter = connection->conn_counter + 1.

    APPEND connection TO connections.

    "" out->write( connections ).
    out->write(  EXPORTING data = connections
                           name = 'Flugverbindungen insgesamt -->' && connection->conn_counter ).


    LOOP AT connections INTO connection2.
      IF connection2->carrier_id = 'TJ'.
        APPEND connection2 TO connections2.
      ENDIF.
    ENDLOOP.

    out->write(  EXPORTING data = connections2
                           name = 'Flugverbindungen mit TJ -->' ).

  ENDMETHOD.
ENDCLASS.

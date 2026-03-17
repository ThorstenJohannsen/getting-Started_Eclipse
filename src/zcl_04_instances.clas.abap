CLASS zcl_04_instances DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_04_instances IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    " Objektreferenz für max. ein Objekt
    DATA connection TYPE REF TO lcl_connection.

    "" Connections kann mehrere Objekte enthalten,
    "" eine Tabelle mit verschiedenen Referenzen
    ""Die Variablen können verschachtelt sein
    DATA connections TYPE TABLE OF REF TO lcl_connection.

    connection = NEW lcl_connection(  ).
    connection->carrier_id = 'LH'.
    connection->connection_id = '0400'.
    APPEND connection TO connections.

    connection = NEW lcl_connection( ).
    connection->carrier_id = 'AA'.
    connection->connection_id = '0017'.
    APPEND connection TO connections.

    connection = NEW lcl_connection( ).
    connection->carrier_id = 'SQ'.
    connection->connection_id = '0001'.
    APPEND connection TO connections.

  ENDMETHOD.






ENDCLASS.

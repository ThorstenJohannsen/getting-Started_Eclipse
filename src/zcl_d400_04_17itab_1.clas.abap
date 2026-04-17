CLASS zcl_d400_04_17itab_1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_d400_04_17itab_1 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
"Verwendung von Internen Tabellen-Arten

    " STANDARD Table
    DATA lt_connection_01 TYPE TABLE OF /dmo/connection.         "Variante 1

    DATA lt_connection_02 TYPE STANDARD TABLE OF /dmo/connection "Variante 2
                          WITH NON-UNIQUE DEFAULT KEY.


    " SORTED Table
    DATA lt_connection_03 TYPE SORTED TABLE OF /dmo/connection
                          WITH NON-UNIQUE KEY carrier_id connection_id.

    DATA lt_connection_04 TYPE SORTED TABLE OF /dmo/connection
                          WITH NON-UNIQUE DEFAULT KEY.

    DATA lt_connection_05 TYPE SORTED TABLE OF /dmo/connection
                          WITH UNIQUE KEY carrier_id connection_id.


    " HASHED Table
    DATA lt_connection_06 TYPE HASHED TABLE OF /dmo/connection
                          WITH UNIQUE KEY carrier_id connection_id.



    TYPES BEGIN OF ty_demo_01.
    TYPES col1 TYPE string.
    TYPES col2 TYPE i.
    TYPES col3 TYPE p LENGTH 3 DECIMALS 2.
    TYPES END OF ty_demo_01.

    DATA lt_demo_01 TYPE STANDARD TABLE OF ty_demo_01.
    DATA ls_demo_01 LIKE LINE OF lt_demo_01.


    DATA lt_demo_02 TYPE /dmo/t_flight.


    ls_demo_01-col1 = 'ABC'.
    ls_demo_01-col2 = 123.
    ls_demo_01-col3 = '123.45'.
    APPEND ls_demo_01 TO lt_demo_01.

    ls_demo_01-col1 = 'ABCDE'.
    ls_demo_01-col2 = 4563.
    ls_demo_01-col3 = '523.45'.
    APPEND ls_demo_01 TO lt_demo_01.

    ls_demo_01 = VALUE #( col1 = '789'
                          col2 = 678
                          col3 = '123.78'  ).
    APPEND ls_demo_01 TO lt_demo_01.





    APPEND VALUE #( col1 = '999'
                          col2 = 558
                          col3 = '723.78'  )
                TO lt_demo_01.
   "Ohne Append

   lt_demo_01 = VALUE #( ( col1 = '444' col2 = 33 col3 = '23.45' )
                         ( col1 = '777' col2 = 22 col3 = '23.47' )
                         ( col1 = '454' col2 = 33 col3 = '23.48' )
                         (  ls_demo_01 ) ).





    TRY.
        SELECT FROM /dmo/connection FIELDS * INTO TABLE @lt_connection_05.
      CATCH cx_root INTO DATA(lx_root).
        out->write( lx_root->get_text(  ) ).
    ENDTRY.


    out->write( lt_connection_05  ).
    out->write( lt_demo_01  ).





  ENDMETHOD.


ENDCLASS.

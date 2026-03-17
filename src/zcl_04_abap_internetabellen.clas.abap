CLASS zcl_04_abap_internetabellen DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_04_abap_internetabellen IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
*S4D400 Seite 86
    TYPES ty_demo_02 TYPE TABLE OF /dmo/carrier.
    DATA lt_demo_02 TYPE ty_demo_02.
    SELECT FROM /dmo/carrier FIELDS * INTO TABLE @lt_demo_02.

    out->write( lt_demo_02 ).
    out->write( '-------------darüber ganze Tabelle Carrier' ).

    DATA ls_demo_02 LIKE LINE OF lt_demo_02.
    LOOP AT lt_demo_02 INTO ls_demo_02 FROM 1 TO 5 WHERE carrier_id = 'AA'.
      out->write( ls_demo_02 ).
    ENDLOOP.
    out->write( '-----------darüber from 1-5 carrier_id = AA' ).

*S4D400 Seite 99
    LOOP AT lt_demo_02 INTO DATA(ls_demo_02_inline) from 2 to 3.
      out->write( ls_demo_02_inline ).
    ENDLOOP.
    out->write( '-----------darüber ist die Inline Deklaration from 2-3' ).

*    RETURN. "" hier wird abgebrochen

    DATA lt_demoi TYPE TABLE OF i.
    DATA nr TYPE i VALUE 100.

    CLEAR lt_demoi.
** """" S4D400 Seite 86 ich füge die Daten per Schleife ein
    DO 10 TIMES.
      APPEND nr TO lt_demoi.
      nr = nr + 100.

    ENDDO.
    out->write( lt_demoi ).
    out->write( '-----------darüber interne Tabelle mit Werten von 100 - 1000' ).
*    RETURN.
** """" S4D400 Seite 86
    TYPES ty_demo1 TYPE TABLE OF /dmo/carrier.
    DATA lt_demo1 TYPE ty_demo1.
    "" Variable mit @ Maskieren/Einleiten
    SELECT FROM /dmo/carrier FIELDS * WHERE carrier_id BETWEEN 'J' AND 'LH' INTO TABLE @lt_demo1.

    out->write( lt_demo1 ).

    out->write( '---------daüber Tabelle Carrier J bis LH------------------------------------' ).


**********************************************************************

    TYPES ty_demo2 TYPE TABLE OF /dmo/flight.
    DATA lt_demo2 TYPE ty_demo2.
    "" Variable mit @ Maskieren/Einleiten
    SELECT FROM /dmo/flight FIELDS * WHERE carrier_id = 'LH' INTO TABLE @lt_demo2.

    out->write( lt_demo2 ).
    out->write( '-------------darüber nur flight mit LH --------------------------------' ).

*****************
    TYPES ty_demo3 TYPE TABLE OF /dmo/flight.
    DATA lt_demo3 TYPE ty_demo3.
    "" Variable mit @ Maskieren/Einleiten
    SELECT FROM /dmo/flight FIELDS * WHERE carrier_id BETWEEN 'AA' AND 'LH' INTO TABLE @lt_demo3.

    out->write( lt_demo3 ).
    out->write( '--------Flight mit AA bis LH-------------------------------------' ).
    out->write( lt_demo3[ 15 ] ). ""Zugriff per Index
    out->write( '----------Zugriff per Index 15 -----------------------------------' ).

*****************

    DATA lt_demo4 TYPE /dmo/t_flight.
    DATA ls_demo4 LIKE LINE OF lt_demo4.

    ls_demo4-carrier_id = 'RB'.
    ls_demo4-connection_id = '9999'.
    APPEND ls_demo4 TO lt_demo4.
    out->write( lt_demo4 ).

    out->write( '---------eingefügter Datensatz mit RB und 9999 ------------------------------------' ).


  ENDMETHOD.
ENDCLASS.

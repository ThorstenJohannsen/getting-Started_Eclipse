CLASS zcl_d400_04_abap_divers DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_d400_04_abap_divers IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

** S4D400 Seite 48
    DATA lv_text1 TYPE string VALUE 'Ausgabe'.
    DATA lv_demo1 TYPE i.
    DATA lv_demo2 TYPE c LENGTH 10.
    DATA lv_demo3 TYPE string.
    CONSTANTS lc_demo TYPE string VALUE '1 Ausgabe !'.
* S4D400 Seite 53
    lv_demo1 = 100. " Zahlenliteral
    lv_demo2 = 'Demo_3'. "Textliteral
    lv_demo3 = 'Hallo =>`demo_3 =>`, was geht!'. "String-Literal

    lv_text1 = lv_text1 && 'Hello World'.
    out->write( lv_text1 && lv_demo1 && lv_demo2 && lv_demo3 ).
    """ so geht es nicht out->write( lv_text1 + lv_demo1 + lv_demo2 + lv_demo3 ).

    """Lokale Datentypen
    TYPES ty_demo_01 TYPE c LENGTH 10. "Typen sind Baupläne, hier muss eine Variable erstellt werden

    DATA lv_demo_01 TYPE ty_demo_01.

    lv_demo_01 = '1234567890'.

    out->write( lv_demo_01 ).
** S4D400 Abb.41 Seite 56
    " Inlinedeklaration vom Typ Integer => nur innerhalb der
    " Methode/des Codings
    DATA(lv_demo_04) = 120.

*S4D400 Seite 87
    DATA lt_demo_03 TYPE /dmo/t_flight.
    DATA ls_demo_03 LIKE LINE OF lt_demo_03.  "Variante 1
*    DATA ls_demo_03_1 TYPE /dmo/flight.      "Variante 2
    SELECT FROM /dmo/flight FIELDS * INTO TABLE @lt_demo_03.
    ls_demo_03 = lt_demo_03[ 4 ].

    out->write( `Index  : `  && ls_demo_03-carrier_id && ` ` && ls_demo_03-connection_id   ).
    out->write( ls_demo_03 ).
    out->write( lt_demo_03[ 5 ] ).

    READ TABLE lt_demo_03 INTO ls_demo_03 INDEX 6.
*    data output type string.
*    output = sy-tabix && ls_demo_03-carrier_id.
*    out->write(  output  ).
     out->write( `sy-tabix = ` && sy-tabix && ` ` && ls_demo_03-carrier_id && ls_demo_03-connection_id && ls_demo_03-flight_date ).



  ENDMETHOD.
ENDCLASS.

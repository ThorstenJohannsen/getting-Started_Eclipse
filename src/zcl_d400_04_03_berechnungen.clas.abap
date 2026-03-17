CLASS zcl_d400_04_03_berechnungen DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_d400_04_03_berechnungen IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA lv_demo_01 TYPE i VALUE 100.
    DATA lv_demo_02 TYPE i VALUE 100.
    DATA lv_result TYPE i.

    lv_result = lv_demo_01 + lv_demo_02.
    out->write( lv_result ).

    lv_result = lv_demo_01 * lv_demo_02 / 5.
    out->write( lv_result ).

    lv_result = sqrt( 16 ).
    out->write( lv_result ).

    lv_result = 5 MOD 3.
    out->write( lv_result ).

    lv_result = ipow( base = 5 exp = 2 ).
    out->write( lv_result ).

    DATA lv_text1 TYPE string VALUE 'Ausgabe1'.
    DATA lv_text2 TYPE string VALUE '2Angekettet'.
    DATA lv_demo_03 TYPE p LENGTH 3 DECIMALS 2.
    DATA lv_resdm TYPE string.

    lv_resdm = lv_text1 && ' ' && lv_text2.
    out->write( lv_resdm ).

    lv_resdm = | 123 456 { lv_text1 } { lv_text2 } |.
    out->write( lv_resdm ).

    lv_demo_03 = '123.55-'.

    lv_resdm = | Betrag: { lv_demo_03 } EUR |.
    out->write( lv_resdm ).

    DATA lv_demo_04 TYPE d.

    lv_demo_04 = '20260304'.
    out->write( lv_demo_04 ).


    lv_resdm = | Datum: { lv_demo_04  DATE = ENVIRONMENT } |.
    out->write( lv_resdm ).

    lv_resdm = ''.
    lv_resdm = 'ABC' & ' ' & 'CDA'.
    out->write( lv_resdm ).

  ENDMETHOD.
ENDCLASS.

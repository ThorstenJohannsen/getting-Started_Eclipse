CLASS zcl_04_if_oo_out DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_04_if_oo_out IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA ls_carrier TYPE /dmo/carrier.
    ls_carrier-carrier_id = 'LH'.
    ls_carrier-name = 'Lufthansa'.
    ls_carrier-currency_code = 'EUR'.

    out->write(  ls_carrier ).
    """ Unten wird zwar ein Fehler ausgeworfen, aber es funktioniert
    """ auch so, lässt sich aber nicht aktivieren!
    ""DATA lt_carrier TYPE TABLE OF /dmo/carrier.
    ""select * from /dmo/carrier into table lt_carrier.
    """ mit Inline Deklaration, wird auch ausgegeben
    SELECT * FROM /dmo/carrier INTO TABLE @DATA(lt_carrier).


    out->write(  lt_carrier ).

  ENDMETHOD.
ENDCLASS.

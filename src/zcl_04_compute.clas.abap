CLASS zcl_04_compute DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_04_compute IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA nr1 TYPE i.
    DATA nr2 TYPE i.
    DATA result TYPE p LENGTH 8 DECIMALS 3.

    nr1 = -8.
    nr2 = 3.
    "weil wir den Datentyp explicit Typisiert haben, kommt keine
    "ganze Zahl => i raus, sondern eine Zahl mit 2 Nachkommastellen
    result = nr1 / nr2.
    out->write( 'Wert1 => ' && result ).

    "hier wird auf ganze zahl aufgerundet, weil keine Decimalstelle
    "bei i = Integer
    DATA(result2) = nr1 / nr2.
    out->write( 'Wert2 =>' && result2 ).

    nr1 = 6.
    nr2 = 3.
    DATA(result3) = nr1 / nr2.
    out->write( 'Wert3 = 6/3 =' && result3 ).

    DATA(output2) = | { nr1 } / { nr2 } = { result3 } |.
    out->write( 'Wert4 =>' && output2 ).



  ENDMETHOD.
ENDCLASS.

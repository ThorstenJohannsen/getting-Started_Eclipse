CLASS zcl_04_if_anweisung DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_04_if_anweisung IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  data demo type i value 1000.
    "Wenn der Wert größer 900 ist, wird die erste If-Anweisung
    "ausgeführt, die zweite mit elseif >500 nicht, weil der
    "Wert schon beim ersten IF abgefangen wurde
  if demo > 900.
    out->write( 'demo > 900' ).
  elseif demo > 500.
     out->write( 'demo > 500' ).
  else.

  endif.
  ENDMETHOD.
ENDCLASS.

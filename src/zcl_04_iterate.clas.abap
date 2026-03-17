CLASS zcl_04_iterate DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_04_iterate IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    CONSTANTS max_count TYPE i VALUE 20.
    DATA numbers TYPE TABLE OF i.
    DATA output TYPE TABLE OF string.

    DO max_count TIMES.

      CASE sy-index.
        WHEN 1.
          APPEND 0 TO numbers.
          "" statt unten mit neuer Schleife in output jetzt hier in der ersten Schleife
          APPEND |{ sy-tabix WIDTH = 4 } : { 0 WIDTH = 10 ALIGN = RIGHT }| TO output.

        WHEN 2.
          APPEND 1 TO numbers.
          "" statt unten mit neuer Schleife in output jetzt hier in der ersten Schleife
          APPEND |{ sy-tabix WIDTH = 4 } : { 1 WIDTH = 10 ALIGN = RIGHT }| TO output.

        WHEN OTHERS.
          APPEND numbers[ sy-index - 2 ] +
                 numbers[ sy-index - 1 ]
                 TO numbers.
     "" statt unten mit neuer Schleife in output jetzt hier in der ersten Schleife
     "" das was in die interne Tabelle numbers kommt direkt in die output
          APPEND |{ sy-index  WIDTH = 4 } : { numbers[ sy-index - 2 ] + numbers[ sy-index - 1 ]  WIDTH = 10  ALIGN = RIGHT }| TO output.
      ENDCASE.

    ENDDO.

    out->write(
      EXPORTING
        data   = output
        name   = |Die ersten { max_count } Fibonacci Nummern| ).
    out->write( 'output einmal gecleart = clear output und nochmal mit  Schleife, so wie im Buch' ).

    CLEAR output.
    "Formatierung der Ausgabe so wie in der Beschreibung beschrieben.
    LOOP AT numbers INTO DATA(number).
      APPEND |{ sy-tabix WIDTH = 4 } : { number WIDTH = 10 ALIGN = RIGHT }| TO output.
    ENDLOOP.

out->write(
      EXPORTING
        data   = output
        name   = |Die ersten { max_count } Fibonacci Nummern| ).

  ENDMETHOD.
ENDCLASS.

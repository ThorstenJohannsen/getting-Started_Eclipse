CLASS zcl_04_compute_case DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_04_compute_case IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA nr1 TYPE i.
    DATA nr2 TYPE i.
    DATA op TYPE c LENGTH 1.
    DATA result TYPE p LENGTH 8 DECIMALS 2.
    DATA output TYPE string.
    try.
        nr1 = 15.
        nr2 = 5.
      catch cx_root into data(lx_root1).
        out->write( lx_root1->get_text( ) ).
        return.
    endtry.

    op = '/'.

    CASE op.
      WHEN '+'.
        result = nr1 + nr2.
      WHEN '-'.
        result = nr1 - nr2.
      WHEN '*'.
        result = nr1 * nr2.
      WHEN '/'.
        TRY.
            result = nr1 / nr2.

***          "Variante wie im Buch.
          CATCH cx_sy_zerodivide.
            output = |Division durch Null ist nicht definiert!|.

          "Variante 2 für Profis
          CATCH cx_root INTO DATA(lx_root).
            output = ( lx_root->get_text( ) ).

        ENDTRY.


      WHEN OTHERS.
        output = | '{ op }' ist kein gültiger Operator! |.

    ENDCASE.

    IF output IS INITIAL.
      output = | { nr1 } { op } { nr2 } = { result } |.
    ENDIF.

    out->write( output ).


  ENDMETHOD.
ENDCLASS.

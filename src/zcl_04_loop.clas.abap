CLASS zcl_04_loop DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_04_loop IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
     DO 10 TIMES.

      out->write( sy-index &&  ' Hello World!'(001) ).

    ENDDO.

    DATA lt_itab TYPE TABLE OF i.
    TRY.
        APPEND 100 TO lt_itab.
        APPEND 200 TO lt_itab.
      CATCH cx_root.
    ENDTRY.


    APPEND 300 TO lt_itab.
    APPEND 400 TO lt_itab.
    APPEND 500 TO lt_itab.
    APPEND 600 TO lt_itab.
    APPEND 700 TO lt_itab.
    APPEND 800 TO lt_itab.
    APPEND 900 TO lt_itab.

    data lv_counter_1  type i.


    LOOP AT lt_itab INTO DATA(l_wa).
      lv_counter_1 = lv_counter_1 + 1.
      out->write( sy-tabix && ` ` && l_wa ).
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.

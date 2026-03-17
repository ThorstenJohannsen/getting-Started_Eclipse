INTERFACE lif_demo_01.

  DATA mv_demo_01 TYPE string.

ENDINTERFACE.


CLASS lcl_demo_01 DEFINITION.

  PUBLIC SECTION.
    INTERFACES lif_demo_01.
    TYPES: tab TYPE STANDARD TABLE OF REF TO lcl_demo_01 WITH DEFAULT KEY.
    CLASS-METHODS class_constructor.
    METHODS constructor
      IMPORTING
        i_demo_01 TYPE string
        i_demo_02 TYPE string
        i_demo_03 TYPE string.
  PRIVATE SECTION.
    DATA mv_demo_01 TYPE string.
    DATA mv_demo_02 TYPE string.
    DATA mv_demo_03 TYPE string.
    DATA mv_demo_04 TYPE string.

ENDCLASS.

CLASS lcl_demo_01 IMPLEMENTATION.

  METHOD class_constructor.

  ENDMETHOD.

  METHOD constructor.

    me->mv_demo_01 = i_demo_01.
    me->mv_demo_02 = i_demo_02.
    me->mv_demo_03 = i_demo_03.

  ENDMETHOD.

ENDCLASS.

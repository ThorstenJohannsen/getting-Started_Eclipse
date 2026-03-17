CLASS zcl_d400_04_24eml_agency DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_d400_04_24eml_agency IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    "Seite 312
    DATA agency_upd TYPE TABLE FOR UPDATE /DMO/I_AgencyTP.


    agency_upd = VALUE #( ( AgencyID = '070004' name = 'Pink Panther' ) ).

    MODIFY ENTITIES OF /DMO/I_AgencyTP ENTITY /DMO/Agency
        UPDATE FIELDS ( name ) WITH agency_upd.

    COMMIT ENTITIES.
    out->write( 'Änderungen durchgeführt' ).

************************************************

    DATA input_keys TYPE TABLE FOR READ IMPORT /DMO/I_AgencyTP.
    DATA result_keys TYPE TABLE FOR READ RESULT /DMO/I_AgencyTP.

    input_keys = VALUE #( ( AgencyID = '070004' ) ).


    READ ENTITIES OF /DMO/I_AgencyTP ENTITY /DMO/Agency
         ALL FIELDS WITH input_keys
            RESULT result_keys.

    out->write( result_keys ).


*************** Jetzt zurück auf alten Wert

* agency_upd = VALUE #( ( AgencyID = '070004' name = 'Pink Panther' ) ).
*
*    MODIFY ENTITIES OF /DMO/I_AgencyTP ENTITY /DMO/Agency
*        UPDATE FIELDS ( name ) WITH agency_upd.
*
*    COMMIT ENTITIES.
*    out->write( 'Änderungen durchgeführt' ).
** Pink Panther


  ENDMETHOD.


ENDCLASS.

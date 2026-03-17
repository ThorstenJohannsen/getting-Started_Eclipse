CLASS lhc_zr_cs04_customers DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR Customers
        RESULT result,
*
*      getCityPLZ FOR DETERMINE ON MODIFY
*            IMPORTING keys FOR Customers~getCityPLZ,

      validatePostcode FOR VALIDATE ON SAVE
        IMPORTING keys FOR Customers~validatePostcode,

      getCity FOR DETERMINE ON SAVE
        IMPORTING keys FOR Customers~getCity.


ENDCLASS.

CLASS lhc_zr_cs04_customers IMPLEMENTATION.
  METHOD get_global_authorizations.
  ENDMETHOD.


  METHOD validatePostcode.
    "variable zum lesen der Daten die Struktur dafür liegt schon systemseitig vor
    DATA reported_record LIKE LINE OF reported-customers.
    " Variable für die Fehlermeldung
    DATA failed_record LIKE LINE OF failed-customers.
    DATA ls_plz TYPE ZCS04_I_Postcode-Postcode.

** hierunter erstellen wir was gelesen wird was wir überwachen wollen!!
    READ ENTITIES OF zr_cs04_customers IN LOCAL MODE
      ENTITY customers
        FIELDS ( postcode )
        WITH CORRESPONDING #( keys )
        RESULT DATA(customers1).

    LOOP AT customers1 INTO DATA(customers).

      IF customers-postcode IS INITIAL.
        CONTINUE.
      ENDIF.
      " Prüfung gegen die Tabelle/View
      SELECT SINGLE postcode FROM ZCS04_I_Postcode
        WHERE postcode = @customers-Postcode
        INTO @DATA(lv_customers).

      IF sy-subrc <> 0.
        "" PLZ ist nicht vorhanden
        reported_record-%tky = customers-%tky.
        "hier wird die message erstellt / Attach message object
        reported_record-%msg = me->new_message(
                                 id       = 'Z04MESSAGE_CUSTOMERS'
                                 number   = '001'
                                 severity = if_abap_behv_message=>severity-error
                                 v1 = customers-Postcode ).
        "" Bind message to affected field => mk-0n bedeutet Feld ist rot
        reported_record-%element-postcode = if_abap_behv=>mk-on.

        APPEND reported_record TO reported-customers.

*    **********************************************************************************************************
        """ jetzt reject change Änderungen in die failed Tabelle schieben
        """  und zurücknehmen
        failed_record-%tky = customers-%tky.
        APPEND failed_record TO failed-customers.

      ENDIF.

    ENDLOOP.


  ENDMETHOD.

  METHOD getCity.

    """ DATA connections_upd TYPE TABLE FOR UPDATE zr_cs04_customers.

    READ ENTITIES OF zr_cs04_customers IN LOCAL MODE
     ENTITY customers
     FIELDS ( postcode )
     WITH CORRESPONDING #( keys )
     RESULT DATA(lt_customers).

    DATA lt_update TYPE TABLE FOR UPDATE zr_cs04_customers.
    "" Version 2 mit ASSIGNING
*    LOOP AT lt_customers  ASSIGNING FIELD-SYMBOL(<ls_customers>). "" <ls_customers> = customers
*     " Nur suchen, wenn eine PLZ da ist
*      IF <ls_customers>-postcode IS NOT INITIAL.
*        SELECT SINGLE FROM ZCS04_I_Postcode
*          FIELDS city, country
*          WHERE postcode = @<ls_customers>-postcode
*          INTO ( @DATA(lv_city), @DATA(lv_country) ).
*
*        IF sy-subrc = 0.
*          " Nur updaten, wenn die Werte in der UI noch nicht passen
*          APPEND VALUE #( %tky = <ls_customers>-%tky
*                          City = lv_city
*                          Country = lv_country ) TO lt_update.
*        ENDIF.
*      ENDIF.
*    ENDLOOP.

    "" Version 1 mit into
    LOOP AT lt_customers  INTO DATA(ls_customers).
      " Nur suchen, wenn eine PLZ da ist
      IF ls_customers-postcode IS NOT INITIAL.
        SELECT SINGLE FROM ZCS04_I_Postcode
          FIELDS city, country
          WHERE postcode = @ls_customers-postcode
          INTO ( @DATA(lv_city), @DATA(lv_country) ).

        IF sy-subrc = 0.
          " Nur updaten, wenn die Werte in der UI noch nicht passen
          APPEND VALUE #( %tky = ls_customers-%tky
                          City = lv_city
                          Country = lv_country ) TO lt_update.
        ENDIF.
      ENDIF.
    ENDLOOP.

    " 2. Gesammeltes Update (außerhalb des Loops!)
    IF lt_update IS NOT INITIAL.
      MODIFY ENTITIES OF zr_cs04_customers IN LOCAL MODE
        ENTITY customers
        UPDATE FIELDS ( City Country )
        WITH lt_update.
    ENDIF.
  ENDMETHOD.



ENDCLASS.

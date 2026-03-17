CLASS lhc_zr_04flight DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR flight
        RESULT result,
      validatePrice FOR VALIDATE ON SAVE
        IMPORTING keys FOR flight~validatePrice,
      validateCurrencyCode FOR VALIDATE ON SAVE
            IMPORTING keys FOR flight~validateCurrencyCode.


ENDCLASS.

CLASS lhc_zr_04flight IMPLEMENTATION.
  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD validatePrice.
***********************************
***** Figure 221
    "variable zum lesen der Daten die Struktur dafür liegt schon systemseitig vor
    DATA reported_record LIKE LINE OF reported-flight.
    " Variable für die Fehlermeldung
    DATA failed_record LIKE LINE OF failed-flight.

** hierunter erstellen wir was gelesen wird was wir überwachen wollen!!
    READ ENTITIES OF zr_04flight IN LOCAL MODE
      ENTITY flight
        FIELDS ( price )
        WITH CORRESPONDING #(  keys )
        RESULT DATA(flights).

    LOOP AT flights INTO DATA(flight).
      IF flight-price <= 0.
        reported_record-%tky = flight-%tky.
        "hier wird die message erstellt / Attach message object
        reported_record-%msg = me->new_message(
                                 id       = 'Z04MESSAGE_FLIGHT'
                                 number   = '101'
                                 severity = if_abap_behv_message=>severity-error ).
        "" Bind message to affected field => mk-0n bedeutet Feld ist rot
        reported_record-%element-price = if_abap_behv=>mk-on.

        APPEND reported_record TO reported-flight.

***********************************************************************************************************
        """ jetzt reject change Änderungen in die failed Tabelle schieben und zurücknehmen
        failed_record-%tky = flight-%tky.
        APPEND failed_record TO failed-flight.

      ENDIF.

    ENDLOOP.

  ENDMETHOD.




  METHOD validateCurrencyCode.
******* Figure 221
*    "variable zum lesen der Daten die Struktur dafür liegt schon systemseitig vor
*    DATA reported_record LIKE LINE OF reported-flight.
*    " Variable für die Fehlermeldung
*    DATA failed_record LIKE LINE OF failed-flight.
*    DATA exists TYPE abap_bool.
*
*** hierunter erstellen wir was gelesen wird was wir überwachen wollen!!
*    READ ENTITIES OF zr_04flight IN LOCAL MODE
*      ENTITY flight
*        FIELDS ( CurrencyCode )
*        WITH CORRESPONDING #(  keys )
*        RESULT DATA(flights).
*
*
*    LOOP AT flights INTO DATA(flight).
*      SELECT SINGLE FROM I_currency FIELDS @abap_true
*          WHERE Currency = @flight-currencycode INTO @exists.
*
*      IF exists <> abap_false.
*        reported_record-%tky = flight-%tky.
*        "hier wird die message erstellt / Attach message object
*        reported_record-%msg = me->new_message(
*                                 id       = 'Z04MESSAGE_FLIGHT'
*                                 number   = '102'
*                                 severity = if_abap_behv_message=>severity-error
*                                 v1 = flight-CurrencyCode ). "" das ist die Variable & bei der Message
*
*        "" Bind message to affected field => mk-0n bedeutet Feld ist rot
*        reported_record-%element-CurrencyCode = if_abap_behv=>mk-on.
*
*        APPEND reported_record TO reported-flight.
*
************************************************************************************************************
*        """ jetzt reject change Änderungen in die failed Tabelle schieben und zurücknehmen
*        failed_record-%tky = flight-%tky.
*        APPEND failed_record TO failed-flight.
*
*      ENDIF.
*
*    ENDLOOP.

  ENDMETHOD.

ENDCLASS.

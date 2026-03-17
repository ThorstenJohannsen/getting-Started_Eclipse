CLASS zcl_fs04_04_plz_insert DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_fs04_04_plz_insert IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA lt_plz TYPE zcs04_plz.
    DATA city TYPE zcs04_plz-city.
    DATA country TYPE zcs04_plz-country.
    DATA postcode TYPE zcs04_customers-postcode.



*    lt_plz-client = ''.
    lt_plz-city = 'Hamburg'.
    lt_plz-postcode = '20357'.
    lt_plz-country = 'DE'.

    INSERT INTO zcs04_plz VALUES @lt_plz.


    lt_plz-city = 'Brunsbüttel'.
    lt_plz-postcode = '25541'.
    lt_plz-country = 'DE'.

    INSERT INTO zcs04_plz VALUES @lt_plz.


    lt_plz-city = 'Heide'.
    lt_plz-postcode = '25746'.
    lt_plz-country = 'DE'.

    INSERT INTO zcs04_plz VALUES @lt_plz.


    lt_plz-city = 'Wrohm'.
    lt_plz-postcode = '25799'.
    lt_plz-country = 'DE'.

    INSERT INTO zcs04_plz VALUES @lt_plz.


    lt_plz-city = 'Aachen'.
    lt_plz-postcode = '52080'.
    lt_plz-country = 'DE'.

    INSERT INTO zcs04_plz VALUES @lt_plz.

    lt_plz-city = 'Hamburg-Insel Neuwerk'.
    lt_plz-postcode = '27499'.
    lt_plz-country = 'DE'.

    INSERT INTO zcs04_plz VALUES @lt_plz.

    lt_plz-city = 'Wedel'.
    lt_plz-postcode = '22880'.
    lt_plz-country = 'DE'.

    INSERT INTO zcs04_plz VALUES @lt_plz.


    lt_plz-city = 'Quakenbrück'.
    lt_plz-postcode = '49610'.
    lt_plz-country = 'DE'.

    INSERT INTO zcs04_plz VALUES @lt_plz.

    lt_plz-city = 'Oldenburg'.
    lt_plz-postcode = '26127'.
    lt_plz-country = 'DE'.

    INSERT INTO zcs04_plz VALUES @lt_plz.

    lt_plz-city = 'Flensburg'.
    lt_plz-postcode = '24943'.
    lt_plz-country = 'DE'.

    INSERT INTO zcs04_plz VALUES @lt_plz.


  ENDMETHOD.
ENDCLASS.

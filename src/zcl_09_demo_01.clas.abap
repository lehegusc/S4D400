CLASS zcl_09_demo_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_09_demo_01 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*Hello World

    DATA text TYPE string. "Deklaration
    text = 'Hello World'. "Wertzuweisung
    out->write( text ). "Ausgabe

*Datentypen und Datenobjekte

    DATA age TYPE i. " Ganze Zahlen
    DATA salary_in_euro TYPE p LENGTH 16 DECIMALS 2. " Kommazahlen
    DATA first_name TYPE c LENGTH 40. "Zeichenketten fester Länge
    DATA matriculation_number TYPE n LENGTH 6. "Ziffernfolge
    DATA xmas TYPE d. " Datumsangaben
    DATA noon TYPE t. " Zeitangaben
    DATA flag. " Kennzeichen

    DATA carrier_id TYPE c LENGTH 3. " ABAP Standardtyp
    DATA carrier_id2 TYPE /dmo/carrier_id. " Datenelement

*Wertzuweisung

*Zuweisungsoperator

    age = 44.
    salary_in_euro = '6000.52'.
    first_name = 'Leo'.
    matriculation_number = '640336'.
    xmas = '20261224'.
    noon = '120000'.
    flag = 'X'.

    flag = ' '.
    flag = ''.
    CLEAR flag.

*Statische Vorbelegung

    DATA last_name TYPE c LENGTH 40 VALUE 'Schladebach'.

*Inline Deklaration

    DATA(size_in_cm) = 179.
    size_in_cm = '179'.
  ENDMETHOD.



ENDCLASS.

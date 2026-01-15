CLASS zcl_09_abap_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_09_abap_01 IMPLEMENTATION.

METHOD if_oo_adt_classrun~main.

DATA first_name TYPE c LENGTH 10 Value 'Leo'.
DATA last_name TYPE c LENGTH 10 Value 'Tolstoy'.
DATA(full_name) = first_name && ` ` && last_name.

out->write( 'Hello' && | | && full_name && ', how are you?' ).

ENDMETHOD.
ENDCLASS.

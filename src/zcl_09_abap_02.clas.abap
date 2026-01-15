CLASS zcl_09_abap_02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_09_abap_02 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA id TYPE /DMO/customer_id VALUE '123456'.
    DATA first_name TYPE /DMO/first_name VALUE 'Leo'.
    DATA last_name TYPE /DMO/last_name VALUE 'Schladebach'.
    DATA city TYPE /dmo/city VALUE 'Mannheim'.
    DATA country TYPE land1 VALUE 'DE'.

    out->write( |{ id }, { first_name } { last_name }, { city } ({ country })| ).


  ENDMETHOD.
ENDCLASS.

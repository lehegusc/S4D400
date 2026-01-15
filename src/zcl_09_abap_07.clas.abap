CLASS zcl_09_abap_07 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_09_abap_07 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA travels TYPE Z09_travels.
    TRY.
        travels = zcl_09_helper=>get_travels( '123' ).
        DELETE travels WHERE begin_date < cl_abap_context_info=>get_system_date( ).

        DATA travel TYPE REF TO /dmo/travel.
        LOOP AT travels REFERENCE INTO travel.
          travel->booking_fee = travel->booking_fee * '1.1'.
        ENDLOOP.

        SORT travels BY description DESCENDING.


        out->write( travels ).
      CATCH zcx_abap_no_data INTO DATA(x).
        out->write( x ).
    ENDTRY.


  ENDMETHOD.
ENDCLASS.

CLASS zcl_09_abap_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_09_abap_05 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


try.
  data customer type z09_customer_info.
  customer = zcl_abap_helper=>get_customer( customer_id = '300006') .

  out->write( |Customer ID: { customer-customer_id } | ).
  out->write( |Name: { customer-first_name } { customer-last_name }| ).
  out->write( |City: { customer-city } | ).
  out->write( |Country: { customer-country_code } | ).
  catch ZCX_ABAP_NO_DATA into data(x).
    out->write( x->get_text( ) ).
  endtry.


  ENDMETHOD.
ENDCLASS.

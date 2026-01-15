CLASS zcl_09_demo_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_09_demo_05 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    TRY.
        DATA(result) = zcl_09_calculator=>divide( operand1 = 5 operand2 = 3 ).
        out->write( result ).
      CATCH cx_sy_zerodivide INTO DATA(x).
      out->write( x->get_text( ) ).
    ENDTRY.

    out->write( zcl_09_calculator=>calculate_percentage( percentage = 20 base = 50 ) ).


  ENDMETHOD.
ENDCLASS.

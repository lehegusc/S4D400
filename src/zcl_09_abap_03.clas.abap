CLASS zcl_09_abap_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_09_abap_03 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA operator TYPE c LENGTH 1            VALUE '%'.
    DATA op1      TYPE p LENGTH 8 DECIMALS 2 VALUE 2.
    DATA op2      TYPE p LENGTH 8 DECIMALS 2 VALUE 6.

    IF operator = '+'.
      out->write( |{ op1 NUMBER = USER } { operator } { op2 NUMBER = USER } = { op1 + op2 NUMBER = USER }| ).
    ELSEIF operator = '-'.
      out->write( |{ op1 } { operator } { op2 } = { op1 - op2 }| ).
    ELSEIF operator = '*'.
      out->write( |{ op1 } { operator } { op2 } = { op1 * op2 }| ).
    ELSEIF operator = '/'.
      out->write( |{ op1 } { operator } { op2 } = { op1 / op2 }| ).
    ELSEIF operator = '%'.
      out->write( |{ op1 }{ operator } von { op2 } = { zcl_09_calculator=>calculate_percentage( percentage = op1
                                                                                                base       = op2 ) }| ).
    ELSEIF operator = 'x'.
      TRY.
          out->write( |{ op1 } hoch { op2 } = { zcl_abap_calculator=>calculate_power( base     = op1
                                                                                      exponent = CONV #( op2 ) ) }| ).
        CATCH zcx_abap_exponent_too_high INTO DATA(x).
          out->write( x ).
      ENDTRY.
    ENDIF.
  ENDMETHOD.
ENDCLASS.

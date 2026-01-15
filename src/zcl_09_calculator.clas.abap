CLASS zcl_09_calculator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS divide
      IMPORTING
                operand1      TYPE z09_decimal
                operand2      TYPE z09_decimal
      RETURNING VALUE(result) TYPE z09_decimal
      RAISING   cx_sy_zerodivide.

      CLASS-METHODS calculate_percentage
      IMPORTING
                percentage TYPE z09_decimal
                base TYPE z09_decimal
      RETURNING VALUE(percentage_value) TYPE z09_decimal.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_09_calculator IMPLEMENTATION.
  METHOD divide.
    IF operand2 IS INITIAL. "if operand2 = 0
      RAISE EXCEPTION TYPE cx_sy_zerodivide.
    ENDIF.
    result = operand1 / operand2.
    "RETURN operand1 / operand2.
  ENDMETHOD.

  METHOD calculate_percentage.
    percentage_value = percentage / 100 * base.
  ENDMETHOD.

ENDCLASS.

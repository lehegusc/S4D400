CLASS zcl_09_vehicle DEFINITION
  PUBLIC ABSTRACT
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS constructor IMPORTING make  TYPE string
                                  model TYPE string.

    METHODS accelerate final IMPORTING !value TYPE i
                       RAISING   zcx_09_value_too_high.

    METHODS brake final IMPORTING !value TYPE i
                  RAISING   zcx_09_value_too_high.

    METHODS to_string abstract RETURNING VALUE(string) TYPE string.

    DATA make         TYPE string READ-ONLY.
    DATA model        TYPE string READ-ONLY.
    DATA speed_in_kmh TYPE i      READ-ONLY.

    CLASS-DATA number_of_vehicles TYPE i READ-ONLY.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_09_vehicle IMPLEMENTATION.
  METHOD accelerate.
    IF speed_in_kmh + value > 300.
      RAISE EXCEPTION NEW zcx_09_value_too_high( value = value ).
    ENDIF.
    speed_in_kmh += value.
  ENDMETHOD.

  METHOD brake.
    IF value > speed_in_kmh.
      RAISE EXCEPTION NEW zcx_09_value_too_high( value = value ).
    ENDIF.
    speed_in_kmh -= value.
  ENDMETHOD.

  METHOD constructor.
    me->make  = make.
    me->model = model.

    number_of_vehicles += 1.
  ENDMETHOD.


ENDCLASS.

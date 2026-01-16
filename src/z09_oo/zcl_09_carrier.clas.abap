CLASS zcl_09_carrier DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    DATA name      TYPE string        READ-ONLY.
    DATA airplanes TYPE z09_airplanes READ-ONLY.

    METHODS constructor
      IMPORTING !name TYPE string.

    METHODS add_airplane
      IMPORTING airplane TYPE REF TO ZCL_09_airplane.

    METHODS get_biggest_cargo_plane
      RETURNING VALUE(biggest_cargo_plane) TYPE REF TO ZCL_09_cargo_plane.
ENDCLASS.


CLASS zcl_09_carrier IMPLEMENTATION.
  METHOD constructor.
    me->name = name.
  ENDMETHOD.

  METHOD add_airplane.
    APPEND airplane TO airplanes.
  ENDMETHOD.

  METHOD get_biggest_cargo_plane.
    DATA max_cargo_in_tons TYPE i VALUE 0.

    LOOP AT airplanes INTO DATA(airplane).
      IF airplane IS INSTANCE OF ZCL_09_cargo_plane AND airplane->get_total_weight_in_tons( ) > max_cargo_in_tons.
        biggest_cargo_plane = CAST #( airplane ).
        max_cargo_in_tons = biggest_cargo_plane->get_total_weight_in_tons( ).

      ENDIF.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.

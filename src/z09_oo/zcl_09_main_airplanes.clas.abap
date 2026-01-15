CLASS zcl_09_main_airplanes DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_09_main_airplanes IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA airplane  TYPE REF TO zcl_09_airplane.
    DATA airplanes TYPE TABLE OF REF TO zcl_09_airplane.

    out->write( zcl_09_airplane=>number_of_airplanes ).

    " D-ABUK, Airbus A380-800, 277t
    TRY.
        airplane = NEW #( id                   = 'D-ABUK'
                          plane_type           = 'Airbus A380-800'
                          empty_weigth_in_tons = 277 ).
        APPEND airplane TO airplanes.
      CATCH zcx_abap_initial_parameter INTO DATA(x).
        out->write( x->get_text( ) ).
    ENDTRY.

    " D-AIND, Airbus A320-200, 42t
    TRY.
        airplane = NEW #( id                   = 'D-AIND'
                          plane_type           = ''
                          empty_weigth_in_tons = 42 ).
        APPEND airplane TO airplanes.
      CATCH zcx_abap_initial_parameter INTO DATA(y).
        out->write( y->get_text( ) ).
    ENDTRY.

    " D-AJKF, Boeing 747-400F, 166t
    TRY.
        airplane = NEW #( id                   = 'D-AJKF'
                          plane_type           = 'Boeing 747-400F'
                          empty_weigth_in_tons = 166 ).
        APPEND airplane TO airplanes.
      CATCH zcx_abap_initial_parameter INTO DATA(z).
        out->write( z->get_text( ) ).
    ENDTRY.

    out->write( zcl_09_airplane=>number_of_airplanes ).

    LOOP AT airplanes INTO airplane.
      out->write( |{ airplane->id }, { airplane->plane_type }, { airplane->empty_weigth_in_tons }t| ).
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.

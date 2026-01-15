CLASS zcl_09_main_vehicles DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_09_main_vehicles IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    "Deklarationen
    DATA vehicle TYPE REF TO zcl_09_vehicle.
    DATA vehicles TYPE TABLE OF REF TO zcl_09_vehicle.

    "Instanzierung
    vehicle = new #( make = 'Porsche' model = '911' ).
    append vehicle to vehicles.

    vehicle = new #( make = 'MAN' model = 'TGX' ).
    append vehicle to vehicles.

    vehicle = new #( make = 'Skoda' model = 'Superb Combi' ).
    append vehicle to vehicles.

    out->write( zcl_09_vehicle=>number_of_vehicles ).

    LOOP at vehicles into vehicle.
    TRY.
        vehicle->accelerate( 30 ).
        vehicle->brake( 10 ).
        vehicle->accelerate( 300 ).
      CATCH zcx_09_value_too_high into data(x).
        out->write( x->get_text(  ) ).
    ENDTRY.
    out->write( |{ vehicle->make } { vehicle->model } ({ vehicle->speed_in_kmh }km/h)| ).
    endloop.


  ENDMETHOD.
ENDCLASS.

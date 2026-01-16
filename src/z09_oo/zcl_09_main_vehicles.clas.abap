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
    DATA truck type REF to zcl_09_truck.

    "Instanzierung
    vehicle = new zcl_09_car( make = 'Porsche' model = '911' seats = 2 ). " Upcast
    append vehicle to vehicles.

    vehicle = new zcl_09_truck( make = 'MAN' model = 'TGX' cargo_in_tons = 40 ). " Upcast
    append vehicle to vehicles.

    vehicle = new zcl_09_car( make = 'Skoda' model = 'Superb Combi' seats = 5 ). " Upcast
    append vehicle to vehicles.

    out->write( zcl_09_vehicle=>number_of_vehicles ).

    LOOP at vehicles into vehicle.
    TRY.
        vehicle->accelerate( 30 ).
        vehicle->brake( 10 ).
        vehicle->accelerate( 30 ).
      CATCH zcx_09_value_too_high into data(x).
        out->write( x->get_text(  ) ).
    ENDTRY.
    if vehicle is instance of zcl_09_truck.
    truck = cast #( vehicle ). "Downcast
    truck->transform( ).
    out->write( |{ cond #( when truck->is_transformed = 'X' then 'Truck hat sich transformed' else 'Zurück zum LKW' ) }| ).
    endif.
    out->write( vehicle->to_string( ) ). " (Dynamische) Polymorphie
    endloop.


  ENDMETHOD.
ENDCLASS.

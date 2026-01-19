CLASS zcl_09_rental DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_09_partner.

    TYPES ty_vehicles TYPE TABLE OF REF TO zcl_09_vehicle.

    DATA vehicles TYPE ty_vehicles READ-ONLY.

    METHODS add_vehicle
      IMPORTING vehicle TYPE REF TO zcl_09_vehicle.
ENDCLASS.


CLASS zcl_09_rental IMPLEMENTATION.
  METHOD add_vehicle.
    APPEND vehicle TO vehicles.
  ENDMETHOD.
  METHOD zif_09_partner~to_string.
    string = 'Ich bin die Autovermietung'.
  ENDMETHOD.

ENDCLASS.

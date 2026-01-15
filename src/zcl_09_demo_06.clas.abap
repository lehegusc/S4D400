CLASS zcl_09_demo_06 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_09_demo_06 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  data connection TYPE z09_connection.
  DATA flight TYPE z09_flight.
  data flight_extended TYPE z09_flight_extended.

  connection-carrier_id = 'LH'.
  connection-connection_id = '0400'.
  connection-airport_from_id = 'FRA'.
  connection-airport_to_id = 'JFK'.

  flight-carrier_id = 'LH'.
  flight-connection_id = '0400'.
  flight-flight_date = '20260113'.

  flight_extended = corresponding #( flight ).
  flight_extended = corresponding #( base ( flight_extended ) connection ).

  out->write( flight_extended ).

  ENDMETHOD.
ENDCLASS.

CLASS zcl_09_demo_07 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_09_demo_07 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    "Deklaration interner Tabellen

    DATA connections TYPE z09_connections. "type [Tabellentyp]
    DATA connections2 TYPE TABLE OF z09_connection. "type table of [Strukturtyp]
    DATA connection TYPE z09_connection.

    "Hinzufügen von Datensätzen
    connections = VALUE #(
    ( carrier_id = 'LH' connection_id = '0400' )
    ( carrier_id = 'UA' airport_from_id = 'FRA' )
    ( connection_id = '0401' airport_to_id = 'FRA' ) ).

    "Anfügen von Datensätzen
    connection = VALUE #( carrier_id = 'AZ' connection_id = '0017' airport_from_id = 'BER' airport_to_id = 'ROM' ).

    connections = VALUE #( BASE connections ( connection ) ).
    APPEND connection TO connections.

    "Lesen von Einzelsätzen
    connection = connections[ 3 ].

    IF line_exists( connections[ connection_id = '1234' ] ).
      connection = connections[ connection_id = '1234' ]. " per Schlüsselkomponente
    ENDIF.

    "Lesen mehrerer Datensätze
    LOOP AT connections INTO connection WHERE carrier_id IS NOT INITIAL. "LOOP AT connections INTO DATA(connections2).
      out->write( |{  sy-tabix } { connection-carrier_id }| ).
    ENDLOOP.

    "Ändern von Einzelsätzen
    TRY.
        connections[ 1 ]-airport_from_id = 'FRA'.
      CATCH cx_sy_itab_line_not_found.
    ENDTRY.

    IF line_exists( connections[ connection_id = '1234' ] ).
      connections[ connection_id = '0400' ]-connection_id = '0420'. " per Schlüsselkomponente
    ENDIF.

    "Sortieren

    SORT connections BY carrier_id DESCENDING connection_id ASCENDING.

    "Ändern mehrerer Datensätze (per SY-TABIX)
    LOOP AT connections INTO connection. "LOOP AT connections INTO DATA(connections2).
      "connection-airport_to_id = 'JFK'.
      connections[ sy-tabix ]-airport_to_id = 'JFK'.
    ENDLOOP.

    "Ändern mehrerer Datensätze (per Datenreferenz)
    DATA connection2 TYPE REF TO z09_connection.
    LOOP AT connections REFERENCE INTO connection2.
      connection2->airport_from_id = 'BER'.
    ENDLOOP.

    "Ändern mehrerer Datensätze (per Feldsymbol)

    FIELD-SYMBOLS <connection> TYPE z00_connection.
    LOOP AT connections ASSIGNING <connection> .
      connection2->airport_from_id = 'BER'.
    ENDLOOP.

    "Löschen
    delete connections where airport_from_id = 'FRA'.

    " Anzahl Datensätze
    out->write( lines( connections ) ).








  ENDMETHOD.
ENDCLASS.

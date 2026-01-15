CLASS zcl_09_helper DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS get_travel_with_customer
      IMPORTING travel_id                    TYPE /dmo/travel_id
      RETURNING VALUE(travel_with_customers) TYPE zabap_travel_with_customer
      RAISING   zcx_abap_no_data.
    CLASS-METHODS get_travels
      IMPORTING customer_id    TYPE /dmo/customer_id
      RETURNING VALUE(travels) TYPE z09_travels
      RAISING   zcx_abap_no_data.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_09_helper IMPLEMENTATION.
  METHOD get_travel_with_customer.

    "Lösung 2
    SELECT single FROM /dmo/travel
    INNER JOIN /dmo/customer ON /dmo/travel~customer_id = /dmo/customer~customer_id
    FIELDS *
    WHERE travel_id = @travel_id
    INTO CORRESPONDING FIELDS OF @travel_with_customers.
    IF sy-subrc <> 0.
      RAISE EXCEPTION NEW zcx_abap_no_data( field = 'Travel_ID' table = '/DMO/TRAVEL' value = CONV #( travel_id ) ).
    endif.

    "Lösung 1

*    select single from /dmo/travel
*    fields *
*    where travel_id = @travel_id
*    into @data(travel).
*    IF sy-subrc <> 0.
*      RAISE EXCEPTION NEW zcx_abap_no_data( field = 'TRAVEL_ID' table = '/DMO/TRAVEL' value = CONV #( travel_id ) ).
*    endif.
*
*    select single from /dmo/customer
*    fields *
*    where customer_id = @travel-customer_id
*    into @data(customer).
*    IF sy-subrc <> 0.
*      RAISE EXCEPTION NEW zcx_abap_no_data( field = 'Customer_ID' table = '/DMO/TRAVEL' value = CONV #( travel-customer_id ) ).
*    endif.
*
*    travel_with_customers = corresponding #( travel ).
*    travel_with_customers = corresponding #( base ( travel_with_customers ) customer ).
  ENDMETHOD.

  METHOD get_travels.

    SELECT FROM /dmo/travel
        FIELDS *
        WHERE customer_id = @customer_id
        INTO TABLE @travels.

    IF sy-subrc <> 0.
      RAISE EXCEPTION NEW zcx_abap_no_data( field = 'CUSTOMER_ID' table = '/DMO/TRAVEL' value = CONV #( customer_id ) ).
    endif.

*    IF lines( travels ) = 0. IF sy-dbcnt = 0.
*      RAISE EXCEPTION NEW zcx_abap_no_data( field = 'CUSTOMER_ID' table = '/DMO/TRAVEL' value = CONV #( customer_id ) ).
*    ENDIF.


      "travels = zcl_abap_helper=>get_travels( customer_id ).
    ENDMETHOD.

ENDCLASS.

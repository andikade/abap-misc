REPORT zdemo_value_table.

TYPES: BEGIN OF ty,
         level TYPE i,
         val   TYPE c,
       END OF ty.

DATA: lt_table TYPE STANDARD TABLE OF ty WITH DEFAULT KEY,
      lv_level TYPE i VALUE 2.

DO 2 TIMES.

* init
  lt_table = VALUE #(
    ( level = 1 val = 'A' )
    ( level = 2 val = 'B' )
  ).

  CASE sy-index.
    WHEN 1.
* 0 lines
      lt_table = VALUE #( FOR line IN lt_table WHERE ( level < lv_level ) ( line ) ) .
      cl_demo_output=>display( EXPORTING data = lt_table ).

    WHEN 2.
* 1 line
      lt_table = VALUE #( LET copy = lt_table IN FOR line IN copy WHERE ( level < lv_level ) ( line ) ) .
      cl_demo_output=>display( EXPORTING data = lt_table ).

  ENDCASE.

ENDDO.

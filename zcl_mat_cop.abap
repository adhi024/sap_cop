CLASS zcl_mat_cop DEFINITION " Defines the global class ZCL_MAT_COP
  PUBLIC                     " Class is publicly accessible
  FINAL                      " No other class can inherit from it
  CREATE PUBLIC.             " Can be instantiated from outside

  PUBLIC SECTION.            " Defines the public interface

    CLASS-METHODS check_material_status " Declares a static method
      IMPORTING                   " Takes input parameters
        iv_matnr     TYPE matnr  " Input material number
      RETURNING                   " Returns a single value
        VALUE(rv_is_active) TYPE abap_bool. " Returns ABAP_TRUE if active, ABAP_FALSE if blocked.
                                            " Notice: No RAISING clause here.
ENDCLASS.


CLASS zcl_mat_cop IMPLEMENTATION. " Starts the implementation of the class

  METHOD check_material_status. " Implements the static method

    IF iv_matnr IS INITIAL. " Checks if the input material number is empty
      WRITE : / 'Material number cannot be initial'. " If so, writes a message directly to the output.
    ENDIF.

    CASE iv_matnr. " Evaluates the input material number
      WHEN 'MAT_001'.
        rv_is_active = abap_true. " Sets return value to true (active) for MAT_001
      WHEN 'MAT_002'.
        rv_is_active = abap_false. " Sets return value to false (blocked) for MAT_002
      WHEN OTHERS. " For any other material number not explicitly handled above
        WRITE : / 'Not Found'. 
    ENDCASE.
  ENDMETHOD.

ENDCLASS.
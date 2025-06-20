*&---------------------------------------------------------------------*
*& Report Z_MATERIAL_REPORT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z_MATERIAL_REPORT.

TABLES: MARA.

DATA: lt_mara TYPE STANDARD TABLE OF mara,
      ls_mara TYPE mara.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH TITLE TEXT-001.
  SELECT-OPTIONS s_matnr FOR mara-matnr.
SELECTION-SCREEN END OF BLOCK b1.

START-OF-SELECTION.

  SELECT *
    FROM mara
    INTO CORRESPONDING FIELDS OF TABLE lt_mara
    WHERE matnr IN s_matnr.

  IF sy-subrc IS INITIAL.
    LOOP AT lt_mara INTO ls_mara.
      WRITE: / ls_mara-matnr, ls_mara-maktx. " Display Material Number and Material Description
    ENDLOOP.
  ELSE.
    MESSAGE 'No materials found.' TYPE 'I'.
  ENDIF.

END-OF-SELECTION.

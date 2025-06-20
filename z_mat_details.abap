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
  SELECT-OPTIONS s_matnr FOR mara-matnr OBLIGATORY. 
SELECTION-SCREEN END OF BLOCK b1.

AT SELECTION-SCREEN. " Added: Selection screen event for validation
  IF s_matnr IS INITIAL.
    MESSAGE 'Material Number is a mandatory field.' TYPE 'E'. 
  ENDIF.

START-OF-SELECTION.

  SELECT *
    FROM mara
    INTO CORRESPONDING FIELDS OF TABLE lt_mara
    WHERE matnr IN s_matnr.

  IF sy-subrc IS INITIAL.
    WRITE: / 'Total materials found:', LINES( lt_mara ).
    ULINE. " Added: Separator line

    LOOP AT lt_mara INTO ls_mara.
      WRITE: / ls_mara-matnr, ls_mara-maktx.
    ENDLOOP.
  ELSE.
    MESSAGE 'No materials found for the given criteria.' TYPE 'I'. " Changed: More specific message
  ENDIF.

END-OF-SELECTION.

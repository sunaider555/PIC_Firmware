;====================================================================
; Main.asm file generated by New Project wizard
;
; Created:   Fri May 20 2022
; Processor: PIC16F1508
; Compiler:  MPASM (Proteus)
;====================================================================

;====================================================================
; DEFINITIONS
;====================================================================

#include p16f1508.inc                ; Include register definition file

;====================================================================
; VARIABLES
;====================================================================

;====================================================================
; RESET and INTERRUPT VECTORS
;====================================================================

      ; Reset Vector
RST   code  0x0 
      goto  Start

;====================================================================
; CODE SEGMENT
;====================================================================

PGM   code
Start
      ; Write your code here
Loop  
      goto  Loop

;====================================================================
      END

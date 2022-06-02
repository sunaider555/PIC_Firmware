
_initParams:

;MyProject.c,34 :: 		void initParams() {
;MyProject.c,35 :: 		hF = 0;
	CLRF       _hF+0
	CLRF       _hF+1
;MyProject.c,36 :: 		lF = 0;
	CLRF       _lF+0
	CLRF       _lF+1
;MyProject.c,37 :: 		val_lF = 0;
	CLRF       _val_lF+0
	CLRF       _val_lF+1
;MyProject.c,38 :: 		val_hF = 0;
	CLRF       _val_hF+0
	CLRF       _val_hF+1
;MyProject.c,39 :: 		cycleL = 0;
	CLRF       _cycleL+0
	CLRF       _cycleL+1
;MyProject.c,40 :: 		cycleF = 0;
	CLRF       _cycleF+0
	CLRF       _cycleF+1
;MyProject.c,41 :: 		val_hF = 0;
	CLRF       _val_hF+0
	CLRF       _val_hF+1
;MyProject.c,42 :: 		val_lF = 0;
	CLRF       _val_lF+0
	CLRF       _val_lF+1
;MyProject.c,43 :: 		S1 = 0;
	BCF        PORTA+0, 1
;MyProject.c,44 :: 		S2 = 0;
	BCF        PORTA+0, 2
;MyProject.c,45 :: 		S3 = 0;
	BCF        PORTC+0, 0
;MyProject.c,46 :: 		}
L_end_initParams:
	RETURN
; end of _initParams

_Init:

;MyProject.c,47 :: 		void Init() {
;MyProject.c,48 :: 		ANSELA = 0;
	CLRF       ANSELA+0
;MyProject.c,49 :: 		ANSELA.B5 = 1; //analog realated resistors config ???
	BSF        ANSELA+0, 5
;MyProject.c,50 :: 		ANSELC = 0;
	CLRF       ANSELC+0
;MyProject.c,52 :: 		C1ON_bit = 0; // Disable comparators
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
;MyProject.c,53 :: 		C2ON_bit = 0;
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;MyProject.c,55 :: 		speed = 16000;
	MOVLW      128
	MOVWF      _speed+0
	MOVLW      62
	MOVWF      _speed+1
	CLRF       _speed+2
	CLRF       _speed+3
;MyProject.c,56 :: 		freq = 0;
	CLRF       _freq+0
	CLRF       _freq+1
	CLRF       _freq+2
	CLRF       _freq+3
;MyProject.c,59 :: 		TRISC = 0xB0; //1011 0000
	MOVLW      176
	MOVWF      TRISC+0
;MyProject.c,60 :: 		PORTC = 0;
	CLRF       PORTC+0
;MyProject.c,63 :: 		TRISA = 0x38; //0010 1000
	MOVLW      56
	MOVWF      TRISA+0
;MyProject.c,64 :: 		PORTA = 0;
	CLRF       PORTA+0
;MyProject.c,67 :: 		GIE_bit = 1;
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;MyProject.c,68 :: 		OPTION_REG = 0x02; //8 prescaler
	MOVLW      2
	MOVWF      OPTION_REG+0
;MyProject.c,69 :: 		TMR0IE_bit = 1;
	BSF        TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
;MyProject.c,70 :: 		TMR0 = 100;
	MOVLW      100
	MOVWF      TMR0+0
;MyProject.c,73 :: 		T1CON = 0x81; //enable Time1, external
	MOVLW      129
	MOVWF      T1CON+0
;MyProject.c,74 :: 		TMR1IF_bit = 0; //clear IMR1IF
	BCF        TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
;MyProject.c,75 :: 		TMR1H = 0x00;
	CLRF       TMR1H+0
;MyProject.c,76 :: 		TMR1L = 0x00;
	CLRF       TMR1L+0
;MyProject.c,77 :: 		TMR1IE_bit = 1;
	BSF        TMR1IE_bit+0, BitPos(TMR1IE_bit+0)
;MyProject.c,78 :: 		cnt = 0;
	CLRF       _cnt+0
	CLRF       _cnt+1
;MyProject.c,79 :: 		PEIE_bit = 1; //already GIE_bit is set as 1
	BSF        PEIE_bit+0, BitPos(PEIE_bit+0)
;MyProject.c,82 :: 		cycle = 12; //12: 190ms
	MOVLW      0
	MOVWF      _cycle+0
	MOVLW      0
	MOVWF      _cycle+1
	MOVLW      64
	MOVWF      _cycle+2
	MOVLW      130
	MOVWF      _cycle+3
;MyProject.c,83 :: 		hNum = 45;
	MOVLW      45
	MOVWF      _hNum+0
	MOVLW      0
	MOVWF      _hNum+1
;MyProject.c,84 :: 		lNum = 45;
	MOVLW      45
	MOVWF      _lNum+0
	MOVLW      0
	MOVWF      _lNum+1
;MyProject.c,85 :: 		secF = 0;
	CLRF       _secF+0
	CLRF       _secF+1
;MyProject.c,86 :: 		S1 = 0;
	BCF        PORTA+0, 1
;MyProject.c,87 :: 		S2 = 0;
	BCF        PORTA+0, 2
;MyProject.c,88 :: 		S3 = 0;
	BCF        PORTC+0, 0
;MyProject.c,89 :: 		S0 = 0;
	BCF        PORTA+0, 0
;MyProject.c,90 :: 		ST = 0;
	BCF        PORTC+0, 3
;MyProject.c,91 :: 		ST1 = 0;
	BCF        PORTC+0, 6
;MyProject.c,92 :: 		f00 = 1;
	MOVLW      1
	MOVWF      _f00+0
	MOVLW      0
	MOVWF      _f00+1
;MyProject.c,94 :: 		initParams();
	CALL       _initParams+0
;MyProject.c,95 :: 		}
L_end_Init:
	RETURN
; end of _Init

_getstateNum:

;MyProject.c,97 :: 		void getstateNum() {
;MyProject.c,99 :: 		if (cr == 2 || cr == 3 || cr == 30) stateNum = 1;
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__getstateNum365
	MOVLW      2
	XORWF      _cr+0, 0
L__getstateNum365:
	BTFSC      STATUS+0, 2
	GOTO       L__getstateNum328
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__getstateNum366
	MOVLW      3
	XORWF      _cr+0, 0
L__getstateNum366:
	BTFSC      STATUS+0, 2
	GOTO       L__getstateNum328
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__getstateNum367
	MOVLW      30
	XORWF      _cr+0, 0
L__getstateNum367:
	BTFSC      STATUS+0, 2
	GOTO       L__getstateNum328
	GOTO       L_getstateNum2
L__getstateNum328:
	MOVLW      1
	MOVWF      _stateNum+0
	MOVLW      0
	MOVWF      _stateNum+1
	GOTO       L_getstateNum3
L_getstateNum2:
;MyProject.c,100 :: 		else if (cr == 4 || cr == 5 || cr == 50) stateNum = 2;
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__getstateNum368
	MOVLW      4
	XORWF      _cr+0, 0
L__getstateNum368:
	BTFSC      STATUS+0, 2
	GOTO       L__getstateNum327
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__getstateNum369
	MOVLW      5
	XORWF      _cr+0, 0
L__getstateNum369:
	BTFSC      STATUS+0, 2
	GOTO       L__getstateNum327
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__getstateNum370
	MOVLW      50
	XORWF      _cr+0, 0
L__getstateNum370:
	BTFSC      STATUS+0, 2
	GOTO       L__getstateNum327
	GOTO       L_getstateNum6
L__getstateNum327:
	MOVLW      2
	MOVWF      _stateNum+0
	MOVLW      0
	MOVWF      _stateNum+1
	GOTO       L_getstateNum7
L_getstateNum6:
;MyProject.c,101 :: 		else if (cr == 6 || cr == 7 || cr == 70 || cr == 71 || cr == 72) stateNum = 3;
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__getstateNum371
	MOVLW      6
	XORWF      _cr+0, 0
L__getstateNum371:
	BTFSC      STATUS+0, 2
	GOTO       L__getstateNum326
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__getstateNum372
	MOVLW      7
	XORWF      _cr+0, 0
L__getstateNum372:
	BTFSC      STATUS+0, 2
	GOTO       L__getstateNum326
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__getstateNum373
	MOVLW      70
	XORWF      _cr+0, 0
L__getstateNum373:
	BTFSC      STATUS+0, 2
	GOTO       L__getstateNum326
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__getstateNum374
	MOVLW      71
	XORWF      _cr+0, 0
L__getstateNum374:
	BTFSC      STATUS+0, 2
	GOTO       L__getstateNum326
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__getstateNum375
	MOVLW      72
	XORWF      _cr+0, 0
L__getstateNum375:
	BTFSC      STATUS+0, 2
	GOTO       L__getstateNum326
	GOTO       L_getstateNum10
L__getstateNum326:
	MOVLW      3
	MOVWF      _stateNum+0
	MOVLW      0
	MOVWF      _stateNum+1
	GOTO       L_getstateNum11
L_getstateNum10:
;MyProject.c,102 :: 		else if (cr == 8 || cr == 9 || cr == 90) stateNum = 4;
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__getstateNum376
	MOVLW      8
	XORWF      _cr+0, 0
L__getstateNum376:
	BTFSC      STATUS+0, 2
	GOTO       L__getstateNum325
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__getstateNum377
	MOVLW      9
	XORWF      _cr+0, 0
L__getstateNum377:
	BTFSC      STATUS+0, 2
	GOTO       L__getstateNum325
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__getstateNum378
	MOVLW      90
	XORWF      _cr+0, 0
L__getstateNum378:
	BTFSC      STATUS+0, 2
	GOTO       L__getstateNum325
	GOTO       L_getstateNum14
L__getstateNum325:
	MOVLW      4
	MOVWF      _stateNum+0
	MOVLW      0
	MOVWF      _stateNum+1
	GOTO       L_getstateNum15
L_getstateNum14:
;MyProject.c,103 :: 		else if (cr == 10 || cr == 11 || cr == 110 || cr == 111 || cr == 112) stateNum = 5;
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__getstateNum379
	MOVLW      10
	XORWF      _cr+0, 0
L__getstateNum379:
	BTFSC      STATUS+0, 2
	GOTO       L__getstateNum324
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__getstateNum380
	MOVLW      11
	XORWF      _cr+0, 0
L__getstateNum380:
	BTFSC      STATUS+0, 2
	GOTO       L__getstateNum324
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__getstateNum381
	MOVLW      110
	XORWF      _cr+0, 0
L__getstateNum381:
	BTFSC      STATUS+0, 2
	GOTO       L__getstateNum324
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__getstateNum382
	MOVLW      111
	XORWF      _cr+0, 0
L__getstateNum382:
	BTFSC      STATUS+0, 2
	GOTO       L__getstateNum324
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__getstateNum383
	MOVLW      112
	XORWF      _cr+0, 0
L__getstateNum383:
	BTFSC      STATUS+0, 2
	GOTO       L__getstateNum324
	GOTO       L_getstateNum18
L__getstateNum324:
	MOVLW      5
	MOVWF      _stateNum+0
	MOVLW      0
	MOVWF      _stateNum+1
	GOTO       L_getstateNum19
L_getstateNum18:
;MyProject.c,104 :: 		else if (cr == 12 || cr == 13 || cr == 130 || cr == 131 || cr == 132) stateNum = 6;
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__getstateNum384
	MOVLW      12
	XORWF      _cr+0, 0
L__getstateNum384:
	BTFSC      STATUS+0, 2
	GOTO       L__getstateNum323
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__getstateNum385
	MOVLW      13
	XORWF      _cr+0, 0
L__getstateNum385:
	BTFSC      STATUS+0, 2
	GOTO       L__getstateNum323
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__getstateNum386
	MOVLW      130
	XORWF      _cr+0, 0
L__getstateNum386:
	BTFSC      STATUS+0, 2
	GOTO       L__getstateNum323
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__getstateNum387
	MOVLW      131
	XORWF      _cr+0, 0
L__getstateNum387:
	BTFSC      STATUS+0, 2
	GOTO       L__getstateNum323
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__getstateNum388
	MOVLW      132
	XORWF      _cr+0, 0
L__getstateNum388:
	BTFSC      STATUS+0, 2
	GOTO       L__getstateNum323
	GOTO       L_getstateNum22
L__getstateNum323:
	MOVLW      6
	MOVWF      _stateNum+0
	MOVLW      0
	MOVWF      _stateNum+1
	GOTO       L_getstateNum23
L_getstateNum22:
;MyProject.c,105 :: 		else if (cr == 14 || cr == 15 || cr >= 150) stateNum = 7;
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__getstateNum389
	MOVLW      14
	XORWF      _cr+0, 0
L__getstateNum389:
	BTFSC      STATUS+0, 2
	GOTO       L__getstateNum322
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__getstateNum390
	MOVLW      15
	XORWF      _cr+0, 0
L__getstateNum390:
	BTFSC      STATUS+0, 2
	GOTO       L__getstateNum322
	MOVLW      0
	SUBWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__getstateNum391
	MOVLW      150
	SUBWF      _cr+0, 0
L__getstateNum391:
	BTFSC      STATUS+0, 0
	GOTO       L__getstateNum322
	GOTO       L_getstateNum26
L__getstateNum322:
	MOVLW      7
	MOVWF      _stateNum+0
	MOVLW      0
	MOVWF      _stateNum+1
	GOTO       L_getstateNum27
L_getstateNum26:
;MyProject.c,106 :: 		else stateNum = 0;
	CLRF       _stateNum+0
	CLRF       _stateNum+1
L_getstateNum27:
L_getstateNum23:
L_getstateNum19:
L_getstateNum15:
L_getstateNum11:
L_getstateNum7:
L_getstateNum3:
;MyProject.c,107 :: 		}
L_end_getstateNum:
	RETURN
; end of _getstateNum

_interrupt:

;MyProject.c,109 :: 		void interrupt() {
;MyProject.c,110 :: 		if (TMR0IF_bit) {
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_interrupt28
;MyProject.c,111 :: 		TMR0IF_bit = 0; // clear TMR0IF
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;MyProject.c,112 :: 		cNum++; // increment counter
	INCF       _cNum+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cNum+1, 1
;MyProject.c,113 :: 		if (i0f == 1) y0++;
	MOVLW      0
	XORWF      _i0f+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt394
	MOVLW      1
	XORWF      _i0f+0, 0
L__interrupt394:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt29
	INCF       _y0+0, 1
	BTFSC      STATUS+0, 2
	INCF       _y0+1, 1
L_interrupt29:
;MyProject.c,114 :: 		if (i1f == 1) y1++;
	MOVLW      0
	XORWF      _i1f+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt395
	MOVLW      1
	XORWF      _i1f+0, 0
L__interrupt395:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt30
	INCF       _y1+0, 1
	BTFSC      STATUS+0, 2
	INCF       _y1+1, 1
L_interrupt30:
;MyProject.c,115 :: 		if (i2f == 1) y2++;
	MOVLW      0
	XORWF      _i2f+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt396
	MOVLW      1
	XORWF      _i2f+0, 0
L__interrupt396:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt31
	INCF       _y2+0, 1
	BTFSC      STATUS+0, 2
	INCF       _y2+1, 1
L_interrupt31:
;MyProject.c,116 :: 		if (i3f == 1) y3++;
	MOVLW      0
	XORWF      _i3f+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt397
	MOVLW      1
	XORWF      _i3f+0, 0
L__interrupt397:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt32
	INCF       _y3+0, 1
	BTFSC      STATUS+0, 2
	INCF       _y3+1, 1
L_interrupt32:
;MyProject.c,118 :: 		if (cNum >= cycle) {
	MOVF       _cNum+0, 0
	MOVWF      R0
	MOVF       _cNum+1, 0
	MOVWF      R1
	CALL       _word2double+0
	MOVF       _cycle+0, 0
	MOVWF      R4
	MOVF       _cycle+1, 0
	MOVWF      R5
	MOVF       _cycle+2, 0
	MOVWF      R6
	MOVF       _cycle+3, 0
	MOVWF      R7
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt33
;MyProject.c,119 :: 		secF = 1;
	MOVLW      1
	MOVWF      _secF+0
	MOVLW      0
	MOVWF      _secF+1
;MyProject.c,120 :: 		TMR0IE_bit = 0;
	BCF        TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
;MyProject.c,121 :: 		}
L_interrupt33:
;MyProject.c,122 :: 		if (y0 >= cycle) {
	MOVF       _y0+0, 0
	MOVWF      R0
	MOVF       _y0+1, 0
	MOVWF      R1
	CALL       _word2double+0
	MOVF       _cycle+0, 0
	MOVWF      R4
	MOVF       _cycle+1, 0
	MOVWF      R5
	MOVF       _cycle+2, 0
	MOVWF      R6
	MOVF       _cycle+3, 0
	MOVWF      R7
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt34
;MyProject.c,123 :: 		va0 = 1;
	MOVLW      1
	MOVWF      _va0+0
	MOVLW      0
	MOVWF      _va0+1
;MyProject.c,124 :: 		}
L_interrupt34:
;MyProject.c,125 :: 		if (y1 >= cycle) {
	MOVF       _y1+0, 0
	MOVWF      R0
	MOVF       _y1+1, 0
	MOVWF      R1
	CALL       _word2double+0
	MOVF       _cycle+0, 0
	MOVWF      R4
	MOVF       _cycle+1, 0
	MOVWF      R5
	MOVF       _cycle+2, 0
	MOVWF      R6
	MOVF       _cycle+3, 0
	MOVWF      R7
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt35
;MyProject.c,126 :: 		va1 = 1;
	MOVLW      1
	MOVWF      _va1+0
	MOVLW      0
	MOVWF      _va1+1
;MyProject.c,127 :: 		}
L_interrupt35:
;MyProject.c,128 :: 		if (y2 >= cycle) {
	MOVF       _y2+0, 0
	MOVWF      R0
	MOVF       _y2+1, 0
	MOVWF      R1
	CALL       _word2double+0
	MOVF       _cycle+0, 0
	MOVWF      R4
	MOVF       _cycle+1, 0
	MOVWF      R5
	MOVF       _cycle+2, 0
	MOVWF      R6
	MOVF       _cycle+3, 0
	MOVWF      R7
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt36
;MyProject.c,129 :: 		va2 = 1;
	MOVLW      1
	MOVWF      _va2+0
	MOVLW      0
	MOVWF      _va2+1
;MyProject.c,130 :: 		}
L_interrupt36:
;MyProject.c,131 :: 		if (y3 >= cycle) {
	MOVF       _y3+0, 0
	MOVWF      R0
	MOVF       _y3+1, 0
	MOVWF      R1
	CALL       _word2double+0
	MOVF       _cycle+0, 0
	MOVWF      R4
	MOVF       _cycle+1, 0
	MOVWF      R5
	MOVF       _cycle+2, 0
	MOVWF      R6
	MOVF       _cycle+3, 0
	MOVWF      R7
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt37
;MyProject.c,132 :: 		va3 = 1;
	MOVLW      1
	MOVWF      _va3+0
	MOVLW      0
	MOVWF      _va3+1
;MyProject.c,133 :: 		}
L_interrupt37:
;MyProject.c,134 :: 		if (hF == 1) cycleF++;
	MOVLW      0
	XORWF      _hF+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt398
	MOVLW      1
	XORWF      _hF+0, 0
L__interrupt398:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt38
	INCF       _cycleF+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cycleF+1, 1
L_interrupt38:
;MyProject.c,135 :: 		if (lF == 1) cycleL++;
	MOVLW      0
	XORWF      _lF+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt399
	MOVLW      1
	XORWF      _lF+0, 0
L__interrupt399:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt39
	INCF       _cycleL+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cycleL+1, 1
L_interrupt39:
;MyProject.c,136 :: 		if (cycleF >= hNum) {
	MOVF       _hNum+1, 0
	SUBWF      _cycleF+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt400
	MOVF       _hNum+0, 0
	SUBWF      _cycleF+0, 0
L__interrupt400:
	BTFSS      STATUS+0, 0
	GOTO       L_interrupt40
;MyProject.c,137 :: 		hF = 0;
	CLRF       _hF+0
	CLRF       _hF+1
;MyProject.c,138 :: 		cycleF = 0;
	CLRF       _cycleF+0
	CLRF       _cycleF+1
;MyProject.c,139 :: 		val_hF = 1;
	MOVLW      1
	MOVWF      _val_hF+0
	MOVLW      0
	MOVWF      _val_hF+1
;MyProject.c,140 :: 		}
L_interrupt40:
;MyProject.c,142 :: 		if (cycleL >= lNum) {
	MOVF       _lNum+1, 0
	SUBWF      _cycleL+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt401
	MOVF       _lNum+0, 0
	SUBWF      _cycleL+0, 0
L__interrupt401:
	BTFSS      STATUS+0, 0
	GOTO       L_interrupt41
;MyProject.c,143 :: 		lF = 0;
	CLRF       _lF+0
	CLRF       _lF+1
;MyProject.c,144 :: 		cycleL = 0;
	CLRF       _cycleL+0
	CLRF       _cycleL+1
;MyProject.c,145 :: 		val_lF = 1;
	MOVLW      1
	MOVWF      _val_lF+0
	MOVLW      0
	MOVWF      _val_lF+1
;MyProject.c,146 :: 		}
L_interrupt41:
;MyProject.c,148 :: 		if (f00 == 1) {
	MOVLW      0
	XORWF      _f00+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt402
	MOVLW      1
	XORWF      _f00+0, 0
L__interrupt402:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt42
;MyProject.c,149 :: 		c00++;
	INCF       _c00+0, 1
	BTFSC      STATUS+0, 2
	INCF       _c00+1, 1
;MyProject.c,150 :: 		if (c00 >= 90) {
	MOVLW      0
	SUBWF      _c00+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt403
	MOVLW      90
	SUBWF      _c00+0, 0
L__interrupt403:
	BTFSS      STATUS+0, 0
	GOTO       L_interrupt43
;MyProject.c,151 :: 		TMR1ON_bit = 0;
	BCF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;MyProject.c,152 :: 		f00 = 0;
	CLRF       _f00+0
	CLRF       _f00+1
;MyProject.c,153 :: 		c00 = 0;
	CLRF       _c00+0
	CLRF       _c00+1
;MyProject.c,154 :: 		v00 = 1;
	MOVLW      1
	MOVWF      _v00+0
	MOVLW      0
	MOVWF      _v00+1
;MyProject.c,155 :: 		} //63 : 1000ms , 90: 1500ms
L_interrupt43:
;MyProject.c,156 :: 		}
L_interrupt42:
;MyProject.c,158 :: 		if (f0 == 1) {
	MOVLW      0
	XORWF      _f0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt404
	MOVLW      1
	XORWF      _f0+0, 0
L__interrupt404:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt44
;MyProject.c,159 :: 		c0++;
	INCF       _c0+0, 1
	BTFSC      STATUS+0, 2
	INCF       _c0+1, 1
;MyProject.c,160 :: 		if (c0 >= 63) {
	MOVLW      0
	SUBWF      _c0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt405
	MOVLW      63
	SUBWF      _c0+0, 0
L__interrupt405:
	BTFSS      STATUS+0, 0
	GOTO       L_interrupt45
;MyProject.c,161 :: 		f0 = 0;
	CLRF       _f0+0
	CLRF       _f0+1
;MyProject.c,162 :: 		c0 = 0;
	CLRF       _c0+0
	CLRF       _c0+1
;MyProject.c,163 :: 		v0 = 1;
	MOVLW      1
	MOVWF      _v0+0
	MOVLW      0
	MOVWF      _v0+1
;MyProject.c,164 :: 		} //60 : 1000ms
L_interrupt45:
;MyProject.c,165 :: 		}
L_interrupt44:
;MyProject.c,167 :: 		if (sQ == 1) {
	MOVLW      0
	XORWF      _sQ+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt406
	MOVLW      1
	XORWF      _sQ+0, 0
L__interrupt406:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt46
;MyProject.c,168 :: 		cQ++;
	INCF       _cQ+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cQ+1, 1
;MyProject.c,169 :: 		if (cQ < 1800) {
	MOVLW      7
	SUBWF      _cQ+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt407
	MOVLW      8
	SUBWF      _cQ+0, 0
L__interrupt407:
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt47
;MyProject.c,170 :: 		S0 = 1;
	BSF        PORTA+0, 0
;MyProject.c,171 :: 		WFS = 0;
	CLRF       _WFS+0
	CLRF       _WFS+1
;MyProject.c,172 :: 		} // : 30 sec  1800, 7200
	GOTO       L_interrupt48
L_interrupt47:
;MyProject.c,173 :: 		else if (cQ >= 1800 && cQ < 7200) {
	MOVLW      7
	SUBWF      _cQ+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt408
	MOVLW      8
	SUBWF      _cQ+0, 0
L__interrupt408:
	BTFSS      STATUS+0, 0
	GOTO       L_interrupt51
	MOVLW      28
	SUBWF      _cQ+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt409
	MOVLW      32
	SUBWF      _cQ+0, 0
L__interrupt409:
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt51
L__interrupt329:
;MyProject.c,174 :: 		WFS = 1;
	MOVLW      1
	MOVWF      _WFS+0
	MOVLW      0
	MOVWF      _WFS+1
;MyProject.c,175 :: 		} else if (cQ >= 7200) {
	GOTO       L_interrupt52
L_interrupt51:
	MOVLW      28
	SUBWF      _cQ+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt410
	MOVLW      32
	SUBWF      _cQ+0, 0
L__interrupt410:
	BTFSS      STATUS+0, 0
	GOTO       L_interrupt53
;MyProject.c,176 :: 		cQ = 7500;
	MOVLW      76
	MOVWF      _cQ+0
	MOVLW      29
	MOVWF      _cQ+1
;MyProject.c,177 :: 		WFS = 0;
	CLRF       _WFS+0
	CLRF       _WFS+1
;MyProject.c,178 :: 		S0 = 0;
	BCF        PORTA+0, 0
;MyProject.c,179 :: 		} // : 90 sec
L_interrupt53:
L_interrupt52:
L_interrupt48:
;MyProject.c,180 :: 		} else {
	GOTO       L_interrupt54
L_interrupt46:
;MyProject.c,181 :: 		S0 = 0;
	BCF        PORTA+0, 0
;MyProject.c,182 :: 		}
L_interrupt54:
;MyProject.c,183 :: 		}
L_interrupt28:
;MyProject.c,184 :: 		if (TMR1IF_bit) {
	BTFSS      TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
	GOTO       L_interrupt55
;MyProject.c,185 :: 		cnt++; // increment counter
	INCF       _cnt+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cnt+1, 1
;MyProject.c,186 :: 		TMR1IF_bit = 0; // clear TMR0IF
	BCF        TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
;MyProject.c,187 :: 		TMR1H = 0x80;
	MOVLW      128
	MOVWF      TMR1H+0
;MyProject.c,188 :: 		TMR1L = 0x00;
	CLRF       TMR1L+0
;MyProject.c,189 :: 		}
L_interrupt55:
;MyProject.c,190 :: 		}
L_end_interrupt:
L__interrupt393:
	RETFIE     %s
; end of _interrupt

_doQ:

;MyProject.c,192 :: 		void doQ(unsigned state) { //ActF
;MyProject.c,193 :: 		getstateNum();
	CALL       _getstateNum+0
;MyProject.c,194 :: 		if (state == 0) cQ = 0;
	MOVLW      0
	XORWF      FARG_doQ_state+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doQ412
	MOVLW      0
	XORWF      FARG_doQ_state+0, 0
L__doQ412:
	BTFSS      STATUS+0, 2
	GOTO       L_doQ56
	CLRF       _cQ+0
	CLRF       _cQ+1
	GOTO       L_doQ57
L_doQ56:
;MyProject.c,195 :: 		else cQ = Q[state];
	MOVF       FARG_doQ_state+0, 0
	MOVWF      R0
	MOVF       FARG_doQ_state+1, 0
	MOVWF      R1
	LSLF       R0, 1
	RLF        R1, 1
	MOVLW      _Q+0
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      hi_addr(_Q+0)
	ADDWFC     R1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      _cQ+0
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      _cQ+1
L_doQ57:
;MyProject.c,196 :: 		sQ = 1;
	MOVLW      1
	MOVWF      _sQ+0
	MOVLW      0
	MOVWF      _sQ+1
;MyProject.c,197 :: 		}
L_end_doQ:
	RETURN
; end of _doQ

_paQ:

;MyProject.c,198 :: 		void paQ() { //pause ActF
;MyProject.c,199 :: 		sQ = 0;
	CLRF       _sQ+0
	CLRF       _sQ+1
;MyProject.c,200 :: 		}
L_end_paQ:
	RETURN
; end of _paQ

_hist:

;MyProject.c,201 :: 		void hist() {
;MyProject.c,202 :: 		getstateNum();
	CALL       _getstateNum+0
;MyProject.c,203 :: 		if (prev1 != stateNum) {
	MOVF       _prev1+1, 0
	XORWF      _stateNum+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__hist415
	MOVF       _stateNum+0, 0
	XORWF      _prev1+0, 0
L__hist415:
	BTFSC      STATUS+0, 2
	GOTO       L_hist58
;MyProject.c,204 :: 		prev3 = prev2;
	MOVF       _prev2+0, 0
	MOVWF      _prev3+0
	MOVF       _prev2+1, 0
	MOVWF      _prev3+1
;MyProject.c,205 :: 		prev2 = prev1;
	MOVF       _prev1+0, 0
	MOVWF      _prev2+0
	MOVF       _prev1+1, 0
	MOVWF      _prev2+1
;MyProject.c,206 :: 		prev1 = stateNum;
	MOVF       _stateNum+0, 0
	MOVWF      _prev1+0
	MOVF       _stateNum+1, 0
	MOVWF      _prev1+1
;MyProject.c,207 :: 		}
L_hist58:
;MyProject.c,208 :: 		}
L_end_hist:
	RETURN
; end of _hist

_complete_init:

;MyProject.c,209 :: 		void complete_init() {
;MyProject.c,210 :: 		S1 = 0;
	BCF        PORTA+0, 1
;MyProject.c,211 :: 		S2 = 0;
	BCF        PORTA+0, 2
;MyProject.c,212 :: 		S3 = 0;
	BCF        PORTC+0, 0
;MyProject.c,213 :: 		S0 = 0;
	BCF        PORTA+0, 0
;MyProject.c,214 :: 		paQ();
	CALL       _paQ+0
;MyProject.c,215 :: 		cr = 0;
	CLRF       _cr+0
	CLRF       _cr+1
;MyProject.c,216 :: 		prev3 = 0;
	CLRF       _prev3+0
	CLRF       _prev3+1
;MyProject.c,217 :: 		prev2 = 0;
	CLRF       _prev2+0
	CLRF       _prev2+1
;MyProject.c,218 :: 		prev1 = 0;
	CLRF       _prev1+0
	CLRF       _prev1+1
;MyProject.c,219 :: 		ST1 = 0;
	BCF        PORTC+0, 6
;MyProject.c,220 :: 		for (i = 0; i < 16; i++) {
	CLRF       _i+0
	CLRF       _i+1
L_complete_init59:
	MOVLW      0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__complete_init417
	MOVLW      16
	SUBWF      _i+0, 0
L__complete_init417:
	BTFSC      STATUS+0, 0
	GOTO       L_complete_init60
;MyProject.c,221 :: 		Q[i] = 0;
	MOVF       _i+0, 0
	MOVWF      R0
	MOVF       _i+1, 0
	MOVWF      R1
	LSLF       R0, 1
	RLF        R1, 1
	MOVLW      _Q+0
	ADDWF      R0, 0
	MOVWF      FSR1L
	MOVLW      hi_addr(_Q+0)
	ADDWFC     R1, 0
	MOVWF      FSR1H
	CLRF       INDF1+0
	ADDFSR     1, 1
	CLRF       INDF1+0
;MyProject.c,220 :: 		for (i = 0; i < 16; i++) {
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;MyProject.c,222 :: 		}
	GOTO       L_complete_init59
L_complete_init60:
;MyProject.c,223 :: 		}
L_end_complete_init:
	RETURN
; end of _complete_init

_doAction:

;MyProject.c,224 :: 		void doAction() {
;MyProject.c,227 :: 		if (prev1 != 0) {
	MOVLW      0
	XORWF      _prev1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction419
	MOVLW      0
	XORWF      _prev1+0, 0
L__doAction419:
	BTFSC      STATUS+0, 2
	GOTO       L_doAction62
;MyProject.c,228 :: 		getstateNum();
	CALL       _getstateNum+0
;MyProject.c,229 :: 		Q[stateNum] = cQ;
	MOVF       _stateNum+0, 0
	MOVWF      R0
	MOVF       _stateNum+1, 0
	MOVWF      R1
	LSLF       R0, 1
	RLF        R1, 1
	MOVLW      _Q+0
	ADDWF      R0, 0
	MOVWF      FSR1L
	MOVLW      hi_addr(_Q+0)
	ADDWFC     R1, 0
	MOVWF      FSR1H
	MOVF       _cQ+0, 0
	MOVWF      INDF1+0
	MOVF       _cQ+1, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
;MyProject.c,230 :: 		} // if not pressed HIGH LOW LOW LOW, in the past,
L_doAction62:
;MyProject.c,232 :: 		if (I0 == 0) //I7: s:0, R:1
	MOVLW      0
	XORWF      _I0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction420
	MOVLW      0
	XORWF      _I0+0, 0
L__doAction420:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction63
;MyProject.c,234 :: 		complete_init();
	CALL       _complete_init+0
;MyProject.c,235 :: 		} else if (I0 == 1 && fI0H == 1) {
	GOTO       L_doAction64
L_doAction63:
	MOVLW      0
	XORWF      _I0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction421
	MOVLW      1
	XORWF      _I0+0, 0
L__doAction421:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction67
	MOVLW      0
	XORWF      _fI0H+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction422
	MOVLW      1
	XORWF      _fI0H+0, 0
L__doAction422:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction67
L__doAction348:
;MyProject.c,236 :: 		f0 = 1;
	MOVLW      1
	MOVWF      _f0+0
	MOVLW      0
	MOVWF      _f0+1
;MyProject.c,237 :: 		S1 = 1;
	BSF        PORTA+0, 1
;MyProject.c,238 :: 		S2 = 1;
	BSF        PORTA+0, 2
;MyProject.c,239 :: 		S3 = 1;
	BSF        PORTC+0, 0
;MyProject.c,240 :: 		paQ();
	CALL       _paQ+0
;MyProject.c,241 :: 		cr = 0;
	CLRF       _cr+0
	CLRF       _cr+1
;MyProject.c,242 :: 		} else if (I0 == 1 && I1 == 0 && I2 == 0 && I3 == 0 && fI0H == 0) //Excel 0, 1:       I7: s:0, R:1
	GOTO       L_doAction68
L_doAction67:
	MOVLW      0
	XORWF      _I0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction423
	MOVLW      1
	XORWF      _I0+0, 0
L__doAction423:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction71
	MOVLW      0
	XORWF      _I1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction424
	MOVLW      0
	XORWF      _I1+0, 0
L__doAction424:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction71
	MOVLW      0
	XORWF      _I2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction425
	MOVLW      0
	XORWF      _I2+0, 0
L__doAction425:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction71
	MOVLW      0
	XORWF      _I3+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction426
	MOVLW      0
	XORWF      _I3+0, 0
L__doAction426:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction71
	MOVLW      0
	XORWF      _fI0H+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction427
	MOVLW      0
	XORWF      _fI0H+0, 0
L__doAction427:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction71
L__doAction347:
;MyProject.c,244 :: 		complete_init();
	CALL       _complete_init+0
;MyProject.c,245 :: 		}
L_doAction71:
L_doAction68:
L_doAction64:
;MyProject.c,247 :: 		if (I0 == 1 && I1 == 0 && I2 == 0 && I3 == 1 && fI0H == 0) //Excel 2, 3
	MOVLW      0
	XORWF      _I0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction428
	MOVLW      1
	XORWF      _I0+0, 0
L__doAction428:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction74
	MOVLW      0
	XORWF      _I1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction429
	MOVLW      0
	XORWF      _I1+0, 0
L__doAction429:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction74
	MOVLW      0
	XORWF      _I2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction430
	MOVLW      0
	XORWF      _I2+0, 0
L__doAction430:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction74
	MOVLW      0
	XORWF      _I3+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction431
	MOVLW      1
	XORWF      _I3+0, 0
L__doAction431:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction74
	MOVLW      0
	XORWF      _fI0H+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction432
	MOVLW      0
	XORWF      _fI0H+0, 0
L__doAction432:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction74
L__doAction346:
;MyProject.c,249 :: 		S1 = 0;
	BCF        PORTA+0, 1
;MyProject.c,250 :: 		S2 = 0;
	BCF        PORTA+0, 2
;MyProject.c,251 :: 		hF = 1;
	MOVLW      1
	MOVWF      _hF+0
	MOVLW      0
	MOVWF      _hF+1
;MyProject.c,252 :: 		WBS = 1;
	MOVLW      1
	MOVWF      _WBS+0
	MOVLW      0
	MOVWF      _WBS+1
;MyProject.c,253 :: 		Fp[0] = 0;
	CLRF       _Fp+0
	CLRF       _Fp+1
;MyProject.c,254 :: 		Fp[1] = 0;
	CLRF       _Fp+2
	CLRF       _Fp+3
;MyProject.c,255 :: 		Fp[2] = 1;
	MOVLW      1
	MOVWF      _Fp+4
	MOVLW      0
	MOVWF      _Fp+5
;MyProject.c,257 :: 		if (cr == 70 || cr == 7) {
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction433
	MOVLW      70
	XORWF      _cr+0, 0
L__doAction433:
	BTFSC      STATUS+0, 2
	GOTO       L__doAction345
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction434
	MOVLW      7
	XORWF      _cr+0, 0
L__doAction434:
	BTFSC      STATUS+0, 2
	GOTO       L__doAction345
	GOTO       L_doAction77
L__doAction345:
;MyProject.c,258 :: 		cr = 72;
	MOVLW      72
	MOVWF      _cr+0
	MOVLW      0
	MOVWF      _cr+1
;MyProject.c,259 :: 		if (prev2 == 1) {
	MOVLW      0
	XORWF      _prev2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction435
	MOVLW      1
	XORWF      _prev2+0, 0
L__doAction435:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction78
;MyProject.c,260 :: 		cr = 30;
	MOVLW      30
	MOVWF      _cr+0
	MOVLW      0
	MOVWF      _cr+1
;MyProject.c,261 :: 		doQ(1);
	MOVLW      1
	MOVWF      FARG_doQ_state+0
	MOVLW      0
	MOVWF      FARG_doQ_state+1
	CALL       _doQ+0
;MyProject.c,262 :: 		} else if (prev2 == 2) {
	GOTO       L_doAction79
L_doAction78:
	MOVLW      0
	XORWF      _prev2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction436
	MOVLW      2
	XORWF      _prev2+0, 0
L__doAction436:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction80
;MyProject.c,263 :: 		cr = 50;
	MOVLW      50
	MOVWF      _cr+0
	MOVLW      0
	MOVWF      _cr+1
;MyProject.c,264 :: 		}
L_doAction80:
L_doAction79:
;MyProject.c,265 :: 		} else if (cr == 72) {}
	GOTO       L_doAction81
L_doAction77:
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction437
	MOVLW      72
	XORWF      _cr+0, 0
L__doAction437:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction82
	GOTO       L_doAction83
L_doAction82:
;MyProject.c,266 :: 		else if (cr == 110 || cr == 11) {
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction438
	MOVLW      110
	XORWF      _cr+0, 0
L__doAction438:
	BTFSC      STATUS+0, 2
	GOTO       L__doAction344
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction439
	MOVLW      11
	XORWF      _cr+0, 0
L__doAction439:
	BTFSC      STATUS+0, 2
	GOTO       L__doAction344
	GOTO       L_doAction86
L__doAction344:
;MyProject.c,267 :: 		cr = 112;
	MOVLW      112
	MOVWF      _cr+0
	MOVLW      0
	MOVWF      _cr+1
;MyProject.c,268 :: 		if (prev2 == 1) {
	MOVLW      0
	XORWF      _prev2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction440
	MOVLW      1
	XORWF      _prev2+0, 0
L__doAction440:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction87
;MyProject.c,269 :: 		cr = 30;
	MOVLW      30
	MOVWF      _cr+0
	MOVLW      0
	MOVWF      _cr+1
;MyProject.c,270 :: 		doQ(1);
	MOVLW      1
	MOVWF      FARG_doQ_state+0
	MOVLW      0
	MOVWF      FARG_doQ_state+1
	CALL       _doQ+0
;MyProject.c,271 :: 		} else if (prev2 == 4) {
	GOTO       L_doAction88
L_doAction87:
	MOVLW      0
	XORWF      _prev2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction441
	MOVLW      4
	XORWF      _prev2+0, 0
L__doAction441:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction89
;MyProject.c,272 :: 		cr = 30;
	MOVLW      30
	MOVWF      _cr+0
	MOVLW      0
	MOVWF      _cr+1
;MyProject.c,273 :: 		}
L_doAction89:
L_doAction88:
;MyProject.c,274 :: 		} else if (cr == 112) {}
	GOTO       L_doAction90
L_doAction86:
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction442
	MOVLW      112
	XORWF      _cr+0, 0
L__doAction442:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction91
	GOTO       L_doAction92
L_doAction91:
;MyProject.c,275 :: 		else if (cr == 152) {
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction443
	MOVLW      152
	XORWF      _cr+0, 0
L__doAction443:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction93
;MyProject.c,276 :: 		cr = 1522;
	MOVLW      242
	MOVWF      _cr+0
	MOVLW      5
	MOVWF      _cr+1
;MyProject.c,277 :: 		}
	GOTO       L_doAction94
L_doAction93:
;MyProject.c,278 :: 		else if (cr == 1522) {}
	MOVF       _cr+1, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L__doAction444
	MOVLW      242
	XORWF      _cr+0, 0
L__doAction444:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction95
	GOTO       L_doAction96
L_doAction95:
;MyProject.c,279 :: 		else if (cr == 153) {
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction445
	MOVLW      153
	XORWF      _cr+0, 0
L__doAction445:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction97
;MyProject.c,280 :: 		cr = 1531;
	MOVLW      251
	MOVWF      _cr+0
	MOVLW      5
	MOVWF      _cr+1
;MyProject.c,281 :: 		}
	GOTO       L_doAction98
L_doAction97:
;MyProject.c,282 :: 		else if (cr == 1531) {}
	MOVF       _cr+1, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L__doAction446
	MOVLW      251
	XORWF      _cr+0, 0
L__doAction446:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction99
	GOTO       L_doAction100
L_doAction99:
;MyProject.c,283 :: 		else if (cr == 3) {
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction447
	MOVLW      3
	XORWF      _cr+0, 0
L__doAction447:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction101
;MyProject.c,284 :: 		cr = 30;
	MOVLW      30
	MOVWF      _cr+0
	MOVLW      0
	MOVWF      _cr+1
;MyProject.c,285 :: 		}
	GOTO       L_doAction102
L_doAction101:
;MyProject.c,286 :: 		else if (cr == 30) {}
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction448
	MOVLW      30
	XORWF      _cr+0, 0
L__doAction448:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction103
	GOTO       L_doAction104
L_doAction103:
;MyProject.c,288 :: 		if (I7 == 0) { //Excel 2:
	MOVLW      0
	XORWF      _I7+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction449
	MOVLW      0
	XORWF      _I7+0, 0
L__doAction449:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction105
;MyProject.c,289 :: 		cr = 2;
	MOVLW      2
	MOVWF      _cr+0
	MOVLW      0
	MOVWF      _cr+1
;MyProject.c,290 :: 		cQ = 0;
	CLRF       _cQ+0
	CLRF       _cQ+1
;MyProject.c,291 :: 		paQ();
	CALL       _paQ+0
;MyProject.c,292 :: 		S0 = 0;
	BCF        PORTA+0, 0
;MyProject.c,293 :: 		} else //Excel 3:
	GOTO       L_doAction106
L_doAction105:
;MyProject.c,295 :: 		if (cr == 2) {
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction450
	MOVLW      2
	XORWF      _cr+0, 0
L__doAction450:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction107
;MyProject.c,296 :: 		cr = 3;
	MOVLW      3
	MOVWF      _cr+0
	MOVLW      0
	MOVWF      _cr+1
;MyProject.c,297 :: 		cQ = 0;
	CLRF       _cQ+0
	CLRF       _cQ+1
;MyProject.c,298 :: 		doQ(0);
	CLRF       FARG_doQ_state+0
	CLRF       FARG_doQ_state+1
	CALL       _doQ+0
;MyProject.c,299 :: 		} else {
	GOTO       L_doAction108
L_doAction107:
;MyProject.c,300 :: 		cr = 3;
	MOVLW      3
	MOVWF      _cr+0
	MOVLW      0
	MOVWF      _cr+1
;MyProject.c,301 :: 		cQ = 0;
	CLRF       _cQ+0
	CLRF       _cQ+1
;MyProject.c,302 :: 		doQ(1);
	MOVLW      1
	MOVWF      FARG_doQ_state+0
	MOVLW      0
	MOVWF      FARG_doQ_state+1
	CALL       _doQ+0
;MyProject.c,303 :: 		}
L_doAction108:
;MyProject.c,305 :: 		}
L_doAction106:
;MyProject.c,307 :: 		}
L_doAction104:
L_doAction102:
L_doAction100:
L_doAction98:
L_doAction96:
L_doAction94:
L_doAction92:
L_doAction90:
L_doAction83:
L_doAction81:
;MyProject.c,308 :: 		}
L_doAction74:
;MyProject.c,309 :: 		if (I0 == 1 && I1 == 0 && I2 == 1 && I3 == 0 && fI0H == 0) //Excel 4, 5
	MOVLW      0
	XORWF      _I0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction451
	MOVLW      1
	XORWF      _I0+0, 0
L__doAction451:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction111
	MOVLW      0
	XORWF      _I1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction452
	MOVLW      0
	XORWF      _I1+0, 0
L__doAction452:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction111
	MOVLW      0
	XORWF      _I2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction453
	MOVLW      1
	XORWF      _I2+0, 0
L__doAction453:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction111
	MOVLW      0
	XORWF      _I3+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction454
	MOVLW      0
	XORWF      _I3+0, 0
L__doAction454:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction111
	MOVLW      0
	XORWF      _fI0H+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction455
	MOVLW      0
	XORWF      _fI0H+0, 0
L__doAction455:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction111
L__doAction343:
;MyProject.c,311 :: 		S1 = 0;
	BCF        PORTA+0, 1
;MyProject.c,312 :: 		hF = 1;
	MOVLW      1
	MOVWF      _hF+0
	MOVLW      0
	MOVWF      _hF+1
;MyProject.c,313 :: 		WBS = 1;
	MOVLW      1
	MOVWF      _WBS+0
	MOVLW      0
	MOVWF      _WBS+1
;MyProject.c,314 :: 		Fp[0] = 0;
	CLRF       _Fp+0
	CLRF       _Fp+1
;MyProject.c,315 :: 		Fp[1] = 1;
	MOVLW      1
	MOVWF      _Fp+2
	MOVLW      0
	MOVWF      _Fp+3
;MyProject.c,316 :: 		Fp[2] = 0;
	CLRF       _Fp+4
	CLRF       _Fp+5
;MyProject.c,317 :: 		S3 = 0;
	BCF        PORTC+0, 0
;MyProject.c,319 :: 		if (cr == 70 || cr == 7) {
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction456
	MOVLW      70
	XORWF      _cr+0, 0
L__doAction456:
	BTFSC      STATUS+0, 2
	GOTO       L__doAction342
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction457
	MOVLW      7
	XORWF      _cr+0, 0
L__doAction457:
	BTFSC      STATUS+0, 2
	GOTO       L__doAction342
	GOTO       L_doAction114
L__doAction342:
;MyProject.c,320 :: 		cr = 71;
	MOVLW      71
	MOVWF      _cr+0
	MOVLW      0
	MOVWF      _cr+1
;MyProject.c,322 :: 		if (prev2 == 1) {
	MOVLW      0
	XORWF      _prev2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction458
	MOVLW      1
	XORWF      _prev2+0, 0
L__doAction458:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction115
;MyProject.c,323 :: 		cr = 50; // doQ(2);
	MOVLW      50
	MOVWF      _cr+0
	MOVLW      0
	MOVWF      _cr+1
;MyProject.c,324 :: 		} else if (prev2 == 2) {
	GOTO       L_doAction116
L_doAction115:
	MOVLW      0
	XORWF      _prev2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction459
	MOVLW      2
	XORWF      _prev2+0, 0
L__doAction459:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction117
;MyProject.c,325 :: 		cr = 50;
	MOVLW      50
	MOVWF      _cr+0
	MOVLW      0
	MOVWF      _cr+1
;MyProject.c,326 :: 		doQ(2);
	MOVLW      2
	MOVWF      FARG_doQ_state+0
	MOVLW      0
	MOVWF      FARG_doQ_state+1
	CALL       _doQ+0
;MyProject.c,327 :: 		}
L_doAction117:
L_doAction116:
;MyProject.c,328 :: 		}
	GOTO       L_doAction118
L_doAction114:
;MyProject.c,329 :: 		else if (cr == 71) {}
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction460
	MOVLW      71
	XORWF      _cr+0, 0
L__doAction460:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction119
	GOTO       L_doAction120
L_doAction119:
;MyProject.c,330 :: 		else if (cr == 130 || cr == 13) {
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction461
	MOVLW      130
	XORWF      _cr+0, 0
L__doAction461:
	BTFSC      STATUS+0, 2
	GOTO       L__doAction341
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction462
	MOVLW      13
	XORWF      _cr+0, 0
L__doAction462:
	BTFSC      STATUS+0, 2
	GOTO       L__doAction341
	GOTO       L_doAction123
L__doAction341:
;MyProject.c,331 :: 		cr = 132;
	MOVLW      132
	MOVWF      _cr+0
	CLRF       _cr+1
;MyProject.c,332 :: 		if (prev2 == 2) {
	MOVLW      0
	XORWF      _prev2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction463
	MOVLW      2
	XORWF      _prev2+0, 0
L__doAction463:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction124
;MyProject.c,333 :: 		cr = 50;
	MOVLW      50
	MOVWF      _cr+0
	MOVLW      0
	MOVWF      _cr+1
;MyProject.c,334 :: 		doQ(2);
	MOVLW      2
	MOVWF      FARG_doQ_state+0
	MOVLW      0
	MOVWF      FARG_doQ_state+1
	CALL       _doQ+0
;MyProject.c,335 :: 		} else if (prev2 == 4) {
	GOTO       L_doAction125
L_doAction124:
	MOVLW      0
	XORWF      _prev2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction464
	MOVLW      4
	XORWF      _prev2+0, 0
L__doAction464:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction126
;MyProject.c,336 :: 		cr = 50;
	MOVLW      50
	MOVWF      _cr+0
	MOVLW      0
	MOVWF      _cr+1
;MyProject.c,337 :: 		}
L_doAction126:
L_doAction125:
;MyProject.c,338 :: 		}
	GOTO       L_doAction127
L_doAction123:
;MyProject.c,339 :: 		else if (cr == 132 || cr == 1512 || cr == 1532 || cr == 50) {}
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction465
	MOVLW      132
	XORWF      _cr+0, 0
L__doAction465:
	BTFSC      STATUS+0, 2
	GOTO       L__doAction340
	MOVF       _cr+1, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L__doAction466
	MOVLW      232
	XORWF      _cr+0, 0
L__doAction466:
	BTFSC      STATUS+0, 2
	GOTO       L__doAction340
	MOVF       _cr+1, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L__doAction467
	MOVLW      252
	XORWF      _cr+0, 0
L__doAction467:
	BTFSC      STATUS+0, 2
	GOTO       L__doAction340
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction468
	MOVLW      50
	XORWF      _cr+0, 0
L__doAction468:
	BTFSC      STATUS+0, 2
	GOTO       L__doAction340
	GOTO       L_doAction130
L__doAction340:
	GOTO       L_doAction131
L_doAction130:
;MyProject.c,340 :: 		else if (cr == 151) {
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction469
	MOVLW      151
	XORWF      _cr+0, 0
L__doAction469:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction132
;MyProject.c,341 :: 		cr = 1512;
	MOVLW      232
	MOVWF      _cr+0
	MOVLW      5
	MOVWF      _cr+1
;MyProject.c,342 :: 		}
	GOTO       L_doAction133
L_doAction132:
;MyProject.c,344 :: 		else if (cr == 153) {
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction470
	MOVLW      153
	XORWF      _cr+0, 0
L__doAction470:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction134
;MyProject.c,345 :: 		cr = 1532;
	MOVLW      252
	MOVWF      _cr+0
	MOVLW      5
	MOVWF      _cr+1
;MyProject.c,346 :: 		}
	GOTO       L_doAction135
L_doAction134:
;MyProject.c,348 :: 		else if (cr == 5) {
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction471
	MOVLW      5
	XORWF      _cr+0, 0
L__doAction471:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction136
;MyProject.c,349 :: 		cr = 50;
	MOVLW      50
	MOVWF      _cr+0
	MOVLW      0
	MOVWF      _cr+1
;MyProject.c,350 :: 		}
	GOTO       L_doAction137
L_doAction136:
;MyProject.c,353 :: 		if (I7 == 0) { //Excel 4:
	MOVLW      0
	XORWF      _I7+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction472
	MOVLW      0
	XORWF      _I7+0, 0
L__doAction472:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction138
;MyProject.c,354 :: 		cr = 4;
	MOVLW      4
	MOVWF      _cr+0
	MOVLW      0
	MOVWF      _cr+1
;MyProject.c,355 :: 		paQ();
	CALL       _paQ+0
;MyProject.c,356 :: 		} else //Excel 5:
	GOTO       L_doAction139
L_doAction138:
;MyProject.c,358 :: 		if (cr == 4) {
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction473
	MOVLW      4
	XORWF      _cr+0, 0
L__doAction473:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction140
;MyProject.c,359 :: 		cr = 5;
	MOVLW      5
	MOVWF      _cr+0
	MOVLW      0
	MOVWF      _cr+1
;MyProject.c,360 :: 		cQ = 0;
	CLRF       _cQ+0
	CLRF       _cQ+1
;MyProject.c,361 :: 		doQ(0);
	CLRF       FARG_doQ_state+0
	CLRF       FARG_doQ_state+1
	CALL       _doQ+0
;MyProject.c,362 :: 		S0 = 1;
	BSF        PORTA+0, 0
;MyProject.c,363 :: 		} else {
	GOTO       L_doAction141
L_doAction140:
;MyProject.c,364 :: 		cr = 5;
	MOVLW      5
	MOVWF      _cr+0
	MOVLW      0
	MOVWF      _cr+1
;MyProject.c,365 :: 		cQ = 0;
	CLRF       _cQ+0
	CLRF       _cQ+1
;MyProject.c,366 :: 		doQ(2);
	MOVLW      2
	MOVWF      FARG_doQ_state+0
	MOVLW      0
	MOVWF      FARG_doQ_state+1
	CALL       _doQ+0
;MyProject.c,367 :: 		}
L_doAction141:
;MyProject.c,368 :: 		}
L_doAction139:
;MyProject.c,370 :: 		}
L_doAction137:
L_doAction135:
L_doAction133:
L_doAction131:
L_doAction127:
L_doAction120:
L_doAction118:
;MyProject.c,372 :: 		}
L_doAction111:
;MyProject.c,375 :: 		if (I0 == 1 && I1 == 0 && I2 == 1 && I3 == 1 && fI0H == 0) //Excel 6, 7
	MOVLW      0
	XORWF      _I0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction474
	MOVLW      1
	XORWF      _I0+0, 0
L__doAction474:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction144
	MOVLW      0
	XORWF      _I1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction475
	MOVLW      0
	XORWF      _I1+0, 0
L__doAction475:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction144
	MOVLW      0
	XORWF      _I2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction476
	MOVLW      1
	XORWF      _I2+0, 0
L__doAction476:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction144
	MOVLW      0
	XORWF      _I3+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction477
	MOVLW      1
	XORWF      _I3+0, 0
L__doAction477:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction144
	MOVLW      0
	XORWF      _fI0H+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction478
	MOVLW      0
	XORWF      _fI0H+0, 0
L__doAction478:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction144
L__doAction339:
;MyProject.c,377 :: 		S1 = 0;
	BCF        PORTA+0, 1
;MyProject.c,378 :: 		hF = 1;
	MOVLW      1
	MOVWF      _hF+0
	MOVLW      0
	MOVWF      _hF+1
;MyProject.c,379 :: 		WBS = 1;
	MOVLW      1
	MOVWF      _WBS+0
	MOVLW      0
	MOVWF      _WBS+1
;MyProject.c,380 :: 		Fp[0] = 0;
	CLRF       _Fp+0
	CLRF       _Fp+1
;MyProject.c,381 :: 		Fp[1] = 1;
	MOVLW      1
	MOVWF      _Fp+2
	MOVLW      0
	MOVWF      _Fp+3
;MyProject.c,382 :: 		Fp[2] = 1;
	MOVLW      1
	MOVWF      _Fp+4
	MOVLW      0
	MOVWF      _Fp+5
;MyProject.c,383 :: 		if (cr == 7) {
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction479
	MOVLW      7
	XORWF      _cr+0, 0
L__doAction479:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction145
;MyProject.c,384 :: 		cr = 70;
	MOVLW      70
	MOVWF      _cr+0
	MOVLW      0
	MOVWF      _cr+1
;MyProject.c,385 :: 		}
	GOTO       L_doAction146
L_doAction145:
;MyProject.c,386 :: 		else if (cr == 70) {}
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction480
	MOVLW      70
	XORWF      _cr+0, 0
L__doAction480:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction147
	GOTO       L_doAction148
L_doAction147:
;MyProject.c,387 :: 		else if (cr == 150 || cr == 15) {
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction481
	MOVLW      150
	XORWF      _cr+0, 0
L__doAction481:
	BTFSC      STATUS+0, 2
	GOTO       L__doAction338
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction482
	MOVLW      15
	XORWF      _cr+0, 0
L__doAction482:
	BTFSC      STATUS+0, 2
	GOTO       L__doAction338
	GOTO       L_doAction151
L__doAction338:
;MyProject.c,388 :: 		cr = 153;   //ST1 = 1;
	MOVLW      153
	MOVWF      _cr+0
	CLRF       _cr+1
;MyProject.c,390 :: 		if (prev2 == 3) {
	MOVLW      0
	XORWF      _prev2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction483
	MOVLW      3
	XORWF      _prev2+0, 0
L__doAction483:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction152
;MyProject.c,391 :: 		cr = 70;
	MOVLW      70
	MOVWF      _cr+0
	MOVLW      0
	MOVWF      _cr+1
;MyProject.c,392 :: 		doQ(3);
	MOVLW      3
	MOVWF      FARG_doQ_state+0
	MOVLW      0
	MOVWF      FARG_doQ_state+1
	CALL       _doQ+0
;MyProject.c,393 :: 		}
L_doAction152:
;MyProject.c,394 :: 		}
	GOTO       L_doAction153
L_doAction151:
;MyProject.c,395 :: 		else if (cr == 153) {}
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction484
	MOVLW      153
	XORWF      _cr+0, 0
L__doAction484:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction154
	GOTO       L_doAction155
L_doAction154:
;MyProject.c,397 :: 		if (I7 == 0) {
	MOVLW      0
	XORWF      _I7+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction485
	MOVLW      0
	XORWF      _I7+0, 0
L__doAction485:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction156
;MyProject.c,398 :: 		cr = 6;
	MOVLW      6
	MOVWF      _cr+0
	MOVLW      0
	MOVWF      _cr+1
;MyProject.c,399 :: 		paQ();
	CALL       _paQ+0
;MyProject.c,400 :: 		} else //Excel 7:
	GOTO       L_doAction157
L_doAction156:
;MyProject.c,402 :: 		if (cr == 6) {
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction486
	MOVLW      6
	XORWF      _cr+0, 0
L__doAction486:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction158
;MyProject.c,403 :: 		cr = 7;
	MOVLW      7
	MOVWF      _cr+0
	MOVLW      0
	MOVWF      _cr+1
;MyProject.c,404 :: 		cQ = 0;
	CLRF       _cQ+0
	CLRF       _cQ+1
;MyProject.c,405 :: 		doQ(0);
	CLRF       FARG_doQ_state+0
	CLRF       FARG_doQ_state+1
	CALL       _doQ+0
;MyProject.c,406 :: 		} else {
	GOTO       L_doAction159
L_doAction158:
;MyProject.c,407 :: 		cr = 7;
	MOVLW      7
	MOVWF      _cr+0
	MOVLW      0
	MOVWF      _cr+1
;MyProject.c,408 :: 		cQ = 0;
	CLRF       _cQ+0
	CLRF       _cQ+1
;MyProject.c,409 :: 		doQ(3);    ST1 = 1;
	MOVLW      3
	MOVWF      FARG_doQ_state+0
	MOVLW      0
	MOVWF      FARG_doQ_state+1
	CALL       _doQ+0
	BSF        PORTC+0, 6
;MyProject.c,410 :: 		}
L_doAction159:
;MyProject.c,411 :: 		}
L_doAction157:
;MyProject.c,413 :: 		}
L_doAction155:
L_doAction153:
L_doAction148:
L_doAction146:
;MyProject.c,414 :: 		}
L_doAction144:
;MyProject.c,417 :: 		if (I0 == 1 && I1 == 1 && I2 == 0 && I3 == 0 && fI0H == 0) //Excel 8, 9:
	MOVLW      0
	XORWF      _I0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction487
	MOVLW      1
	XORWF      _I0+0, 0
L__doAction487:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction162
	MOVLW      0
	XORWF      _I1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction488
	MOVLW      1
	XORWF      _I1+0, 0
L__doAction488:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction162
	MOVLW      0
	XORWF      _I2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction489
	MOVLW      0
	XORWF      _I2+0, 0
L__doAction489:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction162
	MOVLW      0
	XORWF      _I3+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction490
	MOVLW      0
	XORWF      _I3+0, 0
L__doAction490:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction162
	MOVLW      0
	XORWF      _fI0H+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction491
	MOVLW      0
	XORWF      _fI0H+0, 0
L__doAction491:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction162
L__doAction337:
;MyProject.c,419 :: 		hF = 1;
	MOVLW      1
	MOVWF      _hF+0
	MOVLW      0
	MOVWF      _hF+1
;MyProject.c,420 :: 		WBS = 1;
	MOVLW      1
	MOVWF      _WBS+0
	MOVLW      0
	MOVWF      _WBS+1
;MyProject.c,421 :: 		Fp[0] = 1;
	MOVLW      1
	MOVWF      _Fp+0
	MOVLW      0
	MOVWF      _Fp+1
;MyProject.c,422 :: 		Fp[1] = 0;
	CLRF       _Fp+2
	CLRF       _Fp+3
;MyProject.c,423 :: 		Fp[2] = 0;
	CLRF       _Fp+4
	CLRF       _Fp+5
;MyProject.c,424 :: 		S2 = 0;
	BCF        PORTA+0, 2
;MyProject.c,425 :: 		S3 = 0;
	BCF        PORTC+0, 0
;MyProject.c,427 :: 		if (cr == 110 || cr == 11) {
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction492
	MOVLW      110
	XORWF      _cr+0, 0
L__doAction492:
	BTFSC      STATUS+0, 2
	GOTO       L__doAction336
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction493
	MOVLW      11
	XORWF      _cr+0, 0
L__doAction493:
	BTFSC      STATUS+0, 2
	GOTO       L__doAction336
	GOTO       L_doAction165
L__doAction336:
;MyProject.c,428 :: 		cr = 111;
	MOVLW      111
	MOVWF      _cr+0
	MOVLW      0
	MOVWF      _cr+1
;MyProject.c,429 :: 		if (prev2 == 1) {
	MOVLW      0
	XORWF      _prev2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction494
	MOVLW      1
	XORWF      _prev2+0, 0
L__doAction494:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction166
;MyProject.c,430 :: 		cr = 90;
	MOVLW      90
	MOVWF      _cr+0
	MOVLW      0
	MOVWF      _cr+1
;MyProject.c,431 :: 		}
	GOTO       L_doAction167
L_doAction166:
;MyProject.c,432 :: 		else if (prev2 == 4) {
	MOVLW      0
	XORWF      _prev2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction495
	MOVLW      4
	XORWF      _prev2+0, 0
L__doAction495:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction168
;MyProject.c,433 :: 		cr = 90;
	MOVLW      90
	MOVWF      _cr+0
	MOVLW      0
	MOVWF      _cr+1
;MyProject.c,434 :: 		doQ(4);
	MOVLW      4
	MOVWF      FARG_doQ_state+0
	MOVLW      0
	MOVWF      FARG_doQ_state+1
	CALL       _doQ+0
;MyProject.c,435 :: 		}
L_doAction168:
L_doAction167:
;MyProject.c,436 :: 		}
	GOTO       L_doAction169
L_doAction165:
;MyProject.c,437 :: 		else if (cr == 111) {}
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction496
	MOVLW      111
	XORWF      _cr+0, 0
L__doAction496:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction170
	GOTO       L_doAction171
L_doAction170:
;MyProject.c,438 :: 		else if (cr == 130 || cr == 13) {
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction497
	MOVLW      130
	XORWF      _cr+0, 0
L__doAction497:
	BTFSC      STATUS+0, 2
	GOTO       L__doAction335
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction498
	MOVLW      13
	XORWF      _cr+0, 0
L__doAction498:
	BTFSC      STATUS+0, 2
	GOTO       L__doAction335
	GOTO       L_doAction174
L__doAction335:
;MyProject.c,439 :: 		cr = 131;
	MOVLW      131
	MOVWF      _cr+0
	CLRF       _cr+1
;MyProject.c,441 :: 		if (prev2 == 2) {cr = 90;}
	MOVLW      0
	XORWF      _prev2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction499
	MOVLW      2
	XORWF      _prev2+0, 0
L__doAction499:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction175
	MOVLW      90
	MOVWF      _cr+0
	MOVLW      0
	MOVWF      _cr+1
	GOTO       L_doAction176
L_doAction175:
;MyProject.c,442 :: 		else if (prev2 == 4) {
	MOVLW      0
	XORWF      _prev2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction500
	MOVLW      4
	XORWF      _prev2+0, 0
L__doAction500:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction177
;MyProject.c,443 :: 		cr = 90;
	MOVLW      90
	MOVWF      _cr+0
	MOVLW      0
	MOVWF      _cr+1
;MyProject.c,444 :: 		doQ(4);
	MOVLW      4
	MOVWF      FARG_doQ_state+0
	MOVLW      0
	MOVWF      FARG_doQ_state+1
	CALL       _doQ+0
;MyProject.c,445 :: 		}
L_doAction177:
L_doAction176:
;MyProject.c,446 :: 		}
	GOTO       L_doAction178
L_doAction174:
;MyProject.c,447 :: 		else if (cr == 131) {}
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction501
	MOVLW      131
	XORWF      _cr+0, 0
L__doAction501:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction179
	GOTO       L_doAction180
L_doAction179:
;MyProject.c,448 :: 		else if (cr == 151) {
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction502
	MOVLW      151
	XORWF      _cr+0, 0
L__doAction502:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction181
;MyProject.c,449 :: 		cr = 1511;
	MOVLW      231
	MOVWF      _cr+0
	MOVLW      5
	MOVWF      _cr+1
;MyProject.c,450 :: 		}
	GOTO       L_doAction182
L_doAction181:
;MyProject.c,451 :: 		else if (cr == 1511) {}
	MOVF       _cr+1, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L__doAction503
	MOVLW      231
	XORWF      _cr+0, 0
L__doAction503:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction183
	GOTO       L_doAction184
L_doAction183:
;MyProject.c,452 :: 		else if (cr == 152) {
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction504
	MOVLW      152
	XORWF      _cr+0, 0
L__doAction504:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction185
;MyProject.c,453 :: 		cr = 1521;
	MOVLW      241
	MOVWF      _cr+0
	MOVLW      5
	MOVWF      _cr+1
;MyProject.c,454 :: 		}
	GOTO       L_doAction186
L_doAction185:
;MyProject.c,455 :: 		else if (cr == 1521) {}
	MOVF       _cr+1, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L__doAction505
	MOVLW      241
	XORWF      _cr+0, 0
L__doAction505:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction187
	GOTO       L_doAction188
L_doAction187:
;MyProject.c,456 :: 		else if (cr == 9) {
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction506
	MOVLW      9
	XORWF      _cr+0, 0
L__doAction506:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction189
;MyProject.c,457 :: 		cr = 90;
	MOVLW      90
	MOVWF      _cr+0
	MOVLW      0
	MOVWF      _cr+1
;MyProject.c,458 :: 		}
	GOTO       L_doAction190
L_doAction189:
;MyProject.c,459 :: 		else if (cr == 90) {}
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction507
	MOVLW      90
	XORWF      _cr+0, 0
L__doAction507:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction191
	GOTO       L_doAction192
L_doAction191:
;MyProject.c,461 :: 		if (I7 == 0) {
	MOVLW      0
	XORWF      _I7+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction508
	MOVLW      0
	XORWF      _I7+0, 0
L__doAction508:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction193
;MyProject.c,462 :: 		cr = 8;
	MOVLW      8
	MOVWF      _cr+0
	MOVLW      0
	MOVWF      _cr+1
;MyProject.c,463 :: 		paQ();
	CALL       _paQ+0
;MyProject.c,464 :: 		} else //Excel 9:
	GOTO       L_doAction194
L_doAction193:
;MyProject.c,466 :: 		if (cr == 8) {
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction509
	MOVLW      8
	XORWF      _cr+0, 0
L__doAction509:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction195
;MyProject.c,467 :: 		cr = 9;
	MOVLW      9
	MOVWF      _cr+0
	MOVLW      0
	MOVWF      _cr+1
;MyProject.c,468 :: 		cQ = 0;
	CLRF       _cQ+0
	CLRF       _cQ+1
;MyProject.c,469 :: 		doQ(0);
	CLRF       FARG_doQ_state+0
	CLRF       FARG_doQ_state+1
	CALL       _doQ+0
;MyProject.c,470 :: 		} else {
	GOTO       L_doAction196
L_doAction195:
;MyProject.c,471 :: 		cr = 9;
	MOVLW      9
	MOVWF      _cr+0
	MOVLW      0
	MOVWF      _cr+1
;MyProject.c,472 :: 		cQ = 0;
	CLRF       _cQ+0
	CLRF       _cQ+1
;MyProject.c,473 :: 		doQ(4);
	MOVLW      4
	MOVWF      FARG_doQ_state+0
	MOVLW      0
	MOVWF      FARG_doQ_state+1
	CALL       _doQ+0
;MyProject.c,474 :: 		}
L_doAction196:
;MyProject.c,475 :: 		}
L_doAction194:
;MyProject.c,477 :: 		}
L_doAction192:
L_doAction190:
L_doAction188:
L_doAction186:
L_doAction184:
L_doAction182:
L_doAction180:
L_doAction178:
L_doAction171:
L_doAction169:
;MyProject.c,478 :: 		}
L_doAction162:
;MyProject.c,481 :: 		if (I0 == 1 && I1 == 1 && I2 == 0 && I3 == 1 && fI0H == 0) //Excel 10, 11
	MOVLW      0
	XORWF      _I0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction510
	MOVLW      1
	XORWF      _I0+0, 0
L__doAction510:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction199
	MOVLW      0
	XORWF      _I1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction511
	MOVLW      1
	XORWF      _I1+0, 0
L__doAction511:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction199
	MOVLW      0
	XORWF      _I2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction512
	MOVLW      0
	XORWF      _I2+0, 0
L__doAction512:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction199
	MOVLW      0
	XORWF      _I3+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction513
	MOVLW      1
	XORWF      _I3+0, 0
L__doAction513:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction199
	MOVLW      0
	XORWF      _fI0H+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction514
	MOVLW      0
	XORWF      _fI0H+0, 0
L__doAction514:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction199
L__doAction334:
;MyProject.c,483 :: 		hF = 1;
	MOVLW      1
	MOVWF      _hF+0
	MOVLW      0
	MOVWF      _hF+1
;MyProject.c,484 :: 		WBS = 1;
	MOVLW      1
	MOVWF      _WBS+0
	MOVLW      0
	MOVWF      _WBS+1
;MyProject.c,485 :: 		Fp[0] = 1;
	MOVLW      1
	MOVWF      _Fp+0
	MOVLW      0
	MOVWF      _Fp+1
;MyProject.c,486 :: 		Fp[1] = 0;
	CLRF       _Fp+2
	CLRF       _Fp+3
;MyProject.c,487 :: 		Fp[2] = 1;
	MOVLW      1
	MOVWF      _Fp+4
	MOVLW      0
	MOVWF      _Fp+5
;MyProject.c,488 :: 		S2 = 0;
	BCF        PORTA+0, 2
;MyProject.c,489 :: 		S3 = 0;
	BCF        PORTC+0, 0
;MyProject.c,491 :: 		if (cr == 150 || cr == 15) {
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction515
	MOVLW      150
	XORWF      _cr+0, 0
L__doAction515:
	BTFSC      STATUS+0, 2
	GOTO       L__doAction333
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction516
	MOVLW      15
	XORWF      _cr+0, 0
L__doAction516:
	BTFSC      STATUS+0, 2
	GOTO       L__doAction333
	GOTO       L_doAction202
L__doAction333:
;MyProject.c,492 :: 		cr = 152;
	MOVLW      152
	MOVWF      _cr+0
	CLRF       _cr+1
;MyProject.c,494 :: 		if (prev2 == 5) {
	MOVLW      0
	XORWF      _prev2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction517
	MOVLW      5
	XORWF      _prev2+0, 0
L__doAction517:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction203
;MyProject.c,495 :: 		cr = 110;
	MOVLW      110
	MOVWF      _cr+0
	MOVLW      0
	MOVWF      _cr+1
;MyProject.c,496 :: 		doQ(5);
	MOVLW      5
	MOVWF      FARG_doQ_state+0
	MOVLW      0
	MOVWF      FARG_doQ_state+1
	CALL       _doQ+0
;MyProject.c,497 :: 		}
L_doAction203:
;MyProject.c,498 :: 		}
	GOTO       L_doAction204
L_doAction202:
;MyProject.c,499 :: 		else if (cr == 152) {}
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction518
	MOVLW      152
	XORWF      _cr+0, 0
L__doAction518:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction205
	GOTO       L_doAction206
L_doAction205:
;MyProject.c,500 :: 		else if (cr == 11) {
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction519
	MOVLW      11
	XORWF      _cr+0, 0
L__doAction519:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction207
;MyProject.c,501 :: 		cr = 110;
	MOVLW      110
	MOVWF      _cr+0
	MOVLW      0
	MOVWF      _cr+1
;MyProject.c,502 :: 		}
	GOTO       L_doAction208
L_doAction207:
;MyProject.c,503 :: 		else if (cr == 110) {}
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction520
	MOVLW      110
	XORWF      _cr+0, 0
L__doAction520:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction209
	GOTO       L_doAction210
L_doAction209:
;MyProject.c,505 :: 		if (I7 == 0) { //Excel 10:
	MOVLW      0
	XORWF      _I7+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction521
	MOVLW      0
	XORWF      _I7+0, 0
L__doAction521:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction211
;MyProject.c,506 :: 		cr = 10;
	MOVLW      10
	MOVWF      _cr+0
	MOVLW      0
	MOVWF      _cr+1
;MyProject.c,507 :: 		paQ();
	CALL       _paQ+0
;MyProject.c,508 :: 		}
	GOTO       L_doAction212
L_doAction211:
;MyProject.c,511 :: 		if (cr == 10) {
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction522
	MOVLW      10
	XORWF      _cr+0, 0
L__doAction522:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction213
;MyProject.c,512 :: 		cr = 11;
	MOVLW      11
	MOVWF      _cr+0
	MOVLW      0
	MOVWF      _cr+1
;MyProject.c,513 :: 		cQ = 0;
	CLRF       _cQ+0
	CLRF       _cQ+1
;MyProject.c,514 :: 		doQ(0);
	CLRF       FARG_doQ_state+0
	CLRF       FARG_doQ_state+1
	CALL       _doQ+0
;MyProject.c,515 :: 		} else {
	GOTO       L_doAction214
L_doAction213:
;MyProject.c,516 :: 		cr = 11;
	MOVLW      11
	MOVWF      _cr+0
	MOVLW      0
	MOVWF      _cr+1
;MyProject.c,517 :: 		cQ = 0;
	CLRF       _cQ+0
	CLRF       _cQ+1
;MyProject.c,518 :: 		doQ(5);
	MOVLW      5
	MOVWF      FARG_doQ_state+0
	MOVLW      0
	MOVWF      FARG_doQ_state+1
	CALL       _doQ+0
;MyProject.c,519 :: 		}
L_doAction214:
;MyProject.c,520 :: 		}
L_doAction212:
;MyProject.c,522 :: 		}
L_doAction210:
L_doAction208:
L_doAction206:
L_doAction204:
;MyProject.c,523 :: 		}
L_doAction199:
;MyProject.c,526 :: 		if (I0 == 1 && I1 == 1 && I2 == 1 && I3 == 0 && fI0H == 0) //Excel 12, 13
	MOVLW      0
	XORWF      _I0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction523
	MOVLW      1
	XORWF      _I0+0, 0
L__doAction523:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction217
	MOVLW      0
	XORWF      _I1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction524
	MOVLW      1
	XORWF      _I1+0, 0
L__doAction524:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction217
	MOVLW      0
	XORWF      _I2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction525
	MOVLW      1
	XORWF      _I2+0, 0
L__doAction525:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction217
	MOVLW      0
	XORWF      _I3+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction526
	MOVLW      0
	XORWF      _I3+0, 0
L__doAction526:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction217
	MOVLW      0
	XORWF      _fI0H+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction527
	MOVLW      0
	XORWF      _fI0H+0, 0
L__doAction527:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction217
L__doAction332:
;MyProject.c,528 :: 		hF = 1;
	MOVLW      1
	MOVWF      _hF+0
	MOVLW      0
	MOVWF      _hF+1
;MyProject.c,529 :: 		WBS = 1;
	MOVLW      1
	MOVWF      _WBS+0
	MOVLW      0
	MOVWF      _WBS+1
;MyProject.c,530 :: 		Fp[0] = 1;
	MOVLW      1
	MOVWF      _Fp+0
	MOVLW      0
	MOVWF      _Fp+1
;MyProject.c,531 :: 		Fp[1] = 1;
	MOVLW      1
	MOVWF      _Fp+2
	MOVLW      0
	MOVWF      _Fp+3
;MyProject.c,532 :: 		Fp[2] = 0;
	CLRF       _Fp+4
	CLRF       _Fp+5
;MyProject.c,533 :: 		S2 = 0;
	BCF        PORTA+0, 2
;MyProject.c,534 :: 		if (cr == 150 || cr == 15) {
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction528
	MOVLW      150
	XORWF      _cr+0, 0
L__doAction528:
	BTFSC      STATUS+0, 2
	GOTO       L__doAction331
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction529
	MOVLW      15
	XORWF      _cr+0, 0
L__doAction529:
	BTFSC      STATUS+0, 2
	GOTO       L__doAction331
	GOTO       L_doAction220
L__doAction331:
;MyProject.c,535 :: 		cr = 151;
	MOVLW      151
	MOVWF      _cr+0
	CLRF       _cr+1
;MyProject.c,537 :: 		if (prev2 == 6) {
	MOVLW      0
	XORWF      _prev2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction530
	MOVLW      6
	XORWF      _prev2+0, 0
L__doAction530:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction221
;MyProject.c,538 :: 		cr = 130;
	MOVLW      130
	MOVWF      _cr+0
	CLRF       _cr+1
;MyProject.c,539 :: 		doQ(6);
	MOVLW      6
	MOVWF      FARG_doQ_state+0
	MOVLW      0
	MOVWF      FARG_doQ_state+1
	CALL       _doQ+0
;MyProject.c,540 :: 		}
L_doAction221:
;MyProject.c,541 :: 		}
	GOTO       L_doAction222
L_doAction220:
;MyProject.c,542 :: 		else if (cr == 151) {}
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction531
	MOVLW      151
	XORWF      _cr+0, 0
L__doAction531:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction223
	GOTO       L_doAction224
L_doAction223:
;MyProject.c,543 :: 		else if (cr == 13) {
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction532
	MOVLW      13
	XORWF      _cr+0, 0
L__doAction532:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction225
;MyProject.c,544 :: 		cr = 130;
	MOVLW      130
	MOVWF      _cr+0
	CLRF       _cr+1
;MyProject.c,545 :: 		}
	GOTO       L_doAction226
L_doAction225:
;MyProject.c,546 :: 		else if (cr == 130) {}
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction533
	MOVLW      130
	XORWF      _cr+0, 0
L__doAction533:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction227
	GOTO       L_doAction228
L_doAction227:
;MyProject.c,548 :: 		if (I7 == 0) {
	MOVLW      0
	XORWF      _I7+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction534
	MOVLW      0
	XORWF      _I7+0, 0
L__doAction534:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction229
;MyProject.c,549 :: 		cr = 12;
	MOVLW      12
	MOVWF      _cr+0
	MOVLW      0
	MOVWF      _cr+1
;MyProject.c,550 :: 		paQ();
	CALL       _paQ+0
;MyProject.c,551 :: 		} else {
	GOTO       L_doAction230
L_doAction229:
;MyProject.c,552 :: 		if (cr == 12) {
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction535
	MOVLW      12
	XORWF      _cr+0, 0
L__doAction535:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction231
;MyProject.c,553 :: 		cr = 13;
	MOVLW      13
	MOVWF      _cr+0
	MOVLW      0
	MOVWF      _cr+1
;MyProject.c,554 :: 		cQ = 0;
	CLRF       _cQ+0
	CLRF       _cQ+1
;MyProject.c,555 :: 		doQ(0);
	CLRF       FARG_doQ_state+0
	CLRF       FARG_doQ_state+1
	CALL       _doQ+0
;MyProject.c,556 :: 		} else {
	GOTO       L_doAction232
L_doAction231:
;MyProject.c,557 :: 		cr = 13;
	MOVLW      13
	MOVWF      _cr+0
	MOVLW      0
	MOVWF      _cr+1
;MyProject.c,558 :: 		cQ = 0;
	CLRF       _cQ+0
	CLRF       _cQ+1
;MyProject.c,559 :: 		doQ(6);
	MOVLW      6
	MOVWF      FARG_doQ_state+0
	MOVLW      0
	MOVWF      FARG_doQ_state+1
	CALL       _doQ+0
;MyProject.c,560 :: 		}
L_doAction232:
;MyProject.c,561 :: 		}
L_doAction230:
;MyProject.c,563 :: 		}
L_doAction228:
L_doAction226:
L_doAction224:
L_doAction222:
;MyProject.c,564 :: 		}
L_doAction217:
;MyProject.c,567 :: 		if (I0 == 1 && I1 == 1 && I2 == 1 && I3 == 1 && fI0H == 0) //Excel 14:
	MOVLW      0
	XORWF      _I0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction536
	MOVLW      1
	XORWF      _I0+0, 0
L__doAction536:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction235
	MOVLW      0
	XORWF      _I1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction537
	MOVLW      1
	XORWF      _I1+0, 0
L__doAction537:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction235
	MOVLW      0
	XORWF      _I2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction538
	MOVLW      1
	XORWF      _I2+0, 0
L__doAction538:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction235
	MOVLW      0
	XORWF      _I3+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction539
	MOVLW      1
	XORWF      _I3+0, 0
L__doAction539:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction235
	MOVLW      0
	XORWF      _fI0H+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction540
	MOVLW      0
	XORWF      _fI0H+0, 0
L__doAction540:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction235
L__doAction330:
;MyProject.c,569 :: 		hF = 1;
	MOVLW      1
	MOVWF      _hF+0
	MOVLW      0
	MOVWF      _hF+1
;MyProject.c,570 :: 		WBS = 1;
	MOVLW      1
	MOVWF      _WBS+0
	MOVLW      0
	MOVWF      _WBS+1
;MyProject.c,571 :: 		Fp[0] = 1;
	MOVLW      1
	MOVWF      _Fp+0
	MOVLW      0
	MOVWF      _Fp+1
;MyProject.c,572 :: 		Fp[1] = 1;
	MOVLW      1
	MOVWF      _Fp+2
	MOVLW      0
	MOVWF      _Fp+3
;MyProject.c,573 :: 		Fp[2] = 1;
	MOVLW      1
	MOVWF      _Fp+4
	MOVLW      0
	MOVWF      _Fp+5
;MyProject.c,575 :: 		if (I7 == 0) {
	MOVLW      0
	XORWF      _I7+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction541
	MOVLW      0
	XORWF      _I7+0, 0
L__doAction541:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction236
;MyProject.c,577 :: 		if (cr == 15) {
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction542
	MOVLW      15
	XORWF      _cr+0, 0
L__doAction542:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction237
;MyProject.c,578 :: 		cr = 150;
	MOVLW      150
	MOVWF      _cr+0
	CLRF       _cr+1
;MyProject.c,579 :: 		}
	GOTO       L_doAction238
L_doAction237:
;MyProject.c,580 :: 		else if (cr == 150) {}
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction543
	MOVLW      150
	XORWF      _cr+0, 0
L__doAction543:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction239
	GOTO       L_doAction240
L_doAction239:
;MyProject.c,582 :: 		cr = 14;
	MOVLW      14
	MOVWF      _cr+0
	MOVLW      0
	MOVWF      _cr+1
;MyProject.c,583 :: 		paQ();
	CALL       _paQ+0
;MyProject.c,584 :: 		}
L_doAction240:
L_doAction238:
;MyProject.c,585 :: 		} else {
	GOTO       L_doAction241
L_doAction236:
;MyProject.c,588 :: 		if (cr == 14) {
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction544
	MOVLW      14
	XORWF      _cr+0, 0
L__doAction544:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction242
;MyProject.c,589 :: 		cr = 15;
	MOVLW      15
	MOVWF      _cr+0
	MOVLW      0
	MOVWF      _cr+1
;MyProject.c,590 :: 		cQ = 0;
	CLRF       _cQ+0
	CLRF       _cQ+1
;MyProject.c,591 :: 		doQ(0);
	CLRF       FARG_doQ_state+0
	CLRF       FARG_doQ_state+1
	CALL       _doQ+0
;MyProject.c,592 :: 		} else if (cr == 150) {} else {
	GOTO       L_doAction243
L_doAction242:
	MOVLW      0
	XORWF      _cr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction545
	MOVLW      150
	XORWF      _cr+0, 0
L__doAction545:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction244
	GOTO       L_doAction245
L_doAction244:
;MyProject.c,593 :: 		cr = 15;
	MOVLW      15
	MOVWF      _cr+0
	MOVLW      0
	MOVWF      _cr+1
;MyProject.c,594 :: 		cQ = 0;
	CLRF       _cQ+0
	CLRF       _cQ+1
;MyProject.c,595 :: 		doQ(7);
	MOVLW      7
	MOVWF      FARG_doQ_state+0
	MOVLW      0
	MOVWF      FARG_doQ_state+1
	CALL       _doQ+0
;MyProject.c,596 :: 		}
L_doAction245:
L_doAction243:
;MyProject.c,598 :: 		}
L_doAction241:
;MyProject.c,599 :: 		}
L_doAction235:
;MyProject.c,602 :: 		if (hF == 1) {
	MOVLW      0
	XORWF      _hF+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction546
	MOVLW      1
	XORWF      _hF+0, 0
L__doAction546:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction246
;MyProject.c,603 :: 		if (WBS == 1) {
	MOVLW      0
	XORWF      _WBS+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction547
	MOVLW      1
	XORWF      _WBS+0, 0
L__doAction547:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction247
;MyProject.c,604 :: 		if (Fp[0] == 1) S1 = 1;
	MOVLW      0
	XORWF      _Fp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction548
	MOVLW      1
	XORWF      _Fp+0, 0
L__doAction548:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction248
	BSF        PORTA+0, 1
L_doAction248:
;MyProject.c,605 :: 		if (Fp[1] == 1) S2 = 1;
	MOVLW      0
	XORWF      _Fp+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction549
	MOVLW      1
	XORWF      _Fp+2, 0
L__doAction549:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction249
	BSF        PORTA+0, 2
L_doAction249:
;MyProject.c,606 :: 		if (Fp[2] == 1) S3 = 1;
	MOVLW      0
	XORWF      _Fp+5, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction550
	MOVLW      1
	XORWF      _Fp+4, 0
L__doAction550:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction250
	BSF        PORTC+0, 0
L_doAction250:
;MyProject.c,607 :: 		}
L_doAction247:
;MyProject.c,608 :: 		if (WFS == 1) {
	MOVLW      0
	XORWF      _WFS+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction551
	MOVLW      1
	XORWF      _WFS+0, 0
L__doAction551:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction251
;MyProject.c,609 :: 		S0 = 1;
	BSF        PORTA+0, 0
;MyProject.c,610 :: 		}
L_doAction251:
;MyProject.c,611 :: 		} else if (lF == 1) {
	GOTO       L_doAction252
L_doAction246:
	MOVLW      0
	XORWF      _lF+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction552
	MOVLW      1
	XORWF      _lF+0, 0
L__doAction552:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction253
;MyProject.c,612 :: 		if (WBS == 1) {
	MOVLW      0
	XORWF      _WBS+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction553
	MOVLW      1
	XORWF      _WBS+0, 0
L__doAction553:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction254
;MyProject.c,613 :: 		if (Fp[0] == 1) S1 = 0;
	MOVLW      0
	XORWF      _Fp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction554
	MOVLW      1
	XORWF      _Fp+0, 0
L__doAction554:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction255
	BCF        PORTA+0, 1
L_doAction255:
;MyProject.c,614 :: 		if (Fp[1] == 1) S2 = 0;
	MOVLW      0
	XORWF      _Fp+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction555
	MOVLW      1
	XORWF      _Fp+2, 0
L__doAction555:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction256
	BCF        PORTA+0, 2
L_doAction256:
;MyProject.c,615 :: 		if (Fp[2] == 1) S3 = 0;
	MOVLW      0
	XORWF      _Fp+5, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction556
	MOVLW      1
	XORWF      _Fp+4, 0
L__doAction556:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction257
	BCF        PORTC+0, 0
L_doAction257:
;MyProject.c,616 :: 		}
L_doAction254:
;MyProject.c,617 :: 		if (WFS == 1) {
	MOVLW      0
	XORWF      _WFS+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__doAction557
	MOVLW      1
	XORWF      _WFS+0, 0
L__doAction557:
	BTFSS      STATUS+0, 2
	GOTO       L_doAction258
;MyProject.c,618 :: 		S0 = 0;
	BCF        PORTA+0, 0
;MyProject.c,619 :: 		}
L_doAction258:
;MyProject.c,620 :: 		}
L_doAction253:
L_doAction252:
;MyProject.c,621 :: 		hist();
	CALL       _hist+0
;MyProject.c,622 :: 		}
L_end_doAction:
	RETURN
; end of _doAction

_checkInput:

;MyProject.c,624 :: 		void checkInput() {
;MyProject.c,625 :: 		if (P0 != I0 && i0f == 0) i0f = 1;
	CLRF       R1
	BTFSC      PORTC+0, 7
	INCF       R1, 1
	MOVLW      0
	XORWF      _I0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__checkInput559
	MOVF       _I0+0, 0
	XORWF      R1, 0
L__checkInput559:
	BTFSC      STATUS+0, 2
	GOTO       L_checkInput261
	MOVLW      0
	XORWF      _i0f+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__checkInput560
	MOVLW      0
	XORWF      _i0f+0, 0
L__checkInput560:
	BTFSS      STATUS+0, 2
	GOTO       L_checkInput261
L__checkInput361:
	MOVLW      1
	MOVWF      _i0f+0
	MOVLW      0
	MOVWF      _i0f+1
L_checkInput261:
;MyProject.c,626 :: 		if (P1 != I1 && i1f == 0) i1f = 1;
	CLRF       R1
	BTFSC      PORTA+0, 4
	INCF       R1, 1
	MOVLW      0
	XORWF      _I1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__checkInput561
	MOVF       _I1+0, 0
	XORWF      R1, 0
L__checkInput561:
	BTFSC      STATUS+0, 2
	GOTO       L_checkInput264
	MOVLW      0
	XORWF      _i1f+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__checkInput562
	MOVLW      0
	XORWF      _i1f+0, 0
L__checkInput562:
	BTFSS      STATUS+0, 2
	GOTO       L_checkInput264
L__checkInput360:
	MOVLW      1
	MOVWF      _i1f+0
	MOVLW      0
	MOVWF      _i1f+1
L_checkInput264:
;MyProject.c,627 :: 		if (P2 != I2 && i2f == 0) i2f = 1;
	CLRF       R1
	BTFSC      PORTC+0, 4
	INCF       R1, 1
	MOVLW      0
	XORWF      _I2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__checkInput563
	MOVF       _I2+0, 0
	XORWF      R1, 0
L__checkInput563:
	BTFSC      STATUS+0, 2
	GOTO       L_checkInput267
	MOVLW      0
	XORWF      _i2f+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__checkInput564
	MOVLW      0
	XORWF      _i2f+0, 0
L__checkInput564:
	BTFSS      STATUS+0, 2
	GOTO       L_checkInput267
L__checkInput359:
	MOVLW      1
	MOVWF      _i2f+0
	MOVLW      0
	MOVWF      _i2f+1
L_checkInput267:
;MyProject.c,628 :: 		if (P3 != I3 && i3f == 0) i3f = 1;
	CLRF       R1
	BTFSC      PORTC+0, 5
	INCF       R1, 1
	MOVLW      0
	XORWF      _I3+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__checkInput565
	MOVF       _I3+0, 0
	XORWF      R1, 0
L__checkInput565:
	BTFSC      STATUS+0, 2
	GOTO       L_checkInput270
	MOVLW      0
	XORWF      _i3f+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__checkInput566
	MOVLW      0
	XORWF      _i3f+0, 0
L__checkInput566:
	BTFSS      STATUS+0, 2
	GOTO       L_checkInput270
L__checkInput358:
	MOVLW      1
	MOVWF      _i3f+0
	MOVLW      0
	MOVWF      _i3f+1
L_checkInput270:
;MyProject.c,629 :: 		if (I7_0 != I7 && i7f == 0) i7f = 1;
	MOVF       _I7_0+1, 0
	XORWF      _I7+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__checkInput567
	MOVF       _I7+0, 0
	XORWF      _I7_0+0, 0
L__checkInput567:
	BTFSC      STATUS+0, 2
	GOTO       L_checkInput273
	MOVLW      0
	XORWF      _i7f+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__checkInput568
	MOVLW      0
	XORWF      _i7f+0, 0
L__checkInput568:
	BTFSS      STATUS+0, 2
	GOTO       L_checkInput273
L__checkInput357:
	MOVLW      1
	MOVWF      _i7f+0
	MOVLW      0
	MOVWF      _i7f+1
L_checkInput273:
;MyProject.c,631 :: 		if (va0 == 1 && i0f == 1 && P0 != I0) {
	MOVLW      0
	XORWF      _va0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__checkInput569
	MOVLW      1
	XORWF      _va0+0, 0
L__checkInput569:
	BTFSS      STATUS+0, 2
	GOTO       L_checkInput276
	MOVLW      0
	XORWF      _i0f+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__checkInput570
	MOVLW      1
	XORWF      _i0f+0, 0
L__checkInput570:
	BTFSS      STATUS+0, 2
	GOTO       L_checkInput276
	CLRF       R1
	BTFSC      PORTC+0, 7
	INCF       R1, 1
	MOVLW      0
	XORWF      _I0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__checkInput571
	MOVF       _I0+0, 0
	XORWF      R1, 0
L__checkInput571:
	BTFSC      STATUS+0, 2
	GOTO       L_checkInput276
L__checkInput356:
;MyProject.c,632 :: 		initParams();
	CALL       _initParams+0
;MyProject.c,633 :: 		I0 = P0;
	MOVLW      0
	BTFSC      PORTC+0, 7
	MOVLW      1
	MOVWF      _I0+0
	CLRF       _I0+1
;MyProject.c,634 :: 		if (I0 == 1) fI0H = 1;
	MOVLW      0
	XORWF      _I0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__checkInput572
	MOVLW      1
	XORWF      _I0+0, 0
L__checkInput572:
	BTFSS      STATUS+0, 2
	GOTO       L_checkInput277
	MOVLW      1
	MOVWF      _fI0H+0
	MOVLW      0
	MOVWF      _fI0H+1
	GOTO       L_checkInput278
L_checkInput277:
;MyProject.c,635 :: 		else fI0H = 0;
	CLRF       _fI0H+0
	CLRF       _fI0H+1
L_checkInput278:
;MyProject.c,637 :: 		doAction();
	CALL       _doAction+0
;MyProject.c,639 :: 		va0 = 0;
	CLRF       _va0+0
	CLRF       _va0+1
;MyProject.c,640 :: 		i0f = 0;
	CLRF       _i0f+0
	CLRF       _i0f+1
;MyProject.c,641 :: 		y0 = 0;
	CLRF       _y0+0
	CLRF       _y0+1
;MyProject.c,642 :: 		} else if (va0 == 1 && i0f == 1 && P0 == I0) {
	GOTO       L_checkInput279
L_checkInput276:
	MOVLW      0
	XORWF      _va0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__checkInput573
	MOVLW      1
	XORWF      _va0+0, 0
L__checkInput573:
	BTFSS      STATUS+0, 2
	GOTO       L_checkInput282
	MOVLW      0
	XORWF      _i0f+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__checkInput574
	MOVLW      1
	XORWF      _i0f+0, 0
L__checkInput574:
	BTFSS      STATUS+0, 2
	GOTO       L_checkInput282
	CLRF       R1
	BTFSC      PORTC+0, 7
	INCF       R1, 1
	MOVLW      0
	XORWF      _I0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__checkInput575
	MOVF       _I0+0, 0
	XORWF      R1, 0
L__checkInput575:
	BTFSS      STATUS+0, 2
	GOTO       L_checkInput282
L__checkInput355:
;MyProject.c,643 :: 		va0 = 0;
	CLRF       _va0+0
	CLRF       _va0+1
;MyProject.c,644 :: 		i0f = 0;
	CLRF       _i0f+0
	CLRF       _i0f+1
;MyProject.c,645 :: 		y0 = 0;
	CLRF       _y0+0
	CLRF       _y0+1
;MyProject.c,646 :: 		}
L_checkInput282:
L_checkInput279:
;MyProject.c,648 :: 		if (va1 == 1 && i1f == 1 && P1 != I1) {
	MOVLW      0
	XORWF      _va1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__checkInput576
	MOVLW      1
	XORWF      _va1+0, 0
L__checkInput576:
	BTFSS      STATUS+0, 2
	GOTO       L_checkInput285
	MOVLW      0
	XORWF      _i1f+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__checkInput577
	MOVLW      1
	XORWF      _i1f+0, 0
L__checkInput577:
	BTFSS      STATUS+0, 2
	GOTO       L_checkInput285
	CLRF       R1
	BTFSC      PORTA+0, 4
	INCF       R1, 1
	MOVLW      0
	XORWF      _I1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__checkInput578
	MOVF       _I1+0, 0
	XORWF      R1, 0
L__checkInput578:
	BTFSC      STATUS+0, 2
	GOTO       L_checkInput285
L__checkInput354:
;MyProject.c,649 :: 		initParams();
	CALL       _initParams+0
;MyProject.c,650 :: 		I1 = P1;
	MOVLW      0
	BTFSC      PORTA+0, 4
	MOVLW      1
	MOVWF      _I1+0
	CLRF       _I1+1
;MyProject.c,651 :: 		doAction();
	CALL       _doAction+0
;MyProject.c,652 :: 		va1 = 0;
	CLRF       _va1+0
	CLRF       _va1+1
;MyProject.c,653 :: 		i1f = 0;
	CLRF       _i1f+0
	CLRF       _i1f+1
;MyProject.c,654 :: 		y1 = 0;
	CLRF       _y1+0
	CLRF       _y1+1
;MyProject.c,655 :: 		} else if (va1 == 1 && i1f == 1 && P1 == I1) {
	GOTO       L_checkInput286
L_checkInput285:
	MOVLW      0
	XORWF      _va1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__checkInput579
	MOVLW      1
	XORWF      _va1+0, 0
L__checkInput579:
	BTFSS      STATUS+0, 2
	GOTO       L_checkInput289
	MOVLW      0
	XORWF      _i1f+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__checkInput580
	MOVLW      1
	XORWF      _i1f+0, 0
L__checkInput580:
	BTFSS      STATUS+0, 2
	GOTO       L_checkInput289
	CLRF       R1
	BTFSC      PORTA+0, 4
	INCF       R1, 1
	MOVLW      0
	XORWF      _I1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__checkInput581
	MOVF       _I1+0, 0
	XORWF      R1, 0
L__checkInput581:
	BTFSS      STATUS+0, 2
	GOTO       L_checkInput289
L__checkInput353:
;MyProject.c,656 :: 		va1 = 0;
	CLRF       _va1+0
	CLRF       _va1+1
;MyProject.c,657 :: 		i1f = 0;
	CLRF       _i1f+0
	CLRF       _i1f+1
;MyProject.c,658 :: 		y1 = 0;
	CLRF       _y1+0
	CLRF       _y1+1
;MyProject.c,659 :: 		}
L_checkInput289:
L_checkInput286:
;MyProject.c,661 :: 		if (va2 == 1 && i2f == 1 && P2 != I2) {
	MOVLW      0
	XORWF      _va2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__checkInput582
	MOVLW      1
	XORWF      _va2+0, 0
L__checkInput582:
	BTFSS      STATUS+0, 2
	GOTO       L_checkInput292
	MOVLW      0
	XORWF      _i2f+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__checkInput583
	MOVLW      1
	XORWF      _i2f+0, 0
L__checkInput583:
	BTFSS      STATUS+0, 2
	GOTO       L_checkInput292
	CLRF       R1
	BTFSC      PORTC+0, 4
	INCF       R1, 1
	MOVLW      0
	XORWF      _I2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__checkInput584
	MOVF       _I2+0, 0
	XORWF      R1, 0
L__checkInput584:
	BTFSC      STATUS+0, 2
	GOTO       L_checkInput292
L__checkInput352:
;MyProject.c,662 :: 		initParams();
	CALL       _initParams+0
;MyProject.c,663 :: 		I2 = P2;
	MOVLW      0
	BTFSC      PORTC+0, 4
	MOVLW      1
	MOVWF      _I2+0
	CLRF       _I2+1
;MyProject.c,664 :: 		doAction();
	CALL       _doAction+0
;MyProject.c,665 :: 		va2 = 0;
	CLRF       _va2+0
	CLRF       _va2+1
;MyProject.c,666 :: 		i2f = 0;
	CLRF       _i2f+0
	CLRF       _i2f+1
;MyProject.c,667 :: 		y2 = 0;
	CLRF       _y2+0
	CLRF       _y2+1
;MyProject.c,668 :: 		} else if (va2 == 1 && i2f == 1 && P2 == I2) {
	GOTO       L_checkInput293
L_checkInput292:
	MOVLW      0
	XORWF      _va2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__checkInput585
	MOVLW      1
	XORWF      _va2+0, 0
L__checkInput585:
	BTFSS      STATUS+0, 2
	GOTO       L_checkInput296
	MOVLW      0
	XORWF      _i2f+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__checkInput586
	MOVLW      1
	XORWF      _i2f+0, 0
L__checkInput586:
	BTFSS      STATUS+0, 2
	GOTO       L_checkInput296
	CLRF       R1
	BTFSC      PORTC+0, 4
	INCF       R1, 1
	MOVLW      0
	XORWF      _I2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__checkInput587
	MOVF       _I2+0, 0
	XORWF      R1, 0
L__checkInput587:
	BTFSS      STATUS+0, 2
	GOTO       L_checkInput296
L__checkInput351:
;MyProject.c,669 :: 		va2 = 0;
	CLRF       _va2+0
	CLRF       _va2+1
;MyProject.c,670 :: 		i2f = 0;
	CLRF       _i2f+0
	CLRF       _i2f+1
;MyProject.c,671 :: 		y2 = 0;
	CLRF       _y2+0
	CLRF       _y2+1
;MyProject.c,672 :: 		}
L_checkInput296:
L_checkInput293:
;MyProject.c,674 :: 		if (va3 == 1 && i3f == 1 && P3 != I3) {
	MOVLW      0
	XORWF      _va3+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__checkInput588
	MOVLW      1
	XORWF      _va3+0, 0
L__checkInput588:
	BTFSS      STATUS+0, 2
	GOTO       L_checkInput299
	MOVLW      0
	XORWF      _i3f+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__checkInput589
	MOVLW      1
	XORWF      _i3f+0, 0
L__checkInput589:
	BTFSS      STATUS+0, 2
	GOTO       L_checkInput299
	CLRF       R1
	BTFSC      PORTC+0, 5
	INCF       R1, 1
	MOVLW      0
	XORWF      _I3+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__checkInput590
	MOVF       _I3+0, 0
	XORWF      R1, 0
L__checkInput590:
	BTFSC      STATUS+0, 2
	GOTO       L_checkInput299
L__checkInput350:
;MyProject.c,675 :: 		initParams();
	CALL       _initParams+0
;MyProject.c,676 :: 		I3 = P3;
	MOVLW      0
	BTFSC      PORTC+0, 5
	MOVLW      1
	MOVWF      _I3+0
	CLRF       _I3+1
;MyProject.c,677 :: 		doAction();
	CALL       _doAction+0
;MyProject.c,678 :: 		va3 = 0;
	CLRF       _va3+0
	CLRF       _va3+1
;MyProject.c,679 :: 		i3f = 0;
	CLRF       _i3f+0
	CLRF       _i3f+1
;MyProject.c,680 :: 		y3 = 0;
	CLRF       _y3+0
	CLRF       _y3+1
;MyProject.c,681 :: 		} else if (va3 == 1 && i3f == 1 && P3 == I3) {
	GOTO       L_checkInput300
L_checkInput299:
	MOVLW      0
	XORWF      _va3+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__checkInput591
	MOVLW      1
	XORWF      _va3+0, 0
L__checkInput591:
	BTFSS      STATUS+0, 2
	GOTO       L_checkInput303
	MOVLW      0
	XORWF      _i3f+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__checkInput592
	MOVLW      1
	XORWF      _i3f+0, 0
L__checkInput592:
	BTFSS      STATUS+0, 2
	GOTO       L_checkInput303
	CLRF       R1
	BTFSC      PORTC+0, 5
	INCF       R1, 1
	MOVLW      0
	XORWF      _I3+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__checkInput593
	MOVF       _I3+0, 0
	XORWF      R1, 0
L__checkInput593:
	BTFSS      STATUS+0, 2
	GOTO       L_checkInput303
L__checkInput349:
;MyProject.c,682 :: 		va3 = 0;
	CLRF       _va3+0
	CLRF       _va3+1
;MyProject.c,683 :: 		i3f = 0;
	CLRF       _i3f+0
	CLRF       _i3f+1
;MyProject.c,684 :: 		y3 = 0;
	CLRF       _y3+0
	CLRF       _y3+1
;MyProject.c,685 :: 		}
L_checkInput303:
L_checkInput300:
;MyProject.c,687 :: 		if (I7_0 != I7) {
	MOVF       _I7_0+1, 0
	XORWF      _I7+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__checkInput594
	MOVF       _I7+0, 0
	XORWF      _I7_0+0, 0
L__checkInput594:
	BTFSC      STATUS+0, 2
	GOTO       L_checkInput304
;MyProject.c,688 :: 		I7_0 = I7;
	MOVF       _I7+0, 0
	MOVWF      _I7_0+0
	MOVF       _I7+1, 0
	MOVWF      _I7_0+1
;MyProject.c,689 :: 		doAction();
	CALL       _doAction+0
;MyProject.c,690 :: 		}
L_checkInput304:
;MyProject.c,691 :: 		}
L_end_checkInput:
	RETURN
; end of _checkInput

_main:

;MyProject.c,693 :: 		void main() {
;MyProject.c,694 :: 		Init();
	CALL       _Init+0
;MyProject.c,695 :: 		while (1) {
L_main305:
;MyProject.c,696 :: 		if (secF == 1) {
	MOVLW      0
	XORWF      _secF+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main596
	MOVLW      1
	XORWF      _secF+0, 0
L__main596:
	BTFSS      STATUS+0, 2
	GOTO       L_main307
;MyProject.c,700 :: 		secF = 0;
	CLRF       _secF+0
	CLRF       _secF+1
;MyProject.c,701 :: 		cNum = 0;
	CLRF       _cNum+0
	CLRF       _cNum+1
;MyProject.c,702 :: 		TMR0 = 100;
	MOVLW      100
	MOVWF      TMR0+0
;MyProject.c,703 :: 		TMR0IF_bit = 0;
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;MyProject.c,705 :: 		TMR0IE_bit = 1;
	BSF        TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
;MyProject.c,706 :: 		}
L_main307:
;MyProject.c,708 :: 		checkInput();
	CALL       _checkInput+0
;MyProject.c,711 :: 		if (val_hF == 1) {
	MOVLW      0
	XORWF      _val_hF+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main597
	MOVLW      1
	XORWF      _val_hF+0, 0
L__main597:
	BTFSS      STATUS+0, 2
	GOTO       L_main308
;MyProject.c,712 :: 		if (Fp[0] == 1) S1 = 0;
	MOVLW      0
	XORWF      _Fp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main598
	MOVLW      1
	XORWF      _Fp+0, 0
L__main598:
	BTFSS      STATUS+0, 2
	GOTO       L_main309
	BCF        PORTA+0, 1
L_main309:
;MyProject.c,713 :: 		if (Fp[1] == 1) S2 = 0;
	MOVLW      0
	XORWF      _Fp+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main599
	MOVLW      1
	XORWF      _Fp+2, 0
L__main599:
	BTFSS      STATUS+0, 2
	GOTO       L_main310
	BCF        PORTA+0, 2
L_main310:
;MyProject.c,714 :: 		if (Fp[2] == 1) S3 = 0;
	MOVLW      0
	XORWF      _Fp+5, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main600
	MOVLW      1
	XORWF      _Fp+4, 0
L__main600:
	BTFSS      STATUS+0, 2
	GOTO       L_main311
	BCF        PORTC+0, 0
L_main311:
;MyProject.c,715 :: 		if (WFS == 1) S0 = 0;
	MOVLW      0
	XORWF      _WFS+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main601
	MOVLW      1
	XORWF      _WFS+0, 0
L__main601:
	BTFSS      STATUS+0, 2
	GOTO       L_main312
	BCF        PORTA+0, 0
L_main312:
;MyProject.c,716 :: 		lF = 1;
	MOVLW      1
	MOVWF      _lF+0
	MOVLW      0
	MOVWF      _lF+1
;MyProject.c,717 :: 		val_lF = 0;
	CLRF       _val_lF+0
	CLRF       _val_lF+1
;MyProject.c,718 :: 		val_hF = 0;
	CLRF       _val_hF+0
	CLRF       _val_hF+1
;MyProject.c,719 :: 		}
L_main308:
;MyProject.c,720 :: 		if (val_lF == 1) {
	MOVLW      0
	XORWF      _val_lF+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main602
	MOVLW      1
	XORWF      _val_lF+0, 0
L__main602:
	BTFSS      STATUS+0, 2
	GOTO       L_main313
;MyProject.c,721 :: 		if (Fp[0] == 1) S1 = 1;
	MOVLW      0
	XORWF      _Fp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main603
	MOVLW      1
	XORWF      _Fp+0, 0
L__main603:
	BTFSS      STATUS+0, 2
	GOTO       L_main314
	BSF        PORTA+0, 1
L_main314:
;MyProject.c,722 :: 		if (Fp[1] == 1) S2 = 1;
	MOVLW      0
	XORWF      _Fp+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main604
	MOVLW      1
	XORWF      _Fp+2, 0
L__main604:
	BTFSS      STATUS+0, 2
	GOTO       L_main315
	BSF        PORTA+0, 2
L_main315:
;MyProject.c,723 :: 		if (Fp[2] == 1) S3 = 1;
	MOVLW      0
	XORWF      _Fp+5, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main605
	MOVLW      1
	XORWF      _Fp+4, 0
L__main605:
	BTFSS      STATUS+0, 2
	GOTO       L_main316
	BSF        PORTC+0, 0
L_main316:
;MyProject.c,724 :: 		if (WFS == 1) S0 = 1;
	MOVLW      0
	XORWF      _WFS+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main606
	MOVLW      1
	XORWF      _WFS+0, 0
L__main606:
	BTFSS      STATUS+0, 2
	GOTO       L_main317
	BSF        PORTA+0, 0
L_main317:
;MyProject.c,725 :: 		hF = 1;
	MOVLW      1
	MOVWF      _hF+0
	MOVLW      0
	MOVWF      _hF+1
;MyProject.c,726 :: 		val_hF = 0;
	CLRF       _val_hF+0
	CLRF       _val_hF+1
;MyProject.c,727 :: 		val_lF = 0;
	CLRF       _val_lF+0
	CLRF       _val_lF+1
;MyProject.c,728 :: 		}
L_main313:
;MyProject.c,730 :: 		if (v0 == 1) { // 0th state ; After 1s, S1 , S2, S3 will be again Low from High
	MOVLW      0
	XORWF      _v0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main607
	MOVLW      1
	XORWF      _v0+0, 0
L__main607:
	BTFSS      STATUS+0, 2
	GOTO       L_main318
;MyProject.c,731 :: 		v0 = 0;
	CLRF       _v0+0
	CLRF       _v0+1
;MyProject.c,732 :: 		S1 = 0;
	BCF        PORTA+0, 1
;MyProject.c,733 :: 		S2 = 0;
	BCF        PORTA+0, 2
;MyProject.c,734 :: 		S3 = 0;
	BCF        PORTC+0, 0
;MyProject.c,735 :: 		fI0H = 0;
	CLRF       _fI0H+0
	CLRF       _fI0H+1
;MyProject.c,736 :: 		initParams();
	CALL       _initParams+0
;MyProject.c,737 :: 		doAction();
	CALL       _doAction+0
;MyProject.c,738 :: 		}
L_main318:
;MyProject.c,740 :: 		if (v00 == 1) {
	MOVLW      0
	XORWF      _v00+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main608
	MOVLW      1
	XORWF      _v00+0, 0
L__main608:
	BTFSS      STATUS+0, 2
	GOTO       L_main319
;MyProject.c,741 :: 		v00 = 0;
	CLRF       _v00+0
	CLRF       _v00+1
;MyProject.c,743 :: 		freq = TMR1L;
	MOVF       TMR1L+0, 0
	MOVWF      _freq+0
	CLRF       _freq+1
	CLRF       _freq+2
	CLRF       _freq+3
;MyProject.c,744 :: 		if (freq  >= 11.5) { //16: 11.5MHz     ; 1s: divide by 2, 1.5s: divide by 3
	MOVF       _freq+0, 0
	MOVWF      R0
	MOVF       _freq+1, 0
	MOVWF      R1
	MOVF       _freq+2, 0
	MOVWF      R2
	MOVF       _freq+3, 0
	MOVWF      R3
	CALL       _longword2double+0
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      56
	MOVWF      R6
	MOVLW      130
	MOVWF      R7
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main320
;MyProject.c,745 :: 		I7 = 1;
	MOVLW      1
	MOVWF      _I7+0
	MOVLW      0
	MOVWF      _I7+1
;MyProject.c,746 :: 		} else {
	GOTO       L_main321
L_main320:
;MyProject.c,747 :: 		I7 = 0;
	CLRF       _I7+0
	CLRF       _I7+1
;MyProject.c,748 :: 		}
L_main321:
;MyProject.c,749 :: 		ST = I7; //for test
	BTFSC      _I7+0, 0
	GOTO       L__main609
	BCF        PORTC+0, 3
	GOTO       L__main610
L__main609:
	BSF        PORTC+0, 3
L__main610:
;MyProject.c,750 :: 		TMR1L = 0x00;
	CLRF       TMR1L+0
;MyProject.c,751 :: 		TMR1H = 0x00;
	CLRF       TMR1H+0
;MyProject.c,752 :: 		f00 = 1;
	MOVLW      1
	MOVWF      _f00+0
	MOVLW      0
	MOVWF      _f00+1
;MyProject.c,753 :: 		TMR1ON_bit = 1;
	BSF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;MyProject.c,754 :: 		}
L_main319:
;MyProject.c,755 :: 		}
	GOTO       L_main305
;MyProject.c,757 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

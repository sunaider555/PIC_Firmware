unsigned long speed, freq; //CPU SPeed, MHz]
float cycle = 0;
unsigned cNum = 0,
    y0 = 0, y1 = 0, y2 = 0, y3 = 0, //cycle
    i0f = 0, i1f = 0, i2f = 0, i3f = 0, i7f = 0,
    va0 = 0, va1 = 0, va2 = 0, va3 = 0, //valid
    I0 = 0, I1 = 0, I2 = 0, I3 = 0, I4 = 0, I7_0 = 0, I7 = 0,
    hNum = 0, lNum = 0,
    hF = 0, lF = 0,
    cycleF = 0, cycleL = 0,
    val_hF = 0, val_lF = 0, WBS = 0, //valid_highF   WBS=ActB_Sync
    Fp[3] = {0, 0, 0 }, // S1, S2, S3    Fp = FActPins
    fI0H = 0, c0 = 0, f0 = 0, v0 = 0, //fI0H : when IO , just from Low to High
    c00 = 0, f00 = 0, v00 = 0, //sine frequency timer1 : 1sec
    cnt = 0,
    prev3 = 0, prev2 = 0, prev1 = 0, cr = 0, Q[16] = {0}, sQ = 0, cQ = 0, WFS = 0, stateNum;
//ActF_Elapse = 0,     Q[] : ActF_State   , sQ: ActF_Start  , cQ : ActF_Cycle,   WFS: ActF_Sync
//cycleNum : cNum    stateNum : stateNum
int secF;
unsigned i = 0;
sbit P0 at PORTC.B7; //input data
sbit P1 at PORTA.B4;
sbit P2 at PORTC.B4;
sbit P3 at PORTC.B5;
sbit P7 at PORTA.B5; //analog input

sbit S1 at PORTA.B1; //output
sbit S2 at PORTA.B2;
sbit S3 at PORTC.B0;
sbit S0 at PORTA.B0;
sbit ST at PORTC.B3;
sbit ST1 at PORTC.B6;

void initParams() {
    hF = 0;
    lF = 0;
    val_lF = 0;
    val_hF = 0;
    cycleL = 0;
    cycleF = 0;
    val_hF = 0;
    val_lF = 0;
    S1 = 0;
    S2 = 0;
    S3 = 0;
}
void Init() {
    ANSELA = 0;
    ANSELA.B5 = 1; //analog realated resistors config ???
    ANSELC = 0;

    C1ON_bit = 0; // Disable comparators
    C2ON_bit = 0;

    speed = 16000;
    freq = 0;

    //     TRISC = 0x55;     // 0101  0101
    TRISC = 0xB0; //1011 0000
    PORTC = 0;

    //     TRISA = 0x20;     //0x00100000 = 0x20
    TRISA = 0x38; //0010 1000
    PORTA = 0;
    //     TRISB = 0; PORTB = 0;
    //TIMER0
    GIE_bit = 1;
    OPTION_REG = 0x02; //8 prescaler
    TMR0IE_bit = 1;
    TMR0 = 100;

    //Timer 1
    T1CON = 0x81; //enable Time1, external
    TMR1IF_bit = 0; //clear IMR1IF
    TMR1H = 0x00;
    TMR1L = 0x00;
    TMR1IE_bit = 1;
    cnt = 0;
    PEIE_bit = 1; //already GIE_bit is set as 1

    //     cycle = 200/((4*256*156*1000)/speed);    //the number of cycle in 200ms
    cycle = 12; //12: 190ms
    hNum = 45;
    lNum = 45;
    secF = 0;
    S1 = 0;
    S2 = 0;
    S3 = 0;
    S0 = 0;
    ST = 0;
    ST1 = 0;
    f00 = 1;

    initParams();
}

void getstateNum() {

    if (cr == 2 || cr == 3 || cr == 30) stateNum = 1;
    else if (cr == 4 || cr == 5 || cr == 50) stateNum = 2;
    else if (cr == 6 || cr == 7 || cr == 70 || cr == 71 || cr == 72) stateNum = 3;
    else if (cr == 8 || cr == 9 || cr == 90) stateNum = 4;
    else if (cr == 10 || cr == 11 || cr == 110 || cr == 111 || cr == 112) stateNum = 5;
    else if (cr == 12 || cr == 13 || cr == 130 || cr == 131 || cr == 132) stateNum = 6;
    else if (cr == 14 || cr == 15 || cr >= 150) stateNum = 7;
    else stateNum = 0;
}

void interrupt() {
    if (TMR0IF_bit) {
        TMR0IF_bit = 0; // clear TMR0IF
        cNum++; // increment counter
        if (i0f == 1) y0++;
        if (i1f == 1) y1++;
        if (i2f == 1) y2++;
        if (i3f == 1) y3++;

        if (cNum >= cycle) {
            secF = 1;
            TMR0IE_bit = 0;
        }
        if (y0 >= cycle) {
            va0 = 1;
        }
        if (y1 >= cycle) {
            va1 = 1;
        }
        if (y2 >= cycle) {
            va2 = 1;
        }
        if (y3 >= cycle) {
            va3 = 1;
        }
        if (hF == 1) cycleF++;
        if (lF == 1) cycleL++;
        if (cycleF >= hNum) {
            hF = 0;
            cycleF = 0;
            val_hF = 1;
        }

        if (cycleL >= lNum) {
            lF = 0;
            cycleL = 0;
            val_lF = 1;
        }
        //measure frequency by Timer1
        if (f00 == 1) {
            c00++;
            if (c00 >= 90) {
                TMR1ON_bit = 0;
                f00 = 0;
                c00 = 0;
                v00 = 1;
            } //63 : 1000ms , 90: 1500ms
        }
        //S1, S2, S3 HIGH for 1 second
        if (f0 == 1) {
            c0++;
            if (c0 >= 63) {
                f0 = 0;
                c0 = 0;
                v0 = 1;
            } //60 : 1000ms
        }
        //Do ActF
        if (sQ == 1) {
            cQ++;
            if (cQ < 1800) {
                S0 = 1;
                WFS = 0;
            } // : 30 sec  1800, 7200
            else if (cQ >= 1800 && cQ < 7200) {
                WFS = 1;
            } else if (cQ >= 7200) {
                cQ = 7500;
                WFS = 0;
                S0 = 0;
            } // : 90 sec
        } else {
            S0 = 0;
        }
    }
    if (TMR1IF_bit) {
        cnt++; // increment counter
        TMR1IF_bit = 0; // clear TMR0IF
        TMR1H = 0x80;
        TMR1L = 0x00;
    }
}

void doQ(unsigned state) { //ActF
    getstateNum();
    if (state == 0) cQ = 0;
    else cQ = Q[state];
    sQ = 1;
}
void paQ() { //pause ActF
    sQ = 0;
}
void hist() {
    getstateNum();
    if (prev1 != stateNum) {
        prev3 = prev2;
        prev2 = prev1;
        prev1 = stateNum;
    }
}
void complete_init() {
    S1 = 0;
    S2 = 0;
    S3 = 0;
    S0 = 0;
    paQ();
    cr = 0;
    prev3 = 0;
    prev2 = 0;
    prev1 = 0;
    ST1 = 0;
    for (i = 0; i < 16; i++) {
        Q[i] = 0;
    }
}
void doAction() {
    //     PORTC.B7 = ~PORTC.B7;

    if (prev1 != 0) {
        getstateNum();
        Q[stateNum] = cQ;
    } // if not pressed HIGH LOW LOW LOW, in the past,

    if (I0 == 0) //I7: s:0, R:1
    {
        complete_init();
    } else if (I0 == 1 && fI0H == 1) {
        f0 = 1;
        S1 = 1;
        S2 = 1;
        S3 = 1;
        paQ();
        cr = 0;
    } else if (I0 == 1 && I1 == 0 && I2 == 0 && I3 == 0 && fI0H == 0) //Excel 0, 1:       I7: s:0, R:1
    {
        complete_init();
    }

    if (I0 == 1 && I1 == 0 && I2 == 0 && I3 == 1 && fI0H == 0) //Excel 2, 3
    {
        S1 = 0;
        S2 = 0;
        hF = 1;
        WBS = 1;
        Fp[0] = 0;
        Fp[1] = 0;
        Fp[2] = 1;

        if (cr == 70 || cr == 7) {
            cr = 72;
            if (prev2 == 1) {
                cr = 30;
                doQ(1);
            } else if (prev2 == 2) {
                cr = 50;
            }
        } else if (cr == 72) {} 
        else if (cr == 110 || cr == 11) {
            cr = 112;
            if (prev2 == 1) {
                cr = 30;
                doQ(1);
            } else if (prev2 == 4) {
                cr = 30;
            }
        } else if (cr == 112) {} 
        else if (cr == 152) {
            cr = 1522;
        } 
        else if (cr == 1522) {} 
        else if (cr == 153) {
            cr = 1531;
        } 
        else if (cr == 1531) {} 
        else if (cr == 3) {
            cr = 30;
        } 
        else if (cr == 30) {} 
        else {
            if (I7 == 0) { //Excel 2:
                cr = 2;
                cQ = 0;
                paQ();
                S0 = 0;
            } else //Excel 3:
            {
                if (cr == 2) {
                    cr = 3;
                    cQ = 0;
                    doQ(0);
                } else {
                    cr = 3;
                    cQ = 0;
                    doQ(1);
                }

            }

        }
    }
    if (I0 == 1 && I1 == 0 && I2 == 1 && I3 == 0 && fI0H == 0) //Excel 4, 5
    {
        S1 = 0;
        hF = 1;
        WBS = 1;
        Fp[0] = 0;
        Fp[1] = 1;
        Fp[2] = 0;
        S3 = 0;

        if (cr == 70 || cr == 7) {
            cr = 71;

            if (prev2 == 1) {
                cr = 50; // doQ(2);
            } else if (prev2 == 2) {
                cr = 50;
                doQ(2);
            }
        } 
        else if (cr == 71) {} 
        else if (cr == 130 || cr == 13) {
            cr = 132;
            if (prev2 == 2) {
                cr = 50;
                doQ(2);
            } else if (prev2 == 4) {
                cr = 50;
            }
        } 
        else if (cr == 132 || cr == 1512 || cr == 1532 || cr == 50) {} 
        else if (cr == 151) {
            cr = 1512;
        }
        //        else if (cr == 1512) {}
        else if (cr == 153) {
            cr = 1532;
        }
        //        else if (cr == 1532) {}
        else if (cr == 5) {
            cr = 50;
        }
        //        else if (cr == 50) {}
        else {
            if (I7 == 0) { //Excel 4:
                cr = 4;
                paQ();
            } else //Excel 5:
            {
                if (cr == 4) {
                    cr = 5;
                    cQ = 0;
                    doQ(0);
                    S0 = 1;
                } else {
                    cr = 5;
                    cQ = 0;
                    doQ(2);
                }
            }

        }

    }
    //Excel 50

    if (I0 == 1 && I1 == 0 && I2 == 1 && I3 == 1 && fI0H == 0) //Excel 6, 7
    {
        S1 = 0;
        hF = 1;
        WBS = 1;
        Fp[0] = 0;
        Fp[1] = 1;
        Fp[2] = 1;
        if (cr == 7) {
            cr = 70;
        } 
        else if (cr == 70) {} 
        else if (cr == 150 || cr == 15) {
            cr = 153;   //ST1 = 1;

            if (prev2 == 3) {
                cr = 70;
                doQ(3);
            }
        } 
        else if (cr == 153) {} 
        else {
            if (I7 == 0) {
                cr = 6;
                paQ();
            } else //Excel 7:
            {
                if (cr == 6) {
                    cr = 7;
                    cQ = 0;
                    doQ(0);
                } else {
                    cr = 7;
                    cQ = 0;
                    doQ(3);    ST1 = 1;
                }
            }

        }
    }
    //Excel 70

    if (I0 == 1 && I1 == 1 && I2 == 0 && I3 == 0 && fI0H == 0) //Excel 8, 9:
    {
        hF = 1;
        WBS = 1;
        Fp[0] = 1;
        Fp[1] = 0;
        Fp[2] = 0;
        S2 = 0;
        S3 = 0;

        if (cr == 110 || cr == 11) {
            cr = 111;
            if (prev2 == 1) {
                cr = 90;
            } 
            else if (prev2 == 4) {
                cr = 90;
                doQ(4);
            }
        } 
        else if (cr == 111) {} 
        else if (cr == 130 || cr == 13) {
            cr = 131;

            if (prev2 == 2) {cr = 90;}
            else if (prev2 == 4) {
                cr = 90;
                doQ(4);
            }
        } 
        else if (cr == 131) {} 
        else if (cr == 151) {
            cr = 1511;
        } 
        else if (cr == 1511) {} 
        else if (cr == 152) {
            cr = 1521;
        } 
        else if (cr == 1521) {} 
        else if (cr == 9) {
            cr = 90;
        } 
        else if (cr == 90) {} 
        else {
            if (I7 == 0) {
                cr = 8;
                paQ();
            } else //Excel 9:
            {
                if (cr == 8) {
                    cr = 9;
                    cQ = 0;
                    doQ(0);
                } else {
                    cr = 9;
                    cQ = 0;
                    doQ(4);
                }
            }

        }
    }
    //Excel 90

    if (I0 == 1 && I1 == 1 && I2 == 0 && I3 == 1 && fI0H == 0) //Excel 10, 11
    {
        hF = 1;
        WBS = 1;
        Fp[0] = 1;
        Fp[1] = 0;
        Fp[2] = 1;
        S2 = 0;
        S3 = 0;

        if (cr == 150 || cr == 15) {
            cr = 152;

            if (prev2 == 5) {
                cr = 110;
                doQ(5);
            }
        } 
        else if (cr == 152) {} 
        else if (cr == 11) {
            cr = 110;
        } 
        else if (cr == 110) {} 
        else {
            if (I7 == 0) { //Excel 10:
                cr = 10;
                paQ();
            } 
            else //Excel 11:
            {
                if (cr == 10) {
                    cr = 11;
                    cQ = 0;
                    doQ(0);
                } else {
                    cr = 11;
                    cQ = 0;
                    doQ(5);
                }
            }

        }
    }
    //Excel 110

    if (I0 == 1 && I1 == 1 && I2 == 1 && I3 == 0 && fI0H == 0) //Excel 12, 13
    {
        hF = 1;
        WBS = 1;
        Fp[0] = 1;
        Fp[1] = 1;
        Fp[2] = 0;
        S2 = 0;
        if (cr == 150 || cr == 15) {
            cr = 151;

            if (prev2 == 6) {
                cr = 130;
                doQ(6);
            }
        } 
        else if (cr == 151) {}
        else if (cr == 13) {
            cr = 130;
        } 
        else if (cr == 130) {}
        else {
            if (I7 == 0) {
                cr = 12;
                paQ();
            } else {
                if (cr == 12) {
                    cr = 13;
                    cQ = 0;
                    doQ(0);
                } else {
                    cr = 13;
                    cQ = 0;
                    doQ(6);
                }
            }

        }
    }
    //Excel 130

    if (I0 == 1 && I1 == 1 && I2 == 1 && I3 == 1 && fI0H == 0) //Excel 14:
    {
        hF = 1;
        WBS = 1;
        Fp[0] = 1;
        Fp[1] = 1;
        Fp[2] = 1;

        if (I7 == 0) {

            if (cr == 15) {
                cr = 150;
            } 
            else if (cr == 150) {} 
            else {
                cr = 14;
                paQ();
            }
        } else {
            //            hF = 1; WBS = 1; Fp[0] = 1; Fp[1] = 1; Fp[2] = 1;

            if (cr == 14) {
                cr = 15;
                cQ = 0;
                doQ(0);
            } else if (cr == 150) {} else {
                cr = 15;
                cQ = 0;
                doQ(7);
            }

        }
    }
    //Excel 150

    if (hF == 1) {
        if (WBS == 1) {
            if (Fp[0] == 1) S1 = 1;
            if (Fp[1] == 1) S2 = 1;
            if (Fp[2] == 1) S3 = 1;
        }
        if (WFS == 1) {
            S0 = 1;
        }
    } else if (lF == 1) {
        if (WBS == 1) {
            if (Fp[0] == 1) S1 = 0;
            if (Fp[1] == 1) S2 = 0;
            if (Fp[2] == 1) S3 = 0;
        }
        if (WFS == 1) {
            S0 = 0;
        }
    }
    hist();
}

void checkInput() {
    if (P0 != I0 && i0f == 0) i0f = 1;
    if (P1 != I1 && i1f == 0) i1f = 1;
    if (P2 != I2 && i2f == 0) i2f = 1;
    if (P3 != I3 && i3f == 0) i3f = 1;
    if (I7_0 != I7 && i7f == 0) i7f = 1;

    if (va0 == 1 && i0f == 1 && P0 != I0) {
        initParams();
        I0 = P0;
        if (I0 == 1) fI0H = 1;
        else fI0H = 0;
        //do sth
        doAction();
        //init()
        va0 = 0;
        i0f = 0;
        y0 = 0;
    } else if (va0 == 1 && i0f == 1 && P0 == I0) {
        va0 = 0;
        i0f = 0;
        y0 = 0;
    }

    if (va1 == 1 && i1f == 1 && P1 != I1) {
        initParams();
        I1 = P1;
        doAction();
        va1 = 0;
        i1f = 0;
        y1 = 0;
    } else if (va1 == 1 && i1f == 1 && P1 == I1) {
        va1 = 0;
        i1f = 0;
        y1 = 0;
    }

    if (va2 == 1 && i2f == 1 && P2 != I2) {
        initParams();
        I2 = P2;
        doAction();
        va2 = 0;
        i2f = 0;
        y2 = 0;
    } else if (va2 == 1 && i2f == 1 && P2 == I2) {
        va2 = 0;
        i2f = 0;
        y2 = 0;
    }

    if (va3 == 1 && i3f == 1 && P3 != I3) {
        initParams();
        I3 = P3;
        doAction();
        va3 = 0;
        i3f = 0;
        y3 = 0;
    } else if (va3 == 1 && i3f == 1 && P3 == I3) {
        va3 = 0;
        i3f = 0;
        y3 = 0;
    }

    if (I7_0 != I7) {
        I7_0 = I7;
        doAction();
    }
}

void main() {
    Init();
    while (1) {
        if (secF == 1) {
            //              ST = 1;

            //              Delay_ms(10);
            secF = 0;
            cNum = 0;
            TMR0 = 100;
            TMR0IF_bit = 0;
            //              ST = 0;
            TMR0IE_bit = 1;
        }
        //check whether input state is changed, if changed, set flag of input, so start to count time
        checkInput();

        //do sth
        if (val_hF == 1) {
            if (Fp[0] == 1) S1 = 0;
            if (Fp[1] == 1) S2 = 0;
            if (Fp[2] == 1) S3 = 0;
            if (WFS == 1) S0 = 0;
            lF = 1;
            val_lF = 0;
            val_hF = 0;
        }
        if (val_lF == 1) {
            if (Fp[0] == 1) S1 = 1;
            if (Fp[1] == 1) S2 = 1;
            if (Fp[2] == 1) S3 = 1;
            if (WFS == 1) S0 = 1;
            hF = 1;
            val_hF = 0;
            val_lF = 0;
        }

        if (v0 == 1) { // 0th state ; After 1s, S1 , S2, S3 will be again Low from High
            v0 = 0;
            S1 = 0;
            S2 = 0;
            S3 = 0;
            fI0H = 0;
            initParams();
            doAction();
        }

        if (v00 == 1) {
            v00 = 0;

            freq = TMR1L;
            if (freq  >= 11.5) { //16: 11.5MHz     ; 1s: divide by 2, 1.5s: divide by 3
                I7 = 1;
            } else {
                I7 = 0;
            }
            ST = I7; //for test
            TMR1L = 0x00;
            TMR1H = 0x00;
            f00 = 1;
            TMR1ON_bit = 1;
        }
    }

}

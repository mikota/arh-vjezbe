                       `ORG 0 
00000000  DC 00 80 04  MAIN    MOVE BLOK, R1 
00000004  00 00 81 07          MOVE 10000, SP 
00000008  00 10 80 06          MOVE 1000, R5 
0000000C  00 00 10 A5  LOOP    LOADH R2, (R1) 
00000010  02 00 90 A5          LOADH R3, (R1+2) 
00000014  04 00 90 24          ADD R1, 4, R1 
00000018  00 80 20 6C          CMP R2, 8000 
0000001C  28 00 00 C6          JP_NE DALJE 
00000020  00 80 30 6C          CMP R3, 8000 
00000024  D8 00 C0 C5          JP_EQ END 
                       DALJE           ;TU TREBAM PROSIRITI 
00000028  00 00 04 02          MOVE R2, R4 
0000002C  15 00 40 5E          SHR R4,15,R4 
00000030  00 00 40 6C          CMP R4, 0 
00000034  54 00 00 C6          JP_NE NEG 
                       POZOVI   
00000038  00 00 00 89          PUSH R2 
0000003C  00 00 80 89          PUSH R3 
00000040  64 00 00 CC          CALL COMP 
00000044  00 00 50 BC          STORE R0, (R5) 
00000048  08 00 F0 27          ADD R7, 8, R7 
0000004C  04 00 D0 26          ADD R5,4,R5 
00000050  0C 00 00 C4          JP LOOP 
                        
00000054  00 00 04 02  NEG     MOVE R2, R4 
00000058  00 00 4F 0E          OR R4, 0FFFF0000, R4 
0000005C  00 00 08 01          MOVE R4, R2 
00000060  38 00 00 C4          JP POZOVI 
                       COMP     
00000064  00 00 80 88          PUSH R1 
00000068  00 00 80 89          PUSH R3 
0000006C  00 00 00 8A          PUSH R4 
00000070  00 00 00 04          MOVE 0, R0 
00000074  04 00 80 05          MOVE 4, R3 
00000078  00 00 00 06          MOVE 0, R4 
                       PETLJA   
0000007C  00 00 30 6C          CMP R3,0 
00000080  C4 00 C0 C5          JP_EQ VRATI 
00000084  10 00 F0 B4          LOAD R1, (SP + 10) 
00000088  14 00 70 B5          LOAD R2, (SP + 14) 
0000008C  01 00 B0 35          SUB R3, 1, R3 
00000090  00 00 98 48          ROTR R1, R4, R1 
00000094  00 00 98 48          ROTR R1, R4, R1 
                        
00000098  08 00 40 26          ADD R4, 8, R4     ;MIJENJAM OFFSET 
                        
0000009C  FF 00 90 14          AND R1, 0FF, R1 
000000A0  FF 00 20 15          AND R2, 0FF, R2 
000000A4  00 00 14 68          CMP R1,R2 
000000A8  B8 00 C0 C5          JP_EQ ISTI 
000000AC  08 00 00 4C          ROTR R0, 8, R0 
000000B0  BB 00 00 24          ADD R0, 0BB, R0 
000000B4  7C 00 00 C4          JP PETLJA 
000000B8  08 00 00 4C  ISTI    ROTR R0, 8, R0 
000000BC  AA 00 00 24          ADD R0, 0AA, R0 
000000C0  7C 00 00 C4          JP PETLJA 
000000C4  08 00 00 4C  VRATI   ROTR R0, 8, R0 
000000C8  00 00 00 82          POP R4 
000000CC  00 00 80 81          POP R3 
000000D0  00 00 80 80          POP R1 
000000D4  00 00 00 D8          RET 
                        
000000D8  00 00 00 F8  END     HALT 
000000DC  2C 43 21 43  BLOK `DW 2C,43,21,43,BA,7D,FF,00,8B,B7,8B,54,DA,DE,DA,BA,
          BA 7D FF 00  
          8B B7 8B 54  
          DA DE DA BA  
          39 1B 8A 7C  
          00 80 00 80  
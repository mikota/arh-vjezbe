                       `ORG 0 
00000000  80 00 80 04  MAIN    MOVE BLOK, R1 
00000004  00 10 80 06          MOVE 1000, R5 
00000008  00 00 10 A5  LOOP    LOADH R2, (R1) 
0000000C  02 00 90 A5          LOADH R3, (R1+2) 
00000010  04 00 90 24          ADD R1, 4, R1 
00000014  00 80 20 6C          CMP R2, 8000 
00000018  24 00 00 C6          JP_NE DALJE 
0000001C  00 80 30 6C          CMP R3, 8000 
00000020  7C 00 C0 C5          JP_EQ END 
                       DALJE           ;TU TREBAM PROSIRITI 
00000024  00 00 04 02          MOVE R2, R4 
00000028  15 00 40 5E          SHR R4,15,R4 
0000002C  00 00 40 6C          CMP R4, 0 
00000030  4C 00 00 C6          JP_NE NEG 
                       POZOVI   
00000034  00 00 00 89          PUSH R2 
00000038  00 00 80 89          PUSH R3 
0000003C  5C 00 00 CC          CALL COMP 
00000040  00 00 50 BC          STORE R0, (R5) 
00000044  04 00 D0 26          ADD R5,4,R5 
00000048  08 00 00 C4          JP LOOP 
                        
0000004C  00 00 04 02  NEG     MOVE R2, R4 
00000050  00 00 4F 0E          OR R4, 0FFFF0000, R4 
00000054  00 00 08 01          MOVE R4, R2 
00000058  34 00 00 C4          JP POZOVI 
                       COMP     
0000005C  00 00 80 88          PUSH R1 
00000060  00 00 80 89          PUSH R3 
00000064  00 00 00 8A          PUSH R4 
00000068  00 00 00 04          MOVE 0, R0 
                        
                        
0000006C  00 00 00 82          POP R4 
00000070  00 00 80 81          POP R3 
00000074  00 00 80 80          POP R1 
00000078  00 00 00 D8          RET 
                        
0000007C  00 00 00 F8  END     HALT 
00000080  21 43 2C 43  BLOK `DW 21,43,2C,43,FF,00,BA,7D,8B,54,8B,B7,DA,BA,DA,DE,
          FF 00 BA 7D  
          8B 54 8B B7  
          DA BA DA DE  
          8A 7C 39 1B  
          00 80 00 80  

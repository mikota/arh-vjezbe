                       `ORG 0 
00000000  00 05 00 04  PROG    MOVE    500, R0 
00000004  00 00 80 B4          LOAD    R1, (R0)       ;R1=BROJ PODATAKA 
00000008  04 00 00 24          ADD     R0, 4, R0      ;POINTER NA POCETAK PODATA
0000000C  00 10 00 05          MOVE    1000, R2        ;POINTER NA POCETAK DEST 
                        
00000010  00 00 10 6C  LOOP    CMP     R1, 0 
00000014  94 00 C0 C5          JP_EQ   KRAJ 
00000018  00 00 80 B5          LOAD    R3, (R0) 
0000001C  00 00 30 6C          CMP     R3, 0 
00000020  54 00 40 C4          JP_N    NEG 
00000024  00 00 86 02          MOVE    R3, R5 
00000028  07 00 D0 5E          SHR     R5, 7, R5 
0000002C  00 00 50 6C          CMP     R5, 0 
00000030  8C 00 00 C6          JP_NE   REPL 
                        
00000034  00 00 B6 09  NOREPL  OR      R3, R3, R3 
00000038  74 00 80 C4          JP_P    SPREMI 
                        
0000003C  00 00 06 02          MOVE    R3, R4 
00000040  FF FF 4F 1E          XOR     R4, -1, R4 
00000044  01 00 40 26          ADD     R4, 1, R4 
00000048  80 00 40 0E          OR      R4, 80, R4 
0000004C  00 00 88 01          MOVE    R4, R3 
00000050  74 00 00 C4          JP      SPREMI 
                        
00000054  00 00 06 02  NEG     MOVE    R3, R4 
00000058  FF FF 4F 1E          XOR     R4, -1, R4 
0000005C  01 00 40 26          ADD     R4, 1, R4 
00000060  00 00 88 02          MOVE    R4, R5 
00000064  07 00 D0 5E          SHR     R5, 7, R5 
00000068  00 00 50 6C          CMP     R5, 0 
0000006C  8C 00 00 C6          JP_NE   REPL 
00000070  34 00 00 C4          JP      NOREPL 
                        
                        
00000074  00 00 A0 9D  SPREMI  STOREB  R3, (R2) 
00000078  04 00 00 24          ADD     R0, 4, R0 
0000007C  01 00 20 25          ADD     R2, 1, R2 
00000080  01 00 90 34          SUB     R1, 1, R1 
00000084  10 00 00 C6          JP_NZ   LOOP 
00000088  94 00 00 C4          JP      KRAJ 
                        
0000008C  FF 00 80 05  REPL    MOVE    0FF,R3 
00000090  74 00 00 C4          JP      SPREMI 
                                
00000094  00 00 00 F8  KRAJ    HALT 
                        
00000098  81 FF FF FF  NMIN `DW 81,FF,FF,FF 
0000009C  7F 00 00 00  NMAX `DW 7F,00,00,00 
                        
                       `ORG 500 
00000500  06 00 00 00  `DW 06,00,00,00,FF,FF,FF,FF,02,00,00,00,23,01,00,00,25,00
          FF FF FF FF  
          02 00 00 00  
          23 01 00 00  
          25 00 00 00  
          44 FD FF FF  
          DF FF FF FF  
                        

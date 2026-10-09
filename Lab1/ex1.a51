ORG 0h
Start: MOV DPTR,#1000h ;incarcare adresa in DPTR
MOVX A,@DPTR ;citire din MD externa a octetului mai semnificativ
;a adresei de start a sirului
MOV R0,A ;depunere in registrul R0
INC DPTR ;incrementare DPTR
MOVX A,@DPTR ;citire din MD externa a octetului mai putin
;semnificativ a adresei de start a sirului
MOV R1,A ;depunere in registrul R1
MOV DPH,R0 ;transfer oms al adresei in DPH
MOV DPL,R1 ;transfer omps al adresei in DPL
MOV R0,#00h ;R0 folosit mai departe pentru Length
Next: MOVX A,@DPTR ;citre din MD externa a caracterelor sirului
CJNE A,#0Dh,Loop ;testarea caracterului citit daca este egal cu CR
;(0Dh) nu se face salt
MOV A,R0 ;transfera Length in A
MOV DPTR,#1002h ;incarc in DPTR adresa variabilei LENGTH din MD
;externa
MOVX @DPTR,A ;depunere in MD externa
SJMP Exit ;salt scurt la iesire
Loop: INC R0 ;incrementeaza Length
INC DPTR ;trecere la urmatorul caracter
SJMP Next ;reia bucla
Exit: SJMP $ ;program blocat aici
END
; Perifericos de Entrada
ON_OFF					EQU		1A0H	; Endereço do botao para ligar a maquina
botaoOK 				EQU		1B0H	; Endereço do botao para continuar
NR_SEL					EQU 	1C0H	; Endereço que guarda o numero pretendido
Username_I				EQU		1D0H	;Endereço do início do periférico de entrada para a introdução do Username
Username_F				EQU		1D7H	;Endereço do fim do periférico de entrada para a introdução do Username
Password_I				EQU		1E0H	;Endereço do início do periférico de entrada para a introdução da Password
Password_F				EQU		1E7H	;Endereço do fim do periférico de entrada para a introdução da Password

; Display
InicioDisplay			EQU		200H	; Inicio do display principal
FimDisplay				EQU		26FH	; Fim do display principal
I_Username				EQU		0234H	;Endereço do início do display para a visualização do Username
F_Username				EQU		023CH	;Endereço do fim do display para a visualização do Username
I_Password				EQU		0254H	;Endereço do início do display para a visualização da Password
F_Password				EQU		025CH	;Endereço do fim do display para a visualização da Password
I_Total_Euros			EQU		0046H	;Endereço do início do display para a visualização do preço total a pagar
F_Total_Euros			EQU		0048H	;Endereço do fim do display para a visualização do preço total a pagar


; Constantes
OK						EQU 	1		; Opçao para continuar
Login                   EQU     1       ; Opçao para fazer o login
Registo                 EQU     2       ; Opçao para fazer o registo
PedirPizza              EQU     1       ; Opçao para pedir pizza
Logout                  EQU     2       ; Opçao para fazer o logout
PizzaPequena 			EQU 	1		; Opçao para pedir uma pizza pequena
PizzaGrande				EQU 	2		; Opçao para pedir uma pizza grande
CustoPequena		    EQU		5		; Custo da pizza pequena
CustoGrande	    	    EQU		9		; Custo da pizza grande
Hotdancers				EQU 	1 		; Opçao para a pizza hotdancers
QuatroQueijos			EQU 	2	 	; Opçao para a pizza quatro queijos
Spinaci 				EQU 	3		; Opçao para a pizza spinaci
Portuguesa				EQU 	4		; Opçao para a pizza Portuguesa
CheeseHam				EQU		5		; Opçao para a pizza cheeseham
PedirMais               EQU     1       ; Opçao para pedir mais pizza/s
Pagamento				EQU 	2		; Opçao para fazer o pagamento
Pepsi					EQU 	1 		; Opcao para a bebida pepsi
Icetea 					EQU 	2		; Opçao para a bebida icetea
Agua					EQU		3		; Opçao para a bebida agua
CustoPepsi			    EQU		2		; Custo da Pepsi
CustoIceTea	    	    EQU		2		; Custo do IceTea
CustoAgua				EQU 	1		; Custo da agua
Tamanho					EQU		8		; Tamanho do Username e da Password
Desconto                EQU     2AH     ; Valor do desconto aplicado
CaraterVazio            EQU     20H     ; Endereço de um caracter vazio para uso posterior
CaraterAsterisco		EQU		2AH		;Caracter asterisco para a apresentação da password

;endereços relativos à base de dados (Guarda o username, password e valor total gasto)
	Inicio_Dados			EQU		1000H	;Endereço do início da base de dados dos utilizadores
	Fim_Dados				EQU		11D0H	;Endereço do fim da base de dados dos utilizadores
	Pular_Utilizador		EQU		30H		;Valor para saltar para mudar para outro utilizador
	Pular_Dados_Utilizador	EQU		10H		;Valor para saltar para outro dado desse utilizador
		
StackPointer 			EQU 	8000H   ; Endereço base da pilha 

Place 2000H
MenuPrincipal:							; Display do menu principal
	STRING "                "
	STRING " MENU PRINCIPAL "
	STRING "                "
	STRING "  1 - LOGIN     "
	STRING "  2 - REGISTO   "
	STRING "                "
	STRING "[OK] - CONTINUAR"
	
Place 2080H
MenuRegisto:							; Display do registo
	STRING "  MENU REGISTO  "
	STRING "                "
	STRING "   USERNAME:    "
	STRING "                "
	STRING "   PASSWORD:    "
	STRING "                "
	STRING "[OK] - CONTINUAR"
	
Place 2100H
MenuLogin:								; Display do login
	STRING "   MENU LOGIN   "
	STRING "                "
	STRING "   USERNAME:    "
	STRING "                "
	STRING "   PASSWORD:    "
	STRING "                "
	STRING "[OK] - CONTINUAR"

Place 2180H
MenuLoginCompleto:						; Display do login completo
	STRING "                "
	STRING "   MENU LOGIN   "
	STRING "                "
	STRING "  EFETUADO COM  "
	STRING "    SUCESSO     "
	STRING "                "
	STRING "[OK] - CONTINUAR"

Place 2200H
MenuLoginErrado:						; Display do login no caso de não estar correto
	STRING "                "
	STRING "   MENU LOGIN   "
	STRING "                "
	STRING "  ERRO!  LOGIN  "
	STRING "     ERRADO     "
	STRING "                "
	STRING "[OK] - CONTINUAR"

Place 2280H
MenuPedido:								; Display do pedido
	STRING "                "
	STRING "   MENU PEDIDO  "
	STRING "                "
	STRING "1 - PEDIR PIZZA "
	STRING "2 - LOGOUT      "
	STRING "                "
	STRING "[OK] - CONTINUAR"

Place 2300H
MenuPizzaSabores:						; Display de qual pizza será escolhida
	STRING "MENU PEDIR PIZZA"
	STRING "1- HOTDANCERS   "
	STRING "2- 4 QUEIJOS    "
	STRING "3- SPINACI      "
	STRING "4- PORTUGUESA   "
	STRING "5- CHEESEHAM    "
	STRING "[OK] - CONTINUAR"


Place 2380H
MenuPizzaTamanho:						; Display do tamanho para pizza
	STRING "                "
	STRING "MENU PEDIR PIZZA"
	STRING "                "
	STRING "1-PEQUENA(5 EUR)"
	STRING "2-GRANDE (9 EUR)"
	STRING "                "
	STRING "[OK] - CONTINUAR"

Place 2400H
MenuBebidas:							; Display de qual bebida será escolhida
	STRING "  MENU BEBIDAS  "
	STRING "                "
	STRING "1-PEPSI  (2 EUR)"
	STRING "2-ICETEA (2 EUR)"
	STRING "3-AGUA   (1 EUR)"
	STRING "                "
	STRING "[OK]- SEM BEBIDA"

Place 2480H
MenuPizzaVrf:							; Display seguinte ao MenuBebidas para verificar se o cliente vai escolher mais alguma pizza
	STRING "VAI QUERER MAIS "
	STRING " ALGUMA COISA?  "
	STRING "                "
	STRING "1-SIM, QUERO    "
	STRING "2-NAO, PAGAMENTO"
	STRING "                "
	STRING "[OK] - CONTINUAR"

Place 2500H
MenuPagamento:							; Display do pedido quando este é finalizado
	STRING " PAGAMENTO      "
	STRING "                "
	STRING "VALOR:       EUR"
	STRING "DESCONTO:    EUR"
	STRING "TOTAL:       EUR"
	STRING "                "
	STRING "[OK] - CONTINUAR"

Place 2580H
MenuOpcaoInvalida:                  	; Display no caso de ser escolhida uma opcao invalida
    STRING "                "
	STRING "    ATENÇAO     "
	STRING "                "
	STRING "     OPCAO      "
	STRING "    INVALIDA    "
	STRING "                "
	STRING "[OK] - CONTINUAR"
	
Place 2600H
MenuLogout:                  			; Display no caso de ser escolhido o logout
    STRING "                "
	STRING " OBRIGADO PELA  "
	STRING "  SUA VISITA    "
	STRING "                "
	STRING "      :)        "
	STRING "                "
	STRING "[OK] - CONTINUAR"
	
Place 2680H
MenuLoginImpossivel:
	STRING "    ATENÇAO     "			; Display no caso de nao houver registos guardados
	STRING "                "
	STRING "   Nao existe   "		
	STRING " nenhum registo "		
	STRING "   efetuado!    "  		
	STRING "                "		
	STRING "[OK] - VOLTAR   "		

Place 2680H
MenuPasswordIncompleta:
	STRING "    ATENÇAO     "			; Display no caso de nao houver registos guardados
	STRING "                "
	STRING "   A PASSWORD   "		
	STRING "  TEM QUE TER   "		
	STRING " MAIS CARATERES "  		
	STRING "                "		
	STRING "[OK] - VOLTAR   "		
	
; ************************** PROGRAMA **********************************

Place 0000H
Inicio:
	MOV R0, Principio               	; Coloca em R0 o endereço do Principio
	JMP R0                          	; Salta para o endereço do Principio
	
Place 3000H
Principio:
	MOV SP, StackPointer            	; Mete em SP o endereço do início da pilha
	CALL LimpaDisplay  	            	; Limpa o display
	CALL LimpaPerifericos           	; Limpa os perifericos de entrada
	MOV R0, ON_OFF
	
Liga:
	MOVB R1, [R0]						; Colona no R1 o conteudo do R0
	CMP R1, 1							; Compara o R1 com o valor 1
	JNE Liga							; Salta para a rotina liga
	
Ligado:
    MOV R2, MenuPrincipal           	; Coloca em R2 o endereço do MenuPrincipal
    CALL MostraDisplay             		; Mostra o display
    CALL LimpaPerifericos          		; Limpa os perifericos de entrada
	
Ler_Opcao:
    MOV R0, NR_SEL                  	; Coloca o endereço NR_SEL no registo R0
    MOVB R1, [R0]                   	; Coloca no registo R1 o conteudo do registo R0
	CMP R1, 0	                    	; Compara o valor de R1 com 0
    JEQ Ler_Opcao 	                	; Se o valor for igual a 0, espera ate haver alteracao
    CMP R1, Login                   	; Compara o valor de R1 com a constante Login
    JEQ MenufazerLogin              	; Se o valor for igual, significa que foi selecionado o login
    CMP R1, Registo                 	; Compara o valor de R1 com a constante Registo
    JEQ MenufazerRegisto            	; Se o valor for igual, significa que foi selecionado o registo	
	CMP R1, 3
	JEQ Menu_Pedido
	CALL RotinaErro						; Mostra um display de erro
    JMP Ligado                      	; Salta para o endereço "MenuPedido"

;********************** MENU LOGIN ***********************************

; Rotina fazer Login
MenufazerLogin:
    MOV R2 , MenuLogin							; Coloca em R2 o endereço do MenuRegisto
	CALL MostraDisplay							; Mostra o display
	CALL LimpaPerifericos						; Limpa os perifericos
	CALL LimpaUsernamePassword					; Limpa o username e a password
	CALL RotValida								; chama a rotina para validaçao
	CALL RotMostrarDisplay_Username_Password	; Chama a Rotina "RotMostrarDisplay_Username_Password"
	CALL LimpaPerifericos						; Limpa perifericos
	CALL RotValida								; Chama a rotina para validar
	
	CALL VerificaCampo							;Rotina para verificar o número de carateres que cada campo tem (Username e Password)
	CMP R9, 0									;Compara o valor de R9 (quantidade de carateres que o username tem) com 0
	JEQ MenufazerLogin							;Caso os valores sejam iguais, o utilizador não inserir nada no campo Username e salta para o endereço "Campo_Vazio_Registo"
	CMP R10, 0									;Compara o valor de R10 (quantidade de carateres que a password tem) com 0
	JEQ MenufazerLogin							;Caso os valores sejam iguais, o utilizador não inserir nada no campo Password e salta para o endereço "Campo_Vazio_Registo"
	
	CALL RotVerificacao_Pass					;Rotina para verificar quando carateres tem a password
	CMP R10, 3									;Compara o valor de R10 (quantos carateres tem a password) com o valor minímo que a password deve ter (3 carateres) 
	JLT Password_Incompleta						;Salta para o endereço "Password_Incompleta" caso a password tenha menos de 3 carateres
	
	CALL Verifica_Username_Password_Login		;Rotina para verificar se o Username e a Password estão de acordo com o que está na memória dos utilizadores
	MOV R1, Tamanho								;Guarda no registo R1 o tamanho do Username/Password (8 carateres)
	CMP R8, R1									;Compara o valor de R9 com o valor de R1
	JNE Login_Incorreto							;Caso o que foi escrito no periférico Username esteja diferente do que está na memória, ele salta para o endereço "Username_Incorreto"
	CMP R9, R1									;Compara o valor de R10 com o valor de R1
	JNE Login_Incorreto							;Caso o que foi escrito no periférico Password esteja diferente do que está na memória, ele salta para o endereço "Password_Incorreto"
	JMP Login_Valido							;Caso esteja tudo correto, salta para o endereço "Login_Valido"

Login_Incorreto:
	MOV R2, MenuLoginErrado						;Coloca no R2 o endereco do menuLoginErrado
	CALL MostraDisplay							;Mostra o display
	CALL LimpaPerifericos						;Limpa os perifericos
	CALL LimpaUsernamePassword					;Limpa o username e a password 
	CALL RotValida								;Rotina de validacao
	JMP MenufazerLogin							;Salto para o menu fazer login
	
Login_Valido:	
	MOV R2, MenuLoginCompleto					;Coloca em R2 o endereço do "MenuLoginCompleto"
	CALL MostraDisplay							;Mostra no display o "MenuLoginCompleto"
	CALL LimpaPerifericos						;Rotina para limpar os periféricos de entrada ("botaoOK" e "NR_SEL")
	CALL LimpaUsernamePassword					;Rotina para limpar os periféricos de entrada referentes ao username e a password
	CALL RotValida								;Validação do OK (periférico "botaoOK") do "MenuLoginCompleto"
	JMP Menu_Pedido								;Salta para o menu pedido
	
Impossivel_Login:
	MOV R2, MenuLoginImpossivel					;Coloca em R2 o endereço de "MenuLoginImpossivel"
	CALL MostraDisplay   						;Mostra no display o "MenuLoginImpossivel"	
	CALL LimpaPerifericos        				;Rotina para limpar os periféricos de entrada ("Pin_OK" e "NR_SEL")
	CALL LimpaUsernamePassword					;Rotina para limpar os periféricos de entrada referentes ao username e a password
	CALL RotValida   							;Validação do OK (periférico "botaoOK") do "MenuLoginImpossivel" 
	JMP Ligado									;Salta para o endereço "Ligado"

Password_Incompleta:
	MOV R2, MenuPasswordIncompleta				;Coloca em R2 o endereco de "MenuPasswordIncompleta"
	CALL MostraDisplay							;Mostra display
	CALL LimpaPerifericos						;Limpa os perifericos
	CALL LimpaUsernamePassword					;Limpa o Username e a password
	CALL RotValida								;Rotina para validar
	JMP MenufazerLogin							;salta para o menu "Menufazerlogin"


;********************** MENU REGISTO ***********************************

; Rotina fazer Login
MenufazerRegisto:
	

;********************** MENU PEDIDO ***********************************

Menu_Pedido:
	MOV R2, MenuPedido					; Coloca o endereço MenuPedido no registo R2
	CALL MostraDisplay					; Mostra o display "MenuPedido"
	CALL LimpaPerifericos				; Limpa os perifericos de entrada
	CALL LimpaUsernamePassword			; Limpa o username e password
	MOV R0, NR_SEL 						; Coloca o endereço NR_SEL no registo R0


Ler_MenuPedido:
    MOV R0, NR_SEL                  	; Coloca o endereço NR_SEL no registo R0
    MOVB R1, [R0]     					; Coloca no registo R1 o conteudo do registo R0
	CMP R1, 0	                    	; Compara o valor de R1 com 0
    JEQ Ler_MenuPedido 	            	; Se o valor for igual a 0, espera ate haver alteracao
    CMP R1, PedirPizza              	; Compara o valor de R1 com a constante PedirPizza
    JEQ Escolher_Sabor_Pizza        	; Mostra no display o MenuPizza, no caso de esta ser selecionada
    CMP R1, Logout                  	; Compara o valor de R1 com a constante Logout
    JEQ Fazer_Logout    				; Mostra no display o MenuLogout, no caso de esta ser selecionada
    MOV R2, MenuOpcaoInvalida       	; No caso de não ser selecionado nenhuma das opçoes disponiveis é mostrado o menu de opçao invalida
    CALL MostraDisplay             		; Mostra o display "MenuOpcaoInvalida"
    CALL LimpaPerifericos           	; Limpa os perifericos de entrada
    JMP Menu_Pedido                  	; Salta para o endereço "Menu_Pedido"
  
; Rotina Fazer Logout	
Fazer_Logout:
	MOV R2, MenuLogout					; Coloca o endereço MenuLogout no registo R2
	CALL MostraDisplay					; Mostra o display "MenuLogout"
	CALL LimpaPerifericos				; Limpa os perifericos de entrada
	MOV R0, NR_SEL 						; Coloca o endereço NR_SEL no registo R0


;********************** MENU SABOR PIZZA ***********************************

;Rotina para escolher o sabor da pizza
Escolher_Sabor_Pizza:
	MOV R2, MenuPizzaSabores			; Coloca o endereço MenuPizzaSabores no registo R2
	CALL MostraDisplay					; Mostra o display "MenuPizzaSabores"
	CALL LimpaPerifericos				; Limpa os perifericos de entrada
	CALL LimpaUsernamePassword			; Limpa o username e a password
	MOV R0, NR_SEL 						; Coloca o endereço NR_SEL no registo R0

Ler_MenuPizzaSabores:
	MOV R0, NR_SEL                 		; Coloca o endereço NR_SEL no registo R0
    MOVB R1, [R0]                   	; Coloca no registo R1 o conteudo do registo R0
	CMP R1, 0	                    	; Compara o valor de R1 com 0
    JEQ Ler_MenuPizzaSabores 	    	; Se o valor for igual a 0, espera ate haver alteracao
	CMP R1, Hotdancers					; Se for verdadeira, então foi selecionada uma pizza hotdancers
	JEQ Escolher_Tamanho_Pizza			; O programa salta para o display "MenuPizzaTamanho"	
	CMP R1, QuatroQueijos				; Se for verdadeira, então foi selecionada uma pizza QuatroQueijos
	JEQ Escolher_Tamanho_Pizza			; O programa salta para o display "MenuPizzaTamanho"
	CMP R1, Spinaci						; Se for verdadeira, então foi selecionada uma pizza Spinaci
	JEQ Escolher_Tamanho_Pizza			; O programa salta para o display "MenuPizzaTamanho"
	CMP R1, Portuguesa					; Se for verdadeira, então foi selecionada uma pizza Portuguesa
	JEQ Escolher_Tamanho_Pizza			; O programa salta para o display "MenuPizzaTamanho"
	CMP R1, CheeseHam					; Se for verdadeira, então foi selecionada uma pizza CheeseHam
	JEQ Escolher_Tamanho_Pizza			; O programa salta para o display "MenuPizzaTamanho"
	MOV R2, MenuOpcaoInvalida       	; No caso de não ser selecionado nenhuma das opçoes disponiveis é mostrado o menu de opçao invalida
    CALL MostraDisplay              	; Mostra o display "MenuOpcaoInvalida"
    CALL LimpaPerifericos           	; Limpa os perifericos de entrada
    JMP Escolher_Sabor_Pizza        	; Salta para a rotina "Escolher_Sabor_Pizza"

;********************** MENU TAMANHO PIZZA ***********************************

; Rotina para escolher o tamanho da pizza
Escolher_Tamanho_Pizza:
	MOV R2, MenuPizzaTamanho			; Coloca o endereço MenuPizzaTamanho no registo R2
	CALL MostraDisplay					; Mostra o display "MenuPizzaTamanho"
	CALL LimpaPerifericos				; Limpa os perifericos de entrada
	CALL LimpaUsernamePassword			; Limpa o username e a password
	MOV R0, NR_SEL 						; Coloca o endereço NR_SEL no registo R0

Ler_MenuPizzaTamanho:
    MOV R0, NR_SEL                  	; Coloca o endereço NR_SEL no registo R0
    MOVB R1, [R0]                   	; Coloca no registo R1 o conteudo do registo R0
	CMP R1, 0	                    	; Compara o valor de R1 com 0
    JEQ Ler_MenuPizzaTamanho 	    	; Se o valor for igual a 0, espera ate haver alteracao
	CMP R1, PizzaPequena            	; Compara o valor de R1 com a constante PizzaPequena
	JEQ Factora_Pizza            		; Salta para a rotina "Factora_Pizza" 
    CMP R1, PizzaGrande             	; Compara o valor de R1 com a constante PizzaGrande 
	JEQ Factora_Pizza            		; Salta para a rotina "Factora_Pizza" 
    MOV R2, MenuOpcaoInvalida       	; No caso de não ser selecionado nenhuma das opçoes disponiveis é mostrado o menu de opçao invalida
    CALL MostraDisplay             		; Mostra o display "MenuOpcaoInvalida"
    JMP Escolher_Tamanho_Pizza      	; Salta para o endereço "Escolher_Tamanho_Pizza"

Factora_Pizza:
	CALL RotinaSomaComprasPizza			; Chama a rotina da RotinaSomaCompras
	JMP Escolher_Bebidas				; Salta para o proximo display, "Escolher_Bebidas"

	
;********************** MENU BEBIDA ***********************************

;Rotina para escolher a bebida
Escolher_Bebidas:
	MOV R2, MenuBebidas					; Coloca o endereço MenuBebidas no registo r2
	CALL MostraDisplay					; Mostra o display "MenuBebidas"
	CALL LimpaPerifericos				; Limpa os perifericos de entrada
	CALL LimpaUsernamePassword			; Limpa o username e a password
	MOV R0, NR_SEL						; Coloca o endereço NR_SEL no registo R0

Ler_MenuBebidas:
	MOV R0, NR_SEL						; Coloca o endereço NR_SEL no registo R0
	MOVB R1, [R0]                   	; Coloca no registo R1 o conteudo do registo R0
	MOV R3, botaoOK						; Coloca o endereço botaoOK no registo R3
	MOVB R4, [R3]						; Coloca no registo R4 o conteudo do registo R3
	CMP R1, 0	                    	; Compara o valor de R1 com 0
    JEQ Ler_MenuBebidas		 	    	; Se o valor for igual a 0, espera ate haver alteracao
	CMP R1, Pepsi		            	; Compara o valor de R1 com a constante pepsi
	JEQ Factora_Bebidas					; Salta para a rotina "Factora_Bebidas" 
    CMP R1, Icetea	                	; Compara o valor de R1 com a constante icetea
	JEQ Factora_Bebidas            		; Salta para a rotina "Factora_Bebidas" 
	CMP R1, Agua	                	; Compara o valor de R1 com a constante Agua
	JEQ Factora_Bebidas            		; Salta para a rotina "Factora_Bebidas" 
	CMP R4 , OK							;Compara o valor de R4 com OK
	JEQ Fazer_Verificacao					;Salta para a rotina "Fazer_Pagamento"
    MOV R2, MenuOpcaoInvalida       	; No caso de não ser selecionado nenhuma das opçoes disponiveis é mostrado o menu de opçao invalida
    CALL MostraDisplay             		; Mostra o display "MenuOpcaoInvalida"
    JMP Escolher_Bebidas            	; Salta para o endereço "Escolher_Bebidas"

Factora_Bebidas:
	CALL RotinaSomaComprasBebidas		; Chama a rotina da RotinaSomaComprasBebidas
	JMP Fazer_Verificacao				; Salta para o proximo display, "Fazer_Verificacao"


;************************** VERIFICAÇAO DE COMPRA ***************************

;Rotina para escolher a bebida
Fazer_Verificacao:
	MOV R2, MenuPizzaVrf				;Coloca o endereço MenuPizzaVrf no registo r2
	CALL MostraDisplay					;Mostra o display "MenuPizzaVrf"
	CALL LimpaPerifericos				;Limpa os perifericos de entrada
	CALL LimpaUsernamePassword			; Limpa o username e a password
	MOV R0, NR_SEL						;Coloca o endereço NR_SEL no registo R0

Ler_MenuVerificacao:
	MOV R0, NR_SEL						;Coloca o endereço NR_SEL no registo R0
	MOVB R1, [R0]                   	; Coloca no registo R1 o conteudo do registo R0
	CMP R1, 0	                    	; Compara o valor de R1 com 0
    JEQ Ler_MenuVerificacao		 		; Se o valor for igual a 0, espera ate haver alteracao
	CMP R1, PedirMais		            ; Compara o valor de R1 com a constante mais
	JEQ Pedir_Mais						; Salta para a rotina "Fazer_Pagamento" 
    CMP R1, Pagamento	            	; Compara o valor de R1 com a constante pagamento
;	JEQ Fazer_Pagamento           		; Salta para a rotina "Fazer_Pagamento" 
    MOV R2, MenuOpcaoInvalida       	; No caso de não ser selecionado nenhuma das opçoes disponiveis é mostrado o menu de opçao invalida
    CALL MostraDisplay             		; Mostra o display "MenuOpcaoInvalida"
    JMP Fazer_Verificacao           	; Salta para o endereço "Fazer_Verificaçao"


;************************** SOMA DAS COMPRAS ***************************
;Rotina para somar as compras	
RotinaSomaComprasPizza:
	PUSH R2
	PUSH R3
	PUSH R4
	PUSH R5
	MOV R7 , [R7]
	MOV R2, CustoPequena						; Coloca em R2 o valor da Pizza Pequena
	MOV R3, CustoGrande							; Coloca em R3 o valor da Pizza Grande
	CMP R1, PizzaPequena						; Verifica se foi selecionado a pizza pequena
	JEQ PagarPizzaPequena						; salta para aumentar o valor da pizza pequena
	CMP R1, PizzaGrande							; Verifica se foi selecionado a pizza grande
	JEQ PagarPizzaGrande						; Salta para aumentar o valor da pizza grande
	
PagarPizzaPequena:										
	ADD R7, R2									; Incrementa o valor do histórico com o valor da pizza pequena
	MOVB [R7] , R7								; Coloca na posicao de memoria R0 o valor de R7 
	JMP CicloSomaComprasPizza					; Salta para o fim da rotina ("CicloSomaComprasPizza")

PagarPizzaGrande:
	ADD R7, R3									; Incrementa o valor do histórico com o valor da pizza pequena
	MOVB [R7] , R7								; Coloca na posicao de memoria R0 o valor de R7 
	JMP CicloSomaComprasPizza					; Salta para o fim da rotina ("CicloSomaComprasPizza")

CicloSomaComprasPizza:
	POP R5
	POP R4
	POP R3
	POP R2
	RET
	
RotinaSomaComprasBebidas:
	PUSH R2
	PUSH R3
	PUSH R4
	PUSH R5
	MOV R7 , [R7]							; Coloca no no R7 o valor no endereço R7
	MOV R2, CustoPepsi						; Coloca em R2 o valor da Pepsi
	MOV R3, CustoIceTea						; Coloca em R3 o valor do Icetea
	MOV R4, CustoAgua						; Coloca em R4 o valor da Agua
	CMP R1, Pepsi							; Verifica se foi escolhido a pepsi
	JEQ PagarPepsi							; Se verdadeiro, salta para a rotina pagar pepsi
	CMP R1, Icetea							; Verifica se foi escolhido o icetea
	JEQ PagarIcetea							; Se verdadeiro, salta para a rotina pagar icetea
	CMP R1, Agua							; Verifica se foi escolhido a agua
	JEQ PagarAgua							; Se verdadeiro, salta para a rotina pagar agua

PagarPepsi:										
	ADD R7, R2								; Incrementa o valor do histórico com o valor da pepsi
	MOVB [R7] , R7							; Coloca na posicao de memoria R0 o valor de R7 
	JMP CicloSomaComprasBebidas				; Salta para o fim da rotina ("CicloSomaComprasBebidas")

PagarIcetea:
	ADD R7, R3								; Incrementa o valor do histórico com o valor do icetea
	MOVB [R7] , R7							; Coloca na posicao de memoria R0 o valor de R7 
	JMP CicloSomaComprasBebidas				; Salta para o fim da rotina ("CicloSomaComprasBebidas")

PagarAgua:
	ADD R7, R4								; Incrementa o valor do histórico com o valor da agua
	MOVB [R7] , R7							; Coloca na posicao de memoria R0 o valor de R7 
	JMP CicloSomaComprasBebidas				; Salta para o fim da rotina ("CicloSomaComprasBebidas")

CicloSomaComprasBebidas:
	POP R5
	POP R4
	POP R3
	POP R2
	RET	

;************************ MENU PEDIR MAIS ******************************
;Rotina para continuar na compra
Pedir_Mais:
	JMP Menu_Pedido								;Salto para o menu pedido

;************************ ROTINA DISPLAY O ERRO ******************************
; RotinaErro
RotinaErro:
	PUSH R2
	PUSH R1
	PUSH R0
    MOV R2, MenuOpcaoInvalida
    CALL LimpaDisplay
    CALL LimpaPerifericos

Erro:
    MOVB R1, [R0]
    CMP R1, 1
    JNE Erro
	PUSH R0
	PUSH R1
	PUSH R2
    RET
;************************ ROTINA PARA LIMPAR PERIFERICOS ******************************	
;Rotina para Limpa os Perifericos
LimpaPerifericos:
	MOV R0, ON_OFF
	MOV R1, NR_SEL
	MOV R2, botaoOK
;	MOV R3, Username
;	MOV R4, Password
	MOV R5, 0
	MOVB [R0], R5
	MOVB [R1], R5
	MOVB [R2], R5
	MOVB [R3], R5
	MOVB [R4], R5
	RET

;************************ ROTINA LIMPAR DISPLAY ******************************
; Rotina para Limpar Display
LimpaDisplay:
	MOV R0, InicioDisplay
	MOV R1, FimDisplay
	
CicloLimpa:
	MOV R2, CaraterVazio
	MOVB [R0], R2
	ADD R0, 1
	CMP R0, R1
	JLE CicloLimpa
	RET
;************************ ROTINA LIMPAR USERNAME E PASSWORD ******************************
; Rotina para Limpar Username e Password
LimpaUsernamePassword:
	PUSH R0									;*********************************************************;							
	PUSH R1									; Guarda na stack os registos que são alterados na rotina
	PUSH R2									;
	PUSH R3									;*********************************************************;
	MOV R0, Username_I						;Coloca no registo R0 o endereço do início do periférico de entrada para a introdução do Username
	MOV R1, Password_F						;Coloca no registo R1 o endereço do periférico "Password_F"
	MOV R2, 0								;Coloca em R2 a constante 0
		
Ciclo_Limpar:
	CMP R0, R1								;Compara o início do periférico de entrada do username com o endereço do periférico "botaoOK"
	JEQ Fim_Limpeza							;Caso os valores sejam iguais, acaba a limpeza dos periféricos username e password e salta para o endereço "Fim_Limpeza"
	MOVB [R0], R2							;Coloca na posição de memória R0 (posição entre o inicio do periférico "Username_I" e o periférico "botaoOK") o valor do registo R2
	ADD R0, 1								;Incrementa 1 ao valor do registo R0 (posição entre o inicio do periférico "Username_I" e o periférico "botaoOK")
	JMP Ciclo_Limpar						;Caso ainda não tenha chegado ao fim, salta para o endereço "Ciclo_Limpar" para continuar a limpeza
		
Fim_Limpeza:
	POP R3									;*********************************************************;
	POP R2									;              Retira da stack os registos 
	POP R1									;
	POP R0									;*********************************************************;
	RET

;************************ ROTINA MOSTRA DISPLAY ******************************
; Rotina para Mostrar o Display
MostraDisplay:
	PUSH R0
	PUSH R1
	PUSH R3
	MOV R0, InicioDisplay
	MOV R1, FimDisplay
	
Ciclo:
	MOV R3, [R2]
	MOV [R0] , R3
	ADD R2, 2
	ADD R0, 2
	CMP R0, R1
	JLE Ciclo
	POP R3
	POP R1
	POP R0
	RET

;Rotina Valida Ok
RotValida:
		PUSH R6									; Guarda na stack os registos que são alterados na rotina				
		PUSH R7									;*********************************************************;
		MOV R7, botaoOK							;Coloca no registo R7 o endereço do periférico "botaoOK"
Valida:
		MOVB R6, [R7]							;Coloca no registo R6 o conteúdo do endereço "botaoOK"
		CMP R6, 1								;Compara o valor de R6 com a constante 1
		JNE Valida								;Caso o valor seja diferente, ele salta para o endereço "Valida" enquanto não fizer a validação ("botaoOK" a 1)
		POP R7									;*********************************************************;			
		POP R6									;               Retira da stack os registos
		RET	
	
;********************* Codigo para fazer aparecer o usename e password no display *************************

;Rotina para mostrar no display o username e a password
RotMostrarDisplay_Username_Password:
	PUSH R0									;*********************************************************;
	PUSH R1									;
	PUSH R2									;
	PUSH R3									; Guarda na stack os registos que são alterados na rotina
	PUSH R4									;
	PUSH R5									;
	PUSH R6									;
	PUSH R7									;*********************************************************;
	MOV R3, 0								;Coloca no registo R3 a constante 0
	MOV R0, Password_I						;Coloca no registo R0 o endereço do início do periférico de entrada para a introdução do Username
	MOV R1, Password_F						;Coloca no registo R1 o endereço do início do periférico de entrada  para a introdução da Password
	MOV R2, CaraterAsterisco				;Coloca no registo R2 a constante "CaraterAsterisco"
	MOV R4, I_Username						;Coloca no registo R4 o endereço do início do display para a introdução do Username
	MOV R5, F_Username						;Coloca no registo R5 o endereço do fim do display para a introdução do Username
	MOV R6, I_Password						;Coloca no registo R6 o endereço do início do display para a introdução da Password
	MOV R7, F_Password						;Coloca no registo R7 o endereço do fim do display para a introdução da Password
		
Ciclo_Copia_Username:
	MOVB R3, [R0]							;Coloca no registo R3 o conteúdo do endereço R0				
	CMP R3, 0								;Compara o conteúdo do registo R3 com o valor 0
	JEQ Ciclo_Copia_Password				;Caso os valores sejam iguais, ou seja, o primeiro carater do Username é zero, ele salta para o endereço "Ciclo_Copia_Password"
	MOVB [R4], R3							;Coloca no display o carater referente ao periférico Username
	CMP R4, R5								;Compara o inicio do display para a introdução do Username com o fim
	JEQ Ciclo_Copia_Password				;Caso tenha chegado ao fim do display, salta para o endereço "Ciclo_Copia_Password"
	ADD R0, 1								;Incrementa 1 ao periférico de entrada referente ao Username
	ADD R4, 1								;Incrementa 1 ao display para a introdução do Username
	JMP Ciclo_Copia_Username				;Salta para o endereço "Ciclo_Copia_Username" caso ainda não tenha copiado o Username todo
		
Ciclo_Copia_Password:
	MOVB R3, [R1]							;Coloca no registo R3 o conteúdo do endereço R1 (carater da Password)			
	CMP R3, 0								;Compara o conteúdo do registo R3 com o valor 0
	JEQ Fim_Da_Rotina_Copia					;Caso os valores sejam iguais, ou seja, o primeiro carater da Password é zero, ele salta para o endereço "Fim_Da_Rotina_Copia"
	MOVB [R6], R2							;Coloca no display o carater referente ao periférico Password
	CMP R6, R7								;Compara o inicio do display para a introdução da Password com o fim
	JEQ Fim_Da_Rotina_Copia					;Caso tenha chegado ao fim do display, salta para o endereço "Fim_Da_Rotina_Copia"
	ADD R1, 1								;Incrementa 1 ao periférico de entrada referente a Password						
	ADD R6, 1								;Incrementa 1 ao display para a introdução da Password
	JMP Ciclo_Copia_Password				;Salta para o endereço "Ciclo_Copia_Password" caso ainda não tenha copiado a Password toda
		
Fim_Da_Rotina_Copia:
	POP R7									;*********************************************************;
	POP R6									;
	POP R5									;
	POP R4									;              Retira da stack os registos
	POP R3									;
	POP R2									;
	POP R1									;
	POP R0									;*********************************************************;
	RET										;

;********************* Verifica se ja foi inserido username ou password ******************************************++
;Rotina Verifica campo
VerificaCampo:
	PUSH R0
	PUSH R1
	PUSH R2
	PUSH R3
	PUSH R4
	MOV R0 , Username_I						;Coloca no R0 o endereço de Username_I
	MOV R1 , Username_F						;Coloca no R1 o endereço de Username_F
	MOV R2 , Password_I						;Coloca no R2 o endereço de Password_I
	MOV R3 , Password_F						;Coloca no R3 o endereço de Password_F
	MOV R9, 0								;Coloca em R9 o valor 0
	MOV R10, 0								;Coloca em R10 o valor 0

Ciclo_Campo_Username:
	MOVB R4, [R0]							;Coloca no R4 o conteúdo do endereço de R0
	CMP R4, 0								;Compara o valor de R4  com 0
	JNE Carater_Username					;Caso os valores sejam diferentes salta para o endereço "Carater_Username"
	CMP R0, R1								;Compara o início do periférico Username com o fim do mesmo
	JEQ Ciclo_Campo_Password				;Caso os valores sejam iguais, salta para o endereço "Ciclo_Campo_Password"
	ADD R0, 1								;Incrementa 1 ao valor do registo R0 
	JMP Ciclo_Campo_Username				;Caso ainda não tenha verificado todos os carateres do periférico Username, salta para o endereço "Ciclo_Campo_Username"

Carater_Username:
	ADD R9, 1								;Incrementa 1 ao valor do R9 se foi encontrado um carater
	
Ciclo_Campo_Password:
	MOVB R4, [R2]							;Coloca no R4 o conteúdo do endereço de R2
	CMP R4 , 0								;Compara o valor de R4  com 0
	JNE Carater_Password					;Caso os valores sejam diferentes salta para o endereço "Carater_Password"
	CMP R2, R3								;Compara o início do periférico Password com o fim do mesmo
	JEQ Fim_VerificaCampo					;Caso os valores sejam iguais, salta para o endereço "Fim_VerificaCampo"
	ADD R0, 1								;Incrementa 1 ao valor do registo R0 
	JMP Ciclo_Campo_Password				;Caso ainda não tenha verificado todos os carateres do periférico Username, salta para o endereço "Ciclo_Campo_Password"

Carater_Password:
	ADD R9, 1								;Incrementa 1 ao valor do R10 se foi encontrado um carater
	
Fim_VerificaCampo:					
	POP R4									;*********************************************************
	POP R3									;              Retira da stack os registos
	POP R2									;
	POP R1									;
	POP R0									;*********************************************************
	RET

;************************** Verifica a base de dados ***********************************

;Verificação do username e password no login
Verifica_Username_Password_Login:
		PUSH R0										;*********************************************************;									
		PUSH R1										;
		PUSH R2										;
		PUSH R3										; Guarda na stack os registos que são alterados na rotina
		PUSH R4										;
		PUSH R5										;
		PUSH R6										;
		PUSH R7										;*********************************************************;
		MOV R0, 0									;Coloca no registo R0 a constante 0
		MOV R3, Inicio_Dados						;Endereço base da memória de utilizadores
		MOV R1, Fim_Dados							;Endereço do fim da memória de utilizadores
		MOV R2, Pular_Utilizador					;Coloca no registo R2 a constante "Pular_Utilizador" para andar de utilizador em utilizador
		MOV R4, Username_I							;Coloca no registo R4 o endereço do início do periférico de entrada para a introdução do Username
		MOV R5, Username_F							;Coloca no registo R5 o endereço do fim do periférico de entrada para a introdução do Username
		MOV R8, 0									;Coloca no registo R8 a constante 0
		MOV R9, 0									;Coloca no registo R9 a constante 0
		MOV R10, 0									;Coloca no registo R10 a constante 0
		
Verificar_Proximo_Username:
		MOV R0, R3									;Coloca em R0 o valor de R3

Verificacao_Username:
		CMP R4, R5									;Compara a posição do carater do periférico Username com o fim deste
		JGT Verificar_Password						;Caso o valor de R4 seja superior ao de R5, já verificou todos os carateres do Username e salta para o endereço "Fim_Verificacao"
		CMP R0, R1									;Compara o endereço do registo R0 com o endereço final da memória de utilizadores
		JGT Fim_Verificacao							;Caso o valor de R0 seja superior ao de R1, já verificou a memória toda dos utilizadores e salta para o endereço "Fim_Verificacao"
		MOVB R6, [R4]								;Coloca no registo R6 o conteúdo do endereço de R4
		MOVB R7, [R0]								;Coloca no registo R7 o conteúdo do endereço de R0
		CMP R6, R7									;Compara o carater do utilizador da memória com o carater do periférico Username
		JEQ Verificar_Proximo_Carater_Username      ;Caso sejam iguais, salta para o endereço "Verificar_Proximo_Carater_Username" para verificar o próximo carater
		MOV R4, Username_I							;Caso sejam diferentes, coloca em R4 o valor do endereço "Username_I" para verificar o início do Username com o do próximo utilizador na memória
		MOV R8, 0									;Coloca em R10 a constante 0
		ADD R3, R2									;Incrementa o valor de R3 para verificar o próximo utlizador na memória
		JMP Verificar_Proximo_Username				;Salta para o endereço "Verificar_Proximo_Username"
			
Verificar_Proximo_Carater_Username:
		ADD R0, 1									;Incrementa o valor de R0 para verificar o próximo carater do utilizador na memória
		ADD R4, 1									;Incrementa o valor de R4 para verificar o próximo carater do periférico Username
		ADD R8, 1									;Incrementa o valor de R10 caso tenha sido verificado que os carateres do periférico e da memória são iguais
		JMP Verificacao_Username					;Salta para o endereço "Verificacao_Username" para verificar se o próximo carater do periférico e da memória são iguais

Verificar_Password:
		MOV R2, Pular_Dados_Utilizador
		ADD R3, R2									;Incrementa o registo R3 para verificar a Password
		MOV R0, R3									;Coloca no registo R0 o valor do registo R3
		MOV R4, Password_I							;Coloca no registo R4 o endereço do início do periférico de entrada para a introdução do Password					
		MOV R5, Password_F							;Coloca no registo R5 o endereço do fim do periférico de entrada para a introdução do Password

Verificacao_Password:
		CMP R4, R5									;Compara a posição do carater do periférico Password com o fim deste
		JGT Fim_Verificacao							;Caso o valor de R4 seja superior ao de R5, já verificou todos os carateres da Password e salta para o endereço "Fim_Da_Verificacao_Login"
		MOVB R6, [R4]								;Coloca no registo R6 o conteúdo do endereço de R4
		MOVB R7, [R0]								;Coloca no registo R7 o conteúdo do endereço de R0
		CMP R6, R7									;Compara o carater do utilizador da memória com o carater do periférico Password
		JEQ Verificar_Proximo_Carater_Password		;Caso sejam iguais, salta para o endereço "Verificar_Prox_Carater_Pass" para verificar o próximo carater
		JMP Fim_Verificacao							;Salta para o endereço "Fim_Da_Verificacao_Login"
		
Verificar_Proximo_Carater_Password:
		ADD R0, 1									;Incrementa o valor de R0 para verificar o próximo carater do utilizador na memória			
		ADD R4, 1									;Incrementa o valor de R4 para verificar o próximo carater do periférico Password
		ADD R9, 1									;Incrementa o valor de R10 caso tenha sido verificado que os carateres do periférico e da memória são iguais
		JMP Verificacao_Password					;Salta para o endereço "Verificacao_Password" para verificar se o próximo carater do periférico e da memória são iguais

Fim_Verificacao:
		MOV R10, R3
		POP R7										;*********************************************************;								
		POP R6										;
		POP R5										;
		POP R4										;
		POP R3										;				Retira da stack os registos
		POP R2										;
		POP R1										;
		POP R0										;*********************************************************;									
		RET																				

;Rotina para verificar se inseriu mais de 3 carateres na password
RotVerificacao_Pass:

		PUSH R0									;*********************************************************;
		PUSH R1									;  Guarda na stack os registos que são alterados na rotina
		PUSH R2									;*********************************************************;
		MOV R0, Password_I						;Coloca no registo R5 o endereço do início do periférico de entrada  para a introdução da Password	
		MOV R2, Password_F
		MOV R10, 0								;Coloca em R10 a constante 0
		
Verificar_Password_Tamanho:

		MOVB R1, [R0]							;Coloca em R1 o carater referente ao periférico Password
		CMP R1, 0								;Compara o valor de R1 com a constante 0
		JEQ Fim_Verificacao_Password				;Caso sejam iguais, acabou a leitura da Password e salta para o endereço "Fim_RotVerificacao_Pass"
		CMP R0, R2								;Compara o valor de R0 com o final do periférico Password
		JGT Fim_Verificacao_Password				;Caso os valores sejam iguais, já foi percorrido todo o periférico Password, saltando para o endereço "Fim_RotVerificacao_Pass"
		ADD R0, 1								;Incrementa 1 ao valor do periférico Password, para verificar o próximo carater
		ADD R10, 1								;Incrementa 1 ao valor do registo R10 (serve para contar quantos carateres tem a Password)
		JMP Verificar_Password_Tamanho				;Caso ainda não tenha lido a Password toda, salta para o endereço "Ciclo_Verificar_Pass"
		
Fim_Verificacao_Password:

		POP R2									;*********************************************************;
		POP R1									;               Retira da stack os registos
		POP R0 									;*********************************************************;
		RET										;
		

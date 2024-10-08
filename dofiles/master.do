/*******************************************************************************
						     Trabajo Práctico QR
*******************************************************************************/

/*-----------------------------------------------------------------------------*
       Carolina Coloma Conte-Grand, Brayan Condori Luque, Agustín Deniard						     
*------------------------------------------------------------------------------*/

*------------------------------------------------------------------------------*
**#SET UP
*------------------------------------------------------------------------------*

	clear all			
	cap log close		
	set maxvar 32767	
	set more off		
	set seed 20240924
	set varabbrev off
	
*	Set working directory (parent folder)
	
	*global cwd  	= "D:\UNLP_Maeco\QR\QR_2024TP1" // Brayan
	global cwd  	= "/Users/carolinaccg/Documents/GitHub/QR2024_TP1" // Caro

*	Globals

	global data 	= "${cwd}/data"
	global figures	= "${cwd}/figures"
	global tables	= "${cwd}/tables"	
	global dofiles	= "${cwd}/dofiles"

*------------------------------------------------------------------------------*
**#LABELS
*------------------------------------------------------------------------------*	
	
/*-----------------------------------------------------------------------------*
	- salario: ingreso laboral por hora en pesos corrientes
	- educ: nivel educativo medido en años de educación formal aprobados
	- edad: medida en años
	- sexo: variable dicotómica que toma valor 1 si el encuestado es varón y 0 si es mujer
	- caba: variable dicotómica donde 1 vive en la Ciudad Autónoma de Buenos Aires y 0 si vive en el Conurbano Bonaerense.
------------------------------------------------------------------------------*/

* Open

use ${data}/eph14s2_mincer.dta, clear

* Some cleaning

gen lwage = ln(salario)
label var lwage "Ingreso horario (log)"

clonevar female = sexo
recode female (0 = 1) (1 = 0)
label var female "Mujer (=1)"

label var caba "Reside en CABA (=1)"
label var educ "Años de educación"

gen edad2 = edad*edad
gen educ2 = educ*educ

label var edad2 "Edad al cuadrado"
label var educ2 "Años de educación al cuadrado"	
	
	
*------------------------------------------------------------------------------*
**#RUN DO-FILES*
*------------------------------------------------------------------------------*

do "${dofiles}/P1.do"
do "${dofiles}/P2.do"
do "${dofiles}/P3.do"
do "${dofiles}/P4.do"
do "${dofiles}/P5.do"

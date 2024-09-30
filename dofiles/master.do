/*******************************************************************************
*  QR: UNLP
*******************************************************************************/
*------------------------------------------------------------------------------*
**# SECTION 0: SET UP	*
*------------------------------------------------------------------------------*

	clear all			
	cap log close		
	set maxvar 32767	
	set more off		
	set seed 20240924
	set varabbrev off
	
*	Set working directory (parent folder)
	
	global cwd  	= "D:\UNLP_Maeco\QR\QR_2024TP1" // Brayan

*	Globals

	global data 	= "${cwd}/data"
	global figures	= "${cwd}/figures"
	global tables	= "${cwd}/tables"	
	global dofiles	= "${cwd}/dofiles"
	
*------------------------------------------------------------------------------*
**# RUN DO-FILES	*
*------------------------------------------------------------------------------*

do "${dofiles}/P1.do"


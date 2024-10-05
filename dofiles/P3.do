/*******************************************************************************
						     Trabajo Práctico QR
*******************************************************************************/

/*-----------------------------------------------------------------------------*
       Carolina Coloma Conte-Grand, Brayan Condori Luque, Agustín Deniard						     
*------------------------------------------------------------------------------*/

*------------------------------------------------------------------------------*
**# PREGUNTA 3:
*------------------------------------------------------------------------------*

sqreg lwage c.educ##c.educ c.edad##c.edad female caba, q(5 25 50 75 95) reps(10)

*Comparación educ entre q05 y q95

test [q05=q95]: educ

*Comparación coeficientes entre todos los q

test[q05=q25=q50=q75=q95]: educ edad female caba

esttab using "test_results2.tex", title("Test Results 2") label replace

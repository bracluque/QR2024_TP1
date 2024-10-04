* QR-UNLP: TRABAJO PRÁCTICO
* Alumnos: Carolina Coloma Conte-Grand, Brayan Condori Luque, Agustín Deniard
************************

************************
* EJERCICIO N° 5: Residuos
************************

foreach q in 25 50 75 {
    qreg lwage c.educ##c.educ c.edad##c.edad female caba, q(`q') nolog
    predict xb_`q'
	gen residuo_`q' = lwage - xb_`q'
	gen signo_residuo_`q' = "Positivo" if residuo_`q' > 0
	replace signo_residuo_`q' = "Negativo" if residuo_`q' < 0
	replace signo_residuo_`q' = "Nulo" if residuo_`q' == 0
	tab signo_residuo_`q' if e(sample)
}
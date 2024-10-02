* QR-UNLP: TRABAJO PRÁCTICO
* Alumnos: Carolina Coloma Conte Grand, Brayan Condori Luque, Agustín Deniard
************************

clear all
set more off
set seed 1982

************************
* EJERCICIO N° 2.A: QR
************************

use "${data}\eph14s2_mincer", clear

*** Cleaning
gen lwage = ln(salario)
label var lwage "Ingreso horario (log)"

clonevar female = sexo
recode female (0 = 1) (1 = 0)
label var female "Mujer (=1)"

label var caba "Reside en Ciudad de Buenos Aires (=1)"
label var educ "Años de educación aprobados"

*** Regresión cuantílica
foreach q in 5 25 50 75 95 {
    bsqreg lwage c.educ##c.educ c.edad##c.edad female caba, q(`q') reps(500)
    outreg2 using "${tables}/QR_mincer.tex", append label ///
	ctitle("q`q'")
}
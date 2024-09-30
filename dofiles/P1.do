/*******************************************************************************
*  QR: UNLP
*******************************************************************************/
/*-----------------------------------------------------------------------------*
	- salario: ingreso laboral por hora en pesos corrientes
	- educ: nivel educativo medido en años de educación formal aprobados
	- edad: medida en años
	- sexo: variable dicotómica que toma valor 1 si el encuestado es varón y 0 si es mujer
	- caba: variable dicotómica donde 1 vive en la Ciudad Autónoma de Buenos Aires y 0 si vive en el Conurbano Bonaerense.
------------------------------------------------------------------------------*/
*------------------------------------------------------------------------------*
**# PREGUNTA 1.a: SUM STATS			    									   *
*------------------------------------------------------------------------------*

* Open

	use "${data}/eph14s2_mincer.dta", clear




* Some cleaning
gen lwage = ln(salario)
label var lwage "Ingreso horario (log)"

clonevar female = sexo
recode female (0 = 1) (1 = 0)
label var female "Mujer (=1)"

label var caba "Reside en Ciudad de Buenos Aires (=1)"
label var educ "Años de educación aprobados"

* Set up a LaTeX file for output
file 		open sum_stats using "${tables}/summary_stats.tex", text write replace
file		write sum_stats ///
				_n "\begin{tabular}{l*{15}{c}}" ///
				_n "\hline\hline" ///
				_n " & \multicolumn{6}{c}{} & \multicolumn{7}{c}{\centering Deciles} \\ \cmidrule(lr){7-15}" ///
				_n " & N & Media & SD & Min & Max & 10 & 20 & 30 & 40 & 50 & 60 & 70 & 80 & 90  \\" ///
				_n "\hline"
					 


local summary_vars salario educ edad 

foreach var of local summary_vars {
    local vname : var label `var'
		
			if "`var'" == "`var'" {
						file write sum_stats _n "\textit{`vname'} \\"
						}
 
    foreach group in 2 3 4 5 {

	if `group' == 2 {
            local group_name = "\hspace{0.25cm} Grupo de edad: [15,24]"
        }
        else if `group' == 3 {
            local group_name = "\hspace{0.25cm}  Grupo de edad: [25,40]"
        }
        else if `group' == 4 {
            local group_name = "\hspace{0.25cm}  Grupo de edad: [41,64]"
        }
        else if `group' == 5 {
            local group_name = "\hspace{0.25cm}  Grupo de edad: [65+]"
        }
        
		
		* Sum stats
		
		sum `var' if gedad1 == `group', d
		
			if r(mean) < 1 {
				local fmt = "%5.3f"
				}
			
			else if r(mean) < 9 {
				local fmt = "%5.2f"
				}
				
			else if r(mean) < 99 {
				local fmt = "%5.1f"
				}
				
			else if abs(r(mean) ) > 99 {
				local fmt = "%12.0fc"
				}		
								
			else {
				local fmt = "%12.0fc"
				}
						
			local mean_ad	:	display `fmt' r(mean)
			local sdev_ad	:	display `fmt' r(sd)
			local obs_ad	:	display r(N)
												
			if r(min) == 0 & r(max) == 1 { 
				local min_ad 	= "-"
				local p10_ad 	= "-"
				local p20_ad 	= "-"
				local p30_ad 	= "-"
				local p40_ad 	= "-"
				local p50_ad 	= "-"
				local p60_ad 	= "-"
				local p70_ad 	= "-"
				local p80_ad 	= "-"
				local p90_ad 	= "-"
				local max_ad 	= "-"
				}
						
			else {
				local min_ad	:	display `fmt' r(min)
				local max_ad	:	display `fmt' r(max)
			
				_pctile `var' if gedad1 == `group', n(10)
				
					local p10_ad 	: 	display `fmt' r(r1)
					local p20_ad 	: 	display `fmt' r(r2)
					local p30_ad 	: 	display `fmt' r(r3)
					local p40_ad 	: 	display `fmt' r(r4)
					local p50_ad 	: 	display `fmt' r(r5)
					local p60_ad 	: 	display `fmt' r(r6)
					local p70_ad 	: 	display `fmt' r(r7)
					local p80_ad 	: 	display `fmt' r(r8)
					local p90_ad 	: 	display `fmt' r(r9)
					}
        
        file write sum_stats _n "`group_name' & `obs_ad' & `mean_ad' & `sdev_ad' & `min_ad' & `max_ad' & `p10_ad' & `p20_ad' & `p30_ad' & `p40_ad' & `p50_ad' & `p60_ad' & `p70_ad' & `p80_ad' & `p90_ad' \\"
							
    }

}				
		
local 		summary_vars female caba 

foreach 	var of local summary_vars {
			
			local vname : var label `var'
			sum `var', d
						
			if r(mean) < 1 {
				local fmt = "%5.3f"
				}
			
			else if r(mean) < 9 {
				local fmt = "%5.2f"
				}
				
			else if r(mean) < 99 {
				local fmt = "%5.1f"
				}
				
			else if abs(r(mean) ) > 99 {
				local fmt = "%12.0fc"
				}		
								
			else {
				local fmt = "%12.0fc"
				}
						
			local mean_ad	:	display `fmt' r(mean)
			local sdev_ad	:	display `fmt' r(sd)
			local obs_ad	:	display r(N)
												
			if r(min) == 0 & r(max) == 1 { 
				local min_ad 	= "-"
				local p10_ad 	= "-"
				local p20_ad 	= "-"
				local p30_ad 	= "-"
				local p40_ad 	= "-"
				local p50_ad 	= "-"
				local p60_ad 	= "-"
				local p70_ad 	= "-"
				local p80_ad 	= "-"
				local p90_ad 	= "-"
				local max_ad 	= "-"
				}
						
			else {
				local min_ad	:	display `fmt' r(min)
				local max_ad	:	display `fmt' r(max)
			
				_pctile `var', n(10)
				
					local p10_ad 	: 	display `fmt' r(r1)
					local p20_ad 	: 	display `fmt' r(r2)
					local p30_ad 	: 	display `fmt' r(r3)
					local p40_ad 	: 	display `fmt' r(r4)
					local p50_ad 	: 	display `fmt' r(r5)
					local p60_ad 	: 	display `fmt' r(r6)
					local p70_ad 	: 	display `fmt' r(r7)
					local p80_ad 	: 	display `fmt' r(r8)
					local p90_ad 	: 	display `fmt' r(r9)
					}
						
				file write sum_stats _n "`vname' & `obs_ad' & `mean_ad' & `sdev_ad' & `min_ad' & `max_ad' & `p10_ad' & `p20_ad' & `p30_ad' & `p40_ad' & `p50_ad' & `p60_ad' & `p70_ad' & `p80_ad' & `p90_ad' \\"		
*						if "`var'" == "actual_leader" {
*						file write balance_table_lead_100vill _n "Type of social organizations \\"
						}		
		

		
	file			write sum_stats ///
					_n "\hline\hline \multicolumn{15}{p{20cm}}{}\\ " ///
					_n "\end{tabular}" 
	file			close sum_stats					 

*------------------------------------------------------------------------------*
**# PREGUNTA 1.b: SUM STATS													   *
*------------------------------------------------------------------------------*

est clear
eststo: reg	lwage c.educ##c.educ c.edad##c.edad female caba
esttab using "${tables}/OLS_mincer.tex", label  replace ///
b(3) se(3) ///
star(* 0.10 ** 0.05 *** 0.01) ///
booktabs noobs nomtitle collabels(none) compress alignment(D{.}{.}{-1}) ///
mgroups("Salario horario (log)", pattern(1 0))


/*
Nota: Probablemente haya una mejor opción que este comando.
	etable disponible en la versión 17 en adelante.
*/
est clear
eststo: margins, at(edad=30 educ=12) dydx(edad educ) 

etable, margins varlab export("${tables}/margins_mincer.tex") replace

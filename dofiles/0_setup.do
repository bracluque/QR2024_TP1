* Setting up GIT

clear
cap cd "D:\UNLP_Maeco\QR\UNLP_QR"


*
sysuse auto, clear
scatter price mpg 
graph export ./figures/figure1.png, replace wid(1000)
scatter length weight
graph export ./figures/figure2.png, replace wid(1000)
scatter price weight
graph export ./figures/figure3.png, replace wid(1000)
scatter length mpg
graph export ./figures/figure4.png, replace wid(1000)

/* check dir

dir // windows
ls // mac unix

! echo # UNLP_QR  >> README.md

* initialize

! git init

! git add README.md
! git commit -m "v1.015 added on 20240929 by BC"

* ! git remote add origin https://github.com/bracluque/UNLP_QR.git
! git push -u origin main

*/

* Add README file content
! echo # TP Quantile Regression >> README.md

* Initialize Git repository (if not already initialized)
! git init

* Add the README.md file to the staging area
*! git add README.md

* Commit changes with a message
! git commit -m "v1.015 added on 20240929 by BC"

* Optional: Create and switch to the 'main' branch if it's not already created
*! git checkout -b main

* Add the remote repository (ignore if it's already added)
*! git remote add origin https://github.com/bracluque/UNLP_QR.git

* Push to the 'main' branch
! git push -u origin main

* If you're still on 'master' and prefer that, push with:
* ! git push -u origin master


/* Create a file that runs git commands to push the files to the github repo
file close _all
file open git using mygit.bat, write replace
 file write git "git remote add origin " `"""' "https://github.com/bracluque/UNLP_QR.git" `"""' _n
 file write git "git add --all" _n
 file write git "git commit -m "
 file write git `"""' "minor fixes" `"""' _n
 file write git "git push" _n
file close git
*/
! git pull 
! mygit.bat

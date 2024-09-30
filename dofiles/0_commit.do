


clear all
cap cd "D:\UNLP_Maeco\QR\QR_2024TP1"  // Change to your actual project path

* Clone the repository
! git clone https://github.com/bracluque/QR2024_TP1.git  // This creates a folder named 'QR2024_TP1'
cap cd "QR2024_TP1"  // Change to the newly created repository folder
* Sync with the latest version from GitHub
! git pull origin main  

* Run you do file
do "./dofiles/1_analysis_bc.do"  // Replace 

*  Stage all modified and new files
! git add --all  

* Commit changes
! git commit -m "Automated commit"  

* Push changes to GitHub
! git push origin main 

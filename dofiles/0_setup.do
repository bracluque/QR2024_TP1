
* -----------------------------------------------
* Setting up GIT for Project: QR_2024TP1
* -----------------------------------------------

clear
cap cd "D:\UNLP_Maeco\QR\QR_2024TP1"  // Set your working directory

* Check current directory structure
dir // Windows
* ls // Uncomment for Mac/Unix


* -----------------------------------------------
* Step 1: Create README File
* -----------------------------------------------
* ! echo ### TP Quantile Regression >> README.md 

* -----------------------------------------------
* Step 2: Initialize Git Repository
* -----------------------------------------------
*! git init  

* -----------------------------------------------
* Step 3: Stage and Commit Changes
* -----------------------------------------------
*! git add README.md  // Stage the README file
*! git commit -m "[BC-20240929]: Add README file"  

* -----------------------------------------------
* Step 4: Configure Remote Repository
* -----------------------------------------------
*! git remote add origin https://github.com/bracluque/QR2024_TP1.git  

* -----------------------------------------------
* Step 5: Push to Remote Repository
* -----------------------------------------------
*! git checkout -b main 		// Create and switch to the 'main' branch if it's not already created
*! git push -u origin main 	
/* 
* -------------------------------------------------
* Create a batch file to automate Git commands
* -------------------------------------------------
	* Close all open files (if any)
	file close _all

	* Define the commit message as a local macro
	local commitMessage `"Automated commit"'

	* Open a new batch file to write Git commands
	file open git using "mygit.bat", write replace

	* Write Git commands to the batch file
	file write git "@echo off" _n  // Suppress command echoing
	file write git "git remote set-url origin https://github.com/bracluque/QR2024_TP1.git" _n  // Update remote repository URL
	file write git "git add --all" _n  // Stage all changes
	file write git "git commit -m `commitMessage'" _n // Note: Open the .bat file and and quotations, this code is not properly coding "" 
	file write git "git push" _n  // Push changes to the remote repository

	* Close the batch file
	file close git
*/

* -----------------------------------------------
* Step : Execute Batch File for Version Control
* -----------------------------------------------
*! mygit.bat 



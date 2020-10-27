Parse upgrade readiness logs
============================

            

When deploying the Upgrade readiness script to troubleshoot data sharing issues and intiate data collection from your environment , there is a log file generated for each device that runs the script . 


This powershell script parses all the log files generated from the (Deployment) upgrade readiness script and generates a csv file with summarized information only on the computers with errors.


The csv contains the computer name , logfile name and the error message.


 




 




        
    
TechNet gallery is retiring! This script was migrated from TechNet script center to GitHub by Microsoft Azure Automation product group. All the Script Center fields like Rating, RatingCount and DownloadCount have been carried over to Github as-is for the migrated scripts only. Note : The Script Center fields will not be applicable for the new repositories created in Github & hence those fields will not show up for new Github repositories.

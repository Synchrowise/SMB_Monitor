REM	replace 192.168.1.6 with your own local IP.
REM	the current script has the advantage of not needing administrative. Just start it in a command prompt and let it run.
REM	review the created file log_smb_access.txt to check the logging of SMB connexions.

for /L %%n in (1,0,10) do ( 
        netstat -a | findstr 192.168.1.6:445 >> log_smb_access.txt 
        IF not ERRORLEVEL 1 (echo {%date%-%time% SMB Connexion Detected!} >> log_smb_access.txt) ELSE (echo "No SMB Connexions") 
        TIMEOUT /T 60 
        
)

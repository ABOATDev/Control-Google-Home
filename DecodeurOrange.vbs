IpDecodeur = ""

If IpDecodeur = "" then 
MsgBox "Aller sur le lien suivant sur votre navigateur : http://livebox/" & vbcr & vbcr & "Dans '�quipements connect�s � la Livebox' trouver votre d�codeur orange et copier son ip" & vbcr & vbcr & "Ecrire l'ip copier a la ligne 1 dans les guillemets du fichier DecodeurOrange.vbs", vbInformation+vbOKOnly, "Configurer le script"
Wscript.Quit ()
End if 

' Ok google, sur le d�codeur XXX
' Fichier a mettre dans : C:\GoogleHome\
' Applet IFTTT : https://ifttt.com/applets/N8a5s4BE-controle-du-decodeur-orange-avec-google-assitant
' Aller sur le lien suivant sur votre navigateur : http://livebox/
' Dans '�quipements connect�s � la Livebox' trouver votre d�codeur orange et copier son ip
' Ecrire l'ip copier a la ligne 1 dans les "" du fichier DecodeurOrange.vbs



Set objArgs = WScript.Arguments
For I = 0 to objArgs.Count -1
a = a & " " & objArgs(I)	
Next
Set WshShell = CreateObject("WScript.Shell")

Select Case a
Case " allumer le"
Call onoffdecodeur ()
Case " allume"
Call onoffdecodeur ()
Case " allume le"
Call onoffdecodeur ()
Case " lance"
Call onoffdecodeur ()
Case " lance le"
Call onoffdecodeur ()
Case " d�marre"
Call onoffdecodeur ()
Case " d�marre le"
Call onoffdecodeur ()
Case " �teint"
Call onoffdecodeur ()
Case " �teint le"
Call onoffdecodeur ()
Case " arr�te"
Call onoffdecodeur ()
Case " arr�te le"
Call onoffdecodeur ()
Case " mute"
Call mutedecodeur ()
Case " mute le son"
Call mutedecodeur ()
Case " met en muet"
Call mutedecodeur ()
Case " mais en muet"
Call mutedecodeur ()
Case " mettre en muet"
Call mutedecodeur ()
Case " muet"
Call mutedecodeur ()
Case " coupe le son"
Call mutedecodeur ()
Case " coupe le volume"
Call mutedecodeur ()
Case "  enl�ve le son"
Call mutedecodeur ()
Case "  enl�ve le volume"
Call mutedecodeur ()
Case " remet le son"
Call mutedecodeur ()
Case " met le son"
Call mutedecodeur ()
Case " augmente le son"
Call VolumeUpdecodeur ()
Case " augmente le volume"
Call VolumeUpdecodeur ()
Case " met le son plus fort"
Call VolumeUpdecodeur ()
Case " monte le son"
Call VolumeUpdecodeur ()
Case " monte le volume"
Call VolumeUpdecodeur ()
Case " baisse le volume"
Call VolumeDowndecodeur ()
Case " baisse le son"
Call VolumeDowndecodeur ()
Case " descend le son"
Call VolumeDowndecodeur ()
Case " descend le volume"
Call VolumeDowndecodeur ()
Case " cha�ne suivante"
Call ChaineUpdecodeur ()
Case " mets la cha�ne suivante"
Call ChaineUpdecodeur ()
Case " met la cha�ne suivante"
Call ChaineUpdecodeur ()
Case " mets la cha�ne suivante"
Call ChaineUpdecodeur ()
Case " mets la cha�ne suivante"
Call ChaineUpdecodeur ()
Case " cha�ne pr�c�dente"
Call ChaineDowndecodeur ()
Case " mets la cha�ne pr�c�dente"
Call ChaineDowndecodeur ()
Case " met la cha�ne pr�c�dente"
Call ChaineDowndecodeur ()
Case " descend de cha�ne"
Call ChaineDowndecodeur ()
Case " mets la cha�ne pr�c�dente"
Call ChaineDowndecodeur ()
Case " met la cha�ne pr�c�dente"
Call ChaineDowndecodeur ()
Case " clique sur OK"
call OKdecodeur ()
Case " clique sur ok"
call OKdecodeur ()
Case " met OK"
call OKdecodeur ()
Case " met ok"
call OKdecodeur ()
Case " valide"
call OKdecodeur ()
Case " ok"
call OKdecodeur ()
Case " OK"
call OKdecodeur ()
Case " cliquer sur ok"
call OKdecodeur ()
Case " cliquer sur OK"
call OKdecodeur ()
Case " cliquez sur ok"
call OKdecodeur ()
Case " cliquez sur OK"
call OKdecodeur ()
Case " clique ok"
call OKdecodeur ()
Case " clique OK"
call OKdecodeur ()
Case " clic ok"
call OKdecodeur ()
Case " clic OK"
call OKdecodeur ()
Case " mais ok"
call OKdecodeur ()
Case " mais OK"
call OKdecodeur ()
Case Else
'Inputbox "La valeur n'existe pas","Erreur : valeur n'existe pas",a
End Select



sub onoffdecodeur ()
on error resume next
Dim IE
Set IE = Wscript.CreateObject("InternetExplorer.Application")
IE.Visible = 0
IE.navigate "http://" & IpDecodeur & ":8080/remoteControl/cmd?operation=01&key=116&mode=0"
WScript.Sleep 3000
strComputer = "."
Set objWMIService = GetObject("winmgmts:" _
    & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
Set colProcessList = objWMIService.ExecQuery _
    ("Select * from Win32_Process Where Name = 'iexplore.exe'")
For Each objProcess in colProcessList
    objProcess.Terminate()
Next
End sub


sub mutedecodeur ()
on error resume next
Dim IE
Set IE = Wscript.CreateObject("InternetExplorer.Application")
IE.Visible = 0
IE.navigate "http://" & IpDecodeur & ":8080/remoteControl/cmd?operation=01&key=113&mode=0"
WScript.Sleep 3000
strComputer = "."
Set objWMIService = GetObject("winmgmts:" _
    & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
Set colProcessList = objWMIService.ExecQuery _
    ("Select * from Win32_Process Where Name = 'iexplore.exe'")
For Each objProcess in colProcessList
    objProcess.Terminate()
Next
End sub

sub VolumeUpdecodeur ()
on error resume next
Dim IE
Set IE = Wscript.CreateObject("InternetExplorer.Application")
IE.Visible = 0
IE.navigate "http://" & IpDecodeur & ":8080/remoteControl/cmd?operation=01&key=115&mode=0"
WScript.Sleep 3000
strComputer = "."
Set objWMIService = GetObject("winmgmts:" _
    & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
Set colProcessList = objWMIService.ExecQuery _
    ("Select * from Win32_Process Where Name = 'iexplore.exe'")
For Each objProcess in colProcessList
    objProcess.Terminate()
Next
End sub


sub VolumeDowndecodeur ()
on error resume next
Dim IE
Set IE = Wscript.CreateObject("InternetExplorer.Application")
IE.Visible = 0
IE.navigate "http://" & IpDecodeur & ":8080/remoteControl/cmd?operation=01&key=114&mode=0"
WScript.Sleep 3000
strComputer = "."
Set objWMIService = GetObject("winmgmts:" _
    & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
Set colProcessList = objWMIService.ExecQuery _
    ("Select * from Win32_Process Where Name = 'iexplore.exe'")
For Each objProcess in colProcessList
    objProcess.Terminate()
Next
End sub

sub ChaineUpdecodeur ()
on error resume next
Dim IE
Set IE = Wscript.CreateObject("InternetExplorer.Application")
IE.Visible = 0
IE.navigate "http://" & IpDecodeur & ":8080/remoteControl/cmd?operation=01&key=402&mode=0"
WScript.Sleep 3000
strComputer = "."
Set objWMIService = GetObject("winmgmts:" _
    & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
Set colProcessList = objWMIService.ExecQuery _
    ("Select * from Win32_Process Where Name = 'iexplore.exe'")
For Each objProcess in colProcessList
    objProcess.Terminate()
Next
End sub


sub ChaineDowndecodeur ()
on error resume next
Dim IE
Set IE = Wscript.CreateObject("InternetExplorer.Application")
IE.Visible = 0
IE.navigate "http://" & IpDecodeur & ":8080/remoteControl/cmd?operation=01&key=403&mode=0"
WScript.Sleep 3000
strComputer = "."
Set objWMIService = GetObject("winmgmts:" _
    & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
Set colProcessList = objWMIService.ExecQuery _
    ("Select * from Win32_Process Where Name = 'iexplore.exe'")
For Each objProcess in colProcessList
    objProcess.Terminate()
Next
End sub

sub OKdecodeur ()
on error resume next
Dim IE
Set IE = Wscript.CreateObject("InternetExplorer.Application")
IE.Visible = 0
IE.navigate "http://" & IpDecodeur & ":8080/remoteControl/cmd?operation=01&key=352&mode=0"
WScript.Sleep 3000
strComputer = "."
Set objWMIService = GetObject("winmgmts:" _
    & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
Set colProcessList = objWMIService.ExecQuery _
    ("Select * from Win32_Process Where Name = 'iexplore.exe'")
For Each objProcess in colProcessList
    objProcess.Terminate()
Next
End sub
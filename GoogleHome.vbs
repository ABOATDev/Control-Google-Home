'Ok Google, sur le pc XXX
'Ok Google, sur l'ordinateur XXX
' Applet IFTTT : https://ifttt.com/applets/jSNrZ4vJ-controle-de-l-ordinateur-avec-google-assitant
' Fichier GoogleHome.vbs a mettre dans : C:\GoogleHome
Dim MAJ
MAJ = "1.0.3" 'Version Actuelle du script

Dim WshShell,fso,CheckMAJUser
On Error Resume Next
Set fso = CreateObject("Scripting.FileSystemObject")
Set WshShell = WScript.CreateObject("WScript.Shell") 
checkregistre = WshShell.RegRead ("HKCU\Software\GoogleHome\Ok")

If err.Number<>0 or IsNull(checkregistre) Then
Call MAJCheck (CheckMAJUser)
WshShell.RegWrite "HKCU\Software\GoogleHome\MAJ",MAJ,"REG_SZ"
WshShell.RegWrite "HKCU\Software\GoogleHome\Ok","1","REG_SZ"
MsgBox "Bienvenue dans mon script, il semblerait que vous lancer mon script pour la premi�re fois ou que vous avez effectuer une mise � jour de celui-ci, pour faire fonctionner mon script dite : Ok Google, sur le pc xxx" & vbcr & "Par exemple Ok Google sur le pc test (pour tester la communication entre la Google homme est le PC)" & vbcr & " Dite des phrases simples et courtes" & vbcr & "Exercut� le script depuis l'ordinateur pour en savoir plus" & vbcr & vbcr & "Version Actuelle : " & MAJ ,vbInformation+vbOKOnly,"Control Google Home.vbs"

If MsgBox ("Voulez vous configuez le chemin d'acc�s pour la musiques ? " &vbcr & vbcr & "S�lectionner un dossier afin d'y rechercher des chansons dans ses sous-dossiers et ses sous-dossiers. Dossier par d�faut" & vbcr & "Ok google sur le pc met de la musique" & vbcr & vbcr & "Si le dossier n'est pas configu�, cela marchera quand m�me mais affichera un choix de dossier musique a chaque demande de musique" & vbcr & vbcr & "Oui = Configuer",vbyesno,"Configurez le dossier Musique") = vbYes Then
Dim objShell,objFolder,Message, user
user = wshShell.ExpandEnvironmentStrings( "%USERPROFILE%" )
	Message = "Veuillez s�lectionner un dossier afin d'y rechercher des chansons dans ses sous-dossiers et ses sous-dossiers."
	Set objShell = CreateObject("Shell.Application")
	Set objFolder = objShell.BrowseForFolder(0,Message,1,user)
	If objFolder Is Nothing Then
		Wscript.Quit
	End If
	WshShell.RegWrite "HKCU\Software\GoogleHome\MUSIC",objFolder.self.path,"REG_SZ"
	MsgBox "Je conseil de tester la commande <musique> pour v�rifier que tout fonctionne bien et que le lecteur media est compatible"
End if
If MsgBox ("Voulez vous configuez le chemin d'acc�s pour les vid�os ? " &vbcr & vbcr & "S�lectionner un dossier afin d'y rechercher des chansons dans ses sous-dossiers et ses sous-dossiers. Dossier par d�faut" & vbcr & "Ok google sur le pc met de les vid�os" & vbcr & vbcr & "Si le dossier n'est pas configu�, cela marchera quand m�me mais affichera un choix de dossier vid�os a chaque demande de musique" & vbcr & vbcr & "Oui = Configuer",vbyesno,"Configurez le dossier Vid�o") = vbYes Then
user = wshShell.ExpandEnvironmentStrings( "%USERPROFILE%" )
	Message = "Veuillez s�lectionner un dossier afin d'y rechercher des videos dans ses sous-dossiers et ses sous-dossiers."
	Set objShell = CreateObject("Shell.Application")
	Set objFolder = objShell.BrowseForFolder(0,Message,1,user)
	If objFolder Is Nothing Then
		Wscript.Quit
	End If
	WshShell.RegWrite "HKCU\Software\GoogleHome\VIDEO",objFolder.self.path,"REG_SZ"
	MsgBox "Je conseil de tester la commande <vid�o> pour v�rifier que tout fonctionne bien et que le lecteur media est compatible"
End if
End if 

Set objArgs = WScript.Arguments
For I = 0 to objArgs.Count -1
if objArgs(I) = "�cris" or objArgs(I) = "�crit" Then 
ecrit = true
Else
a = a & " " & objArgs(I)
End if
Next


If ecrit = true then
Call write(a)
End if

'inputbox a,a,a

If a = "" then
Call MAJCheck (CheckMAJUser)

rep = InputBox ("Bienvenue dans mon script, pour faire fonctionner mon script dite : Ok Google, sur le pc xxx" & vbcr & "Par exemple Ok Google sur le pc test (pour tester la communication entre la Google homme est le PC)" & vbcr & vbcr & " Dite des phrases simples et courtes" & vbcr & vbcr & vbcr & "1 = V�rifier mise a jours" & vbcr & "2 = Envoy� un messsage au cr�ateur (rapide & sans se logger)" & vbcr & "3 = R�insalis� la configuration du script." & vbCr & "4 = Cr�dit" & vbcr & vbcr & "Pour tester des commandes en �crit, il vous suffit de taper une commande si dessous pour savoir si elle est comprise par le logiciel" & vbNewLine & "Version : " &  MAJ,"Control Google Home " & MAJ,"augmente le son")
   If rep = "" then
   ElseIf rep = "1" then 
   CheckMAJUser = true
   MAJCheck (CheckMAJUser)
   ElseIf rep = "2" then 
   MeParler () 
   ElseIf rep = "3" then 
   Reset ()
   ElseIf rep = "4" then 
   MsgBox "Cr�dits : " & vbNewLine & vbNewLine & "HackooFr" & vbNewLine & "Aymkdn",vbInformation+vbOKOnly,"Cr�dits"
   Else
   a = " " & rep
   End if 
end if 

Set WshShell = CreateObject("WScript.Shell")
Select Case a

Case " test", "teste"
MsgBox "La Google Home communique bien avec le pc !" & vbcr & vbcr & "Succ�s test",vbinformation+vbOKOnly,"Test"
MAJCheck ()

Case " augmente le son"," augmente le volume"," monte le son"
WshShell.SendKeys "{" & chr(175) & " 10}"

Case " monte le son au max"," monte le son au maximum"," monte le volume au maximum"," volume max"," son au max"," augmente le son au maximum"
WshShell.SendKeys "{" & chr(175) & " 50}"

Case " baisse le son"," descend le son"," descend le volume"," baisse le volume"
WshShell.SendKeys "{" & chr(174) & " 10}"

Case " descend le son au max"," baisse le son au max"," baisse le volume au max"," baisse le son au maximum"," baisse le volume au maximum"
WshShell.SendKeys "{" & chr(174) & " 50}"

Case " mute le volume"," mute le son"," muet"," le son a 0"," coupe le son"," coupe le volume"," coupe l'audio"," remet le volume"," remet le son"
WshShell.SendKeys chr(173)

Case " lance chrome"," affiche chrome"," ouvre chrome"," d�marre chrome"," ex�cute chrome"," lance google chrome"," ouvre google chrome"," d�marre google chrome"," ex�cute google chrome"," lorsque Rome"
WshShell.Run """chrome"""

Case " lance VLC"," ouvre VLC"," d�marre VLC"," ex�cute VLC"," affiche VLC"," VLC"," ouvrir VLC", " d�marrer VLC", " lancer VLC"," ex�cuter VLC"
WshShell.Run """vlc"""

Case " lance firefox"," ouvre firefox"," d�marre firefox"," ex�cute firefox"," affiche firefox"," firefox"," ouvrir firefox", " d�marrer firefox", " lancer firefox"," ex�cuter firefox"
WshShell.Run """firefox"""

Case " lance CCleaner"," ouvre CCleaner"," d�marre CCleaner"," ex�cute CCleaner"," affiche CCleaner"," CCleaner"," ouvrir CCleaner", " d�marrer CCleaner", " lancer CCleaner"," ex�cuter CCleaner"
WshShell.Run """CCleaner"""

Case " lance Dropbox"," ouvre Dropbox"," d�marre Dropbox"," ex�cute Dropbox"," affiche Dropbox"," Dropbox"," ouvrir Dropbox", " d�marrer Dropbox", " lancer Dropbox"," ex�cuter Dropbox"
WshShell.Run """Dropbox"""

Case " lance Filezilla"," ouvre Filezilla"," d�marre Filezilla"," ex�cute Filezilla"," affiche Filezilla"," Filezilla"," ouvrir Filezilla", " d�marrer Filezilla", " lancer Filezilla"," ex�cuter Filezilla"
WshShell.Run """Filezilla"""

Case " lance Google"," ouvre Google"," d�marre Google"," ex�cute Google"," affiche Google"," Google"," ouvrir Google", " d�marrer Google", " lancer Google"," ex�cuter Google"
CreateObject("WScript.Shell").Run "www.google.fr"

Case " lance l ' explorateur"," ouvre l ' explorateur"," d�marre l ' explorateur"," ex�cute l ' explorateur"," affiche l ' explorateur"," explorateur"," ouvrir l ' explorateur", " d�marrer l ' explorateur", " lancer l ' explorateur"," ex�cuter l ' explorateur"," lance explorateur"," ouvre explorateur"," d�marre explorateur"," ex�cute explorateur"," affiche explorateur"," explorateur"," ouvrir explorateur", " d�marrer explorateur", " lancer explorateur"," ex�cuter explorateur"," ouvre explorer"," d�marre explorer", " lance explorer"," ex�cute explorer"
WshShell.Run """explorer"""

Case " lance Notepad"," ouvre Notepad"," d�marre Notepad"," ex�cute Notepad"," affiche Notepad"," Notepad"," ouvrir Notepad", " d�marrer Notepad", " lancer Notepad"," ex�cuter Notepad"," lance bloc - note"," ouvre bloc - note"," d�marre bloc - note"," ex�cute bloc - notes"," affiche bloc - notes"," bloc - notes"," ouvrir bloc note", " d�marrer bloc note", " lancer bloc - notes"," ex�cuter bloc - notes"
WshShell.Run """notepad"""

Case " fait pause"," met pause"," fais une pause"," met en pause"," mais en pause"," fait pause"," fait stop"," stop"," pause"," relance"," enl�ve la pause"," met une pause"," lance"," lecture"," lance lecture"" lance la lecture"
WshShell.SendKeys " "

Case " �teint le"," arr�te le"," �teint le pc"," �teint l'ordinateur"," arr�te le syst�me"," �teint le syst�me"," arr�te"
CreateObject("Wscript.Shell").Run "CMD /C " & " shutdown /s /f",0

Case " verrouille le"," verrouille la session"," verrouille le pc"," le verrouiller"," met en veille"," mettre en veille"," met le en veille"," veille"," verrouillage"," verrouille"," metre en veille"
WshShell.Run "rundll32.exe user32.dll,LockWorkStation"

Case " mot de passe wifi"," mot de passe du wifi"," code wifi"," wifi"," code de la wifi"," donne mot de passe wifi"," code du wifi"," donne le mot de passe wifi"," donne le mot de passe du wifi"," retrouve le mot de passe wifi"," retrouve le mot de passe du wifi"," quel est le mot de passe wifi"," quel est le mot de passe du wifi"
WifiPasswordsRecovery ()

Case " ouvre le lecteur CD"," ouvre le lecteur DVD"," ouvrir lecteur"," ouvrir le lecteur CD"," ouvrir le lecteur DVD"," ouvrir le lecteur"," ouvre le lecteur"," eject le CD"," eject le DVD"," eject CD"," eject DVD"," ejecter DVD"," ejecter CD"," ejecter le DVD"
LecteurDVD ()

Case " ferme le logiciel"," ferme le logiciel actif"," ferme l'application"," arr�te le logiciel"," arr�te l'application"
WshShell.SendKeys ("%{F4}")

Case " maj"," mise � jour"," v�rifier mise � jour"," v�rifie mise � jour"," mise � jour script"," v�rifier"," mage"
CheckMAJUser = true
MAJCheck (CheckMAJUser)

Case " musique"," met de la musique"," lance de la musique"," mais de la musique"," lance musique"," audio"," met la musique"," met la playlist"," lance la playlist"," met la playlist"
Musique ()

Case " vid�o"," film"," met vid�o"," film"," mais vid�o"," lance vid�o"," lance film"," met les vid�os"," met la vid�o"," lance la vid�o"," met le film"," met les films"," lance la vid�o"," met la vid�o"
Video ()

Case Else
 MAJCheck (CheckMAJUser)
'Inputbox "La valeur n'existe pas","Erreur : valeur n'existe pas",a
End Select

Sub LecteurDVD ()
Set oWMP = CreateObject("WMPlayer.OCX.7" ) 
Set colCDROMs = oWMP.cdromCollection 
if colCDROMs.Count >= 1 then 
For i = 0 to colCDROMs.Count - 1 
colCDROMs.Item(i).Eject 
colCDROMs.Item(i).Eject 
Next 
End if
End sub 


Sub MAJCheck (CheckMAJUser)
Dim VersionActu, NewVersion,Note,WshShell
Set WshShell = WScript.CreateObject("WScript.Shell") 
VersionActu = WshShell.RegRead ("HKCU\Software\GoogleHome\MAJ")
Set objHTTP=CreateObject("MSXML2.XMLHTTP") 
objHTTP.Open "GET", "https://raw.githubusercontent.com/ABOATDev/Control-Google-Home/master/Tools/Version", FALSE
objHTTP.Send
NewVersion = objHTTP.ResponseText
NewVersion = left(NewVersion, len(NewVersion) - 1) 

if NewVersion > VersionActu Then
	 If CheckMAJUser = true Then MsgBox "La version : " & NewVersion & " est disponible et va etre install� !" & vbNewLine & vbNewLine & "Notre version actuelle" & VersionActu,vbInformation+vbOKOnly,"Nouvelle version disponible"
     objHTTP.Open "GET", "https://raw.githubusercontent.com/ABOATDev/Control-Google-Home/master/GoogleHome.vbs", FALSE
     objHTTP.Send
     Telecharger = objHTTP.ResponseText
     Const ForWriting = 2 
     Dim f
     Set f = fso.OpenTextFile("C:\GoogleHome\GoogleHomeNew.txt", ForWriting,true) 
     f.write(Telecharger)
     f.close
	 CheckMAJUser = false
	 WshShell.RegDelete "HKCU\Software\GoogleHome\Ok"
	 WshShell.RegDelete "HKCU\Software\GoogleHome\MAJ"
     WshShell.Run "cmd /c chcp 28591 > nul & taskkill /F /IM wscript.exe & move C:\GoogleHome\GoogleHomeNew.txt C:\GoogleHome\GoogleHome.vbs & start C:\GoogleHome\GoogleHome.vbs",0
	 WScript.Sleep 8000
	Else
	 If CheckMAJUser = true then MsgBox "Pas de nouvelle mise a jours a installer" & vbNewLine & "Vous �tes bien dans la derniere version disponible" & vbNewLine & vbNewLine & vbNewLine & "Votre version : " & VersionActu & vbNewLine & "Derniere version : " & NewVersion
	 CheckMAJUser = false
End if
End sub

Sub MeParler ()
Dim IE
Set IE = Wscript.CreateObject("InternetExplorer.Application")
IE.Visible = 0
IE.navigate "https://aboatdev.sarahah.com/" 
Texte = Inputbox ("M'envoyer un message : (constructif de pr�f�rence)" & vbcr & vbcr & vbcr & "N'oubliez pas de rajouter un moyen de contact si vous voulez �tre recontacter." & vbcr & vbcr & "-Envoie rapide & anonyme-","Envoyer un message au cr�ateur")
If Texte = "" then 
MsgBox "Message annuler."
Else
While IE.ReadyState <> 4 : WScript.Sleep 100 : Wend
WScript.Sleep 1000
IE.Document.All.Item("Text").Value = Texte & vbcr & vbcr & "Version : " & VersionActu
WScript.Sleep 1000
IE.Document.All.Item("Send").click
MsgBox "Message envoy� !",vbInformation+vbOKOnly,"Message Envoy�"
IE.Quit
End If 
End sub

Sub WifiPasswordsRecovery ()
If FSO.FileExists("C:\GoogleHome\WifiPasswordsRecovery.bat") = true then 
Else
Set objHTTP=CreateObject("MSXML2.XMLHTTP") 
objHTTP.Open "GET", "https://pastebin.com/raw/6MadNeRY", FALSE
objHTTP.Send
Telecharger = objHTTP.ResponseText
Const ForWriting = 2 
Dim f
Set f = fso.OpenTextFile("C:\GoogleHome\WifiPasswordsRecovery.bat", ForWriting,true) 
f.write(Telecharger)
f.close
WScript.Sleep 100
End if
	WshShell.Run "C:\GoogleHome\WifiPasswordsRecovery.bat"
End sub 

Sub Video ()
If FSO.FileExists("C:\GoogleHome\LancerDossierVideo.vbs") = true then 
Else
Set objHTTP=CreateObject("MSXML2.XMLHTTP") 
objHTTP.Open "GET", "https://pastebin.com/raw/jthwXjWi", FALSE
objHTTP.Send
Telecharger = objHTTP.ResponseText
Const ForWriting = 2 
Dim f
Set f = fso.OpenTextFile("C:\GoogleHome\LancerDossierVideo.vbs", ForWriting,true) 
f.write(Telecharger)
f.close
WScript.Sleep 100
End if
	WshShell.Run "C:\GoogleHome\LancerDossierVideo.vbs"
End sub 

Sub Musique ()
If FSO.FileExists("C:\GoogleHome\LancerDossierMusique.vbs") = true then 
Else
Set objHTTP=CreateObject("MSXML2.XMLHTTP") 
objHTTP.Open "GET", "https://pastebin.com/raw/7qjZSaHR", FALSE
objHTTP.Send
Telecharger = objHTTP.ResponseText
Const ForWriting = 2 
Dim f
Set f = fso.OpenTextFile("C:\GoogleHome\LancerDossierMusique.vbs", ForWriting,true) 
f.write(Telecharger)
f.close
WScript.Sleep 100
End if
	WshShell.Run "C:\GoogleHome\LancerDossierMusique.vbs"
End sub 

Sub write(a)
WshShell.SendKeys right(a,len(a)-1)
End sub

Sub Reset ()
WshShell.RegDelete "HKCU\Software\GoogleHome\Ok"
WshShell.RegDelete "HKCU\Software\GoogleHome\MUSIC"
WshShell.RegDelete "HKCU\Software\GoogleHome\VIDEO"
WshShell.RegDelete "HKCU\Software\GoogleHome\MAJ"
WshShell.Run "C:\GoogleHome\GoogleHome.vbs"
End sub

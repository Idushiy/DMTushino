//	setup file - on-file-for-all-version-changes
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------

//debugmode - use it only for mission editing
//#define __DEBUG__

// -------------------------------------------------------------------------------------------------- Allgemein ---------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------
// hier den Missionsnamen festlegen
#define __DM_MISSION_NAME__ "DM tushino"
// made by
#define __DM_MADEBY__ "Idushiy"
// short description
#define __DM_MISSION_DESCRIPTION__ " "

//number of max players
#define __DM_PLNUM__ 15

// zeit bis respawn
#define __DM_RESPAWN_DELAY__ 6

// wenn nicht auskommentiert mit // dann werden die in der Klammer definierten Channels blockiert und sind nur für den Admin frei
// 	0 = 	Global
// 	1 = 	Side
// 	2 = 	Command
// 	3 = 	Group
// 	4 = 	Vehicle
// 	5 = 	Direct
// 	6 = 	System
#define __DM_DISABLE_CHAT_CHANNELS__ {0}

// festlegen des Respawn Typs:
// 0 = No Respawn (NONE)
// 1 = Respawn als Möwe/Rabe/Schmetterling (BIRD)
// 2 = Instant, also an der Stelle an der man stirbt
// 3 = Respawn an der Base (BASE)
// 4 = Respawn in der Gruppe, nur wenn noch KI da ist (GROUP)
// 5 = Respawn in eine KI der eigenen Seite, sofern vorhanden (SIDE)
#define __DM_RESPAWN_TYPE__ 3

// wenn nicht auskommentiert mit // dann verdoppelt sich das Respawndelay des Spielers mit jedem Respawn
// Beispiel: Delay am Anfang, 30 Sekunden, der 3. Respawn dauert dann schon 4 Minuten!
// Die Zahl gibt das maximale Delay an (in Sekunden)
//#define __DM_FLEXIBLE_RESPAWNTIME__ 300


//setze sichtweite oder auskommentieren um per serversettings zu setzen
//#define __DM_VIEWDISTANCE__ 300



// wenn nicht auskommentiert mit // dann sieht man bei allen spielbaren Einheiten den Atem
//#define __DM_BREATH_VISIBLE__

// wenn nicht auskommentiert mit // entsteht ein sandsturm mit umherfliegenden papier und anderen partikeln - sollte nur benutzt werden wenn DM_DUST auskommentiert ist
//#define __DM_SANDSTORM__

// wenn nicht auskommentiert mit // dann zeigt die Kamera den Killer
#define __DM_DEADCAM__

// wenn nicht auskommentiert mit // dann wird die Starttageszeit forciert
//#define __DM_FORCE_TIME__

// wenn nicht auskommentiert mit // spawnen alle Units (auch Spieler) ohne Map. Die Map muss explizit hinzugefügt werden (player/unit addWeapon "ACE_Map")
#define __DM_MAP__

// auskommentieren und weder der Spieler noch sonst eine KI Einheit hat ein NVG
#define __DM_NO_NVG__

// wenn nicht auskommentiert mit // wird First Person ausserhalb von Vehikeln forciert
#define __DM_FIRSTPERSON__

// wenn nicht auskommentiert mit // wird oben links eine Statusbar eingeblendet
#define __DM_STATUSBAR__

// wenn definiert wird Anti-Camp aktiviert. Die Zahl ist das Timeout in Sekunden
#define __DM_CAMPERTIME__ 25

// wenn nicht auskommentiert mit // verlieren die Spieler im Wasser nicht mehr ihre Austrüstung
//#define __DM_STOP_ITEMS_DROPPING__

// wenn nicht auskommentiert mit // sind Granaten möglich
//#define __DM_NO_FATIGUE__

// wenn nicht auskommentiert mit // weden die Beine vor sehr starkem Schaden geschützt (kein langsames gehen)
//#define __DM_NO_BROKENLEGS__




// ----------- do not change anithing below this line! ------------
//macros---------------------------------------------------------------------------
#define __ccppfln(xfile1) call compile preprocessFileLineNumbers #xfile1
#define __cppfln(xdfunc,xfile2) xdfunc = compile preprocessFileLineNumbers #xfile2
#define __XJIPGetVar(jvarname) (X_JIPH getVariable #jvarname)
#define __XJIPSetVar X_JIPH setVariable

#define __pGetVar(pvarname) (player getVariable #pvarname)
#define __pSetVar player setVariable
#define __uiGetVar(uvarname) (uiNamespace getVariable #uvarname)
#define __prma _p removeAction _id
#define __waitpl [] spawn {waitUntil {!isNull player};X_INIT = true}
#define __addmx _p addMagazine _x
#define __addwx _p addWeapon _x
#define __kind _p isKindOf
#define __kind(eobj) eobj isKindOf
#define __sleep sleep 0.152
#define __type typeOf (vehicle player)
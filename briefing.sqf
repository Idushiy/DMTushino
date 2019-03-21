#include "setup.sqf"
waitUntil {!isNull player};

_subject = player createDiarySubject ["made", "Credits"];
_log_briefing = player createDiaryRecord ["made", ["Remake Mapbuilding", "
-------------------------------------------------------------------------------------<br/>
    <img image='img\logo.jpg' width='128' height='128' /><br/>
-------------------------------------------------------------------------------------<br/>
by Idushiy in 2019 "]];


//////////////////////////////////////////////////Notizen//////////////////////////////////////////////////////
_diary1=player createDiaryRecord ["Diary", ["Mission",
"Вся слава тому, кто убьёт больше всех!<br/>
<img image='img\logo.jpg' width='256' height='140' />"
]];

/////////////////////////////////////////////////Missionsziele/////////////////////////////////////////////////
task1 = player createSimpleTask ["Hold Position"];
task1 setSimpleTaskDestination (getMarkerPos "pos");
task1 setSimpleTaskDescription ["Победителя выявим по количеству убийств",
"Win", "Win"];

#define addf(fname) class fname {headerType = -1;}

class CfgFunctions {
	createShortcuts = 1;
	class tcb {
		tag = "tcb";
		class tcb_perFrame {
			file = "func\client\perFrame";
			addf(addperframe);
			addf(perframe);
			addf(removeperframe);
		};
		class Common_Net {
			file = "func\common\net";
			addf(netaddevent);
			addf(netaddeventcts);
			addf(netaddeventsto);
			addf(netaddeventtoclients);
			addf(netremoveevent);
			addf(netremoveeventcts);
			addf(netremoveeventsto);
			addf(netremoveeventservtoclients);
			addf(netrunevent);
			addf(netruneventcts);
			addf(netruneventsto);
			addf(netruneventtoclients);
			addf(netcallevent);
			addf(netcalleventcts);
			addf(netcalleventsto);
			addf(netcalleventtoclients);
			addf(netsetjip);
			addf(localcallevent);
		};
		class common {
			file = "func\common";
			addf(arrayPushStack);
			addf(randomFloor);
			addf(randomIndexArray);
			addf(countedIndexArray);
			addf(randomFloorArray);
			addf(randomArrayVal);
			addf(randomCeil);
			addf(playerNumber);
			addf(removeNVG);
		};
		class client {
			file = "func\client";
			addf(vehicleChat);
			addf(HQchat);
			addf(sidechat);
			addf(globalchat);
			addf(playerRespawn);
			addf(checkLegs);
		};
		class server {
			file = "func\server";
		};
		class tcb_preinit {
			file = "func";
			class preinit {
				preInit = 1;
				headerType = -1;
			};
		};
	};
};
class RscTitles {

	class INTRO {			// tequila intro grafics
	  	idd=-1;
	  	movingEnable=0;
	  	duration=12;
	  	fadein=2;
	  	name="INTRO";
	  	controls[]={"Bild","madeby"};

	  	class Bild : RscStdText {
            style=48;
			colorText[] = {1,1,1,1};
	  	  	text="img\logo.jpg";
			sizeEx = 256;
	  	  	x=-0.2;
	  	  	y=0;
	  	  	w=1.5;
	  	  	h=1;
	  	};
	  	class madeby : RscStdText {
	  	  	text="by Idushiy";
			colorText[]={1,0.8,0.6,1};
			sizeEx = 0.03;
	  	  	x=0.2;
	  	  	y=1.25;
	  	  	w=2.0;
	  	  	h=0.2;
	  	};
	};

	class Mission_Title3 {
	  	idd=-1;
	  	movingEnable=0;
	  	duration=4;
	  	fadein=1;
	  	name="Mission_Title3";
	  	controls[] = {Titelt1};
		class Titelt1 : RscStdText {
			font=DEFAULTFONT;
			text = "GL HF!";
			colorText[] = Color_White;
			sizeEx = TextSize_medium;
			x = -0.1;
			y = 0.3;
			w = 1;
			h = 1;
		};
	};

	class mission_Label {
		idd=-1;
		movingEnable=0;
		fadein = 4;
		fadeout = 2;
		duration=25;
		name="mission_Label";
		sizeEx = 256;
		class controls {
			class Picture : RscPicture {
				x = "SafeZoneX + SafeZoneW - 0.33";
				y = "SafeZoneY + SafeZoneH - 0.19";
				w = 0.20; h = 0.20;
				colorText[] = {1,1,1,0.6};
				text="img\logo.jpg";
				sizeEx = 256;
			};
		};
	};

		class OUTRO {
	  	idd=-1;
	  	movingEnable=0;
	  	duration=8;
	  	fadein=8;
	  	name="OUTRO";
	  	controls[]={"Titel","Bild","text","text2"};
		class Titel : RscStdText {
			font=DEFAULTFONT;
			lineSpacing=0.950000;
			duration=50;
			text="";
			x=0.39000000;
			y=0.9100000;
			w=0.900000;
			h=0.700000;
			sizeEx = 0.026;
        };
		class Bild : RscStdText {
			style=48;
			#ifdef __GECO__
			text="img\logo.jpg";
			#else
			text="img\logo.jpg";
			#endif
			sizeEx = 0.05;
			x=0.00;
			y=0.20;
			w=0.4;
			h=0.4;
        };
		class text : RscStdText {
			#ifdef __GECO__
			text = "Mission made for";
			#else
			text = "Mission made by";
			#endif
			colorText[] = Color_Blue;
			sizeEx = TextSize_large;
			x = -0.8;
			y = -0.1;
			w = 1;
			h = 1;
		};
		class text2 : RscStdText {
			text = "... have a nice day!";
			colorText[] = Color_White;
			sizeEx = TextSize_medium;
			x = +0.9;
			y = +0.8;
			w = 1;
			h = 1;
		};
	};


	class dom_Empty {
		idd = -1;
		duration = 0;
		class controls {};
	};



	class RscDeadQuote {
		onload = "uinamespace setvariable ['fhq_title',_this select 0];";
		idd = 1792;
		movingEnable = false;
		moving = false;
		duration=10e10;
		enableSimulation = true;
		controlsBackground[] = {};
		objects[] = {};
		controls[] = {QuoteStructuredText,HeaderDeath};

		class HeaderDeath {
			idc = -1;
			type = CT_STRUCTURED_TEXT;
			style = ST_LEFT;
			colorBackground[] = {1, 1, 1, 0};
			colorText[] = {1, 0.0, 0.0, 1};
			x = safezoneX + 0.3 * safezoneW;
			y = safezoneY + 0.045 * safezoneW;
			w = 1;
			h = 0.6;
			size = 0.08;
			text = "Вы умерли";
			class Attributes {
				font = DEFAULTFONT;
				color = "#CC0000";	// red
				align = "center";
				valign = "middle";
				shadow = false;
				shadowColor = "#ff0000";
				size = "1.6";
			};
		};

		class QuoteStructuredText {
			idc = 1793;
			type = CT_STRUCTURED_TEXT;
			style = ST_LEFT;
			colorBackground[] = { 1, 1, 1, 0 };
			colorText[] = {1,1,1,1};
			x = safezoneX + 0.3 * safezoneW;
			y = safezoneY + 0.67 * safezoneW;
			w = 1;
			h = 0.6;
			size = 0.02;
			text = "";
			class Attributes {
				font = DEFAULTFONT;
				color = "#000000";
				align = "center";
				valign = "middle";
				shadow = false;
				shadowColor = "#ff0000";
				size = "1.6";
			};
		};
	};
};
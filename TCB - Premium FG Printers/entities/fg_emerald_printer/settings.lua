--[[

                                          Upload by MichqeL123
                                           For LeakForums.org
                                     Have fun guys this all for you
                                           Love From -=Israel=-
										   
--]]

--[[---------------------------------------------------------
	Name: Variables
-----------------------------------------------------------]]
EmeraldPrinter = {}


--[[---------------------------------------------------------
	Name: Groups
-----------------------------------------------------------]]
EmeraldPrinter.GroupDonator		= { "superadmin", "admin", "moderator", "donator" }
EmeraldPrinter.GroupStaff		= { "superadmin", "admin", "moderator" }


--[[---------------------------------------------------------
	Name: Settings
-----------------------------------------------------------]]
EmeraldPrinter.FrameTitle		= "FlawlessGaming"
EmeraldPrinter.PrinterID		= 4
EmeraldPrinter.PrinterName 		= "Emerald Printer"
EmeraldPrinter.PrinterColor		= Color( 80, 200, 120, 255 )
EmeraldPrinter.PrinterHealth	= 100

EmeraldPrinter.DefaultSpeed		= 200
EmeraldPrinter.DefaultQuality	= 1500
EmeraldPrinter.DefaultCooler 	= 20

EmeraldPrinter.DefaultTemp 		= 20


--[[---------------------------------------------------------
	Name: Messages
-----------------------------------------------------------]]
EmeraldPrinter.MessageMoney 	= "You don't have enough money for this upgrade!"
EmeraldPrinter.MessageRank		= "You don't have the required rank for this upgrade!"
EmeraldPrinter.MessageCollect	= "You took $% from the printer!"
EmeraldPrinter.MessageExplode	= "Your printer exploded!"


--[[---------------------------------------------------------
	Name: Speed // ID, %, Price, Team
-----------------------------------------------------------]]
EmeraldPrinter.PrinterSpeed = {
	{ 01, 100, 0, 0 },

	{ 02, 95, 200, 0 },
	{ 03, 90, 250, 0 },
	{ 04, 80, 300, 0 },
	{ 05, 70, 400, 0 },
	{ 06, 60, 500, 0 },
	{ 07, 50, 700, 1 },
	{ 08, 40, 900, 1 },
	{ 09, 30, 1100, 1 },
	{ 10, 20, 1200, 2 },
}


--[[---------------------------------------------------------
	Name: Quality // ID, %, Price, Team
-----------------------------------------------------------]]
EmeraldPrinter.PrinterQuality = {
	{ 01, 100, 0, 0 },

	{ 02, 110, 200, 0 },
	{ 03, 120, 250, 0 },
	{ 04, 140, 300, 0 },
	{ 05, 160, 400, 0 },
	{ 06, 180, 500, 0 },
	{ 07, 200, 700, 1 },
	{ 08, 220, 900, 1 },
	{ 09, 240, 1100, 1 },
	{ 10, 270, 1200, 2 },
}


--[[---------------------------------------------------------
	Name: Cooler // ID, %, Price, Team
-----------------------------------------------------------]]
EmeraldPrinter.PrinterCooler = {
	{ 01, 100, 0, 0 },

	{ 02, 110, 200, 0 },
	{ 03, 120, 250, 0 },
	{ 04, 130, 300, 0 },
	{ 05, 150, 400, 0 },
	{ 06, 175, 500, 0 },
	{ 07, 200, 700, 1 },
	{ 08, 225, 900, 1 },
	{ 09, 250, 1100, 1 },
	{ 10, 300, 1200, 2 },
}
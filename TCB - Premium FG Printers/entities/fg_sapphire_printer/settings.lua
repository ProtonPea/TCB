--[[

                                          Upload by MichqeL123
                                           For LeakForums.org
                                     Have fun guys this all for you
                                           Love From -=Israel=-
										   
--]]

--[[---------------------------------------------------------
	Name: Variables
-----------------------------------------------------------]]
SapphirePrinter = {}


--[[---------------------------------------------------------
	Name: Groups
-----------------------------------------------------------]]
SapphirePrinter.GroupDonator	= { "superadmin", "admin", "moderator", "donator" }
SapphirePrinter.GroupStaff		= { "superadmin", "admin", "moderator" }


--[[---------------------------------------------------------
	Name: Settings
-----------------------------------------------------------]]
SapphirePrinter.FrameTitle		= "FlawlessGaming"
SapphirePrinter.PrinterID		= 2
SapphirePrinter.PrinterName 	= "Sapphire Printer"
SapphirePrinter.PrinterColor	= Color( 15, 82, 186, 255 )
SapphirePrinter.PrinterHealth	= 100

SapphirePrinter.DefaultSpeed	= 200
SapphirePrinter.DefaultQuality	= 500
SapphirePrinter.DefaultCooler 	= 20

SapphirePrinter.DefaultTemp 	= 20


--[[---------------------------------------------------------
	Name: Messages
-----------------------------------------------------------]]
SapphirePrinter.MessageMoney 	= "You don't have enough money for this upgrade!"
SapphirePrinter.MessageRank		= "You don't have the required rank for this upgrade!"
SapphirePrinter.MessageCollect	= "You took $% from the printer!"
SapphirePrinter.MessageExplode	= "Your printer exploded!"


--[[---------------------------------------------------------
	Name: Speed // ID, %, Price, Team
-----------------------------------------------------------]]
SapphirePrinter.PrinterSpeed = {
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
SapphirePrinter.PrinterQuality = {
	{ 01, 100, 0, 0 },

	{ 02, 105, 200, 0 },
	{ 03, 110, 250, 0 },
	{ 04, 120, 300, 0 },
	{ 05, 130, 400, 0 },
	{ 06, 140, 500, 0 },
	{ 07, 150, 700, 1 },
	{ 08, 170, 900, 1 },
	{ 09, 190, 1100, 1 },
	{ 10, 200, 1200, 2 },
}


--[[---------------------------------------------------------
	Name: Cooler // ID, %, Price, Team
-----------------------------------------------------------]]
SapphirePrinter.PrinterCooler = {
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
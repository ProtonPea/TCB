--[[

                                          Upload by MichqeL123
                                           For LeakForums.org
                                     Have fun guys this all for you
                                           Love From -=Israel=-
										   
--]]

--[[---------------------------------------------------------
	Name: Variables
-----------------------------------------------------------]]
AmberPrinter = {}


--[[---------------------------------------------------------
	Name: Groups
-----------------------------------------------------------]]
AmberPrinter.GroupDonator		= { "superadmin", "admin", "moderator", "donator" }
AmberPrinter.GroupStaff			= { "superadmin", "admin", "moderator" }


--[[---------------------------------------------------------
	Name: Settings
-----------------------------------------------------------]]
AmberPrinter.FrameTitle			= "FlawlessGaming"
AmberPrinter.PrinterID			= 1
AmberPrinter.PrinterName 		= "Amber Printer"
AmberPrinter.PrinterColor		= Color( 255, 126, 0, 255 )
AmberPrinter.PrinterHealth		= 100

AmberPrinter.DefaultSpeed		= 200
AmberPrinter.DefaultQuality		= 250
AmberPrinter.DefaultCooler 		= 20

AmberPrinter.DefaultTemp 		= 20


--[[---------------------------------------------------------
	Name: Messages
-----------------------------------------------------------]]
AmberPrinter.MessageMoney 		= "You don't have enough money for this upgrade!"
AmberPrinter.MessageRank		= "You don't have the required rank for this upgrade!"
AmberPrinter.MessageCollect		= "You took $% from the printer!"
AmberPrinter.MessageExplode		= "Your printer exploded!"


--[[---------------------------------------------------------
	Name: Speed // ID, %, Price, Team
-----------------------------------------------------------]]
AmberPrinter.PrinterSpeed = {
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
AmberPrinter.PrinterQuality = {
	{ 01, 100, 0, 0 },

	{ 02, 110, 200, 0 },
	{ 03, 120, 250, 0 },
	{ 04, 140, 300, 0 },
	{ 05, 160, 400, 0 },
	{ 06, 180, 500, 0 },
	{ 07, 200, 700, 1 },
	{ 08, 230, 900, 1 },
	{ 09, 260, 1100, 1 },
	{ 10, 300, 1200, 2 },
}


--[[---------------------------------------------------------
	Name: Cooler // ID, %, Price, Team
-----------------------------------------------------------]]
AmberPrinter.PrinterCooler = {
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
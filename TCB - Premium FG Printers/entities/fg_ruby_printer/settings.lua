--[[

                                          Upload by MichqeL123
                                           For LeakForums.org
                                     Have fun guys this all for you
                                           Love From -=Israel=-
										   
--]]

--[[---------------------------------------------------------
	Name: Variables
-----------------------------------------------------------]]
RubyPrinter = {}


--[[---------------------------------------------------------
	Name: Groups
-----------------------------------------------------------]]
RubyPrinter.GroupDonator	= { "superadmin", "admin", "moderator", "donator" }
RubyPrinter.GroupStaff		= { "superadmin", "admin", "moderator" }


--[[---------------------------------------------------------
	Name: Settings
-----------------------------------------------------------]]
RubyPrinter.FrameTitle		= "FlawlessGaming"
RubyPrinter.PrinterID		= 3
RubyPrinter.PrinterName 	= "Ruby Printer"
RubyPrinter.PrinterColor	= Color( 209, 0, 86, 255 )
RubyPrinter.PrinterHealth	= 100

RubyPrinter.DefaultSpeed	= 200
RubyPrinter.DefaultQuality	= 1000
RubyPrinter.DefaultCooler 	= 20

RubyPrinter.DefaultTemp 	= 20


--[[---------------------------------------------------------
	Name: Messages
-----------------------------------------------------------]]
RubyPrinter.MessageMoney 	= "You don't have enough money for this upgrade!"
RubyPrinter.MessageRank		= "You don't have the required rank for this upgrade!"
RubyPrinter.MessageCollect	= "You took $% from the printer!"
RubyPrinter.MessageExplode	= "Your printer exploded!"


--[[---------------------------------------------------------
	Name: Speed // ID, %, Price, Team
-----------------------------------------------------------]]
RubyPrinter.PrinterSpeed = {
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
RubyPrinter.PrinterQuality = {
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
RubyPrinter.PrinterCooler = {
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
--[[

                                          Upload by MichqeL123
                                           For LeakForums.org
                                     Have fun guys this all for you
                                           Love From -=Israel=-
										   
--]]

--[[---------------------------------------------------------
	Name: Files
-----------------------------------------------------------]]

--> Include
include( "settings.lua" )


--[[---------------------------------------------------------
	Name: Settings
-----------------------------------------------------------]]
ENT.Type 		= "anim"
ENT.Base 		= "base_gmodentity"
ENT.PrintName 	= RubyPrinter.PrinterName
ENT.Author 		= "TheCodingBeast"

ENT.Spawnable 		= false
ENT.AdminSpawnable 	= true


--[[---------------------------------------------------------
	Name: SetupDataTables
-----------------------------------------------------------]]
function ENT:SetupDataTables()

	self:NetworkVar( "Int", 1, "lvl_speed" )
	self:NetworkVar( "Int", 2, "lvl_quality" )
	self:NetworkVar( "Int", 3, "lvl_cooler" )

	self:NetworkVar( "Int", 4, "data_power" )
	self:NetworkVar( "Int", 5, "data_money" )
	
	self:NetworkVar( "Float", 6, "data_temp" )

	self:NetworkVar( "Entity", 1, "owning_ent" )

end
--[[

                                          Upload by MichqeL123
                                           For LeakForums.org
                                     Have fun guys this all for you
                                           Love From -=Israel=-
										   
--]]

--[[---------------------------------------------------------
	Name: Files
-----------------------------------------------------------]]

--> AddCSLuaFile
AddCSLuaFile( "settings.lua" )
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

--> Include
include( "settings.lua" )
include( "shared.lua" )


--[[---------------------------------------------------------
	Name: Network
-----------------------------------------------------------]]
util.AddNetworkString( "fg_printer_" .. SapphirePrinter.PrinterID .. "_menu" )

util.AddNetworkString( "fg_printer_" .. SapphirePrinter.PrinterID .. "_power" )
util.AddNetworkString( "fg_printer_" .. SapphirePrinter.PrinterID .. "_money" )

util.AddNetworkString( "fg_printer_" .. SapphirePrinter.PrinterID .. "_upgrade_speed" )
util.AddNetworkString( "fg_printer_" .. SapphirePrinter.PrinterID .. "_upgrade_quality" )
util.AddNetworkString( "fg_printer_" .. SapphirePrinter.PrinterID .. "_upgrade_cooler" )



--[[---------------------------------------------------------
	Name: Initialize
-----------------------------------------------------------]]
function ENT:Initialize()

	--> Base Settings
	self:SetModel( "models/props_c17/consolebox01a.mdl" )
	self:SetColor( SapphirePrinter.PrinterColor )
	self:SetMaterial( "metal2a" )
	self:SetUseType( SIMPLE_USE )

	--> Physics Settings
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )

	--> Physics Wake
	local phys = self:GetPhysicsObject()
	phys:Wake()

	--> Printer
	self.Printer = true

	--> Health
	self.PHealth = SapphirePrinter.PrinterHealth or 100

	--> Levels
	self:Setlvl_speed( 1 )
	self:Setlvl_quality( 1 )
	self:Setlvl_cooler( 1 )

	--> Data
	self:Setdata_money( 0 )
	self:Setdata_power( 0 )
	self:Setdata_temp( SapphirePrinter.DefaultTemp )

	--> Noise
	self.Noise = CreateSound( self, Sound( "ambient/levels/labs/equipment_printer_loop1.wav" ) )
	self.Noise:SetSoundLevel( 55 )

	--> Start Printer
	self:ManageTimer()

end


--[[---------------------------------------------------------
	Name: PrintMoney
-----------------------------------------------------------]]
function ENT:PrintMoney()

	--> Power
	if self:Getdata_power() == 1 then
		
		--> Money
		self:Setdata_money( self:Getdata_money() + ( SapphirePrinter.DefaultQuality / 100 * SapphirePrinter.PrinterQuality[ self:Getlvl_quality() ][2] ) )

		--> Temp
		if self:Getlvl_speed() > self:Getlvl_cooler() or self:Getlvl_quality() > self:Getlvl_cooler() then
		
			self:Setdata_temp( math.Round( self:Getdata_temp() + math.random( 1.5, 5.5 ), 1 ) )

		elseif self:Getlvl_cooler() > self:Getlvl_speed() and self:Getlvl_cooler() > self:Getlvl_quality() then

		else

			self:Setdata_temp( math.Round( self:Getdata_temp() + math.random( 0.1, 0.3 ), 1 ) )

		end

	else

		--> Temp
		if self:Getdata_temp() > SapphirePrinter.DefaultTemp then
			
			local NewTemp = self:Getdata_temp() - math.random( 0.2, 3.5 )
			
			if NewTemp > SapphirePrinter.DefaultTemp then
				
				self:Setdata_temp( math.Round( NewTemp, 1 ) )

			else

				self:Setdata_temp( math.Round( SapphirePrinter.DefaultTemp, 1 ) )

			end

		end

	end

	--> Explode
	if self:Getdata_temp() >= 75 then
		if math.random( 1, 4 ) == 1 then

			if math.random( 1, 10 ) < 3 then
				
				self:BurstIntoFlames()

			else

				self:Destruct()
				self:Remove()

			end

		end
	end

	--> Check
	if not IsValid( self ) then return end

	--> Restart
	self:ManageTimer()

end


--[[---------------------------------------------------------
	Name: ManageTimer
-----------------------------------------------------------]]
function ENT:ManageTimer()

	--> Timer
	timer.Simple( ( SapphirePrinter.DefaultSpeed / 100 * SapphirePrinter.PrinterSpeed[ self:Getlvl_speed() ][2] ), function() 
		
		--> Check
		if not IsValid( self ) then return end

		--> Print
		self:PrintMoney() 

	end )

end


--[[---------------------------------------------------------
	Name: OnTakeDamage
-----------------------------------------------------------]]
function ENT:OnTakeDamage( damage )

	--> Burning
	if self.Burning then return end

	--> Variables
	self.PHealth = self.PHealth - damage:GetDamage()

	--> Health
	if self.PHealth <= 0 then
		if math.random( 1, 10 ) < 3 then
			
			self:BurstIntoFlames()

		else

			self:Destruct()
			self:Remove()

		end		
	end

end


--[[---------------------------------------------------------
	Name: Destruct
-----------------------------------------------------------]]
function ENT:Destruct()

	--> Variables
	local vPoint = self:GetPos()
	local effectdata = EffectData()

	--> Effect Data
	effectdata:SetStart( vPoint )
	effectdata:SetOrigin( vPoint )
	effectdata:SetScale( 1 )

	--> Effect Run
	util.Effect( "Explosion", effectdata )

	--> Notify
	DarkRP.notify( self:Getowning_ent(), 1, 4, SapphirePrinter.MessageExplode )

end


--[[---------------------------------------------------------
	Name: BurstIntoFlames
-----------------------------------------------------------]]
function ENT:BurstIntoFlames()

	--> Burning
	self.Burning = true

	--> Variables
	local BurnTime = math.random( 8, 18 )

	--> Ignit
	self:Ignite( BurnTime, 0 )

	--> Fireball
	timer.Simple( BurnTime, function() self:Fireball() end )

end


--[[---------------------------------------------------------
	Name: Fireball
-----------------------------------------------------------]]
function ENT:Fireball()

	--> Fire
	if not self:IsOnFire() then
		self.Burning = false
	end

	--> Variables
	local distance = math.random( 20, 250 )

	--> Explode
	self:Destruct()

	--> Radius
	for k,v in pairs( ents.FindInSphere( self:GetPos(), distance ) ) do
		if not v:IsPlayer() and not v:IsWeapon() and v:GetClass() ~= "predicted_viewmodel" and not v.Printer then

			v:Ignite(math.random(5, 22), 0)

		elseif v:IsPlayer() then

			local dist = v:GetPos():Distance( self:GetPos() )
			v:TakeDamage( dist / distance * 100, self, self )

		end
	end

	--> Remove
	self:Remove()

end


--[[---------------------------------------------------------
	Name: OnRemove
-----------------------------------------------------------]]
function ENT:OnRemove()

	--> Noise
	self.Noise:Stop()

end


--[[---------------------------------------------------------
	Name: Use
-----------------------------------------------------------]]
function ENT:Use( entity, player )

	--> Open Menu
	timer.Simple( 0.2, function()
		net.Start( "fg_printer_" .. SapphirePrinter.PrinterID .. "_menu" )
			net.WriteEntity( self )
		net.Send( player )
	end )

end


--[[---------------------------------------------------------
	Name: Upgrade
-----------------------------------------------------------]]
function ENT:Upgrade( printer, type, level )

	--> Data
	if !level then level = 1 end

	--> Level
	if type == "speed" then
		
		printer:Setlvl_speed( printer:Getlvl_speed() + level )

	elseif type == "quality" then
		
		printer:Setlvl_quality( printer:Getlvl_quality() + level )

	elseif type == "cooler" then
	
		printer:Setlvl_cooler( printer:Getlvl_cooler() + level )

	end

end


--[[---------------------------------------------------------
	Name: Upgrade
-----------------------------------------------------------]]
local function SpeedUpgrade( length, ply )

	--> Variables
	local Printer 	= net.ReadEntity()
	local NewLevel 	= Printer:Getlvl_speed() + 1

	--> Upgrade
	if !SapphirePrinter.PrinterSpeed[ NewLevel ] then return end

	--> Price
	if !ply:canAfford( SapphirePrinter.DefaultQuality / 100 * SapphirePrinter.PrinterSpeed[ NewLevel ][3] ) then 
		DarkRP.notify( ply, 1, 4, SapphirePrinter.MessageMoney )
		return
	elseif SapphirePrinter.PrinterSpeed[ NewLevel ][4] != 0 then
		if SapphirePrinter.PrinterSpeed[ NewLevel ][4] == 1 then
			if not table.HasValue( SapphirePrinter.GroupDonator, ply:GetNWString("usergroup") ) then
				DarkRP.notify( ply, 1, 4, SapphirePrinter.MessageRank )
				return
			end
		elseif SapphirePrinter.PrinterSpeed[ NewLevel ][4] == 2 then
			if not table.HasValue( SapphirePrinter.GroupStaff, ply:GetNWString("usergroup") ) then
				DarkRP.notify( ply, 1, 4, SapphirePrinter.MessageRank )
				return
			end
		end
	end

	--> Money
	ply:addMoney( -SapphirePrinter.DefaultQuality / 100 * SapphirePrinter.PrinterSpeed[ NewLevel ][3] )

	--> Upgrade	
	Printer:Upgrade( Printer, "speed", 1 )

end
net.Receive( "fg_printer_" .. SapphirePrinter.PrinterID .. "_upgrade_speed", SpeedUpgrade )


--[[---------------------------------------------------------
	Name: Upgrade
-----------------------------------------------------------]]
local function QualityUpgrade( length, ply )

	--> Variables
	local Printer 	= net.ReadEntity()
	local NewLevel 	= Printer:Getlvl_quality() + 1

	--> Upgrade
	if !SapphirePrinter.PrinterQuality[ NewLevel ] then return end

	--> Price
	if !ply:canAfford( SapphirePrinter.DefaultQuality / 100 * SapphirePrinter.PrinterQuality[ NewLevel ][3] ) then 
		DarkRP.notify( ply, 1, 4, SapphirePrinter.MessageMoney )
		return
	elseif SapphirePrinter.PrinterQuality[ NewLevel ][4] != 0 then
		if SapphirePrinter.PrinterQuality[ NewLevel ][4] == 1 then
			if not table.HasValue( SapphirePrinter.GroupDonator, ply:GetNWString("usergroup") ) then
				DarkRP.notify( ply, 1, 4, SapphirePrinter.MessageRank )
				return
			end
		elseif SapphirePrinter.PrinterQuality[ NewLevel ][4] == 2 then
			if not table.HasValue( SapphirePrinter.GroupStaff, ply:GetNWString("usergroup") ) then
				DarkRP.notify( ply, 1, 4, SapphirePrinter.MessageRank )
				return
			end
		end
	end

	--> Money
	ply:addMoney( -SapphirePrinter.DefaultQuality / 100 * SapphirePrinter.PrinterQuality[ NewLevel ][3] )

	--> Upgrade	
	Printer:Upgrade( Printer, "quality", 1 )

end
net.Receive( "fg_printer_" .. SapphirePrinter.PrinterID .. "_upgrade_quality", QualityUpgrade )


--[[---------------------------------------------------------
	Name: Upgrade
-----------------------------------------------------------]]
local function CoolerUpgrade( length, ply )

	--> Variables
	local Printer 	= net.ReadEntity()
	local NewLevel 	= Printer:Getlvl_cooler() + 1

	--> Upgrade
	if !SapphirePrinter.PrinterCooler[ NewLevel ] then return end

	--> Price
	if !ply:canAfford( SapphirePrinter.DefaultQuality / 100 * SapphirePrinter.PrinterCooler[ NewLevel ][3] ) then 
		DarkRP.notify( ply, 1, 4, SapphirePrinter.MessageMoney )
		return
	elseif SapphirePrinter.PrinterCooler[ NewLevel ][4] != 0 then
		if SapphirePrinter.PrinterCooler[ NewLevel ][4] == 1 then
			if not table.HasValue( SapphirePrinter.GroupDonator, ply:GetNWString("usergroup") ) then
				DarkRP.notify( ply, 1, 4, SapphirePrinter.MessageRank )
				return
			end
		elseif SapphirePrinter.PrinterCooler[ NewLevel ][4] == 2 then
			if not table.HasValue( SapphirePrinter.GroupStaff, ply:GetNWString("usergroup") ) then
				DarkRP.notify( ply, 1, 4, SapphirePrinter.MessageRank )
				return
			end
		end
	end

	--> Money
	ply:addMoney( -SapphirePrinter.DefaultQuality / 100 * SapphirePrinter.PrinterCooler[ NewLevel ][3] )

	--> Upgrade	
	Printer:Upgrade( Printer, "cooler", 1 )

end
net.Receive( "fg_printer_" .. SapphirePrinter.PrinterID .. "_upgrade_cooler", CoolerUpgrade )


--[[---------------------------------------------------------
	Name: Power
-----------------------------------------------------------]]
local function PowerChange( length, ply )

	--> Variables
	local Printer 	= net.ReadEntity()
	local power 	= Printer:Getdata_power()

	--> Power
	if power == 1 then
		
		--> Variables
		Printer:Setdata_power( 0 )

		--> Noise
		Printer.Noise:Stop()

	else

		--> Variables
		Printer:Setdata_power( 1 )

		--> Noise
		Printer.Noise:PlayEx( 1, 100 )

	end

end
net.Receive( "fg_printer_" .. SapphirePrinter.PrinterID .. "_power", PowerChange )


--[[---------------------------------------------------------
	Name: CollectMoney
-----------------------------------------------------------]]
local function CollectMoney( length, ply )

	--> Variables
	local Printer 	= net.ReadEntity()
	local money 	= Printer:Getdata_money()

	--> Power
	if money > 0 then
		
		--> Reset
		Printer:Setdata_money( 0 )

		--> Give Money
		ply:addMoney( money )

		--> Notify
		DarkRP.notify( ply, 3, 4, string.Replace( SapphirePrinter.MessageCollect, "%", tostring( money ) ) )

	end

end
net.Receive( "fg_printer_" .. SapphirePrinter.PrinterID .. "_money", CollectMoney )
--[[
	patchma hub by rqz & myworld
	accessories for body parts can be found in  genesis fe Hat game, just search Foundation
    Accessories:
    Starless Man V3 = 5699795428

]]

--no need to get and index the library tables with function names every time the script uses them
local soundCache = {}

local function playSoundById(soundId, parent)
	local formattedId = type(soundId) == "number" and ("rbxassetid://" .. soundId) or soundId
	parent = parent or workspace
	
	if soundCache[formattedId] then
		soundCache[formattedId]:Destroy()
	end
	
	local sound = Instance.new("Sound")
	sound.SoundId = formattedId
	sound.Parent = parent
	sound.Looped= true
	soundCache[formattedId] = sound
	sound:Play()
	
	sound.Ended:Connect(function()
		if soundCache[formattedId] == sound then
			soundCache[formattedId] = nil
		end
		sound:Destroy()
	end)
end

local function stopSoundById(soundId)
	local formattedId = type(soundId) == "number" and ("rbxassetid://" .. soundId) or soundId
	
	if soundCache[formattedId] then
		soundCache[formattedId]:Stop()
		soundCache[formattedId]:Destroy()
		soundCache[formattedId] = nil
	end
end
playSoundById(138984273283659, workspace)
local function stopAllSounds()
    stopSoundById(138984273283659)
end
local osclock=os.clock
local tspawn=task.spawn
local twait=task.wait
local schar=string.char
local ssub=string.sub
local sfind=string.find
local supper=string.upper
local mrandom=math.random
local sin=math.sin
local cos=math.cos
local abs=math.abs
local min=math.min
local clamp=math.clamp
local tinsert=table.insert
local tclear=table.clear
local tclone=table.clone
local tfind=table.find
local vmagnitude=vector.magnitude --faster than indexing with Magnitude
local vnormalize=vector.normalize --faster than indexing with Unit

--the script doesnt have to read global varaibles every time to get them
--why not have them saved in local varaibles for faster access times
local next=next
local pcall=pcall
local xpcall=xpcall
local type=type
local typeof=typeof
local game=game
local replicatesignal=replicatesignal

local i=Instance.new 
local v2=Vector2.new 
local v3=Vector3.new
local c3=Color3.new 
local cf=CFrame.new
local cfl=CFrame.lookAt
local angles=CFrame.fromEulerAngles --faster than .Angles
local u2=UDim2.new 
local e=Enum 
local rp=RaycastParams.new 
local cs=ColorSequence.new 
local csk=ColorSequenceKeypoint.new 

local sine=osclock()
local deltaTime=0
local v3_0=v3()
local v3_101=v3(1,0,1)
local v3_010=v3(0,1,0)
local cf_0=cf()
local v3_xz=v3_101*10
local v3_xzL=v3_101*250.1
local v3_net=v3_010*25.01

local enumMD=e.MouseBehavior.Default

--not "local function rs" to not assign debug names
local rs=function()
	local s=""
	for i=1,mrandom(8,15) do
		if mrandom(2)==2 then
			s=s..schar(mrandom(65,90))
		else
			s=s..schar(mrandom(97,122))
		end
	end
	return s
end

--it runs even faster if u call __index and __newindex metamethods directly
local getMetamethodFromErrorStack=function(userdata,f,test)
	local ret=nil
	xpcall(f,function()
		ret=debug.info(2,"f")
	end,userdata,nil,0)
	if (type(ret)~="function") or not test(ret) then
		return f
	end
	return ret
end
local insSet=getMetamethodFromErrorStack(game,function(a,b,c) a[b]=c end,function(f) local a=i("Folder") local b=rs() f(a,"Name",b) return a.Name==b end)
local insGet=getMetamethodFromErrorStack(game,function(a,b) return a[b] end,function(f) local a=i("Folder") local b=rs() a.Name=b return f(a,"Name")==b end)
local cfGet=getMetamethodFromErrorStack(cf_0,function(a,b) return a[b] end,function(f) return f(cf(1,2,3),"Position")==v3(1,2,3) end)
local cfMul=getMetamethodFromErrorStack(cf_0,function(a,b) return a*b end,function(f) return angles(1,2,3)*angles(1,2,3)==f(angles(1,2,3),angles(1,2,3)) end)
local cfAdd=getMetamethodFromErrorStack(cf_0,function(a,b) return a+b end,function(f) return cf(1,2,3)+v3(1,2,3)==f(cf(1,2,3),v3(1,2,3)) end)
local v3Get=getMetamethodFromErrorStack(v3_0,function(a,b) return a[b] end,function(f) return v3(1,2,3).Unit==f(v3(1,2,3),"Unit") end)
local v2Get=getMetamethodFromErrorStack(v2(),function(a,b) return a[b] end,function(f) return f(v2(1,2),"Y")==2 end)
--multiplying and adding vector3 is faster if you use the * and + operators
--its faster to multiply X and Y of vector2 than to multiply vector2 and then get X and Y from it

--no need to index instances every time to call their functions
local Clone=insGet(game,"Clone")
local ClearAllChildren=insGet(game,"ClearAllChildren")
local Destroy=insGet(game,"Destroy")
local IsA=insGet(game,"IsA")
local FindFirstChildOfClass=insGet(game,"FindFirstChildOfClass")
local FindFirstChildWhichIsA=insGet(game,"FindFirstChildWhichIsA")
local GetChildren=insGet(game,"GetChildren")
local IsDescendantOf=insGet(game,"IsDescendantOf")
local QueryDescendants=insGet(game,"QueryDescendants")
local GetPropertyChangedSignal=insGet(game,"GetPropertyChangedSignal")

--findfirstchildofclass faster than getservice
local plrs=FindFirstChildOfClass(game,"Players")
local rus=FindFirstChildOfClass(game,"RunService")
local ws=FindFirstChildOfClass(game,"Workspace")
local uis=FindFirstChildOfClass(game,"UserInputService")
local gs=FindFirstChildOfClass(game,"GuiService")
local sg=FindFirstChildOfClass(game,"StarterGui")
local lp=insGet(plrs,"LocalPlayer")
local pg=FindFirstChildOfClass(lp,"PlayerGui")
local mouse=insGet(lp,"GetMouse")(lp)
local rst=insGet(plrs,"RespawnTime")+0.07 --1/15
local preanimation=insGet(rus,"PreAnimation")
local heartbeat=insGet(rus,"Heartbeat")
local renderstepped=insGet(rus,"RenderStepped")

local GetPlayers=insGet(plrs,"GetPlayers")
local SetCoreGuiEnabled=insGet(sg,"SetCoreGuiEnabled")
local GetCoreGuiEnabled=insGet(sg,"GetCoreGuiEnabled")
local Raycast=insGet(ws,"Raycast")
local Connect=heartbeat.Connect
local Disconnect=Connect(GetPropertyChangedSignal(game,"CreatorId"),type).Disconnect
local Wait=heartbeat.Wait
local GetMouseLocation=insGet(uis,"GetMouseLocation")
local GetFocusedTextBox=insGet(uis,"GetFocusedTextBox")
local GetMouseDelta=insGet(uis,"GetMouseDelta")
local IsMouseButtonPressed=insGet(uis,"IsMouseButtonPressed")
local IsKeyDown=insGet(uis,"IsKeyDown")

local Inverse=cfGet(cf_0,"Inverse")
local Lerp=cfGet(cf_0,"Lerp")



local guiTheme = {
	guiTitle = "PatchMallek V1.1",
	windowTitleColor = Color3.fromRGB(0, 180, 255),    -- Vibrant cyan/cerulean
	windowTopColor = Color3.fromRGB(15, 20, 35),       -- Very dark navy blue-gray
	windowBottomColor = Color3.fromRGB(25, 35, 60),    -- Deep indigo
	windowMinimizedSize = {X = 190, Y = 22},
	windowRegularSize = {X = 190, Y = 290},
	buttonsTextColor = Color3.fromRGB(0, 210, 255),   -- Bright neon cyan for interactive text
	labelsTextColor = Color3.fromRGB(200, 210, 225),   -- Soft, light silver-blue for readability
	listTopColor = Color3.fromRGB(20, 25, 40),         -- Dark background for lists
	listBottomColor = Color3.fromRGB(10, 12, 20)       -- Even darker navy for a subtle gradient
}



local accessorylimbs={
	--mine

-- HAMMER HEAD
	{meshid="105263225400272",textureid="111402858657243",C0=cf(0,0,0)*angles(0,0,1.5707963267948966),Name="Left Arm"},
	{meshid="105263225400272",textureid="111402858657243",C0=cf(0,0,0)*angles(0,0,1.5707963267948966),Name="Right Arm"},
-- LEGS
	{meshid="83395427313429",textureid="97148121718581",C0=angles(1.5707963267948966,0,1.5707963267948966),Name="Left Leg"},
	{meshid="83395427313429",textureid="97148121718581",C0=angles(-1.5707963267948966,0,1.5707963267948966),Name="Right Leg"},
--torso
	{meshid="139792224823925",textureid="",C0=cf_0,Name="Torso"},


-- MY OWN LUAU GUY

-- amrs HEAD
	{meshid="76059801901084",textureid="",C0=cf(0,0,0)*angles(0,0,0),Name="Left Arm"},
	{meshid="132748707398327",textureid="",C0=cf(0,0,0)*angles(0,0,0),Name="Right Arm"},
-- LEGS
	{meshid="84777896657115",textureid="",C0=angles(0,0,0),Name="Left Leg"},
	{meshid="81655461281844",textureid="",C0=angles(0,0,0),Name="Right Leg"},
--torso
	{meshid="140136825709676",textureid="",C0=cf_0,Name="Torso"},


-- red dude
	{meshid="95431948173296",textureid="",C0=cf(0,0,0)*angles(0,0,0),Name="Left Arm"},
	{meshid="102501811981637",textureid="",C0=cf(0,0,0)*angles(0,0,0),Name="Right Arm"},
-- LEGS
	{meshid="134328437974880",textureid="",C0=angles(0,0,0),Name="Left Leg"},
	{meshid="113603365099136",textureid="",C0=angles(0,0,0),Name="Right Leg"},
--torso
	{meshid="121342720235244",textureid="",C0=cf_0,Name="Torso"},


-- greeb dude
	{meshid="119465281752182",textureid="",C0=cf(0,0,0)*angles(0,0,0),Name="Left Arm"},
	{meshid="94765532803281",textureid="",C0=cf(0,0,0)*angles(0,0,0),Name="Right Arm"},
-- LEGS
	{meshid="103235686024347",textureid="",C0=angles(0,0,0),Name="Left Leg"},
	{meshid="80187894108602",textureid="",C0=angles(0,0,0),Name="Right Leg"},
--torso
	{meshid="80519708242308",textureid="",C0=cf_0,Name="Torso"},


}

--querydescendants faster than getchildren and checks in lua
local timeQueryDescendants=function(p,s,t)
	t=osclock()+t
	local refresh=true
	local con=Connect(insGet(p,"DescendantAdded"),function()
		refresh=true
	end)
	local res=nil
	repeat
		if refresh then
			res=QueryDescendants(p,s)
			if next(res) then
				--not using break to have one less jump opcode
				Disconnect(con)
				return res
			end
			refresh=false
		end
		Wait(preanimation)
	until (osclock()>t)
	Disconnect(con)
	return res
end
local makeplaceholder=function(v)
	if not insGet(v,"Archivable") then
		insSet(v,"Archivable",true)
	end
	v=Clone(v)
	local mesh=FindFirstChildOfClass(v,"SpecialMesh")
	if mesh then
		insSet(mesh,"Parent",nil)
		ClearAllChildren(v)
		ClearAllChildren(mesh)
		insSet(mesh,"Name",rs())
		insSet(mesh,"Parent",v)
	else
		ClearAllChildren(v)
	end
	insSet(v,"Name",rs())
	insSet(v,"Anchored",true)
	insSet(v,"CanCollide",false)
	insSet(v,"Transparency",0.25)
	return v
end
local emptyfunction=function() end

local i1=i("Frame") 
local i2=i("Frame") 
local i3=i("Frame") 
local i4=i("ScrollingFrame") 
local i5=i("UIListLayout") 
local i6=i("UIGradient") 
local i7=i("TextBox") 
local i8=i("TextButton") 
local i9=i("UIGradient") 
local i10=i("ScreenGui") 
insSet(i1,"AnchorPoint",v2(0.5,0))
insSet(i1,"Active",true)
insSet(i1,"BorderSizePixel",0)
insSet(i1,"ClipsDescendants",true)
insSet(i1,"Position",u2(0.5,0,0.5,guiTheme.windowRegularSize.Y/-2))
insSet(i1,"Size",u2(0,guiTheme.windowRegularSize.X,0,guiTheme.windowRegularSize.Y))
insSet(i1,"Name",rs())
insSet(i1,"Parent",i10)
insSet(i2,"BackgroundColor3",c3(1,1,1))
insSet(i2,"BorderSizePixel",0)
insSet(i2,"Size",u2(0,guiTheme.windowRegularSize.X,0,guiTheme.windowRegularSize.Y))
insSet(i2,"Name",rs())
insSet(i2,"Parent",i1)
insSet(i3,"BackgroundColor3",c3(1,1,1))
insSet(i3,"BorderSizePixel",0)
insSet(i3,"Position",u2(0,5,0,guiTheme.windowMinimizedSize.Y-2))
insSet(i3,"Size",u2(1,-10,0,guiTheme.windowRegularSize.Y-guiTheme.windowMinimizedSize.Y-3))
insSet(i3,"Name",rs())
insSet(i3,"Parent",i2)
insSet(i4,"Active",true)
insSet(i4,"BackgroundTransparency",1)
insSet(i4,"BorderSizePixel",0)
insSet(i4,"Size",u2(1,-3,1,0))
insSet(i4,"AutomaticCanvasSize",e.AutomaticSize.Y)
insSet(i4,"CanvasSize",u2(0,0,0,0))
insSet(i4,"ScrollBarThickness",7)
insSet(i4,"Name",rs())
insSet(i4,"Parent",i3)
insSet(i5,"Name",rs())
insSet(i5,"Parent",i4)
insSet(i5,"SortOrder",e.SortOrder.LayoutOrder)
insSet(i6,"Name",rs())
insSet(i6,"Parent",i3)
insSet(i6,"Color",cs({csk(0,guiTheme.listTopColor),csk(1,guiTheme.listBottomColor)}))
insSet(i6,"Rotation",90)
insSet(i7,"Font",e.Font.SourceSans)
insSet(i7,"FontSize",e.FontSize.Size18)
insSet(i7,"ClearTextOnFocus",false)
insSet(i7,"Text",guiTheme.guiTitle)
insSet(i7,"TextColor3",guiTheme.windowTitleColor)
insSet(i7,"TextSize",16)
insSet(i7,"AnchorPoint",v2(0.5,0))
insSet(i7,"BackgroundTransparency",1)
insSet(i7,"Position",u2(0.5,0,0,guiTheme.windowMinimizedSize.Y/2))
insSet(i7,"Name",rs())
insSet(i7,"Parent",i2)
insSet(i8,"AnchorPoint",v2(1,0))
insSet(i8,"BackgroundTransparency",1)
insSet(i8,"Position",u2(1,0,0,0))
insSet(i8,"Size",u2(0,40,0,guiTheme.windowMinimizedSize.Y))
insSet(i8,"Name",rs())
insSet(i8,"Parent",i2)
insSet(i8,"Font",e.Font.SourceSans)
insSet(i8,"FontSize",e.FontSize.Size18)
insSet(i8,"Text","-")
insSet(i8,"TextColor3",c3(1,1,1))
insSet(i8,"TextSize",16)
insSet(i9,"Name",rs())
insSet(i9,"Parent",i2)
insSet(i9,"Color",cs({csk(0,guiTheme.windowTopColor),csk(1,guiTheme.windowBottomColor)}))
insSet(i9,"Rotation",90)
insSet(i10,"ZIndexBehavior",e.ZIndexBehavior.Sibling)
insSet(i10,"IgnoreGuiInset",true)
insSet(i10,"ResetOnSpawn",false)
insSet(i10,"DisplayOrder",2147483647)
insSet(i10,"Name",rs())
local guimin=false
local minloop=false
local i1X=guiTheme.windowRegularSize.X
local i1Y=guiTheme.windowRegularSize.Y
local i1Xdest=i1X
local i1Ydest=i1Y
Connect(insGet(i8,"MouseButton1Click"),function()
	guimin = not guimin
	if guimin then
		i1Xdest=guiTheme.windowMinimizedSize.X
		i1Ydest=guiTheme.windowMinimizedSize.Y
	else
		i1Xdest=guiTheme.windowRegularSize.X
		i1Ydest=guiTheme.windowRegularSize.Y
	end
	if minloop then
		return
	end
	minloop=true
	insSet(i3,"Visible",true) 
	sine=osclock()
	local lastsine=sine
	while true do
		sine=osclock()
		local deltaTime=(sine-lastsine)*10
		lastsine=sine
		local difX=i1Xdest-i1X
		local difY=i1Ydest-i1Y
		if (abs(difY)<=1) and (abs(difX)<=1) then
			i1X=i1Xdest
			i1Y=i1Ydest
			insSet(i1,"Size",u2(0,i1X,0,i1Y))
			insSet(i3,"Visible",not guimin) 
			minloop=false
			return
		end
		i1X=i1X+difX*deltaTime
		i1Y=i1Y+difY*deltaTime
		insSet(i1,"Size",u2(0,i1X,0,i1Y))
		twait()
	end
	insSet(i3,"Visible",not guimin) 
	minloop=false
end)
local Draggable=function(window,obj)
	local MB1enum = e.UserInputType.MouseButton1
	local TOUCHenum = e.UserInputType.Touch
	obj = obj or window
	local activeEntered = 0
	local mouseStart = nil
	local dragStart = nil
	local inputbegancon = nil
	local rendersteppedcon = nil
	local inputendedcon = nil
	local inputendedf=function(a)
		a=insGet(a,"UserInputType")
		if (a==MB1enum) or (a==TOUCHenum) then
			Disconnect(rendersteppedcon)
			Disconnect(inputendedcon)
		end
	end
	local rendersteppedf=function()
		local off = GetMouseLocation(uis)-mouseStart
		insSet(window,"Position",dragStart+u2(0,v2Get(off,"X"),0,v2Get(off,"Y")))
	end
	local inputbeganf=function(a)
		a=insGet(a,"UserInputType")
		if ((a==MB1enum) or (a==TOUCHenum)) and (activeEntered==0) and not GetFocusedTextBox(uis) then
			mouseStart=GetMouseLocation(uis)
			dragStart=insGet(window,"Position")
			if rendersteppedcon then Disconnect(rendersteppedcon) end
			rendersteppedcon = Connect(renderstepped,rendersteppedf)
			if inputendedcon then Disconnect(inputendedcon) end
			inputendedcon = Connect(insGet(uis,"InputEnded"),inputendedf)
		end
	end
	Connect(insGet(obj,"MouseEnter"),function()
		if inputbegancon then Disconnect(inputbegancon) end
		inputbegancon = Connect(insGet(uis,"InputBegan"),inputbeganf)
	end)
	Connect(insGet(obj,"MouseLeave"),function()
		Disconnect(inputbegancon)
	end)
	local ondes=function(d)
		if IsA(d,"GuiObject") then
			local thisEntered = false
			local thisAdded = false
			local con0 = Connect(insGet(d,"MouseEnter"),function()
				thisEntered = true
				if (not thisAdded) and insGet(d,"Active") then
					activeEntered = activeEntered + 1
					thisAdded = true
				end
			end)
			local con1 = Connect(insGet(d,"MouseLeave"),function()
				thisEntered = false
				if thisAdded then
					activeEntered = activeEntered - 1
					thisAdded = false
				end
			end)
			local con2 = Connect(GetPropertyChangedSignal(d,"Active"),function()
				if thisEntered then
					if thisAdded and not insGet(d,"Active") then
						activeEntered = activeEntered - 1
						thisAdded = false
					elseif insGet(d,"Active") and not thisAdded then
						activeEntered = activeEntered + 1
						thisAdded = true
					end
				end
			end)
			local con3 = nil
			con3 = Connect(insGet(d,"AncestryChanged"),function()
				if not IsDescendantOf(d,window) then
					if thisAdded then
						activeEntered = activeEntered - 1
					end
					Disconnect(con0)
					Disconnect(con1)
					Disconnect(con2)
					Disconnect(con3)
				end
			end)
		end
	end
	Connect(insGet(window,"DescendantAdded"),ondes)
	for i,v in next,QueryDescendants(window,"GuiObject") do 
		ondes(v)
	end
end
local btn=function(txt, f)
	local i1=i("TextBox") 
	local i2=i("TextButton")
	insSet(i1,"Font",e.Font.SourceSans)
	insSet(i1,"FontSize",e.FontSize.Size14)
	insSet(i1,"Text",txt)
	insSet(i1,"ClearTextOnFocus",false)
	insSet(i1,"Position",u2(0.5,0,0.5,0))
	insSet(i1,"TextColor3",guiTheme.buttonsTextColor)
	insSet(i1,"Name",rs())
	insSet(i1,"Parent",i2)
	insSet(i2,"BackgroundTransparency",1)
	insSet(i2,"TextTransparency",1)
	insSet(i2,"Size",u2(1,0,0,14))
	insSet(i2,"Name",rs())
	if f then 
		Connect(insGet(i2,"MouseButton1Click"),f) 
	end 
	insSet(i2,"Parent",i4)
	return i1
end
local lbl=function(txt)
	local i1=i("TextBox") 
	local i2=i("Frame") 
	insSet(i1,"Font",e.Font.SourceSans)
	insSet(i1,"FontSize",e.FontSize.Size14)
	insSet(i1,"Text",txt)
	insSet(i1,"ClearTextOnFocus",false)
	insSet(i1,"TextColor3",guiTheme.labelsTextColor)
	insSet(i1,"Position",u2(0.5,0,0.5))
	insSet(i1,"BackgroundTransparency",1)
	insSet(i1,"Name",rs())
	insSet(i1,"Parent",i2)
	insSet(i2,"Size",u2(1,0,0,14))
	insSet(i2,"BackgroundTransparency",1)
	insSet(i2,"Name",rs())
	insSet(i2,"Parent",i4)
	return i1
end
local swtc=function(txt,options,onchanged)
	local current=0
	local swtcbtn=nil
	local btnpressed=function()
		current=current+1
		if current>#options then
			current=1
		end
		local option=options[current]
		insSet(swtcbtn,"Text",txt..": "..option.text)
		onchanged(option.value)
	end
	swtcbtn=btn(txt,btnpressed)
	btnpressed()
	return swtcbtn
end

Draggable(i1)

lbl("Lerps By Teed")
lbl("discord.gg/8tWdcPmPKS")

local allowshiftlock=nil
local ctrltp=nil
local placeholders=nil
local clickfling=nil
local highlightflingtargets=nil
local discharscripts=nil
local flingchangestate=nil
local respawntp=nil
local breakjointsmethod=nil
local simrad=false
local hidedeatheffect=nil

local c=nil
local cons={}
local cframes={}
local charcons={}
local flingtable={}
local onnewcamera=nil
local stopreanimate=function() 
    playSoundById(138984273283659, workspace)
	if c then
		c=nil
		for i,v in next,cframes do
			local p=i.v
			if p then
				Destroy(p)
			end
		end
		tclear(cframes)
		for i,v in next,flingtable do
			if v then --it could be false
				Destroy(v)
			end
		end
		tclear(flingtable)
		for i,v in next,charcons do
			Disconnect(v)
		end
		tclear(charcons)
		for i,v in next,cons do
			Disconnect(v)
		end
		tclear(cons)
		insSet(uis,"MouseBehavior",enumMD)
		onnewcamera()
		return true
	end
	return false
end
local reanimate=function()
	--[[
		FDless reanimate by MyWorld continued by rqz
		optimize the optimized
	]]

	local novoid = true --prevents parts from going under workspace.FallenPartsDestroyHeight if you control them
	local speedlimit = 3000 --makes your parts move slower if the magnitude of their velocity is higher than this
	local retVelTime = 0.51 --time that claimed parts have velocity to reclaim in case u lose them
	local walkSpeed = 16 --your walkspeed (can be changed at runtime)
	local jumpPower = 50 --your jump power (can be changed at runtime)
	local gravity = 196.2 --how fast the characters velocity decreases while falling (can be changed at runtime)
	local ctrlclicktp = ctrltp --makes you teleport where u point ur mouse cursor at when click and hold ctrl down
	local clickfling = clickfling --makes you fling the person you clicked when its available to do so
	local flingvel = v3(15000,16000,15000) --the rotation velocity that ur character will have while flinging

	if stopreanimate() then return end
	c=insGet(lp,"Character")
	if not (c and IsDescendantOf(c,ws)) then return end

	local rootpart=QueryDescendants(c,">BasePart#HumanoidRootPart")[1] or QueryDescendants(c,">BasePart#Torso")[1] or QueryDescendants(c,">BasePart#UpperTorso")[1] or timeQueryDescendants(c,">BasePart#HumanoidRootPart",10)[1] or (c and FindFirstChildWhichIsA(c,"BasePart"))
	if not rootpart then return end

	local cam=nil
	--theres a way to have ws.currentcamera nil on heartbeat and still have the game run normally
	local refcam=function()
		local newcam=insGet(ws,"CurrentCamera")
		while not newcam do
			Wait(GetPropertyChangedSignal(ws,"CurrentCamera"))
			newcam=insGet(ws,"CurrentCamera")
		end
		cam=newcam
	end
	refcam()
	local camcf=insGet(cam,"CFrame")
	local enumCamS=e.CameraType.Scriptable
	local camt=insGet(cam,"CameraType")
	local camcon0=nil
	local camcon1=nil
	local camcon2=nil
	onnewcamera=function()
		refcam()
		if camcon0 then 
			Disconnect(camcon0)
			Disconnect(camcon1)
			camcon0=nil
		end
		if not c then 
			if insGet(cam,"CameraType")==enumCamS then
				insSet(cam,"CameraType",camt)
			end
			return Disconnect(camcon2) 
		end
		camcon0=Connect(GetPropertyChangedSignal(cam,"CFrame"),function()
			if insGet(cam,"CFrame")~=camcf then
				insSet(cam,"CFrame",camcf)
			end
		end)
		camcon1=Connect(GetPropertyChangedSignal(cam,"CameraType"),function()
			if insGet(cam,"CameraType")~=enumCamS then
				insSet(cam,"CameraType",enumCamS)
			end
		end)
		if insGet(cam,"CameraType")~=enumCamS then
			insSet(cam,"CameraType",enumCamS)
		end
		if insGet(cam,"CFrame")~=camcf then
			insSet(cam,"CFrame",camcf)
		end
	end
	camcon2=Connect(GetPropertyChangedSignal(ws,"CurrentCamera"),onnewcamera)
	onnewcamera()

	local velYdelta=insGet(ws,"Gravity")*0.025
	Connect(GetPropertyChangedSignal(ws,"Gravity"),function()
		velYdelta=insGet(ws,"Gravity")*0.025
	end)

	local fpdh=insGet(ws,"FallenPartsDestroyHeight")
	novoid=novoid and (fpdh+1)

	local Yvel=0
	local cfr=insGet(rootpart,"CFrame")
	local pos=cfGet(cfr,"Position")
	cfr=cfl(pos,pos+cfGet(cfr,"LookVector")*v3_101)
	local primarypart=nil
	local shiftlock=false
	local firstperson=false
	local xzvel=v3_0
	local v3_0150=v3_010*1.5
	local camcfLV=cfGet(camcf,"LookVector")
	local camrot=cfl(v3_0,camcfLV)
	local camrotX,camrotY=camrot:ToEulerAnglesYXZ()
	local camcfRV=cfGet(camrot,"RightVector")
	local cammag=-vmagnitude((cfGet(camcf,"Position")-(pos+v3_0150)))

	local R6parts={ 
		head={Name="Head"},
		torso={Name="Torso"},
		root={Name="HumanoidRootPart"},
		leftArm={Name="Left Arm"},
		rightArm={Name="Right Arm"},
		leftLeg={Name="Left Leg"},
		rightLeg={Name="Right Leg"}
	}
	rootpart=R6parts.root
	for i,v in next,R6parts do
		cframes[v]=cfr
	end
	local joints={
		{
			Name="Neck",
			Part0=R6parts.torso,Part1=R6parts.head,
			C0=cf(0,1,0,-1,0,0,0,0,1,0,1,-0),
			C1=cf(0,-0.5,0,-1,0,0,0,0,1,0,1,-0)
		},
		{
			Name="RootJoint",
			Part0=rootpart,Part1=R6parts.torso,
			C0=cf(0,0,0,-1,0,0,0,0,1,0,1,-0),
			C1=cf(0,0,0,-1,0,0,0,0,1,0,1,-0)
		},
		{
			Name="Right Shoulder",
			Part0=R6parts.torso,Part1=R6parts.rightArm,
			C0=cf(1,0.5,0,0,0,1,0,1,-0,-1,0,0),
			C1=cf(-0.5,0.5,0,0,0,1,0,1,-0,-1,0,0)
		},
		{
			Name="Left Shoulder",
			Part0=R6parts.torso,Part1=R6parts.leftArm,
			C0=cf(-1,0.5,0,0,0,-1,0,1,0,1,0,0),
			C1=cf(0.5,0.5,0,0,0,-1,0,1,0,1,0,0)
		},
		{
			Name="Right Hip",
			Part0=R6parts.torso,Part1=R6parts.rightLeg,
			C0=cf(1,-1,0,0,0,1,0,1,-0,-1,0,0),
			C1=cf(0.5,1,0,0,0,1,0,1,-0,-1,0,0)
		},
		{
			Name="Left Hip",
			Part0=R6parts.torso,Part1=R6parts.leftLeg,
			C0=cf(-1,-1,0,0,0,-1,0,1,0,1,0,0),
			C1=cf(-0.5,1,0,0,0,-1,0,1,0,1,0,0)
		}
	}

	local refreshedjoints={}
	local refreshjointsI=nil
	refreshjointsI=function(part)
		refreshedjoints[part]=true
		for i,v in next,joints do
			local part0=v.Part0
			local part1=v.Part1
			if part1 and (part0==part) then
				cframes[part1]=cfMul(cframes[part],cfMul(v.C0,Inverse(v.C1)))
				if not refreshedjoints[part1] then
					refreshjointsI(part1)
				end
			elseif part0 and (part1==part) then
				cframes[part0]=cfMul(cframes[part],cfMul(v.C1,Inverse(v.C0)))
				if not refreshedjoints[part0] then
					refreshjointsI(part0)
				end
			end
		end
	end
	refreshjointsI(rootpart)
	tclear(refreshedjoints)

	local attachments={
		RightShoulderAttachment={R6parts.rightArm,cf(0,1,0,1,0,0,0,1,0,0,0,1)},
		RightGripAttachment={R6parts.rightArm,cf(0,-1,0,1,0,0,0,1,0,0,0,1)},
		LeftFootAttachment={R6parts.leftLeg,cf(0,-1,0,1,0,0,0,1,0,0,0,1)},
		LeftShoulderAttachment={R6parts.leftArm,cf(0,1,0,1,0,0,0,1,0,0,0,1)},
		LeftGripAttachment={R6parts.leftArm,cf(0,-1,0,1,0,0,0,1,0,0,0,1)},
		RootAttachment={rootpart,cf(0,0,0,1,0,0,0,1,0,0,0,1)},
		RightFootAttachment={R6parts.rightLeg,cf(0,-1,0,1,0,0,0,1,0,0,0,1)},
		NeckAttachment={R6parts.torso,cf(0,1,0,1,0,0,0,1,0,0,0,1)},
		BodyFrontAttachment={R6parts.torso,cf(0,0,-0.5,1,0,0,0,1,0,0,0,1)},
		BodyBackAttachment={R6parts.torso,cf(0,0,0.5,1,0,0,0,1,0,0,0,1)},
		LeftCollarAttachment={R6parts.torso,cf(-1,1,0,1,0,0,0,1,0,0,0,1)},
		RightCollarAttachment={R6parts.torso,cf(1,1,0,1,0,0,0,1,0,0,0,1)},
		WaistFrontAttachment={R6parts.torso,cf(0,-1,-0.5,1,0,0,0,1,0,0,0,1)},
		WaistCenterAttachment={R6parts.torso,cf(0,-1,0,1,0,0,0,1,0,0,0,1)},
		WaistBackAttachment={R6parts.torso,cf(0,-1,0.5,1,0,0,0,1,0,0,0,1)},
		HairAttachment={R6parts.head,cf(0,0.6,0,1,0,0,0,1,0,0,0,1)},
		HatAttachment={R6parts.head,cf(0,0.6,0,1,0,0,0,1,0,0,0,1)},
		FaceFrontAttachment={R6parts.head,cf(0,0,-0.6,1,0,0,0,1,0,0,0,1)},
		FaceCenterAttachment={R6parts.head,cf(0,0,0,1,0,0,0,1,0,0,0,1)}
	}

	local getPart=function(name,blacklist)
		if blacklist then
			for i,v in next,cframes do
				if (i.Name==name) and not tfind(blacklist,i) then
					return i
				end
			end
		else
			for i,v in next,cframes do
				if i.Name==name then
					return i
				end
			end
		end
		return nil
	end

	local getJoint=function(name)
		for i,v in next,joints do
			if v.Name==name then
				return v
			end
		end
		return {C0=cf_0,C1=cf_0}
	end

	local getPartFromMesh=function(m,t,blacklist)
		if blacklist then
			for v,_ in next,cframes do
				if v.m and (not tfind(blacklist,v)) and sfind(v.m,m) and sfind(v.t,t) then
					return v
				end
			end
		else
			for v,_ in next,cframes do
				if v.m and sfind(v.m,m) and sfind(v.t,t) then
					return v
				end
			end
		end
		local p={m=m,t=t}
		cframes[p]=cfr
		local j={C0=cf_0,C1=cf_0,Part0=p}
		p.j=j
		return p
	end

	local getPartJoint=function(p)
		if cframes[p] then
			local j=p.j
			if j then
				return j
			end
			for i,v in next,joints do
				if v.Part0==p then
					return v
				end
			end
			for i,v in next,joints do
				if v.Part1==p then
					return v
				end
			end
		end
		return nil
	end

	local getAccWeldFromMesh=function(m,t)
		return getPartJoint(getPartFromMesh(m,t))
	end

	local raycastparams=rp()
	raycastparams.FilterType=e.RaycastFilterType.Exclude
	raycastparams.RespectCanCollide=true
	local rayfilter={}
	local characters={}
	local refreshrayfilter=function()
		tclear(rayfilter)
		for i,v in next,characters do
			tinsert(rayfilter,v)
		end
		raycastparams.FilterDescendantsInstances=rayfilter
	end
	local rootparts={}
	for i,v in next,accessorylimbs do
		v.p=getPart(v.Name)
	end
	local makePartCons=function(p,t)
		if (t.p==p) and insGet(p,"Anchored") then
			t.p=nil
		end
		local con0=Connect(GetPropertyChangedSignal(p,"Anchored"),function()
			if insGet(p,"Anchored") then
				if t.p==p then
					t.c=nil
					t.p=nil
				end
			elseif not t.p then
				t.p=p
			end
		end)
		local con1=nil
		con1=Connect(insGet(p,"AncestryChanged"),function()
			if not IsDescendantOf(p,ws) then
				Disconnect(con0)
				Disconnect(con1)
				if t.p==p then
					t.p=nil
				end
			end
		end)
	end
	local ondes=function(v)
		if IsA(v,"Attachment") then
			local v1=attachments[insGet(v,"Name")]
			if v1 then
				local p=insGet(v,"Parent")
				if insGet(p,"Parent")~=c then
					local meshid=nil
					local textureid=nil
					if IsA(p,"MeshPart") then
						meshid=insGet(p,"MeshId")
						textureid=insGet(p,"TextureID")
					elseif IsA(p,"BasePart") then
						local sm=FindFirstChildOfClass(p,"SpecialMesh")
						if sm then
							meshid=insGet(sm,"MeshId")
							textureid=insGet(sm,"TextureId")
						else
							return
						end
					else
						return
					end
					for i,_ in next,cframes do
						if (meshid==i.m) and (textureid==i.t) then
							local p1=i.p
							if p1 then
								if p1==p then
									return
								end
							else
								i.p=p
								makePartCons(p,i)
								return
							end
						else
							local j=i.j
							if j and sfind(meshid,i.m) and sfind(textureid,i.t) then
								i.m=meshid
								i.t=textureid
								i.l=insGet(p,"Position")
								i.p=p
								makePartCons(p,i)
								i.j=nil
								i.Name=insGet(p,"Name")
								j.C0=insGet(v,"CFrame")
								j.C1=v1[2]
								j.Part1=v1[1]
								tinsert(joints,j)
								return
							end
						end
					end
					for i,l in next,accessorylimbs do
						if l.p and sfind(meshid,l.meshid) and sfind(textureid,l.textureid) then
							local t={Name=insGet(p,"Name"),l=insGet(p,"Position"),m=meshid,t=textureid,p=p}
							makePartCons(p,t)
							if placeholders then
								t.v=makeplaceholder(p)
								t.b=false
							end
							cframes[t]=insGet(p,"CFrame")
							tinsert(joints,{Part0=t,Part1=l.p,C0=l.C0,C1=cf_0})
							l.p=nil
							return
						end
					end
					local t={Name=insGet(p,"Name"),l=insGet(p,"Position"),m=meshid,t=textureid,p=p}
					makePartCons(p,t)
					if placeholders then
						t.v=makeplaceholder(p)
						t.b=false
					end
					cframes[t]=insGet(p,"CFrame")
					tinsert(joints,{Part0=t,Part1=v1[1],C0=insGet(v,"CFrame"),C1=v1[2]})
				end
			end
		end
	end

	local simradv=0
	local enumH=e.CoreGuiType.Health
	local onplayer=function(v)
		simradv=simradv+1000
		local islp=v==lp
		local lastc=nil
		local oncharacter=function()
			local newc=insGet(v,"Character")
			if newc and (newc~=lastc) then
				lastc=newc
				characters[v]=newc
				refreshrayfilter()
				if islp then
					if discharscripts then
						Connect(insGet(newc,"DescendantAdded"),discharscripts)
						for i,v in next,QueryDescendants(newc,"Script") do
							insSet(v,"Disabled",true)
						end
					end
					local hrp=timeQueryDescendants(newc,">BasePart#HumanoidRootPart",10)[1]
					if not (hrp and c and IsDescendantOf(newc,ws)) then return end
					c=newc
					local fi,fv=next(flingtable)
					if fi then
						if flingchangestate==3 then
							local hum=FindFirstChildOfClass(c,"Humanoid")
							if hum then
								insGet(hum,"ChangeState")(hum,e.HumanoidStateType.Physics)
								insGet(hum,"SetStateEnabled")(hum,e.HumanoidStateType.Seated,false)
							end
						elseif flingchangestate==1 then
							local hum=FindFirstChildOfClass(c,"Humanoid")
							if hum then
								insGet(hum,"ChangeState")(hum,e.HumanoidStateType.Physics)
							end
						elseif flingchangestate==2 then
							local hum=FindFirstChildOfClass(c,"Humanoid")
							if hum then
								insGet(hum,"SetStateEnabled")(hum,e.HumanoidStateType.Seated,false)
							end
						end
						for i,v in next,tclone(flingtable) do
							if not c then
								return
							end
							local startpos=insGet(i,"Position")
							local stoptime=sine+3
							while true do
								twait()
								if sine>stoptime then
									break
								end
								if insGet(i,"Anchored") or not IsDescendantOf(i,ws) then
									break
								end
								if vmagnitude(startpos-insGet(i,"Position"))>200 then
									break
								end
								local tcf=cfAdd(insGet(i,"CFrame"),insGet(i,"AssemblyLinearVelocity")*(sin(sine*15)+1))
								if novoid and (cfGet(tcf,"Y")<novoid) then
									tcf=cfAdd(tcf,v3_010*(novoid-cfGet(tcf,"Y")))
								end
								insSet(hrp,"CFrame",tcf)
								insSet(hrp,"AssemblyLinearVelocity",insGet(i,"AssemblyLinearVelocity")*v3_101*75)
								insSet(hrp,"AssemblyAngularVelocity",flingvel)
							end
							if v then
								Destroy(v)
							end
							flingtable[i]=nil
						end
						insSet(hrp,"AssemblyLinearVelocity",v3_0)
						insSet(hrp,"AssemblyAngularVelocity",v3_0)
						insSet(hrp,"CFrame",cfr)
						twait(0.25)
					end
					if respawntp==0 then
						twait()
					elseif respawntp==1 then
						local startpos=pos+v3(mrandom(-32,32),0,mrandom(-32,32))
						local dir=nil
						local poscheck=true
						while poscheck do
							poscheck=false
							for i,v in next,rootparts do
								local diff=(startpos-insGet(v,"Position"))*v3_101
								if vmagnitude(diff)<10 then
									poscheck=true
									dir=dir or (vnormalize(diff)*3)
									startpos=startpos+dir
								end
							end
							local diff=(startpos-pos)*v3_101
							if vmagnitude(diff)<10 then
								poscheck=true
								dir=dir or (vnormalize(diff)*3)
								startpos=startpos+dir
							end
						end
						startpos=cfAdd(cfGet(cfr,"Rotation"),startpos)
						insSet(hrp,"CFrame",startpos)
						insSet(hrp,"AssemblyLinearVelocity",v3_0)
						insSet(hrp,"AssemblyAngularVelocity",v3_0)
						twait(0.25)
					elseif respawntp==2 then
						insSet(hrp,"CFrame",cfAdd(cfr,cfGet(cfr,"RightVector")*3.5-cfGet(cfr,"LookVector")*3.5))
						insSet(hrp,"AssemblyLinearVelocity",v3_0)
						insSet(hrp,"AssemblyAngularVelocity",v3_0)
						twait(0.25)
					elseif respawntp==3 then
						local t=osclock()+0.25
						local startcf=cfAdd(cfMul(cfGet(cfr,"Rotation"),angles(1.5707963267948966,0,0)),pos*v3_101+v3_010*min(fpdh+30,v3Get(pos,"Y")-5))
						while twait() do
							insSet(hrp,"CFrame",startcf)
							insSet(hrp,"AssemblyLinearVelocity",v3_0)
							insSet(hrp,"AssemblyAngularVelocity",v3_0)
							if osclock()>t then
								break
							end
						end
					end
					if newc~=c then
						return
					end
					primarypart=insGet(newc,"PrimaryPart") or hrp
					if hidedeatheffect and GetCoreGuiEnabled(sg,enumH) then
						SetCoreGuiEnabled(sg,enumH,false)
					end
					if breakjointsmethod==4 then
						local h=FindFirstChildOfClass(newc,"Humanoid")
						if h then
							replicatesignal(insGet(h,"ServerBreakJoints"))
						else
							insGet(newc,"BreakJoints")(newc)
						end
					elseif breakjointsmethod==1 then
						insGet(newc,"BreakJoints")(newc)
						local h=FindFirstChildOfClass(newc,"Humanoid")
						if h then
							insSet(h,"Health",0)
						end
					elseif breakjointsmethod==2 then
						local h=FindFirstChildOfClass(newc,"Humanoid")
						if h then
							insSet(h,"Health",0)
						else
							insGet(newc,"BreakJoints")(newc)
						end
					else
						insGet(newc,"BreakJoints")(newc)
					end
					cons.ondes=Connect(insGet(newc,"DescendantAdded"),ondes)
					for i,v in next,QueryDescendants(newc,"Attachment") do
						ondes(v)
					end
				else
					local hrp=timeQueryDescendants(newc,">BasePart#HumanoidRootPart",10)[1]
					if hrp and IsDescendantOf(newc,ws) then
						rootparts[v]=hrp
					end
				end
			end
		end
		charcons[v]=Connect(GetPropertyChangedSignal(v,"Character"),oncharacter)
		oncharacter()
	end
	tinsert(cons,Connect(insGet(plrs,"PlayerRemoving"),function(v)
		simradv=simradv-1000
		local charcon=charcons[v]
		if charcon then
			Disconnect(charcon)
		end
		characters[v]=nil
		rootparts[v]=nil
	end))
	for i,v in next,GetPlayers(plrs) do simradv=simradv+1000 if v~=lp then tspawn(onplayer,v) end end
	tinsert(cons,Connect(insGet(plrs,"PlayerAdded"),onplayer))
	onplayer(lp)
	local setsimrad=emptyfunction
	if simrad then
		setsimrad=function()
			if pcall(insSet,lp,"SimulationRadius",simradv) then
				setsimrad=function()
					insSet(lp,"SimulationRadius",simradv)
				end
			else
				setsimrad=emptyfunction
			end
		end
	end

	local mradN05=-0.008726646259971648
	local pi2=math.pi/2-0.0001
	local npi2=-pi2
	local KeyCode=e.KeyCode
	local enumYXZ=e.RotationOrder.YXZ
	local enumMB2=e.UserInputType.MouseButton2
	local enumMLCP=e.MouseBehavior.LockCurrentPosition
	local enumMLC=(insGet(uis,"TouchEnabled") and enumMLCP) or e.MouseBehavior.LockCenter 
	local enumMW=e.UserInputType.MouseWheel
	local enumMM=e.UserInputType.MouseMovement

	local mouseBehavior=insGet(uis,"MouseBehavior")
	tinsert(cons,Connect(GetPropertyChangedSignal(uis,"MouseBehavior"),function()
		if insGet(uis,"MouseBehavior")~=mouseBehavior then
			insSet(uis,"MouseBehavior",mouseBehavior)
		end
	end))

	local mode="default"
	local defaultmode={}
	local modes={default=defaultmode}

	local lerpsIdle=emptyfunction
	local lerpsWalk=emptyfunction
	local lerpsJump=emptyfunction
	local lerpsFall=emptyfunction

	local addmode=function(key,mode)
		if (type(key)~="string") or (type(mode)~="table") then
			return
		end
		for i,v in next,mode do
			if type(v)~="function" then
				mode[i]=nil
			end
		end
		if key=="default" then
			defaultmode=mode
			modes.default=mode
			lerpsIdle=mode.idle or emptyfunction
			lerpsWalk=mode.walk or emptyfunction
			lerpsJump=mode.jump or emptyfunction
			lerpsFall=mode.fall or emptyfunction
			if mode.modeEntered then
				mode.modeEntered()
			end
		elseif #key==1 then
			key=KeyCode[supper(ssub(key,1,1))]
			modes[key]=mode
		end
	end

	local keyW=KeyCode.W
	local Wpressed=IsKeyDown(uis,keyW)
	local keyA=KeyCode.A
	local Apressed=IsKeyDown(uis,keyA)
	local keyS=KeyCode.S
	local Spressed=IsKeyDown(uis,keyS)
	local keyD=KeyCode.D
	local Dpressed=IsKeyDown(uis,keyD)
	local keySpace=KeyCode.Space
	local jumpingInput=IsKeyDown(uis,keySpace)

	local FWmovement=0
	local RTmovement=0
	local isWalking=false
	local refreshKeyboardMovement=function()
		if Wpressed then if Spressed then if Dpressed then if Apressed then isWalking=false else FWmovement=0 RTmovement=1 isWalking=true end else if Apressed then FWmovement=0 RTmovement=-1 isWalking=true else isWalking=false end end else FWmovement=1 if Dpressed then if Apressed then RTmovement=0 else RTmovement=1 end else if Apressed then RTmovement=-1 else RTmovement=0 end end isWalking=true end else if Spressed then FWmovement=-1 if Dpressed then if Apressed then RTmovement=0 else RTmovement=1 end else if Apressed then RTmovement=-1 else RTmovement=0 end end isWalking=true else if Dpressed then if Apressed then isWalking=false else FWmovement=0 RTmovement=1 isWalking=true end else if Apressed then FWmovement=0 RTmovement=-1 isWalking=true else isWalking=false end end end end
	end
	refreshKeyboardMovement()

	local keyShift=KeyCode.LeftShift
	tinsert(cons,Connect(insGet(uis,"InputBegan"),function(a)
		if insGet(gs,"MenuIsOpen") or GetFocusedTextBox(uis) then
			return
		end
		a=insGet(a,"KeyCode")
		if a==keyW then
			Wpressed=true
			refreshKeyboardMovement()
		elseif a==keyA then
			Apressed=true
			refreshKeyboardMovement()
		elseif a==keyS then
			Spressed=true
			refreshKeyboardMovement()
		elseif a==keyD then
			Dpressed=true
			refreshKeyboardMovement()
		elseif a==keySpace then
			jumpingInput=true
		elseif a==keyShift then
			shiftlock=allowshiftlock and not shiftlock
		elseif modes[a] then
			local modeLeft=modes[mode].modeLeft
			if modeLeft then
				modeLeft()
			end
			if mode==a then
				mode="default"
			else
				mode=a
			end
			local modet=modes[mode]
			lerpsIdle=modet.idle or defaultmode.idle or emptyfunction
			lerpsWalk=modet.walk or defaultmode.walk or emptyfunction
			lerpsJump=modet.jump or defaultmode.jump or emptyfunction
			lerpsFall=modet.fall or defaultmode.fall or emptyfunction
			if modes[mode].modeEntered then
				modes[mode].modeEntered()
			end
		end
	end))
	tinsert(cons,Connect(insGet(uis,"InputEnded"),function(a)
		a=insGet(a,"KeyCode")
		if a==keyW then
			Wpressed=false
			refreshKeyboardMovement()
		elseif a==keyA then
			Apressed=false
			refreshKeyboardMovement()
		elseif a==keyS then
			Spressed=false
			refreshKeyboardMovement()
		elseif a==keyD then
			Dpressed=false
			refreshKeyboardMovement()
		elseif a==keySpace then
			jumpingInput=false
		end
	end))

	local thumbstickEndX=0
	local thumbstickStartY=0

	local thumbstickSizeMultiplier=0

	local jumpStartX=0
	local jumpStartY=0
	local jumpEndX=0
	local jumpEndY=0

	local thumbstickInputObject=nil
	local jumpInputObject=nil
	local cameraRotateInputObject=nil
	local cameraZoomInputObject=nil

	local thumbstickTouchStart=v3_0
	local cameraZoomInputMagnitude=0

	tinsert(cons,Connect(insGet(uis,"TouchStarted"),function(inputObject)
		if insGet(gs,"MenuIsOpen") or GetFocusedTextBox(uis) then
			return
		end

		local touchPos=insGet(inputObject,"Position")
		local touchX=v3Get(touchPos,"X")
		local touchY=v3Get(touchPos,"Y")

		if (not thumbstickInputObject) and touchX<thumbstickEndX and touchY>thumbstickStartY then
			thumbstickInputObject=inputObject
			thumbstickTouchStart=insGet(inputObject,"Position")
			isWalking=false
		elseif (not jumpInputObject) and touchY>jumpStartY and touchX>jumpStartX and touchX<jumpEndX and touchY<jumpEndY then
			jumpInputObject=inputObject
			jumpingInput=true
		elseif not cameraRotateInputObject then
			cameraRotateInputObject=inputObject
		else
			cameraZoomInputObject=inputObject
			cameraZoomInputMagnitude=vmagnitude(insGet(cameraRotateInputObject,"Position")-insGet(cameraZoomInputObject,"Position"))
		end
	end))
	tinsert(cons,Connect(insGet(uis,"TouchMoved"),function(inputObject)
		local touchPos=insGet(inputObject,"Position")
		local touchX=v3Get(touchPos,"X")
		local touchY=v3Get(touchPos,"Y")
		if inputObject==thumbstickInputObject then
			local direction=insGet(inputObject,"Position")-thumbstickTouchStart
			local directionMag=vmagnitude(direction)/thumbstickSizeMultiplier
			if directionMag>0.05 then
				isWalking=true
				direction=vnormalize(direction)*min(1,(directionMag-0.05)/0.95) 
				FWmovement=-v3Get(direction,"Y")
				RTmovement=v3Get(direction,"X")
			else
				isWalking=false
			end
		elseif inputObject==jumpInputObject then
			jumpingInput=touchY>jumpStartY and touchX>jumpStartX and touchX<jumpEndX and touchY<jumpEndY
		else
			if cameraZoomInputObject then
				local newMagnitude=vmagnitude(insGet(cameraRotateInputObject,"Position")-insGet(cameraZoomInputObject,"Position"))
				cammag=cammag+(newMagnitude-cameraZoomInputMagnitude)*0.04*(0.75-cammag/4)
				cameraZoomInputMagnitude=newMagnitude
				if cammag<0 then
					firstperson=false
				else
					cammag=0
					firstperson=true
				end
			elseif inputObject==cameraRotateInputObject then
				local rotation=GetMouseDelta(uis)
				camrotX=clamp(v2Get(rotation,"Y")*mradN05+camrotX,npi2,pi2)
				camrotY=v2Get(rotation,"X")*mradN05+camrotY
				camrot=angles(camrotX,camrotY,0,enumYXZ)
				camcfLV=cfGet(camrot,"LookVector")
				camcfRV=cfGet(camrot,"RightVector")
			end
		end
	end))
	tinsert(cons,Connect(insGet(uis,"TouchEnded"),function(inputObject)
		if inputObject==thumbstickInputObject then
			thumbstickInputObject=nil
			isWalking=false
		elseif inputObject==jumpInputObject then
			jumpInputObject=nil
			jumpingInput=false
		elseif inputObject==cameraRotateInputObject then
			cameraRotateInputObject=nil
			cameraZoomInputObject=nil
		elseif inputObject==cameraZoomInputObject then
			cameraZoomInputObject=nil
		end
	end))

	local refreshTouchRegions=function()
		local sX=insGet(mouse,"ViewSizeX")
		local sY=insGet(mouse,"ViewSizeY")
		local isSmallScreen=min(sX,sY)<=500

		sY=sY+insGet(gs,"TopbarInset").Height

		thumbstickEndX=sX*0.4
		thumbstickStartY=(sY+0)*0.333

		if isSmallScreen then
			thumbstickSizeMultiplier=35
			jumpStartX=sX-95
			jumpStartY=sY-90
			jumpEndX=jumpStartX+70
			jumpEndY=jumpStartY+70
		else
			thumbstickSizeMultiplier=60
			jumpStartX=sX-170
			jumpStartY=sY-210
			jumpEndX=jumpStartX+120
			jumpEndY=jumpStartY+120
		end
	end
	tinsert(cons,Connect(GetPropertyChangedSignal(mouse,"ViewSizeX"),refreshTouchRegions))
	tinsert(cons,Connect(GetPropertyChangedSignal(mouse,"ViewSizeY"),refreshTouchRegions))
	tinsert(cons,Connect(GetPropertyChangedSignal(gs,"TopbarInset"),refreshTouchRegions))
	refreshTouchRegions()

	local mouseCameraMove=false
	tinsert(cons,Connect(insGet(uis,"InputChanged"),function(a,b)
		if b then return end
		local inputType=insGet(a,"UserInputType")
		if mouseCameraMove and inputType==enumMM then
			local rotation=GetMouseDelta(uis)
			camrotX=clamp(v2Get(rotation,"Y")*mradN05+camrotX,npi2,pi2)
			camrotY=v2Get(rotation,"X")*mradN05+camrotY
			camrot=angles(camrotX,camrotY,0,enumYXZ)
			camcfLV=cfGet(camrot,"LookVector")
			camcfRV=cfGet(camrot,"RightVector")
		elseif inputType==enumMW then
			cammag=cammag+v3Get(insGet(a,"Position"),"Z")*(0.75-cammag/4)
			if cammag<0 then
				firstperson=false
			else
				cammag=0
				firstperson=true
			end
		end
	end))

	local predictionfling=function(target)
		if typeof(target)~="Instance" then 
			target=insGet(mouse,"Target")
			if not target then
				return false
			end
		end
		if not IsDescendantOf(target,ws) then
			return false
		end
		if IsA(target,"BasePart") or IsA(target,"Humanoid") then 
			target=insGet(target,"Parent") 
			if IsA(target,"Accessory") then
				target=insGet(target,"Parent")
			end
		end
		if (not IsA(target,"Model")) or (target==c) then
			return false
		end
		local targetpart=QueryDescendants(target,">BasePart#HumanoidRootPart")[1] or QueryDescendants(target,">BasePart#Torso")[1] or QueryDescendants(target,">BasePart#UpperTorso")[1]
		if (not targetpart) or (flingtable[targetpart]~=nil) then
			return false
		end
		if highlightflingtargets then
			local h=i("Highlight")
			insSet(h,"Name",rs())
			insSet(h,"Adornee",target)
			insSet(h,"OutlineColor",c3(1,0,0))
			insSet(h,"Parent",i10)
			flingtable[targetpart]=h
		else
			flingtable[targetpart]=false
		end
		return true
	end

	if ctrlclicktp then
		ctrlclicktp=KeyCode.LeftControl
		local tpoff=v3_010*3
		if clickfling then
			tinsert(cons,Connect(insGet(mouse,"Button1Down"),function()
				if insGet(mouse,"Target") then
					if IsKeyDown(uis,ctrlclicktp) then
						pos=cfGet(insGet(mouse,"Hit"),"Position")+tpoff
						cfr=cfl(pos,pos+camcfLV*v3_101)
						xzvel=v3_0
						Yvel=0
					else
						predictionfling()
					end
				end
			end))
		else
			tinsert(cons,Connect(insGet(mouse,"Button1Down"),function()
				if insGet(mouse,"Target") and IsKeyDown(uis,ctrlclicktp) then
					pos=cfGet(insGet(mouse,"Hit"),"Position")+tpoff
					cfr=cfl(pos,pos+camcfLV*v3_101)
					xzvel=v3_0
					Yvel=0
				end
			end))
		end
	elseif clickfling then
		tinsert(cons,Connect(insGet(mouse,"Button1Down"),predictionfling))
	end

	local hhOff=3
	local hhOff1=3.01
	local setHipHeight=function(n)
		hhOff=n+3
		hhOff1=n+3.01
	end

	local noYvelTime=1
	local lastsine=sine
	local mainFunction=function()
		sine=osclock()
		local delta=sine-lastsine
		deltaTime=min(delta*10,1)
		lastsine=sine

		if shiftlock then
			if allowshiftlock then
				if mouseBehavior~=enumMLC then
					mouseBehavior=enumMLC
					insSet(uis,"MouseBehavior",mouseBehavior)
				end
				mouseCameraMove=true
			else
				shiftlock=false
			end
		elseif firstperson then
			if mouseBehavior~=enumMLC then
				mouseBehavior=enumMLC
				insSet(uis,"MouseBehavior",mouseBehavior)
			end
			mouseCameraMove=true
		elseif IsMouseButtonPressed(uis,enumMB2) then
			if mouseBehavior~=enumMLCP then
				mouseBehavior=enumMLCP
				insSet(uis,"MouseBehavior",mouseBehavior)
			end
			mouseCameraMove=true
		else
			if mouseBehavior~=enumMD then
				mouseBehavior=enumMD
				insSet(uis,"MouseBehavior",mouseBehavior)
			end
			mouseCameraMove=false
		end

		local raycastresult=Raycast(ws,pos,v3_010*(fpdh-v3Get(pos,"Y")),raycastparams)
		local onground=nil
		if raycastresult then
			onground=raycastresult.Distance<hhOff1
			if onground then
				Yvel=0
				pos=pos+v3_010*(v3Get(raycastresult.Position,"Y")+hhOff-v3Get(pos,"Y"))*min(delta*20,1)
				if jumpingInput and (jumpPower>0) then
					Yvel=jumpPower
					onground=false
				end
			else
				Yvel=Yvel-gravity*delta
				raycastresult=v3Get(raycastresult.Position,"Y")
				if v3Get(pos,"Y")+Yvel*delta<raycastresult then
					Yvel=0
					pos=pos+v3_010*(raycastresult+hhOff-v3Get(pos,"Y"))
				end
			end
		else
			Yvel=0
			onground=false
		end

		if firstperson then
			if isWalking then
				if walkSpeed==0 then
					xzvel=v3_0
					if onground then
						cfr=cfl(pos,pos+camcfLV*v3_101)
						camcf=cfAdd(camrot,pos+v3_0150)
						cframes[rootpart]=cfr
						insSet(cam,"CFrame",camcf)
						lerpsIdle()
						noYvelTime=min(noYvelTime+delta*0.3,1)
						xzvel=xzvel*(1-noYvelTime)
					elseif Yvel>0 then
						pos=pos+v3_010*Yvel*delta
						cfr=cfl(pos,pos+camcfLV*v3_101)
						camcf=cfAdd(camrot,pos+v3_0150)
						cframes[rootpart]=cfr
						insSet(cam,"CFrame",camcf)
						lerpsJump()
						noYvelTime=0
					else
						pos=pos+v3_010*Yvel*delta
						cfr=cfl(pos,pos+camcfLV*v3_101)
						camcf=cfAdd(camrot,pos+v3_0150)
						cframes[rootpart]=cfr
						insSet(cam,"CFrame",camcf)
						lerpsFall()
						noYvelTime=0
					end
				else
					xzvel=vnormalize(vnormalize(camcfLV*v3_101)*FWmovement+vnormalize(camcfRV*v3_101)*RTmovement)*walkSpeed
					if onground then
						pos=pos+xzvel*delta
						cfr=cfl(pos,pos+camcfLV*v3_101)
						camcf=cfAdd(camrot,pos+v3_0150)
						cframes[rootpart]=cfr
						insSet(cam,"CFrame",camcf)
						lerpsWalk()
						noYvelTime=min(noYvelTime+delta*0.3,1)
						xzvel=xzvel*(1-noYvelTime)
					elseif Yvel>0 then
						pos=pos+(xzvel+v3_010*Yvel)*delta
						cfr=cfl(pos,pos+camcfLV*v3_101)
						camcf=cfAdd(camrot,pos+v3_0150)
						cframes[rootpart]=cfr
						insSet(cam,"CFrame",camcf)
						lerpsJump()
						noYvelTime=0
					else 
						pos=pos+(xzvel+v3_010*Yvel)*delta
						cfr=cfl(pos,pos+camcfLV*v3_101)
						camcf=cfAdd(camrot,pos+v3_0150)
						cframes[rootpart]=cfr
						insSet(cam,"CFrame",camcf)
						lerpsFall()
						noYvelTime=0
					end
				end
			else
				xzvel=v3_0
				if onground then
					cfr=cfl(pos,pos+camcfLV*v3_101)
					camcf=cfAdd(camrot,pos+v3_0150)
					cframes[rootpart]=cfr
					insSet(cam,"CFrame",camcf)
					lerpsIdle()
					noYvelTime=min(noYvelTime+delta*0.3,1)
					xzvel=xzvel*(1-noYvelTime)
				elseif Yvel>0 then
					pos=pos+v3_010*Yvel*delta
					cfr=cfl(pos,pos+camcfLV*v3_101)
					camcf=cfAdd(camrot,pos+v3_0150)
					cframes[rootpart]=cfr
					insSet(cam,"CFrame",camcf)
					lerpsJump()
					noYvelTime=0
				else
					pos=pos+v3_010*Yvel*delta
					cfr=cfl(pos,pos+camcfLV*v3_101)
					camcf=cfAdd(camrot,pos+v3_0150)
					cframes[rootpart]=cfr
					insSet(cam,"CFrame",camcf)
					lerpsFall()
					noYvelTime=0
				end
			end
		elseif shiftlock then	
			if isWalking then
				if walkSpeed==0 then
					xzvel=v3_0
					if onground then
						cfr=cfl(pos,pos+camcfLV*v3_101)
						camcf=cfAdd(camrot,pos+v3_0150+camcfRV*1.75+camcfLV*cammag)
						cframes[rootpart]=cfr
						insSet(cam,"CFrame",camcf)
						lerpsIdle()
						noYvelTime=min(noYvelTime+delta*0.3,1)
						xzvel=xzvel*(1-noYvelTime)
					elseif Yvel>0 then
						pos=pos+v3_010*Yvel*delta
						cfr=cfl(pos,pos+camcfLV*v3_101)
						camcf=cfAdd(camrot,pos+v3_0150+camcfRV*1.75+camcfLV*cammag)
						cframes[rootpart]=cfr
						insSet(cam,"CFrame",camcf)
						lerpsJump()
						noYvelTime=0
					else
						pos=pos+v3_010*Yvel*delta
						cfr=cfl(pos,pos+camcfLV*v3_101)
						camcf=cfAdd(camrot,pos+v3_0150+camcfRV*1.75+camcfLV*cammag)
						cframes[rootpart]=cfr
						insSet(cam,"CFrame",camcf)
						lerpsFall()
						noYvelTime=0
					end
				else
					xzvel=vnormalize(vnormalize(camcfLV*v3_101)*FWmovement+vnormalize(camcfRV*v3_101)*RTmovement)*walkSpeed
					if onground then
						pos=pos+xzvel*delta
						cfr=cfl(pos,pos+camcfLV*v3_101)
						camcf=cfAdd(camrot,pos+v3_0150+camcfRV*1.75+camcfLV*cammag)
						cframes[rootpart]=cfr
						insSet(cam,"CFrame",camcf)
						lerpsWalk()
						noYvelTime=min(noYvelTime+delta*0.3,1)
						xzvel=xzvel*(1-noYvelTime)
					elseif Yvel>0 then
						pos=pos+(xzvel+v3_010*Yvel)*delta
						cfr=cfl(pos,pos+camcfLV*v3_101)
						camcf=cfAdd(camrot,pos+v3_0150+camcfRV*1.75+camcfLV*cammag)
						cframes[rootpart]=cfr
						insSet(cam,"CFrame",camcf)
						lerpsJump()
						noYvelTime=0
					else
						pos=pos+(xzvel+v3_010*Yvel)*delta
						cfr=cfl(pos,pos+camcfLV*v3_101)
						camcf=cfAdd(camrot,pos+v3_0150+camcfRV*1.75+camcfLV*cammag)
						cframes[rootpart]=cfr
						insSet(cam,"CFrame",camcf)
						lerpsFall()
						noYvelTime=0
					end
				end
			else
				xzvel=v3_0
				if onground then
					cfr=cfl(pos,pos+camcfLV*v3_101)
					camcf=cfAdd(camrot,pos+v3_0150+camcfRV*1.75+camcfLV*cammag)
					cframes[rootpart]=cfr
					insSet(cam,"CFrame",camcf)
					lerpsIdle()
					noYvelTime=min(noYvelTime+delta*0.3,1)
					xzvel=xzvel*(1-noYvelTime)
				elseif Yvel>0 then
					pos=pos+v3_010*Yvel*delta
					cfr=cfl(pos,pos+camcfLV*v3_101)
					camcf=cfAdd(camrot,pos+v3_0150+camcfRV*1.75+camcfLV*cammag)
					cframes[rootpart]=cfr
					insSet(cam,"CFrame",camcf)
					lerpsJump()
					noYvelTime=0
				else
					pos=pos+v3_010*Yvel*delta
					cfr=cfl(pos,pos+camcfLV*v3_101)
					camcf=cfAdd(camrot,pos+v3_0150+camcfRV*1.75+camcfLV*cammag)
					cframes[rootpart]=cfr
					insSet(cam,"CFrame",camcf)
					lerpsFall()
					noYvelTime=0
				end
			end
		else
			if isWalking then
				if walkSpeed==0 then
					xzvel=v3_0
					if onground then
						cfr=cfAdd(cfGet(cfr,"Rotation"),pos)
						camcf=cfAdd(camrot,pos+v3_0150+camcfLV*cammag)
						cframes[rootpart]=cfr
						insSet(cam,"CFrame",camcf)
						lerpsIdle()
						noYvelTime=min(noYvelTime+delta*0.3,1)
						xzvel=xzvel*(1-noYvelTime)
					elseif Yvel>0 then
						pos=pos+v3_010*Yvel*delta
						cfr=cfAdd(cfGet(cfr,"Rotation"),pos)
						camcf=cfAdd(camrot,pos+v3_0150+camcfLV*cammag)
						cframes[rootpart]=cfr
						insSet(cam,"CFrame",camcf)
						lerpsJump()
						noYvelTime=0
					else
						pos=pos+v3_010*Yvel*delta
						cfr=cfAdd(cfGet(cfr,"Rotation"),pos)
						camcf=cfAdd(camrot,pos+v3_0150+camcfLV*cammag)
						cframes[rootpart]=cfr
						insSet(cam,"CFrame",camcf)
						lerpsFall()
						noYvelTime=0
					end
				else
					xzvel=vnormalize(vnormalize(camcfLV*v3_101)*FWmovement+vnormalize(camcfRV*v3_101)*RTmovement)*walkSpeed
					if onground then
						pos=pos+xzvel*delta
						cfr=cfAdd(Lerp(cfGet(cfr,"Rotation"),cfl(v3_0,xzvel),deltaTime),pos)
						camcf=cfAdd(camrot,pos+v3_0150+camcfLV*cammag)
						cframes[rootpart]=cfr
						insSet(cam,"CFrame",camcf)
						lerpsWalk()
						noYvelTime=min(noYvelTime+delta*0.3,1)
						xzvel=xzvel*(1-noYvelTime)
					elseif Yvel>0 then
						pos=pos+(xzvel+(v3_010*Yvel))*delta
						cfr=cfAdd(Lerp(cfGet(cfr,"Rotation"),cfl(v3_0,xzvel),deltaTime),pos)
						camcf=cfAdd(camrot,pos+v3_0150+camcfLV*cammag)
						cframes[rootpart]=cfr
						insSet(cam,"CFrame",camcf)
						lerpsJump()
						noYvelTime=0
					else
						pos=pos+(xzvel+(v3_010*Yvel))*delta
						cfr=cfAdd(Lerp(cfGet(cfr,"Rotation"),cfl(v3_0,xzvel),deltaTime),pos)
						camcf=cfAdd(camrot,pos+v3_0150+camcfLV*cammag)
						cframes[rootpart]=cfr
						insSet(cam,"CFrame",camcf)
						lerpsFall()
						noYvelTime=0
					end
				end
			else
				xzvel=v3_0
				if onground then
					cfr=cfAdd(cfGet(cfr,"Rotation"),pos)
					camcf=cfAdd(camrot,pos+v3_0150+camcfLV*cammag)
					cframes[rootpart]=cfr
					insSet(cam,"CFrame",camcf)
					lerpsIdle()
					noYvelTime=min(noYvelTime+delta*0.3,1)
					xzvel=xzvel*(1-noYvelTime)
				elseif Yvel>0 then
					pos=pos+v3_010*Yvel*delta
					cfr=cfAdd(cfGet(cfr,"Rotation"),pos)
					camcf=cfAdd(camrot,pos+v3_0150+camcfLV*cammag)
					cframes[rootpart]=cfr
					insSet(cam,"CFrame",camcf)
					lerpsJump()
					noYvelTime=0
				else
					pos=pos+v3_010*Yvel*delta
					cfr=cfAdd(cfGet(cfr,"Rotation"),pos)
					camcf=cfAdd(camrot,pos+v3_0150+camcfLV*cammag)
					cframes[rootpart]=cfr
					insSet(cam,"CFrame",camcf)
					lerpsFall()
					noYvelTime=0
				end
			end
		end

		refreshjointsI(rootpart)
		tclear(refreshedjoints)

		local sine15=sine*15
		local idlerv=v3(sin(sine15),sin(sine15+1.0471975511965976),sin(sine15+2.0943951023931953))
		local idleoff=idlerv*0.003910064697265625 --0.0156402587890625/4

		local claimpos=insGet(primarypart,"Position")
		local claimposY=v3Get(claimpos,"Y")
		for i,v in next,cframes do
			local part=i.p

			if part then
				if insGet(part,"ReceiveAge")==0 then
					local placeholder=i.v
					local vpos=cfGet(v,"Position")
					if novoid and (v3Get(vpos,"Y")<novoid) then
						v=cfAdd(v,v3_010*(novoid-v3Get(vpos,"Y")))
					end
					local lastpos=i.l
					local vel=(vpos-lastpos)/delta
					local mag=vmagnitude(vel)
					if mag<0.11730194091796875 then --0.0156402587890625*15/2
						if placeholder and i.b then
							insSet(placeholder,"Parent",nil)
							i.b=false
						end
						i.l=cfGet(v,"Position")
						v=cfAdd(v,idleoff)
					elseif mag>speedlimit then
						if placeholder then
							insSet(placeholder,"CFrame",v)
							if not i.b then
								insSet(placeholder,"Parent",ws)
								i.b=true
							end
						end
						vel=vnormalize(vel)*speedlimit
						local newpos=lastpos+vel*delta
						v=cfAdd(cfGet(v,"Rotation"),newpos)
						i.l=newpos
					else
						if placeholder and i.b then
							insSet(placeholder,"Parent",nil)
							i.b=false
						end
						i.l=cfGet(v,"Position")
					end
					local claimtime=i.c
					if claimtime then
						if sine-claimtime<retVelTime then
							local Ydiff=cfGet(v,"Y")-claimposY
							local velY=25.01
							local fallingTime=0
							while (Ydiff>0) or (velY>0) do
								fallingTime=fallingTime+0.025
								if fallingTime>0.6 then
									break
								end
								velY=velY-velYdelta
								Ydiff=Ydiff+(velY*0.025)
							end
							insSet(part,"AssemblyLinearVelocity",(claimpos-cfGet(v,"Position"))*v3_101/fallingTime+v3_net)
						else
							local vel1=vel*noYvelTime+xzvel
							if vmagnitude(vel1)>25.01 then
								insSet(part,"AssemblyLinearVelocity",vnormalize(vel1)*v3_xzL+v3_net)
							else
								insSet(part,"AssemblyLinearVelocity",vel1*v3_xz+v3_net)
							end
						end
					else
						i.c=sine
						local vel1=vel*noYvelTime+xzvel
						if vmagnitude(vel1)>25.01 then
							insSet(part,"AssemblyLinearVelocity",vnormalize(vel1)*v3_xzL+v3_net)
						else
							insSet(part,"AssemblyLinearVelocity",vel1*v3_xz+v3_net)
						end
					end
					insSet(part,"CFrame",v)
					insSet(part,"AssemblyAngularVelocity",idlerv)
				else
					i.c=nil
					i.l=insGet(part,"Position")
					local placeholder=i.v
					if placeholder then
						insSet(placeholder,"CFrame",v)
						if not i.b then
							insSet(placeholder,"Parent",ws)
							i.b=true
						end
					end
				end
			else
				local placeholder=i.v
				if placeholder then
					insSet(placeholder,"CFrame",v)
					if not i.b then
						insSet(placeholder,"Parent",ws)
						i.b=true
					end
				end
			end
		end
		setsimrad()
	end

	sine=osclock()
	lastsine=sine
	tinsert(cons,Connect(heartbeat,mainFunction))
	mainFunction()

	local refreshjoints=function(v) --use this on the main part if u have parts that
		refreshjointsI(v) --are connected with each other but arent connected to rootpart
		tclear(refreshedjoints)
	end

	local legcfR=cf(1,-1,0)
	local legcfL=cf(-1,-1,0)
	local raydir=v3_010*-2
	local raycastlegs=function() --this returns 2 values: right leg raycast offset, left leg raycast offset
		local rY=Raycast(ws,cfGet(cfMul(cfr,legcfR),"Position"),raydir,raycastparams)
		local lY=Raycast(ws,cfGet(cfMul(cfr,legcfL),"Position"),raydir,raycastparams)
		if rY then
			if lY then
				return v3Get(rY.Position,"Y")-(v3Get(pos,"Y")-3),v3Get(lY.Position,"Y")-(v3Get(pos,"Y")-3)
			else
				return v3Get(rY.Position,"Y")-(v3Get(pos,"Y")-3),0
			end
		elseif lY then
			return 0,v3Get(lY.Position,"Y")-(v3Get(pos,"Y")-3)
		else
			return 0,0
		end
	end

	local velbycfrvec=function() --this returns 2 values: forward/backwards movement (from -1 to 1), right/left movement (from -1 to 1)
		local fw=cfGet(cfr,"LookVector")*xzvel/walkSpeed
		local rt=cfGet(cfr,"RightVector")*xzvel/walkSpeed
		return v3Get(fw,"X")+v3Get(fw,"Z"),v3Get(rt,"X")+v3Get(rt,"Z")
	end

	local lastvel=v3_0
	local velchg1=v3_0
	local velchgbycfrvec=function() --this returns 2 values: forward/backwards velocity change, right/left velocity change
		velchg1=velchg1+(lastvel-xzvel) --i recommend setting velchg1 to v3_0 when u start using this function or it will look worse
		lastvel=xzvel
		velchg1=velchg1-velchg1*(deltaTime/2)
		local fw=cfGet(cfr,"LookVector")*velchg1/32
		local rt=cfGet(cfr,"RightVector")*velchg1/32
		return v3Get(fw,"X")+v3Get(fw,"Z"),v3Get(rt,"X")+v3Get(rt,"Z")
	end

	local lastYvel=0
	local velYchg1=0
	local velYchg=function() --this returns Y axis velocity change
		velYchg1=clamp(velYchg1+(lastYvel-Yvel),-50,50) --i recommend setting velYchg1 to 0 when u start using this function or it will look worse
		lastYvel=Yvel
		velYchg1=velYchg1-velYchg1*(deltaTime/2)
		return velYchg1
	end

	local rotToMouse=function(alpha) --this rotates ur character towards your mouse hit position
		local pos1=pos*v3_010+cfGet(insGet(mouse,"Hit"),"Position")*v3_101
		if pos~=pos1 then --could make nan rotation
			cfr=Lerp(cfr,cfl(pos,pos1),alpha or deltaTime)
		end
	end

	local glitchJoint=function(joint,targetGlitchTime,delayFrom,delayTo,radiansFrom,radiansTo) 
		if sine>targetGlitchTime then --example usage: local glitchtime=0 addMode("x",{idle=function() glitchtime=glitchJoint(joint,glitchtime,0.2,0.4,-0.1,0.1) end})
			radiansFrom=radiansFrom*100
			radiansTo=radiansTo*100
			joint.C0=cfMul(joint.C0,angles(mrandom(radiansFrom,radiansTo)/100,mrandom(radiansFrom,radiansTo)/100,mrandom(radiansFrom,radiansTo)/100)) 
			return sine+mrandom(delayFrom*100,delayTo*100)/100
		end
		return targetGlitchTime
	end

	local setWalkSpeed=function(n)
		if type(n)~="number" then
			n=16
		end
		walkSpeed=n
	end
	local setJumpPower=function(n)
		if type(n)~="number" then
			n=50
		end
		jumpPower=n
	end
	local setGravity=function(n)
		if type(n)~="number" then
			n=196.2
		end
		gravity=n
	end
	local setCfr=function(v) --sets character cframe
		if typeof(v)=="CFrame" then
			local newpos=cfGet(v,"Position")
			camcf=cfAdd(camcf,newpos-pos)
			insSet(cam,"CFrame",camcf)
			cfr=v
			pos=newpos
		elseif typeof(v)=="Vector3" then
			camcf=cfAdd(camcf,v-pos)
			insSet(cam,"CFrame",camcf)
			cfr=cfAdd(cfGet(cfr,"Rotation"),v)
			pos=v
		end
	end
	local getVel=function() --returns character velocity
		return xzvel+v3_010*Yvel --important: use only in lerps or it might not work
	end
	local getCamCF=function() --returns camera cframe
		return camcf
	end
	local isFirstPerson=function() --returns true if user is in first person camera mode
		return firstperson
	end

	return {
		cframes=cframes,
		joints=joints,
		fling=predictionfling,
		predictionfling=predictionfling,
		refreshjoints=refreshjoints,
		raycastlegs=raycastlegs,
		velbycfrvec=velbycfrvec,
		velchgbycfrvec=velchgbycfrvec,
		velYchg=velYchg,
		addmode=addmode,
		getPart=getPart,
		getPartFromMesh=getPartFromMesh,
		getAccWeldFromMesh=getAccWeldFromMesh,
		getJoint=getJoint,
		getPartJoint=getPartJoint,
		rotToMouse=rotToMouse,
		glitchJoint=glitchJoint,
		setWalkSpeed=setWalkSpeed,
		setJumpPower=setJumpPower,
		setGravity=setGravity,
		setCfr=setCfr,
		getVel=getVel,
		getCamCF=getCamCF,
		isFirstPerson=isFirstPerson,
		setHipHeight=setHipHeight
	}
end

btn("Starless Man V4", function()
    -- 14255556501, ,14255554762, legs, 14768693948, 14768701869, 14255528083, 104498387508889, this is rig btw, sword 5699795428
-- -gh 14255556501, 14255554762, 14768693948, 14768701869, 14255528083, 104498387508889, 5699795428
	local t=reanimate()
	if type(t)~="table" then return end
	local raycastlegs=t.raycastlegs
	local velbycfrvec=t.velbycfrvec
	local addmode=t.addmode
	local getJoint=t.getJoint
	local RootJoint=getJoint("RootJoint")
	local RightShoulder=getJoint("Right Shoulder")
	local LeftShoulder=getJoint("Left Shoulder")
	local RightHip=getJoint("Right Hip")
	local LeftHip=getJoint("Left Hip")
	local Neck=getJoint("Neck")
	local getPart=t.getPart
    t.setWalkSpeed(5)
	local getPartFromMesh=t.getPartFromMesh
    local getPartJoint=t.getPartJoint
    local swordie = getPartFromMesh(5278721954,5692006383)
    local AccessoryWeld = getPartJoint(swordie)
	AccessoryWeld.Part1=getPart("Torso")

	local function ShadeID(ID, Duration)
		local s = Instance.new("Sound")
		s.SoundId = "rbxassetid://" .. ID
		s.Parent = workspace
		s:Play()
		task.wait(Duration)
		s:Destroy()

	end
	tspawn(function() while c do twait() end ShadeID = emptyfunction end)

	local attackAnimation=nil
	mouse.Button1Down:Connect(function()
		if attackAnimation then return end

		attackAnimation=function()
		RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1,0.5,0),angles(0,2.2689280275926285,1.0471975511965976)),deltaTime) 
AccessoryWeld.C0=Lerp(AccessoryWeld.C0,cfMul(cf(0,2,-3.5),angles(0.3490658503988659,4.014257279586958,1.5707963267948966)),deltaTime) 
LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1,0.5,0),angles(0,-1.5707963267948966,0)),deltaTime) 
RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1,-1,0),angles(0.6981317007977318,1.5707963267948966,0)),deltaTime) 
LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-1,0),angles(-0.6981317007977318,-1.5707963267948966,0)),deltaTime) 
Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.5707963267948966,0,2.443460952792061)),deltaTime) 
RootJoint.C0=Lerp(RootJoint.C0,angles(-1.5707963267948966,0,-2.2689280275926285),deltaTime) 
--MW_animatorProgressSave: RightArm,1,0,0,1,0,0,0,1,0.5,0,0,1,130,0,0,1,0,0,0,1,60,0,0,1,RainbowGodSword_Handle,,0,0,1,20,0,0,1,2,0,0,1,230,0,0,1,-3.5,0,0,1,90,0,0,1,LeftArm,-1,0,0,1,0,0,0,1,0.5,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,RightLeg,1,0,0,1,40,,0,1,-1,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1,LeftLeg,-1,0,0,1,-40,0,0,1,-1,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,Head,0,0,0,1,-90,0,0,1,1,0,0,1,0,0,0,1,0,0,0,1,140,0,0,1,Torso,0,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,-130,0,0,1


		end
		task.wait(0.3)
				task.spawn(ShadeID, 131975521115072, 2)
		attackAnimation=function()

RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.4,0.5,0),angles(0.5934119456780721,0,1.5707963267948966)),deltaTime) 
AccessoryWeld.C0=Lerp(AccessoryWeld.C0,cfMul(cf(0,2,-3.5),angles(0.3490658503988659,4.014257279586958,1.5707963267948966)),deltaTime) 
LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1,0.5,0),angles(0,-1.5707963267948966,0)),deltaTime) 
RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1,-1,0),angles(-0.6981317007977318,1.5707963267948966,0)),deltaTime) 
LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-1,0),angles(0.6981317007977318,-1.5707963267948966,0)),deltaTime) 
Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.5707963267948966,0,3.839724354387525)),deltaTime) 
RootJoint.C0=Lerp(RootJoint.C0,angles(-1.5707963267948966,0,-4.1887902047863905),deltaTime) 
--MW_animatorProgressSave: RightArm,1.4,0,0,1,34,0,0,1,0.5,0,0,1,,0,0,1,0,0,0,1,90,0,0,1,RainbowGodSword_Handle,,0,0,1,20,0,0,1,2,0,0,1,230,0,0,1,-3.5,0,0,1,90,0,0,1,LeftArm,-1,0,0,1,0,0,0,1,0.5,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,RightLeg,1,0,0,1,-40,,0,1,-1,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1,LeftLeg,-1,0,0,1,40,0,0,1,-1,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,Head,0,0,0,1,-90,0,0,1,1,0,0,1,0,0,0,1,0,0,0,1,220,0,0,1,Torso,0,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,-240,0,0,1

		end
		task.wait(0.4)
		attackAnimation=nil
	end)
-- normal

	addmode("default", {
		idle = function()
		    t.setWalkSpeed(5)
				AccessoryWeld.Part1=getPart("Torso")
		RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1.05,-1-0.1*sin(sine*5),-0.1+0.1*sin((sine+0.4)*5)),angles(-0.17453292519943295+0.08726646259971647*sin((sine+0.4)*5),1.3962634015954636,0)),deltaTime) 
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1,0.4+0.1*sin((sine+0.4)*-5),0),angles(-0.10471975511965978+0.08726646259971647*sin((sine+0.6)*5),1.3962634015954636+0.08726646259971647*sin(sine*-5),0)),deltaTime) 
LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1,0.4+0.1*sin((sine+0.2)*-5),0),angles(-0.10471975511965978+0.08726646259971647*sin(sine*5),-1.3962634015954636+0.08726646259971647*sin(sine*5),0)),deltaTime) 
Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.6580627893946132+0.06981317007977318*sin(sine*-5),0,3.2288591161895095)),deltaTime) 
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,0.1 * sin(sine*5),0),angles(-1.4835298641951802+0.03490658503988659*sin((sine+0.4)*-5),0,2.9670597283903604)),deltaTime) 
LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-1-0.1*sin(sine*5),-0.2+0.1*sin((sine+0.4)*5)),angles(-0.3490658503988659+0.10471975511965978*sin((sine+0.4)*5),-1.3962634015954636,0)),deltaTime) 
AccessoryWeld.C0=Lerp(AccessoryWeld.C0,cfMul(cf(-0.2296655774116516,0.08438175916671753,0.34777572751045227),angles(0,1.5707963267948966,0)),deltaTime) 
--MW_animatorProgressSave: RightLeg,1.05,0,0,1,-10,5,0.4,5,-1,-.1,0,5,80,0,0,1,-.1,0.1,0.4,5,0,0,0,1,RightArm,1,0,0,1,-6,5,0.6,5,0.4,0.1,0.4,-5,80,5,0,-5,0,0,0,1,0,0,0,1,LeftArm,-1,0,0,1,-6,5,0,5,0.4,0.1,0.2,-5,-80,5,0,5,0,0,0,1,0,0,0,1,Head,0,0,0,1,-95,4,0,-5,1,0,0,1,0,0,0,1,0,0,0,1,185,0,0,1,Torso,0,0,0,1,-85,2,0.4,-5,0,0.1,0,5,0,0,0,1,0,0,0,1,170,0,0,1,LeftLeg,-1,0,0,1,-20,6,0.4,5,-1,-.1,0,5,-80,0,0,1,-.2,0.1,0.4,5,0,0,0,1,RainbowGodSword_Handle,-0.2296655774116516,0,0,1,0,0,0,1,0.08438175916671753,0,0,1,90,0,0,1,0.34777572751045227,0,0,1,0,0,0,1

 

		end,
		walk = function()
    t.setWalkSpeed(5)
		AccessoryWeld.Part1=getPart("Torso")
RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1,-0.9-0.2*sin(sine*5),-0.2+0.4*sin(sine*5)),angles(-0.17453292519943295-0.7853981633974483*sin(sine*5),1.53588974175501,0.6981317007977318*sin((sine+0.2)*5))),deltaTime) 
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1,0.4+0.1*sin(sine*10),-0.3 * sin((sine+0.1)*5)),angles(0.08726646259971647+0.5235987755982988*sin((sine+0.1)*5),1.5707963267948966+0.3490658503988659*sin((sine+0.1)*5),0.3490658503988659*sin(sine*5))),deltaTime) 
LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1,0.4+0.1*sin(sine*10),0.3 * sin((sine+0.1)*5)),angles(0.08726646259971647-0.5235987755982988*sin((sine+0.1)*5),-1.5707963267948966+0.3490658503988659*sin((sine+0.1)*5),0.3490658503988659*sin(sine*5))),deltaTime) 
Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.5707963267948966-0.10471975511965978*sin((sine+0.6)*10),0,3.141592653589793+0.08726646259971647*sin((sine+0.3)*5))),deltaTime) 
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,-0.2+0.2*sin(sine*10),-0.1 * sin((sine+0.5)*10)),angles(-1.6580627893946132+0.08726646259971647*sin((sine+0.5)*10),0,3.141592653589793-0.05235987755982989*sin((sine+0.1)*5))),deltaTime) 
LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-0.9+0.2*sin(sine*5),-0.2-0.4*sin(sine*5)),angles(-0.17453292519943295+0.7853981633974483*sin(sine*5),-1.53588974175501,0.6981317007977318*sin((sine+0.2)*5))),deltaTime) 
AccessoryWeld.C0=Lerp(AccessoryWeld.C0,cfMul(cf(-0.2296655774116516,0.08438175916671753,0.34777572751045227),angles(0,1.5707963267948966,0)),deltaTime) 
--MW_animatorProgressSave: RightLeg,1,0,0,2,-10,-45,0,5,-0.9,-0.2,0,5,88,0,0,2,-0.2,0.4,0,5,0,40,0.2,5,RightArm,1,0,0,2,5,30,0.1,5,0.4,0.1,0,10,90,20,0.1,5,0,-0.3,0.1,5,0,20,0,5,LeftArm,-1,0,0,2,5,-30,0.1,5,0.4,0.1,0,10,-90,20,0.1,5,0,0.3,0.1,5,0,20,0,5,Head,0,0,0,2,-90,-6,0.6,10,1,0,0,2,0,0,0,2,0,0,0,2,180,5,0.3,5,Torso,0,0,0,2,-95,5,0.5,10,-0.2,0.2,0,10,0,0,0,2,0,-0.1,0.5,10,180,-3,0.1,5,LeftLeg,-1,0,0,2,-10,45,0,5,-0.9,0.2,0,5,-88,0,0,2,-0.2,-0.4,0,5,0,40,0.2,5,RainbowGodSword_Handle,-0.2296655774116516,0,0,1,0,0,0,1,0.08438175916671753,0,0,1,90,0,0,1,0.34777572751045227,0,0,1,0,0,0,1



		end,
		jump = function()
    t.setWalkSpeed(5)
		AccessoryWeld.Part1=getPart("Torso")
RootJoint.C0=Lerp(RootJoint.C0,angles(-1.3962634015954636,0,3.141592653589793),deltaTime) 
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1,0.5,0),angles(0,0.8726646259971648,0.6981317007977318)),deltaTime) 
RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1,-0.5,-1),angles(-0.3490658503988659,1.5707963267948966,0)),deltaTime) 
LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-1,0),angles(0,-1.5707963267948966,0)),deltaTime) 
LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1,0.5,0),angles(0,-0.8726646259971648,-0.6981317007977318)),deltaTime) 
Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.3962634015954636,0,3.141592653589793)),deltaTime) 
AccessoryWeld.C0=Lerp(AccessoryWeld.C0,cfMul(cf(-0.2296655774116516,0.08438175916671753,0.34777572751045227),angles(0,1.5707963267948966,0)),deltaTime) 

--MW_animatorProgressSave: Torso,0,0,0,1,-80,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,180,0,0,1,RainbowGodSword_Handle,-0.2296655774116516,0,0,1,0,0,0,1,0.08438175916671753,0,0,1,90,0,0,1,0.34777572751045227,0,0,1,0,0,0,1,RightArm,1,0,0,1,0,0,0,1,0.5,0,0,1,50,0,0,1,0,0,0,1,40,0,0,1,RightLeg,1,0,0,1,-20,0,0,1,-.5,0,0,1,90,0,0,1,-1,0,0,1,0,0,0,1,LeftLeg,-1,0,0,1,0,0,0,1,-1,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,LeftArm,-1,0,0,1,0,0,0,1,0.5,0,0,1,-50,0,0,1,0,0,0,1,-40,0,0,1 ,Head,0,0,0,1,-80,0,0,1,1,0,0,1,0,0,0,1,0,0,0,1,180,0,0,1

		end,
		fall = function()
    t.setWalkSpeed(5)
		AccessoryWeld.Part1=getPart("Torso")
RootJoint.C0=Lerp(RootJoint.C0,angles(-1.7453292519943295,0,3.141592653589793),deltaTime) 
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1,1,0),angles(0,0.8726646259971648,2.6878070480712677)),deltaTime) 
RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1,-0.5,-1),angles(-0.3490658503988659,1.5707963267948966,0)),deltaTime) 
LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-1,0),angles(0,-1.5707963267948966,0)),deltaTime) 
LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1,1,0),angles(0,-0.8726646259971648,-2.6878070480712677)),deltaTime) 
Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.5707963267948966,0,3.141592653589793)),deltaTime) 
AccessoryWeld.C0=Lerp(AccessoryWeld.C0,cfMul(cf(-0.2296655774116516,0.08438175916671753,0.34777572751045227),angles(0,1.5707963267948966,0)),deltaTime) 

--MW_animatorProgressSave: Torso,0,0,0,1,-100,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,180,0,0,1,RainbowGodSword_Handle,-0.2296655774116516,0,0,1,0,0,0,1,0.08438175916671753,0,0,1,90,0,0,1,0.34777572751045227,0,0,1,0,0,0,1,RightArm,1,0,0,1,0,0,0,1,1,0,0,1,50,0,0,1,0,0,0,1,154,0,0,1,RightLeg,1,0,0,1,-20,0,0,1,-.5,0,0,1,90,0,0,1,-1,0,0,1,0,0,0,1,LeftLeg,-1,0,0,1,0,0,0,1,-1,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,LeftArm,-1,0,0,1,0,0,0,1,1,0,0,1,-50,0,0,1,0,0,0,1,-154,0,0,1 ,Head,0,0,0,1,-90,0,0,1,1,0,0,1,0,0,0,1,0,0,0,1,180,0,0,1


		end
	})

	local modeStartTime=sine
	addmode("q", {
		modeEntered=function()
			modeStartTime=sine
		end,
		idle=function()
			if attackAnimation then return attackAnimation() end
			local modeTime=sine-modeStartTime
			if modeTime<0.5 then
			t.setWalkSpeed(1)
				AccessoryWeld.Part1=getPart("Torso")
			--lerp
RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1,-1,0),angles(0,1.5707963267948966,0)),deltaTime) 
LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-1,0),angles(0,-1.5707963267948966,0)),deltaTime) 
AccessoryWeld.C0=Lerp(AccessoryWeld.C0,cfMul(cf(-0.2296655774116516,0.08438175916671753,0.34777572751045227),angles(0,1.5707963267948966,0)),deltaTime) 
RootJoint.C0=Lerp(RootJoint.C0,angles(-1.5707963267948966,0,2.792526803190927),deltaTime) 
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.3,1,0.5),angles(2.9670597283903604,0.8726646259971648,0.6981317007977318)),deltaTime) 
LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1,0.5,0),angles(0,-1.5707963267948966,0)),deltaTime) 
Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.5707963267948966,0,3.490658503988659)),deltaTime) 
--MW_animatorProgressSave: RightLeg,1,0,0,1,0,0,0,1,-1,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1,LeftLeg,-1,0,0,1,0,0,0,1,-1,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,RainbowGodSword_Handle,-0.2296655774116516,0,0,1,0,0,0,1,0.08438175916671753,0,0,1,90,0,0,1,0.34777572751045227,0,0,1,0,0,0,1,Torso,0,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,160,0,0,1,RightArm,1.3,0,0,1,170,0,0,1,1,0,0,1,50,0,0,1,0.5,0,0,1,40,0,0,1,LeftArm,-1,0,0,1,0,0,0,1,0.5,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,Head,0,0,0,1,-90,0,0,1,1,0,0,1,0,0,0,1,0,0,0,1,200,0,0,1

			elseif modeTime<1 then
			t.setWalkSpeed(1)
				AccessoryWeld.Part1=getPart("Right Arm")
			--lerp
RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1,-1,0),angles(0,1.5707963267948966,0)),deltaTime) 
LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-1,0),angles(0,-1.5707963267948966,0)),deltaTime) 
AccessoryWeld.C0=Lerp(AccessoryWeld.C0,cfMul(cf(-0.2296655774116516,3,-3.5),angles(-1.3962634015954636,0,0)),deltaTime) 
RootJoint.C0=Lerp(RootJoint.C0,angles(-1.5707963267948966,0,3.490658503988659),deltaTime) 
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.2,0.5,-0.5),angles(0.6981317007977318,0.8726646259971648,0.6981317007977318)),deltaTime) 
LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1,0.5,0),angles(0,-1.5707963267948966,0)),deltaTime) 
Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.5707963267948966,0,2.792526803190927)),deltaTime) 
--MW_animatorProgressSave: RightLeg,1,0,0,1,0,0,0,1,-1,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1,LeftLeg,-1,0,0,1,0,0,0,1,-1,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,RainbowGodSword_Handle,-0.2296655774116516,0,0,1,-80,0,0,1,3,0,0,1,,0,0,1,-3.5,0,0,1,,0,0,1,Torso,0,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,200,0,0,1,RightArm,1.2,0,0,1,40,0,0,1,.5,0,0,1,50,0,0,1,-.5,0,0,1,40,0,0,1,LeftArm,-1,0,0,1,0,0,0,1,0.5,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,Head,0,0,0,1,-90,0,0,1,1,0,0,1,0,0,0,1,0,0,0,1,160,0,0,1


			else
			-- idle
			if attackAnimation then return attackAnimation() end
			t.setWalkSpeed(25)
			AccessoryWeld.Part1=getPart("Right Arm")

RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1.05,-1-0.1*sin(sine*5),-0.1+0.1*sin((sine+0.4)*5)),angles(-0.17453292519943295+0.08726646259971647*sin((sine+0.4)*5),1.3962634015954636,0)),deltaTime) 
LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-1-0.1*sin(sine*5),-0.2+0.1*sin((sine+0.4)*5)),angles(-0.3490658503988659+0.10471975511965978*sin((sine+0.4)*5),-1.3962634015954636,0)),deltaTime) 
AccessoryWeld.C0=Lerp(AccessoryWeld.C0,cfMul(cf(0.4,3.5,-3),angles(0.3490658503988659,2.6179938779914944,0)),deltaTime) 
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,0.1 * sin(sine*5),0),angles(-1.4835298641951802+0.03490658503988659*sin((sine+0.4)*-5),0,2.9670597283903604)),deltaTime) 
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1,-0.5+0.1*sin((sine+0.4)*-5),0),angles(-3.141592653589793+0.08726646259971647*sin((sine+0.6)*5),2.0943951023931953+0.08726646259971647*sin(sine*-5),-0.17453292519943295)),deltaTime) 
LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1,0.4+0.1*sin((sine+0.2)*-5),0),angles(-0.10471975511965978+0.08726646259971647*sin(sine*5),-1.3962634015954636+0.08726646259971647*sin(sine*5),0)),deltaTime) 
Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.6580627893946132+0.06981317007977318*sin(sine*-5),0,3.2288591161895095)),deltaTime) 
--MW_animatorProgressSave: RightLeg,1.05,0,0,1,-10,5,0.4,5,-1,-.1,0,5,80,0,0,1,-.1,0.1,0.4,5,0,0,0,1,LeftLeg,-1,0,0,1,-20,6,0.4,5,-1,-.1,0,5,-80,0,0,1,-.2,0.1,0.4,5,0,0,0,1,RainbowGodSword_Handle,.4,0,0,1,20,0,0,1,3.5,0,0,1,150,0,0,1,-3,0,0,1,-,0,0,1,Torso,0,0,0,1,-85,2,0.4,-5,0,0.1,0,5,0,0,0,1,0,0,0,1,170,0,0,1,RightArm,1,0,0,1,-180,5,0.6,5,-.5,0.1,0.4,-5,120,5,0,-5,0,0,0,1,-10,0,0,1,LeftArm,-1,0,0,1,-6,5,0,5,0.4,0.1,0.2,-5,-80,5,0,5,0,0,0,1,0,0,0,1,Head,0,0,0,1,-95,4,0,-5,1,0,0,1,0,0,0,1,0,0,0,1,185,0,0,1
--checkpoint


			end	
		end,
		walk = function()
			if attackAnimation then return attackAnimation() end
			t.setWalkSpeed(25)
				AccessoryWeld.Part1=getPart("Right Arm")


RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1,-1+0.5*sin((sine+0.1)*10),-0.3+0.4*sin(sine*-10)),angles(-0.17453292519943295+1.7453292519943295*sin(sine*10),1.3962634015954636,0)),deltaTime) 
LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-1+0.5*sin((sine+0.1)*-10),-0.3+0.4*sin(sine*10)),angles(-0.17453292519943295-1.7453292519943295*sin(sine*10),-1.3962634015954636,0)),deltaTime) 
AccessoryWeld.C0=Lerp(AccessoryWeld.C0,cfMul(cf(0.4,3.5,-3),angles(0.6981317007977318,2.792526803190927,0)),deltaTime) 
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,0.4 * sin((sine+0.4)*-20),0.6 * sin((sine+0.45)*-20)),angles(-1.9198621771937625+0.08726646259971647*sin(sine*20),0,3.141592653589793+0.08726646259971647*sin(sine*10))),deltaTime) 
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1,-0.3,0.2 * sin(sine*10)),angles(3.141592653589793,2.2689280275926285,-0.3490658503988659)),deltaTime) 
LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1,0.4,1 * sin(sine*-10)),angles(0.3490658503988659+2.2689280275926285*sin(sine*10),-1.3962634015954636,0)),deltaTime) 
Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.3962634015954636+0.17453292519943295*sin((sine+0.4)*-20),0,3.141592653589793+0.08726646259971647*sin((sine+0.1)*-10))),deltaTime) 
--MW_animatorProgressSave: RightLeg,1,0,0,1,-10,100,0,10,-1,.5,0.1,10,80,0,0,1,-.3,0.4,0,-10,0,0,0,1,LeftLeg,-1,0,0,1,-10,-100,0,10,-1,.5,0.1,-10,-80,0,0,1,-.3,0.4,0,10,0,0,0,1,RainbowGodSword_Handle,.4,0,0,1,40,0,0,1,3.5,0,0,1,160,0,0,1,-3,0,0,1,-,0,0,1,Torso,0,0,0,1,-110,5,0,20,0,0.4,0.4,-20,0,0,0,1,0,.6,0.45,-20,180,5,0,10,RightArm,1,0,0,4,180,0,0,-10,-.3,0,0,4,130,0,0,4,0,.2,0,10,-20,0,0,4,LeftArm,-1,0,0,1,20,130,0,10,0.4,0,0,1,-80,0,0,1,0,1,0,-10,0,0,0,1,Head,0,0,0,1,-80,10,0.4,-20,1,0,0,1,0,0,0,1,0,0,0,1,180,5,0.1,-10



		end,
		jump = function()
		t.setWalkSpeed(25)
			AccessoryWeld.Part1=getPart("Right Arm")


LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1,0.5,0),angles(0,-0.8726646259971648,-0.6981317007977318)),deltaTime) 
RootJoint.C0=Lerp(RootJoint.C0,angles(-1.3962634015954636,0,3.141592653589793),deltaTime) 
AccessoryWeld.C0=Lerp(AccessoryWeld.C0,cfMul(cf(0.4,3.5,-3),angles(0.6981317007977318,2.792526803190927,0)),deltaTime) 
Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.3962634015954636,0,3.141592653589793)),deltaTime) 
LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-1,0),angles(0,-1.5707963267948966,0)),deltaTime) 
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1,-0.3,0),angles(3.141592653589793,2.2689280275926285,-0.3490658503988659)),deltaTime) 
RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1,-0.5,-1),angles(-0.3490658503988659,1.5707963267948966,0)),deltaTime) 
--MW_animatorProgressSave: LeftArm,-1,0,0,1,0,0,0,1,0.5,0,0,1,-50,0,0,1,0,0,0,1,-40,0,0,1,Torso,0,0,0,1,-80,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,180,0,0,1,RainbowGodSword_Handle,.4,0,0,1,40,0,0,1,3.5,0,0,1,160,0,0,1,-3,0,0,1,-,0,0,1,Head,0,0,0,1,-80,0,0,1,1,0,0,1,0,0,0,1,0,0,0,1,180,0,0,1,LeftLeg,-1,0,0,1,0,0,0,1,-1,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,RightArm,1,0,0,0,180,0,0,0,-.3,0,0,0,130,0,0,0,0,.2,0,0,-20,0,0,0,RightLeg,1,0,0,1,-20,0,0,1,-.5,0,0,1,90,0,0,1,-1,0,0,1,0,0,0,1


		end,

		fall = function()
		t.setWalkSpeed(25)
			AccessoryWeld.Part1=getPart("Right Arm")
LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1,0.5,0),angles(0,-0.8726646259971648,-0.6981317007977318)),deltaTime) 
RootJoint.C0=Lerp(RootJoint.C0,angles(-1.9198621771937625,0,3.141592653589793),deltaTime) 
AccessoryWeld.C0=Lerp(AccessoryWeld.C0,cfMul(cf(0.4,3.5,-3),angles(0.6981317007977318,2.792526803190927,0)),deltaTime) 
Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.3962634015954636,0,3.141592653589793)),deltaTime) 
LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-1,0),angles(0,-1.5707963267948966,0)),deltaTime) 
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1,-0.3,0),angles(3.141592653589793,2.2689280275926285,-0.3490658503988659)),deltaTime) 
RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1,-0.5,-1),angles(-0.3490658503988659,1.5707963267948966,0)),deltaTime) 
--MW_animatorProgressSave: LeftArm,-1,0,0,1,0,0,0,1,0.5,0,0,1,-50,0,0,1,0,0,0,1,-40,0,0,1,Torso,0,0,0,1,-110,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,180,0,0,1,RainbowGodSword_Handle,.4,0,0,1,40,0,0,1,3.5,0,0,1,160,0,0,1,-3,0,0,1,-,0,0,1,Head,0,0,0,1,-80,0,0,1,1,0,0,1,0,0,0,1,0,0,0,1,180,0,0,1,LeftLeg,-1,0,0,1,0,0,0,1,-1,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,RightArm,1,0,0,0,180,0,0,0,-.3,0,0,0,130,0,0,0,0,.2,0,0,-20,0,0,0,RightLeg,1,0,0,1,-20,0,0,1,-.5,0,0,1,90,0,0,1,-1,0,0,1,0,0,0,1

		end
	})


end)


btn("Glorified Rider", function()
    -- 14255556501, ,14255554762, legs, 14768693948, 14768701869, 14255528083, 104498387508889, this is rig btw, sword 5699795428
-- -gh 14255556501, 14255554762, 14768693948, 14768701869, 14255528083, 104498387508889, 5699795428
	local t=reanimate()
	if type(t)~="table" then return end
	local raycastlegs=t.raycastlegs
	local velbycfrvec=t.velbycfrvec
	local addmode=t.addmode
	local getJoint=t.getJoint
    local getPartFromMesh=t.getPartFromMesh
    local getPartJoint=t.getPartJoint
	local RootJoint=getJoint("RootJoint")
	local RightShoulder=getJoint("Right Shoulder")
	local LeftShoulder=getJoint("Left Shoulder")
	local RightHip=getJoint("Right Hip")
	local LeftHip=getJoint("Left Hip")
	local Neck=getJoint("Neck")

	local red1 = getPartFromMesh(5278721954,5692006383)
	local green1 = getPartFromMesh(5254583415, 5268630057)
	local purple1 = getPartFromMesh(5254583415, 5268638340)
	local r = getPartJoint(red1)
	local g = getPartJoint(green1)
	local p = getPartJoint(purple1)

	addmode("default", {
		idle = function()
  
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1,0.4+0.2*sin((sine+0.4)*-4),0),angles(0.17453292519943295*sin((sine+0.2)*-4),0.5235987755982988+0.17453292519943295*sin(sine*4),0.6981317007977318+0.17453292519943295*sin((sine+0.2)*-4))),deltaTime) 
r.C0=Lerp(r.C0,cfMul(cf(-1.5,4,-5),angles(17453292519.943295*sin(sine*3e-10),1.5707963267948966,0)),deltaTime) 
Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.9198621771937625+0.10471975511965978*sin(sine*-4),-0.08726646259971647+0.05235987755982989*sin((sine+0.2)*-4),3.490658503988659+0.05235987755982989*sin(sine*-4))),deltaTime) 
RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1,-0.5+0.2*sin((sine+0.2)*-4),-1),angles(-0.767944870877505+0.29670597283903605*sin((sine+0.4)*-4),1.2217304763960306+0.08726646259971647*sin((sine+0.4)*4),0.3490658503988659+0.03490658503988659*sin(sine*4))),deltaTime) 
g.C0=Lerp(g.C0,cfMul(cf(-1.5,4,-5),angles(2.0943951023931953+17453292519.943295*sin(sine*3e-10),1.5707963267948966,0)),deltaTime) 
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0.15 * sin((sine+0.4)*4),10+0.5*sin(sine*4),0),angles(-1.3962634015954636+0.12217304763960307*sin((sine+0.5)*-4),-0.08726646259971647+0.03490658503988659*sin(sine*4),2.6179938779914944+0.05235987755982989*sin((sine+0.4)*4))),deltaTime) 
LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-1,0),angles(-0.3490658503988659+0.2617993877991494*sin((sine+0.2)*-4),-1.2217304763960306+0.10471975511965978*sin(sine*-4),0)),deltaTime) 
p.C0=Lerp(p.C0,cfMul(cf(-1.5,4,-5),angles(-2.0943951023931953+17453292519.943295*sin(sine*3e-10),1.5707963267948966,0)),deltaTime) 
LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1,1.7+0.2*sin((sine+0.3)*-4),-0.1),angles(0,-2.6179938779914944+0.17453292519943295*sin(sine*4),-2.2689280275926285+0.08726646259971647*sin(sine*4))),deltaTime) 
--MW_animatorProgressSave: RightArm,1,0,0,4,0,10,0.2,-4,0.4,0.2,.4,-4,30,10,0,4,0,0,0,4,40,10,.2,-4,RainbowGodSword_Handle,-1.5,0,0,1,0,1000000000000,0,0.0000000003,4,0,0,1,90,0,0,1,-5,0,0,1,0,0,0,1,Head,0,0,0,4,-110,6,0,-4,1,0,0,4,-5,3,0.2,-4,0,0,0,4,200,3,0,-4,RightLeg,1,0,0,4,-44,17,.4,-4,-.5,0.2,0.2,-4,70,5,0.4,4,-1,0,0,4,20,2,0,4,ToxicLordSword_Handle,-1.5,0,0,1,120,1000000000000,0,0.0000000003,4,0,0,1,90,0,0,1,-5,0,0,1,0,0,0,1,Torso,0,0.15,0.4,4,-80,7,0.5,-4,10,0.5,0,4,-5,2,0,4,0,0,0.2,4,150,3,0.4,4,LeftLeg,-1,0,0,4,-20,15,0.2,-4,-1,0,0,4,-70,6,0,-4,0,0,0,4,0,0,0,4,CorruptLordSword_Handle,-1.5,0,0,1,-120,1000000000000,0,0.0000000003,4,0,0,1,90,0,0,1,-5,0,0,1,0,0,0,1,LeftArm,-1,0,0,4,0,0,0,4,1.7,0.2,0.3,-4,-150,10,0,4,-.1,0,0,4,-130,5,0,4


		end,
		walk = function()
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1,0.4+0.2*sin((sine+0.4)*-4),0),angles(0.17453292519943295*sin((sine+0.2)*-4),0.5235987755982988+0.17453292519943295*sin(sine*4),0.6981317007977318+0.17453292519943295*sin((sine+0.2)*-4))),deltaTime) 
r.C0=Lerp(r.C0,cfMul(cf(-1.5,4,-5),angles(17453292519.943295*sin(sine*3e-10),1.5707963267948966,0)),deltaTime) 
Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.0471975511965976+0.10471975511965978*sin(sine*-4),-0.08726646259971647+0.05235987755982989*sin((sine+0.2)*-4),3.490658503988659+0.05235987755982989*sin(sine*-4))),deltaTime) 
RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1,-0.5+0.2*sin((sine+0.2)*-4),-1),angles(-0.767944870877505+0.29670597283903605*sin((sine+0.4)*-4),1.2217304763960306+0.08726646259971647*sin((sine+0.4)*4),0.3490658503988659+0.03490658503988659*sin(sine*4))),deltaTime) 
g.C0=Lerp(g.C0,cfMul(cf(-1.5,4,-5),angles(2.0943951023931953+17453292519.943295*sin(sine*3e-10),1.5707963267948966,0)),deltaTime) 
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0.15 * sin((sine+0.4)*4),10+0.5*sin(sine*4),0),angles(-2.0943951023931953+0.12217304763960307*sin((sine+0.5)*-4),-0.08726646259971647+0.03490658503988659*sin(sine*4),2.9670597283903604+0.05235987755982989*sin((sine+0.4)*4))),deltaTime) 
LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-1,0),angles(-0.3490658503988659+0.2617993877991494*sin((sine+0.2)*-4),-1.2217304763960306+0.10471975511965978*sin(sine*-4),0)),deltaTime) 
p.C0=Lerp(p.C0,cfMul(cf(-1.5,4,-5),angles(-2.0943951023931953+17453292519.943295*sin(sine*3e-10),1.5707963267948966,0)),deltaTime) 
LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1,1.7+0.2*sin((sine+0.3)*-4),-0.1),angles(0,-2.443460952792061+0.17453292519943295*sin(sine*4),-2.792526803190927+0.08726646259971647*sin(sine*4))),deltaTime) 
--MW_animatorProgressSave: RightArm,1,0,0,4,0,10,0.2,-4,0.4,0.2,.4,-4,30,10,0,4,0,0,0,4,40,10,.2,-4,RainbowGodSword_Handle,-1.5,0,0,1,0,1000000000000,0,0.0000000003,4,0,0,1,90,0,0,1,-5,0,0,1,0,0,0,1,Head,0,0,0,4,-60,6,0,-4,1,0,0,4,-5,3,0.2,-4,0,0,0,4,200,3,0,-4,RightLeg,1,0,0,4,-44,17,.4,-4,-.5,0.2,0.2,-4,70,5,0.4,4,-1,0,0,4,20,2,0,4,ToxicLordSword_Handle,-1.5,0,0,1,120,1000000000000,0,0.0000000003,4,0,0,1,90,0,0,1,-5,0,0,1,0,0,0,1,Torso,0,0.15,0.4,4,-120,7,0.5,-4,10,0.5,0,4,-5,2,0,4,0,0,0.2,4,170,3,0.4,4,LeftLeg,-1,0,0,4,-20,15,0.2,-4,-1,0,0,4,-70,6,0,-4,0,0,0,4,0,0,0,4,CorruptLordSword_Handle,-1.5,0,0,1,-120,1000000000000,0,0.0000000003,4,0,0,1,90,0,0,1,-5,0,0,1,0,0,0,1,LeftArm,-1,0,0,4,0,0,0,4,1.7,0.2,0.3,-4,-140,10,0,4,-.1,0,0,4,-160,5,0,4

		end,
				jump = function()
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1,0.4+0.2*sin((sine+0.4)*-4),0),angles(0.17453292519943295*sin((sine+0.2)*-4),0.5235987755982988+0.17453292519943295*sin(sine*4),0.6981317007977318+0.17453292519943295*sin((sine+0.2)*-4))),deltaTime) 
r.C0=Lerp(r.C0,cfMul(cf(-1.5,4,-5),angles(17453292519.943295*sin(sine*3e-10),1.5707963267948966,0)),deltaTime) 
Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.0471975511965976+0.10471975511965978*sin(sine*-4),-0.08726646259971647+0.05235987755982989*sin((sine+0.2)*-4),3.490658503988659+0.05235987755982989*sin(sine*-4))),deltaTime) 
RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1,-0.5+0.2*sin((sine+0.2)*-4),-1),angles(-0.767944870877505+0.29670597283903605*sin((sine+0.4)*-4),1.2217304763960306+0.08726646259971647*sin((sine+0.4)*4),0.3490658503988659+0.03490658503988659*sin(sine*4))),deltaTime) 
g.C0=Lerp(g.C0,cfMul(cf(-1.5,4,-5),angles(2.0943951023931953+17453292519.943295*sin(sine*3e-10),1.5707963267948966,0)),deltaTime) 
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0.15 * sin((sine+0.4)*4),10+0.5*sin(sine*4),0),angles(-2.0943951023931953+0.12217304763960307*sin((sine+0.5)*-4),-0.08726646259971647+0.03490658503988659*sin(sine*4),2.9670597283903604+0.05235987755982989*sin((sine+0.4)*4))),deltaTime) 
LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-1,0),angles(-0.3490658503988659+0.2617993877991494*sin((sine+0.2)*-4),-1.2217304763960306+0.10471975511965978*sin(sine*-4),0)),deltaTime) 
p.C0=Lerp(p.C0,cfMul(cf(-1.5,4,-5),angles(-2.0943951023931953+17453292519.943295*sin(sine*3e-10),1.5707963267948966,0)),deltaTime) 
LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1,1.7+0.2*sin((sine+0.3)*-4),-0.1),angles(0,-2.443460952792061+0.17453292519943295*sin(sine*4),-2.792526803190927+0.08726646259971647*sin(sine*4))),deltaTime) 
--MW_animatorProgressSave: RightArm,1,0,0,4,0,10,0.2,-4,0.4,0.2,.4,-4,30,10,0,4,0,0,0,4,40,10,.2,-4,RainbowGodSword_Handle,-1.5,0,0,1,0,1000000000000,0,0.0000000003,4,0,0,1,90,0,0,1,-5,0,0,1,0,0,0,1,Head,0,0,0,4,-60,6,0,-4,1,0,0,4,-5,3,0.2,-4,0,0,0,4,200,3,0,-4,RightLeg,1,0,0,4,-44,17,.4,-4,-.5,0.2,0.2,-4,70,5,0.4,4,-1,0,0,4,20,2,0,4,ToxicLordSword_Handle,-1.5,0,0,1,120,1000000000000,0,0.0000000003,4,0,0,1,90,0,0,1,-5,0,0,1,0,0,0,1,Torso,0,0.15,0.4,4,-120,7,0.5,-4,10,0.5,0,4,-5,2,0,4,0,0,0.2,4,170,3,0.4,4,LeftLeg,-1,0,0,4,-20,15,0.2,-4,-1,0,0,4,-70,6,0,-4,0,0,0,4,0,0,0,4,CorruptLordSword_Handle,-1.5,0,0,1,-120,1000000000000,0,0.0000000003,4,0,0,1,90,0,0,1,-5,0,0,1,0,0,0,1,LeftArm,-1,0,0,4,0,0,0,4,1.7,0.2,0.3,-4,-140,10,0,4,-.1,0,0,4,-160,5,0,4

		end,
		fall = function()
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1,0.4+0.2*sin((sine+0.4)*-4),0),angles(0.17453292519943295*sin((sine+0.2)*-4),0.5235987755982988+0.17453292519943295*sin(sine*4),0.6981317007977318+0.17453292519943295*sin((sine+0.2)*-4))),deltaTime) 
r.C0=Lerp(r.C0,cfMul(cf(-1.5,4,-5),angles(17453292519.943295*sin(sine*3e-10),1.5707963267948966,0)),deltaTime) 
Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.0471975511965976+0.10471975511965978*sin(sine*-4),-0.08726646259971647+0.05235987755982989*sin((sine+0.2)*-4),3.490658503988659+0.05235987755982989*sin(sine*-4))),deltaTime) 
RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1,-0.5+0.2*sin((sine+0.2)*-4),-1),angles(-0.767944870877505+0.29670597283903605*sin((sine+0.4)*-4),1.2217304763960306+0.08726646259971647*sin((sine+0.4)*4),0.3490658503988659+0.03490658503988659*sin(sine*4))),deltaTime) 
g.C0=Lerp(g.C0,cfMul(cf(-1.5,4,-5),angles(2.0943951023931953+17453292519.943295*sin(sine*3e-10),1.5707963267948966,0)),deltaTime) 
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0.15 * sin((sine+0.4)*4),10+0.5*sin(sine*4),0),angles(-2.0943951023931953+0.12217304763960307*sin((sine+0.5)*-4),-0.08726646259971647+0.03490658503988659*sin(sine*4),2.9670597283903604+0.05235987755982989*sin((sine+0.4)*4))),deltaTime) 
LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-1,0),angles(-0.3490658503988659+0.2617993877991494*sin((sine+0.2)*-4),-1.2217304763960306+0.10471975511965978*sin(sine*-4),0)),deltaTime) 
p.C0=Lerp(p.C0,cfMul(cf(-1.5,4,-5),angles(-2.0943951023931953+17453292519.943295*sin(sine*3e-10),1.5707963267948966,0)),deltaTime) 
LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1,1.7+0.2*sin((sine+0.3)*-4),-0.1),angles(0,-2.443460952792061+0.17453292519943295*sin(sine*4),-2.792526803190927+0.08726646259971647*sin(sine*4))),deltaTime) 
--MW_animatorProgressSave: RightArm,1,0,0,4,0,10,0.2,-4,0.4,0.2,.4,-4,30,10,0,4,0,0,0,4,40,10,.2,-4,RainbowGodSword_Handle,-1.5,0,0,1,0,1000000000000,0,0.0000000003,4,0,0,1,90,0,0,1,-5,0,0,1,0,0,0,1,Head,0,0,0,4,-60,6,0,-4,1,0,0,4,-5,3,0.2,-4,0,0,0,4,200,3,0,-4,RightLeg,1,0,0,4,-44,17,.4,-4,-.5,0.2,0.2,-4,70,5,0.4,4,-1,0,0,4,20,2,0,4,ToxicLordSword_Handle,-1.5,0,0,1,120,1000000000000,0,0.0000000003,4,0,0,1,90,0,0,1,-5,0,0,1,0,0,0,1,Torso,0,0.15,0.4,4,-120,7,0.5,-4,10,0.5,0,4,-5,2,0,4,0,0,0.2,4,170,3,0.4,4,LeftLeg,-1,0,0,4,-20,15,0.2,-4,-1,0,0,4,-70,6,0,-4,0,0,0,4,0,0,0,4,CorruptLordSword_Handle,-1.5,0,0,1,-120,1000000000000,0,0.0000000003,4,0,0,1,90,0,0,1,-5,0,0,1,0,0,0,1,LeftArm,-1,0,0,4,0,0,0,4,1.7,0.2,0.3,-4,-140,10,0,4,-.1,0,0,4,-160,5,0,4

		end

	})

	   	addmode("r", {
		idle = function()
            t.setWalkSpeed(50)

r.C0=Lerp(r.C0,cfMul(cf(-1.5,3+1*sin(sine*9),3+1*sin(sine*9)),angles(174532925199.43295*sin(sine*3e-11),1.5707963267948966,0)),deltaTime) 
p.C0=Lerp(p.C0,cfMul(cf(-1.5,3+1*sin(sine*9),3+1*sin(sine*9)),angles(3.141592653589793+174532925199.43295*sin(sine*3e-11),1.5707963267948966,0)),deltaTime) 
LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-1,0),angles(-0.17453292519943295+0.17453292519943295*sin((sine+0.2)*-4),-1.3962634015954636+0.08726646259971647*sin(sine*-4),0)),deltaTime) 
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1,0.35+0.2*sin((sine+0.3)*-4),0),angles(0.08726646259971647*sin(sine*4),0.6981317007977318+0.10471975511965978*sin(sine*4),0.5235987755982988+0.17453292519943295*sin(sine*-4))),deltaTime) 
LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1,0.35+0.2*sin((sine+0.6)*-4),0),angles(0.08726646259971647*sin(sine*-4),-0.6981317007977318+0.08726646259971647*sin((sine+0.3)*4),-0.5235987755982988+0.17453292519943295*sin((sine+0.2)*4))),deltaTime) 
Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.9198621771937625+0.08726646259971647*sin((sine+0.2)*-4),0.03490658503988659*sin(sine*4),3.3161255787892263+0.05235987755982989*sin(sine*-4))),deltaTime) 
g.C0=Lerp(g.C0,cfMul(cf(-3,3,-4),angles(174532925199.43295*sin(sine*-5e-11),1.5707963267948966,0)),deltaTime) 
RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1,-0.4-0.1*sin((sine+0.4)*4),-0.9),angles(-0.3490658503988659+0.17453292519943295*sin(sine*-4),1.361356816555577-0.12217304763960307*sin((sine+0.4)*4),0)),deltaTime) 
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,9+0.35*sin(sine*4),0),angles(-1.3962634015954636+0.10471975511965978*sin((sine+0.4)*-4),-0.03490658503988659*sin(sine*4),2.9670597283903604+0.06981317007977318*sin((sine+0.3)*4))),deltaTime) 
--MW_animatorProgressSave: RainbowGodSword_Handle,-1.5,0,0,4,0,10000000000000,0,0.00000000003,3,1,0,9,90,0,0,4,3,1,0,9,,0,0,9,CorruptLordSword_Handle,-1.5,0,0,1,180,10000000000000,0,0.00000000003,3,1,0,9,90,0,0,1,3,1,0,9,0,0,0,9,LeftLeg,-1,0,0,4,-10,10,0.2,-4,-1,0,0,4,-80,5,0,-4,0,0,0,4,0,0,0,4,RightArm,1,0,0,4,0,5,0,4,0.35,0.2,0.3,-4,40,6,0,4,0,0,0,4,30,10,,-4,LeftArm,-1,0,0,4,0,5,0,-4,0.35,0.2,0.6,-4,-40,5,0.3,4,0,0,0,4,-30,10,0.2,4,Head,0,0,0,4,-110,5,0.2,-4,1,0,0,4,0,2,0,4,0,0,0,4,190,3,0,-4,ToxicLordSword_Handle,-3,0,0,1,0,10000000000000,0,-0.00000000005,3,0,0,1,90,0,0,1,-4,0,0,1,0,0,0,1,RightLeg,1,0,0,4,-20,10,0,-4,-.4,-0.1,0.4,4,78,-7,0.4,4,-.9,0,0,4,0,0,0,4,Torso,0,0,0,4,-80,6,0.4,-4,9,0.35,0,4,0,-2,0,4,0,0,0,4,170,4,0.3,4

--[[

RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,0.1 * sin(sine*16),0.1 * sin(sine*8)),angles(-1.5707963267948966+0.03490658503988659*sin(sine*8),0,3.141592653589793)),deltaTime) 
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1,0.5,0),angles(0,1.5707963267948966,0)),deltaTime) 
LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1,0.5,0),angles(0,-1.5707963267948966,0)),deltaTime) 
LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-1,0),angles(0,-1.5707963267948966,0)),deltaTime) 
Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.5707963267948966,0,3.141592653589793)),deltaTime) 
RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1,-1-0.1*sin(sine*16),-0.2+0.05*sin(sine*16)),angles(-0.17453292519943295+0.03490658503988659*sin(sine*16),1.2915436464758039+0.03490658503988659*sin(sine*16),0)),deltaTime) 
--MW_animatorProgressSave: Torso,0,0,0,8,-90,2,0,8,-,0.1,0,16,0,0,0,8,0,0.1,0,8,180,0,0,8,RightArm,1,0,0,8,0,0,0,8,0.5,0,0,8,90,0,0,8,0,0,0,8,0,0,0,8,LeftArm,-1,0,0,8,0,0,0,8,0.5,0,0,8,-90,0,0,8,0,0,0,8,0,0,0,8,LeftLeg,-1,0,0,8,0,0,0,8,-1,0,0,8,-90,0,0,8,0,0,0,8,0,0,0,8,Head,0,0,0,8,-90,0,0,8,1,0,0,8,0,0,0,8,0,0,0,8,180,0,0,8,RightLeg,1,0,0,8,-10,2,0,16,-1,-.1,0,16,74,2,0,16,-.2,0.05,0,16,0,0,0,8



]]


		end,
		walk = function()
                t.setWalkSpeed(50)

r.C0=Lerp(r.C0,cfMul(cf(-1.5,3+1*sin(sine*9),3+1*sin(sine*9)),angles(174532925199.43295*sin(sine*3e-11),1.5707963267948966,0)),deltaTime) 
p.C0=Lerp(p.C0,cfMul(cf(-1.5,3+1*sin(sine*9),3+1*sin(sine*9)),angles(3.141592653589793+174532925199.43295*sin(sine*3e-11),1.5707963267948966,0)),deltaTime) 
LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-1,0),angles(-0.17453292519943295+0.17453292519943295*sin((sine+0.2)*-4),-1.3962634015954636+0.08726646259971647*sin(sine*-4),0)),deltaTime) 
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1,0.35+0.2*sin((sine+0.3)*-4),0),angles(0.08726646259971647*sin(sine*4),0.6981317007977318+0.10471975511965978*sin(sine*4),0.5235987755982988+0.17453292519943295*sin(sine*-4))),deltaTime) 
LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1,0.35+0.2*sin((sine+0.6)*-4),0),angles(0.08726646259971647*sin(sine*-4),-0.6981317007977318+0.08726646259971647*sin((sine+0.3)*4),-0.5235987755982988+0.17453292519943295*sin((sine+0.2)*4))),deltaTime) 
Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.2217304763960306+0.08726646259971647*sin((sine+0.2)*-4),0.03490658503988659*sin(sine*4),3.3161255787892263+0.05235987755982989*sin(sine*-4))),deltaTime) 
g.C0=Lerp(g.C0,cfMul(cf(-3,3,-4),angles(174532925199.43295*sin(sine*-5e-11),1.5707963267948966,0)),deltaTime) 
RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1,-0.4-0.1*sin((sine+0.4)*4),-0.9),angles(-0.3490658503988659+0.17453292519943295*sin(sine*-4),1.361356816555577-0.12217304763960307*sin((sine+0.4)*4),0)),deltaTime) 
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,9+0.35*sin(sine*4),0),angles(-2.0943951023931953+0.10471975511965978*sin((sine+0.4)*-4),-0.03490658503988659*sin(sine*4),2.9670597283903604+0.06981317007977318*sin((sine+0.3)*4))),deltaTime) 
--MW_animatorProgressSave: RainbowGodSword_Handle,-1.5,0,0,4,0,10000000000000,0,0.00000000003,3,1,0,9,90,0,0,4,3,1,0,9,,0,0,9,CorruptLordSword_Handle,-1.5,0,0,1,180,10000000000000,0,0.00000000003,3,1,0,9,90,0,0,1,3,1,0,9,0,0,0,9,LeftLeg,-1,0,0,4,-10,10,0.2,-4,-1,0,0,4,-80,5,0,-4,0,0,0,4,0,0,0,4,RightArm,1,0,0,4,0,5,0,4,0.35,0.2,0.3,-4,40,6,0,4,0,0,0,4,30,10,,-4,LeftArm,-1,0,0,4,0,5,0,-4,0.35,0.2,0.6,-4,-40,5,0.3,4,0,0,0,4,-30,10,0.2,4,Head,0,0,0,4,-70,5,0.2,-4,1,0,0,4,0,2,0,4,0,0,0,4,190,3,0,-4,ToxicLordSword_Handle,-3,0,0,1,0,10000000000000,0,-0.00000000005,3,0,0,1,90,0,0,1,-4,0,0,1,0,0,0,1,RightLeg,1,0,0,4,-20,10,0,-4,-.4,-0.1,0.4,4,78,-7,0.4,4,-.9,0,0,4,0,0,0,4,Torso,0,0,0,4,-120,6,0.4,-4,9,0.35,0,4,0,-2,0,4,0,0,0,4,170,4,0.3,4

		end,
		jump = function()
			t.setWalkSpeed(50)
			r.C0=Lerp(r.C0,cfMul(cf(-1.5,3+1*sin(sine*9),3+1*sin(sine*9)),angles(174532925199.43295*sin(sine*3e-11),1.5707963267948966,0)),deltaTime) 
p.C0=Lerp(p.C0,cfMul(cf(-1.5,3+1*sin(sine*9),3+1*sin(sine*9)),angles(3.141592653589793+174532925199.43295*sin(sine*3e-11),1.5707963267948966,0)),deltaTime) 
LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-1,0),angles(-0.17453292519943295+0.17453292519943295*sin((sine+0.2)*-4),-1.3962634015954636+0.08726646259971647*sin(sine*-4),0)),deltaTime) 
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1,0.35+0.2*sin((sine+0.3)*-4),0),angles(0.08726646259971647*sin(sine*4),0.6981317007977318+0.10471975511965978*sin(sine*4),0.5235987755982988+0.17453292519943295*sin(sine*-4))),deltaTime) 
LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1,0.35+0.2*sin((sine+0.6)*-4),0),angles(0.08726646259971647*sin(sine*-4),-0.6981317007977318+0.08726646259971647*sin((sine+0.3)*4),-0.5235987755982988+0.17453292519943295*sin((sine+0.2)*4))),deltaTime) 
Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.2217304763960306+0.08726646259971647*sin((sine+0.2)*-4),0.03490658503988659*sin(sine*4),3.3161255787892263+0.05235987755982989*sin(sine*-4))),deltaTime) 
g.C0=Lerp(g.C0,cfMul(cf(-3,3,-4),angles(174532925199.43295*sin(sine*-5e-11),1.5707963267948966,0)),deltaTime) 
RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1,-0.4-0.1*sin((sine+0.4)*4),-0.9),angles(-0.3490658503988659+0.17453292519943295*sin(sine*-4),1.361356816555577-0.12217304763960307*sin((sine+0.4)*4),0)),deltaTime) 
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,9+0.35*sin(sine*4),0),angles(-2.0943951023931953+0.10471975511965978*sin((sine+0.4)*-4),-0.03490658503988659*sin(sine*4),2.9670597283903604+0.06981317007977318*sin((sine+0.3)*4))),deltaTime) 
--MW_animatorProgressSave: RainbowGodSword_Handle,-1.5,0,0,4,0,10000000000000,0,0.00000000003,3,1,0,9,90,0,0,4,3,1,0,9,,0,0,9,CorruptLordSword_Handle,-1.5,0,0,1,180,10000000000000,0,0.00000000003,3,1,0,9,90,0,0,1,3,1,0,9,0,0,0,9,LeftLeg,-1,0,0,4,-10,10,0.2,-4,-1,0,0,4,-80,5,0,-4,0,0,0,4,0,0,0,4,RightArm,1,0,0,4,0,5,0,4,0.35,0.2,0.3,-4,40,6,0,4,0,0,0,4,30,10,,-4,LeftArm,-1,0,0,4,0,5,0,-4,0.35,0.2,0.6,-4,-40,5,0.3,4,0,0,0,4,-30,10,0.2,4,Head,0,0,0,4,-70,5,0.2,-4,1,0,0,4,0,2,0,4,0,0,0,4,190,3,0,-4,ToxicLordSword_Handle,-3,0,0,1,0,10000000000000,0,-0.00000000005,3,0,0,1,90,0,0,1,-4,0,0,1,0,0,0,1,RightLeg,1,0,0,4,-20,10,0,-4,-.4,-0.1,0.4,4,78,-7,0.4,4,-.9,0,0,4,0,0,0,4,Torso,0,0,0,4,-120,6,0.4,-4,9,0.35,0,4,0,-2,0,4,0,0,0,4,170,4,0.3,4

		end,
		fall = function()
			t.setWalkSpeed(50)
			r.C0=Lerp(r.C0,cfMul(cf(-1.5,3+1*sin(sine*9),3+1*sin(sine*9)),angles(174532925199.43295*sin(sine*3e-11),1.5707963267948966,0)),deltaTime) 
p.C0=Lerp(p.C0,cfMul(cf(-1.5,3+1*sin(sine*9),3+1*sin(sine*9)),angles(3.141592653589793+174532925199.43295*sin(sine*3e-11),1.5707963267948966,0)),deltaTime) 
LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-1,0),angles(-0.17453292519943295+0.17453292519943295*sin((sine+0.2)*-4),-1.3962634015954636+0.08726646259971647*sin(sine*-4),0)),deltaTime) 
RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1,0.35+0.2*sin((sine+0.3)*-4),0),angles(0.08726646259971647*sin(sine*4),0.6981317007977318+0.10471975511965978*sin(sine*4),0.5235987755982988+0.17453292519943295*sin(sine*-4))),deltaTime) 
LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1,0.35+0.2*sin((sine+0.6)*-4),0),angles(0.08726646259971647*sin(sine*-4),-0.6981317007977318+0.08726646259971647*sin((sine+0.3)*4),-0.5235987755982988+0.17453292519943295*sin((sine+0.2)*4))),deltaTime) 
Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.2217304763960306+0.08726646259971647*sin((sine+0.2)*-4),0.03490658503988659*sin(sine*4),3.3161255787892263+0.05235987755982989*sin(sine*-4))),deltaTime) 
g.C0=Lerp(g.C0,cfMul(cf(-3,3,-4),angles(174532925199.43295*sin(sine*-5e-11),1.5707963267948966,0)),deltaTime) 
RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1,-0.4-0.1*sin((sine+0.4)*4),-0.9),angles(-0.3490658503988659+0.17453292519943295*sin(sine*-4),1.361356816555577-0.12217304763960307*sin((sine+0.4)*4),0)),deltaTime) 
RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(0,9+0.35*sin(sine*4),0),angles(-2.0943951023931953+0.10471975511965978*sin((sine+0.4)*-4),-0.03490658503988659*sin(sine*4),2.9670597283903604+0.06981317007977318*sin((sine+0.3)*4))),deltaTime) 
--MW_animatorProgressSave: RainbowGodSword_Handle,-1.5,0,0,4,0,10000000000000,0,0.00000000003,3,1,0,9,90,0,0,4,3,1,0,9,,0,0,9,CorruptLordSword_Handle,-1.5,0,0,1,180,10000000000000,0,0.00000000003,3,1,0,9,90,0,0,1,3,1,0,9,0,0,0,9,LeftLeg,-1,0,0,4,-10,10,0.2,-4,-1,0,0,4,-80,5,0,-4,0,0,0,4,0,0,0,4,RightArm,1,0,0,4,0,5,0,4,0.35,0.2,0.3,-4,40,6,0,4,0,0,0,4,30,10,,-4,LeftArm,-1,0,0,4,0,5,0,-4,0.35,0.2,0.6,-4,-40,5,0.3,4,0,0,0,4,-30,10,0.2,4,Head,0,0,0,4,-70,5,0.2,-4,1,0,0,4,0,2,0,4,0,0,0,4,190,3,0,-4,ToxicLordSword_Handle,-3,0,0,1,0,10000000000000,0,-0.00000000005,3,0,0,1,90,0,0,1,-4,0,0,1,0,0,0,1,RightLeg,1,0,0,4,-20,10,0,-4,-.4,-0.1,0.4,4,78,-7,0.4,4,-.9,0,0,4,0,0,0,4,Torso,0,0,0,4,-120,6,0.4,-4,9,0.35,0,4,0,-2,0,4,0,0,0,4,170,4,0.3,4

		end


	})

end)


lbl("OLD remake from 2024")


insSet(btn("Stop Current Reanim",stopreanimate),"TextColor3",c3(0.75,0,0))
btn("Stop All Sounds", stopAllSounds)
lbl("Settings")

swtc("client sided placeholders",{
	{value=true,text="yes"},
	{value=false,text="no"}
},function(v)
	placeholders=v
end)

swtc("highlight fling targets",{
	{value=true,text="yes"},
	{value=false,text="no"}
},function(v)
	highlightflingtargets=v
end)

swtc("allow shiftlock",{
	{value=true,text="yes"},
	{value=false,text="no"}
},function(v)
	allowshiftlock=v
end)

swtc("ctrl click tp",{
	{value=true,text="yes"},
	{value=false,text="no"}
},function(v)
	ctrltp=v
end)

swtc("click fling",{
	{value=true,text="yes"},
	{value=false,text="no"}
},function(v)
	clickfling=v
end)

swtc("fling enhancements",{
	{value=3,text="all"},
	{value=1,text="changestate physics"},
	{value=2,text="disable sitting"},
	{value=0,text="none"},
},function(v)
	flingchangestate=v
end)

swtc("respawn tp",{
	{value=3,text="hide body"},
	{value=0,text="stay at spawn"},
	{value=1,text="random tp close"},
	{value=2,text="behind char"}
},function(v)
	respawntp=v
end)

local disguiscripts=nil
swtc("new gui scripts",{
	{value=true,text="disable"},
	{value=false,text="keep"}
},function(v)
	disguiscripts=v
end)
Connect(insGet(pg,"DescendantAdded"),function(v)
	if c and disguiscripts and IsA(v,"Script") then --mind Enum.RunContext.Client
		insSet(v,"Disabled",true) 
	end
end)

swtc("new character scripts",{
	{value=function(v)
		if IsA(v,"Script") then --mind Enum.RunContext.Client
			insSet(v,"Disabled",true)
		end
	end,text="disable"},
	{value=false,text="keep"}
},function(v)
	discharscripts=v
end)

if replicatesignal then
	swtc("breakjoints",{
		{value=4,text="serverbreakjoints"},
		{value=1,text="breakjoints+health"},
		{value=2,text="health or breakjoints"},
		{value=3,text="breakjoints"}
	},function(v)
		breakjointsmethod=v
	end)
else
	swtc("breakjoints",{
		{value=1,text="breakjoints+health"},
		{value=2,text="health or breakjoints"},
		{value=3,text="breakjoints"}
	},function(v)
		breakjointsmethod=v
	end)
	lbl("serverbreakjoints unsupported")
end

swtc("coregui death effect",{
	{value=true,text="disable"},
	{value=false,text="dont modify"},
},function(v)
	hidedeatheffect=v
end)

swtc("set simulation radius",{
	{value=true,text="yes"},
	{value=false,text="no"},
},function(v)
	simrad=v
end)

local cg=FindFirstChildOfClass(game,"CoreGui")
if pcall(GetChildren,cg) then
	insSet(i10,"Parent",cg)
else
	insSet(i7,"Text","PLAYERGUI MODE")
	insSet(i10,"Parent",pg)
	twait(3)
	insSet(i7,"Text",guiTheme.guiTitle)
end

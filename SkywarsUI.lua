local libary = loadstring(game:HttpGet(('https://pastebin.com/raw/DefdGVG1'),true))()

local HiHub = libary.new("HiHub", 5013109572)

-- themes
local themes = {
	Background = Color3.fromRGB(24, 24, 24),
	Glow = Color3.fromRGB(0, 0, 0),
	Accent = Color3.fromRGB(10, 10, 10),
	LightContrast = Color3.fromRGB(20, 20, 20),
	DarkContrast = Color3.fromRGB(14, 14, 14),  
	TextColor = Color3.fromRGB(255, 255, 255)
}

-- first page
local page = HiHub:addPage("HiHub", 5012544693)
local section1 = page:addSection("Skywars")

section1:addButton("Automine", function()
    local toolname = "Axe" -- replace with the name of the tool
    local Plr = game:GetService("Players").LocalPlayer
    local tool = Plr.Backpack:FindFirstChild(toolname)
    Plr.Character.Humanoid:EquipTool(tool)
    local cpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame

    local stuff = workspace:getDescendants()
    for i=1,#stuff do
    if stuff[i].Name == "Block" and stuff[i].Parent.Name == "Ores" then
    repeat
    wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = stuff[i].CFrame
    game.Players.LocalPlayer.Character.Axe.RemoteEvent:FireServer(stuff[i])
    until stuff[i].Name ~= "Block" or not game.Players.LocalPlayer.Character:FindFirstChild("Axe")
    end
    end

    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = cpos

end)
section1:addButton("Auto coin", function()
    local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
    local folder = game:GetService("Workspace").GameStorage.Coins

    for i, Obj in next, folder:GetChildren() do
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = Obj.CFrame
        wait(0.1)
    end
end)

section1:addKeybind("Toggle open", Enum.KeyCode.KeypadOne, function()
	HiHub:toggle()
end, function()
end)

section1:addDropdown("Dropdown", {"MegaVIP", "VIP", "Infinite Jump", "Aim Lock", "Delete Border", "ESP", "Delete Kill Parts"}, function(text)
    if text == "MegaVIP" then
        local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
        local landing = CFrame.new(0, 264, 70)

        pl.CFrame = landing
    elseif text == "VIP" then
        local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
        local landing = CFrame.new(0, 264, -70)

        pl.CFrame = landing
    elseif text == "Infinite Jump" then
        local Player = game:GetService'Players'.LocalPlayer;
        local UIS = game:GetService'UserInputService';

        _G.JumpHeight = 50;

        function Action(Object, Function) if Object ~= nil then Function(Object); end end

        UIS.InputBegan:connect(function(UserInput)
            if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
                Action(Player.Character.Humanoid, function(self)
                    if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
                        Action(self.Parent.HumanoidRootPart, function(self)
                            self.Velocity = Vector3.new(0, _G.JumpHeight, 0);
                        end)
                    end
                end)
            end
        end)
    elseif text == "Aim Lock" then
    loadstring(game:HttpGet(('https://pastebin.com/raw/x6ga7XsR'),true))()
    elseif text == "Delete Border" then
    game:GetService("Workspace").Borders.InvisibleBorder:Destroy()
    elseif text == "ESP" then
	ALLYCOLOR = {0,255,255}  	--//Color of the ESP  of people on the same team
	ENEMYCOLOR =  {255,0,0} 	--//Color of the ESP  of people on NOT the same team
	TRANSPARENCY = 0.5			--//Transparency of the ESP
	HEALTHBAR_ACTIVATED = true 	--//Renders the Healthbar

    function createFlex()
    -- -----------------------------------------------------------------------------------
    --[VARIABLES] //Changing may result in Errors!
    players = game:GetService("Players") --//Required for PF
    faces = {"Front","Back","Bottom","Left","Right","Top"} --//Every possible Enum face
    currentPlayer = nil --//Used for the Team-Check
    lplayer = players.LocalPlayer --//The LocalPlayer
    -- -----------------------------------------------------------------------------------
    players.PlayerAdded:Connect(function(p)
        currentPlayer = p
            p.CharacterAdded:Connect(function(character) --//For when a new Player joins the game 
                createESP(character)			
            end)		
    end)
    -- -----------------------------------------------------------------------------------
    function checkPart(obj)  if (obj:IsA("Part") or obj:IsA("MeshPart")) and obj.Name~="HumanoidRootPart" then return true end end --//Check if the Part is suitable 
    -- -----------------------------------------------------------------------------------
    function actualESP(obj) 
        
        for i=0,5 do
            surface = Instance.new("SurfaceGui",obj) --//Creates the SurfaceGui
            surface.Face = Enum.NormalId[faces[i+1]] --//Adjusts the Face and chooses from the face table
            surface.AlwaysOnTop = true

            frame = Instance.new("Frame",surface)	--//Creates the viewable Frame
            frame.Size = UDim2.new(1,0,1,0)
            frame.BorderSizePixel = 0												
            frame.BackgroundTransparency = TRANSPARENCY
                if currentPlayer.Team == players.LocalPlayer.Team then --//Checks the Players Team
                        frame.BackgroundColor3 = Color3.new(ALLYCOLOR[1],ALLYCOLOR[2],ALLYCOLOR[3])	--//If in same Team											
                else
                    frame.BackgroundColor3 = Color3.new(ENEMYCOLOR[1],ENEMYCOLOR[2],ENEMYCOLOR[3])	--//If in another Team
                end
                                                                
        end
    end
    -- -----------------------------------------------------------------------------------
    function createHealthbar(hrp) 
        board =Instance.new("BillboardGui",hrp) --//Creates the BillboardGui with HumanoidRootPart as the Parent
        board.Name = "total"
        board.Size = UDim2.new(1,0,1,0)
        board.StudsOffset = Vector3.new(3,1,0)
        board.AlwaysOnTop = true

        bar = Instance.new("Frame",board) --//Creates the red background
        bar.BackgroundColor3 = Color3.new(255,0,0)
        bar.BorderSizePixel = 0
        bar.Size = UDim2.new(0.2,0,4,0)
        bar.Name = "total2"
                                                    
        health = Instance.new("Frame",bar) --//Creates the changing green Frame
        health.BackgroundColor3 = Color3.new(0,255,0)
        health.BorderSizePixel = 0
        health.Size = UDim2.new(1,0,hrp.Parent.Humanoid.Health/100,0)
            hrp.Parent.Humanoid.Changed:Connect(function(property) --//Triggers when any Property changed
                hrp.total.total2.Frame.Size = UDim2.new(1,0,hrp.Parent.Humanoid.Health/100,0) --//Adjusts the size of the green Frame								
            end)
    end
    -- -----------------------------------------------------------------------------------
    function createESP(c) --//Checks and calls the proper function
        bugfix = c:WaitForChild("Head") --// *Used so the children of the character arent nil.
        for i,v in pairs(c:GetChildren()) do
            if checkPart(v) then
            actualESP(v)
            end
        end
        if HEALTHBAR_ACTIVATED then 
            createHealthbar(c:WaitForChild("HumanoidRootPart")) 
        end
    end
    -- -----------------------------------------------------------------------------------
    for i,people in pairs(players:GetChildren())do
        if people ~= players.LocalPlayer then
            currentPlayer = people
                                                                    
            createESP(people.Character)
                people.CharacterAdded:Connect(function(character)
                    createESP(character)			
                end)
        end
    end
    end 

    createFlex() 
    elseif text == "Delete Kill Part" then
    
    
    end
end)

-- second page
local theme = HiHub:addPage("Theme", 5012544693)
local colors = theme:addSection("Colors")

for theme, color in pairs(themes) do -- all in one theme changer, i know, im cool
	colors:addColorPicker(theme, color, function(color3)
		HiHub:setTheme(theme, color3)
	end)
end

-- load
HiHub:SelectPage(HiHub.pages[1], true)
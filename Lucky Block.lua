local libary = loadstring(game:HttpGet(('https://pastebin.com/raw/DefdGVG1'),true))()

local HiHub = libary.new("HiHubI", 5013109572)

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
local page = HiHub:addPage("Lucky Block", 5012544693)
local section1 = page:addSection("Lucky Blocks")

section1:addToggle("Auto-Open Blocks", nil, function(value)
	if value == true then
        _G.tog = true

        while _G.tog do
            local Event = game:GetService("ReplicatedStorage").SpawnGalaxyBlock
            Event:FireServer()

            local Event1 = game:GetService("ReplicatedStorage").SpawnDiamondBlock
            Event1:FireServer()

            local Event2 = game:GetService("ReplicatedStorage").SpawnRainbowBlock
            Event2:FireServer()
            wait()
        end
    else
        _G.tog = false
    end
end)

section1:addKeybind("Toggle GUI", Enum.KeyCode.KeypadOne, function()
	print("Activated Keybind")
	HiHub:toggle()
end, function()
	print("Changed Keybind")
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
local libary = loadstring(game:HttpGet(('https://pastebin.com/raw/06GHNQdE'),true))()

local HiHub= libary.new("HiHub", 5013109572)

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
local page = HiHub:addPage("Autofarm", 5012544693)
local section1 = page:addSection("Autofind")
local section2 = page:addSection("Null")

section1:addTextbox("Find", "Loomian name",function(ltext)
	_G.Lname = ltext
end)

section1:addToggle("Autofind", nil, function(value)
	if value == true then
        local found = game:GetService("Workspace").Default
        if found.Name == Lname do
            HiHub:Notify("HEY", "Found Loomian")
        elseif found.Name != Lname do
            
    else
        
    end
end)

section2:addKeybind("Toggle GUI", Enum.KeyCode.One, function()
	print("Activated Keybind")
	HiHub:toggle()
end, function()
	print("Changed Keybind")
end)
section2:addColorPicker("ColorPicker", Color3.fromRGB(50, 50, 50))
section2:addColorPicker("ColorPicker2")
section2:addSlider("Slider", 0, -100, 100, function(value)
	print("Dragged", value)
end)
section2:addDropdown("Dropdown", {"Hello", "World", "Hello World", "Word", 1, 2, 3})
section2:addDropdown("Dropdown", {"Hello", "World", "Hello World", "Word", 1, 2, 3}, function(text)
	print("Selected", text)
end)
section2:addButton("Button")

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
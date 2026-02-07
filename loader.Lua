local TweenService = game:GetService("TweenService")
local FinishedEvent = Instance.new("BindableEvent")

-- 🎨 PURPLE COLORS
local PURPLE_MAIN  = Color3.fromRGB(170, 90, 255)
local PURPLE_LIGHT = Color3.fromRGB(210, 160, 255)
local PURPLE_PINK  = Color3.fromRGB(255, 120, 220)
local PURPLE_DARK  = Color3.fromRGB(90, 40, 160)

local screenGui = Instance.new("ScreenGui", game.CoreGui)
screenGui.Name = "CoolLoadingUI"

local mainFrame = Instance.new("Frame", screenGui)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.Size = UDim2.new(0, 300, 0, 100)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 20, 35)
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 12)

local stroke = Instance.new("UIStroke", mainFrame)
stroke.Thickness = 4
stroke.Color = PURPLE_MAIN

-- 🌈 PURPLE GRADIENT BACKGROUND
local backgroundGradient = Instance.new("UIGradient")
backgroundGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0.00, Color3.fromRGB(230, 180, 255)),
	ColorSequenceKeypoint.new(0.25, Color3.fromRGB(190, 120, 255)),
	ColorSequenceKeypoint.new(0.50, Color3.fromRGB(160, 80, 255)),
	ColorSequenceKeypoint.new(0.75, Color3.fromRGB(190, 120, 255)),
	ColorSequenceKeypoint.new(1.00, Color3.fromRGB(230, 180, 255)),
})
backgroundGradient.Rotation = 45
backgroundGradient.Parent = mainFrame

task.spawn(function()
	while screenGui.Parent do
		for i = 0, 360, 2 do
			backgroundGradient.Rotation = i
			task.wait(0.03)
		end
	end
end)

-- 🖼 LOGO
local logo = Instance.new("ImageLabel", mainFrame)
logo.Size = UDim2.new(0, 40, 0, 40)
logo.Position = UDim2.new(0, 10, 0, 10)
logo.BackgroundTransparency = 1
logo.Image = "http://www.roblox.com/asset/?id=110657725541747"
logo.ImageTransparency = 1

-- 📝 TITLE
local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(0, 230, 0, 40)
title.Position = UDim2.new(0, 60, 0, 15)
title.BackgroundTransparency = 1
title.Text = "M00nhubEXE"
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.TextColor3 = Color3.new(1,1,1)
title.TextTransparency = 1
title.TextXAlignment = Enum.TextXAlignment.Left

local titleGradient = Instance.new("UIGradient", title)
titleGradient.Color = backgroundGradient.Color

task.spawn(function()
	while screenGui.Parent do
		for i = 0, 360, 2 do
			titleGradient.Rotation = i
			task.wait(0.03)
		end
	end
end)

-- 📊 PROGRESS BAR
local progressBarBG = Instance.new("Frame", mainFrame)
progressBarBG.Size = UDim2.new(0, 280, 0, 15)
progressBarBG.Position = UDim2.new(0.5, 0, 0, 60)
progressBarBG.AnchorPoint = Vector2.new(0.5, 0)
progressBarBG.BackgroundColor3 = Color3.fromRGB(30, 25, 45)
progressBarBG.BackgroundTransparency = 0.2

local progressBar = Instance.new("Frame", progressBarBG)
progressBar.Size = UDim2.new(0, 0, 1, 0)
progressBar.BackgroundColor3 = PURPLE_MAIN

local corner = Instance.new("UICorner", progressBarBG)
corner.CornerRadius = UDim.new(0, 8)
corner:Clone().Parent = progressBar

local barGradient = Instance.new("UIGradient", progressBar)
barGradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, PURPLE_LIGHT),
	ColorSequenceKeypoint.new(1, PURPLE_MAIN)
}

-- 🔤 POWERED TEXT
local poweredBy = Instance.new("TextLabel", mainFrame)
poweredBy.Size = UDim2.new(0, 280, 0, 20)
poweredBy.Position = UDim2.new(0.5, 0, 0, 85)
poweredBy.AnchorPoint = Vector2.new(0.5, 0)
poweredBy.BackgroundTransparency = 1
poweredBy.Text = "100+ Script Safe Vip"
poweredBy.Font = Enum.Font.SourceSansItalic
poweredBy.TextSize = 13
poweredBy.TextColor3 = Color3.new(1,1,1)
poweredBy.TextTransparency = 1

local poweredGradient = Instance.new("UIGradient", poweredBy)
poweredGradient.Color = backgroundGradient.Color

task.spawn(function()
	while screenGui.Parent do
		for i = 0, 360, 2 do
			poweredGradient.Rotation = i
			task.wait(0.03)
		end
	end
end)

-- ✨ STROKE PURPLE ANIMATION
task.spawn(function()
	local colors = {PURPLE_DARK, PURPLE_MAIN, PURPLE_LIGHT, PURPLE_PINK, PURPLE_LIGHT}
	local i = 1
	while screenGui.Parent do
		i = (i % #colors) + 1
		TweenService:Create(stroke, TweenInfo.new(0.5), {Color = colors[i]}):Play()
		task.wait(0.5)
	end
end)

-- 🎬 TWEEN FUNC
local function TweenObject(obj, t, props)
	TweenService:Create(obj, TweenInfo.new(t, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), props):Play()
end

-- 🚀 LOADING ANIMATION
task.spawn(function()
	TweenObject(mainFrame, 0.3, {Size = UDim2.new(0, 320, 0, 110)})
	task.wait(0.3)

	TweenObject(logo, 0.5, {ImageTransparency = 0})
	TweenObject(title, 0.5, {TextTransparency = 0})
	task.wait(0.5)

	TweenObject(progressBar, 1, {Size = UDim2.new(1, 0, 1, 0)})
	task.wait(1)

	TweenObject(poweredBy, 0.5, {TextTransparency = 0})
	task.wait(1)

	TweenObject(mainFrame, 0.3, {Size = UDim2.new(0, 0, 0, 0)})
	task.wait(0.3)

	FinishedEvent:Fire()
	screenGui:Destroy()
end)

FinishedEvent.Event:Wait()

-- Delta Chat UI
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

pcall(function()
    CoreGui:FindFirstChild("DeltaChat"):Destroy()
end)

local gui = Instance.new("ScreenGui")
gui.Name = "DeltaChat"
gui.ResetOnSpawn = false
gui.Parent = CoreGui

local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(370, 430)
main.Position = UDim2.new(0.5,-185,0.5,-215)
main.BackgroundColor3 = Color3.fromRGB(20,20,32)
main.Parent = gui

Instance.new("UICorner",main).CornerRadius =
    UDim.new(0,18)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,-55,0,55)
title.BackgroundTransparency = 1
title.Text = "💬 Delta Chat"
title.TextColor3 = Color3.new(1,1,1)
title.TextSize = 24
title.Font = Enum.Font.GothamBold
title.Parent = main

local close = Instance.new("TextButton")
close.Size = UDim2.fromOffset(45,45)
close.Position = UDim2.new(1,-48,0,5)
close.Text = "✕"
close.TextSize = 25
close.TextColor3 = Color3.new(1,1,1)
close.BackgroundColor3 = Color3.fromRGB(180,40,80)
close.Parent = main

local list = Instance.new("ScrollingFrame")
list.Position = UDim2.fromOffset(10,65)
list.Size = UDim2.new(1,-20,1,-130)
list.BackgroundTransparency = 1
list.CanvasSize = UDim2.new(0,0,0,0)
list.ScrollBarThickness = 3
list.Parent = main

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0,8)
layout.Parent = list

local input = Instance.new("TextBox")
input.Position = UDim2.new(0,10,1,-55)
input.Size = UDim2.new(1,-80,0,42)
input.PlaceholderText = "اكتب رسالتك..."
input.Text = ""
input.TextSize = 16
input.TextColor3 = Color3.new(1,1,1)
input.BackgroundColor3 = Color3.fromRGB(45,45,65)
input.Parent = main

local send = Instance.new("TextButton")
send.Position = UDim2.new(1,-62,1,-55)
send.Size = UDim2.fromOffset(52,42)
send.Text = "➤"
send.TextSize = 24
send.BackgroundColor3 = Color3.fromRGB(130,35,230)
send.TextColor3 = Color3.new(1,1,1)
send.Parent = main

local function addMessage(name,msg)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1,-5,0,45)
    label.BackgroundColor3 = Color3.fromRGB(45,40,65)
    label.TextColor3 = Color3.new(1,1,1)
    label.TextSize = 15
    label.TextWrapped = true
    label.Text = name..": "..msg
    label.Parent = list

    Instance.new("UICorner",label).CornerRadius =
        UDim.new(0,10)

    task.wait()
    list.CanvasSize = UDim2.new(
        0,0,0,layout.AbsoluteContentSize.Y+10
    )
end

send.MouseButton1Click:Connect(function()
    if input.Text ~= "" then
        addMessage(player.Name,input.Text)
        input.Text = ""
    end
end)

close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

print("Delta Chat Loaded!")

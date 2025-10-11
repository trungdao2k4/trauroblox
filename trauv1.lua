-- Script thông báo phiên bản lỗi thời
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Tạo ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "OutdatedVersionGui"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui

-- Tạo nền trong suốt (chỉ để bắt click)
local overlay = Instance.new("Frame")
overlay.Name = "Overlay"
overlay.Size = UDim2.new(1, 0, 1, 0)
overlay.Position = UDim2.new(0, 0, 0, 0)
overlay.BackgroundTransparency = 1
overlay.BorderSizePixel = 0
overlay.ZIndex = 10
overlay.Parent = screenGui

-- Thêm hiệu ứng blur mạnh
local blur = Instance.new("BlurEffect")
blur.Size = 56
blur.Parent = game.Lighting

-- Tạo khung chính
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 450, 0, 300)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
mainFrame.BorderSizePixel = 0
mainFrame.ZIndex = 11
mainFrame.Parent = screenGui

-- Bo tròn góc
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = mainFrame

-- Tiêu đề
local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(1, -40, 0, 50)
title.Position = UDim2.new(0, 20, 0, 20)
title.BackgroundTransparency = 1
title.Text = "⚠️ PHIÊN BẢN LỖI THỜI"
title.TextColor3 = Color3.fromRGB(255, 85, 85)
title.TextSize = 24
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Center
title.Parent = mainFrame

-- Thông báo
local message = Instance.new("TextLabel")
message.Name = "Message"
message.Size = UDim2.new(1, -40, 0, 80)
message.Position = UDim2.new(0, 20, 0, 80)
message.BackgroundTransparency = 1
message.Text = "Phiên bản script này đã lỗi thời.\nVui lòng vào Discord hoặc YouTube\n Trẩu Roblox \n để lấy bản mới nhất!"
message.TextColor3 = Color3.fromRGB(220, 220, 220)
message.TextSize = 16
message.Font = Enum.Font.Gotham
message.TextXAlignment = Enum.TextXAlignment.Center
message.TextWrapped = true
message.Parent = mainFrame

-- Link Discord và YouTube
local discordLink = "https://discord.gg/s8R9b5NfsU"
local youtubeLink = "https://www.youtube.com/@Trauroblox2004"

-- Hàm tạo nút
local function createButton(text, position, link)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 180, 0, 45)
    button.Position = position
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 14
    button.Font = Enum.Font.GothamBold
    button.BorderSizePixel = 0
    button.Parent = mainFrame
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 8)
    buttonCorner.Parent = button
    
    -- Hiệu ứng hover
    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    end)
    
    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    end)
    
    -- Sự kiện click - copy link
    button.MouseButton1Click:Connect(function()
        setclipboard(link)
        button.Text = "✓ ĐÃ COPY!"
        button.BackgroundColor3 = Color3.fromRGB(85, 255, 85)
        wait(1.5)
        button.Text = text
        button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    end)
    
    return button
end

-- Tạo nút Discord
local discordButton = createButton("📱 COPY LINK DISCORD", UDim2.new(0, 25, 0, 180), discordLink)

-- Tạo nút YouTube
local youtubeButton = createButton("🎬 COPY LINK YOUTUBE", UDim2.new(0, 245, 0, 180), youtubeLink)

-- Thêm chú thích
local note = Instance.new("TextLabel")
note.Name = "Note"
note.Size = UDim2.new(1, -40, 0, 30)
note.Position = UDim2.new(0, 20, 0, 245)
note.BackgroundTransparency = 1
note.Text = "Nhấn nút để copy link và dán vào trình duyệt"
note.TextColor3 = Color3.fromRGB(150, 150, 150)
note.TextSize = 12
note.Font = Enum.Font.Gotham
note.TextXAlignment = Enum.TextXAlignment.Center
note.Parent = mainFrame

-- Hiệu ứng xuất hiện
mainFrame.BackgroundTransparency = 1
for i = 1, 0, -0.05 do
    mainFrame.BackgroundTransparency = i
    wait(0.02)
end

print("Script outdated notification loaded!")

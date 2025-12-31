--[[
🥔 + Esticar Tela | Painel Premium Completo
- Painel moderno com animações suaves
- FPS flutuante com cores dinâmicas
- Barra de progresso animada
- Slider grande para esticar tela
- Ícone 🥔 para abrir/fechar painel
- Mensagens animadas
- Detecção de dispositivo
]]

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Detecta dispositivo
local isMobile = UserInputService.TouchEnabled

-- Valor inicial do esticar tela
local stretchValue = isMobile and 65 or 75

-- GUI principal
local ScreenGui = Instance.new("ScreenGui", PlayerGui)
ScreenGui.Name = "PotatoFPSPanel"

local mainFrame = Instance.new("Frame", ScreenGui)
mainFrame.Size = UDim2.new(0, 400, 0, 450)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -225)
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mainFrame.BorderSizePixel = 0
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 15)
mainFrame.Visible = true

-- Título
local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, -20, 0, 50)
title.Position = UDim2.new(0, 10, 0, 10)
title.Text = "🥔 + Esticar Tela"
title.TextColor3 = Color3.fromRGB(0, 255, 0)
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.BackgroundTransparency = 1

-- Status do dispositivo
local statusLabel = Instance.new("TextLabel", mainFrame)
statusLabel.Size = UDim2.new(0.3,0,0,25)
statusLabel.Position = UDim2.new(0.05,0,0.1,0)
statusLabel.BackgroundTransparency = 1
statusLabel.Font = Enum.Font.GothamBold
statusLabel.TextScaled = true
statusLabel.TextColor3 = Color3.fromRGB(255,255,255)
statusLabel.Text = isMobile and "📱 Mobile" or "💻 PC"

-- Barra de progresso
local progressBarBack = Instance.new("Frame", mainFrame)
progressBarBack.Size = UDim2.new(0.8, 0, 0, 25)
progressBarBack.Position = UDim2.new(0.1, 0, 0.25, 0)
progressBarBack.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Instance.new("UICorner", progressBarBack).CornerRadius = UDim.new(0, 12)

local progressBar = Instance.new("Frame", progressBarBack)
progressBar.Size = UDim2.new(0, 0, 1, 0)
progressBar.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
Instance.new("UICorner", progressBar).CornerRadius = UDim.new(0, 12)

-- FPS flutuante
local fpsLabel = Instance.new("TextLabel", ScreenGui)
fpsLabel.Size = UDim2.new(0, 140, 0, 40)
fpsLabel.Position = UDim2.new(0, 10, 0.9, -50)
fpsLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
fpsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
fpsLabel.Text = "FPS: 0"
fpsLabel.Font = Enum.Font.GothamBold
fpsLabel.TextScaled = true
Instance.new("UICorner", fpsLabel).CornerRadius = UDim.new(0, 12)
fpsLabel.Visible = false

-- Botão otimizar (🥔)
local optimizeBtn = Instance.new("TextButton", mainFrame)
optimizeBtn.Size = UDim2.new(0.8, 0, 0, 50)
optimizeBtn.Position = UDim2.new(0.1, 0, 0.4, 0)
optimizeBtn.Text = "🥔 + Esticar Tela"
optimizeBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 220)
Instance.new("UICorner", optimizeBtn).CornerRadius = UDim.new(0, 12)
optimizeBtn.TextScaled = true

-- Slider esticar tela
local sliderBack = Instance.new("Frame", mainFrame)
sliderBack.Size = UDim2.new(0.8, 0, 0, 30)
sliderBack.Position = UDim2.new(0.1, 0, 0.55, 0)
sliderBack.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Instance.new("UICorner", sliderBack).CornerRadius = UDim.new(0, 12)

local slider = Instance.new("Frame", sliderBack)
slider.Size = UDim2.new((stretchValue-45)/35, 0, 1, 0)
slider.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
Instance.new("UICorner", slider).CornerRadius = UDim.new(0, 12)

-- Valor slider
local sliderValueLabel = Instance.new("TextLabel", mainFrame)
sliderValueLabel.Size = UDim2.new(0.2, 0, 0, 25)
sliderValueLabel.Position = UDim2.new(0.8, 0, 0.55, 0)
sliderValueLabel.BackgroundTransparency = 1
sliderValueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
sliderValueLabel.Text = tostring(stretchValue)
sliderValueLabel.Font = Enum.Font.GothamBold
sliderValueLabel.TextScaled = true

-- Funções Tween
local function tweenProgress(percent)
    local goal = {Size = UDim2.new(percent, 0, 1, 0)}
    local tween = TweenService:Create(progressBar, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), goal)
    tween:Play()
end

local function tweenButton(btn, newColor)
    local goal = {BackgroundColor3 = newColor}
    local tween = TweenService:Create(btn, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), goal)
    tween:Play()
end

-- Atualizar FPS flutuante
RunService.RenderStepped:Connect(function()
    local fps = math.floor(1 / RunService.RenderStepped:Wait())
    fpsLabel.Text = "FPS: "..fps
    if fps < 30 then
        fpsLabel.TextColor3 = Color3.fromRGB(255,0,0)
    elseif fps < 50 then
        fpsLabel.TextColor3 = Color3.fromRGB(255,255,0)
    else
        fpsLabel.TextColor3 = Color3.fromRGB(0,255,0)
    end
end)

-- Função de otimização 🥔 + Esticar Tela
optimizeBtn.MouseButton1Click:Connect(function()
    fpsLabel.Visible = true
    tweenProgress(0.3)
    
    -- Limpeza de efeitos
    for _, v in ipairs(workspace:GetDescendants()) do
        if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") or v:IsA("Fire") or v:IsA("Sparkles") then
            v.Enabled = false
        end
        if v:IsA("Part") or v:IsA("MeshPart") then
            v.Material = Enum.Material.Plastic
            v.CastShadow = false
            v.Reflectance = 0
        end
    end
    
    -- Ajusta stretch da tela
    workspace.CurrentCamera.FieldOfView = stretchValue
    
    tweenProgress(1)
    wait(0.5)
    tweenProgress(0)
    
    -- Mensagem animada
    local msg = Instance.new("TextLabel", mainFrame)
    msg.Size = UDim2.new(0.8,0,0,30)
    msg.Position = UDim2.new(0.1,0,0.75,0)
    msg.BackgroundTransparency = 1
    msg.Text = "Otimizado com sucesso!"
    msg.TextColor3 = Color3.fromRGB(0,255,0)
    msg.Font = Enum.Font.GothamBold
    msg.TextScaled = true
    msg.TextTransparency = 1
    local tween = TweenService:Create(msg, TweenInfo.new(0.5), {TextTransparency=0})
    tween:Play()
    wait(1.5)
    tween = TweenService:Create(msg, TweenInfo.new(0.5), {TextTransparency=1})
    tween:Play()
    tween.Completed:Wait()
    msg:Destroy()
end)

-- Ícone 🥔 para abrir/fechar painel
local icon = Instance.new("TextButton", ScreenGui)
icon.Size = UDim2.new(0,50,0,50)
icon.Position = UDim2.new(0,10,0,10)
icon.Text = "🥔"
icon.TextScaled = true
icon.Visible = false
Instance.new("UICorner", icon).CornerRadius = UDim.new(0,12)

icon.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
    icon.Visible = not mainFrame.Visible
end)

-- Botão fechar
local closeBtn = Instance.new("TextButton", mainFrame)
closeBtn.Size = UDim2.new(0,30,0,30)
closeBtn.Position = UDim2.new(1,-35,0,5)
closeBtn.Text = "X"
closeBtn.TextScaled = true
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0,6)
closeBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
    icon.Visible = true
end)

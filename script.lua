-- DRINHO | 🥔 + Esticar Tela (PAINEL MODERNO)

-- Mobile: 0.65 | PC: 0.70

-- Base: Blox Fruits

local Players = game:GetService("Players")

local RunService = game:GetService("RunService")

local Lighting = game:GetService("Lighting")

local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer

local PlayerGui = player:WaitForChild("PlayerGui")

-- evita múltiplas execuções

if getgenv().DrinhoPanelLoaded then return end

getgenv().DrinhoPanelLoaded = true

-- ================= CONFIGURAÇÃO =================

getgenv().StretchEnabled = false

-- detectar dispositivo

local isMobile = UIS.TouchEnabled and not UIS.KeyboardEnabled

if isMobile then

    getgenv().StretchValue = 0.65 -- 📱 Mobile (valor inicial alterado)

else

    getgenv().StretchValue = 0.70 -- 💻 PC

end

-- ================= GUI =================

local gui = Instance.new("ScreenGui", PlayerGui)

gui.Name = "drinho.fps"

gui.ResetOnSpawn = false

local main = Instance.new("Frame", gui)

main.Size = UDim2.fromScale(0.36, 0.55)

main.Position = UDim2.fromScale(0.32, 0.22)

main.BackgroundColor3 = Color3.fromRGB(12,12,12)

main.BorderSizePixel = 0

main.Active = true

main.Draggable = true

Instance.new("UICorner", main).CornerRadius = UDim.new(0,14)

-- HEADER

local header = Instance.new("TextLabel", main)

header.Size = UDim2.fromScale(1, 0.12)

header.BackgroundTransparency = 1

header.Text = "drinho • FPS Boost"

header.Font = Enum.Font.GothamBold

header.TextScaled = true

header.TextColor3 = Color3.fromRGB(0,170,255)

-- BOTÃO 🥔 + ESTICAR TELA

local btn = Instance.new("TextButton", main)

btn.Position = UDim2.fromScale(0.1, 0.15)

btn.Size = UDim2.fromScale(0.8, 0.12)

btn.Text = "🥔 + Esticar Tela"

btn.Font = Enum.Font.Gotham

btn.TextScaled = true

btn.BackgroundColor3 = Color3.fromRGB(0,120,220)

btn.TextColor3 = Color3.new(1,1,1)

Instance.new("UICorner", btn).CornerRadius = UDim.new(0,12)

-- BOTÃO SHOW FPS

local fpsBtn = Instance.new("TextButton", main)

fpsBtn.Position = UDim2.fromScale(0.1, 0.30)

fpsBtn.Size = UDim2.fromScale(0.8, 0.12)

fpsBtn.Text = "Show FPS"

fpsBtn.Font = Enum.Font.Gotham

fpsBtn.TextScaled = true

fpsBtn.BackgroundColor3 = Color3.fromRGB(0,120,220)

fpsBtn.TextColor3 = Color3.new(1,1,1)

Instance.new("UICorner", fpsBtn).CornerRadius = UDim.new(0,12)

-- BOTÃO FECHAR

local closeBtn = Instance.new("TextButton", main)

closeBtn.Size = UDim2.fromScale(0.12, 0.15)

closeBtn.Position = UDim2.fromScale(0.88, 0.02)

closeBtn.Text = "X"

closeBtn.Font = Enum.Font.GothamBold

closeBtn.TextScaled = true

closeBtn.BackgroundColor3 = Color3.fromRGB(220,0,0)

closeBtn.TextColor3 = Color3.fromRGB(255,255,255)

Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0,8)

-- BARRA DE PROGRESSO

local barBG = Instance.new("Frame", main)

barBG.Position = UDim2.fromScale(0.1, 0.45)

barBG.Size = UDim2.fromScale(0.8, 0.05)

barBG.BackgroundColor3 = Color3.fromRGB(40,40,40)

barBG.BorderSizePixel = 0

Instance.new("UICorner", barBG).CornerRadius = UDim.new(1,0)

local bar = Instance.new("Frame", barBG)

bar.Size = UDim2.fromScale(0,1)

bar.BackgroundColor3 = Color3.fromRGB(0,200,255)

bar.BorderSizePixel = 0

Instance.new("UICorner", bar).CornerRadius = UDim.new(1,0)

local percent = Instance.new("TextLabel", barBG)

percent.Size = UDim2.fromScale(1,1)

percent.BackgroundTransparency = 1

percent.Text = "0%"

percent.Font = Enum.Font.GothamBold

percent.TextScaled = true

percent.TextColor3 = Color3.new(1,1,1)

-- STATUS

local status = Instance.new("TextLabel", main)

status.Position = UDim2.fromScale(0.1, 0.52)

status.Size = UDim2.fromScale(0.8, 0.35)

status.BackgroundTransparency = 1

status.TextWrapped = true

status.TextScaled = true

status.Font = Enum.Font.Gotham

status.TextColor3 = Color3.fromRGB(200,200,200)

status.Text = "Pronto para otimizar.\nDispositivo: "..(isMobile and "📱 Mobile" or "💻 PC").."\nEsticar Tela: "..getgenv().StretchValue

-- ================= SLIDER ESTICAR TELA (MAIOR) =================

local sliderFrame = Instance.new("Frame", main)

sliderFrame.Position = UDim2.fromScale(0.05, 0.85)

sliderFrame.Size = UDim2.fromScale(0.9, 0.18)  -- mais alto e largo

sliderFrame.BackgroundColor3 = Color3.fromRGB(40,40,40)

Instance.new("UICorner", sliderFrame).CornerRadius = UDim.new(0,14)

local sliderBG = Instance.new("Frame", sliderFrame)

sliderBG.Size = UDim2.fromScale(1,0.7)

sliderBG.Position = UDim2.fromScale(0,0.15)

sliderBG.BackgroundColor3 = Color3.fromRGB(70,70,70)

Instance.new("UICorner", sliderBG).CornerRadius = UDim.new(1,0)

local sliderBar = Instance.new("Frame", sliderBG)

sliderBar.Size = UDim2.fromScale((getgenv().StretchValue-0.45)/(0.80-0.45),1)

sliderBar.BackgroundColor3 = Color3.fromRGB(0,200,255)

Instance.new("UICorner", sliderBar).CornerRadius = UDim.new(1,0)

local sliderLabel = Instance.new("TextLabel", sliderFrame)

sliderLabel.Size = UDim2.fromScale(1,1)

sliderLabel.BackgroundTransparency = 1

sliderLabel.Text = "Esticar Tela: "..getgenv().StretchValue

sliderLabel.Font = Enum.Font.GothamBold

sliderLabel.TextScaled = true

sliderLabel.TextColor3 = Color3.fromRGB(255,255,255)

-- ================= SLIDER FUNCIONAL UNIVERSAL =================

local sliderDragging = false

local function updateSlider(inputPosX)

    local absPos = sliderBG.AbsolutePosition.X

    local absSize = sliderBG.AbsoluteSize.X

    local newValue = (inputPosX - absPos)/absSize

    newValue = math.clamp(newValue, 0.45, 0.80)           -- limite mínimo e máximo

    newValue = math.floor(newValue/0.05 + 0.5) * 0.05    -- incrementos de 0.05

    getgenv().StretchValue = newValue

    sliderBar.Size = UDim2.fromScale((newValue-0.45)/(0.80-0.45),1)

    sliderLabel.Text = string.format("Esticar Tela: %.2f", newValue)

end

-- PC

sliderBG.InputBegan:Connect(function(input)

    if input.UserInputType == Enum.UserInputType.MouseButton1 then

        sliderDragging = true

        updateSlider(UIS:GetMouseLocation().X)

    end

end)

sliderBG.InputEnded:Connect(function(input)

    if input.UserInputType == Enum.UserInputType.MouseButton1 then

        sliderDragging = false

    end

end)

UIS.InputChanged:Connect(function(input)

    if sliderDragging and input.UserInputType == Enum.UserInputType.MouseMovement then

        updateSlider(input.Position.X)

    end

end)

-- Mobile

sliderBG.InputBegan:Connect(function(input)

    if input.UserInputType == Enum.UserInputType.Touch then

        sliderDragging = true

        updateSlider(input.Position.X)

    end

end)

sliderBG.InputEnded:Connect(function(input)

    if input.UserInputType == Enum.UserInputType.Touch then

        sliderDragging = false

    end

end)

sliderBG.InputChanged:Connect(function(input)

    if sliderDragging and input.UserInputType == Enum.UserInputType.Touch then

        updateSlider(input.Position.X)

    end

end)

-- ================= FUNÇÃO DE PROGRESSO =================

local function progress()

	for i = 1, 100 do		bar.Size = UDim2.fromScale(i/100,1)

		percent.Text = i.."%"

		task.wait(0.012)

	end

end

-- ================= FUNÇÃO DE OTIMIZAÇÃO (BATATA) =================

local function optimizeFPS()

	Lighting.GlobalShadows = false

	Lighting.Brightness = 0

	Lighting.FogEnd = 9e9

	Lighting.EnvironmentDiffuseScale = 0

	Lighting.EnvironmentSpecularScale = 0

	pcall(function() if Lighting:FindFirstChild("Clouds") then Lighting.Clouds:Destroy() end end)

	for _,v in ipairs(workspace:GetDescendants()) do

		if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") or v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") then

			v.Enabled = false

		end

		if v:IsA("Explosion") then v.Visible = false end

		if v:IsA("Decal") or v:IsA("Texture") then v.Transparency = 1 end

		if v:IsA("Terrain") then

			v.WaterWaveSize = 0

			v.WaterWaveSpeed = 0

			v.WaterReflectance = 0

			v.WaterTransparency = 1

		end

		if v:IsA("Part") or v:IsA("MeshPart") then

			v.Material = Enum.Material.Plastic

			v.Reflectance = 0

			v.CastShadow = false

		end

	end

end

-- ================= FUNÇÃO DE ESTICAR TELA =================

RunService.RenderStepped:Connect(function()

	if getgenv().StretchEnabled then

		workspace.CurrentCamera.CFrame *= CFrame.new(0,0,0,1,0,0,0,getgenv().StretchValue,0,0,0,1)

	end

end)

-- ================= BOTÃO 🥔 + ESTICAR TELA =================

btn.MouseButton1Click:Connect(function()

	btn.Text = "Otimizando..."

	bar.Size = UDim2.fromScale(0,1)

	percent.Text = "0%"

	progress()

	optimizeFPS()

	getgenv().StretchEnabled = true

	status.Text =

	"✔ Otimização concluída 🥔\n"..

	"• Partículas removidas\n"..

	"• Efeitos de ataques desativados\n"..

	"• Nuvens removidas\n"..

	"• Stretch de tela ativo\n"..

	"Dispositivo: "..(isMobile and "📱 Mobile" or "💻 PC").."\n"..

	"Esticar Tela: "..getgenv().StretchValue

	btn.Text = "✔ 🥔 Ativo"

end)

-- ================= FPS FLUTUANTE =================

local fpsGui = Instance.new("ScreenGui", PlayerGui)

fpsGui.Name = "FPSDisplay"

fpsGui.ResetOnSpawn = false

fpsGui.Enabled = false

local fpsFrame = Instance.new("Frame", fpsGui)

fpsFrame.Size = UDim2.fromScale(0.12,0.05)

fpsFrame.Position = UDim2.fromScale(0.02,0.9)

fpsFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)

fpsFrame.BorderSizePixel = 0

fpsFrame.Active = true

fpsFrame.Draggable = true

Instance.new("UICorner", fpsFrame).CornerRadius = UDim.new(0,8)

local fpsLabel = Instance.new("TextLabel", fpsFrame)

fpsLabel.Size = UDim2.fromScale(1,1)

fpsLabel.BackgroundTransparency = 1

fpsLabel.Text = "FPS: 0"

fpsLabel.Font = Enum.Font.GothamBold

fpsLabel.TextScaled = true

fpsLabel.TextColor3 = Color3.fromRGB(0,200,255)

local lastTime = tick()

local fps = 0

RunService.RenderStepped:Connect(function()

	if fpsGui.Enabled then

		local current = tick()

		fps = 1 / (current - lastTime)

		lastTime = current

		fpsLabel.Text = "FPS: "..math.floor(fps)

		if fps < 30 then

			fpsLabel.TextColor3 = Color3.fromRGB(255,0,0)

		elseif fps < 50 then

			fpsLabel.TextColor3 = Color3.fromRGB(255,255,0)

		else

			fpsLabel.TextColor3 = Color3.fromRGB(0,200,255)

		end

	end

end)

fpsBtn.MouseButton1Click:Connect(function()

	fpsGui.Enabled = not fpsGui.Enabled

end)

-- ================= BOTÃO FECHAR + ÍCONE 🥔 =================

local reopenBtn = Instance.new("TextButton", PlayerGui)

reopenBtn.Size = UDim2.fromOffset(100,100)

reopenBtn.Position = UDim2.fromScale(0.01,0.85)  

reopenBtn.Text = "🥔"

reopenBtn.Font = Enum.Font.GothamBold

reopenBtn.TextScaled = true

reopenBtn.BackgroundColor3 = Color3.fromRGB(0,120,220)

reopenBtn.TextColor3 = Color3.fromRGB(255,255,255)

Instance.new("UICorner", reopenBtn).CornerRadius = UDim.new(0,16)

reopenBtn.Visible = false

reopenBtn.ZIndex = 10

closeBtn.MouseButton1Click:Connect(function()

	main.Visible = false

	reopenBtn.Visible = true

end)

reopenBtn.MouseButton1Click:Connect(function()

	main.Visible = true

	reopenBtn.Visible = false

end)

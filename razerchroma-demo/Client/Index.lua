Package.Subscribe("Load", function ()
    Timer.SetTimeout(StartChroma, 2000)
end)

function StartChroma()
    local color = {}
    for i = 1, 6, 1 do
        color[i] = {}
        for b = 1, 22, 1 do
            color[i][b] = Color.FromHEX("000000")
        end
    end

    --[[Events.Call("Chroma:SetKeyboardColor", Color.FromHEX("000000"))
    Events.Call("Chroma:SetKeyColor", 3, 4, Color.FromHEX("ffffff")) -- W
    Events.Call("Chroma:SetKeyColor", 4, 3, Color.FromHEX("ffffff")) -- A
    Events.Call("Chroma:SetKeyColor", 4, 4, Color.FromHEX("ffffff")) -- S
    Events.Call("Chroma:SetKeyColor", 4, 5, Color.FromHEX("ffffff")) -- D
    Events.Call("Chroma:SetKeyColor", 5, 2, Color.FromHEX("ffffff")) -- Shift
    Events.Call("Chroma:SetKeyColor", 6, 2, Color.FromHEX("ffffff")) -- ctrl
    Events.Call("Chroma:SetKeyColor", 6, 8, Color.FromHEX("ffffff")) -- SpaceBar
    Events.Call("Chroma:SetKeyColor", 5, 8, Color.FromHEX("757575")) -- B
    Events.Call("Chroma:SetKeyColor", 3, 3, Color.FromHEX("757575")) -- Q (for SpawnMenu)
    Events.Call("Chroma:SetKeyColor", 1, 2, Color.FromHEX("757575")) -- Escape]]

    
    color[3][4] = Color.FromHEX("ffffff") -- W
    color[4][3] = Color.FromHEX("ffffff") -- A
    color[4][4] = Color.FromHEX("ffffff") -- S
    color[4][5] = Color.FromHEX("ffffff") -- D
    color[5][2] = Color.FromHEX("ffffff") -- Shift
    color[6][2] = Color.FromHEX("ffffff") -- ctrl
    color[6][8] = Color.FromHEX("ffffff") -- SpaceBar
    color[5][8] = Color.FromHEX("333333") -- B
    color[3][3] = Color.FromHEX("333333") -- Q (for SpawnMenu)
    color[1][2] = Color.FromHEX("333333") -- Escape

    Events.Call("Chroma:SetKeyColors", color)
    Events.Call("Chroma:SetMouseColor", Color.FromHEX("ffffff")) -- Set whole Mouse to white
end

Chat.Subscribe("Open", function()
	Events.Call("Chroma:SetKeyboardColor", Color.FromHEX("ffffff"))
end)
Chat.Subscribe("Close", function()
	StartChroma()
end)

Weapon.Subscribe("Fire", function(self, shooter)
	if shooter:GetPlayer():IsLocalPlayer() then
        Events.Call("Chroma:SetKeyboardColor", Color.FromHEX("ff8000"))
        Events.Call("Chroma:SetMouseColor", Color.FromHEX("ff8000"))
        Timer.SetTimeout(StartChroma, 150)
    end
end)
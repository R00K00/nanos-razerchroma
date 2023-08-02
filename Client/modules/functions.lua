function RgbToBgr(rgb)
    -- Validate input: rgb should be a table with 3 elements representing R, G, and B values
    if type(rgb) ~= "table" or #rgb ~= 3 then
      error("Input should be a table with 3 elements (R, G, B).")
    end
  
    -- Concatenate the Blue, Green, and Red values into a single integer
    local bgrNumber = (rgb[3] * 65536) + (rgb[2] * 256) + rgb[1]
  
    return bgrNumber
end
  
  

Package.Subscribe("Load", function()
	StartWebUI()
end)



-- Keyboard (Row: 6 , Col: 22) --

local color = {}
for i = 1, 6, 1 do
    color[i] = {}
    for b = 1, 22, 1 do
        color[i][b] = 0
    end
end

function SetKeyColor(row, column, pcolor)
    local kcolor = RgbToBgr({pcolor.R*255, pcolor.G*255, pcolor.B*255})
    color[row][column] = kcolor
    razer_ui:CallEvent("ChromaJS:SetKeyboardColor", color)
end
function SetKeyColors(k_array)
    for i, v in ipairs(k_array) do
        for i2, v2 in ipairs(k_array[i]) do
            if k_array[i][i2] ~= 0 then
                k_array[i][i2] = RgbToBgr({k_array[i][i2].R*255, k_array[i][i2].G*255, k_array[i][i2].B*255})
            end
        end
    end
    razer_ui:CallEvent("ChromaJS:SetKeyboardColor", k_array)
end
function RemoveKeyColor(row, column)
    color[row][column] = 0
    razer_ui:CallEvent("ChromaJS:SetKeyboardColor", color)
end

function SetKeyboardColor(pcolor)
    local kcolor = RgbToBgr({pcolor.R*255, pcolor.G*255, pcolor.B*255})
    for i, v in ipairs(color) do
        for i2, v2 in ipairs(color[i]) do
            color[i][i2] = kcolor;
        end
    end
    razer_ui:CallEvent("ChromaJS:SetKeyboardColor", color)
end
function RemoveKeyboardColor()
    for i, v in ipairs(color) do
        for i2, v2 in ipairs(color[i]) do
            color[i][i2] = 0;
        end
    end
    razer_ui:CallEvent("ChromaJS:SetKeyboardColor", color)
end

Events.Subscribe("Chroma:SetKeyColor", SetKeyColor)
Events.SubscribeRemote("Chroma:SetKeyColor", SetKeyColor)
--
Events.Subscribe("Chroma:SetKeyColors", SetKeyColors)
Events.SubscribeRemote("Chroma:SetKeyColors", SetKeyColors)
--
Events.Subscribe("Chroma:RemoveKeyColor", RemoveKeyColor)
Events.SubscribeRemote("Chroma:RemoveKeyColor", RemoveKeyColor)
--
Events.Subscribe("Chroma:SetKeyboardColor", SetKeyboardColor)
Events.SubscribeRemote("Chroma:SetKeyboardColor", SetKeyboardColor)
--
Events.Subscribe("Chroma:RemoveKeyboardColor", RemoveKeyboardColor)
Events.SubscribeRemote("Chroma:RemoveKeyboardColor", RemoveKeyboardColor)


-- Mouse (Row: 9 , Col: 7) --

local mouse_color = {}
for i = 1, 9, 1 do
    mouse_color[i] = {}
    for b = 1, 7, 1 do
        mouse_color[i][b] = 0
    end
end

function SetMouseSpecificColor(row, column, pcolor)
    local kcolor = RgbToBgr({pcolor.R*255, pcolor.G*255, pcolor.B*255})
    mouse_color[row][column] = kcolor
    razer_ui:CallEvent("ChromaJS:SetMouseColor", mouse_color)
end
function RemoveMouseSpecificColor(row, column)
    mouse_color[row][column] = 0
    razer_ui:CallEvent("ChromaJS:SetMouseColor", mouse_color)
end
function SetMouseColor(pcolor)
    local kcolor = RgbToBgr({pcolor.R*255, pcolor.G*255, pcolor.B*255})
    for i, v in ipairs(mouse_color) do
        for i2, v2 in ipairs(mouse_color[i]) do
            mouse_color[i][i2] = kcolor;
        end
    end
    razer_ui:CallEvent("ChromaJS:SetMouseColor", mouse_color)
end
function RemoveMouseColor()
    for i, v in ipairs(mouse_color) do
        for i2, v2 in ipairs(mouse_color[i]) do
            mouse_color[i][i2] = 0;
        end
    end
    razer_ui:CallEvent("ChromaJS:SetMouseColor", mouse_color)
end

Events.Subscribe("Chroma:SetMouseSpecificColor", SetMouseSpecificColor)
Events.SubscribeRemote("Chroma:SetMouseSpecificColor", SetMouseSpecificColor)
--
Events.Subscribe("Chroma:RemoveMouseSpecificColor", RemoveMouseSpecificColor)
Events.SubscribeRemote("Chroma:RemoveMouseSpecificColor", RemoveMouseSpecificColor)
--
Events.Subscribe("Chroma:SetMouseColor", SetMouseColor)
Events.SubscribeRemote("Chroma:SetMouseColor", SetMouseColor)
--
Events.Subscribe("Chroma:RemoveMouseColor", RemoveMouseColor)
Events.SubscribeRemote("Chroma:RemoveMouseColor", RemoveMouseColor)
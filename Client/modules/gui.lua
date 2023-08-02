-- Loading a local file

Connected = false
razer_ui = nil

function StartWebUI()
    if razer_ui ~= nil then
        return
    end
    razer_ui = WebUI(
        "RazerChroma",
        "file://modules/GUI/index.html",
        WebUIVisibility.Hidden
    )
end

Events.Subscribe("ChromaJS:Connected", function ()
    Connected = true
end)
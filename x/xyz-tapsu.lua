tapsu = false

RegisterCommand("xyz", function(source, args, rawCommand)
    tapsu = not tapsu
end, false)

Citizen.CreateThread( function()
    while true do 
        Citizen.Wait(1)
        if tapsu then
            local pos = GetEntityCoords(GetPlayerPed(-1))
            local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
            Teksti(0.22, 0.88, 0.4,0.4,0.30, "ID: " ..  GetPlayerServerId(PlayerId()), 0, 255, 255, 255)
            Teksti(0.22, 0.90, 0.4,0.4,0.30, "H: " ..  math.floor(GetEntityHeading(GetPlayerPed(-1))), 0, 255, 255, 255)
            Teksti(0.22, 0.92, 0.4,0.4,0.30, "X,Y,Z: " .. pos, 0, 255, 255, 255)
            Teksti(0.22, 0.94, 0.4,0.4,0.30, "HP: " .. GetEntityHealth(GetPlayerPed(-1)).. "%", 173, 255, 47, 255)
            Teksti(0.22, 0.96, 0.4,0.4,0.30, "Armor: " .. GetPedArmour(GetPlayerPed(-1)).. "%", 173, 255, 47, 255)
            Teksti(0.22, 0.98, 0.4,0.4,0.30, "Nopeus: " .. math.floor(GetEntitySpeed(GetPlayerPed(-1)) * 3.6) .. " kmh", 173, 255, 47, 255)
        end
    end
end)

function Teksti(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(0.25, 0.25)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end
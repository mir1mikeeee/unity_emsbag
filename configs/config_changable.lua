ESX = exports["es_extended"]:getSharedObject()

-- Notify-Funktion
function Notify(msg)
    ESX.ShowNotification(msg)
end

function progressBar(msg)
    local playerPed = PlayerPedId()

    ESX.Progressbar(msg, 2500, {
        animation = {
            type = "Scenario",
            Scenario = "CODE_HUMAN_MEDIC_TEND_TO_DEAD"
        }
    })

    -- Animation stoppen nach Ablauf der Progressbar
    Wait(2500) -- Wartezeit sollte der Dauer der Progressbar entsprechen
    ClearPedTasksImmediately(playerPed)
end


-- Events für das Hinzufügen von Items
RegisterNetEvent('unity_emsbag:Client:GiveRadio')
AddEventHandler("unity_emsbag:Client:GiveRadio", function()
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, true)
    progressBar("Taking a Radio ...")
    TriggerServerEvent("unity_emsbag:Server:AddItem", "radio", 1)
end)

RegisterNetEvent('unity_emsbag:Client:Givebandage')
AddEventHandler("unity_emsbag:Client:Givebandage", function()
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, true)
    progressBar("Taking Bandage ...")
    TriggerServerEvent("unity_emsbag:Server:AddItem", "bandage", 1)
end)

RegisterNetEvent('unity_emsbag:Client:Givepainkillers')
AddEventHandler("unity_emsbag:Client:Givepainkillers", function()
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, true)
    progressBar("Taking Painkillers ...")
    TriggerServerEvent("unity_emsbag:Server:AddItem", "painkillers", 1)
end)

RegisterNetEvent('unity_emsbag:Client:Givefirstaid')
AddEventHandler("unity_emsbag:Client:Givefirstaid", function()
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, true)
    progressBar("Taking Firstaid ...")
    TriggerServerEvent("unity_emsbag:Server:AddItem", "firstaid", 1)
end)

RegisterNetEvent('unity_emsbag:Client:Giveweapon_flashlight')
AddEventHandler("unity_emsbag:Client:Giveweapon_flashlight", function()
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, true)
    progressBar("Taking Flashlight ...")
    TriggerServerEvent("unity_emsbag:Server:AddItem", "weapon_flashlight", 1)
end)

RegisterNetEvent('unity_emsbag:Client:Giveblood500ml')
AddEventHandler("unity_emsbag:Client:Giveblood500ml", function()
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, true)
    progressBar("Getting Blood Pack 500ml ...")
    TriggerServerEvent("unity_emsbag:Server:AddItem", "blood500ml", 5)
end)

RegisterNetEvent('unity_emsbag:Client:Givesaline500ml')
AddEventHandler("unity_emsbag:Client:Givesaline500ml", function()
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, true)
    progressBar("Getting Saline Pack 500ml ...")
    TriggerServerEvent("unity_emsbag:Server:AddItem", "saline500ml", 5)
end)

RegisterNetEvent('unity_emsbag:Client:Giverevivekit')
AddEventHandler("unity_emsbag:Client:Giverevivekit", function()
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, true)
    progressBar("Getting Revive Kit ...")
    TriggerServerEvent("unity_emsbag:Server:AddItem", "revivekit", 1)
end)

RegisterNetEvent('unity_emsbag:Client:Givetourniquet')
AddEventHandler("unity_emsbag:Client:Givetourniquet", function()
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, true)
    progressBar("Getting Tourniquet ...")
    TriggerServerEvent("unity_emsbag:Server:AddItem", "tourniquet", 5)
end)

RegisterNetEvent('unity_emsbag:Client:Givefield_dressing')
AddEventHandler("unity_emsbag:Client:Givefield_dressing", function()
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, true)
    progressBar("Getting Field Dressing ...")
    TriggerServerEvent("unity_emsbag:Server:AddItem", "field_dressing", 5)
end)

RegisterNetEvent('unity_emsbag:Client:Giveelastic_bandage')
AddEventHandler("unity_emsbag:Client:Giveelastic_bandage", function()
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, true)
    progressBar("Getting Elastic Bandage ...")
    TriggerServerEvent("unity_emsbag:Server:AddItem", "elastic_bandage", 5)
end)

RegisterNetEvent('unity_emsbag:Client:Givequick_clot')
AddEventHandler("unity_emsbag:Client:Givequick_clot", function()
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, true)
    progressBar("Getting Quick Clot ...")
    TriggerServerEvent("unity_emsbag:Server:AddItem", "quick_clot", 5)
end)

RegisterNetEvent('unity_emsbag:Client:Givepacking_bandage')
AddEventHandler("unity_emsbag:Client:Givepacking_bandage", function()
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, true)
    progressBar("Getting Packing Bandage ...")
    TriggerServerEvent("unity_emsbag:Server:AddItem", "packing_bandage", 5)
end)

RegisterNetEvent('unity_emsbag:Client:Givesewing_kit')
AddEventHandler("unity_emsbag:Client:Givesewing_kit", function()
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, true)
    progressBar("Getting Sewing Kit ...")
    TriggerServerEvent("unity_emsbag:Server:AddItem", "sewing_kit", 5)
end)

RegisterNetEvent('unity_emsbag:Client:Giveepinephrine')
AddEventHandler("unity_emsbag:Client:Giveepinephrine", function()
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, true)
    progressBar("Getting Epinephrine ...")
    TriggerServerEvent("unity_emsbag:Server:AddItem", "epinephrine", 5)
end)

RegisterNetEvent('unity_emsbag:Client:Givemorphine')
AddEventHandler("unity_emsbag:Client:Givemorphine", function()
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, true)
    progressBar("Getting Morphine ...")
    TriggerServerEvent("unity_emsbag:Server:AddItem", "morphine", 5)
end)


lib.registerContext({
    id = 'ambulance_bag_menu',
    title = 'SAFR-Tasche',
    options = {
        {
            title = 'SAFR-Tasche öffnen',
            description = 'Öffnet die SAFR-Tasche',
            event = 'unity_emsbag:Client:StorageAmbulanceBag',
            icon = 'fa-solid fa-suitcase-medical',
            iconColor = '#800000' -- Dunkelrot
        },
        {
            title = 'Blutkonserve 500ml',
            description = '500ml Blutkonserve nehmen',
            event = 'unity_emsbag:Client:Giveblood500ml',
            icon = 'fa-solid fa-tint',
            iconColor = '#800000' -- Dunkelrot
        },
        {
            title = 'Kochsalzlösung 500ml',
            description = '500ml Kochsalzlösung nehmen',
            event = 'unity_emsbag:Client:Givesaline500ml',
            icon = 'fa-solid fa-flask',
            iconColor = '#800000' -- Dunkelrot
        },
        {
            title = 'Wiederbelebungsset nehmen',
            description = 'Wiederbelebungsset',
            event = 'unity_emsbag:Client:Giverevivekit',
            icon = 'fa-solid fa-heartbeat',
            iconColor = '#800000' -- Dunkelrot
        },
        {
            title = 'Tourniquet',
            description = 'Tourniquet nehmen',
            event = 'unity_emsbag:Client:Givetourniquet',
            icon = 'fa-solid fa-bandage',
            iconColor = '#800000' -- Dunkelrot
        },
        {
            title = 'Verbandset',
            description = 'Verbandset nehmen',
            event = 'unity_emsbag:Client:Givefield_dressing',
            icon = 'fa-solid fa-first-aid',
            iconColor = '#800000' -- Dunkelrot
        },
        {
            title = 'Elastikbandage',
            description = 'Elastikbandage nehmen',
            event = 'unity_emsbag:Client:Giveelastic_bandage',
            icon = 'fa-solid fa-ribbon',
            iconColor = '#800000' -- Dunkelrot
        },
        {
            title = 'Quick Clot',
            description = 'Quick Clot nehmen',
            event = 'unity_emsbag:Client:Givequick_clot',
            icon = 'fa-solid fa-pills',
            iconColor = '#800000' -- Dunkelrot
        },
        {
            title = 'Packverband',
            description = 'Packverband nehmen',
            event = 'unity_emsbag:Client:Givepacking_bandage',
            icon = 'fa-solid fa-first-aid',
            iconColor = '#800000' -- Dunkelrot
        },
        {
            title = 'Nähset',
            description = 'Nähset nehmen',
            event = 'unity_emsbag:Client:Givesewing_kit',
            icon = 'fa-solid fa-syringe',
            iconColor = '#800000' -- Dunkelrot
        },
        {
            title = 'Epinephrin',
            description = 'Epinephrin nehmen',
            event = 'unity_emsbag:Client:Giveepinephrine',
            icon = 'fa-solid fa-syringe',
            iconColor = '#800000' -- Dunkelrot
        },
        {
            title = 'Morphin',
            description = 'Morphin nehmen',
            event = 'unity_emsbag:Client:Givemorphine',
            icon = 'fa-solid fa-capsules',
            iconColor = '#800000' -- Dunkelrot
        }
    }
})

-- Menüauslöser
RegisterNetEvent('unity_emsbag:Client:MenuAmbulanceBag', function()
    local playerPed = PlayerPedId()

    if IsEntityDead(playerPed) then 
        return Notify("Du kannst die SAFR-Tasche nicht öffnen, während du tot bist") 
    end
    if IsPedSwimming(playerPed) then 
        return Notify("Du kannst die SAFR-Tasche nicht im Wasser öffnen") 
    end
    if IsPedSittingInAnyVehicle(playerPed) then 
        return Notify("Du kannst die SAFR-Tasche nicht in einem Fahrzeug öffnen") 
    end
    lib.showContext('ambulance_bag_menu')

end)
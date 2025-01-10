ESX = exports["es_extended"]:getSharedObject()

local emsbag1 = nil

-- EMS-Bag fallenlassen
local function dropemsbag()
    DetachEntity(emsbag1)
    PlaceObjectOnGroundProperly(emsbag1)
    emsbag1 = nil
end

-- EMS-Bag spawnen
local function spawnemsbag()
    local hasBag = true
    CreateThread(function()
        while hasBag do
            Wait(0)
            if IsControlJustReleased(0, 38) then -- Wenn "E" gedrückt wird, lass die Tasche fallen
                hasBag = false
                dropemsbag()
                Wait(1000)
            end
        end
    end)
end

RegisterNetEvent('unity_emsbag:Client:spawnLight')
AddEventHandler('unity_emsbag:Client:spawnLight', function()
    -- Code für die Funktion
    TriggerEvent('unity_emsbag:Client:SpawnAmbulanceBag') -- Falls dies der korrekte Trigger ist
end)

-- EMS-Bag erstellen
RegisterNetEvent('unity_emsbag:Client:SpawnAmbulanceBag', function()
    if emsbag1 then return end
    local hash = GetHashKey('prop_cs_shopping_bag')
    local ped = PlayerPedId()
    local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(ped, 0.0, 3.0, 0.5))

    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Wait(0)
    end

    emsbag1 = CreateObjectNoOffset(hash, x, y, z, true, false)
    SetModelAsNoLongerNeeded(hash)
    AttachEntityToEntity(emsbag1, ped, GetPedBoneIndex(ped, 57005), 0.42, 0, -0.05, 0.10, 270.0, 60.0, true, true, false, true, 1, true)

    spawnemsbag()
    TriggerServerEvent("ox_inventory:removeItem", "emsbag", 1)
end)

-- EMS-Bag zurücknehmen
-- EMS-Bag zurücknehmen
RegisterNetEvent('unity_emsbag:Client:GuardarAmbulanceBag', function()
    local playerPed = PlayerPedId()
    local playerPos = GetEntityCoords(playerPed)
    local AmbulanceBag = GetClosestObjectOfType(playerPos, 10.0, GetHashKey("prop_cs_shopping_bag"), false, false, false)

    if DoesEntityExist(AmbulanceBag) then
        TaskStartScenarioInPlace(playerPed, "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, true)
        progressBar("SAFR-Tasche wird wieder mitgenommen...")
        SetEntityAsMissionEntity(AmbulanceBag, 1, 1)
        DeleteObject(AmbulanceBag)
        TriggerServerEvent("unity_emsbag:Server:AddItem", "emsbag", 1)
        ESX.ShowNotification("SAFR-Tasche erfolgreich mitgenommen!")
    else
        ESX.ShowNotification("Keine SAFR-Tasche in der Nähe gefunden!")
    end
end)


-- EMS-Bag als Lager benutzen
RegisterNetEvent('unity_emsbag:Client:StorageAmbulanceBag', function()
    local playerData = ESX.GetPlayerData()
    local identifier = playerData and playerData.identifier or "default"
    local stashId = "ambulance_bag_" .. identifier


    TriggerServerEvent('unity_emsbag:Server:CreateStash', stashId)


    exports.ox_inventory:openInventory('stash', {
        id = stashId,
        owner = identifier,
        label = "SAFR-Tasche",
        slots = Config.Stash.MaxSlotsStash
    })
end)

function missingTarget()
    CreateThread(function()
        while true do
            print('[ERROR] Missing target resource! Contact the server team!')
            Wait(2000)
        end
    end)
end

-- Ziel hinzufügen mit ox_target
local AmbulanceBags = {
    `prop_cs_shopping_bag`,
}

CreateThread(function()
    if GetResourceState('qtarget') == 'missing' and GetResourceState('ox_target') == 'missing' then
        return missingTarget()
    end
    exports['qtarget']:AddTargetModel(AmbulanceBags, {
        options = {
            {
                event   = "unity_emsbag:Client:MenuAmbulanceBag",
                icon    = "fa-solid fa-suitcase-medical",
                label   = "SAFR-Tasche öffnen" , 
                job = Config.Bag.Job 
            },
            {
                event   = "unity_emsbag:Client:GuardarAmbulanceBag",
                icon    = "fa-solid fa-suitcase-medical",
                label   = "SAFR-Tasche mitnehmen" , 
                job = Config.Bag.Job },
        },
        distance = 2.0 }
    )
end)
ESX = exports["es_extended"]:getSharedObject()

local Objects = {}

-- Funktion zur Erstellung einer eindeutigen Objekt-ID
local function CreateObjectId()
    local objectId = math.random(10000, 99999)
    while Objects[objectId] do
        objectId = math.random(10000, 99999)
    end
    return objectId
end

-- EMS-Bag benutzbar machen
ESX.RegisterUsableItem('emsbag', function(source)
    TriggerClientEvent("unity_emsbag:Client:spawnLight", source)
end)


RegisterNetEvent('unity_emsbag:Server:CreateStash', function(stashId)
    local player = ESX.GetPlayerFromId(source)
    if player then
        exports.ox_inventory:RegisterStash(stashId, "SAFR-Tasche", Config.Stash.MaxSlotsStash, Config.Stash.MaxWeighStash)
    end
end)

-- EMS-Bag spawnen
RegisterNetEvent('unity_emsbag:Server:SpawnAmbulanceBag', function(type)
    local src = source
    local objectId = CreateObjectId()
    Objects[objectId] = type
    TriggerClientEvent("unity_emsbag:Client:SpawnAmbulanceBag", src, objectId, type, src)
end)

RegisterNetEvent('unity_emsbag:Server:RemoveItem', function(src, item, amount)
    local player = ESX.GetPlayerFromId(src)
    if player then
        player.removeInventoryItem(item, amount)
    end
end)

RegisterNetEvent('unity_emsbag:Server:AddItem', function(item, amount)
    local src = source
    local player = ESX.GetPlayerFromId(src)
    if player then
        player.addInventoryItem(item, amount)
    end
end)
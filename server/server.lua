ESX = exports["es_extended"]:getSharedObject()
lib.locale()

ESX.RegisterUsableItem('emsbag', function(source)
    TriggerClientEvent("unity_emsbag:client:SpawnAmbulanceBag", source)
end)

RegisterNetEvent('unity_emsbag:server:CreateStash', function(stashId)
    local player = ESX.GetPlayerFromId(source)
    if player then
        exports.ox_inventory:RegisterStash(stashId, locale("inventory_label"), Config.Stash.slots, Config.Stash.maxweight)
    end
end)

RegisterNetEvent('unity_emsbag:server:RemoveBagItem', function()
    local player = ESX.GetPlayerFromId(source)
    if player then
        player.removeInventoryItem('emsbag', 1)
    end
end)

RegisterNetEvent('unity_emsbag:server:AddItem', function(item)
    local src = source
    local player = ESX.GetPlayerFromId(src)
    local amount = 1
    for _, button in pairs(Config.MenuItems) do
        if button.item == item then
            amount = button.add_amount or 1
        end
    end
    if player then
        player.addInventoryItem(item, amount)
    end
end)
while FRAMEWORK == nil do
    Wait(100)
end

FRAMEWORK.RegisterUsableItem('emsbag', function(source)
    TriggerClientEvent("unity_emsbag:client:SpawnAmbulanceBag", source)
end)

RegisterNetEvent('unity_emsbag:server:CreateStash', function(stashId)
    local player = FRAMEWORK.GetPlayerFromId(source)
    if player then
        exports.ox_inventory:RegisterStash(stashId, locale("inventory_label"), Config.Stash.slots, Config.Stash.maxweight)
    end
end)

RegisterNetEvent('unity_emsbag:server:openQBInv', function(stashId)
    local player = FRAMEWORK.GetPlayerFromId(source)
    if player then
        exports['qb-inventory']:OpenInventory(source, stashId, Config.Stash)
    end
end)

RegisterNetEvent('unity_emsbag:server:RemoveBagItem', function()
    local player = FRAMEWORK.GetPlayerFromId(source)
    if player then
        FRAMEWORK.RemoveItem(player, 'emsbag', 1)
    end
end)

RegisterNetEvent('unity_emsbag:server:AddItem', function(item)
    local src = source
    local player = FRAMEWORK.GetPlayerFromId(src)
    local amount = 1
    for _, button in pairs(Config.MenuItems) do
        if button.item == item then
            amount = button.add_amount or 1
        end
    end
    if player then
        FRAMEWORK.AddItem(player, item, amount)
    end
end)
while FRAMEWORK == nil do
    Wait(100)
end

RegisterNetEvent('unity_emsbag:client:action')
AddEventHandler("unity_emsbag:client:action", function(action, item)
    local playerPed = PlayerPedId()
    local playerPos = GetEntityCoords(playerPed)
    if action == 'takeItem' then
        progressBar(locale('progress_take_item', getItemLabel(item)), 2500, function()
            TriggerServerEvent("unity_emsbag:server:AddItem", item)
        end)
    elseif action == 'openStash' then
        local playerData = FRAMEWORK.GetPlayerData()
        local identifier = playerData and (playerData.identifier and playerData.identifier or playerData.citizenid)
        local stashId = "ambulance_bag_" .. identifier
        if not identifier then
            return Notify(locale('no_identifier'), 'error', 5000)
        end
        if GetResourceState('ox_inventory') == 'started' then
            TriggerServerEvent('unity_emsbag:server:CreateStash', stashId)
            exports.ox_inventory:openInventory('stash', {
                id = stashId,
                owner = identifier,
                label = locale("inventory_label"),
                slots = Config.Stash.slots,
                weight = Config.Stash.maxweight
            })
        elseif GetResourceState('qs-inventory') == 'started' then
            TriggerServerEvent('inventory:server:OpenInventory', 'stash', stashId, Config.Stash)
            TriggerEvent("inventory:client:SetCurrentStash", stashId)
        elseif GetResourceState('qb-inventory') == 'started' then
            TriggerServerEvent('unity_emsbag:server:openQBInv', stashId)
        end
    elseif action == 'removeBag' then
        if DoesEntityExist(item) then
            progressBar(locale("progress_take_ems_bag"), 2500, function()
                local timeout = 1000
                local start = GetGameTimer()
    
                while not NetworkHasControlOfEntity(item) and (GetGameTimer() - start < timeout) do
                    NetworkRequestControlOfEntity(item)
                    Wait(0)
                end
    
                if NetworkHasControlOfEntity(item) then
                    SetEntityAsMissionEntity(item, true, true)
                    DeleteEntity(item)
                    TriggerServerEvent("unity_emsbag:server:AddItem", "emsbag")
                    Notify(locale("took_bag_in_inventory"))
                else
                    Notify(locale("no_bag_nearby"))
                end
            end)
        else
            Notify(locale("no_bag_nearby"))
        end
    elseif action == 'openMenu' then
        if IsEntityDead(playerPed) then 
            return Notify(locale("your_cant_open_dead")) 
        end
        if IsPedSwimming(playerPed) then 
            return Notify(locale("your_cant_open_swimming")) 
        end
        if IsPedSittingInAnyVehicle(playerPed) then 
            return Notify(locale("your_cant_open_in_vehicle"))
        end
        lib.showContext('ambulance_bag_menu')
    end
end)

CreateThread(function()

    if Config.useTarget then
        if GetResourceState('ox_target') == 'missing' and GetResourceState('qb-target') == 'missing' then
            return missingTarget()
        end

        if GetResourceState('ox_target') == 'started' then
            exports.ox_target:addModel(Config.AmbulanceBag, {
                {
                    name    = "unity_emsbag:MenuAmbulanceBag",
                    icon    = "fa-solid fa-suitcase-medical",
                    label   = locale("open_inventory"), 
                    groups = Config.allowedJobs,
                    job = Config.allowedJobs,
                    distance = 2.0,
                    onSelect = function(data)
                        TriggerEvent('unity_emsbag:client:action', 'openMenu')
                    end
                },
                {
                    name    = "unity_emsbag:removeBag",
                    icon    = "fa-solid fa-suitcase-medical",
                    label   = locale("take_bag_back"),
                    groups = Config.allowedJobs,
                    job = Config.allowedJobs,
                    distance = 2.0,
                    onSelect = function(data)
                        TriggerEvent('unity_emsbag:client:action', 'removeBag', data.entity)
                    end
                },
            })
        elseif GetResourceState('qb-target') == 'started' then
            exports["qb-target"]:AddTargetModel(Config.AmbulanceBag, {
                options = {
                    {
                        name    = "unity_emsbag:MenuAmbulanceBag",
                        icon    = "fa-solid fa-suitcase-medical",
                        label   = locale("open_inventory"), 
                        job = Config.allowedJobs,
                        action = function(data)
                            TriggerEvent('unity_emsbag:client:action', 'openMenu')
                        end
                    },
                    {
                        name    = "unity_emsbag:removeBag",
                        icon    = "fa-solid fa-suitcase-medical",
                        label   = locale("take_bag_back"),
                        job = Config.allowedJobs,
                        action = function(entity)
                            TriggerEvent('unity_emsbag:client:action', 'removeBag', entity)
                        end
                    },
                },
                distance = 2.0
            })
        end
    else
        runNonTargetTask()
    end

    local menuList = {
        {
            title = locale("open_inventory"),
            description = '',
            onSelect = function()
                TriggerEvent('unity_emsbag:client:action', 'openStash')
            end,
            icon = 'fa-solid fa-suitcase-medical',
            iconColor = '#800000' -- Dunkelrot
        },
    }

    for _, button in pairs(Config.MenuItems) do
        table.insert(menuList, {
            title = getItemLabel(button.item),
            description = button.description or locale("menu_take_item_description", getItemLabel(button.item)),
            onSelect = function()
                TriggerEvent('unity_emsbag:client:action', 'takeItem', button.item)
            end,
            icon = button.icon,
            iconColor = button.iconColor
        })
    end

    lib.registerContext({
        id = 'ambulance_bag_menu',
        title = locale("inventory_label"),
        options = menuList
    })
end)



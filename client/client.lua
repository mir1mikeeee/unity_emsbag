ESX = exports["es_extended"]:getSharedObject()
lib.locale()
RegisterNetEvent('unity_emsbag:client:SpawnAmbulanceBag', createBagObject)
RegisterNetEvent('unity_emsbag:client:notify', Notify)

RegisterNetEvent('unity_emsbag:client:action')
AddEventHandler("unity_emsbag:client:action", function(action, ...)
    local playerPed = PlayerPedId()
    local playerPos = GetEntityCoords(playerPed)
    if action == 'takeItem' then
        progressBar(locale('progress_take_item', getItemLabel(item)), 2500,function()
            TriggerServerEvent("unity_emsbag:server:AddItem", item)
        )
    elseif action == 'openStash' then
        local playerData = ESX.GetPlayerData()
        local identifier = playerData and playerData.identifier
        local stashId = "ambulance_bag_" .. identifier
        if not identifier then
            return Notify(locale('no_identifier'), 'error', 5000)
        end
        TriggerServerEvent('unity_emsbag:server:CreateStash', stashId)
        exports.ox_inventory:openInventory('stash', {
            id = stashId,
            owner = identifier,
            label = locale("inventory_label"),
            slots = Config.Stash.MaxSlotsStash
        })
    elseif action == 'removeBag' then
        local AmbulanceBag = getNearbyBag()

        if DoesEntityExist(AmbulanceBag) then
            TaskStartScenarioInPlace(playerPed, "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, true)
            progressBar(locale("progress_take_ems_bag"), 2500, function()
                SetEntityAsMissionEntity(AmbulanceBag, 1, 1)
                DeleteObject(AmbulanceBag)
                TriggerServerEvent("unity_emsbag:server:AddItem", "emsbag")
                Notify(locale("took_bag_in_inventory"))
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
    while ESX.IsPlayerLoaded() do
        Wait(100)
    end
    if GetResourceState('ox_target') == 'missing' then
        return missingTarget()
    end
    exports.ox_target:addModel(Config.AmbulanceBag, {
        {
            name    = "unity_emsbag:MenuAmbulanceBag",
            event   = "unity_emsbag:client:MenuAmbulanceBag",
            icon    = "fa-solid fa-suitcase-medical",
            label   = locale("open_inventory"), 
            groups = Config.allowedJobs,
            distance = 2.0,
            onSelect = function(data)
                TriggerEvent('unity_emsbag:client:action', 'openBag')
            end
        },
        {
            name    = "unity_emsbag:removeBag",
            icon    = "fa-solid fa-suitcase-medical",
            label   = locale("take_bag_back"), 
            groups = Config.allowedJobs,
            distance = 2.0,
            onSelect = function(data)
                TriggerEvent('unity_emsbag:client:action', 'removeBag')
            end
        },
    })

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
                TriggerEvent('unity_emsbag:client:action', 'takeItem', item = button.item)
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



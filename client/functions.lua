while FRAMEWORK == nil do
    Wait(100)
end

local emsbagObject = nil
local hasBag = false

function dropemsbag()
    DetachEntity(emsbagObject)
    PlaceObjectOnGroundProperly(emsbagObject)
    emsbagObject = nil
end

function createBagObject()
    if emsbagObject ~= nil then return end
    local hash = GetHashKey(Config.AmbulanceBag)
    local ped = PlayerPedId()
    local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(ped, 0.0, 3.0, 0.5))

    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Wait(0)
    end
    hasBag = true
    emsbagObject = CreateObjectNoOffset(hash, x, y, z, true, false)
    SetModelAsNoLongerNeeded(hash)
    AttachEntityToEntity(emsbagObject, ped, GetPedBoneIndex(ped, 57005), 0.42, 0, -0.05, 0.10, 270.0, 60.0, true, true, false, true, 1, true)
    
    TriggerServerEvent('unity_emsbag:server:RemoveBagItem')
    Wait(1500)
    CreateThread(function()
        while hasBag do
            Wait(0)
            if IsControlJustReleased(0, 38) then
                hasBag = false
                dropemsbag()
                Wait(1000)
            end
        end
    end)
end
RegisterNetEvent('unity_emsbag:client:SpawnAmbulanceBag', createBagObject)

function Notify(msg, type, time)
    FRAMEWORK.ShowNotification(msg, type or 'info', time or 5000)
end
RegisterNetEvent('unity_emsbag:client:notify', Notify)

function progressBar(msg, time, cb)
    if Config.progressBarType == 'ox' then
        if lib.progressCircle({
            label = msg,
            duration = time or 2500,
            position = 'bottom',
            useWhileDead = false,
            canCancel = false,
            disable = {
                car = true,
            },
            anim = {
                scenario = Config.AnimationScenario
            },
        }) then 
            cb()
        else 
        end
    else
        FRAMEWORK.Progressbar(msg, time or 2500, cb)
    end
end

function runAnimantion(time)
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, Config.AnimationScenario, 0, true)
    Wait(time or 2500)
    ClearPedTasksImmediately(playerPed)
end

function missingTarget()
    CreateThread(function()
        while true do
            print('[ERROR] Missing target resource! Contact the server team!')
            Wait(2000)
        end
    end)
end

function getItemLabel(item)
    local data = "UNKNOWN LABEL (" .. item .. ")"
    if GetResourceState('ox_inventory') == 'started' then
        if exports.ox_inventory:Items(item) and exports.ox_inventory:Items(item).label then
            data = exports.ox_inventory:Items(item).label
        end
    elseif GetResourceState('qs-inventory') == 'started' then
        for k, items in pairs(exports['qs-inventory']:GetItemList()) do
            if items.name == item then
                data = items.label
                break
            end
        end
    elseif GetResourceState('qb-inventory') == 'started' then
        local sharedobj = exports["qb-core"]:GetCoreObject()
        for key, value in pairs (sharedobj.Shared.Items) do
            if value.name == item then
                data = value.label
                break
            end
        end
    end
    return data
end

function runNonTargetTask()

    CreateThread(function()
        while true do
            local sleep = 2000
            local coords = GetEntityCoords(PlayerPedId())
            local object, distance = GetClosestObject(coords, {Config.AmbulanceBag})
            if object and not hasBag then
                if distance < 2.0 then
                    sleep = 0
                    ShowHelpNotification(locale("no_target_help_notify", '~' .. Config.OpenMenuKeyString .. '~', '~' .. Config.TakeKeyString .. '~'))
                    if IsControlJustPressed(0, Config.OpenMenuKey) then
                        TriggerEvent('unity_emsbag:client:action', 'openMenu')
                    end

                    if IsControlJustPressed(0, Config.TakeKey) then
                        TriggerEvent('unity_emsbag:client:action', 'removeBag', object)
                    end
                end
            end
            Wait(sleep)
        end
    end)

end

function ShowHelpNotification(text)
    BeginTextCommandDisplayHelp("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayHelp(0, false, true, -1)
end

function GetClosestObject(coords, objectList)
    local closestObject = nil
    local closestDistance = nil

    for _, objectName in pairs(objectList) do
        local object = GetClosestObjectOfType(coords.x, coords.y, coords.z, 50.0, GetHashKey(objectName), false, false, false)
        if DoesEntityExist(object) then
            local objCoords = GetEntityCoords(object)
            local distance = #(coords - objCoords)

            if closestDistance == nil then
                closestObject = object
                closestDistance = distance
            end
        end
    end

    return closestObject, closestDistance
end
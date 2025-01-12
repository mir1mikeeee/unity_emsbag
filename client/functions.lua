local emsbagObject = nil
local hasBag = false

function dropemsbag()
    DetachEntity(emsbagObject)
    PlaceObjectOnGroundProperly(emsbagObject)
    emsbagObject = nil
end

function createBagObject()
    if emsbagObject then return end
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

function getNearbyBag()
    local convertedBaglist = {}
    convertedBaglist[Config.AmbulanceBag] = true
    return ESX.Game.GetClosestObject(GetEntityCoords(PlayerPedId()), convertedBaglist)
end

function Notify(msg, type, time)
    ESX.ShowNotification(msg, type or 'info', time or 5000)
end

function progressBar(msg, time, cb)
    ESX.Progressbar(msg, time or 2500, {
        animation = {
            type = "Scenario",
            Scenario = Config.AnimationScenario
        },
        onFinish = cb
    })
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
    local data = exports.ox_inventory:Items(item)
    return data.label
end
FRAMEWORK = nil
lib.locale()
if IsDuplicityVersion() then
    if GetResourceState("qb-core") == "started" then
        QBCore = exports["qb-core"]:GetCoreObject()
        FRAMEWORK = setmetatable({}, {
            __index = function(_, key)
                if key == "GetPlayerFromId" then
                    return function(source) return QBCore.Functions.GetPlayer(source) end
                elseif key == "GetPlayerData" then
                    return function(source) return QBCore.Functions.GetPlayer(source).PlayerData end
                elseif key == "RegisterServerCallback" then
                    return function(name, cb) QBCore.Functions.CreateCallback(name, cb) end
                elseif key == "RegisterUsableItem" then
                    return function(item, cb)
                        QBCore.Functions.CreateUseableItem(item, cb)
                    end
                elseif key == "GetAccountMoney" then
                    return function(player, account) return player.Functions.GetMoney(account) end
                elseif key == "AddMoney" then
                    return function(player, account, amount) player.Functions.AddMoney(account, amount or 1) end
                elseif key == "RemoveMoney" then
                    return function(player, account, amount) player.Functions.RemoveMoney(account, amount or 1) end
                elseif key == "AddItem" then
                    return function(player, item, count) player.Functions.AddItem(item, count or 1) end
                elseif key == "RemoveItem" then
                    return function(player, item, count) player.Functions.RemoveItem(item, count or 1) end
                end
                return nil
            end
        })
    elseif GetResourceState("es_extended") == "started" then
        ESX = exports["es_extended"]:getSharedObject()
        FRAMEWORK = setmetatable({}, {
            __index = function(_, key)
                if key == "GetPlayerFromId" then
                    return function(source) return ESX.GetPlayerFromId(source) end
                elseif key == "GetPlayerData" then
                    return function(source) return ESX.GetPlayerFromId(source) end
                elseif key == "RegisterServerCallback" then
                    return function(name, cb) ESX.RegisterServerCallback(name, cb) end
                elseif key == "RegisterUsableItem" then
                    return function(item, cb)
                        ESX.RegisterUsableItem(item, cb)
                    end
                elseif key == "GetAccountMoney" then
                    return function(player, account) return player.getAccount(account).money end
                elseif key == "AddMoney" then
                    return function(player, account, amount) player.addAccountMoney(account, amount or 1) end
                elseif key == "RemoveMoney" then
                    return function(player, account, amount) player.removeAccountMoney(account, amount or 1) end
                elseif key == "AddItem" then
                    return function(player, item, count) player.addInventoryItem(item, count or 1) end
                elseif key == "RemoveItem" then
                    return function(player, item, count) player.removeInventoryItem(item, count or 1) end
                end
                return nil
            end
        })
    end
else
    if GetResourceState("qb-core") == "started" then
        QBCore = exports["qb-core"]:GetCoreObject()
        FRAMEWORK = setmetatable({}, {
            __index = function(_, key)
                if key == "GetPlayerData" then
                    return function() return QBCore.Functions.GetPlayerData() end
                elseif key == "TriggerServerCallback" then
                    return function(name, source, cb, ...)
                        QBCore.Functions.TriggerCallback(name, source, cb, ...)
                    end
                elseif key == "ShowNotification" then
                    return function(text, type, lenght)
                        QBCore.Functions.Notify(text, 'primary', length or 5000)
                    end
                elseif key == "GetAuthJob" then
                    return function()
                        return Config.allowedJobs[QBCore.Functions.GetPlayerData().job.name] >= 0 or false
                    end
                elseif key == "Progressbar" then
                    return function(msg, time, cb)
                        QBCore.Functions.Progressbar('EMSBAG', msg, time or 2500, false, false, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true
                            }, {
                                animDict = nil,
                                anim = nil,
                                flags = 0,
                                task = Config.AnimationScenario,
                        }, {}, {}, function() 
                            cb()
                            ClearPedTasks(PlayerPedId())
                        end)
                    end
                end
                return nil
            end
        })
    elseif GetResourceState("es_extended") == "started" then
        ESX = exports["es_extended"]:getSharedObject()
        FRAMEWORK = setmetatable({}, {
            __index = function(_, key)
                if key == "GetPlayerData" then
                    return function() return ESX.GetPlayerData() end
                elseif key == "TriggerServerCallback" then
                    return function(name, cb, ...)
                        ESX.TriggerServerCallback(name, cb, ...)
                    end
                elseif key == "ShowNotification" then
                    return function(text, type, lenght)
                        ESX.ShowNotification(text, type or 'info', lenght or 5000)
                    end
                elseif key == "GetAuthJob" then
                    return function()
                        return Config.allowedJobs[ESX.GetPlayerData().job.name] >= 0 or false
                    end
                elseif key == "Progressbar" then
                    return function(msg, time, cb)
                        ESX.Progressbar(msg, time or 2500, {
                            animation = {
                                type = "Scenario",
                                Scenario = Config.AnimationScenario
                            },
                            onFinish = cb
                        })
                    end
                end
                return nil
            end
        })
    end
end
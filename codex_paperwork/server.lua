local QBCore = exports['qb-core']:GetCoreObject()

local paperworkMode = {}

RegisterCommand("paperwork", function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local job = Player.PlayerData.job
    if job.name ~= "police" then
        TriggerClientEvent('QBCore:Notify', src, "This command is for police only.", "error")
        return
    end

    if paperworkMode[src] then
        paperworkMode[src] = nil
        TriggerClientEvent('QBCore:Notify', src, "You have exited paperwork mode.", "success")
        TriggerClientEvent("qb-paperwork:togglePaperwork", src, false)
    else
        paperworkMode[src] = true
        TriggerClientEvent('QBCore:Notify', src, "You are now in paperwork mode. You will not count toward active duty numbers.", "primary")
        TriggerClientEvent("qb-paperwork:togglePaperwork", src, true)
    end
end)

exports("IsPaperworkMode", function(playerId)
    return paperworkMode[playerId] == true
end)

AddEventHandler("playerDropped", function(reason)
    local src = source
    paperworkMode[src] = nil
end)

RegisterNetEvent('qb-paperwork:offDutyCleanup', function()
    local src = source
    paperworkMode[src] = nil
end)

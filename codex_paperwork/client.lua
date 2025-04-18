RegisterNetEvent("qb-paperwork:togglePaperwork", function(state)
    local label = state and "entered" or "exited"
    print("[Paperwork Mode] You have " .. label .. " paperwork mode.")
end)

-- Optional: If your job/duty toggle has an event, use this to auto-exit paperwork mode
-- Example: Listen to duty toggle event
RegisterNetEvent("police:client:OffDuty", function()
    TriggerServerEvent("qb-paperwork:offDutyCleanup")
end)

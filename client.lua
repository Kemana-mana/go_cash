ESX = nil
QBCore = nil
local TestTarget = Config.TestTarget

Citizen.CreateThread(function()
    frameworkObject = GetFrameworkObject() 
end)


local function moneyMenu()
    if Config.Menu == 'ox' then
            local input = lib.inputDialog('Money Menu', {
            {type = 'number', label = 'ID of recipent', description = 'The ID of the recipent.', default = 1, min = '1', required = true, icon = 'user'},
            {type = 'number', label = '$ Amount', description = 'The amount of money to send to the recipent.', default = 10, minimun = '1', required = true, icon = 'dollar-sign'},
            {type = 'input', label = 'Message For Recipient', description = 'The message to send with the money to the recipent.', default = 'Here, have some cash.', minimun = '0', required = false, icon = 'message'}
        })

    if not input[1] or not input[2] then return end
        if not input then return end
             TriggerServerEvent("go_cash:server:chargerecipientOX", input[1], input[2], input[3])
    end
end

CreateThread(function()
    if Config.Target == 'qb' then
        exports['qb-target']:AddGlobalPlayer({
            options = {
                { 
                    action = function()
                        moneyMenu()
                    end,
                    icon = "fas fa-money",
                    label = "Give Recipient Cash",
                },
            },
            distance = 3.0
        })
else if Config.Target == 'ox' then
    exports.ox_target:addGlobalPlayer({
        options = {
            {
                onSelect = function()
                    moneyMenu()
                end,
                icon = "fas fa-money",
                label = "Give Recipient Cash",
            },
        },
        distance = 3.0
    })
    end
  end
end)

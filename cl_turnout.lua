-- DON'T TOUCH BELOW UNLESS YOU KNOW WHAT YOUR DOING!!!!!!!


local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qb-turnout:Client:TurnoutOff', function ()

    while not HasAnimDictLoaded("clothingtie") do RequestAnimDict("clothingtie") Wait(100) end
	TaskPlayAnim(PlayerPedId(), "clothingtie", "try_tie_negative_a", 3.0, 3.0, 1200, 51, 0, false, false, false)
    Wait(1200)
    TriggerServerEvent("qb-clothes:loadPlayerSkin") -- LOADING PLAYER'S CLOTHES
    TriggerServerEvent("qb-clothing:loadPlayerSkin") -- LOADING PLAYER'S CLOTHES - Event 2
end)

RegisterNetEvent('qb-turnout:Client:TurnoutOn', function ()

        while not HasAnimDictLoaded("clothingtie") do RequestAnimDict("clothingtie") Wait(100) end
	TaskPlayAnim(PlayerPedId(), "clothingtie", "try_tie_negative_a", 3.0, 3.0, 1200, 51, 0, false, false, false)
    Wait(1200)


    -- Pants
    if config.turnout.pants ~= nil then
        SetPedComponentVariation(PlayerPedId(), 4, config.turnout.pants.item, config.turnout.pants.texture, 0)
    end
    -- Arms
    if config.turnout.arms ~= nil then
        SetPedComponentVariation(PlayerPedId(), 3, config.turnout.arms.item, config.turnout.arms.texture, 0)
    end

    -- T-Shirt
    if config.turnout.tshirt ~= nil then
        SetPedComponentVariation(PlayerPedId(), 8, config.turnout.tshirt.item, config.turnout.tshirt.texture, 0)
    end

    -- Vest
    if config.turnout.vest ~= nil then
        SetPedComponentVariation(PlayerPedId(), 9, config.turnout.vest.item, config.turnout.vest.texture, 0)
    end

    -- Torso 2
    if config.turnout.torso2 ~= nil then
        SetPedComponentVariation(PlayerPedId(), 11, config.turnout.torso2.item, config.turnout.torso2.texture, 0)
    end

    -- Shoes
    if config.turnout.shoes ~= nil then
        SetPedComponentVariation(PlayerPedId(), 6, config.turnout.shoes.item, config.turnout.shoes.texture, 0)
    end

    -- Bag
    if config.turnout.bag ~= nil then
        SetPedComponentVariation(PlayerPedId(), 5, config.turnout.bag.item, config.turnout.bag.texture, 0)
    end

    -- Badge
    if config.turnout.decals ~= nil then
        SetPedComponentVariation(PlayerPedId(), 10, config.turnout.decals.item, config.turnout.decals.texture, 0)
    end

    -- Accessory
    if config.turnout.accessory ~= nil then
            SetPedComponentVariation(PlayerPedId(), 7, config.turnout.accessory.item, config.turnout.accessory.texture, 0)
    end

    -- Mask
    if config.turnout.mask ~= nil then
        SetPedComponentVariation(PlayerPedId(), 1, config.turnout.mask.item, config.turnout.mask.texture, 0)
    end

    -- Hat
    if config.turnout.hat ~= nil then
            SetPedPropIndex(PlayerPedId(), 0, config.turnout.hat.item, config.turnout.hat.texture, true)
    end

    -- Glass
    if config.turnout.glass ~= nil then
            SetPedPropIndex(PlayerPedId(), 1, config.turnout.glass.item, config.turnout.glass.texture, true)
    end

    -- Ear
    if config.turnout.ear ~= nil then
            SetPedPropIndex(PlayerPedId(), 2, config.turnout.turnout.ear.item, config.turnout.ear.texture, true)
    end
    ClearPedProp(ped, 1)
end)


local turnoutMenu = {
    {
        isMenuHeader = true,
        header = 'Fire Turnout Gear',
    },
    {
        header = "Turnout Gear On",
        txt = "Puts your turnout gear on",
        params = {
            event = "qb-turnout:Client:TurnoutOn",
            args = {
                number = 1,
            }
        }
    },
    {
        header = "Turnout Gear Off",
        txt = "Takes your turnout gear off",
        params = {
            event = 'qb-turnout:Client:TurnoutOff',
            args = {
                number = 1,
            }
        }
    },
}

RegisterCommand("refreshcmds", function(source)
    if QBCore.Functions.HasPermission(source, 'admin') then
         QBCore.Commands.Refresh(source)
    else 
        TriggerClientEvent('QBCore:Notify', source, 'No permission', 'error')
    end
end)

RegisterCommand("turnout", function (source, args)
    exports['qb-menu']:openMenu(turnoutMenu)
end)

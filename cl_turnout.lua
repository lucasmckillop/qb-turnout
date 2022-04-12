-- DON'T TOUCH BELOW UNLESS YOU KNOW WHAT YOUR DOING!!!!!!!


local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qb-clothingcmds:Client:TurnoutOff', function ()

    while not HasAnimDictLoaded("clothingtie") do RequestAnimDict("clothingtie") Wait(100) end
	TaskPlayAnim(PlayerPedId(), "clothingtie", "try_tie_negative_a", 3.0, 3.0, 1200, 51, 0, false, false, false)
    Wait(1200)
    TriggerServerEvent("qb-clothes:loadPlayerSkin") -- LOADING PLAYER'S CLOTHES
    TriggerServerEvent("qb-clothing:loadPlayerSkin") -- LOADING PLAYER'S CLOTHES - Event 2
end)

RegisterNetEvent('qb-clothingcmds:Client:TurnoutOn', function ()

        while not HasAnimDictLoaded("clothingtie") do RequestAnimDict("clothingtie") Wait(100) end
	TaskPlayAnim(PlayerPedId(), "clothingtie", "try_tie_negative_a", 3.0, 3.0, 1200, 51, 0, false, false, false)
    Wait(1200)


    -- Pants
    if config.pants ~= nil then
        SetPedComponentVariation(PlayerPedId(), 4, config.pants.item, config.pants.texture, 0)
    end
    -- Arms
    if config.arms ~= nil then
        SetPedComponentVariation(PlayerPedId(), 3, config.arms.item, config.arms.texture, 0)
    end

    -- T-Shirt
    if config.tshirt ~= nil then
        SetPedComponentVariation(PlayerPedId(), 8, config.tshirt.item, config.tshirt.texture, 0)
    end

    -- Vest
    if config.vest ~= nil then
        SetPedComponentVariation(PlayerPedId(), 9, config.vest.item, config.vest.texture, 0)
    end

    -- Torso 2
    if config.torso2 ~= nil then
        SetPedComponentVariation(PlayerPedId(), 11, config.torso2.item, config.torso2.texture, 0)
    end

    -- Shoes
    if config.shoes ~= nil then
        SetPedComponentVariation(PlayerPedId(), 6, config.shoes.item, config.shoes.texture, 0)
    end

    -- Bag
    if config.bag ~= nil then
        SetPedComponentVariation(PlayerPedId(), 5, config.bag.item, config.bag.texture, 0)
    end

    -- Badge
    if config.decals ~= nil then
        SetPedComponentVariation(PlayerPedId(), 10, config.decals.item, config.decals.texture, 0)
    end

    -- Accessory
    if config.accessory ~= nil then
            SetPedComponentVariation(PlayerPedId(), 7, config.accessory.item, config.accessory.texture, 0)
    end

    -- Mask
    if config.mask ~= nil then
        SetPedComponentVariation(PlayerPedId(), 1, config.mask.item, config.mask.texture, 0)
    end

    -- Hat
    if config.hat ~= nil then
            SetPedPropIndex(PlayerPedId(), 0, config.hat.item, config.hat.texture, true)
    end

    -- Glass
    if config.glass ~= nil then
            SetPedPropIndex(PlayerPedId(), 1, config.glass.item, config.glass.texture, true)
    end

    -- Ear
    if config.ear ~= nil then
            SetPedPropIndex(PlayerPedId(), 2, config.ear.item, config.ear.texture, true)
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
            event = "qb-clothingcmds:Client:TurnoutOn",
            args = {
                number = 1,
            }
        }
    },
    {
        header = "Turnout Gear Off",
        txt = "Takes your turnout gear off",
        params = {
            event = 'qb-clothingcmds:Client:TurnoutOff',
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

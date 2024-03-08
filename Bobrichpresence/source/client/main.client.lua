local prevtime = GetGameTimer()
local prevframes = GetFrameCount()
local fps = -1

CreateThread(function()
    while not NetworkIsPlayerActive(PlayerId()) or not NetworkIsSessionStarted() do         
        Wait(500)
        prevframes = GetFrameCount()
        prevtime = GetGameTimer()            
    end

    while true do         
        curtime = GetGameTimer()
        curframes = GetFrameCount()       

        if (curtime - prevtime) > 1000 then
            fps = (curframes - prevframes) - 1                
            prevtime = curtime
            prevframes = curframes
        end      
        Wait(350)
    end    
end)

local activity = string.format('%s', (Config.Option.Display.Activity.Enable and ' | ' .. Config.Translate.General.Loading or ''))

local function formatInt(int)
    return tostring(int):reverse():gsub('%d%d%d', '%1,'):reverse():gsub('^,', '')
end

local function setRichPresence()
    SetDiscordAppId(Config.Discord.Application.ID)
    SetDiscordRichPresenceAsset(Config.Discord.Asset.Logo.Name)
    SetDiscordRichPresenceAssetText(Config.Discord.Asset.Logo.Text)
    SetDiscordRichPresenceAssetSmall(Config.Discord.Asset.Icon.Name)
    SetDiscordRichPresenceAssetSmallText(Config.Discord.Asset.Icon.Text)
    SetDiscordRichPresenceAction(0, Config.Discord.Button[1].Text, Config.Discord.Button[1].URL)
    SetDiscordRichPresenceAction(1, Config.Discord.Button[2].Text, Config.Discord.Button[2].URL)
end

Citizen.CreateThread(function()
    local resource = GetCurrentResourceName()
    local wait = (1000 * Config.Option.Update.Time)
    local id = (Config.Option.Display.ID.Enable and string.format('[%s] ', GetPlayerServerId(PlayerId())) or '')
    local name = (Config.Option.Display.Name.Enable and string.format('%s', GetPlayerName(PlayerId()))  or '')

    setRichPresence()
    
    while true do
        local state = GlobalState[resource]
        local active = (state and (Config.Option.Display.Online.Enable and string.format('%s/%s %s | %s', formatInt(state.players), formatInt(state.maxclients), Config.Translate.General.Player, state.details) or string.format('%s %s | %s', formatInt(state.maxclients), Config.Translate.General.Slot, state.details)) or Config.Translate.General.Loading)
        local detail = string.format('%s%s%s\n%s', id, name, activity, active)
        
        if Config.Option.Display.FPS.Enable and fps ~= -1 then
            detail = detail .. " | FPS: " .. fps
        end

        SetRichPresence(detail)

        Citizen.Wait(wait)
    end
end)

local function getPlayerActivities(ped, zone)
    local zone = (zone or Config.Translate.Unknown.Zone)
    local dead = IsEntityDead(ped)
    local water = IsEntityInWater(ped)

    if IsPedOnFoot(ped) and not water then
        if dead then
            return string.format(Config.Translate.Activity.Dead.Ground, zone)
        elseif IsPedStill(ped) then
            return string.format(Config.Translate.Activity.Ground.Standing, zone)
        elseif IsPedWalking(ped) then
            return string.format(Config.Translate.Activity.Ground.Walking, zone)
        elseif IsPedRunning(ped) then
            return string.format(Config.Translate.Activity.Ground.Running, zone)
        elseif IsPedSprinting(ped) then
            return string.format(Config.Translate.Activity.Ground.Sprinting, zone)
        end
    elseif water then
        if dead then
            return string.format(Config.Translate.Activity.Dead.Water, zone)
        else
            return string.format(Config.Translate.Activity.Water.Swimming, zone)
        end
    end

    local vehicle = GetVehiclePedIsIn(ped, false)

    if vehicle ~= 0 then
        local label = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))
        local plate = (Config.Option.Display.Activity.Plate.Enable and string.format('(%s)', GetVehicleNumberPlateText(vehicle)) or '')

        if dead then
            return string.format(Config.Translate.Activity.Dead.Vehicle, zone, label, plate)
        elseif IsPedInAnyBoat(ped) or IsPedInAnySub(ped) then
            return string.format(Config.Translate.Activity.Vehicle.Sailing, zone, label, plate)
        elseif IsEntityInWater(vehicle) then
            return string.format(Config.Translate.Activity.Vehicle.Drowning, zone, label, plate)
        elseif IsPedInAnyHeli(ped) or IsPedInAnyPlane(ped) then
            if IsEntityInAir(vehicle) then
                return string.format(Config.Translate.Activity.Vehicle.Flying, zone, label, plate)
            else
                return string.format(Config.Translate.Activity.Vehicle.Landed, zone, label, plate)
            end
        else
            local meters = GetEntitySpeed(vehicle)
            local speed = math.ceil(meters * 3.6)   -- KMH = * 3.6 | MPH = * 2.236936 (Source: https://docs.fivem.net/natives/?_0xD5037BA82E12416F)

            if speed == 0 then
                return string.format(Config.Translate.Activity.Vehicle.Parked, zone, label, plate)
            elseif speed <= 60 then -- KMH = 60 | MPH = 50
                return string.format(Config.Translate.Activity.Vehicle.Cruising, zone, label, plate)
            else
                return string.format(Config.Translate.Activity.Vehicle.Speeding, zone, label, plate)
            end
        end
    end

    if dead then
        return string.format(Config.Translate.Activity.Dead.Ground, zone)
    end

    return string.format(' | %s', Config.Translate.Unknown.Activity)
end

Citizen.CreateThread(function()
    local wait = 1000 * (Config.Option.Update.Time - 2)
    
    while Config.Option.Display.Activity.Enable do
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped, true)
        local zone = Config.Zone[GetNameOfZone(coords.x, coords.y, coords.z)]
        local state = getPlayerActivities(ped, zone)

        activity = string.format(' | %s', state)

        Citizen.Wait(wait)
    end
end)



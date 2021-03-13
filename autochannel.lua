AutoChannel = {VERSION = {major=1,minor=0,patch=5}}

local WARBAND = "/wb"
local PARTY = "/p"
local SCPARTY = "/sp"
local SCENARIO = "/sc"
local SAY = "/s"

local function getSmartPartyChannel()
    local groupData = GetGroupData()
    for k,v in pairs(groupData) do
        if v and v.name and v.name ~= L"" then
            return PARTY
        end
    end    
    return SAY
end

function AutoChannel.isScenario()
    if GameData.Player.isInScenario then
    	return true
    end
    if GameData.Player.isInSiege then
    	return true
    end
    if GameData.Player.zone == 167 then -- IC Siege
    	return true
    end
    if GameData.Player.zone == 168 then -- Altdorf Siege
    	return true
    end
    return false
end

local function getSmartBandChannel()
    if AutoChannel.isScenario() then
        return SCENARIO
    end 
    if IsWarBandActive() then
        return WARBAND
    end 
    return getSmartPartyChannel()
end

local function send(channel, message, allowSay)
	if channel == SAY and not allowSay then
		return
	end
    if channel == PARTY and AutoChannel.isScenario() then
		channel = SCPARTY
    end
    if type(message) == "wstring" then
    	message = tostring(message)
    end
    message = channel.." "..message
    SendChatText(towstring(message), L"")
end

function AutoChannel.sendChatBand(phrase)
    local channel = getSmartBandChannel()
    send(channel, phrase, false)
end 

function AutoChannel.sendChatParty(phrase)
    local channel = getSmartPartyChannel()
    send(channel, phrase, false)
end 

function AutoChannel.sendChatBandSay(phrase)
    local channel = getSmartBandChannel()
    send(channel, phrase, true)
end 

function AutoChannel.sendChatPartySay(phrase)
    local channel = getSmartPartyChannel()
    send(channel, phrase, true)
end 

function AutoChannel.Initialize()
    LibSlash.RegisterSlashCmd("acp", AutoChannel.sendChatParty)
    LibSlash.RegisterSlashCmd("acb", AutoChannel.sendChatBand)
    LibSlash.RegisterSlashCmd("acps", AutoChannel.sendChatPartySay)
    LibSlash.RegisterSlashCmd("acbs", AutoChannel.sendChatBandSay)
end

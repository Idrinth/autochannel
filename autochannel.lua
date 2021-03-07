AutoChannel = {VERSION = {major=1,minor=0,patch=0}}

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

local function getSmartBandChannel()
    if IsWarBandActive() then
        return WARBAND
    end 
    return GetSmartPartyChannel()
end

local function send(channel, message, allowSay)
	if channel == SAY and not allowSay then
		return
	end
    if (GameData.Player.isInScenario) then
        if (channel == PARTY) then
            channel = SCPARTY
        elseif (channel == WARBAND) then
            channel = SCENARIO
        end
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



# autochannel

provides the following slash-commands:
- /acp - prefer party size, no say
- /acb - prefer band size, no say
- /acps - prefer party size, fall back to say
- /acbs - prefer band size, fall back to say

Szenario and Szenariogroup will be automatically taken if within a scenario-

provides the following api, that can for example be used by macros:

- AutoChannel.sendChatBand(phrase)
- AutoChannel.sendChatParty(phrase)
- AutoChannel.sendChatBandSay(phrase)
- AutoChannel.sendChatPartySay(phrase)

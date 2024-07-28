--[[

		Retainer Job Book Buyer
		By @.guydyde
		
		Requirements: Yes Already --> Vocate Name		
		Instructions: Sit next to vocate and start it

--]]

VocateName = "Frydwyb"
RetainerJobText = "Inquire about retainer jobs."
RetainerBookText = "Purchase a copy of Modern Vocation."
interval_rate = 0.1

while not IsAddonVisible("SelectString") and not IsAddonReady("SelectString") do
    if GetTargetName() ~= VocateName then
        yield("/target " .. VocateName)
    elseif not IsAddonVisible("SelectIconString") then
        yield("/interact")
    else
        yield("/callback SelectIconString true 0")
    end
end
yield("/waitaddon SelectString")
if (GetNodeText("SelectString", 2, 5, 3) == RetainerJobText) then
    yield("/callback SelectString true 4 ")
end
yield("/waitaddon SelectString")
if (GetNodeText("SelectString", 2, 3, 3) == RetainerBookText) then
    yield("/callback SelectString true 2 ")
else
    yield("/wait " .. interval_rate)
end

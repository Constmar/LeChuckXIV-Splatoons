--[[

	Simple Island Sanctuary Leveling
	By LeChuckXIV
	v0.2
	
	inspired by ice's version, but actually works
	
	Requirements:
	VNavMesh
	Visland
	Something to auto gather(pandora recommended)

]]--

minItems = 0
maxItems = 999

levelingRoute = "H4sIAAAAAAAACu2YXU/bMBSG/0rl686yY8cfuZs6QN0GY9CJjWkXpjFtRBKXxGFiFf99dkjbFOgNkxjTfBX7xD4+dp6+Pj1LcKQKDRIwrnNVpoOP+kbnWTkDQ3BQmWbh3nwpZ76lU2fbNyYFCRqCQ1U2Km+bE1XNtD1Qdq6rsdVFazxTtwuTlbYGyfclODZ1ZjNTgmQJvoKE0AgKFPEh+OY6kkCJBB6Cc5C8oYjDiHB557qm1ON3IMEojofgRKVZ47xF0K9ubnShS9sudexWvsxKF9elyms9BOPS6kpN7Vlm55+8hwjhSIp4+0237+tGVfbX4NJUhWpD3B71IHLkV3dBt8/z9ukirefm52qSG1s/iqR14Ha4Vxjb7snN9kfVNd+2I7rO50bXtt8+1df3R24uOvOpNYuRKdMuMmf5kOX5yDTdiZyYxupuf24/o7myI1MU7vveG3y8Zyqzm0B9b99U2069cZIV+rDe6u5NHh+GO4RxfTxXpTXF2qn/MCApmzx3MLV4OLAmtwsXlpR+wpFJ9Xq077w3F87d3fAxMXEEIy46YChEkvIVMAIKwvCLAeN+C7P54CJX06tBZaZXAZjXCQyFEsecbpBhnEQbZjgRPIhMEJktZjgUEqGezHBGxYqZGDpJiEmAJkDTh4ZhiBFb6QyBXMjuaiJSwhgRGq6mQMyWzAiXv/iEtyNGcCZXxDgFYujlNKZe6OlVrtOQybzi1JdDgnlEepmMpBuFQRLz3RKDYLwTGFs1T/GCniQlpLmvE44YEsTjNRsRo2s2XMISUtxw9zzkhccR6v0t8sJyz4uA1BVlnpeu7NCSUHn548oLE9Ff1hgqoCPF68pKZBDGm4RFYra7XIdD9eV/LNdRBjlHfEMMZut6HYKUSBZS3FDd7SsMYkywHi/dreRuJIhjKp4lMCHB/ceU5Mfdb+33O36QGgAA"

stone = GetItemCount(37554)
iron = GetItemCount(37572)
quartz = GetItemCount(37573)
leucogranite = GetItemCount(37574)

function updateCount()
	stone = GetItemCount(37554)
	iron = GetItemCount(37572)
	quartz = GetItemCount(37573)
	leucogranite = GetItemCount(37574)
end

function tele()
	while IsVislandRouteRunning() do
		yield("/visland stop")
		yield("/wait 0.25")
	end
	yield("/callback _ActionContents true 10 1")
	while GetCharacterCondition(27) do yield("/wait 1") end
	while GetCharacterCondition(45) do yield("/wait 1") end
	yield("/wait 3")
end

function sell()
	tele()
	yield("/vnavmesh moveto -266.3 41 210")
	yield("/wait 1")
	while PathIsRunning() do yield("/wait 1") end
	yield("/target Enterprising Exporter")
	yield("/interact <wait.1>")
	yield("/callback SelectString true 0 <wait.1.0>")
	while not IsAddonVisible("MJIDisposeShop") do yield("/wait 0.1") end
	--stone
	yield("/callback MJIDisposeShop true 12 2 <wait.0.5>")
	yield("/callback MJIDisposeShopShipping true 11 " .. (stone - minItems))
	yield("/wait 0.5")
	yield("/callback SelectYesno true 0")
	yield("/wait 1.25")
	--iron
	yield("/callback MJIDisposeShop true 12 24 <wait.0.5>")
	yield("/callback MJIDisposeShopShipping true 11 " .. (iron - minItems))
	yield("/wait 0.5")
	yield("/callback SelectYesno true 0")
	yield("/wait 1.25")
	--quartz
	yield("/callback MJIDisposeShop true 12 25 <wait.0.5>")
	yield("/callback MJIDisposeShopShipping true 11 " .. (quartz - minItems))
	yield("/wait 0.5")
	yield("/callback SelectYesno true 0")
	yield("/wait 1.25")
	--leucogranite
	yield("/callback MJIDisposeShop true 12 26 <wait.0.5>")
	yield("/callback MJIDisposeShopShipping true 11 " .. (leucogranite - minItems))
	yield("/wait 0.5")
	yield("/callback SelectYesno true 0")
	yield("/wait 1.25")
	yield("/callback MJIDisposeShop false -2")
	yield("/wait 1.25")
	--pathing
	yield("/vnavmesh moveto -253.6 40 212")
	yield("/wait 1")
	while PathIsRunning() do yield("/wait 1") end
end
::start::
updateCount()
if (stone or iron or quartz or leucogranite) >= maxItems then sell() end
if not GetCharacterCondition(4) then yield('/gaction "mount roulette"') end
yield("/wait 3")
if GetCharacterCondition(4) == true then
	yield("/gaction jump")
	yield("/wait 2")
end
while (stone or iron or quartz or leucogranite) <= maxItems do
	yield("/visland exectemponce " .. levelingRoute)
	yield("/wait 1")
	while IsVislandRouteRunning() do yield("/wait 1.234") end
	updateCount()
end
goto start

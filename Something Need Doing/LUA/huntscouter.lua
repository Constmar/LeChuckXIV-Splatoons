--[[

	Dawntrail Hunt Scouter
	v1.0
	By LechuckXIV
	contains a modified instance change script courtesy of Prawellp's FATE script
	
	Requirements:
	VIsland for routes
	VNavMesh for pathing
	
	Soft Requirement:
	Something to auto track hunt marks, "hunt helper" recommended
	Optional: Scout Helper: to visualise your train

	Instructions:
	Ensure you're recording a train
	Start script, it will teleport you to the start and run it until it finishes


	Editing anything below is not supported
]]--


-- Routes --
wachu1 =
    "H4sIAAAAAAAACu2XS2/bMAyA/4vOjiDqLd+GrN2CoV3WB7Ju2EFrVMRAbKWxvGEI8t9HP7I02B/wwSeLpEFR/ECKOpBbXwaSk8f9a9z5540nGfmwj80OdR+bKtUoX8e4JjnLyI2vGr/tliv/ZxeL1p5/P5BlrItUxIrkB/KV5EIwajW3GXki+QyEpkxoKTPyDUUJjlprjTiiHKuweE9yAGsycufXRYMOBW33ir9CGaqExowsfdq8FBVGkfZNyMiiSmHvn9OqSJvPrQN2qRsOhbHXm/j7ZMEA0fuL39ZvXHRR4xZXZUzh5CqFcli+6/4YhC9NqNPb9X147RMTfw7q+xR381ith3Sg5lOx3c4jprKT7mKTwjm8+caneSxL357tFO/KF+kcaCtdx/2l01b5UJThpr4Qrx4GAqxN4VP3xTQv6uXGVymW59PXt3EdBvGY/U9QcWos/CMoKLcCoCeonGyNSk8Ex0twBqCp08aqnqHTFBgzUvcMhQKqnJ0Qjhgh19QaxyTvCVpJrbBsaKNcGMo4CDsV4XgJCu6o46bzoTX2UKtEh086qjTSnOpvxPSAU86kMz0/AVRopYf+yRUVDpyaqm+8/GbcMWrwkuuvQO0QJwfVAQQuqBFgp/Y5ZoCqfTpY0D0/HEKNMkMHBYkAlWUwVeCIARrsoVYxITs3hlPpZDuRtgCtokZKkBPAEQNEXjipAIhhBqVKKS1cfwniE59qxu2EcDQIfxz/AlyokiLTEQAA"
koza1 =
    "H4sIAAAAAAAACu2Uz24TMRDG32XOW8v2+t/uDYUWRVVLaItCQRwM67IrZT0h6wVBlHfH3jhKI14gh5w8M7Y+fzM/2Vu4t72DGm7xr2VQwLsNjuuYf/Q/UuSaWLtBbKCmBdxZP9rVFC7tnzV2PgxQf9nCAocudOih3sInqK+EVsRUFTUFPEPNhCRGMcML+Ax1yRhRhrNyF1P0bv42nmAmHn2wTTdGwZKku/CX650PcbOAhQ3tS+eji7AZXQFzH9zGfg/LLrTvkwA9reWmovehxd+HnWgwqr/Y1fBKYnIdr7juMbiDVHB9Dt9MJ3LyYXRDeB0/up/7weC3XH4MuJ6hb/I4YuW2W61mOKZOYvaAY3BHe7PWhhn2vU29HfwubReORlN2g5tT0VR86np3N5yk10+ZAE0jfJ7WOOb5sGitD9gfux/usXE53RX/EzSME86EUpmgItoIsweoBKkE4/IC8IwBcqMIU5Lv+bGKME4zQEYpKVmpzAXgOQOUhlBpjJ5k4heqqSoTz0jwihlJlFb68omeMULGDRFaymr/BrkkTJZCTgS1MIRTpS9P8Fz4fd39AwMJ4qMNCQAA"
koza2 =
    "H4sIAAAAAAAACu1TXU/CMBT9L/d5Nus+2m1vZoIhBETQIBofqiuuydaLrNMo4b/bjREg/gEeeOo95zan596TbmAsSgkJDPFXeODA7RrrlcWP+qOpZGa5PmIGievASOhaFG05Fz8rVNpUkLxsYIKVMgo1JBt4guSKspjQwA9DBxaQ+C5hNOYhd+DZNoPI4sAPthailoMbSCiNIgemIlO1FfRJ8xZ+yVJqY5sOTITJl0pbF2ZdSwcG2si1eDdzZfK7RsA95bqhrPcqx+99xxq06ktRVEcSrWv7RK9EI/dSRpZded3e6MB9LStzXM/k524x+NbRM4OrFHXWrcMyQ1UUKdbNJBZNsTbyYC/NhUmxLEUz297vXChzMNqgPq5PRRvyQZVyVJ3A3kOXgNuscNGeds2DapILbbA8TF+NMZMd3Dr/EwzjgDCX0VaFUsIYp3G0C5BxTgLmxeElwTNOkPs+8QLGdgl6JAw5o27Y/UEeE848n10iPJcIX7d/gywz/o0FAAA="
koza3 =
    "H4sIAAAAAAAACu1R207CQBD9l3muTdulF/pmKhhCQAQMXuLDahe7SXcHu1uNEv7daSkB4g/44NPOObM5c+bMFqZcCUhhjN+cgQPXFdYbwnf6ralETtwQMYfUc2DCdc3Ltlzxrw1KbQ2kT1uYoZFWooZ0C/eQhqzv+iwMHHiA1O/FbsT8MHHgEdLA91yPeVGwI4hajK7oh59Qc85zWZMcc5tJ+CGU0JaaDsy4LdZSkwdb1cKBkbai4q92JW1x0wh451y3Ejk3BX4eOmSP1Ne8NCcSrWcaMVBoxUHKCtWVl+2PDtzWwtjTeiHe97HgS0cvLG4y1HkXBjFjWZYZ1s0mhOZYW3G0lxXcZqgUb3Y7+F1xaY9GGzTE6ly0IZdSiYk5g4Nllz9F3EZPL8U8MrOCa4vquL2ZYi46uHN+3S8OE7efsHh/v8gN4n7E2vNdBF7iJj3m9/7v91fu97z7AQBbaGrGAwAA"
yak1 =
    "H4sIAAAAAAAACu2WTW7bMBCF7zJrheA/Ke0KNymMIqmbpHDdoAu2YiqhFulaVIvC8N1DSTQcIxfQQivNGwqPM/NhBB3gzjQWCtiY3wQy+LD33S7KL+5XH9ky5m68L6HAGdwa15ntEK7N/52vXWiheDrAyrd1qL2D4gBfoVCUIskIzWADxRXBGjGVc5HBNygEFYjlRB6j8s4u30NBiM4zuDdl3UU7hvqb/F/bWBfiYQYrE6rn2sUawr6zGSxdsHvzM6zrUH3qDfBlLnUUK28r/+90EsuL7s9m276yGGqOV1w3PtiTVbBNCt8NbyTxubNteB0/2D/jWPyPlH4IfrfwrkzDiJmP9Xa78F3fSVT3vgv2XN6iMmHhm8b0vZ3qXZs6nAvt1Y3fX5r2yce6sbfthbx+TPPH/Qg3wzOOedmuKuOCb87dt3e+tEkeszf8iJRIcs4SP64RIUyN+FSOtGYzvenSY4jn5+UTCmlOiRzoKU4RFiyf8U0XH1UoV1zlMgGUDAlNBBsAMkFRzjHVM8HpEiQYI604UYML6VdOCz4CvGJSIMGonAlOmCDlAhFFhRhc4t+M5lIoMhKM2xg3lKp5BacLUCiBdP/NHPFxzrFM+KikSGHJ5j/QyfD7fnwBKINt6ocMAAA="
yak2 =
    "H4sIAAAAAAAACu1Ry07DMBD8lz2bKG+S3FBoUYVaSltUCuJgiEssYm+JHRCq+u/YwVVb8QMcOHln1pqd3dnChAoGBazoWwgErlrsNgbeyVdbscpwQ8QKCp/AmMqONn25pF8b5FIrKB63MEXFNUcJxRbuoTiL8tTzIz+MCaygiFMvS9I8SAg8mGYchV6cp1m6MxglG11CEQRZTmBGK94Zxcizw/CDCSa1aRKYUl2vuTQ2dNsxAiOpWUtf9JLr+sYK+KecW8qYVzV+7jvGoVFf00YdSfS2zYiBQM32UpoJV170Pxy47ZjSx/Wcvf9cBp8dPde4KVFW7h6GueZNU2JnNzFohp1mB3tlTXWJQlC7297vknJ9MGrRENtTUUsuuGBjdQIHCxeBb0+46l9z5pGa1lRqFIft1QQr5uCO/I4wDXMvibKwVzGJBf55kLgEg9DIxlGQ/yf4VxJ82n0DXJjvt8oDAAA="
shaa1 =
    "H4sIAAAAAAAACu2XzY7TMBDH38Xn1LI9/swNlV1UoV0K3VVZEAdDvSRSE5fGAaFq3x3bSdWteIEccsrMOPp7Zn6a2Dmhe9s4VKJNZS1FBXp39P0h+o/tz2S5XYzder9DJSnQnW17u8/m1v49+LoNHSq/ntDad3WofYvKE/qMStASKwWcF+gJlYxFhxMhCvQFlVwqrCSj4iW6vnWrt6ik1ETJT3ZX91EPcNrK/3aNa0NcLNDahuq5bmMS4di7Aq3a4I72R9jWofqQBMh1bKwppt5V/s95JeYX1Z/tvnslkZOOW9w0PrizVHDNaL7Jb4zOx9514bW9cb+GvvjvY3gT/GHp293YjRh5X+/3S9+nSlKNvg/ukt6ysmHpm8am2s75bm0dLokm79Yfr0VT8KFu3F135d48jABIauFTfsY2r7p1Zdvgm0v13b3fudF9Kf4DKLDkmlKVRQQWTGvKIfMThmFD6UxvuvSYwsC4YZBVqMSagKSZHoDGIDjwmd90+VHNMRAzTN+CYKBcxi+mzASNijg11zPA6QLkRmLBBRnOP8DAtSHpNIz8FMVMGD3zmzA/la4v2sgsojBXIt5YBnwLCvFwBDAwD+B0AS4kA0wBxDCAOk6j0mT4gC4Yl5hRrdVMcMIEmYz3TMNYVuEcE0nM8AexkMJgACpngJMB+O3lHy+tqsVKDgAA"
shaa2 =
    "H4sIAAAAAAAACu1R0U7CMBT9l/s8lm1lq+zNTDDEgCgYRONDdcU1WXtxu9MYwr/bjhEg/oAPPvWe0+b0nHO3MBVaQgrzQogIPLiusNlY/GDe3SRzy40Qc0gDDybCNKJsx6X43qAyVEP6vIUZ1ooUGki38AgpCwOfJwPuwQrSMPQZT+KYefAEaS9OuB/0WbizEI0cX7kXA6t4L3LVWDnmu5/wU2ppyF56MBNUrJWxHqhqpAdjQ7ISb7RUVNw6geCc6yJZ53WBX4cba8+qr0VZn0i0nu0XQ40kD1IkdTdeti86cNfImk7nufzY14KvHT0n3GRo8q4My9yossywcUlcRmxIHu1lhaAMtRYu28HvUig6GnVohNW5qCMXSstJfQaHi67/wFW4ak9b87ieFcIQ6mP6eoq57ODO+7W/pB/5CWes36r0uB9GLIwu9gvksd1QEPP/Bf6VBb7sfgAOqvctxwMAAA=="
hf1 =
    "H4sIAAAAAAAACu2VzY7TMBDH32XOwfJnYueGyhYqtEvZXVQWxMEQL4nU2KVxQKjquzNJXXUrXiCHnDIztv6emZ9mcoA72zoo4d2SQQZv96HfoffJ/xwsV2FsGUIFJc3g1vrebkdzY//uQuNjB+XXA6xD18QmeCgP8BnKV5xzIllBVQZPUCpNKBdCFRl8wUOlBWFScHVEP3i3egMlY4ZlcG+rpkdFQYbHwm/XOh/xMIO1jfVz4zGNuO9dBisf3d7+iJsm1h8GAXodSzVh8l0d/pxPMENUf7bb7oXEmDY+cdOG6M5S0bXJfD3eSM7H3nXxpf3gfp06E76n8EMMu0XwVeoHRt432+0i9EMl6N2HPrpLeovaxkVoWzvUds53Y5t4SXTwlmF/LToEH5vW3XZX7s1jQkCHFj6NX2zzqlvX1sfQXqrv7kLlknvM/kPINSOcMaVHFYM4BTXqBFBoVOUsL2aA0wXIpCaSas1GFUYNEcKwRNAYkgtF5QxwugCFRoBM5fw0gRp3Jj2vUJMTYTSbB3DK/BCZLlSRnwZQGKJznY/8JMM/IqVGz/M3XX5cG1IoymVaoJJwU0g5AlSmwHU6r8/J4Pt2/Afx9TaCyAoAAA=="
hf2 =
    "H4sIAAAAAAAACu2TwU7CQBCG32XOddN2u4XtzSAoMSACBtF4WO1iN6E7SLcaQ3h3p6UEiC/AgVPnn23+/We+7AaGKteQwF0vBA9u11iuSD3Zz6rSKfV6iCkkvgcDZUu1rMuZ+l2hsa6A5HUDIyyMM2gh2cAzJFdhIJloRTH3YA6J4Kwthd/24AWSIAxYFARRtCWJVvdvqBfIwIOxSk1JfpxVV+G3zrV1dOjBSLlsYSyFcOtSe9C3Tq/Vh5sZlz1UBv5pr5mIohcZ/uxPKB+5L9SyOLKoQ9MV3Ryd3ls5nTfldf1HIx5LXbjjeqK/dnvB96Y9cbjqoE2bbVDn3iyXHSyrSUiNsXT6EK+TKdfBPFfVbPu8M2XcIWilerg+Na2aU5PrQXEiu9MGgF+tcF5/ac39YpQp6zA/TF8MMdWN3Hr/AfKIMykjuQMYSua3CKGoCYacCAneji8Ez5hgHAvmc1/ULleCcS6jqFUDFDJkLZ+e5wXguQB82/4BqkbpD4gFAAA="
lm1 =
    "H4sIAAAAAAAACu1W227TQBD9l3l2V3u/+A2FFkWQEtqi0CIeFrzFluLdEK9BKMq/d30JacQP+MFPnjNjnT0zR+P1AW5t7SCHDysCGbzbh3aX0Gf/s4tckXI3IRSQ4wxW1rd224cb+3cXKh8byL8eYB2aKlbBQ36AL6mOqNJUMJ3BI+SaICmx5CKDJ8iV0QgrZfgxweDd8i3khBiawZ0tqjbxMdQdFX672vmYihmsbSyfK59ExH3rMlj66Pb2R9xUsfzYEeDL3NhRkt6U4c+pkvQl9me7bV5R9KLTEdd1iO5EFV09hm/6N0bwqXVNfB3fu1/DXML3MX0fw24RfDFOI2XeV9vtIrRdJwndhTa6s7xFaeMi1LXtejvp3dgqnoV26CbsL0m75ENVu1VzAa8f/hmA+9GnZxrzslmX1sdQn7tvbkPhRnjM/jPwinODCBeU9TQGcS0wUb2BmhDEFFezfxP2TwuJNGOyZ0khV8YM+8eUQtjgef2mbB/nCjHB+Lh9BmPK6WAfYUgqwfW8fhP2jzCClBSM9jRcIKnx4N+VZMlOaubP54T9oxIjpjUfbr9031HMGBkM5CatphTz/8t0DPx2fAGcEc6kxQoAAA=="
lm2 =
    "H4sIAAAAAAAACu1Ry07DMBD8lz2bKO/XDYUWVdBS2qJSEAdDXGIp9pbYAaGq/46dpmorfoADJ+/MWrOzO1uYUMEgh9uxDwSuG2w3Bj3Id1ux0nBDxBJyl8CYypbWXbmk3xvkUivIn7cwRcU1Rwn5Fh4hv/CjyMnCOA0JrCBPAycKUz8l8GR6QRY7WeK70c5glGx0BbnnZT6BGS15awQDx87CTyaY1KZJYEp1tebSuNBNywiMpGYNfdNLrqs7K+Cec/1Kxruq8OvQMQaN+prW6kSic21GDARqdpDSTPTlZfejB/ctU/q0nrOP/WHwtafnGjcFyrI/h2FueF0X2NpNDJphq9nRXlFRXaAQ1O528LukXB+NWjTE5lzUkgsu2FidwcGiT8C1J1x1rznzSE0rKjWK4/ZqgiXr4Y78TjD1PCeJEm+fYOBkceqmfrKPMAwDJ0iyJP6P8K9E+LL7AW1HJEbJAwAA"

--A Ranks


a1 = "Queen Hawk"
a2 = "Nechuciho"
a3 = "The Raintriller"
a4 = "Pkuucha"
a5 = "Rrax Yity'a"
a6 = "Starcrier"
a7 = "Keheniheyamewi"
a8 = "Yehehetoaua'pyo"
a9 = "Heshuala"
a10 = "Urna Variabilis"
a11 = "Sally the Sweeper"
a12 = "Cat's Eye"


mob1 = false
mob2 = false
canSkip = false

-- Setup --
function startRoute(routeName, mobOne, mobTwo)
    yield("/visland exectemponce " .. routeName)
    yield("/visland resume")
	yield("/wait 0.2")
    while IsVislandRouteRunning() do
        if not mob1 then
			yield("/target " .. mobOne )
			yield("/wait 0.2501")
			if GetTargetName() == mobOne then
				mob1 = true
			end
		end
		if not mob2 then
			yield("/target " .. mobTwo )
			yield("/wait 0.2502")
			if GetTargetName() == mobTwo then
				mob2 = true
			end
		end
		if mob1 and mob2  then
			canSkip = true
		end
		
		yield("/wait 0.2503")
		
		if canSkip then
			yield("/visland stop")
			yield("/vnav stop")
		end
    end
end

function tele(destination)
	if IsVislandRouteRunning() or PathIsRunning() then
		yield("/visland stop")
		yield("/vnav stop")
	end
    yield("/tp " .. destination)
    yield("/wait 7.006")
    while GetCharacterCondition(45) do
        yield("/wait 1.0015")
    end
end

function changeInstance(destination)
    yield("/wait 1.0003")
    yield("/target Aetheryte")
    yield("/wait 1.0014")

    while HasTarget() == false do
        if IsInZone(1187) then --Urqopacha
            yield("/tp Wachunpelo")
            yield("/wait 7.0007")
        end
        if IsInZone(1188) then --Kozama'uka
            yield("/tp Ok'hanu")
            yield("/wait 7.0008")
        end
        if IsInZone(1189) then --Yak T'el
            yield("/tp Iq Br'aax")
            yield("/wait 7.0009")
        end
        if IsInZone(1190) then --Shaaloani
            yield("/tp Hhusatahwi")
            yield("/wait 7.0010")
        end
        if IsInZone(1191) then --Heritage Found
            yield("/tp The Outskirts")
            yield("/wait 7.0011")
        end
        if IsInZone(1192) then --Living Memory
            yield("/tp Leynode mnemo")
            yield("/wait 7.0012")
        end
        while GetCharacterCondition(45) do
            yield("/wait 1.0015")
        end
        yield("/target Aetheryte")
    end

    yield("/lockon")
    yield("/automove")
    while GetDistanceToTarget() > 15 do
        yield("/wait 0.6004")
        if IsMoving() == false then
            if GetTargetName() == "Aetheryte" then
                yield("/target Aetheryte")
                yield("/lockon")
            end
            yield("/automove")
        end
    end
    yield("/gaction dismount")
    if GetCharacterCondition(45) == false and destination == 1 then
        yield("/wait 1.005")
        yield("/li 1")
        yield("/wait 1.0017")
    end
    if GetCharacterCondition(45) == false and destination == 2 then
        yield("/wait 1.5006")
        yield("/li 2")
        yield("/wait 1.0018")
    end
    if GetCharacterCondition(45) == false and destination == 3 then
        yield("/wait 1.5007")
        yield("/li 3")
        yield("/wait 1.0019")
    end
    if GetCharacterCondition(45) == false and IsPlayerAvailable() == true then
        yield("/lockon off")
        yield("/automove off")
    end
    if GetCharacterCondition(45) then
        yield("/wait 1.0021")
    end
	
	mob1 = false
	mob2 = false
	canSkip = false
end

-- Starts Here --

-- Zone 1 --
tele("Wachunpelo")
changeInstance(1)
startRoute(wachu1, a1, a2)
tele("Wachunpelo")
changeInstance(2)
startRoute(wachu1, a1, a2)
tele("Wachunpelo")
changeInstance(3)
startRoute(wachu1, a1, a2)

-- Zone 2 --
tele("Earthenshire")
changeInstance(1)
startRoute(koza1, a3, a4)
if not canSkip then
	tele("hanu")
	startRoute(koza2, a3, a4)
end
if not canSkip then
	tele("Fires")
	startRoute(koza3, a3, a4)
end
tele("Earthenshire")
changeInstance(2)
startRoute(koza1, a3, a4)
if not canSkip then
	tele("hanu")
	startRoute(koza2, a3, a4)
end
if not canSkip then
	tele("Fires")
	startRoute(koza3, a3, a4)
end
tele("Earthenshire")
changeInstance(3)
startRoute(koza1, a3, a4)
if not canSkip then
	tele("hanu")
	startRoute(koza2, a3, a4)
end
if not canSkip then
	tele("Fires")
	startRoute(koza3, a3, a4)
end

-- Zone 3 --
tele("Mamook")
changeInstance(1)
startRoute(yak1, a5, a6)
if not canSkip then
	tele("Iq")
	startRoute(yak2, a5, a6)
end
tele("Mamook")
changeInstance(2)
startRoute(yak1, a5, a6)
if not canSkip then
	tele("Iq")
	startRoute(yak2, a5, a6)
end
tele("Mamook")
changeInstance(3)
startRoute(yak1, a5, a6)
if not canSkip then
	tele("Iq")
	startRoute(yak2, a5, a6)
end

-- Zone 4 --
tele("HHus")
changeInstance(1)
startRoute(shaa1, a7, a8)
if not canSkip then
	tele("Mehw")
	startRoute(shaa2, a7, a8)
end
tele("HHus")
changeInstance(2)
startRoute(shaa1, a7, a8)
if not canSkip then
	tele("Mehw")
	startRoute(shaa2, a7, a8)
end
tele("HHus")
changeInstance(3)
startRoute(shaa1, a7, a8)
if not canSkip then
	tele("Mehw")
	startRoute(shaa2, a7, a8)
end

--Zone 5 --
tele("Outsk")
changeInstance(1)

startRoute(hf1, a9, a10)
if not canSkip then
	tele("Electrope")
	startRoute(hf2, a9, a10)
end
tele("Outsk")
changeInstance(2)

startRoute(hf1, a9, a10)
if not canSkip then
	tele("Electrope")
	startRoute(hf2, a9, a10)
end
tele("Outsk")
changeInstance(3)

startRoute(hf1, a9, a10)
if not canSkip then
	tele("Electrope")
	startRoute(hf2, a9, a10)
end

-- Zone 6 --
tele("Mnemo")
changeInstance(1)

startRoute(lm1, a11, a12)
if not canSkip then
	tele("Aero")
	startRoute(lm2, a11, a12)
end
tele("Mnemo")
changeInstance(2)

startRoute(lm1, a11, a12)
if not canSkip then
	tele("Aero")
	startRoute(lm2, a11, a12)
end
tele("Mnemo")
changeInstance(3)

startRoute(lm1, a11, a12)
if not canSkip then
	tele("Aero")
	startRoute(lm2, a11, a12)
end

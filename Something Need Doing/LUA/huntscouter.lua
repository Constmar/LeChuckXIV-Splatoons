--[[

Dawntrail Hunt Scouter
v1.2a
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

Changelog:
1.2a route optimisation
1.2 Teleport Validation, main function optimisation, fix detection of mobs to use object table isntead of targeting
1.1 Minor fix
1.0 Initial Release

]]--

maxInstances = 3
gohome = true
homeTP = "Estate"
--doorCoords = "67.880 16,999 10.594"
expansion = "DT"


--Editing anything below is not supported

-- Routes --
wachu1 =
    "H4sIAAAAAAAACu2Y23KbMBCG30XXWKMDOnHXcZPU7SR1E3fcptMLJVYCMwY5INrJePzuXQFO4rZvAFdoF2n3R3yzrNijK1s6lKGv9ZPf2fvcogRd1L7dge9DW4UG7HPvNygjCbq0VWu33XBl60cXLmzIXb0Iruyca/u880VclP3Yo6VvilD4CmV79A1lnBOsJdMJ+o6yGeUSEy7TNEG3YKbUYK214gewfeUW71FGqVYJurabooWAHEcB/pcrXRXgZoKWkPyhqEBaqFuXoEUVXG3vw7oI+ecYgJz6hidFp96/VJKYBgR219vuCpKa3P8+LoK5IOfBbps3ObsAoOms9MEdc8O2DMN33YzB+NK6Jrwd37infnv93eC+CX4399VmUAaeT8V2O/fwQjrr2rfBvT7PPLdh7svSxs2Ijqh3bYvwKjRa574+DRqdq6J0l82Jebb6dzNgExbNMrdV8OVL0PgGUFa12y1A06FQVI+r5x3IMiYuuPIb9zI7Gh/9HYQ7JP+hg2NliBjoYAoTKZXs6RAAixFSTnCME45ZqrAEHNSAh1FYCMrogAeXCqeMmKl4jJUPqB2ESB3rRccHwVQQpXo8GJhCpVJP5WOceDAN5YPqtMsnNIypNH3jQTFXikIxmdgYJxuAhuBa9F2plJhyxU1fN6jAXGigY2JjnGzMmNY45Sr2GZBRQU+aakr7wsEYJpqIqecYKxzxUEL0wIbkmCmhBO/hSKEhEZpMX5WxwiHhxJKmWqq+cjBMtVGshwNOK0QqMX1WxgqHoBob4KE/zQqOJSdGiOO/DgGlRLIJj1Hg8fPwB0WpSsqDFQAA"
koza1 =
    "H4sIAAAAAAAACu1W23KbMBD9Fz0TDZIASbx1nMu4maRu4o7bdPqgFMUwA1oXRDupx/+eFZCLk0+wn7TnsNo9Ws4ItuTaNJbk5BL+G0YictFCv0H8za1DZAvkzgEKkscRuTKuN/UQLk27tv7C+NK2c2+bgVyZxw1Uznck/7klC+gqX4Ej+ZZ8J/lJIjOqtI5VRH6QnCUpVRlTPCJ3JBeM0UxxJnYIwdn5KWYwhak3pqh6LChoEAB/bWOdx4cRWWDzh8qhNN/2NiJz521rfvtV5csvoUC8z00nJfvsO5VxaIPyhvVuWFFSV8K/502Yi3IeTN296TkUQE1nDXj73BvHMoWfhowJfO1t59/Gt/bPOF64n+hbD5sZuGJShsxlVdcz6MPREd1A7+3reWal8TNoGhOGEYigd2Uq/yo0oHNo94sGclk19qrbg2fLj8PAIcy7RWmch+alaHgDJHd9XaNxBitUbr183KAsrcOGayjsS3YAn+Eey+2ij+6QQlEheDqaQ2LLmKfpaI4EEWNCHc1xoOYQaUZ5LPlojjSmIouzZDAH44oyreTRGwfqDS4l1Yol02dFcJrGUsvBHCdMZDTmXKdHexymPbSkXCZSTv8cjOpMJOPNkWlNEyaPN8dBWOPX7gl2wsVX7AoAAA=="
koza2 =
    "H4sIAAAAAAAACu1S21LbMBD9l312NZYty7LfmBSYlIEGSCeUTh9ELWLN2NrUlsvQTP69K8dcUj4BnrTnaLV7dnW2cKFbAyWc4V+dQASnHQ4bwt/cOkSmIu4EsYIyjuBcu0E3Y7jU3dr4U+1r0829aUdypR83aJ3vofyxhQX21lt0UG7hBspPXBaMizTLIvgOZRozyYs8yyO4pUuhCItU7AiiM/PPUHKuVARXurIDFUxZEIB/TGucp8sIFtT83jqS5rvBRDB33nT6l19ZX38NBeJDbpoUDtn/VMahDckbz9vxJEl9jQ9PjyiX5Nzrpn/VcyxAmo5b9OapN61lCo/GjAlcDqb3r+Nr83u/Xryb6GuPmxm6alJGzJltmhkOYXRCVzh48zLPrNZ+hm2rwzICEfSutPUvQgM6we6waCCXtjXn/QE8Xr5dBi1h3i9q7Ty2z0XDD0DphqYh44xWsG69fNyQrKIIDy6wMs/ZAXzBOyq3i966I5MJK4RUYuzIJZNJrFK5d4fkiolCJh/ueKfukHnBkoLzvTlylqaJ4GpvjixWLBEq/zDHezDHz90/hWiLprQGAAA="
koza3 =
    "H4sIAAAAAAAACu1S21LCMBD9l32unabl2jcHgUEHRMVBcXyINtLMtFlstzrK8O9uQkHQT9Cn7DnZ7J7dnDVMZK4ghgv8lBF4MCywWjG+NUsbqYS5AWICceDBWJpKZi6cyWKpaCgpVcWIVO7IufxYoTZUQvywhimWmjQaiNdwB3Ez6voiaoYe3EMsGm2/FYlmx4MFxKEI/CAKWuGGIRo1OuMM0eHLa5noistFvm2PbypXhvjSgym3ftGGhVFRKQ9GhlQhn2muKb20BYJjrp4TjtkfGlmGk+fOhTtZUpni++4R57KcF5mVBz1dAdbUz5HUrjcvpQ5PXUYNripV0mF8o163y8Wnmr4hXPXQJLUyZi50lvWwsqMzusaK1Pc8vVRSD/Nc2mVYwuqdS03fQi0aYHFc1JIznatxeQT7s9/L4CWMymkqDWG+L2p/AGJTZRnbxhlBm+XsY8Wyul37YIKJ2mdbcI5PXG7j/fJGWzT8RpMdsDWHCP2GaHW67g9ORGiNI9ri3x1/wR2Pmy8IqEumlQQAAA=="
yak1 =
    "H4sIAAAAAAAACu2W32+bMBDH/xc/Ewsfxsa8TVlbZVO7rM2UtdMe3MVN0MDOwGyqovzvPQP9kfVPgCd8h7n7+vjofAdypStDcnKrfzMSkYvatXs0v9ltWJkN+s6d25A8jsiltq0uu+VK11vjL7TfmXrhTdU51/px7wrrG5L/OJClawpfOEvyA/lOcglARcIgIrckn7E4o4lUPI3IHclTSGmimDii5axZfCQ5Y5mKyLXeFC2GS2hI7/6ayliPLyOyxNQPhUVhvm5NRBbWm1r/8uvC776EAPGpbzgmOfX+pzEOaVBe97zrniip2bl/zx/hXpTzoMvmTc4uAGo6q5w3z7mxKMPyQ7djML62pvFv1zfmT19cdz+4b7zbz53dDMrQ87koy7lrw9HRunatN6/nme+0n7uq0qEYwRH0rnXhX4UG69zVp0GDc1VU5rI5Mc9W74uBRVg0y5223lUvQcMfILltyxKx6UAo7Hb1uEdZCn/dorlyG/OyOxif3D2GO0bv2ACQNBUQaOjgAEE5B4AeDhlTGQs1wTFOODj2BpBpLAc4Eklj7BwdG0IxypMMJjbGyQbgLZKolA9ocEZFlqm+b3CmqFBKTXCMFA6lcKhQWd83UipAqjBTIBozyASVQmV8ahzjZAMYjhgCIOkSAsMrBiT00+gsRRu4mMbRkcKRAqdKxlz0cKRh3gh3TGAjYTHNpMzk1DnGAMfP4xPGRhQIIg8AAA=="
yak2 =
    "H4sIAAAAAAAACu1S207DMAz9Fz+XqvetfUNjTAUBgw0NhngINFsj2ni0Lmia9u84XRkMPgGe4nPi2MfO2cClKCUkcC9ePLBgVGGzYnirlyaSGXOniBkkjgUXQjeiaMOpqJaSRoJyWaUky5acifUKlaYakocNjLFWpFBDsoE7SI78OLId3/ECC+4hCSK7H0axG1ow58vA9+wgjvrRljFqmZ5A4rr92IIbkamGK/q2UYBvspSa+NKCMXdfKM3aqGqkBakmWYlnminKr0wB55DrJoVD9odMx7Rhfe05b0+WVOf4/vmIc1nOQhT1t55tAdY0LJHkZ2/eSxcetxkduG5kTd/jiXzd7RefOnpCuBqgzjplzJyrohhgY0ZndIMNya95BrmgAZalMMswhNE7E4q+hBp0itVhUUNOVSkv6gM4nP5eBi8hrce50ITlvqj5AUh0UxTsnNYLSi+n6xXLivnr0voSM7nPNuAMn7jc1vptj8h1bM8Je+HOHp4d9n2nF+3s4UaxHQau2/u3x1+wx+P2A9A7WMGYBAAA"
shaa1 =
    "H4sIAAAAAAAACu2X32+bMBDH/xc/U8s2/gVvU9ZW2dQuWzNl67QHd3EDEtgZmE1VlP99ZyBts/4J8ITvMHdfHx8dxwHdmtqiHN0VxlCUoOvGd3uwv7pdXNkt+K6836KcJOjGuM5U/XJtmp0N1yYUtlkGW/fOjXna+9KFFuU/Dmjl2zKU3qH8gL6hPNUSK5VynqDvKGcMDE6ESNA9yrlUWElGxRFM7+zyPcopzSDkF7MtO4iX4pjf/7G1dQFuJmgFuR9LB8pC09kELV2wjfkVNmUoPsUA5Nw3HhSde/8TSWIakNdf7/srSGoL//f0EOwFOY+mal/l7AOApsvaB3vKDVUZl+/6HaPxubNteL2+s7+H6vqH0X0X/H7h3XZUBp6PZVUtfBePHoviu2BfzrMoTFj4ujaxGNER9W5MGV6ERuvKN+dBo3Nd1vamPTMv12+LAUVYtqvCuODr56DxDaDcdVUF3PQklG63ftqDrCyLD9z6rX3eHY0P/gHCHZM3cGiGOdVc9/mowEQqKgc2hNSYE6LkzMZE2dDQGwgRAxsEcy4YG9hIJcGZyNK5b0yUDZoBHJRI1ieU0EQo13qAg0qOFUv53DemyQanCmvoDurUOEhGGIwcAxyEYKlUNsMxTTgoZZjANCrkQAfMGJynMQrAcSEU5pqpuXVMlI4LIeCHg41wCILTjGgqBzgY01goLdXcOyZKR0pTPEwcPMVUKqBl7Bswq4r4jZnRmAIaP4//AJU3dXJAEQAA"
shaa2 =
    "H4sIAAAAAAAACu1S206DQBD9l3lGQlkLwpupl1RTrbamXuLDKtuyCexUGDSm6b87g2hb/QR92pnD7Dlnh7OCC10aSGGSax2CB6cVNkvub9xCKpMxdoKYQRp4MNKu0UVbTnW1MHSqKTfVkEzZgjP9vkTrqIb0YQVjrC1ZdJCu4BZS1Qv8OEpiD+4g7fV8FUf9vvLgHtK9fhT7wb7qrblFZ4ZHMpEw47XObMN0yhd5fDWlccQfPRiz9Nw6NkZVYzwYOjKVfqaZpfxSCIJdrHsn7KI/PAYiw/ba87492VKd49vXJZ5lO3Nd1FuaLQF7Oi6RzJc2L6UrD9uJrrlqTE3b9cS8fC4Xnzp4QrgcoMs6Z4yc26IYYCNPl6VgQ2bznkGuaYBlqWUZAojfmba0MSrdCVa7pAJObWlG9U57PP29DF7CsB7n2hGW36TyByB1TVFwbNogWLeYvi/ZVpLIhQvMzPe0NGf4xHRr71c2+lHoH4SJavX2Qj8JIxVLVCQcsQr8SAUH/+H4C+F4XH8AWGQMDZQEAAA="
hf1 =
    "H4sIAAAAAAAACu2Wy27bMBBF/4VrleBDfGlXOHHqFkndxIXbFF0wNWMLkEhXoloEhv89Q0l5OPkEeyXeITlzOTqgtENXtnaoQJ+mFGXoogndFtR3v04jt4LYNIQVKkiGLq3vbNUPF7ZZu3hh48Y1s+jqPri0D9tQ+tii4tcOzUNbxjJ4VOzQD1R8YIzhnCoiMvQTFUJjwjgXKkO3MCk0xzTnTOxBB+9mZ6ig1NAMXdtV2UFGjpOD8M/VzkeYzNAcqt+XHrzFpnMZmvnoGvsnLsu4+ZoSkMPYeFB0GH1jk6Qy4K9/3vZPsNRuwv+nTbAW7Nzbqn1Vs08Ans7rEN1TbejLOPzYrxjFt8618fX4xv0d+hvuxvBNDNtJ8KvRGUS+lFU1CV06Oqjr0EX3cp7JxsZJqGubmpECye/SlvHFaFLT0BwmTcFFWbvL9kCeL943A5owa+cb62Oon5OmN4AK31UVkNOzUPr14mELtoxJG67Cyj2vTuJzuIN0++wdHowAEDKXqi9oJJZMaj3AkRODqTBEnuA4Tjgo3BbcKCP7gpQyrKkRRgx4UCmwooTpEx7HiQfnFCvB1PBloZTjnFAh5YgHU5hoxk50HCkdimCqlOIDHaC4hsukh4MLiXOd8/wEx3HCwbTBjEo9sGFyTIxUAxtCCEyUOf2RHgUav/ePzBsIjQoNAAA="
hf2 =
    "H4sIAAAAAAAACu1UXU/jMBD8L/ucs+wkTpu8nXoUeiegBz0VON2DIaaxlHhL4oBQ1f/O2g0fPfgH8OSdsb0z3oyygRPVaCjgaBpDBIct9mtCf+zKV7okbopYQsEjOFa2V3UoF6pdaXeoXKXbmdNNIJfqcY3Gug6KvxuYY2ecQQvFBi6g+BaLnMlRmiURXEIhEzbOJR9HcAWFiAVLhUjTLUG0evaDOJGLCM5UaXrqlzCvj/e60dbRZgRz0r41lpy5ttcRzKzTrbpxS+OqU9+A73PDM2Gf/c8k9zLkLqxXYSVLXYUPz5foLNm5VXX3RjM0IE8HDTr9rE1TGcrv4cQAfve6c2/rc323my5eD/S5w/UEbTk4I+aXqesJ9v7phM6wd/r1PZNKuQk2jfLD8IT3u1TGvRr1aIrtflNPLkyjj7s9eLB4PwwawqybV8o6bF6a+i8Ahe3rmnITkmDsavG4Jlt57i+cYKlfTnvwE6+p3Tb6IBx5xmKeJjIophkb5ZzHu3DkYyZ5IsVXOD5pODIh2VimoyCYZIxnmYh3fw6ZSDbK4uQrG58hG/+2T+ByJv2vBgAA"
lm1 =
    "H4sIAAAAAAAACu1V224aMRD9l3neWL6tL/tW0SSiLSlNqGhT9cEpDqy0a9Ndb6so4t9jG0KC+AR48syxPXNmfDR+hhvTWqjgy4RAAdedH9bR++6WybKLiF15v4AKFzAxbjBNNmemW9pwbcLKduNg2wzOzdPa1y70UP16hqnv61B7B9Uz/Ij7iEpFS6YK+AmVIkgILHhZwD1UUiuEpdR8E13v7PgjVIRoWsCtWdRDjMdQyu//2da6EDcLmMbcj7WLzEI32ALGLtjO/AnzOqy+pgD4ENuVCYfoEUmc6eX1Pq+RUr/y/18vxbORzqNp+nc5c4DI6bL1wb7mjl3ZmR/yiZ3zbbB9eG/f2b/b7vqHHXwX/Hrk3WLHLCKf66YZ+SGVHr1bPwT7Vs9oZcLIt61JzUhA4js3dXgjmrwr3x0GTeCsbu2kP3AvZ8fNiE0Y99OVccG3+6DpBaByQ9NE3WQl1G45e1pHWlqnCzd+Yfenk/PJP8Rwm+JIHBdMCUQZ5zmh0IgISlh+AoUJUlqWZ2mcqDQUkYilQZGUoRBnDKusDE4lIphhdpbGiUqDa40ELcVWGwRhXaYRErXBKEOEUHIeG6eqDaIlkiUTdC8OriTfTo4LKhCmklB6Hh2nKQ9KMdKMcZYTlgwxiYWQ23+FaaQ5PX8rJ6GN35sXt7Kv5wMNAAA="
lm2 =
    "H4sIAAAAAAAACu1S207CQBD9l3muDb3Ry5tBIaggCgYv8WGxC92k3cF2qjGEf3e2FBX5BH3aOWdnZ87Mng2MRSEhgauRCxYMSqzXjO70ykQyZa6PmELSsWAkdC3yJpyJciVpICiT5ZBk0ZBz8bFGpamC5GkDE6wUKdSQbOAekhM3COzY70a+BQ+QRJ4d+JEbWfDId17ctePQ7QRbxqjl8AwSx4ldC25Fqmou6NlGAL7JQmriSwsm3HypNEujspYWDDXJUrzQXFF2bQp0Drl2Tjhkf6nsmDYsrzkfm5MlVRm+7x9xLstZirz60bMpwJrOCyS5781racPTJqMFN7Ws6Gc8la+79eKipaeE6x7qtFXGzKXK8x7WZnRGt1iT/J6nlwnqYVEIswxDGL1zoehbqEF9LA+LGnKmCjmqDuD57HgZvIRhNcmEJiy+ipofgETXec7Gaayg9Gr2sWZZcWwejDGVX9kGXOCCy22tY3eEQWhHodf0Y6OEcRA6wc4cvufYTjeM/X9z/AVzPG8/AaLwxEaUBAAA"

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

--Zone IDs
z1 = 1187 --Urqopacha
z2 = 1188 --Kozama'uka
z3 = 1189 --Yak T'el
z4 = 1190 --Shaaloani
z5 = 1191 --Heritage Found
z6 = 1192 --Living Memory

mob1 = false
mob2 = false
canSkip = false

-- Setup --
function startRoute(routeName, mobOne, mobTwo)
    yield("/visland exectemponce " .. routeName)
    yield("/visland resume")
	yield("/wait 0.2")
    while IsVislandRouteRunning() do
		if DoesObjectExist(mobOne) then mob1 = true end
		if DoesObjectExist(mobTwo) then mob2 = true end
		if mob1 and mob2  then canSkip = true end
		yield("/wait 0.2503")
		if canSkip then
			yield("/visland stop")
			yield("/vnav stop")
		end
    end
end

function tele(destination, zoneID)
::teleStart::
if IsVislandRouteRunning() or PathIsRunning() then
	yield("/visland stop")
	yield("/vnav stop")
	while not IsPlayerAvailable() do
		yield("/wait 1")
	end
end
	if not IsMoving() then
		yield("/tp " .. destination)
		yield("/wait 7.006")
	else goto teleStart end
    while GetCharacterCondition(45) do
        yield("/wait 1.0015")
    end
	while not IsInZone(zoneID) do goto teleStart end
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
            yield("/tp Earthenshire")
            yield("/wait 7.0008")
        end
        if IsInZone(1189) then --Yak T'el
            yield("/tp Mamook")
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
    if GetCharacterCondition(45) == false then
        yield("/wait 1.005")
        yield("/li " .. destination)
        yield("/wait 1.0017")
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
if expansion == "DT" then
-- Zone 1 --
for i=1,maxInstances,1 do
	tele("Wachunpelo", z1)
	changeInstance(i)
	startRoute(wachu1, a1, a2)
end
-- Zone 2 --
for i=1,maxInstances,1 do
	tele("Earthenshire", z2)
	changeInstance(i)
	startRoute(koza1, a3, a4)
	if not canSkip then
	tele("hanu", z2)
	startRoute(koza2, a3, a4)
	end
	if not canSkip then
	tele("Fires", z2)
	startRoute(koza3, a3, a4)
	end
end
-- Zone 3 --
for i=1,maxInstances,1 do
	tele("Mamook", z3)
	changeInstance(i)
	startRoute(yak1, a5, a6)
	if not canSkip then
	tele("Iq", z3)
	startRoute(yak2, a5, a6)
	end
end

-- Zone 4 --
for i=1,maxInstances,1 do
	tele("HHus", z4)
	changeInstance(i)
	startRoute(shaa1, a7, a8)
	if not canSkip then
	tele("Mehw", z4)
	startRoute(shaa2, a7, a8)
	end
end

--Zone 5 --
for i=1,maxInstances,1 do
	tele("Outsk", z5)
	changeInstance(i)

	startRoute(hf1, a9, a10)
	if not canSkip then
	tele("Electrope", z5)
	startRoute(hf2, a9, a10)
	end
end

-- Zone 6 --
for i=1,maxInstances,1 do
	tele("Mnemo", z6)
	changeInstance(i)

	startRoute(lm1, a11, a12)
	if not canSkip then
	tele("Aero", z6)
	startRoute(lm2, a11, a12)
	end
end
end
if gohome then
yield("/tp " .. homeTP)
end


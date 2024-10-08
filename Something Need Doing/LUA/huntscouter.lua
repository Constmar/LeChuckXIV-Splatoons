--[[

Hunt Scouter
v1.5a
By LechuckXIV
contains a modified instance change script courtesy of Prawellp's FATE script

Requirements:
Teleporter plugin
VIsland for routes
VNavMesh for pathing

Soft Requirement:
Something to auto track hunt marks, "hunt helper" recommended
Optional: Scout Helper: to visualise your train

Instructions:
Ensure you're recording a train
Start script, it will teleport you to the start and run it until it finishes

Changelog:
1.5a remove fringes optimisation, breaks if 2nd mob isn't found and loops
1.5 Added Stormblood, add a check to see if zone changed with only one A rank found
1.4b fix canSkip check to work on tp and instance change, veried that EW/ShB routes are working
1.4a Add dependency check
1.4 Added Shadwobringers support (Working)
1.3 Added Endwalker support (Working)
1.2b enter house
1.2a route optimisation
1.2 Teleport Validation, main function optimisation, fix detection of mobs to use object table isntead of targeting
1.1 Minor fix
1.0 Initial Release

]]--

maxInstances = 3
gohome = true
homeTP = "Estate"
doorPath = "" --visland path to door
expansion = "DT" --DT/EW/ShB/SB Supported (case sensitve)


--Editing anything below is not supported

-- Routes --
--DT
wachu1 = "H4sIAAAAAAAACu2Y23KbMBCG30XXWKMDOnHXcZPU7SR1E3fcptMLJVYCMwY5INrJePzuXQFO4rZvAFdoF2n3R3yzrNijK1s6lKGv9ZPf2fvcogRd1L7dge9DW4UG7HPvNygjCbq0VWu33XBl60cXLmzIXb0Iruyca/u880VclP3Yo6VvilD4CmV79A1lnBOsJdMJ+o6yGeUSEy7TNEG3YKbUYK214gewfeUW71FGqVYJurabooWAHEcB/pcrXRXgZoKWkPyhqEBaqFuXoEUVXG3vw7oI+ecYgJz6hidFp96/VJKYBgR219vuCpKa3P8+LoK5IOfBbps3ObsAoOms9MEdc8O2DMN33YzB+NK6Jrwd37infnv93eC+CX4399VmUAaeT8V2O/fwQjrr2rfBvT7PPLdh7svSxs2Ijqh3bYvwKjRa574+DRqdq6J0l82Jebb6dzNgExbNMrdV8OVL0PgGUFa12y1A06FQVI+r5x3IMiYuuPIb9zI7Gh/9HYQ7JP+hg2NliBjoYAoTKZXs6RAAixFSTnCME45ZqrAEHNSAh1FYCMrogAeXCqeMmKl4jJUPqB2ESB3rRccHwVQQpXo8GJhCpVJP5WOceDAN5YPqtMsnNIypNH3jQTFXikIxmdgYJxuAhuBa9F2plJhyxU1fN6jAXGigY2JjnGzMmNY45Sr2GZBRQU+aakr7wsEYJpqIqecYKxzxUEL0wIbkmCmhBO/hSKEhEZpMX5WxwiHhxJKmWqq+cjBMtVGshwNOK0QqMX1WxgqHoBob4KE/zQqOJSdGiOO/DgGlRLIJj1Hg8fPwB0WpSsqDFQAA"
koza1 = "H4sIAAAAAAAACu1W23KbMBD9Fz0TDZIASbx1nMu4maRu4o7bdPqgFMUwA1oXRDupx/+eFZCLk0+wn7TnsNo9Ws4ItuTaNJbk5BL+G0YictFCv0H8za1DZAvkzgEKkscRuTKuN/UQLk27tv7C+NK2c2+bgVyZxw1Uznck/7klC+gqX4Ej+ZZ8J/lJIjOqtI5VRH6QnCUpVRlTPCJ3JBeM0UxxJnYIwdn5KWYwhak3pqh6LChoEAB/bWOdx4cRWWDzh8qhNN/2NiJz521rfvtV5csvoUC8z00nJfvsO5VxaIPyhvVuWFFSV8K/502Yi3IeTN296TkUQE1nDXj73BvHMoWfhowJfO1t59/Gt/bPOF64n+hbD5sZuGJShsxlVdcz6MPREd1A7+3reWal8TNoGhOGEYigd2Uq/yo0oHNo94sGclk19qrbg2fLj8PAIcy7RWmch+alaHgDJHd9XaNxBitUbr183KAsrcOGayjsS3YAn+Eey+2ij+6QQlEheDqaQ2LLmKfpaI4EEWNCHc1xoOYQaUZ5LPlojjSmIouzZDAH44oyreTRGwfqDS4l1Yol02dFcJrGUsvBHCdMZDTmXKdHexymPbSkXCZSTv8cjOpMJOPNkWlNEyaPN8dBWOPX7gl2wsVX7AoAAA=="
koza2 = "H4sIAAAAAAAACu1S21LbMBD9l312NZYty7LfmBSYlIEGSCeUTh9ELWLN2NrUlsvQTP69K8dcUj4BnrTnaLV7dnW2cKFbAyWc4V+dQASnHQ4bwt/cOkSmIu4EsYIyjuBcu0E3Y7jU3dr4U+1r0829aUdypR83aJ3vofyxhQX21lt0UG7hBspPXBaMizTLIvgOZRozyYs8yyO4pUuhCItU7AiiM/PPUHKuVARXurIDFUxZEIB/TGucp8sIFtT83jqS5rvBRDB33nT6l19ZX38NBeJDbpoUDtn/VMahDckbz9vxJEl9jQ9PjyiX5Nzrpn/VcyxAmo5b9OapN61lCo/GjAlcDqb3r+Nr83u/Xryb6GuPmxm6alJGzJltmhkOYXRCVzh48zLPrNZ+hm2rwzICEfSutPUvQgM6we6waCCXtjXn/QE8Xr5dBi1h3i9q7Ty2z0XDD0DphqYh44xWsG69fNyQrKIIDy6wMs/ZAXzBOyq3i966I5MJK4RUYuzIJZNJrFK5d4fkiolCJh/ueKfukHnBkoLzvTlylqaJ4GpvjixWLBEq/zDHezDHz90/hWiLprQGAAA="
koza3 = "H4sIAAAAAAAACu1S21LCMBD9l32unabl2jcHgUEHRMVBcXyINtLMtFlstzrK8O9uQkHQT9Cn7DnZ7J7dnDVMZK4ghgv8lBF4MCywWjG+NUsbqYS5AWICceDBWJpKZi6cyWKpaCgpVcWIVO7IufxYoTZUQvywhimWmjQaiNdwB3Ez6voiaoYe3EMsGm2/FYlmx4MFxKEI/CAKWuGGIRo1OuMM0eHLa5noistFvm2PbypXhvjSgym3ftGGhVFRKQ9GhlQhn2muKb20BYJjrp4TjtkfGlmGk+fOhTtZUpni++4R57KcF5mVBz1dAdbUz5HUrjcvpQ5PXUYNripV0mF8o163y8Wnmr4hXPXQJLUyZi50lvWwsqMzusaK1Pc8vVRSD/Nc2mVYwuqdS03fQi0aYHFc1JIznatxeQT7s9/L4CWMymkqDWG+L2p/AGJTZRnbxhlBm+XsY8Wyul37YIKJ2mdbcI5PXG7j/fJGWzT8RpMdsDWHCP2GaHW67g9ORGiNI9ri3x1/wR2Pmy8IqEumlQQAAA=="
yak1 = "H4sIAAAAAAAACu2W32+bMBDH/xc/Ewsfxsa8TVlbZVO7rM2UtdMe3MVN0MDOwGyqovzvPQP9kfVPgCd8h7n7+vjofAdypStDcnKrfzMSkYvatXs0v9ltWJkN+s6d25A8jsiltq0uu+VK11vjL7TfmXrhTdU51/px7wrrG5L/OJClawpfOEvyA/lOcglARcIgIrckn7E4o4lUPI3IHclTSGmimDii5axZfCQ5Y5mKyLXeFC2GS2hI7/6ayliPLyOyxNQPhUVhvm5NRBbWm1r/8uvC776EAPGpbzgmOfX+pzEOaVBe97zrniip2bl/zx/hXpTzoMvmTc4uAGo6q5w3z7mxKMPyQ7djML62pvFv1zfmT19cdz+4b7zbz53dDMrQ87koy7lrw9HRunatN6/nme+0n7uq0qEYwRH0rnXhX4UG69zVp0GDc1VU5rI5Mc9W74uBRVg0y5223lUvQcMfILltyxKx6UAo7Hb1uEdZCn/dorlyG/OyOxif3D2GO0bv2ACQNBUQaOjgAEE5B4AeDhlTGQs1wTFOODj2BpBpLAc4Eklj7BwdG0IxypMMJjbGyQbgLZKolA9ocEZFlqm+b3CmqFBKTXCMFA6lcKhQWd83UipAqjBTIBozyASVQmV8ahzjZAMYjhgCIOkSAsMrBiT00+gsRRu4mMbRkcKRAqdKxlz0cKRh3gh3TGAjYTHNpMzk1DnGAMfP4xPGRhQIIg8AAA=="
yak2 = "H4sIAAAAAAAACu1S207DMAz9Fz+XqvetfUNjTAUBgw0NhngINFsj2ni0Lmia9u84XRkMPgGe4nPi2MfO2cClKCUkcC9ePLBgVGGzYnirlyaSGXOniBkkjgUXQjeiaMOpqJaSRoJyWaUky5acifUKlaYakocNjLFWpFBDsoE7SI78OLId3/ECC+4hCSK7H0axG1ow58vA9+wgjvrRljFqmZ5A4rr92IIbkamGK/q2UYBvspSa+NKCMXdfKM3aqGqkBakmWYlnminKr0wB55DrJoVD9odMx7Rhfe05b0+WVOf4/vmIc1nOQhT1t55tAdY0LJHkZ2/eSxcetxkduG5kTd/jiXzd7RefOnpCuBqgzjplzJyrohhgY0ZndIMNya95BrmgAZalMMswhNE7E4q+hBp0itVhUUNOVSkv6gM4nP5eBi8hrce50ITlvqj5AUh0UxTsnNYLSi+n6xXLivnr0voSM7nPNuAMn7jc1vptj8h1bM8Je+HOHp4d9n2nF+3s4UaxHQau2/u3x1+wx+P2A9A7WMGYBAAA"
shaa1 = "H4sIAAAAAAAACu2X32+bMBDH/xc/U8s2/gVvU9ZW2dQuWzNl67QHd3EDEtgZmE1VlP99ZyBts/4J8ITvMHdfHx8dxwHdmtqiHN0VxlCUoOvGd3uwv7pdXNkt+K6836KcJOjGuM5U/XJtmp0N1yYUtlkGW/fOjXna+9KFFuU/Dmjl2zKU3qH8gL6hPNUSK5VynqDvKGcMDE6ESNA9yrlUWElGxRFM7+zyPcopzSDkF7MtO4iX4pjf/7G1dQFuJmgFuR9LB8pC09kELV2wjfkVNmUoPsUA5Nw3HhSde/8TSWIakNdf7/srSGoL//f0EOwFOY+mal/l7AOApsvaB3vKDVUZl+/6HaPxubNteL2+s7+H6vqH0X0X/H7h3XZUBp6PZVUtfBePHoviu2BfzrMoTFj4ujaxGNER9W5MGV6ERuvKN+dBo3Nd1vamPTMv12+LAUVYtqvCuODr56DxDaDcdVUF3PQklG63ftqDrCyLD9z6rX3eHY0P/gHCHZM3cGiGOdVc9/mowEQqKgc2hNSYE6LkzMZE2dDQGwgRAxsEcy4YG9hIJcGZyNK5b0yUDZoBHJRI1ieU0EQo13qAg0qOFUv53DemyQanCmvoDurUOEhGGIwcAxyEYKlUNsMxTTgoZZjANCrkQAfMGJynMQrAcSEU5pqpuXVMlI4LIeCHg41wCILTjGgqBzgY01goLdXcOyZKR0pTPEwcPMVUKqBl7Bswq4r4jZnRmAIaP4//AJU3dXJAEQAA"
shaa2 = "H4sIAAAAAAAACu1S206DQBD9l3lGQlkLwpupl1RTrbamXuLDKtuyCexUGDSm6b87g2hb/QR92pnD7Dlnh7OCC10aSGGSax2CB6cVNkvub9xCKpMxdoKYQRp4MNKu0UVbTnW1MHSqKTfVkEzZgjP9vkTrqIb0YQVjrC1ZdJCu4BZS1Qv8OEpiD+4g7fV8FUf9vvLgHtK9fhT7wb7qrblFZ4ZHMpEw47XObMN0yhd5fDWlccQfPRiz9Nw6NkZVYzwYOjKVfqaZpfxSCIJdrHsn7KI/PAYiw/ba87492VKd49vXJZ5lO3Nd1FuaLQF7Oi6RzJc2L6UrD9uJrrlqTE3b9cS8fC4Xnzp4QrgcoMs6Z4yc26IYYCNPl6VgQ2bznkGuaYBlqWUZAojfmba0MSrdCVa7pAJObWlG9U57PP29DF7CsB7n2hGW36TyByB1TVFwbNogWLeYvi/ZVpLIhQvMzPe0NGf4xHRr71c2+lHoH4SJavX2Qj8JIxVLVCQcsQr8SAUH/+H4C+F4XH8AWGQMDZQEAAA="
hf1 = "H4sIAAAAAAAACu2Wy27bMBBF/4VrleBDfGlXOHHqFkndxIXbFF0wNWMLkEhXoloEhv89Q0l5OPkEeyXeITlzOTqgtENXtnaoQJ+mFGXoogndFtR3v04jt4LYNIQVKkiGLq3vbNUPF7ZZu3hh48Y1s+jqPri0D9tQ+tii4tcOzUNbxjJ4VOzQD1R8YIzhnCoiMvQTFUJjwjgXKkO3MCk0xzTnTOxBB+9mZ6ig1NAMXdtV2UFGjpOD8M/VzkeYzNAcqt+XHrzFpnMZmvnoGvsnLsu4+ZoSkMPYeFB0GH1jk6Qy4K9/3vZPsNRuwv+nTbAW7Nzbqn1Vs08Ans7rEN1TbejLOPzYrxjFt8618fX4xv0d+hvuxvBNDNtJ8KvRGUS+lFU1CV06Oqjr0EX3cp7JxsZJqGubmpECye/SlvHFaFLT0BwmTcFFWbvL9kCeL943A5owa+cb62Oon5OmN4AK31UVkNOzUPr14mELtoxJG67Cyj2vTuJzuIN0++wdHowAEDKXqi9oJJZMaj3AkRODqTBEnuA4Tjgo3BbcKCP7gpQyrKkRRgx4UCmwooTpEx7HiQfnFCvB1PBloZTjnFAh5YgHU5hoxk50HCkdimCqlOIDHaC4hsukh4MLiXOd8/wEx3HCwbTBjEo9sGFyTIxUAxtCCEyUOf2RHgUav/ePzBsIjQoNAAA="
hf2 = "H4sIAAAAAAAACu1UXU/jMBD8L/ucs+wkTpu8nXoUeiegBz0VON2DIaaxlHhL4oBQ1f/O2g0fPfgH8OSdsb0z3oyygRPVaCjgaBpDBIct9mtCf+zKV7okbopYQsEjOFa2V3UoF6pdaXeoXKXbmdNNIJfqcY3Gug6KvxuYY2ecQQvFBi6g+BaLnMlRmiURXEIhEzbOJR9HcAWFiAVLhUjTLUG0evaDOJGLCM5UaXrqlzCvj/e60dbRZgRz0r41lpy5ttcRzKzTrbpxS+OqU9+A73PDM2Gf/c8k9zLkLqxXYSVLXYUPz5foLNm5VXX3RjM0IE8HDTr9rE1TGcrv4cQAfve6c2/rc323my5eD/S5w/UEbTk4I+aXqesJ9v7phM6wd/r1PZNKuQk2jfLD8IT3u1TGvRr1aIrtflNPLkyjj7s9eLB4PwwawqybV8o6bF6a+i8Ahe3rmnITkmDsavG4Jlt57i+cYKlfTnvwE6+p3Tb6IBx5xmKeJjIophkb5ZzHu3DkYyZ5IsVXOD5pODIh2VimoyCYZIxnmYh3fw6ZSDbK4uQrG58hG/+2T+ByJv2vBgAA"
lm1 = "H4sIAAAAAAAACu1V224aMRD9l3neWL6tL/tW0SSiLSlNqGhT9cEpDqy0a9Ndb6so4t9jG0KC+AR48syxPXNmfDR+hhvTWqjgy4RAAdedH9bR++6WybKLiF15v4AKFzAxbjBNNmemW9pwbcLKduNg2wzOzdPa1y70UP16hqnv61B7B9Uz/Ij7iEpFS6YK+AmVIkgILHhZwD1UUiuEpdR8E13v7PgjVIRoWsCtWdRDjMdQyu//2da6EDcLmMbcj7WLzEI32ALGLtjO/AnzOqy+pgD4ENuVCYfoEUmc6eX1Pq+RUr/y/18vxbORzqNp+nc5c4DI6bL1wb7mjl3ZmR/yiZ3zbbB9eG/f2b/b7vqHHXwX/Hrk3WLHLCKf66YZ+SGVHr1bPwT7Vs9oZcLIt61JzUhA4js3dXgjmrwr3x0GTeCsbu2kP3AvZ8fNiE0Y99OVccG3+6DpBaByQ9NE3WQl1G45e1pHWlqnCzd+Yfenk/PJP8Rwm+JIHBdMCUQZ5zmh0IgISlh+AoUJUlqWZ2mcqDQUkYilQZGUoRBnDKusDE4lIphhdpbGiUqDa40ELcVWGwRhXaYRErXBKEOEUHIeG6eqDaIlkiUTdC8OriTfTo4LKhCmklB6Hh2nKQ9KMdKMcZYTlgwxiYWQ23+FaaQ5PX8rJ6GN35sXt7Kv5wMNAAA="
lm2 = "H4sIAAAAAAAACu1S207CQBD9l3muDb3Ry5tBIaggCgYv8WGxC92k3cF2qjGEf3e2FBX5BH3aOWdnZ87Mng2MRSEhgauRCxYMSqzXjO70ykQyZa6PmELSsWAkdC3yJpyJciVpICiT5ZBk0ZBz8bFGpamC5GkDE6wUKdSQbOAekhM3COzY70a+BQ+QRJ4d+JEbWfDId17ctePQ7QRbxqjl8AwSx4ldC25Fqmou6NlGAL7JQmriSwsm3HypNEujspYWDDXJUrzQXFF2bQp0Drl2Tjhkf6nsmDYsrzkfm5MlVRm+7x9xLstZirz60bMpwJrOCyS5781racPTJqMFN7Ws6Gc8la+79eKipaeE6x7qtFXGzKXK8x7WZnRGt1iT/J6nlwnqYVEIswxDGL1zoehbqEF9LA+LGnKmCjmqDuD57HgZvIRhNcmEJiy+ipofgETXec7Gaayg9Gr2sWZZcWwejDGVX9kGXOCCy22tY3eEQWhHodf0Y6OEcRA6wc4cvufYTjeM/X9z/AVzPG8/AaLwxEaUBAAA"
--EW
lab1 = "H4sIAAAAAAAACu2X227bMAyG30XXrmCdJd8NWVtkW7uszZCtwy6URY0NxFZmyxuCIO8+ynYPWR/BvrJISOQv+gNBHdGtLR3K0Ce7PtRFFXLfEJSg69q3e3B/rbZx5Tbgu/J+g7I0QTe2au2uWy5tvXXh2obc1fPgys65soe9h1gNyn4c0cI3RSh8hbIj+oYyzimWRooEfUcZ0RQrpVOaoAeUXXAlsJZSiBPYvnLz9ygzQibozm6KFsIxHNP7P650VYDjCVpA6seiAmGhbl2C5lVwtf0VVkXIP8fz6blvuC469/6nMY1pQF73fei+oKjJ/d+nQ7AX5DzaXfMqZxcANF2WPrin3FCUYfmu2zEYX1rXhNfre/e7L65fD+774PczX20GZeD5WOx2M9/Gq4N159vgXu4zy22Y+bK0sRjREfWubBFehEbrytfnQaNzWZTupjkzL5dviwFFmDeL3FbBl89B4x9AWdXudoBNB0JRbZeHPcgyJh649Rv3vDsaH/wawp2SN2wIobCijAxsKEyFSvXABlU45ZrSiY1RssGZwYQR1bNhIKMWivRsCC0xNWrqGyPtGxdEaMxMSmVPh6BYc6nZQIfRmAuu2dQ5xkkHJQpro+O5SAcjmCtjBjoYNVgILuVExzjp4IpjxVLew0FTbBRMoKKnA+ZTQRVREx0jpQNYwJTQHo6UYZ5KRXo4hCDYSKamxjFONASTmMHo2XcOGDIkZbJ/yUpusIS3yvSQHSkbRHLMKDH9QGokFlLEtwuwoWHgUMrwqW2MAI2fp3/YSO71YhMAAA=="
lab2 = "H4sIAAAAAAAACu1S227bMAz9Fz57giU7sq23Ib0g3dplbYZsHfag1GoswBYzW94QBPn3Uo57SfsJ7ZN4jijykDo7uNKNAQVf9WrbWucr7AREcN5ivyH6h1uHyJTEnSGWoOIILrXrdT2EC92ujT/XvjLtzJtmIJd6u0Gq1YH6vYM5dtZbdKB28BOUZLmYFFwmEfwC9YknTCapjOCWQJoxIUQu8j1hdGZ2AqqY0OW1Lm1P5RIW2uM/0xjnQfEI5tT63joS5tveRDBz3rT6zi+tr76F9/ExN44Lx+wrjXFoQ+qG83Y4SVFX4f/HR5RLcu513b3oORQgTacNevPYm5Yyhp+HjBF8703nX8Y35u9hubga6RuPmym6clRGzBdb11Psw+iErrH35nmeaaX9FJtGh2UEIuhdauufhQZ0hu1x0UAubGMuuyN4uni7DFrCrJtX2nlsnoqGHwDl+rom2wxGsG692G5IVlGEB1dYmqfsAC5wReX20Rtv8IQzKbI0O3ijYEkuucyHP+AJOScTk+zDG+/SG+lEMhlnRTo0zFOWx0LwgzUKyeKC58mHNd6BNf7sHwDPD7EctQYAAA=="
thav = "H4sIAAAAAAAACu2X207cMBBA/8XPwfL9krdqC2hbQSlstS1VH0zXsJE29jZxqBDi3ztxwmXLJyRP9kzsmfHkyJ55ROeu9qhEq627D65qUIFOm9jtQfUt3PUzvwHdSYwbVJICnbnQuV2erlxz59OpS1vfLJOvs3LtHvaxCqlF5c9HdBHbKlUxoPIRfUcltRxzbZgp0A9UMosFN4zKAl2jUoEoqRbqCcQY/PIjKq3UBbp0m6oDcxz37uO9r31IYKtAF+D6tgoQWGo6X6BlSL5xv9O6Stsv/X5yqBuPig61/8VIejcQXR6v8wgRtdv493kTrIVwbt2ufeMzG4CYjuuY/LNvSMo4/ZBXjMLXzrfp7fzK/xmSG29G9VWK+0UMmzEy0HyudrtF7Pqjg3QZu+Rfz7PYurSIde36ZPSKPt61q9JroL10EptDo71yVdX+rD0Qj1fvkwFJWLYXWxdSrF+M9n8AlaHb7QCbDEIV7lYPewjL2n7Dedz4l9W98CnegLmn4j0bHFMhuJTZoZDYMmUYz/9AaIqFoUbMbEySjSPDsRWE2uxQMcyN4VZnNihTWHOtZjYmyga1BhOiBjaMwkZrYjIa8AlEBrfKfG9Mkw2mDebWiuzQEqys1sOTciQ4w0RoMrMxVTYIx4JaOxQcxmJKNRfPcFAMpehcjE4UDs6gxhBCDfWGwsRQQdTABpcGS6X1/KZMEg3oQ7DhhursUDIsmaJiZEMJLCyzam5ipwkH5wJrRRQbmli4OKy2cnhUGDaKGy3ne2OaaAgNAIxtCmBCBKNjBysldClQps5kTICMX0//AEt34Al0FQAA"
garl = "H4sIAAAAAAAACu2XyW7bMBCG34VnmeC+6Fa4SeAWSd3ERdoUPTA1YwuQRFeiWgRB3j1DSVncPIJ0ImdEzvwcfeDygC5c5VGOzlxT+sqVW5ShsyZ0B/B9q3ep55PvNIQtykmGzl3dubLvblyz8/HMxb1vVtFXvfPa3R9CUccW5T8f0Dq0RSxCjfIH9B3lC0EUVtQKmaEfKOcKGyWtMBm6QbkwBCtihHoEM9R+9RHlVsK3S7ctOojHccof/vrK1xHlNENryH1X1KAsNp3P0KqOvnG/43UR91/SfHLsGxeLjr3/iSQpDajr25u+BUXtPvx7ngRjQc6dK9s3OfsAoOmkCtE/54aqjN0P/YjR+Nr5Nr7tX/k/Q3XD7ei+iuGwDPV2VAaez0VZLkOXlg7WZeiif13Pcu/iMlSVS8VIjqT32hXxVWiyTkNzHDQ5N0Xlz9sj82TzvhhQhFW73rs6huolaPoDKK+7sgRuehKKere5P4Asa9OEi7D1L6OT8SncQrjH7B0cTDDMGZesT8gsFowyavt/II3FlCozozFJNISSmFDOh11DYG6ZVQMYkmBqDJ/BmCQYkmtMDNF9PmmwINoq3ZNhONaEEiJmNCaJhoB9gkpChuNEGCyZJsNNgwI0lGnKZjQmiQYFGhQXekRDwrWDcjmioeESSu18oEwTjYXgFCtG5fhC0ZhRrTjr4VhQBbdSw+V8pkyUDpmeJVzbAQ4ghUilhp1jISTHSs87xyTY+PX4BMctGW87EQAA"
moon = "H4sIAAAAAAAACu2XyW7bMBCG34VnleBOUbfCTQK3cOomLtwFPTA1YwuQSFeiWgRG3j1DV1ksP4J0EmcwHP4cfRiSB3Rta4cKtAjBowxdNaHbg/nVb9PIbcB3GcIGFSRDC+s7Wx2HK9tsXbyyceeaeXT10bm2D/tQ+tii4ucBLUNbxhKyFgf0DRXvpJKYMmky9B0VjEgMM36gQgmDhRH0Eazg3fwDKkwKurGbsoNMPMUtwl9XOx9RQTO0hFXvSw+aYtO5DM19dI39Hddl3H1O88mpr98hOvUO5JG0DAgjvSz4gqJ2F/49T4JYkHNvq/bNmscEoOmiDtE9rw316IfvjxG98aVzbXw7vnV//tc13PXu2xj2s+A3vTLwfCqraha6tHWwbkIX3et+ZjsbZ6GubSpGciS9a1vGV6HJugzNadLkXJW1W7Qn5sXqvBhQhHm73FkfQ/2SNP0BVPiuqoCYIwOl364e9iDLwK+bt9dh416ik/Ex3EG6x+wcC045NkIQNeBCEIa1EIJNYIwTDKY11oxqPQCDMWgJgvMJjJGCIQzBgkgx7BhUMSx1TvXUMcYJBjUK55xwMQBDCqykMURMYIwSDJoTzA3R+bBhaIa5nLAY6UHCicA0V3R4jjBisOb59CIZJxYKuoXkKh/eOzncO7nRMp9OkVFyIXID7w5zxoWANiIpl3LiYpxcUCwE12dcKKaw4mp6joziHPn1+ASAC+hVSxUAAA=="
elp = "H4sIAAAAAAAACu2YzW7bMAyA30XnRNAP9efbkLVFNrTr2gzZOuzgLmpjwLayWN5QFH33UrbTNtvewIYPFmlJpOQPFKlHcpFXnmTkpNwVDZmRs31odyh/qe9Ty29QdxrChmRsRs7zus3LrrnK9/c+nuVx6/fL6KtOuc4fdqGoY0Oy74/kMjRFLEJNskfylWRzLSW1TKgZ+UYyTY1UAHxGbkimQFBupXlCKdR++Z5kTuOnq3xTtDiZpMl4+O0rX0eS4ZdLNHxX1OhW3Ld+RpZ19Pv8Z1wXcfspjWfHumGV5Fj7l4csmUHfuvdN90aPmm34cxiEfdGdu7xs3tjsJkCfTqoQ/cE2bsnQfNf1GITPrW/i2/a1/9Vvbbgd1Ncx7Bah3gyeoeZjUZaL0Kalo3QV2uhf17PY5nERqipPm5EUyd91XsRXR5N0GvbHkyblqqj8eXMknqz+3QzchGVzuc3rGKqXSdMfIFndliVC02FQ1Perhx265VwacBE2/qV3Ej6EW5zuafYfMpyjhhsxGJSScS6Z6n4CgKUcOIcJjnHCAQiH1tDDMZdUSavB9XGDO6oEAzWxMU42RAoOivND5ABujHH9oQIAVGkHcoJjnHBwY6k1zkFnEShoy4ZDRXBBBdNqYmOcbEgBlDlmOnucIwtMWujRcAzPFOemZHScaKScwjHdBw2uUthwVnZozE1KNzSb0BgpGtpSp3VfwHIlMfVQckBDSpciylSljBQNaykYGA4Uh9cZ0gjbowEaKBeST3noKNFIqQYwrGJ7Nqykxgqleza049SCU1MFO044OKMC8DnAwagVLoWRLnAYQfGSVE+BY5RszKUylDPJdGdRYs2Kd+ZiSDiU4XhnKt0Exwjg+PH0DE10EkCpGQAA"
space1 = "H4sIAAAAAAAACu1X227bMAz9Fz17gmRdLPltyNoiHdplS4ZsHfqgNmpiwJYyW95QBPn3UbbTNusn2E8mjyXyiD4g5QO6NZVFOVruzaOlKEFXtW/3AHx322jZDWCX3m9QThJ0Y1xrys5cmXprw5UJO1vPg606cG2e975woUH5rwNa+KYIhXcoP6AfKP8guMSpFgn6iXJKOdaKK5mgO5SnUmPJNOFHcL2z808o1xICfjObooVoDMfs/o+trAuwO0ELyPxUOOAV6tYmaO6Crc1jWBdh9yXuJ+fYcE50jv5HkcQ0wK573nVPYNTs/N/TJlgLdJ5M2bzJ2QUATheVD/aUG2oymB+7FYPztbVNeGsv7e++tv5hgJfB72febQZmgHwuynLm23j0WBTfBvt6ntnOhJmvKhOLEYHId22K8Eo0epe+Pg8awVVR2ZvmzL1YvS8GFGHeLHbGBV+9BI1fAOWuLUtQTaeDwm1Xz3ugpXXccOs39mV1dK79A4Q7Ju+lIbnAacbSkzgYplRwOogDMwWQmsQxTnEImeJMppr34iAUM5ly1YmDgVKUzLJJG+PUBoPuwEnGhsZBCJaCZGmnDaoU1kKIaaqMVBwpdAfNqGDDVKFYUE0J7zuH4piLVE6tY6Tq0BwLxWk/VTS0Ea5Uf+OQcDkVVIhpqIxTGakgmGYZFSdpZELq/k9FqgxeKTbNlDFo4/74D47x7g8hDwAA"
space2 = "H4sIAAAAAAAACu1U227bMAz9Fz67gmJbtqW3Ib0gG9plS4ZsHfag1moswBY9W95QBPn3Uo57SfsJ7ZPIA5LnkD7wDq50Y0DBqtW3JoYILjocWgJ+uG2ITEnYOWIJikdwqd2g6zFc625r/IX2lekW3jQjuNH3LVrne1C/d7DE3nqLDtQOfoLKBOMyKeIIfoGKpWRSZCKCa1AnmSgYT1Oe7ylHZxanoGRGA7/r0g40LWGBHf+ZxjgPahbBkpjvrCNdvhtMBAvnTadv/cb66mvo58fYtCcco68k8kBD6sb3enxJUV/h/8cmqiU5d7ruX3COA0jTWYPePHLTTabw01gxJd8G0/uX8cr8PdwWbyZ45bGdoysnZYR8sXU9xyGsHo6CgzfP+8wr7efYNDocIwBB70Zb/yw0ZOfYHQ8N4No25rI/Ss/Wb49BR1j0y0o7j83T0PAFQLmhrsk1ow+s267vW5IlZWi4wtI8VYfkM97QuH30xhonkrOY8zwZCRM+Y0kmRDqZIxYsjz+88V69kaQZy/ns4I24SFhSpLI4eEPkCRNSfvw23oE1/uwfALomWP6uBgAA"
space3 = "H4sIAAAAAAAACu1S207bQBD9l3l2Lcd21njfqnBRQEDapEoL4mHBQ7ySvWPsMRWK8u+dNeaS8gnwtDNHczlz9mzhwtQIGpaNucMEAjhpqW8E+OU2PsJCsGOiAnQUwLlxvamGcGXaDfKJ4RLbOWM9gGvz1JB13IG+3sKCOsuWHOgt/Aat0jBPDyZKBfAHdJznoUqiLIAr0N/UNAsneZKoneTkcH4IOlcy8acpbC/jktCvp0es0THoSQALWX1vnRDjtscA5o6xNXe8tlxe+v5oHxsPhX30P46RXyPshvdqeIVRV9LflyapFTr3pure7RwGCKejmhhfdosoY/h9qBiTHz12/D5e4sOzuHQ7wkumZkauGJkJcmaraka9P92LQj3j2z2z0vCM6tp4MTzg+a6N5TeiPjumdn+oB1e2xvNuLz1afRRDRJh3i9I4pvp1qP8B0K6vKrHNYATrNqunRmjluW+4oAJfq31ySrcybhd88EacZeE0SdPRGnE4jfMsfvZGepCGKlKT9Msbn8AbN7t/V5QnyZQEAAA="
--ShB
lake = "H4sIAAAAAAAACu2a224TMRBA/8XPwfL4Ot43VC4q10KLCkU8LMQ0K5J1SRwQqvrvjB0XWvgE+yn2aO2Z9R7Nzblmr8ZNYAN7MX4L63FesgV7uo37KxK9my/zKGTZkxiXbBAL9nKc9+O6DM/G7WVIT8e0CtvjFDZFeD7+uorTnHZs+HjNTuJuSlOc2XDN3rPBGckNartgH9igHBfaol6wCzY8kMid8mhvaBrncPyIDQhqwd6Oy2lPmymelccfYRPmxAZYsBNS/HUii4e03YcFO55T2I5f0vmUVq/zenFfVl+U3Zf+Y6HIasi48ntRfsmi3Sr+vF1Ez5I5X8f17o7OsgHZ9HgTU7jVTUdShw/LE3XyZh926e74NHw/HG38XMWnKV4dxXlZLSPJ82m9Por7/Oo0exv3Kfx9n6PVmI7iZpM/XxFke8/HKf01NM+exO39TbPwbNqEl7t708dn/x8GHcLx7mQ1zilu/myavwAb5v16TdAUDKb58uzXFZnlfV7wKi7Dn6fz5Fn8TNvdLP4nQxkOFtAVhcZyZZQ3FQ0luBSmk9EmGVJwQMCizymOWgIcwNDCcOGdkh2NJtHQCPT9wVWnIbgTCFC9BmguBHjQHY424dAURAC1KQpRciukr8mGAW6Nw45Gm2gogZSGukNIAam5QmOErdmGNlxrkna/0SQcIMlVWFSq0gFcGqlsjSoKLfcWTM9G26TjATouUfpDygEAVLUK52tYoVQVjVfdc7TJhhaWS2eMrnAorhw1NW6LFcmFFd1ztOo5NAquAW11HYJ8hdY5CSlZh7UcpO+eo002rKJixcqD4/BUnXhrarHiuTFW9fZXs26DcgwFWtcGmONe06ygQQ7FERu9/dUoGtQI5RJcdRvGcOmFFKqwATL30H2PKG2yAdTFQE3N8aJQS6pLynVaJsM6bnUno1Uy6N7VKKHqJSzktNP5AxrKAkc0snc32mRDauTgHRwCiqRGqNI+FyzEhqYKBTWa3hdtlA2kCzWNqkYUCi8olJGFDSc8d7bnoW2SYcFxgLzqcAsrQVBWWsAwOSmV/U89jYKB5CUcyluPYSiy5PvYnGlQ4mHptr5nGi2g8enmNxnCqW5oKAAA"
khol = "H4sIAAAAAAAACu2a3U7bMBTH38XXxfLxt3M3dYA6BGPQiY1pF2E1NFITs9bZhBDvvuMkfHQ8gn1R1T5x7BP3p5P/Oe4jOatbTypysg6bftfUZEaOt6G/R9PX7i61/AptRyGsSMVm5LTu+nozNJf19s7H4zqu/XYRfTsYr+qH+9B0cUeqH4/kPOya2ISOVI/kG6kOJNdUOtByRr6TSgpL8ePEjFzjRc0FBbz6hN3Q+cVHUlnAkRf1qulxPkHT+uGPb30XSQUzco5r3zYdeha3vZ+RRRf9tv4Vr5q4/pzuZ/u26VnJvvU/J1laBr0bvq+Hb/Rotw5/n2/CsejObb3ZvVlzmAB9OmxD9M9r465MzQ/DiKnzpfe7+LZ96X+PuxtuJvNlDPfz0K0mz9By0mw289CnR8feReijf32e+bqO89C2ddqMZEj+XtVNfHU09Y7Cdn/SZFw2rT/d7XUPl+83AzdhsTtf110M7cuk6RcgVddvNsjNQELT3S0f7tEt59INZ2HlX0anzqdwg9M9zd7DwbWlwnE+sqEs1YZJObFhgDppbGEjTzYAHOIAagocEqhAOswEB1PUKel0oSNLOpyiGrSAkQ3GMIpIObGhhMDAIQsZWZJhNFUYHdSwnnCMogAReiQDhQcFoQoZWZIBYClY57ge2TCGWmfNJDe44pSh3ihwZAkHRzgcE3JiQ2vqtNF8ZAMMXrSa8QJHlnBIVBRMGDeygSmsFZZNcQO4pFI7W/RGnmwoJ1B8GjGmKQLDCGNgR8GB6kMZkCVs5ImGlApLX8qIEQ3MUhi3diBDaKDAywslUzK4lVSoZyHKUJdyI9RABgeGPStLlpInGpiGYBbiUhU8sYHVc0RjrGxg9qqxPF7IyJOMA24VNc6qlxRFaiXH98kBF5xyZlgpl2cKh8SjNMkTDgMcWNsQdiqIgsLauZDOlfQ1TzYUHrNpnpKSxIa01JjpBBY0o0ZZW1KUTNEQRmH6yuwkN4TCHMXYEQ7MT1IUKQXzXOEATFlRb+rxmE0woAwUH+FA7UEBMHSUl0qWcGBJHAzXoxjlBg/WdPqPTyKDY0gBKCcpOYDx8+kfwFKsRFAmAAA="
ahn = "H4sIAAAAAAAACu2aW0/bMBTHv8rk52L5dnzJG+oAsQnGoBO7aA9hNTRSE7PW3YQQ333HuQAdH8F+anyU2CfuT+fydx7Jed16UpHDVffucFP77o7MyMkm7O7R+KW7S1d+ibbjEJakYjNyVne7et1fLurNnY8ndVz5zWn0bW+8rh/uQ9PFLal+PJKLsG1iEzpSPZKvpBJKU2Y14zPyjVQSqHJCMzMj30l1ILilTjJtn3AcOn/6nlSWw4xc1stmh/NJmtYPf3zru0gqnOQC175tOvQsbnZ+Rk676Df1r3jdxNWn9Dzbt41vS/at/znJ0jLoXv/7vf9Fj7ar8Hd6CO9Fd27r9fbVmv0E6NNRG6Kf1sZdGS8P+zvGweed38bX11f+97C74WY0X8VwPw/dcvQMLR+b9XoedunVcXQZdtG/vM98Vcd5aNs6bUYyJH+v6ya+OJpGx2GzP2kyLprWn233hkeLt5uBm3C6vVjVXQzt86TpHyBVt1uvkZuehKa7Wzzco1vOpQfOw9I/350GH8INTvc0ewOHFI4C06pfT1iqODNiQENaTYUzUMjIkwxnKGiAgQyghmsDckLDUiklM4WNLNlQDNOCkq5fjztqQaspbHAhqQIAXdjIkg2QjDrG7RA3FAVpwdqRDVzfaGtcYSNLNhTDnGKxIJ3gEIw51bPBncBCRDBe0MgSDWAYNhQMhag0GCcEG6IGOE01hpACRpZgKMeoVmM+QTAEaGGH7hUvqBWiZJM8yeDMUS6clEMZqlOLopju0VDYvFoQogSNLNE4kJJKA1yN7aukmgmRdK0UNpyluggbuUpeB1xhh+o0H0UvhjKHlXyIGyCw2NDgiuqVKxzIg8PMMbEhpYNUlaacgg0LyhyuKBu5soGHJRygPx9Jxaigxklth8ghpMPaFIel5MiUDodHKRLkeM5mqdCYY0Z1QytqmQFV4MgTDiU5RU3cDZFDo77B9KSYG0O5QVgKG3mywQ1Qi7L4oIoCT2nEwHRA7zhmGSNK5MiUjvT5Bp602iFyAH6+gVL52K0cKJsEdWvLQWymdCgH1DkxxQ7sXbQT4yk99iqonDJWKtIc4Pj59A/MQTJ6WSYAAA=="
mheg = "H4sIAAAAAAAACu2a3U7bMBTHX2XydbD8/ZG7qQPUTTAGndiYdhFW00ZqYtY6mxDi3Xccp0DHI9i5iX2U2MfOT/9jH+cRnTedQzWab96drd0KVeh064d7sHztV7HklmA78X6JalKhs6Yfms1YXDTblQunTVi77Ty4bjReNw/3vu3DDtU/HtGF37Wh9T2qH9E3VB9xwTG3SlToO6o1wVZxIWWFblAtKcPMGsKfoOp7N/+AakNVhS6bZTtAcxzH7v0f17k+oJpW6AK6vmt7cCxsB1eheR/ctvkVrtuw/hzfJ4e2aaTo0PqfjyR2A96N95vxDh7t1v7v/iV4Fty5aza7V32ODYBPx50Pbt83TMpUfD8+MVW+DG4XXpev3O80uf52Ml8Ffz/z/XLyDCyf2s1m5oc4dKhd+iG4l/HM1k2Y+a5r4mREQ/T3umnDi6OxduK3h41G46Lt3NnuoHq8eDsZMAnz3cW66YPvnhuNXwDV/bDZADYjCG2/Wjzcg1vWxhfO/dI9Px0rH/0tNPdUvWWDSgs8EJ3gUBQTI4kdvwEXFCslhCps5MkGwZxyuIRMygFSoaSlSTkE0VhzrQsdedJhgA7FLE+6YbDkmibdkBBiDCdUFN3IkgzKWPz+Uu1DiqHEcjayoZnFWpGCRp5oHDGJlTZmYkNTTAklXI1sKKOwsJoV2ciTDQ7aIKRSKaQYCUIhTJINaQWmhtKCRp5oyDGkSLEng1BtpmUolwCNKWDkCYaC/IVUQicwKMQPo2wig8F+RSrDS2ojVzY4xBM+RROKJZV6BINSjrXRQhfRyBMMaQwmgk5kQI+KKTOiEdenRlCji2jkygYzWChjn2WDc8aFmOiAnJexsqxDc6XDgjwwxmyCQ2DCCASSBEfcozDKSz40TzZo3IhY2KMmNiA5rqicogqkPLCighU28mSDcwPJcp5kwxqQCWnJJBtaRm4kKWzkyYaMp6ycq7SFhUw5pszCsdpEBxVYw6lboSNPOoRk2ELC3Ex0SCy1USkpeiTgvw7LmCwZ8zzhYNrCclRM/24YBlkNOIVNbMAeFgvGTMmM5sDGz6d/2n+H9FImAAA="
rak1 = "H4sIAAAAAAAACu2XzW7UMBDH38UXLqnl74/c0NJWC2op7aJCEQeXdXejbuIlcUBV1Xdn7Oy2XeANkpM9I3vm78lPY+cRnbvaoxK17v5NrO4dRQU6bUO/Bd/nZpVmfgm+kxCWqCQFOnNN7zZ5unDtysdTF9e+nUdfZ+e1e9iGqokdKr89oovQVbEKDSof0RdUHlHCMFeUEVWgr6jkWHFDORUFukElsxoLqS17AjM0fv4OlYbqAl26ZdVDQI6TgPDL176JqKQFuoDkd1UD0mLb+wLNm+hb9yNeV3H9Me0nh77dadGh9y+VJKUBdXm8ySMo6tbh934TrAU5d27TvcqZA4Cm4zpEv88NZdlN3+YVO+NT77v4en7lfw7lDbc791UM21loljtl4PlQbTaz0Kejg3UZ+uhfzjNbuzgLde1SMZIj6b12VXwRmqyT0B4GTc5FVfuz7sA8XvxbDCjCvLtYuyaG+jlo+gKobPrNBsDJKFTNavGwBVnWpg3nYemfVyfjfbiFcE/Ff+iwAmtJLM8ZpcRKM2pl/ghUa8y0MXSCY5xwMAutwypjckYBpHCumc5wWI45M0ZObIyTDWkoVtLsLhWONaFcDGgcGQKkWGEmNkbKBieYSqtzQkawUkzw4cFhBGaKSzX1jZGywYEHxgwd7hTGMJGMJFQADq4MtoQJPTWOccLBGAcANBN7OLiVmg2vUQWmlWRiY6RsCHhkSMJlTkjhv5RJTfiAhoQHh7KST31jnGxIw7DhfLhTqMCCSJ6CJDY0dBE9XSmjaBvfn/4A7XbZoV4TAAA="
rak2 = "H4sIAAAAAAAACu2XzXKbMBDH30WXXohG30jcOm6ScTtJ3cQdt+n0oNSKzQSQC6KdjMfv3hUQJ24eAU5oF2n3r9VvFrFH17Z0KEO1fXwX8kfLUIIua9/uwPe12sSRW4Pvwvs1ykiCrmzV2qIbLm29ceHShq2r58GVnXNln3Y+r0KDsh97tPBNHnJfoWyPvqGMa4YVITpB31EmGE45EzRBdyg7o0ZgrhSVB7B95eYfUKZpmqAbu85biMZxzO7/uNJVAWWwbAGZH/IKdIW6dQmaV8HV9ldY5WH7Oa4np75hq+jU+59EEtOAuu551z1BUbP1f58XwVyQ82CL5lXOLgBoOi99cM+5oSbD8H03YzC+tK4Jr8e37ndfW38/uG+D3818tR6UgedTXhQz38atg3Xj2+Be9jPb2jDzZWljMaIj6l3ZPLwIjdaFr0+DRucyL91Vc2KeL98WA4owbxZbWwVfHoPGE0BZ1RYFUNNxkFeb5dMOZBkTF1z7tTvOjsZHfw/hDskbNKQkWEiSdvl4igEVxdPuCDTWqU5TNZExSjIEF1gyJvumQbAhUqqeDKo0NkoLPqExSjQYp1hzTns2mMapkEaYjg1uFI6v0omNcbIh4PyFZqJLSA2WhHDeocEIi680m9AYJxpEYUmFGdoGxURSLVR/EWVKYUopn74p44TDcEzhuqmGvkEwh7bB+sZxxrXCQM90FR0nGxJaAzv+v+KIiY4X04iGSA2mQpnpmzICNH4e/gF3wG01OhEAAA=="
temp = "H4sIAAAAAAAACu2a247TMBCGXwX5urV8mPEhd2g5LQhYoNJyEBeBNTRSE5fWBaHVvjvj1N1l4RHsq2Ss2J7Yn/4ZT3LNXvVjYB1brcODVRi3YZ/Ygj3dxcOWWp8dprQn+0mMV6wTC/aynw79Zr5d9bvvIT3t0zrszlMY58bL/vc2DrlT9+maXcT9kIY4se6avWcdoufSO2EW7APrtDXcCC0X7CPrlkpIrsC5GzLjFM4fsc5Jt2Bv+6vhQKNpnmePP8MYpsQ66nVBM38bJvIr7Q5hwc6nFHb913Q5pPXr3F/cbysvyu63/uOiyNOQc/P143wlj/br+OvUiZ4ld771m/1fc84DkE+Px5jCaW5ak3L7cH6iGG8OtMZ/378LP45rG7+U5ncpbs/idFU8o5YXw2ZzFmk3ZuttPKRw9z5n6z6dxXHs82LkhuzvZT+kO0ez9STu7g+aG1fDGF7u75mPV/8vBi3C+f5i3U8pjreD5h1g3XTYbIiYmYNh+r76vSW3vM8dXsWrcPt0Np7HLzTczeI/NJQ0HIU1bp4QyJLOuXkLpFTcGSsMNjaqZEMTDVpohYUN4NZItDMcFjiAV0026kQDQXOtAI4RBUgpwBt/1I2l4l6QiGjTdKNKOIzR3FNQgQKHJxURhQ2nuEWUtqFRJRoWLFfGndBQglNYySoy64bUHNDYphuVwiE8dxJUYQO4xEIGgOMalG9k1EkGguJK3+WhoOGYhi5RKy7Qtjy0TjBAUfUCrT6SkfUD1REMYyRHMLIlGnWCYZFOIUaVYAIEgxaqiIYTwL3XrbBRqWooUg3nSS6O9VBvqbChSj0UcmXDtUSjTjKWSHmm9R5KRFGaUwG0FESXBAnXDgFaUKmTDqkp3XAgi24YSj09QhEOSjik8aqxUScbSmvuSBxKKoocqQRaDiloOaJruWilaKDQHL3JOMxsULVcC1NqG9bloGKbblQKh8kf5x1qcyscUlgsCQdqiilWt5hSJxtoqe5lhDwJB1KEEbacYo1wHK0ULRutlA6QkoNRrvzWY5A+rYEvdFCaSkcZ1/7dqBQO2nvulDJH6ciWP0UVKQy3FluRowo2Pt/8AeFHcilsKAAA"
--SB
fringe1 = "H4sIAAAAAAAACu2W327TMBTG38XXwfJ/x7lDZZsK2ihbUWGIC4+6baQkLokDmqq+O8dJ2q3sEZKr+Jzax59Pf/rsA7qzpUMZ2tR5tXUUJeim9u0eMl+rbRy5NeSuvV+jjCTo1latLbrh0tZbF25s2Ll6HlzZJVf2ee/zKjQo+3FAC9/kIfcVyg7oG8reKZZiQ4hWCfqOMio4FkITmaBH+FGSFKdSCnGE2Fdu/gFlirIE3dt13kJBjqMA/8eVrgqwPEEL2HyTVyAt1K1L0LwKrra/wioPu89xPbnMDWdFl9n/VJK4Dcjrvo/dFxQ1O//3tAjmgpyNLZpXe3YFQNNV6YM77Q1tGYbvuxlD8KV1TXg9fnC/+/b6pyH9EPx+5qv1oAwyn/KimPk2Hh2ie98G93Ke2c6GmS9LG5sRE1HvyubhRWiMrn19WTQml3npbpuL8Gr5thnQhHmz2Nkq+PJcNP4DKKvaogBwOhQAo+XzHmQZExfc+bU7z47BR/8E5Y7JWzqklpgpokVPB9dYSc16OAQ1WCvOJjhGCofgHRyMDXAQLIVOB+sQkmEtmZycY5xwMMqwUYLrHg6msaBE6R4OuEPgmlHpZB1jpYNRTLiisqeDcsxTavj52QF4MML4ZB7jxIMbg6N3nMxDAg7K0J4ORiSmgA6d6BgnHVIJeFqo/tmRamwkIaZjg3KFtZlsY6RgKKYw3Cyktw2tMJFc967BU4m5NHx6cYyBjZ/Hf79c7EdFEQAA"
fringe2 = "H4sIAAAAAAAACu2XzW7bMAyA30VnVxD1L9+GrC2yoV3XZsjWYQd3URsDsZXZ8oai6LuXst2fbHsD+2SRkkiK/iBSD+S8qDzJyW1T1neek4ycNqHbo+ZLfZdGfoO6kxA2JGcZOSvqrtj1w1XR3Pl4WsStb5bRV71yXdzvQ1nHluTfH8hFaMtYhprkD+QryY+E4tQZBioj30juNGVGOp6Ra5IDSs4aZx9RDLVfvie5Bpy7LDZlh+YETe7Db1/5OuL6jFyg69uyxsBi0/mMLOvom+JnXJdx+yntZ4e68aTkUPtXjCy5weD673X/xYjabfjzvAnXYji3xa5947M3gDEdVyH6Z9+YlHH4rl8xCp8738a34yv/a0huuBnVVzHsF6HejJGh5mO52y1Cl46O0mXoon89z2JbxEWoqiIlIylSvOuijK+BJukkNIdGk3JVVv6sPRCPV/8mA5OwbC+2RR1D9WI0/QGS191uh9j0ICBEq/s9huVc2nAeNv5ldRI+hBs095j9hw2mqVJg+cAGgqIEtwMb0lAGwGY2JsoGl5wyJqQe2JAUhGWgezjwSpHOifnamCQaRlELnA2XBjBFwRgzgHEEQlMDxs1oTBIN0Io6cG5kA7CigNIjGxKQDSfndmOiJUVZRYXlcmDDYO8JMBaUIw5AueYwtxvTZENoTi1XMLAhBQVrmerZwIrCLCgu55oySTS4YpRb5cTABudUC8aGV4oAQ412gs9sTJMNrakeCwpYLChGiR4MiRPcODaDMU0wFMdeU/Lh8YptBuVKw/B2lfiUlUzNN8YEwPjx+AQGcPUSbRUAAA=="
peaks = "H4sIAAAAAAAACu2azW7bOBDH34VnhyA5wyGp2yLbFGnRbrZNkd0WPSg1Gwu1Ra9Nb1EEefeOPtzUySOQJ3EGEmdI/cAh/9K9eNtuomjENrbf9mIhXu7SYcv2h/5uaMUl+y5SWopGLcSbtj+067F53e7uYn7Z5lXcXea4GZ037Y9t6vq8F82ne3GV9l3uUi+ae/GPaM6M05KU9Qvxr2gGA702sBAfReMwSEU2PLCV+nj5p2jIcIfv2mV34N5ADtHT/3ET+ywavRBXHPlr13NeeXeIC3HZ57hrv+SbLq/+Gp5Xp755mOLU+yRFNYTh5Mbrx/HKGe1X6fvxIb6X0/narve/xRw74JxebFKOx9g8J3Pzj/GO2fj7EPf59/b7+N80t+l2dr/PaXue+uWcGXted+v1eToMQx8mJR1yfBzP+arN52mzaYfJGBxDvjdtlx8THayLtDvtdHBed5v4Zn9ivrh+Phk8CZf7q1Xb57T51enwBkTTH9ZrpmbkoOvvrn9sOa0QhgfepmX8dfdgvEq33N3D4jkaTmvpkSyNEcGgDE7j+A7IOzacrmiUiYYlkIAzGNpLBGNHMCwhG8pUMAoFw4A0isy8ZCiJLuiRDLCeCw3oikahaJC2MgCFCQ08lnMDSjpeP6AuGWVy4YyRVjm0T8A4M4ELi0dXwSgTDCKSqMIzLiCAdGQRKxhlgmEhyBAInoJBihcMcqqCUSgYBokVCxgOqSdkgJWeFwyqe4xCwdA+SMJg51oCTiquIG6EQ3srAQL5Wk6KhMMBS1nKz9XEkwyEQJPMFZw0HgxVNIpEQweSwIVjUsfBGakU+RENZDlDh3o4KbSiaA+81UTSExmkpDUuTPXE8iaEz7N10SgUDRdY0JplLmukMcGa6YDCcqhFp0wtKMWygVKTwqM+TtLBXFDODH9TQ4B6RikVDS0h4BEN5STwEWXah56xqiENaqrKRplwmKCltqjm3zQCSu8UuUfZy5GrOnmZbKCz0gJXjpkNDqk0HNngj26EqrJRJhvE2pZCbaY/NQyrYAh6RgMd7zfQ2KptFIDG54eftVYwDFUoAAA="
lochs = "H4sIAAAAAAAACu2Z32/TMBDH/xXk59ayff6ZN1S2qcDG2IoGQzxkq7dEauLSOKBp2v/OOUm3FfgPkqf4zol9cT7yfc95JGd55UlGVoV/8zHcFg2ZkZNdaLfo+1Lfp5Zfo+84hDXJ2Iyc5nWbb7rmKt/d+3iSx8LvltFXnfMqf9iGso4Nyb4/kvPQlLEMNckeyVeSzbUSVBhm1Ix8I5kR1DEwAq1r7OSKKicMuCe0Q+2X70imBZ+Ri3xdtjgg0BRA+OUrX0eSYc85Tn5X1hha3LV+RpZ19Lv8Nl6VsfiUnmeHvuFtyaH3ryhZmgbD667X3RUjaorwe/8Q3ovh3OWb5tWc3QAY01EVot/PjcsyNN92dwzG59Y38XX70v/slzfcDO7LGLaLUK+HyNDzodxsFqFNr47WRWijf3mfRZHHRaiqPC1GcqR4r/IyvgSarOOwOxw0OVdl5U+bA/No9e9i4CIsm/Mir2OongdNX4BkdbvZIDgdCmV9v3rYYljOpQfOwto/352M9+EGh3ua/YcOo6l0vJvPOmoZKNl9AW4cNUaAmcgYJxnGGWqFhG5CziUFp7jt2ADJKSAcExojRYMZKsBy3bMBigoNPRqSY4JxYsonI0XDSk2Zcb3Y4IJR6zTjHRpaAxVC2mnXGCca3EmK+cTJng2lqQYD0LGhQKL2kDCxMUo2rMYSBaCXoVxiweIc70sUhTJkkhpjrU/AcEwnZhChgGAoZfps4iyVCoyctoxRkjFPZAAztkeDSWqUFH3tKhijoKxQExvjZAMYliROy16GOqBG2EFpzAWnDox2k9YYKRxaGAqCDzkFS1knQUO/c8xBYSeoCY6RwmG4Rbnp9oIDT0Q5WNezgSflmFb0pDjGyQYwS53W+7MNAMwjqZi9Hn6yGA1iYmOcbGiBZxva2uFEFEnBthPDvqEkRYE6qdExsPHj6Q+sct+x4R0AAA=="
ruby = "H4sIAAAAAAAACu2Y30/bMBDH/xXk52Kdf9t5mzpA3QRj0ImNaQ9mNTRSE3eNswmh/u9cnBbo+BOSp/gu9t3Z+chfx0/kwleBFGS+DEdX7d3j0XXwZELONrFdo/tb/dC1wgJ9pzEuSAETcu7r1q9yc+43DyGd+bQMm1kKVXbe+Md1LOvUkOLnE7mMTZnKWJPiiXwnhbWUO8vYhPwgBVdUccksWrekOFZWUGDA1RbtWIfZR1JoJibkyi/KFsPha0wf/4Yq1IkUOOwSU9+XNRaWNm2YkFmdwsb/TjdlWn7pxsOhbzddcuj9r0bo0mB5+Xmbn1hRs4z/9oOwL5Zz71fNm5w5ANZ0UsUU9rlxUXbND7nHzvjahia9bV+HP/3ixrud+zrF9TTWi11l6PlcrlbT2HZTR+sqtim8zme69Gkaq8p3i9E5unpvfJleC+2s07g5DNo552UVzpsD82T+fjFwEWbN5dLXKVYvQbsvQIq6Xa0QmwxCWT/MH9dYlnPdgIu4CC+9O+NTvMNw28k7NpjRVArgOR9zVFsudI+GtoxKDXwkY5BkHOPnBwPG5YSaIyaWK7VnQ1LFJBvZGCYbAjQVzvWSIjU1RinNezakBIqy4uwIxzDhMBKFQ3KRE1qgApWk1xSNAuOM5HpEY6BoME6ts1bv2QBroNcUoQCpMWbcNobJBuOcOgcc5AsbmQuuJRUW5WXcMwbJhXScKiVUv2UYQy1o0x81OKCeCJDjljFMNLiT+IeqoD9p4OECuOvJkILhscON/67DBIPhlZdkYHopQQHhoGwGQymOl2FcyVFNBkmGlI4ablXOpyxlDFBPMhoWz6bMsPEmdAhk/No+Aw0brDCIFwAA"
yanx = "H4sIAAAAAAAACu2XzW7bMAzH30VnV9C3Jd+GrC2yoV3WZsjaYQd1URMDtpTF8rYiyLuXcpy2WR/BPpkkJPEv5gdS2aFrWztUoDvr/5UWZehyG9oNBL75VbLcEmIXISxRQTJ0ZX1rq86c2+3KxUsb1247ja7uggv7tAmljw0qfuzQLDRlLINHxQ59RwUTChOmhMjQXfKwyTUXKkP3qDgThGJG+B684N30IyoUhYU3dlm2cBrHKXv442rnIypohmaQ+bH0oCtuW5ehqY9ua3/FRRnXX9J+chrr74lOo/9JJCkNiOu+990XFDXr8Pe4CdaCnEdbNW9ydgeApvM6RHfMDTXpzQ/dit752romvrVv3e9DbcNDH76NYTMJftkrg8jnsqomoU1XB+8mtNG93meytnES6tqmYqRA0ruwZXwVmryLsD09NAXnZe2umhP3fP6+GFCEaTNbWx9D/XJo+gVQ4duqAmo6Dkq/mj9tQJYxacN1WLqX1cn5FB7guH32Dg1ODdZEsgMaXGEwad6TYSQ2WpkRjUGiQZXERGumuoRGYSMplwc0JCVYM0NHNAaJBswTTgQ18oCGwVSw/IiGAAGMjgNlmGicUcWxMprzLiOlHOfaKCIOdHAtsZZSjY1joHRA68gl6eEgacJI0ncOThS8RMXIxkDZEJJhIqTOD3AwjaXUxHRwcM0xk/AaGRvHMOFgIoc/Koz2UyXHPIcp07Eh0wOEUDY2jiGw8XP/DApriwA7EQAA"
azim = "H4sIAAAAAAAACu2Z224bIRBAfyXi2Yu4X/YtcpPIrZKmiav0oj5sahKv5F1cL9sqjfLvHVznYvwJ8GRmDMPAHsHM8Igums6hGs2X7uj4b9sdXQe3Xjs0QWcbP67hn8/9fWy5BehOvV+gmkzQedOPzWrbnDebexfOmrB0m1lw3VZ50zysfduHAdXfH9GlH9rQ+h7Vj+gLqistJSZcSzFBX1FNJcEw5Bu0qMTWWsOeQPS9m71DtWJsgq6aRTuCLR47nvvfrnN9gP4TdAnz3rU9eBU2o5ugWR/cpvkZbtqw/BjHk33dbrloX5s4uPUHPHv2C37Bo2Hp/zwPgr7gzl2zGt7MuTUAPp10PrjnuWFHds3jbY+d8Gl0Q3jbvna//u+sv92pr4NfT32/2HkGmg/tajX1Y1w6SFd+DO51PdNlE6a+65q4GVER/b1p2vDqaJRO/WbfaFTO286dD3viyfxwM2ATZsPlsumD716Mxi+A6n5crYCZLQVtfz9/AIZqa+OAC79wL72j8N7fgrmnySEYinHMiLIHXBBsCdGqcJEnF9JyzCVRMgVDUiytpLKAkScYwhisNdwbCRjMaEyV4LqAkScYXAtsqDI8BUNbbAUjpoCRKRicYU61ZgkYHMAwjIrCRZ5cUC0xN0SphAtpKGashJ65piQac82FsWmuqgjBlHFazossuaCWYsM10SkWMVVVsmCRKxYCEyPT4EIYgoWCNKWcFlliwYTCWhiaJiOMYaEFLfXOTLGQDBtFZZqkVpRAvUsYxst5kSUYQAJ8/oMctYLaOCaalOgiTywqKGhB9YqYNEmtYtwhiSUlwMiUDEEYZlofksEUx5QKUQpbmZLBIfa0DG6OlAwJqSo1zJRX1UzJoEZAcUuRtLRVSQ7pimYFjDzBgHI3VkqZ9FG1kgbyVU5tiTLyBCPWvAmxBzcJVxpLQ3R5VM2Bix9P/wCrWfeuNigAAA=="


-- A Ranks --
if expansion == "DT" then
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
elseif expansion == "EW" then
a1 = "Storsie"
a2 = "Hulder"
a3 = "Yilan"
a4 = "Sugriva"
a5 = "Minerva"
a6 = "Aegeiros"
a7 = "Lunatender Queen"
a8 = "Mousse Princess"
a9 = "Gurangatch"
a10 = "Petalodus"
a11 = "Fan Ail"
a12 = "Arch-Eta"
elseif expansion == "ShB" then
a1 = "Nuckelavee"
a2 = "Nariphon"
a3 = "Li'l Murderer"
a4 = "Huracan"
a5 = "Maliktender"
a6 = "Sugaar"
a7 = "The Mudman"
a8 = "O Poorest Pauldia"
a9 = "Supay"
a10 = "Grassman"
a11 = "Rusalka"
a12 = "Baal"
elseif expansion == "SB" then
a1 = "Erle"
a2 = "Orcus"
a3 = "Vochstein"
a4 = "Aqrabuamelu"
a5 = "Mahisha"
a6 = "Luminare"
a7 = "Funa Yurei"
a8 = "Oni Yumemi"
a9 = "Gajasura"
a10 = "Angada"
a11 = "Girimekhala"
a12 = "Sum"
else
yield("/echo Unsupported Expansion")
end

--Zone IDs
if expansion == "DT" then
z1 = 1187 --Urqopacha
z2 = 1188 --Kozama'uka
z3 = 1189 --Yak T'el
z4 = 1190 --Shaaloani
z5 = 1191 --Heritage Found
z6 = 1192 --Living Memory
elseif expansion == "EW" then
z1 = 956 --Labyrinthos
z2 = 957 --Thavnair
z3 = 958 --Garlemald
z4 = 959 --Mare Lamentorum
z5 = 961 --Elpis
z6 = 960 --Ultima Thule
elseif expansion == "ShB" then
z1 = 813 --Lakeland
z2 = 814 --Kholusia
z3 = 815 --Ahn Araeng
z4 = 816 --Il Mheg
z5 = 817 --The Rak'tika Greatwood
z6 = 818 --The Tempest
elseif expansion == "SB" then
z1 = 612 --The Fringes
z2 = 620 --The Peaks
z3 = 621 --The Lochs
z4 = 613 --The Ruby Sea
z5 = 614 --Yanxia
z6 = 622 --The Azim Steppe
end

mob1 = false
mob2 = false
canSkip = false
canRun = false

-- Setup --
function checkDeps()
deps = 0
if HasPlugin("TeleporterPlugin") then deps = deps + 1 end
if HasPlugin("visland") then deps = deps + 1 end
if HasPlugin("vnavmesh") then deps = deps + 1 end
if deps == 3 then canRun = true end
end

function startRoute(routeName, mobOne, mobTwo)
    yield("/visland exectemponce " .. routeName)
    yield("/visland resume")
    yield("/wait 0.2")
    while IsVislandRouteRunning() do
		if DoesObjectExist(mobOne) then mob1 = true end
		if DoesObjectExist(mobTwo) then mob2 = true end
		if mob1 and mob2  then canSkip = true end
		yield("/wait 0.2567")
		if canSkip then
			yield("/visland stop")
			yield("/vnav stop")
		end
    end
end

function tele(destination, zoneID)
	previousZone = GetZoneID()
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
	if canSkip and IsInZone(zoneID) then
		mob1 = false
		mob2 = false
		canSkip = false
	end
	if previousZone ~= GetZoneID() then
		mob1 = false
		mob2 = false
	end
end

function changeInstance(destination, zoneID)
    yield("/wait 1.0003")
    yield("/target Aetheryte")
    yield("/wait 1.0014")
    while HasTarget() == false do
        if IsInZone(zoneID) then
            yield("/tp " .. destination)
            yield("/wait 7.0007")
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
        if not IsMoving() then
            if GetTargetName() == "Aetheryte" then
                yield("/target Aetheryte")
                yield("/lockon")
            end
            yield("/automove")
        end
    end
    yield("/gaction dismount")
    if not GetCharacterCondition(45) then
        yield("/wait 1.005")
        yield("/li " .. destination)
        yield("/wait 1.0017")
    end
    if not GetCharacterCondition(45) and IsPlayerAvailable() then
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
checkDeps()
if canRun then
	if expansion == "DT" then
		-- Zone 1 --
		for i=1,maxInstances,1 do
			tele("Wachunpelo", z1)
			changeInstance(i, z1)
			startRoute(wachu1, a1, a2)
		end
		-- Zone 2 --
		for i=1,maxInstances,1 do
			tele("Earthenshire", z2)
			changeInstance(i, z2)
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
			changeInstance(i, z3)
			startRoute(yak1, a5, a6)
			if not canSkip then
				tele("Iq", z3)
				startRoute(yak2, a5, a6)
			end
		end
		-- Zone 4 --
		for i=1,maxInstances,1 do
			tele("HHus", z4)
			changeInstance(i, z4)
			startRoute(shaa1, a7, a8)
			if not canSkip then
				tele("Mehw", z4)
				startRoute(shaa2, a7, a8)
			end
		end
		--Zone 5 --
		for i=1,maxInstances,1 do
			tele("Outsk", z5)
			changeInstance(i, z5)
			startRoute(hf1, a9, a10)
			if not canSkip then
				tele("Electrope", z5)
				startRoute(hf2, a9, a10)
			end
		end
		-- Zone 6 --
		for i=1,maxInstances,1 do
			tele("Mnemo", z6)
			changeInstance(i, z6)
			startRoute(lm1, a11, a12)
			if not canSkip then
				tele("Aero", z6)
				startRoute(lm2, a11, a12)
			end
		end
	elseif expansion == "EW" then
		-- Zone 1 --
		tele("Arche", z1)
		startRoute(lab1, a1, a2)
		if not canSkip then
			tele("Sharlayan Hamlet", z1)
			startRoute(lab2, a1, a2)
		end
		-- Zone 2 --
		tele("Yedli", z2)
		startRoute(thav, a3, a4)
		-- Zone 3 --
		tele("Camp Broken Glass", z3)
		startRoute(garl, a5, a6)
		-- Zone 4 --
		tele("Sinus Lac", z4)
		startRoute(moon, a7, a8)
		--Zone 5 --
		tele("Twelve", z5)
		startRoute(elp, a9, a10)
		-- Zone 6 --
		tele("Reah", z6)
		startRoute(space1, a11, a12)
		if not canSkip then
			tele("Abode", z6)
			startRoute(space2, a11, a12)
		end
		if not canSkip then
			tele("Abode", z6)
			startRoute(space3, a11, a12)
		end
	elseif expansion == "ShB" then
		-- Zone 1 --
		tele("jobb", z1)
		startRoute(lake, a1, a2)
		-- Zone 2 --
		tele("tomra", z2)
		startRoute(khol, a1, a2)
		-- Zone 3 --
		tele("Souq", z3)
		startRoute(ahn, a5, a6)
		-- Zone 4 --
		tele("lran", z4)
		startRoute(mheg, a7, a8)
		--Zone 5 --
		tele("slith", z5)
		startRoute(rak1, a9, a10)
		if not canSkip then
			tele("fanow", z5)
			startRoute(rak2, a9, a10)
		end
		-- Zone 6 --
		tele("ondo", z6)
		startRoute(temp, a11, a12)
	elseif expansion == "SB" then
		-- Zone 1 --
		tele("oriens", z1)
		startRoute(fringe1, a1, a2)
		startRoute(fringe2, a1, a2)		
		-- Zone 2 --
		tele("ghiri", z2)
		startRoute(peaks, a3, a4)
		-- Zone 3 --
		tele("porta", z3)
		startRoute(lochs, a5, a6)
		-- Zone 4 --
		tele("onok", z4)
		startRoute(ruby, a7, a8)
		--Zone 5 --
		tele("fierce", z5)
		startRoute(yanx, a9, a10)
		-- Zone 6 --
		tele("dhoro", z6)
		startRoute(azim, a11, a12)
	end
	if gohome then
		yield("/tp " .. homeTP)
		if string.len(doorPath) >=1 then
			yield("/wait 7")
			while GetCharacterCondition(45) do yield("/wait 1.0015") end
			yield("/visland exectemponce " .. doorPath)
			yield("/wait 0.2501")
			while IsVislandRouteRunning() do yield("/wait 1") end
			yield("/target Entrance")
			yield("/interact")
		end
	end
else
	yield("/echo Dependencies not met, verify they are installed and enabled")
end

--[[

Dawntrail Hunt Scouter
v1.3
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
1.3 Added Endwalker support
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
expansion = "DT" --DT/EW Currently Supported


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
a3 = "Yilan"
a4 = "Sugriva"
a1 = "Storsie"
a2 = "Hulder"
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
a3 = "Maliktender"
a4 = "Sugaar"
a5 = "Li'l Murderer"
a6 = "Huracan"
a7 = "The Mudman"
a8 = "O Poorest Pauldia"
a9 = "Supay"
a10 = "Grassman"
a11 = "Rusalka"
a12 = "Baal"
elseif expansion == "SB" then
a1 = "Orcus"
a2 = "Erle"
a3 = "Vochstein"
a4 = "Aqrabuamelu"
a5 = "Funa Yurei"
a6 = "Oni Yumemi"
a7 = "Gajasura"
a8 = "Angada"
a9 = "Girimekhala"
a10 = "Sum"
a11 = "Mahisha"
a12 = "Luminare"
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
	z1 = 0
	z2 = 0
	z3 = 0
	z4 = 0
	z5 = 0
	z6 = 0
elseif expansion == "SB" then
	z1 = 0
	z2 = 0
	z3 = 0
	z4 = 0
	z5 = 0
	z6 = 0
end

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
	startRoute(lab1, a3, a4)
	if not canSkip then
	tele("Sharlayan Hamlet", z2)
	startRoute(lab2, a3, a4)
	end
	-- Zone 2 --
	tele("Yedli", z2)
	startRoute(thav, a1, a2)
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

elseif expansion == "SB" then

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

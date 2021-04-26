pico-8 cartridge // http://www.pico-8.com
version 32
__lua__
#include main.lua
#include util.lua
#include dialogue.lua
#include input.lua
#include starfield.lua
#include gamestate.lua
#include object.lua
#include objects.lua
#include player.lua

standalone=true
__gfx__
0000000000000000000560000000000000000000000000000000000000000000000000000000000a0088880000888800000009999990000000000ccdccc00000
0000000000056000006566000000000000000000000000000000eeeeeeee000000000000007006600888898008aa8a800009999449999000000cccccdcccc000
0070070000057000060660600000000000000000000000000eee77777777eee00000000070067660888899888a99a888004999994499990000dcccccddcccc00
000770000006700000067000000000000000000000000000e77700000000777e0000000006066600888988888a9988880944999a994499900cccccccccdcccc0
0007700000067000006676000000000000000000000000ee7000000000000007ee0000000076660089988988899a888a0994499a999944900cccccccccccccc0
007007000066660000677600000000000000000000000e070000cccccccc000070e000000066005089889888a88888a8999a4499aaa99499ccccccdccccccccc
00000000086666800606606000000000000000000000e07000cc07777770cc00070e0000070060000889888008888a80999a949999a99449cccccccdcccccccc
00000000080000800800008000000000000000000000e7000c077000000770c0007e0000800005000088880000888800499a9444999aa949cdcccccddcccccdc
0000000000000000000000000000000000000000000e7000c7700aaaaaa0077c0007e0000000000c0005600000666600949a999449999999ccdccccccdcccccd
000000000000000000000000000000000000000000e7000c700aa999999aa007c0007e00005006606005500550066660949aa99944499999ccddcccccccccccc
000000000000000000000000000000000000000000e700c070a9999999999a070c007e0050066660000000050050669699499a9999444999ccccdccccccccccc
000000000000000000000000000000000000000000e700c70a999988889999a07c007e00060667005600060005005666099449a9999944900cccccccccdcccc0
00000000000000000000000000000000000000000e700c070a998888888899a070c007e00066660055005000000056660999949aaaaa94900ccccccccccdccc0
00000000000000000000000000000000000000000e700c70a99988888888999a07c007e0006700700000000050055566009999449999940000ccccdccccddc00
00000000000000000000000000000000000000000e700c70a9988898a888899a07c007e00700600000000560055555600009999949999000000ccccdccccc000
00000000000000000000000000000000000000000e700c70a99888888898899a07c007e0e00007006000055000555500000009994490000000000ccddcc00000
00ec0ec0000000000000000000000000000000000e700c70a99888a88888899a07c007e05560000000777c0000000000008880000000000000eeee0000000000
00eceec0000000000000000000000000000000000e700c70a998888888a8899a07c007e056600000077ccc300000000008828800000000000eeeeed000222e00
0eeeeee0000000000000000000000000000000000e700c70a99988888888999a07c007e05550000033cccccc0ee00ee00888288000000000eeeeeeed022222e0
0ee7ff70000000000000000000000000000000000e700c070a998888988899a070c007e0000000003333cc33eeeee8ee0088828800000000edddeeee02eee220
0efffff00000000000000000000000000000000000e700c70a999988889999a07c007e000000000033c33cc3ee8eee8e0088888800000000deeedeee0e222e20
e0ccdc000000000000000000000000000000000000e700c070a9999999999a070c007e0000000000cccc3ccc0ee8eee00882888000000000eededeee022e2e20
0ccdddc00000000000000000000000000000000000e7000c700aa999999aa007c0007e00000000000ccccc7000ee8e0008882800000000000eddeee0002ee200
00e00e0000000000000000000000000000000000000e7000c7700aaaaaa0077c0007e0000000000000c77700000ee000008880000000000000eeee0000000000
00000000000000000000000000000000000000000000e7000c077000000770c0007e000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000e07000cc07777770cc00070e000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000e070000cccccccc000070e0000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000ee7000000000000007ee00000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000e77700000000777e0000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000eee77777777eee00000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000eeeeeeee00000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66666666dddddddd66b68366ddcbbbdd000000066000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66666666d55555556c6c6bc6dcbbcbb5000000666600000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66777766d5555555886b66c8dccbccb5000006677660000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66776666d5555555d5555555dcccbcb5000066766766000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66766666d5555555dd2222d5d5ccbb55000667766776600000000000000000000000000000000000000000000000000000000000000000000000000000000000
66766766d5555555dd2222d5d6666665006676666667660000000000000000000000000000000000000000000000000000000000000000000000000000000000
66666666d5555555d5222255d6959565066776766767766000000000000000000000000000000000000000000000000000000000000000000000000000000000
66666666d5555555d5dddd55d65e5e65667666666666676600000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000667666666666676600000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000066776766767766000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000006676666667660000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000667766776600000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000066766766000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000006677660000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000666600000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000066000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000092000000000000000000000000000000000092000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000c0d000000000000000000000000000000000000000c20000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000c1d100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000b200000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000a1a10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000a100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000a10000000000000000a1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000a1a1a100a1a1a1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000a1000000000000a1a10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a1a10000000000000000a1a100000000000000000000000000920000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00a1a100000000a1000000a1a10000000000000000000000f2000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000a1a100000000b1000000a1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000a1a10000000000000000a1000000000000000000000000e200000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000a1a1000000000000a1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000a1a100000000a100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000a100a1a1a10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000a1a10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000444500000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000044414145000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004441414141450000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000444141414241414500000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000404141414141414000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000404141414141414000000000
0000000000000000000000000000000000000000000029000000000000000000000000000000050607080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000404143414141414000000000
00000000000000090000000000000000000000000000000e0f00000000000000000000000000151617180000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000404141414141414000000000
00000000000000000000000000000000000000000000001e1f00000000000000000000000000252627280000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000404141414141414000000000
0000000000000000000000000000000000000000000000290000000000000000000000000000353637380000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000044404141414141414045000000
0000000000000000000000000000000000000000000000000000000000290000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004440414141414141414140450000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000444040414141414141414140404500
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000044405540414140404040414140544045
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000054550040414140000040414140005455
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040414140000040414140000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040404040000040404040000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000002900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000a000000000000000000000000000000000000002a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000001900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

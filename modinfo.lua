name = "MicroUzi"
version = "1.0.0.2"
description = [[
乌兹微型冲锋枪(MicroUzi) 1.0

※MOD制作初心者
※大量API修改, 兼容性注意
※依赖GunUtils API, 请务必开启

射速极高的乌兹微型冲锋枪
·保险/半自动/全自动三种模式
·可使用弹匣将子弹补满
·两种不同容量的弹匣: 标准(25发)或扩容(35发)
·可配置单发子弹伤害
]]
author = "donmor"
forumthread = ""
api_version = 10
dst_compatible = true
dont_starve_compatible = false
reign_of_giants_compatible = false
all_clients_require_mod = true 
icon_atlas = "modicon.xml"
icon = "modicon.tex"
server_filter_tags = {
	"item",
}
configuration_options =
{
	{
		name = "damage",
		label = "单发伤害",
		options =
		{
			{description = "4", data = 4},
			{description = "10", data = 10},
			{description = "16", data = 16},
			{description = "22", data = 22},
			{description = "28", data = 28},
			{description = "34", data = 34},
		},
		default = 10,
	},
	
	{
		name = "debug",
		label = "测试模式",
		options =
		{
			{description = "开启", data = true},
			{description = "关闭", data = false},
		},
		default = false,
	},
}

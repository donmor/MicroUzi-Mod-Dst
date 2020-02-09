name = "MicroUzi"
version = "2.0.0.1"
description = [[
乌兹微型冲锋枪(MicroUzi) 2.0

※MOD制作初心者
※大量API修改, 兼容性注意
※依赖GunUtils API, 请务必开启

射速极高的乌兹微型冲锋枪
·保险/半自动/全自动三种模式
·可使用弹匣将子弹补满
·两种不同容量的弹匣: 标准(25发)或扩容(35发)
·使用9mm子弹填充弹匣
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

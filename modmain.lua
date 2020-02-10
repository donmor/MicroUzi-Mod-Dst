
local RECIPETABS = GLOBAL.RECIPETABS
local TECH = GLOBAL.TECH
local STRINGS = GLOBAL.STRINGS
local TUNING = GLOBAL.TUNING

if not TUNING.MGUNAMMOTYPES then
	TUNING.MGUNAMMOTYPES = {}
end
if not TUNING.MGUNBULLETTYPES then
	TUNING.MGUNBULLETTYPES = {}
end
TUNING.MGUNAMMOTYPES.UZI = "uzi"
TUNING.MGUNBULLETTYPES.NATO_9MM = "nato_9mm"
TUNING.UZI_AUTOINTERVALMULT = 0.6
TUNING.UZI_SEMIINTERVALMULT = 6
TUNING.NATO_9MM_DAMAGE = 20
TUNING.UZI_DEBUG = GetModConfigData("debug")
TUNING.UZI_AMMO = 25
TUNING.UZI_AMMO2 = 35

PrefabFiles = {
	"uzi",
	"uzi_ammo",
	"uzi_ammo2",
	"bullet_nato_9mm",
	"bullet_nato_9mm_item",
}

AddRecipe("uzi",
{Ingredient("goldnugget", 5), Ingredient("gears", 3), Ingredient("transistor", 1)}, 
RECIPETABS.WAR, TECH.SCIENCE_TWO,
nil, nil, nil, nil, nil,
"images/inventoryimages/uzi.xml", "uzi.tex")

AddRecipe("uzi_ammo",
{Ingredient("goldnugget", 1)}, 
RECIPETABS.WAR, TECH.SCIENCE_TWO,
nil, nil, nil, nil, nil,
"images/inventoryimages/uzi_ammo.xml", "uzi_ammo.tex")

AddRecipe("uzi_ammo2",
{Ingredient("goldnugget", 2)}, 
RECIPETABS.WAR, TECH.SCIENCE_TWO,
nil, nil, nil, nil, nil,
"images/inventoryimages/uzi_ammo2.xml", "uzi_ammo2.tex")

AddRecipe("bullet_nato_9mm_item",
{Ingredient("goldnugget", 2), Ingredient("gunpowder", 6)}, 
RECIPETABS.WAR, TECH.SCIENCE_TWO,
nil, nil, nil, 20, nil,
"images/inventoryimages/bullet_nato_9mm_item.xml", "bullet_nato_9mm_item.tex")

STRINGS.NAMES.UZI = "乌兹微型冲锋枪"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.UZI = "高射速的自动武器。"
STRINGS.RECIPE_DESC.UZI = "尽情射击你的敌人"

STRINGS.NAMES.UZI_AMMO = "乌兹标准弹匣"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.UZI_AMMO = "自动武器的供弹装置。"
STRINGS.RECIPE_DESC.UZI_AMMO = "乌兹微型冲锋枪的弹匣, 弹容量25发"

STRINGS.NAMES.UZI_AMMO2 = "乌兹扩容弹匣"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.UZI_AMMO2 = "自动武器的供弹装置。"
STRINGS.RECIPE_DESC.UZI_AMMO2 = "乌兹微型冲锋枪的弹匣, 弹容量35发"

STRINGS.NAMES.BULLET_NATO_9MM_ITEM = "9mm子弹"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BULLET_NATO_9MM_ITEM = "小心不要掉到地上找不到了。"
STRINGS.RECIPE_DESC.BULLET_NATO_9MM_ITEM = "标准的9mm手枪弹"

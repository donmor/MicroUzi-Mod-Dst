
local RECIPETABS = GLOBAL.RECIPETABS
local TECH = GLOBAL.TECH
local STRINGS = GLOBAL.STRINGS
local TUNING = GLOBAL.TUNING

if not TUNING.MGUNAMMOTYPES then
	TUNING.MGUNAMMOTYPES = {}
end
TUNING.MGUNAMMOTYPES.UZI = "uzi"
TUNING.UZI_AUTOINTERVALMULT = 1
TUNING.UZI_SEMIINTERVALMULT = 6
TUNING.UZI_BULLET_DAMAGE = GetModConfigData("damage")
TUNING.UZI_DEBUG = GetModConfigData("debug")
TUNING.UZI_AMMO = 25
TUNING.UZI_AMMO2 = 35

PrefabFiles = {
	"uzi",
	"uzi_ammo",
	"uzi_ammo2",
	"uzi_bullet",
}

local uzi = AddRecipe("uzi",
{Ingredient("goldnugget", 5), Ingredient("gears", 3), Ingredient("transistor", 1)}, 
RECIPETABS.WAR, TECH.SCIENCE_TWO,
nil, nil, nil, nil, nil,
"images/inventoryimages/uzi.xml", "uzi.tex")

local uzi_ammo = AddRecipe("uzi_ammo",
{Ingredient("goldnugget", 3), Ingredient("gunpowder", 6)}, 
RECIPETABS.WAR, TECH.SCIENCE_TWO,
nil, nil, nil, nil, nil,
"images/inventoryimages/uzi_ammo.xml", "uzi_ammo.tex")

local uzi_ammo2 = AddRecipe("uzi_ammo2",
{Ingredient("goldnugget", 4), Ingredient("gunpowder", 9)}, 
RECIPETABS.WAR, TECH.SCIENCE_TWO,
nil, nil, nil, nil, nil,
"images/inventoryimages/uzi_ammo.xml", "uzi_ammo.tex")

STRINGS.NAMES.UZI = "乌兹微型冲锋枪"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.UZI = "高射速的自动武器"
STRINGS.RECIPE_DESC.UZI = "尽情射击你的敌人"

STRINGS.NAMES.UZI_AMMO = "乌兹标准弹匣"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.UZI_AMMO = "乌兹微型冲锋枪的弹匣, 弹容量25发"
STRINGS.RECIPE_DESC.UZI_AMMO = "为乌兹微型冲锋枪补充弹药"

STRINGS.NAMES.UZI_AMMO2 = "乌兹扩容弹匣"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.UZI_AMMO2 = "乌兹微型冲锋枪的弹匣, 弹容量35发"
STRINGS.RECIPE_DESC.UZI_AMMO2 = "为乌兹微型冲锋枪补充更多弹药"

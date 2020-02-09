local assets =
{
	Asset( "IMAGE", "images/utils/reload.tex" ),
	Asset( "ATLAS", "images/utils/reload.xml" ),
	Asset( "IMAGE", "images/utils/selector-0.tex" ),
	Asset( "ATLAS", "images/utils/selector-0.xml" ),
	Asset( "IMAGE", "images/utils/selector-1.tex" ),
	Asset( "ATLAS", "images/utils/selector-1.xml" ),
	Asset( "IMAGE", "images/utils/selector-3.tex" ),
	Asset( "ATLAS", "images/utils/selector-3.xml" ),
	
	Asset( "IMAGE", "images/inventoryimages/uzi.tex" ),
	Asset( "ATLAS", "images/inventoryimages/uzi.xml" ),
	Asset( "ANIM", "anim/uzi.zip" ),
	Asset( "SOUND", "sound/uzi.fsb" ),
	Asset( "SOUNDPACKAGE", "sound/uzi.fev" ),
}

local hudimage =
{
	reload = "reload",
	selector0 = "selector-0",
	selector1 = "selector-1",
	selector3 = "selector-3",
}

local hudatlas =
{
	reload = "images/utils/reload.xml",
	selector0 = "images/utils/selector-0.xml",
	selector1 = "images/utils/selector-1.xml",
	selector3 = "images/utils/selector-3.xml",
}

local function onequip(inst, owner)
	owner.AnimState:OverrideSymbol("swap_object", "uzi", "swap_hands")
	owner.AnimState:Show("ARM_carry")
	owner.AnimState:Hide("ARM_normal")
end

local function onunequip(inst, owner)
	owner.AnimState:Hide("ARM_carry")
	owner.AnimState:Show("ARM_normal")
end

local function debugcommand(inst, data)
	if data.cmd == "infinite" then
		inst.components.gunutils:SetInfinite(data.val)
	end
	if data.cmd == "burst" then
		inst.components.gunutils:SetBurst(data.val)
	end
	if data.cmd == "boltaction" then
		inst.components.gunutils:SetIsBoltAction(data.val)
	end
	if data.cmd == "boltdelay" then
		inst.components.gunutils:SetBoltActionDelay(data.val)
	end
	if data.cmd == "shotgun" then
		inst.components.gunutils:SetIsShotgun(data.val)
	end
	
	if data.cmd == "autointvalmult" then
		inst.components.gunutils:SetAutoIntervalMult(data.val)
	end
	
	if data.cmd == "semiintvalmult" then
		inst.components.gunutils:SetSemiIntervalMult(data.val)
	end
end

local function onreloading(inst, slot)
	if slot then
		inst.SoundEmitter:PlaySound("uzi/main/reload")
	else
		inst.SoundEmitter:PlaySound("uzi/main/selector")
	end
end

local function onfire(inst)
	inst.SoundEmitter:PlaySound("uzi/main/fire")
end

local function onselector(inst)
	inst.SoundEmitter:PlaySound("uzi/main/selector")
end

local function fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddNetwork()
	inst.entity:AddSoundEmitter()

	MakeInventoryPhysics(inst)
	
	inst.AnimState:SetBank("uzi")
	inst.AnimState:SetBuild("uzi")
	inst.AnimState:PlayAnimation("idle")
	
	inst:AddTag("sharp")
	inst:AddTag("waterproofer")
	inst:AddTag("fixeddamage")
	inst:AddTag("rangedweapon")
	inst:AddTag("uzi")
	
	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end

	inst:AddComponent("inspectable")

	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = "uzi"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/uzi.xml"
		
	inst:AddComponent("equippable")
	inst.components.equippable:SetOnEquip(onequip)
	inst.components.equippable:SetOnUnequip(onunequip)
		
	inst:AddComponent("weapon")
	inst.components.weapon.projalign = 1.2
	inst.projectiledelay = FRAMES
	inst.mgunintervalmult = 1
	
	inst:AddComponent("gunutils")
	inst.components.gunutils:SetCanAuto(true)
	inst.components.gunutils:SetCanSingle(true)
	inst.components.gunutils:SetHudImage(hudatlas, hudimage)
	inst.components.gunutils:SetAmmoType(TUNING.MGUNAMMOTYPES.UZI)
	inst.components.gunutils:SetGunBullets(TUNING.MGUNBULLETTYPES.NATO_9MM)
	inst.components.gunutils:SetRange(10)
	inst.components.gunutils:SetAutoIntervalMult(TUNING.UZI_AUTOINTERVALMULT)
	inst.components.gunutils:SetSemiIntervalMult(TUNING.UZI_SEMIINTERVALMULT)
	inst.components.gunutils:SetReloadingFn(onreloading)
	inst.components.gunutils:SetOnFireFn(onfire)
	inst.components.gunutils:SetOnSelectorFn(onselector)
	inst.components.gunutils:SetOffsetFn(function(count)
		local owner = inst.components.inventoryitem:GetGrandOwner()
		local mental = owner ~= nil and owner.components.sanity and owner.components.sanity:GetPercent()
		return 8 * (1 - math.pow(0.5, count * 0.8)) + 4 * (1 - mental)
	end)	
	if TUNING.UZI_DEBUG then
		inst:ListenForEvent("debugcommand", debugcommand)
	end
	
	return inst
end

return Prefab("uzi", fn, assets)

local assets =
{
	Asset( "IMAGE", "images/inventoryimages/uzi_ammo.tex" ),
	Asset( "ATLAS", "images/inventoryimages/uzi_ammo.xml" ),
	Asset( "ANIM", "anim/uzi_ammo.zip" ),
}

local function onrefilled(inst, bullet)
	inst.SoundEmitter:PlaySound("uzi/main/selector")
end

local function fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddNetwork()

	MakeInventoryPhysics(inst)
	
	inst.AnimState:SetBank("uzi_ammo")
	inst.AnimState:SetBuild("uzi_ammo")
	inst.AnimState:PlayAnimation("idle")
	
	inst:AddTag("waterproofer")

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end

	inst:AddComponent("inspectable")

	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = "uzi_ammo"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/uzi_ammo.xml"
	
	inst:AddComponent("gunammo")
	inst.components.gunammo:SetMaxValue(TUNING.UZI_AMMO)
	inst.components.gunammo:SetValue(0)
	inst.components.gunammo:SetType(TUNING.MGUNAMMOTYPES.UZI)
	inst.components.gunammo:SetBullet("bullet_nato_9mm")
	inst.components.gunammo:SetDamage(TUNING.NATO_9MM_DAMAGE)
	inst.components.gunammo:SetRecyclable(true)
	inst.components.gunammo:SetDecomposable(true)
	inst.components.gunammo:SetOnRefilledFn(onrefilled)
	inst.components.gunammo:SetGunBullets("bullet_nato_9mm_item")
			
	return inst
end

return Prefab("uzi_ammo", fn, assets)

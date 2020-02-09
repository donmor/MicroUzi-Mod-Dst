local assets =
{
	Asset( "IMAGE", "images/inventoryimages/uzi_ammo2.tex" ),
	Asset( "ATLAS", "images/inventoryimages/uzi_ammo2.xml" ),
	Asset( "ANIM", "anim/uzi_ammo2.zip" ),
}

local function fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddNetwork()

	MakeInventoryPhysics(inst)
	
	inst.AnimState:SetBank("uzi_ammo2")
	inst.AnimState:SetBuild("uzi_ammo2")
	inst.AnimState:PlayAnimation("idle")
	
	inst:AddTag("waterproofer")

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end

	inst:AddComponent("inspectable")

	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = "uzi_ammo2"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/uzi_ammo2.xml"
	
	inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_LARGEITEM
	
	inst:AddComponent("gunammo")
	inst.components.gunammo:SetMaxValue(TUNING.UZI_AMMO2)
	inst.components.gunammo:SetValue(TUNING.UZI_AMMO2)
	inst.components.gunammo:SetType(TUNING.MGUNAMMOTYPES.UZI)
	inst.components.gunammo:SetBullet("uzi_bullet")
	inst.components.gunammo:SetDamage(TUNING.UZI_BULLET_DAMAGE)
				
	return inst
end

return Prefab("uzi_ammo2", fn, assets)

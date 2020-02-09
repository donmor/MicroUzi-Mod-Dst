local assets =
{
	Asset( "IMAGE", "images/inventoryimages/bullet_nato_9mm_item.tex" ),
	Asset( "ATLAS", "images/inventoryimages/bullet_nato_9mm_item.xml" ),
}

local function fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddNetwork()

	MakeInventoryPhysics(inst)
	
	inst:AddTag("nato_9mm_ammo")
	
	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end

	inst:AddComponent("inspectable")

	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = "bullet_nato_9mm_item"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/bullet_nato_9mm_item.xml"
	inst.components.inventoryitem:SetOnDroppedFn(function(inst)
		inst:Remove(inst)
	end)
	
	inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

	inst:AddComponent("gunbullets")
	inst.components.gunbullets:SetBulletType(TUNING.MGUNBULLETTYPES.NATO_9MM)
	inst.components.gunbullets:SetBullet("bullet_nato_9mm")
	inst.components.gunbullets:SetDamage(TUNING.NATO_9MM_DAMAGE)
	
	return inst
end

return Prefab("bullet_nato_9mm_item", fn, assets)
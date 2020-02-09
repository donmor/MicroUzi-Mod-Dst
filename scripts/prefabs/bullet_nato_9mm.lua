local assets =
{
	Asset( "ANIM", "anim/bullet_common.zip" ),
}

local function OnThrown(inst, owner, target)
	inst.AnimState:PlayAnimation("fire")
	inst.AnimState:PushAnimation("spin_loop", true)
	inst.AnimState:SetOrientation(ANIM_ORIENTATION.OnGround)
	inst.wx, inst.wy, inst.wz = inst.Transform:GetWorldPosition()
end

local function OnHit(inst, owner, target)
	inst:Remove()
end

local function OnMiss(inst, owner, target)
	inst:Remove()
end

local function fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddNetwork()
	
	MakeInventoryPhysics(inst)
	RemovePhysicsColliders(inst)
	
	inst.AnimState:SetBank("bullet_common")
	inst.AnimState:SetBuild("bullet_common")
	inst.AnimState:PlayAnimation("idle")
	
	inst:AddTag("sharp")
	inst:AddTag("pointy")
	inst:AddTag("bullet_nato_9mm")
	inst:AddTag("projectile")

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end

	inst:AddComponent("weapon")
	inst.components.weapon:SetDamage(TUNING.NATO_9MM_DAMAGE)
	inst.components.weapon:SetRange(4, 7)
	
	inst:AddComponent("projectile")
	inst.components.projectile:SetSpeed(40)
	inst.components.projectile:SetHitDist(3)
	inst.components.projectile:SetOnThrownFn(OnThrown)
	inst.components.projectile:SetOnHitFn(OnHit)
	inst.components.projectile:SetOnMissFn(OnMiss)
	inst.components.projectile:SetHoming(false)
	
	inst.vt = 0
	inst:DoPeriodicTask(FRAMES, function()
		if inst.wx and inst.wy and inst.wz then
			local vx, vy, vz = inst.Transform:GetWorldPosition()
			if math.abs(vx - inst.wx) > 100 or math.abs(vy - inst.wy) > 100 or math.abs(vz - inst.wz) > 100 then
				inst:Remove()
			end
		end
		if not inst:HasTag("time_stopped")then
			inst.vt = inst.vt + FRAMES
			if inst.vt > 5 then
				inst:Remove()
			end
		end
	end)
	
	return inst
end



return Prefab("bullet_nato_9mm", fn, assets)

local PathfindingService = game:GetService("PathfindingService")
local Players = game:GetService("Players")
local character = script.Parent
local humanoid = character:FindFirstChild("Humanoid")
local rootPart = character:FindFirstChild("HumanoidRootPart")
local aitestblock = workspace:WaitForChild("aitestblock")       --change "aitestblock" and alter to it whatever you named the part

local function getClosestPlayer()     -- delete lines 8 to 23 if you would not like for the npc to run away
	local closestPlayer = nil
	local closestDistance = math.huge

	for _, player in ipairs(Players:GetPlayers()) do
		if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			local distance = (rootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
			if distance < closestDistance then
				closestDistance = distance
				closestPlayer = player
			end
		end
	end

	return closestPlayer
end

local function getRandomPointInBlock(block)
	local blockPosition = block.Position
	local blockSize = block.Size

	local minBoundX = blockPosition.X - (blockSize.X / 2)
	local maxBoundX = blockPosition.X + (blockSize.X / 2)
	local minBoundZ = blockPosition.Z - (blockSize.Z / 2)
	local maxBoundZ = blockPosition.Z + (blockSize.Z / 2)

	local randomX = math.random(minBoundX * 100, maxBoundX * 100) / 100
	local randomZ = math.random(minBoundZ * 100, maxBoundZ * 100) / 100
	local targetPosition = Vector3.new(randomX, blockPosition.Y, randomZ)

	return targetPosition
end

local function moveToRandomPoint()
	local player = getClosestPlayer()
	local targetPosition = getRandomPointInBlock(aitestblock)

	if player then
		local distanceToPlayer = (rootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude

		if distanceToPlayer <= 25 then
			local directionAwayFromPlayer = (rootPart.Position - player.Character.HumanoidRootPart.Position).Unit
			targetPosition = rootPart.Position + directionAwayFromPlayer * 30 

			local blockPosition = aitestblock.Position
			local blockSize = aitestblock.Size

			local minBoundX = blockPosition.X - (blockSize.X / 2)
			local maxBoundX = blockPosition.X + (blockSize.X / 2)
			local minBoundZ = blockPosition.Z - (blockSize.Z / 2)
			local maxBoundZ = blockPosition.Z + (blockSize.Z / 2)

			targetPosition = Vector3.new(
				math.clamp(targetPosition.X, minBoundX, maxBoundX),
				blockPosition.Y, 
				math.clamp(targetPosition.Z, minBoundZ, maxBoundZ)
			)
		end
	end

	local path = PathfindingService:CreatePath({
		AgentRadius = 2,
		AgentHeight = 5,
		AgentCanJump = true,
		AgentJumpHeight = 10,
		AgentMaxSlope = 45
	})

	path:ComputeAsync(rootPart.Position, targetPosition)

	print("Path Status: " .. tostring(path.Status))

	if path.Status ~= Enum.PathStatus.Success then
		warn("Path creation failed! status is not successful: " .. tostring(path.Status))
		return
	end

	for _, waypoint in pairs(path:GetWaypoints()) do
		humanoid:MoveTo(waypoint.Position)
		humanoid.MoveToFinished:Wait()
	end
end
while true do
	moveToRandomPoint()
	wait(math.random(1, 5))   -- edit times if you would like
end


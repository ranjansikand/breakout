-- powerups

PowerUp = Class{}


function PowerUp:init(skin)
	self.width = 16
	self.height = 16

	self.x = math.random(0, VIRTUAL_WIDTH - 16)
	self.y = - 20 -- So that it moves into the screen instead of popping up suddenly

	self.dx = 0
	self.dy = 35 -- rate of motion

	self.skin = skin
	self.activated = false

	if self.skin == 10 then
		self.isKey = true
	else 
		self.isKey = false
	end
end

function PowerUp:update(dt)
	if not activated then
		self.y = self.y + self.dy * dt -- want it to move quickly, can be updated later
	end
end

function PowerUp:collides(target)
	if self.x > target.x + target.width or target.x > self.x + self.width then
		return false
	elseif self.y > target.y + target.height or target.y > self.y + self.height then
		return false
	elseif not self.activated then
		self.activated = true
		return true
	end
end

function PowerUp:render()
    -- gTexture is our global texture for all blocks
    -- gBallFrames is a table of quads mapping to each individual ball skin in the texture
    if not self.activated then
	    love.graphics.draw(gTextures['main'], gFrames['powerups'][self.skin],
    	    self.x, self.y)
	end
end
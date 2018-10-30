debug = true
canShoot = true
canShootTimerMax = .2
canShootTimer = canShootTimerMax

bulletImg = nil
bullets = {}
function love.load(arg)
  player = {x = 200, y = 710, speed = 150, img = nil}
  player.img = love.graphics.newImage('assets/Aircraft_02.png')
  bulletImg = love.graphics.newImage('assets/bullet_orange0004.png')

end

function love.update(dt)
  if love.keyboard.isDown('escape') then
    love.event.pus('quit')
  end

  if (love.keyboard.isDown('left','a') and player.x > 0) then
    player.x = player.x-player.speed*dt
  elseif (love.keyboard.isDown('right', 'd') and player.x < (love.graphics.getWidth()-player.img:getWidth())) then
    player.x = player.x + player.speed*dt
  end

  canShootTimer = canShootTimer - 1*dt
  if canShootTimer < 0 then
    canShoot = true
  end
  if love.keyboard.isDown('space') and canShoot then
    newBullet = {x = player.x +(player.img:getWidth()/2), y = player.y, img = bulletImg}
    table.insert(bullets,newBullet)
    canShoot = false
    canShootTimer = canShootTimerMax
  end
  for i, bullet in ipairs(bullets) do
    bullet.y = bullet.y - (250*dt)
    if bullet.y < 0 then
      table.remove(bullets,i)
    end
  end

  x = 5
  --joel sucks

end

function love.draw(dt)
  love.graphics.draw(player.img, player.x, player.y)
  for i, bullet in ipairs(bullets) do
    love.graphics.draw(bullet.img, bullet.x, bullet.y)
  end

end

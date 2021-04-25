_starfield = {}

--------------------------------
-- initializes stars!
--------------------------------
function _starfield.init_stars(self)
 -- this will hold all stars!
 self.stars={}
 
 -- what "speed" we're at.
 self.warp=1
 -- direction
 self.star_dir = {x=0,y=1}
 -- speed factor
 self.star_spd = 1
 
 --  the borders the stars 
 -- can't exist outside of on
 -- the screen.
 self.starminx=0
 self.starminy=0
 self.starmaxx=127
 self.starmaxy=127
 
 --  palettes i use. metal is
 -- for "grays" and cool is for
 -- "blues".. good for warping
 -- stars!
 
 self.metal={13,6,7}
 self.cool={1,12,7}

 --  total stars allowed on the
 -- screen at one time. try
 -- more! or less!
 
 local totstars=128

 --  here, we count from 1 to
 -- whatever totstars is set
 -- to.. that's all our stars
 -- being put into that stars{}
 -- table!
 
 for i=1,totstars do

  --  pick random speed. this
  -- also determines star's
  -- color later!
  local rndspd=flr(rnd(3)+1)
  
  --  add it all to the table
  -- of stars including a
  -- random "x" and "y"..
  
  add(self.stars,{
   x=rnd(128),
   y=rnd(128),
   spd=rndspd
  })

 end
end

--------------------------------
-- function to update stars!
--------------------------------
function _starfield.update_stars(self)
   if self.star_spd >= 3 then
    self.warp = 2
   else
    self.warp=1
   end
  --  go through all entries in
  -- "stars"..
  for st in all(self.stars) do
   --  move the star by its
   -- speed..
   st.y += self.star_dir.y * self.star_spd * st.spd
   st.x += self.star_dir.x * self.star_spd * st.spd
   --  ..if it's more than our
   -- border, we reset it.
   if (st.y>=self.starmaxy) then
    st.y=self.starminy
    st.x=(flr(rnd(128)))
    st.spd=flr(rnd(3)+1)
   end
   if (st.y<self.starminy) then
    st.y=self.starmaxy
    st.x=(flr(rnd(128)))
    st.spd=flr(rnd(3)+1)
   end
   if (st.x>=self.starmaxx) then
    st.y=(flr(rnd(128)))
    st.x=self.starminx
    st.spd=flr(rnd(3)+1)
   end
   if (st.x<self.starminy) then
    st.y=(flr(rnd(128)))
    st.x=self.starmaxx
    st.spd=flr(rnd(3)+1)
   end
  end
 end
--------------------------------
-- function to draw stars!
--------------------------------
function _starfield.draw_stars(self)
 --  go though all the star
 -- entries..
 for st in all(self.stars) do
  --  if at normal speed, draw
  -- a normal star..
  if(self.warp==1)then
   pset(st.x, st.y, self.metal[st.spd])
  end
  --  if we're at warp speed,
  -- it's a bit more complex..
  if(self.warp==2)then
   --  if this current star's
   -- speed is 3..
   if(st.spd==3)then
    --  draw the star, including
    -- a long "tail"..
    line(st.x-self.star_dir.x*6, st.y-self.star_dir.y*6, st.x-self.star_dir.x*10, st.y-self.star_dir.y*10, self.cool[1])
    line(st.x-self.star_dir.x, st.y-self.star_dir.y, st.x-self.star_dir.x*5, st.y-self.star_dir.y*5, self.cool[2])
    pset(st.x, st.y, self.cool[3])
   end
   --  if this current star's
   -- speed is 2..
   if(st.spd==2)then
    --  draw the star, including
    -- a shorter "tail"..
    line(st.x-self.star_dir.x, st.y-self.star_dir.y, st.x-self.star_dir.x*2, st.y-self.star_dir.y*2, self.cool[1])
    pset(st.x, st.y, self.cool[2])
   end
   --  if this current star's
   -- speed is 1..
   if(st.spd==1)then
   -- ..just draw a lonely dark
   -- blue star!
    pset(st.x, st.y, self.cool[1])
   end
  end
 end
end
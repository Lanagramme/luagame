Entity = {}
function Entity:new(w,h,x,y)
  local obj = {
    x = x,
    y = y,
    w = w,
    h = h,
  }
  setmetatable(obj, self)
  self.__index = self
  return obj
end


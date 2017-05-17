function get_pointed_thing_side_hit(pointed_thing)
  local pos = minetest.get_pointed_thing_position(pointed_thing, false)
  local above_pos = minetest.get_pointed_thing_position(pointed_thing, true)

  if above_pos.y > pos.y then return 0 end -- 0 = up
  if above_pos.y < pos.y then return 1 end -- 1 = down
  if above_pos.x > pos.x then return 2 end -- 2 = east ?
  if above_pos.x < pos.x then return 3 end -- 3 = west ?
  if above_pos.z > pos.z then return 4 end -- 4 = north ?
  if above_pos.z < pos.z then return 5 end -- 5 = south ?
  return nil
end

function table_clone(table_source) -- deep copy
    if type(table_source) ~= "table" then return table_source end
    local meta = getmetatable(table_source)
    local clone = {}
    for key, value in pairs(table_source) do
        if type(value) == "table" then
            clone[key] = table_clone(value)
        else
            clone[key] = value
        end
    end
    setmetatable(clone, meta)
    return clone
end

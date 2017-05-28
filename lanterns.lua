
function register_lantern(name, dname, craft_item, tile_image)
  --[[
  minetest.register_craftitem(name, {
    description = dname,
    groups = {lantern = 1}
  })
  --]]

  local create_tiles = { tile_image, tile_image, tile_image .. "^lantern_overlay2.png"}

  minetest.register_craft({
    output = name,
    recipe = {
      {craft_item},
      {'default:torch'},
      {craft_item}
    },
  })

  minetest.register_node( name, {
    paramtype = "light",
    tiles = create_tiles,
    drawtype = "nodebox",
    sunlight_propagates = true,
    light_source = 13,
    groups = {oddly_breakable_by_hand = 2, cracky = 3},
    connects_to = {"group:fence", "group:wall", "group:wood", "group:tree", "group:stone"},

    node_box = {
      type = 'connected',
      fixed = {
        -- bottom
        {-0.15, -0.35, -0.15, 0.15, -0.29, 0.15},
        {-0.25, -0.29, -0.25, 0.25, 0.25, 0.25},
        -- top
        {-0.32, 0.25, -0.32, 0.32, 0.36, 0.32},
        {-0.19, 0.36, -0.19, 0.19, 0.41, 0.19},
      },
      connect_top = {{-0.12, 0.41, -0.12, 0.12, 0.5, 0.12}},
      connect_bottom = {{-0.12, -0.35, -0.12, 0.12, -0.5, 0.12}},
      connect_left = {{-0.5, -0.25, -0.20, -0.25, 0.25, 0.20}},
      connect_right = {{0.5, -0.25, -0.20, 0.25, 0.25, 0.20}},
      connect_front = {{-0.20, -0.25, -0.5, 0.20, 0.25, -0.25}},
      connect_back = {{0.20, -0.25, 0.5, -0.20, 0.25, 0.25}},
    },

  })
end

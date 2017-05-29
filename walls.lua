function wolff_register_wall(wall_name, wall_desc, wall_texture, wall_mat, wall_sound)
  minetest.register_node(wall_name .. '_post', {
		description = wall_desc .. ' Post',
		drawtype = "nodebox",
		node_box = {
			type = "connected",
			fixed = {{-1/4, -1/2, -1/4, 1/4, 1/2, 1/4}},
			connect_front = {{-3/16, -1/2, -1/2,  3/16, 3/8, -1/4}},
			connect_left = {{-1/2, -1/2, -3/16, -1/4, 3/8,  3/16}},
			connect_back = {{-3/16, -1/2,  1/4,  3/16, 3/8,  1/2}},
			connect_right = {{ 1/4, -1/2, -3/16,  1/2, 3/8,  3/16}},
		},
		connects_to = { "group:wall", "group:stone", "group:post"},
		paramtype = "light",
		is_ground_content = false,
		tiles = { wall_texture, },
		walkable = true,
		groups = { cracky = 3, post = 1 },
		sounds = wall_sounds,
	})

  minetest.register_node(wall_name .. '_wall', {
		description = wall_desc .. ' Wall',
		drawtype = "nodebox",
		node_box = {
			type = "fixed",
			fixed = {{-1/2, -1/2, -3/16, 1/2, 3/8, 3/16}},
		},
		paramtype = "light",
    paramtype2 = 'facedir',
		is_ground_content = false,
		tiles = { wall_texture, },
		walkable = true,
		groups = { cracky = 3, wall = 1 },
		sounds = wall_sounds,
    legacy_facedir_simple = true,
	})

	-- crafting recipe
	minetest.register_craft({
		output = wall_name .. '_post 3',
		recipe = {
			{ wall_mat},
			{ wall_mat},
			{ wall_mat},
		}
	})

  minetest.register_craft({
		output = wall_name .. "_wall 6",
		recipe = {
			{ '', '', '' },
			{ wall_mat, wall_mat, wall_mat},
			{ wall_mat, wall_mat, wall_mat},
		}
  })

end

local default_list = {
  {'brick',               "default_brick.png"},
  {"stone",               "default_stone.png"},
  {"stonebrick",          "default_stone_brick.png"},
  {"stone_block",         "default_stone_block.png"},
  {"cobble",              "default_cobble.png"},
  {"mossycobble",         "default_mossycobble.png"},
  {"desert_cobble",       "default_desert_cobble.png"},
  {"desert_stone",        "default_desert_stone.png"},
  {"desert_stonebrick",   "default_desert_stone_brick.png"},
  {"desert_stone_block",  "default_desert_stone_block.png"},
  {"sandstone",           "default_sandstone.png"},
  {"sandstonebrick",      "default_sandstone_brick.png"},
  {"sandstone_block",     "default_sandstone_block.png"},
  {"obsidian",            "default_obsidian.png"},
  {"obsidianbrick",       "default_obsidian_brick.png"},
  {"obsidian_block",      "default_obsidian_block.png"}
}

for _, item in ipairs(default_list) do
  wolff_register_wall(
    'wolff_extras:' .. item[1],
    capitalize(item[1]),
    item[2],
    'default:' .. item[1],
     default.node_sound_stone_defaults()
  )
end

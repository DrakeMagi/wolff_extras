wolff_extras = {}

wolff_extras.modpath = minetest.get_modpath("wolff_extras")

dofile(wolff_extras.modpath .. "/util.lua")
dofile(wolff_extras.modpath .. "/chest.lua")
dofile(wolff_extras.modpath .. "/lanterns.lua")
dofile(wolff_extras.modpath .. "/walls.lua")

-- infinite dirt
minetest.register_craft({
  output = "default:dirt 4",
  recipe = {{'group:leaves', 'group:leaves', 'group:leaves'},
            {'group:leaves', 'group:tree', 'group:leaves'},
            {'group:leaves', 'group:leaves', 'group:leaves'},
          },
})

local slab_list = {
  {"stairs:slab_brick",               "default_brick.png"},
  {"stairs:slab_stone",               "default_stone.png"},
  {"stairs:slab_stonebrick",          "default_stone_brick.png"},
  {"stairs:slab_stone_block",         "default_stone_block.png"},
  {"stairs:slab_cobble",              "default_cobble.png"},
  {"stairs:slab_mossycobble",         "default_mossycobble.png"},
  {"stairs:slab_desert_cobble",       "default_desert_cobble.png"},
  {"stairs:slab_desert_stone",        "default_desert_stone.png"},
  {"stairs:slab_desert_stonebrick",   "default_desert_stone_brick.png"},
  {"stairs:slab_desert_stone_block",  "default_desert_stone_block.png"},
  {"stairs:slab_sandstone",           "default_sandstone.png"},
  {"stairs:slab_sandstonebrick",      "default_sandstone_brick.png"},
  {"stairs:slab_sandstone_block",     "default_sandstone_block.png"},
  {"stairs:slab_obsidian",            "default_obsidian.png"},
  {"stairs:slab_obsidianbrick",       "default_obsidian_brick.png"},
  {"stairs:slab_obsidian_block",      "default_obsidian_block.png"},
  {"stairs:slab_steelblock",          "default_steel_block.png"},
  {"stairs:slab_copperblock",         "default_copper_block.png"},
  {"stairs:slab_bronzeblock",         "default_bronze_block.png"},
  {"stairs:slab_goldblock",           "default_gold_block.png"},
}

for _, block in ipairs(slab_list) do
  local name = "wolff_extras:" .. string.sub(block[1], 13) .. "_lantern"
  local dname = "Lantern"

  register_lantern(name, dname, block[1], block[2])
end

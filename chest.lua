local chest_formspec =
	"size[8,9]" ..
	default.gui_bg ..
	default.gui_bg_img ..
	default.gui_slots ..
	"list[current_name;main;0,0.3;8,4;]" ..
	"list[current_player;main;0,4.85;8,1;]" ..
	"list[current_player;main;0,6.08;8,3;8]" ..
	"listring[current_name;main]" ..
	"listring[current_player;main]" ..
	default.get_hotbar_bg(0,4.85)

function register_chest(name, dname, chest_image)
	minetest.register_node(name, {
		description = dname,
		tiles = {chest_image .. "^chest_top.png", chest_image .. "^chest_top.png",
			chest_image .. "^chest_side.png", chest_image .. "^chest_side.png",
			chest_image .. "^chest_side.png", chest_image .. "^chest_front.png"},
		paramtype2 = "facedir",
		groups = {choppy = 2, oddly_breakable_by_hand = 2},
		legacy_facedir_simple = true,
		is_ground_content = false,
		sounds = default.node_sound_wood_defaults(),

		on_construct = function(pos)
			local meta = minetest.get_meta(pos)
			meta:set_string("formspec", chest_formspec)
			local inv = meta:get_inventory()
			inv:set_size("main", 8*4)
		end,
		can_dig = function(pos,player)
			local meta = minetest.get_meta(pos);
			local inv = meta:get_inventory()
			return inv:is_empty("main")
		end,
		on_metadata_inventory_move = function(pos, from_list, from_index,
				to_list, to_index, count, player)
			minetest.log("action", player:get_player_name() ..
				" moves stuff in chest at " .. minetest.pos_to_string(pos))
		end,
		on_metadata_inventory_put = function(pos, listname, index, stack, player)
			minetest.log("action", player:get_player_name() ..
				" moves " .. stack:get_name() ..
				" to chest at " .. minetest.pos_to_string(pos))
		end,
		on_metadata_inventory_take = function(pos, listname, index, stack, player)
			minetest.log("action", player:get_player_name() ..
				" takes " .. stack:get_name() ..
				" from chest at " .. minetest.pos_to_string(pos))
		end,
		on_blast = function(pos)
			local drops = {}
			default.get_inventory_drops(pos, "main", drops)
			drops[#drops+1] = name
			minetest.remove_node(pos)
			return drops
		end,
	})
end

register_chest("wolff_extras:oak_chest", "Oak Chest", "default_wood.png")
register_chest("wolff_extras:pine_chest", "Pine Chest", "default_pine_wood.png")
register_chest("wolff_extras:acacia_chest", "Acacia Chest", "default_acacia_wood.png")
register_chest("wolff_extras:aspen_chest", "Aspen Chest", "default_aspen_wood.png")

register_chest("wolff_extras:oak_log_chest", "Oak Log Chest", "default_tree.png")
register_chest("wolff_extras:pine_log_chest", "Pine Log Chest", "default_pine_tree.png")
register_chest("wolff_extras:acacia_log_chest", "Acacia Log Chest", "default_acacia_tree.png")
register_chest("wolff_extras:aspen_log_chest", "Aspen Log Chest", "default_aspen_tree.png")

-- Craft
function craft_chest(name, wood, count)
  if count == nil then count = 1 end
  local output_name = name
  if count > 1 then
    output_name = name.. " " .. count
  end

	minetest.register_craft({
    output = output_name,
		recipe = {
			{wood, wood, wood},
			{wood, '', wood},
			{wood, wood, wood},
		}
	})
end

craft_chest('wolff_extras:oak_chest', 'default:wood')
craft_chest('wolff_extras:pine_chest', 'default:pine_wood')
craft_chest('wolff_extras:acacia_chest', 'default:acacia_wood')
craft_chest('wolff_extras:aspen_chest', 'default:aspen_wood')

craft_chest('wolff_extras:oak_log_chest', 'default:tree', 4)
craft_chest('wolff_extras:pine_log_chest', 'default:pine_tree', 4)
craft_chest('wolff_extras:acacia_log_chest', 'default:acacia_tree', 4)
craft_chest('wolff_extras:aspen_log_chest', 'default:aspen_tree', 4)

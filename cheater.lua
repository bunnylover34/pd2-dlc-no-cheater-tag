--CHEATER
if RequiredScript == "lib/network/base/basenetworksession" then
	local o_check_send_outfit = BaseNetworkSession.check_send_outfit
	function BaseNetworkSession:check_send_outfit(peer)
		Global.IS_SENDING_OUTFIT = true
		o_check_send_outfit(self, peer)
		Global.IS_SENDING_OUTFIT = false
	end
 
elseif RequiredScript == "lib/managers/blackmarketmanager" then
	local o_equipped_primary = BlackMarketManager.equipped_primary
	function BlackMarketManager:equipped_primary()
		local amcar = {
			["weapon_id"] = "amcar",
			["equipped"] = true,
			["global_values"] = {},
			["factory_id"] = "wpn_fps_ass_amcar",
			["blueprint"] = {
				[1] = "wpn_fps_m4_uupg_b_medium_vanilla",
				[2] = "wpn_fps_m4_lower_reciever",
				[3] = "wpn_fps_amcar_uupg_body_upperreciever",
				[4] = "wpn_fps_amcar_uupg_fg_amcar",
				[5] = "wpn_fps_upg_m4_m_straight_vanilla",
				[6] = "wpn_fps_upg_m4_s_standard_vanilla",
				[7] = "wpn_fps_upg_m4_g_standard_vanilla",
				[8] = "wpn_fps_amcar_bolt_standard",
			}
		}
		return Global.IS_SENDING_OUTFIT and amcar or o_equipped_primary(self)
	end
 
	local o_equipped_secondary = BlackMarketManager.equipped_secondary
	function BlackMarketManager:equipped_secondary()
		local glock = {
			["weapon_id"] = "glock_17",
			["equipped"] = true,
			["global_values" ] = {},
			["factory_id"] = "wpn_fps_pis_g17",
			["blueprint"] = {
				[1] = "wpn_fps_pis_g17_body_standard",
				[2] = "wpn_fps_pis_g17_b_standard",
				[3] = "wpn_fps_pis_g17_m_standard",
			}
		}
		return Global.IS_SENDING_OUTFIT and glock or o_equipped_secondary(self)
	end
    
	local o_equipped_mask = BlackMarketManager.equipped_mask

function BlackMarketManager:equipped_mask()
    if Global.IS_SENDING_OUTFIT then
        local mask = deep_clone(o_equipped_mask(self))

        mask.mask_id = "dallas"

        mask.blueprint = {
            material = {
                id = "plastic",
                global_value = "normal"
            },
            pattern = {
                id = "no_color_no_material",
                global_value = "normal"
            },
            color_a = {
                id = "nothing",
                global_value = "normal"
            },
            color_b = {
                id = "nothing",
                global_value = "normal"
            },
            color_c = {
                id = "strip_paint",
                global_value = "normal"
            }
        }

        return mask
    end

    return o_equipped_mask(self)
end
end
--- STEAMODDED HEADER
--- MOD_NAME: Extended Joker Contexts
--- MOD_ID: ExtendedJokerContexts
--- MOD_AUTHOR: [ItsFlowwey]
--- MOD_DESCRIPTION: API that adds more joker contexts
--- PREFIX: EJCX

----------------------------------------------
------------MOD CODE -------------------------

--Updates SMODS.end_calculate_context to make sure that modded jokers are fine
local SMODSend_calculate_context_ref = SMODS.end_calculate_context
function SMODS.end_calculate_context(_c)
	local prev_contexts = SMODSend_calculate_context_ref(_c)
	if prev_contexts == true and not _c.joker_repetition and not _c.destroying_unscored_card and not _c.destroying_in_hand_card and not _c.drawn_card and not _c.debuffed_individual then
		return true
	end
	return false
end

--Helper functions used by the API. 
function table.contains(table, element)
	for _, value in pairs(table) do
		if value == element then
			return true
		end
	end
	return false
end

----------------------------------------------
------------MOD CODE END----------------------
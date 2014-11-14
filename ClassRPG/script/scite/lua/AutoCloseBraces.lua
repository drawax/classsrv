AutoCloseBraces = EventClass:new(Common)
--------------------------------------------------------------------------------
-- OnChar(charAdded)
--
-- AutoComplete Braces and Qoutes.
--
-- Parameters:
--	charAdded - The character typed.
--------------------------------------------------------------------------------

function inTable(tbl, item)
    for key, value in pairs(tbl) do
        if value == item then return true end
    end
    return false
end

function findpattern(text, pattern, start)
	local result = string.find(text, pattern, start)
	
	if result ~= nil then
		return string.sub(text, string.find(text, pattern, start))
	else
		return nil
	end
end

local toClose = { ['('] = ')', ['['] = ']', ['{'] = '}'}
local toCloseB = { [')'] = '(', [']'] = '[', ['}'] = '{'}

function AutoCloseBraces:OnChar(charAdded)
	--	trace(charAdded)

	if charAdded == '"' or charAdded == "'" then
		local pos = editor.CurrentPos
		local next = editor:textrange(pos, pos+1)

		if next ~= charAdded then
			editor:ReplaceSel(charAdded)
			editor:SetSel(pos, pos)
		else
			editor:remove(pos, pos)
		end
	end

	if toCloseB[charAdded] ~= nil then
		local pos = editor.CurrentPos
		local next = editor:textrange(pos, pos+1)

		if next == charAdded then
			editor:remove(pos, pos+1)
		end
	end

	if charAdded == "{" then
		local pos = editor.CurrentPos
		local line = editor:LineFromPosition(pos)
		local linec = editor:GetLine(line)

		if findpattern(linec, "^[%s\t]*[^%s\t]+[^\n][^\n]") ~= nil and
			(editor:textrange(pos-2, pos-1) == " " or editor:textrange(pos-2, pos-1) == ")")
		then
			local indent = findpattern(linec, "^[%s\t]*")

			local before = "\n" .. indent .. "{\n" .. indent .. "\t"
			local newpos = pos + (string.len(before) or 0) - 2

			editor:SetSel(pos-2, pos)
			editor:ReplaceSel(before .. "\n" .. indent .. "}")
			editor:SetSel(newpos, newpos)

			return false
		end
	end

	-- automatikus lezárás
	if toClose[charAdded] ~= nil then
		local pos = editor.CurrentPos
		local next = editor:textrange(pos, pos+1)

		if findpattern(next, "[%a%d_]") == nil then     --next ~= toClose[charAdded] and findpattern(next, "[a-zA-Z]") == nil then
			editor:ReplaceSel(toClose[charAdded])
			editor:SetSel(pos, pos)
		end
	end

	return false	-- Let next handler to process event
	--	return true	 -- Don't let next handler to process event
end

function AutoCloseBraces:OnKey(key, modifiers)
	if key == 8 then
		local pos = editor.CurrentPos
		local deleted = editor:textrange(pos-1, pos)
		local next = editor:textrange(pos, pos+1)

		if (toClose[deleted] ~= nil and next == toClose[deleted]) or ((deleted == '"' or deleted == "'") and deleted == next) then
			editor:remove(pos, pos+1)
		end
	end
end
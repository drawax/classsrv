-- MouseHover --> Calltips
-- When you hover your mouse over a function then the corresponding calltip
-- for that function will be displayed. Works on native functions and user
-- defined functions too. Com functions coming soon.
-- Credits: Valik (Hope to see you around sometime.  Yes.  I said it.  Deal.), MvGulik, ProgAndy, wraithdu, trancexx, AdmiralAlkex
-- and everyone else who posted at:
-- http://www.autoitscript.com/forum/topic/140881-mouse-hover-call-tips-update-10202012/

MouseHoverCallTips = EventClass:new(Common)

MouseHoverCallTips.CalltipTable = {}

MouseHoverCallTips.IncludesTable = {}

MouseHoverCallTips.OnUpdateUI_ran_once = false

-- Description:
-- Loads MouseHoverCallTips.IncludesTable with the includes from the local file.
-- Parameter
-- file_path - file path of the buffer when SciTE opens
function MouseHoverCallTips:OnOpen(file_path)
		if self:is_au3_file() then
				self:initialize_mouse_dwell()
				self:get_includes_list(file_path, 1)
		end

		return false
end

-- Description:
-- Calls initialize_mouse_dwell on file switch.
function MouseHoverCallTips:OnSwitchFile(_)
		if self:is_au3_file() then
				self:initialize_mouse_dwell()
		end

		return false
end

-- Description:
-- Loads MouseHoverCallTips.CalltipTable with the calltips from api files.
function MouseHoverCallTips:OnStartup()
		local directories = props["api.$(au3)"]

		for directory in directories:gmatch("([^;\r\n]+)") do
				local file = io.open(directory, 'r')

				if file then
						for line in file:lines() do
								if not string.find(line, "%?[1234]", -1) then
										table.insert(self.CalltipTable, line)
								end
						end

						file:close()
				end
		end

		return false
end

-- Description:
-- My attempt at mimicking OnStartup behavior.
function MouseHoverCallTips:OnUpdateUI()
		if self:is_au3_file() then
			self:initialize_mouse_dwell()
		end

		return false
end

-- Description:
-- Monitors for '>' and '"' to determine if there are any more includes to
-- add to the list of includes.
-- Parameters
-- char - the character which was typed.
function MouseHoverCallTips:OnChar(char)
		if char == "\"" or char == '\''then
			local line = editor:GetLine(editor:LineFromPosition(editor.CurrentPos))

			if string.find(line, "^%s*#include%s+[\<\"\'].+\.au3[\>\"\']%s*") then
				local include_name = self:get_include_from_line(line)
				table.insert(self.IncludesTable, include_name)
				self.IncludesTable = self:filter_duplicate_entries(self.IncludesTable)
			end
		end

		return false
end

-- Description:
-- Checks to see if a file is an au3.
-- Original Author:
-- MvGulik
function MouseHoverCallTips:is_au3_file()
		if string.lower(props["FileExt"]) == "au3" then
			return true
		end

		return true
end

-- Description:
-- Executes with OnUpdateUI. Sets SciTE's mousehover dwell time from a
-- value found in SciTEUserProperties or a default of 650 ms.
function MouseHoverCallTips:initialize_mouse_dwell()
		if self:is_au3_file() then
			local mousehover_calltips_dwelltime = tonumber(props["mousehover.calltips.dwelltime"])

			if not mousehover_calltips_dwelltime then
					mousehover_calltips_dwelltime = 650
			end

			scite.SendEditor(SCI_SETMOUSEDWELLTIME, mousehover_calltips_dwelltime)
		end
end

-- Description:
-- Populates a table with the included au3 files from the local file.
-- Parameters:
-- file_path   - table of paths to search for included files.
-- accumulator - just set this to 1, don't ask questions
function MouseHoverCallTips:get_includes_list(file_path, accumulator)
	-- If file_path only contains a filename then
	-- prepend a file path
	if not string.find(file_path, "^%a:\\") then
		file_path = props["FileDir"] .. '\\' .. file_path
	end

	local file = io.open(file_path)

	if file then
		local include_name = ''

		for line in file:lines() do
			if string.len(line) > 0 then
				include_name = self:get_include_from_line(line)

				if string.len(include_name) > 0 then
					table.insert(self.IncludesTable, include_name)
				end
			end
		end
	end

	if accumulator == #self.IncludesTable then
		file:close()
		self.IncludesTable = self:filter_duplicate_entries(self.IncludesTable)
	end

	return true
end

-- Description:
-- Sort and then filter out duplicate entries from a table.
-- Parameters:
-- my_table - table to filter
function MouseHoverCallTips:filter_duplicate_entries(my_table)
	table.sort(my_table)

	local length = #my_table

	for i = length , 1 , -1 do
		for j = length, (i + 1) , -1 do
			if my_table[i] == my_table[j] then
				table.remove(my_table, j)
			end
		end
	end

	return my_table
end

-- Description:
-- Get an include file name from the line.
-- Parameters:
-- line - line of text to search for the include
function MouseHoverCallTips:get_include_from_line(line)
	if not line then return '' end

	if string.find(line, "^%s*#include%s+") then
		-- Anything between <, >, ', or "
		local include = string.match(line, "[\<\"\']%s*.+\.au3%s*[\'\"\>]")
		if include == nil then return '' end
		return string.sub(include, 2, -2)
	end

	return ''
end

-- Description:
-- Executes when user hovers mouse over a recognized function style for
-- "mousehover.calltips.dwelltime" seconds.
-- Parameters:
-- position - The position in the file of the function.
-- word  - The name of the function.
function MouseHoverCallTips:OnDwellStart(position, word)
	local style = scite.SendEditor(SCI_GETSTYLEAT, position)

	local function_calltip = nil

	if style == 4 then -- native AutoIt functions
		function_calltip = self:get_native_function_calltip(word)
	elseif style == 15 then -- functions included with AutoIt or user defined functions
		function_calltip = self:get_native_function_calltip(word)

		-- if calltip not found then check local file for function definition
		if function_calltip == nil then
			function_calltip = self:search_include_files(word)
		end
	elseif style == 0 then -- functions which do not have calltips defined
		-- search through the current file for the function definition
		function_calltip = self:get_user_function_definition(props["FilePath"], word)

		-- if calltip not found then check extralocal file for function definition
		if function_calltip == nil then
			function_calltip = self:search_include_files(word)
		end
	else
		if scite.SendEditor(SCI_CALLTIPACTIVE) then
			scite.SendEditor(SCI_CALLTIPCANCEL)
		end
	end

	-- Description:
	-- Displays a calltip window with the provided text at position.
	-- Parameters:
	-- position  - The position in the file of the function.
	-- function_calltip - The name of the function.
	local display_calltip = function(position, function_calltip)
		if not function_calltip then return nil end
		scite.SendEditor(SCI_CALLTIPSHOW, position, function_calltip)
	end

	display_calltip(position, function_calltip)

	return false
end

-- Description:
-- Retrieves the calltip from a list stored in memory.
-- This is why it is important to set lua.ext.reset to zero.
-- Parameters:
-- word - The name of the desired function.
function MouseHoverCallTips:get_native_function_calltip(word)
	if word == '' then return nil end

	local function_calltip = nil

	for _ , calltip in ipairs(self.CalltipTable) do
		if string.find(calltip, '^' .. word) ~= nil then
			-- Split the description off onto it's own line.
			function_calltip = string.gsub(calltip, "%)%s*", "%)\n", 1)

			-- Split "( Requires: #include <" off onto it's own line.
			function_calltip = string.gsub(function_calltip, "%(%s*[Rr]equires", "\n(Requires")

			break
		end
	end

	return function_calltip
end

-- Description:
-- Search for the function definition that is local to the given file path.
-- Parameters:
-- filepath - The file path of the au3 file to search.
-- word  - The function name for which to search.
function MouseHoverCallTips:get_user_function_definition(file_path, word)
		if not file_path or not word then return nil end

		local func_reg_exp = "^%s*[fF]unc%s+"

		local funcdef_reg_exp = func_reg_exp .. string.lower(word) .. "%s*%("

		local get_function_definition_from_line = function(l_line, l_word)
				local name_start, name_end = string.find(string.lower(l_line), string.lower(l_word))

				l_word = string.sub(l_line, name_start, name_end)

				local function_calltip1 = string.gsub(l_line, func_reg_exp, '', 1)
				local function_calltip2 = string.gsub(function_calltip1, string.lower(l_word) .. "%s*%(", l_word .. '%(', 1)
				local function_calltip3 = string.gsub(function_calltip2, "%)(.)", '%)')
				local function_calltip4 = string.gsub(function_calltip3, "%s*;%s*", '\n')

				return function_calltip4
		end

		local function_definition = nil

		local file = io.open(file_path, 'r')

		if file ~= nil then
				for line in file:lines() do
						if string.len(line) > 0 then
								if string.find(string.lower(line), funcdef_reg_exp) then
										function_definition = get_function_definition_from_line(line, word)
										file:close()
										break
								end
						end
				end
		end

		return function_definition
end

-- Description:
-- Searches the list of includes for the function definition.
-- Parameters:
-- word - The name of the function.
function MouseHoverCallTips:search_include_files(word)
		local function_calltip = nil

		local current_dir = props["FileDir"] .. '\\'

		for _ , include_directory in ipairs(self.IncludesTable) do
				local slash = string.find(include_directory, '\\')

				if slash then
						local directory = string.sub(include_directory, 1, slash)

						local dir_loc = string.find(current_dir, directory)

						if dir_loc then
								include_directory = string.sub(current_dir, 1, dir_loc - 2) .. '\\' .. include_directory
						else
								include_directory = current_dir .. include_directory
						end
				else
						include_directory = current_dir .. include_directory
				end

				-- get the function definition from the include file
				function_calltip = self:get_user_function_definition(include_directory, word)

				if function_calltip ~= nil then break end
		end

		return function_calltip
end
local files = {
	"fpui_config.lua",
	"fpui/base.lua",
	"fpui/fpframe.lua",
	"fpui/fpbutton.lua",
	"fpui/fpscrollpanel.lua",
	"fpui/fpcheckbox.lua"
}

for _,f in pairs(files) do
	if (SERVER) then
		AddCSLuaFile(f)
	else
		include(f)
	end
end

-- Color(114, 137, 218)
-- Color(91, 69, 69)
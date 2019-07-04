local files = {
	"fpui_config.lua",
	"fpui/base.lua",
	"fpui/fpframe.lua",
	"fpui/fpbutton.lua"
}

for _,f in pairs(files) do
	if (SERVER) then
		AddCSLuaFile(f)
	else
		include(f)
	end
end
CANCELSHAPESHIFT_CONFIG_DEFAULT = { CancelOnAbility = false }

SHAPESHIFT_ERRORS = {
	[415] = 1, -- "Can't use items while shapeshifted."
	[416] = 1, -- "Can't speak while shapeshifted."
	[505] = 1, -- "You can't do that while shapeshifted."
}

ABILITY_FAILED_ERROR = 50

SLASH_CANCELSHAPESHIFT1 = "/cs"
SLASH_CANCELSHAPESHIFT2 = "/cancelshapeshift"
SlashCmdList["CANCELSHAPESHIFT"] = function(msg, editBox) CancelShapeshift_Command(msg, editBox) end

function CancelShapeshift_OnLoad(self, ...)
	self:RegisterEvent("ADDON_LOADED");
	self:RegisterEvent("UI_ERROR_MESSAGE");
end

function CancelShapeshift_OnEvent(self, event, ...)
	if(event == "ADDON_LOADED" and select(1,...) == "CancelShapeshift") then
		if(CANCELSHAPESHIFT_CONFIG == nil) then
			CANCELSHAPESHIFT_CONFIG = CANCELSHAPESHIFT_CONFIG_DEFAULT
		end
	elseif(event == "UI_ERROR_MESSAGE") then
		local errorType = select(1,...)
		if(SHAPESHIFT_ERRORS[errorType] ~= nil or (CANCELSHAPESHIFT_CONFIG.CancelOnAbility and errorType == ABILITY_FAILED_ERROR)) then
			UIErrorsFrame:Clear()
			CancelShapeshiftForm()
		end
	end
end

function CancelShapeshift_Command(msg, editBox)
	if(msg == "onability") then
		CANCELSHAPESHIFT_CONFIG.CancelOnAbility = not CANCELSHAPESHIFT_CONFIG.CancelOnAbility
		DEFAULT_CHAT_FRAME:AddMessage( "cancelshapeshift onability set to ["..tostring(CANCELSHAPESHIFT_CONFIG.CancelOnAbility).."]")
	else
		DEFAULT_CHAT_FRAME:AddMessage( "CancelShapeshift Options" )
		DEFAULT_CHAT_FRAME:AddMessage( "Use /cancelshapeshift or /cs" )
		DEFAULT_CHAT_FRAME:AddMessage( "/cancelshapeshift onability -- ["..tostring(CANCELSHAPESHIFT_CONFIG.CancelOnAbility).."] Cancels shapeshift when using another ability")
	end
end

function CancelShapeshift_OnLoad(self, ...)
	self:RegisterEvent("UI_ERROR_MESSAGE");
end

function CancelShapeshift_OnEvent(self, event, ...)
	if(event == "UI_ERROR_MESSAGE") then
		local message = select(2,...)
		if(string.find(message, "Can't speak while shapeshifted.")) then
			UIErrorsFrame:Clear()
			CancelShapeshiftForm()
		end
	end
end

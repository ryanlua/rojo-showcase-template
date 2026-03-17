--!nonstrict

--[[
	Prompts the given Player with the phone book to call someone.
	Creates a topbar icon to open the phone book when clicked.

	https://create.roblox.com/docs/reference/engine/classes/SocialService
	https://create.roblox.com/docs/resources/roblox-connect
]]

local Players = game:GetService("Players")
local SocialService = game:GetService("SocialService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")

local Icon = require(ReplicatedStorage.Packages.topbarplus)

local player = Players.LocalPlayer :: Player

local iconImage: string = script:GetAttribute("IconImage") :: string or "phone"
local iconCaption: string = script:GetAttribute("IconCaption") :: string or "Phone Book"

local isPhonebookOpen = false

-- Function to check whether the player can send a call invite
local function canSendCallingInvite(sendingPlayer)
	local success: boolean, canSend: boolean = pcall(function()
		return SocialService:CanSendCallInviteAsync(sendingPlayer)
	end)
	return success and canSend
end

local canCall: boolean = canSendCallingInvite(player)
if canCall then
	local icon = Icon.new()
	icon:modifyTheme({ "IconLabelContainer", "TargetWidth", 0 })
	icon:setLabel(iconImage)
	icon:setTextSize(24)
	icon:setTextFont(
		"rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json",
		Enum.FontWeight.Bold,
		Enum.FontStyle.Normal,
		"Selected"
	)
	icon:setTextFont(
		"rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json",
		Enum.FontWeight.Regular,
		Enum.FontStyle.Normal,
		"Deselected"
	)
	icon:setCaption(iconCaption)

	-- Prompt the phone book when the icon is selected
	icon.selected:Connect(function(): ()
		SocialService:PromptPhoneBook(player, "")
		icon:lock()
	end)

	-- Deselect the icon when the phone book prompt is closed
	SocialService.PhoneBookPromptClosed:Connect(function(): ()
		icon:deselect()
		icon:unlock()
	end)
end

SocialService.CallInviteStateChanged:Connect(function(_, inviteState)
	local isCalling = inviteState == Enum.InviteState.Placed

	if isCalling or isPhonebookOpen then
		StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
		Icon.setTopbarEnabled(false)
	else
		StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, true)
		Icon.setTopbarEnabled(true)
	end
end)

-- TableBuilderElementMixin defined TableBuilder.lua#9
-- Requires us to derive:
--   1. Init(...)
--   2. Populate(rowData, dataIndex)
TBTColumnHeaderMixin = CreateFromMixins(TableBuilderElementMixin)

function TBTColumnHeaderMixin:Init(name, tooltipText, sortIndex)
  self.tooltipText = tooltipText
  self.sortIndex = sortIndex

  self:SetText(name)

  self:SetWidth(250)
end

-- Implementing mouse events for sorting
function TBTColumnHeaderMixin:OnClick()
  if self.sortIndex then
    TableBuilderTutorial.SortData(self.sortIndex)
  end

  PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON)
end

-- Implementing mouse events for tooltip
function TBTColumnHeaderMixin:OnEnter()
  if self.tooltipText then
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip_AddColoredLine(GameTooltip, self.tooltipText, WHITE_FONT_COLOR, true)
    GameTooltip:Show()
  end
end

function TBTColumnHeaderMixin:OnLeave()
  GameTooltip:Hide()
end
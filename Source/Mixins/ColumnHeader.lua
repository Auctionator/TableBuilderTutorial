-- TableBuilderElementMixin defined TableBuilder.lua#9
-- Requires us to derive:
--   1. Init(...)
--   2. Populate(rowData, dataIndex)
TBTColumnHeaderMixin = CreateFromMixins(TableBuilderElementMixin)

function TBTColumnHeaderMixin:Init(...)
  print(
    LIGHTBLUE_FONT_COLOR:WrapTextInColorCode("ColumnHeader:Init()", ...)
  )

  -- self.sortType = sortType
  -- self.tooltipText = tooltipText

  -- self.text:SetText(headerText)
  self:SetText("Hello")

  local width = self:GetWidth()
  local textWidth = self:GetTextWidth() + 40 -- 40 for padding
  self:SetWidth(math.max(width, textWidth))

  -- local width = self.Text:GetStringWidth()
  -- local maxColumnWidth = 150
  -- self.Text:SetWidth(math.min(width, maxColumnWidth))

  -- local wrappedWidth = self.Text:GetWrappedWidth()
  -- self.Text:SetWidth(wrappedWidth)
  -- self:SetWidth(wrappedWidth)
end

-- Implementing mouse events for sorting
function TBTColumnHeaderMixin:OnClick()
  if self.sortType then
    -- TODO Want to implement a sort for our data provider...
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
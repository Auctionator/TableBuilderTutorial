-- TablBuilder.lua#19 defines TableBuilderCellMixin
-- Requires us to derive:
--   1. OnLineEnter
--   2. OnLineLeave
--   3. (from TableBuilderElementMixin) Init(...)
--   4. (from TableBuilderElementMixin) Populate(rowData, dataIndex)
TBTAnimalCellMixin = CreateFromMixins(TableBuilderCellMixin)

function TBTAnimalCellMixin:Populate(rowData, dataIndex)
  self.text:SetText(rowData[1])

  local width = self.text:GetStringWidth()
  local maxColumnWidth = 150
  self.text:SetWidth(math.min(width, maxColumnWidth))

  local wrappedWidth = self.text:GetWrappedWidth()
  self.text:SetWidth(wrappedWidth)
  self:SetWidth(wrappedWidth)
end

function TBTAnimalCellMixin:OnEnter()
end

function TBTAnimalCellMixin:OnLeave()
end
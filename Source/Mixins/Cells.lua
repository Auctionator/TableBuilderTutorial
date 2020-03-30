-- TablBuilder.lua#19 defines TableBuilderCellMixin
-- Requires us to derive:
--   1. OnLineEnter
--   2. OnLineLeave
--   3. (from TableBuilderElementMixin) Init(...)
--   4. (from TableBuilderElementMixin) Populate(rowData, dataIndex)
TBTTextCellMixin = CreateFromMixins(TableBuilderCellMixin)

function TBTTextCellMixin:Init(columnIndex)
  self.columnIndex = columnIndex

  self.text:SetJustifyH("LEFT")
end

function TBTTextCellMixin:Populate(rowData)
  self.text:SetText(rowData[self.columnIndex])
  self:SetWidth(250)
end

function TBTTextCellMixin:OnEnter()
end

function TBTTextCellMixin:OnLeave()
end

-- TBTAnimalCellMixin = CreateFromMixins(TBTTextCellMixin)

-- function TBTAnimalCellMixin:Init()
--   TBTTextCellMixin.Init(self, 1)
-- end

-- function TBTAnimalCellMixin:OnEnter()
-- end

-- function TBTAnimalCellMixin:OnLeave()
-- end

-- TBTScienceCellMixin = CreateFromMixins(TBTTextCellMixin)

-- function TBTScienceCellMixin:Init()
--   TBTTextCellMixin.Init(self, 2)
-- end

-- function TBTScienceCellMixin:OnEnter()
-- end

-- function TBTScienceCellMixin:OnLeave()
-- end

-- TBTBuzzwordCellMixin = CreateFromMixins(TBTTextCellMixin)

-- function TBTBuzzwordCellMixin:Init()
--   TBTTextCellMixin.Init(self, 3)
-- end

-- function TBTBuzzwordCellMixin:OnEnter()
-- end

-- function TBTBuzzwordCellMixin:OnLeave()
-- end

--- @var StdUi StdUi
local StdUi = LibStub('StdUi');

AuctionFaster.itemFramePool = {};
AuctionFaster.itemFrames = {};

function AuctionFaster:AddAuctionHouseTab()
	if self.TabAdded then
		return;
	end

	local auctionTab = StdUi:InfoPane(AuctionFrame, nil, nil, 'Auction Faster');
	auctionTab:Hide();
	auctionTab:SetAllPoints();

	self.auctionTab = auctionTab;

	local n = AuctionFrame.numTabs + 1;

	local tab = CreateFrame('Button', 'AuctionFrameTab' .. n, AuctionFrame, 'AuctionTabTemplate')
	tab:Hide();
	tab:SetID(n);
	tab:SetText('Sell Items');
	tab:SetNormalFontObject(GameFontHighlightSmall);
	tab:SetPoint('LEFT', _G['AuctionFrameTab' .. n - 1], 'RIGHT', -8, 0);
	tab:Show();
	tab.auctionFaster = true;

	PanelTemplates_SetNumTabs(AuctionFrame, n);
	PanelTemplates_EnableTab(AuctionFrame, n);

	self.TabAdded = true;

	self:ScanInventory();
	self:DrawItemsFrame();
	self:DrawRightPane();
	self:DrawTabButtons();

	self:Hook('AuctionFrameTab_OnClick', true);
end

function AuctionFaster:DrawItemsFrame()
	local marginTop = -35;
	local auctionTab = self.auctionTab;
	local panel, scrollFrame, scrollChild = StdUi:ScrollFrame(auctionTab, 'AFLeftScroll', 300, 300);
	panel:SetPoint('TOPLEFT', 25, marginTop);
	panel:SetPoint('BOTTOMLEFT', 300, 38);

	StdUi:AddLabel(auctionTab, panel, 'Inventory Items', 'TOP');

	local refreshInventory = StdUi:Button(auctionTab, 100, 20, 'Refresh');
	StdUi:GlueAbove(refreshInventory, panel, 0, 5, 'RIGHT');

	refreshInventory:SetScript('OnClick', function()
		AuctionFaster:ScanInventory();
	end);

	auctionTab.scrollFrame = scrollFrame;
	auctionTab.scrollChild = scrollChild;

	self.safeToDrawItems = true;
	self:DrawItems();

end

function AuctionFaster:DrawItems()
	-- Update bag delayed may cause this to happen before we open auction tab
	if not self.safeToDrawItems then
		return;
	end

	local scrollChild = self.auctionTab.scrollChild;
	local lineHeight = 30;
	local margin = 5;

	scrollChild:SetHeight(margin * 2 + lineHeight * #self.inventoryItems);

	-- hide all frames
	for i = 1, #self.itemFramePool do
		self.itemFramePool[i]:Hide();
	end

	for i = 1, #self.inventoryItems do
		-- next time we will be running this function we will reuse frames
		local holdingFrame = self.itemFramePool[i];

		if not holdingFrame then
			-- no allocated frame need to create one
			holdingFrame = self:CreateItemFrame(lineHeight, margin);
			-- insert only newly created to frame pool
			self.itemFramePool[i] = holdingFrame;
		end

		-- there is a frame so we need to update it
		holdingFrame:ClearAllPoints();
		holdingFrame:SetPoint('TOPLEFT', margin, -(i - 1) * lineHeight - margin);
		holdingFrame.itemLink = self.inventoryItems[i].link;
		holdingFrame.item = self.inventoryItems[i];
		holdingFrame.itemIndex = i;
		holdingFrame.itemIcon:SetTexture(self.inventoryItems[i].icon);
		holdingFrame.itemName:SetText(self.inventoryItems[i].name);
		holdingFrame.itemPrice:SetText(AuctionFaster:FormatMoney(self.inventoryItems[i].price));
		holdingFrame:Show();
	end
end

function AuctionFaster:CreateItemFrame(lineHeight, margin)
	local scrollChild = self.auctionTab.scrollChild;
	local holdingFrame = StdUi:Button(scrollChild, scrollChild:GetWidth() - margin * 2,
			lineHeight, nil, false, true, false);
	StdUi:ClearBackdrop(holdingFrame);
	holdingFrame.highlightTexture:SetColorTexture(1, 0.9, 0, 0.5);

	holdingFrame:EnableMouse();
	holdingFrame:RegisterForClicks('AnyUp');
	holdingFrame:SetScript('OnEnter', function(self)
		AuctionFaster:ShowTooltip(self, self.itemLink, true);
	end);
	holdingFrame:SetScript('OnLeave', function(self)
		AuctionFaster:ShowTooltip(self, nil, false);
	end);
	holdingFrame:SetScript('OnClick', function(self)
		AuctionFaster:SelectItem(self.itemIndex);
	end);

	holdingFrame.itemIcon = StdUi:Texture(holdingFrame, lineHeight - 2, lineHeight - 2);
	holdingFrame.itemIcon:SetPoint('TOPLEFT', holdingFrame, 1, -1)

	holdingFrame.itemName = StdUi:Label(holdingFrame, '', nil, nil, 150, 20);
	holdingFrame.itemName:SetPoint('TOPLEFT', 35, -5);

	holdingFrame.itemPrice = StdUi:Label(holdingFrame, '', nil, nil, 80, 20);
	holdingFrame.itemPrice:SetJustifyH('RIGHT');
	holdingFrame.itemPrice:SetPoint('TOPRIGHT', 0, -5);

	return holdingFrame;
end

function AuctionFaster:DrawRightPane()
	local leftMargin = 340;
	local topMargin = -35;

	local iconSize = 48;

	self:DrawRightPaneItemIcon(leftMargin, topMargin, iconSize);
	self:DrawRightPaneItemPrices(-25);
	self:DrawRightPaneStackSettings(10);
	self:DrawRightPaneInfoPanel(10);
	self:DrawRightPaneCurrentAuctionsTable(leftMargin);
	self:DrawItemSettingsPane();
end

function AuctionFaster:DrawRightPaneItemIcon(leftMargin, topMargin, iconSize)
	local auctionTab = self.auctionTab;

	auctionTab.itemIcon = StdUi:Texture(auctionTab, iconSize, iconSize, '');
	auctionTab.itemIcon:SetPoint('TOPLEFT', leftMargin, topMargin)

	auctionTab.itemName = StdUi:Label(auctionTab, 'No item selected', 16, nil, 250, 20);
	auctionTab.itemName:SetPoint('TOPLEFT', leftMargin + iconSize + 5, topMargin);

	auctionTab.itemQty = StdUi:Label(auctionTab, 'Qty: O, Max Stacks: 0', 14, nil, 250, 20);
	auctionTab.itemQty:SetPoint('TOPLEFT', leftMargin + iconSize + 5, topMargin - 20);

	-- Last scan time
	auctionTab.lastScan = StdUi:Label(auctionTab, 'Last scan: ---', 12);
	StdUi:GlueRight(auctionTab.lastScan, auctionTab.itemName, 5, 0);
end

function AuctionFaster:DrawRightPaneItemPrices(marginToIcon)
	local auctionTab = self.auctionTab;

	-- Bid per item edit box
	auctionTab.bidPerItem = StdUi:MoneyBoxWithLabel(auctionTab, 150, 20, '-', 'Bid Per Item', 'TOP');
	auctionTab.bidPerItem:Validate();
	StdUi:GlueBelow(auctionTab.bidPerItem, auctionTab.itemIcon, 0, marginToIcon, 'LEFT');

	-- Buy per item edit box
	auctionTab.buyPerItem = StdUi:MoneyBoxWithLabel(auctionTab, 150, 20, '-', 'Buy Per Item', 'TOP');
	auctionTab.buyPerItem:Validate();
	StdUi:GlueBelow(auctionTab.buyPerItem, auctionTab.bidPerItem, 0, -20);

	auctionTab.bidPerItem.OnValueChanged = function(self)
		AuctionFaster:ValidateBidPerItem(self)
	end;

	auctionTab.buyPerItem.OnValueChanged = function(self)
		AuctionFaster:ValidateBuyPerItem(self);
	end;
end

function AuctionFaster:DrawRightPaneStackSettings(marginToPrices)
	local auctionTab = self.auctionTab;

	-- Stack Size
	auctionTab.stackSize = StdUi:NumericBoxWithLabel(auctionTab, 150, 20, '1', 'Stack Size', 'TOP');
	auctionTab.stackSize:SetValue(0);
	StdUi:GlueRight(auctionTab.stackSize, auctionTab.bidPerItem, marginToPrices, 0);

	auctionTab.maxStacks = StdUi:NumericBoxWithLabel(auctionTab, 150, 20, '0', 'No. of stacks (0 = no limit)', 'TOP');
	auctionTab.maxStacks:SetValue(0);
	StdUi:GlueRight(auctionTab.maxStacks, auctionTab.buyPerItem, marginToPrices, 0);

	auctionTab.stackSize.OnValueChanged = function(self)
		AuctionFaster:ValidateStackSize(self);
	end;

	auctionTab.maxStacks.OnValueChanged = function(self)
		AuctionFaster:ValidateMaxStacks(self);
	end;
end

function AuctionFaster:DrawRightPaneInfoPanel(marginToStacks)
	local auctionTab = self.auctionTab;

	auctionTab.infoPane = StdUi:InfoPane(auctionTab, 160, 100, 'Auction Info');
	StdUi:GlueRight(auctionTab.infoPane, auctionTab.stackSize, marginToStacks, 0);

	local totalLabel = StdUi:Label(auctionTab.infoPane, 'Total: ' .. StdUi.Util.formatMoney(0));
	StdUi:GlueTop(totalLabel, auctionTab.infoPane, 3, -15, 'LEFT');

	local deposit = StdUi:Label(auctionTab.infoPane, 'Deposit: ' .. StdUi.Util.formatMoney(0));
	StdUi:GlueBelow(deposit, totalLabel, 0, -5, 'LEFT');

	local auctionNo = StdUi:Label(auctionTab.infoPane, '# Auctions: 0');
	StdUi:GlueBelow(auctionNo, deposit, 0, -5, 'LEFT');


	local itemSettings = StdUi:Button(auctionTab.infoPane, 100, 20, 'Item Settings');
	StdUi:GlueBottom(itemSettings, auctionTab.infoPane, 0, 5);

	itemSettings:SetScript('OnClick', function ()
		AuctionFaster:ToggleItemSettingsPane();
	end)

	auctionTab.infoPane.totalLabel = totalLabel;
	auctionTab.infoPane.auctionNo = auctionNo;
	auctionTab.infoPane.deposit = deposit;
	auctionTab.infoPane.itemSettings = itemSettings;
end

--- Draws tab buttons like Post All, Post One and Buy Item
function AuctionFaster:DrawTabButtons()
	local auctionTab = self.auctionTab;

	auctionTab.postButton = StdUi:Button(auctionTab, 60, 20, 'Post All');
	StdUi:GlueBelow(auctionTab.postButton, auctionTab, -20, 20, 'RIGHT');

	auctionTab.postOneButton = StdUi:Button(auctionTab, 60, 20, 'Post One');
	StdUi:GlueLeft(auctionTab.postOneButton, auctionTab.postButton, -10, 0);

	auctionTab.buyItemButton = StdUi:Button(auctionTab, 60, 20, 'Buy Item');
	StdUi:GlueLeft(auctionTab.buyItemButton, auctionTab.postOneButton, -10, 0);

	auctionTab.postOneButton:SetScript('OnClick', function()
		AuctionFaster:SellItem();
	end);

	auctionTab.buyItemButton:SetScript('OnClick', function()
		AuctionFaster:BuyItem();
	end);
end

local function FxHighlightScrollingTableRow(table, realrow, column, rowFrame, cols)
	local rowdata = table:GetRow(realrow);
	local celldata = table:GetCell(rowdata, column);
	local highlight;

	if type(celldata) == 'table' then
		highlight = celldata.highlight;
	end

	if table.fSelect then
		if table.selected == realrow then
			table:SetHighLightColor(rowFrame, highlight or cols[column].highlight
				or rowdata.highlight or table:GetDefaultHighlight());
		else
			table:SetHighLightColor(rowFrame, table:GetDefaultHighlightBlank());
		end
	end
end

local function FxDoCellUpdate(rowFrame, cellFrame, data, cols, row, realrow, column, fShow, table)
	if fShow then
		local idx = cols[column].index;
		local format = cols[column].format;

		local val = data[realrow][idx];
		if (format == 'money') then
			val = StdUi.Util.formatMoney(val);
		elseif (format == 'number') then
			val = tostring(val);
		end

		cellFrame.text:SetText(val);
		FxHighlightScrollingTableRow(table, realrow, column, rowFrame, cols);
	end
end

local function FxCompareSort(table, rowA, rowB, sortBy)
	local a = table:GetRow(rowA);
	local b = table:GetRow(rowB);
	local column = table.cols[sortBy];
	local idx = column.index;

	local direction = column.sort or column.defaultsort or 'asc';

	if direction:lower() == 'asc' then
		return a[idx] > b[idx];
	else
		return a[idx] < b[idx];
	end
end

function AuctionFaster:DrawRightPaneCurrentAuctionsTable(leftMargin)
	local auctionTab = self.auctionTab;

	local cols = {
		{
			name = 'Seller',
			width = 150,
			align = 'LEFT',
			index = 'owner',
			format = 'string',
			DoCellUpdate = FxDoCellUpdate,
			comparesort = FxCompareSort
		},
		{
			name = 'Qty',
			width = 40,
			align = 'LEFT',
			index = 'count',
			format = 'number',
			DoCellUpdate = FxDoCellUpdate,
			comparesort = FxCompareSort
		},
		{
			name = 'Bid / Item',
			width = 120,
			align = 'RIGHT',
			index = 'bid',
			format = 'money',
			DoCellUpdate = FxDoCellUpdate,
			comparesort = FxCompareSort
		},
		{
			name = 'Buy / Item',
			width = 120,
			align = 'RIGHT',
			index = 'buy',
			format = 'money',
			DoCellUpdate = FxDoCellUpdate,
			comparesort = FxCompareSort
		},
	}

	auctionTab.currentAuctions = StdUi:ScrollTable(auctionTab, cols, 10, 18);
	auctionTab.currentAuctions:EnableSelection(true);
	StdUi:GlueAcross(auctionTab.currentAuctions.frame, auctionTab, leftMargin, -200, -20, 55);
end

function AuctionFaster:AuctionFrameTab_OnClick(tab)
	if tab.auctionFaster then
		self.auctionTab:Show();
	else
		self.auctionTab:Hide();
	end
end

function AuctionFaster:CalcMaxStacks()
	local auctionTab = self.auctionTab;
	if not self.selectedItem then
		return 0, 0;
	end

	local stackSize = tonumber(auctionTab.stackSize:GetText());
	local maxStacks = floor(self.selectedItem.count / stackSize);
	if maxStacks == 0 then
		maxStacks = 1;
	end
	local remainingQty = self.selectedItem.count - (maxStacks * stackSize);
	if remainingQty < 0 then
		remainingQty = 0;
	end
	return maxStacks, remainingQty;
end

function AuctionFaster:ValidateMaxStacks(editBox)
	if not self.selectedItem then
		return;
	end

	local maxStacks = tonumber(editBox:GetText());
	local origMaxStacks = maxStacks;

	local maxStacksPossible = AuctionFaster:CalcMaxStacks();

	-- 0 means no limit
	if not maxStacks or maxStacks < 0 then
		maxStacks = 0;
	end

	if maxStacks > maxStacksPossible then
		maxStacks = maxStacksPossible;
	end

	if maxStacks ~= origMaxStacks then
		editBox:SetText(maxStacks);
	end
	AuctionFaster:UpdateItemQtyText();
end

function AuctionFaster:ValidateStackSize(editBox)
	if not self.selectedItem then
		return;
	end

	local stackSize = tonumber(editBox:GetText());
	local origStackSize = stackSize;

	if not stackSize or stackSize < 1 then
		stackSize = 1;
	end

	if stackSize > self.selectedItem.maxStack then
		stackSize = self.selectedItem.maxStack;
	end

	if stackSize ~= origStackSize then
		editBox:SetText(stackSize);
	end
	AuctionFaster:UpdateItemQtyText();
end

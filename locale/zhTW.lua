local L = LibStub('AceLocale-3.0'):NewLocale('AuctionFaster', 'zhTW', true);

L['Auction Faster - Historical Options'] = 'Auction Faster - 歷史選項'	-- possible need a unified format for addon name, Auction Faster or AuctionFaster?
L['Enable Historical Data Collection'] = '啟用歷史紀錄'
L['Days to keep data (5-50):'] = '資料儲存的天數，5至50天'
L['Auction Faster - Pricing Options'] = 'Auction Faster - 價格選項'
L['Historical Options'] = '歷史選項'
L['Pricing Options'] = '價格選項'
L['Maximum difference bid to buy (1-100%)'] = true;
L['Auction Faster Options'] = 'Auction Faster - 選項'
L['Auction Faster'] = 'Auction Faster'
L['Enable Auction Faster'] = '啟用Auction Faster'
L['Fast Mode'] = '快速模式'
L['Enable ToolTips'] = '啟用滑鼠提示'
L['12 Hours'] = '12小時'
L['24 Hours'] = '24小時'
L['48 Hours'] = '48小時'
L['Do not set'] = '不要設定'
L['Sell Tab'] = '出售分頁'
L['Buy Tab'] = '購買分頁'
L['Wipe Item Cache'] = '清除物品暫存'
L['Reset Tutorials'] = '重置新手教學'
L['Auction Duration'] = '拍賣時間'
L['Set Default Tab'] = '預設開啟分頁'
L['Item cache wiped!'] = '物品暫存已清除！'
L['Tutorials reset!'] = '新手教學已重置！'
L['Top'] = '上方'
L['Top Right'] = '右上'
L['Right'] = '右方'
L['Bottom Right'] = '右下'
L['Bottom'] = '下方'
L['Bottom Left'] = '左下'
L['Left'] = '左方'
L['Top Left'] = '左上'
L['Sell Tab Settings'] = '出售分頁設定'
--L['Enable ToolTips'] = true;
L['Enable ToolTips for Items'] = '啟用物品的滑鼠提示'
L['Tooltip Anchor'] = '滑鼠提示錨點'
L['Item Tooltip Anchor'] = '物品提示錨點'
L['Buy Tab Settings'] = '購買分頁設定'
--L['Enable ToolTips'] = true;
--L['Tooltip Anchor'] = true;
L['Query failed, retrying: '] = '查詢失敗，正在重試：'
L['Cannot query AH. Please wait a bit longer or reload UI'] = '無法掃瞄拍賣行。請等一下或重載介面'
L['Could not pick up item from inventory'] = '無法從背包中選定物品'
L['Posting: '] = '上架'
L[' for:\n'] = '：'
L['per auction: '] = '每組售價：'
L['per item: '] = '單價：'
L['# stacks: '] = '上架總數：'
L[' stack size: '] = '組出售，每組堆疊'	-- should not be that. better way is : ' %s stack, size: %s' then can be translate as '%2$s組，每組%1$s個' 
L['Chain Buy'] = '批量購買'
L['Qty: '] = '數量：'
L['Per Item: '] = '每個'
L['Total: '] = '總共'
L['Bought so far: '] = '已購買'
L['Queue'] = true;
L['Fast Mode - Auction Faster will NOT wait until you actually buy an item.\n\n'..
	'This may result in inaccurate amount of bought items and some missed auctions.\n' ..
	'|cFFFF0000Use this only if you don\'t care about how much you will buy and want to buy fast.|r'] = '快速模式\n啟用後，Auction Faster不會等到你「確定買到了」才顯示下一項，按下購買按鈕就直接顯示下一項。\n'..'這可能或錯過某些商品。\n\n'..'|cFFFF0000只在你不在乎買價和數量，只想快速掃貨時使用。|r'
L['Invalid cache key'] = '無效關鍵字'
L['LowestPrice'] = '最低價格'
L['WeightedAverage'] = '平均價格'
L['StackAware'] = '忽略散裝'
L['StandardDeviation'] = '標準偏差'
L['No auctions found'] = '沒有找到拍賣品'
L['No auction found with minimum quantity: '] = '沒有找到符合最小堆疊數量的拍賣品'
L['Tooltips enabled'] = '啟用滑鼠提示'
L['Tooltips disabled'] = '停用滑鼠提示'
L['AuctionFaster:'] = true;	-- ????
L['Lowest Bid: '] = '最低競標價'
L['Lowest Buy: '] = '最低購買價'
L['Filters'] = '過濾條件'
L['Exact Match'] = '精確符合'
L['Level from'] = '等級自'
L['Level to'] = '等級至'
L['Sub Category'] = '子類別'
L['Category'] = '類別'
L['No query was searched before'] = '尚未開始檢索'
L['Search in progress...'] = '正在搜尋...'
L['Nothing was found for this query.'] = '這個關鍵字沒有找到任何東西'
L['Pages: '] = '頁：'	-- better is "Pages %s" so can translate as "第%s頁"
L['Queue Qty: '] = '隊列中的數量：'
L['Please select item first'] = '請先選定物品'
L['No auctions found with requested stack count: '] = '找不到符合最小堆疊數量的拍賣品'
L['Enter query and hit search button first'] = '先輸入要搜尋的物品關鍵字，然後點擊搜尋按鈕'
L['No auction found for minimum stacks: '] = '該物品找不到符合最小堆疊過濾條件的項目：'
--L['Addon Tutorial'] = true;
--L['Addon settings'] = true;
-- buy tutorials
L['Welcome to AuctionFaster.\n\nI recommend checking out\ntutorial at least once\nbefore you '] = '歡迎使用Auction Faster。\n\n誠摯地建議您，使用前先閱讀一遍新手教學'
L['accidentially\nbuy half of the auction house.\n\n:)'] = '以免不小心買下半個拍賣場。\n\n:)'
L['Once you enter search query\nthis button will add it to\nthe favorites.'] = '查詢的關鍵字或條目可以按這個按鈕加入收藏。'
L['This button opens up filters.\nClick again to close.'] = '點擊這裡打開過濾選項。\n再次點擊關閉。'
L['Search results.\n\nThere are 3 major shortcuts:\n\n'] = '搜尋結果。\n\n有三個功能快捷鍵：\n\n'
L['Shift + Click - Instant buy\n'] = 'Shift + 點擊 - 立刻購買\n'
L['Alt + Click - Add to queue\n'] = 'Alt + 點擊 - 加到待購清單\n'
L['Ctrl + Click - Chain buy\n'] = 'Ctrl + 點擊 - 批量購買'
L['Your favorites\nClicking on the name will\ninstanty search for this query.\n\n'] = '你的收藏\n點擊即可馬上搜尋。\n\n'
L['Click delete button to remove.'] = '點擊刪除按鈕以移除。'
L['Chain buy will add all auctions\nfrom the first one you select\nto the bottom '] = '批量購買會從你選中的拍賣條目開始，\n從上而下'
L['of the list\nto the Buy Queue.\n\n'] = '將拍賣列表全部加入待購清單。\n\n'
L['You will still need to confirm them.'] = '你仍要一個個確認才會購買。'
L['Status of the current buy queue\n\nQty will show you actual quantity\n'] = '顯示批量購買的進度，\n\n「數量」會顯示物品實際總數。\n'
L['and progress bar will show\nthe amount of auctions.'] = '進度條會顯示拍賣條目的數量。'
L['Minimal amount of quantity\nyou are interested in.\n\n'] = '你想搜尋的最小堆疊數量。'
L['This is used by two buttons on the left.'] = '這個數值會作用在左邊兩個按鈕的功能上。'
L['Adds all auctions to the queue that has at least the amount of quantity entered'] = '將高於「最小堆疊數量」的拍賣條目全部加入待購清單'
L[' in the box on the right'] = '，數值是你在右邊輸入框所設定的'
L['Finds the first auction '] = '尋找拍賣中'
L['across all the pages'] = '該物品所有'
L[' that meets the minimum quantity\n\n'] = '符合「最小堆疊數量」的條目\n'
L['You need to enter a search query first'] = '你必需先輸入要搜尋的東西才能按數量過濾'
L['Opens this tutorial again.\nHope you liked it\n\n:)\n\n'] = '點擊這裡可以重新打開新手教學。\n希望你喜歡它。\n\n:)\n\n'
-- buy UI
L['Buy Items'] = '買入'
L['Auction Faster - Buy'] = 'Auction Faster - 購買'
L['Search'] = '搜尋'
--L['Filters'] = true;
L['Buy'] = '購買'
L['Skip'] = '跳過'
L['Close'] = '關閉'
--L['Bought so far: '] = true;
--L['Reset Pos'] = true; -- missing entry
-- sniper
L['Sniper'] = '搶標'
L['Auto Refresh'] = '自動更新'
L['Refresh Interval'] = '更新間隔'
L['More features\ncoming soon'] = '更多功能\n即將到來'

--L['Chain Buy'] = '批量購買'
L['Add to Queue'] = '加入隊列'
L['Add With Min Stacks'] = '按最小堆疊加入'
L['Find X Stacks'] = '按堆疊過濾'
L['Min Stacks: '] = '最小堆疊'
L['Please select auction first'] = '請先選擇一項拍賣品'
L['Enter a correct stack amount 1-200'] = '輸入精確的堆疊數量，1-200'
L['Queue Qty: 0'] = '隊列數量：'
L['Auctions: '] = '拍賣：'
L['Page 1 of 0'] = true;	-- ????
L['Favorite Searches'] = '收藏的條目'
L['Name'] = '名字'
L['Seller'] = '出售者'
L['Qty'] = '數量'
L['Bid / Item'] = '每單位競標價'
L['Buy / Item'] = '每單位直購價'
L['Chose your search criteria nad press "Search"'] = '選擇搜尋條件後按「搜尋」'
-- sell functions
L['Stack Size (Max: '] = '堆疊（最大：'	-- the better way hould be 'Stack Size (Max: %s)'
L['Qty: '] = '數量：'
L[', Max Stacks: '] = '，最大堆疊可售：'
L[', Remaining: '] = '組，剩餘：'
L['Last Scan: '] = '上次掃瞄：'
L['Please refresh auctions first'] = '請先按更新，重整拍賣'
--L['No auctions found with requested stack count: '] = ''
L['Yes'] = '是'
L['No'] = '否'
L['Incomplete sell'] = true;
L['You still have '] = true;
L[' of '] = true;
L[' Do you wish to sell rest?'] = true;
-- sell info pane
L['Auction Info'] = '拍賣資訊'
L['Total: '] = '總共：'
L['Deposit: '] = '保證金'
L['# Auctions: 0'] = '正在出售：0'
L['Duration: 24h'] = '持續時間：24小時'
L['Historical Data'] = '歷史紀錄'
--L['Per auction: '] = true;
L['# Auctions: '] = '正在出售：'
L['Duration: '] = '持續時間'
L['No historical data available for: '] = '沒有可查閱的歷史紀錄：'
L['Lowest Buy'] = '最低購買價'
L['Trend Lowest Buy'] = true;
L['Average Buy'] = true;
L['Trend Average Buy'] = true;
L['Highest Buy'] = '最高購買價'
L['Test Line'] = true;
--L['Historical Data: '] = true;
-- sell item settings

L['Item Settings'] = '物品設定'
L['No Item selected'] = '尚未選擇物品'
L['Remember Stack Settings'] = '記住堆疊設定'
L['Remember Last Price'] = '記住上次價格'
L['Always Undercut'] = '總是自動壓價'
L['Use Custom Duration'] = '自訂拍賣時間'
L['12h'] = '12小時'
L['24h'] = '24小時'
L['48h'] = '48小時'
--L['Auction Duration'] = '拍賣時間'
L['Pricing Model'] = '壓價模式'
L['If there is no auctions of this item,'] = '如果目前拍賣場裡沒有其他人出售這項物品，'
L['remember last price.'] = '記住上次價格'
L['Your price will be overriden'] = '你的價格會被覆蓋'
L['if "Always Undercut" options is checked!'] = '，如果勾選了「總是自動壓價」'
L['Checking this option will make\nAuctionFaster remember how much\n' ..
	'stacks you wish to sell at once\nand how big is stack'] = '啟用這個選項會使\nAuction Faster記住你每次要上架的每組堆疊與組數'
L['By default, AuctionFaster always undercuts price,\neven if you toggle "Remember Last Price"\n'..
	'If you uncheck this option AuctionFaster\nwill never undercut items for you'] = 'AuctionFaster會自動壓價，使上架的價格永遠是最低價，就算你勾選了「記住上次價格」也一樣。\n如果你取消這項，Auction Faster就不再替你自動壓價。'

-- sell tutorial
L['Addon Tutorial'] = '新手教學'
L['Addon settings'] = '設定選項'
L['Welcome to AuctionFaster.\n\nI recommend checking out sell tutorial at least once before you accidentally sell your precious goods.\n\n:)'] = '歡迎使用Auction Faster。\n\n誠摯地建議您，為了避免誤賣貴重物品，使用前先閱讀一遍新手教學。'
L['Here is the list of all inventory items you can sell, no need to drag anything.\n\n'] = '這是你行囊中可出售物品的清單，不需要拖曳任何東西，它們會自動顯示在這裡。\n\n'
L['After you select item, AuctionFaster will automatically make a scan of first page and undercut set bid/buy according to price model selected.'] = '當你選擇一樣物品，Auction Faster會自動掃瞄該物品的拍賣列表，然後根據壓價模式計算出售價。'
L['Here you will see selected item. Max stacks means how much of stacks can you sell according to your setting. Remaining means how much quantity will still stay in bag after selling item.'] = '你會在這裡看見剛才選擇的物品。「最大堆疊」的數量指的是按你設定的最大堆疊可以出售幾疊。「剩餘」的數量指的是扣除那些預計要出售的數量後包裡還剩下多少。'
L['AuctionFaster keeps auctions cache for about 10 minutes, you can see when last real scan was performed.\n\n'] = 'AuctionFaster會自動保留拍賣搜尋結果暫存大約十分鐘，你可以看到上次執行實時掃瞄的時間。'
L['You can click Refresh Auctions to scan again'] = '你可以點擊「更新拍賣」來重新掃瞄。'
L['Your bid price '] = '你的競標價'
L['per one item.'] = '每單位'	-- they should be a whole sentence: "Your bid price per one item."/"Your buyout price per one item.". or will make a bad grammer in asia launguagem even lost punctuation. 
L['AuctionFaster understands a lot of money formats'] = 'AuctionFaster可以辨識多種貨幣格式'
--L[', for example:'] = '，例如：' -- lost this entry
L['Your buyout price '] = '你的直購價'
L[' Same money formats as bid per item.'] = '，使用和競拍價相同的格式輸入。'
L['Maximum number of stacks you wish to sell.\n\n'] = '你要按設定的堆疊出售幾組。\n\n'
L['Set this to 0 to sell everything'] = '設為0就是全部出售'
L['This opens up item settings.\nClick again to close.\n\n'] = '點擊這裡打開物品設定。\n再次點擊關閉。\n\n'
L['Hover over checkboxes to see what the options are.\n\n'] = '把滑鼠移到選項上，看看它們的功能與說明。\n\n'
L['Those settings are per specific item'] = '這是針對指定物品的額外上架設定'
L['This opens auction informations:\n\n'] = '點擊這裡打開拍賣資訊：\n\n'
L['- Total auction buy price.\n'] = '全部售出的總價\n'
L['- Deposit cost.\n'] = '花費保證金\n'
L['- Number of auctions\n'] = '將要上架至拍賣行的數量'
L['- Auction duration\n\n'] = '拍賣持續時間'
L['This will change dynamically when you change stack size or max stacks.'] = '這會隨著你調整出售的堆疊大小或上架組數而動態更改。'
L['Here is a list of auctions of currently selected item.\n'] = '這是你選擇的物品當前的拍賣列表。\n'
L['You can be sure your item will be cheapest.\n'] = '你可以比照價格，確定你將會以最低價出售。\n'
L['These are always sorted by lowest price per item.'] = '這個列表總是按物品單價由低至高排列。'
L['This button allows you to buy selected item. Useful for restocking.'] = '點擊這個按鈕可以購買選定的項目，使掃貨更方便。'
L['Posts '] = '上架'
L['one auction'] = '一項'
L[' of selected item regardless of your\n"# Stacks" settings'] = '而不管你對「上架幾組」的設定'
L['all auctions'] = '全部'
L[' of selected item according to your\n"# Stacks" settings'] = '根據你對「上架幾組」的設定'
--L['Opens this tutorial again.\nHope you liked it\n\n:)\n\n'] = true;
L['Once you close this tutorial it won\'t show again unless you click it'] = '關閉教學就不再顯示，除非你再次點擊這個按鈕。'
-- sell ui
L['Sell Items'] = '賣出'
L['Auction Faster - Sell'] = 'Auction Faster - 出售'
L['Refresh inventory'] = '更新庫存'
L['Sort settings'] = '排序設定'
L['Sort by'] = '分類'
L['Name'] = '名字'
L['Price'] = '價格'
L['Quality'] = '品質'
L['Direction'] = '排序'
L['Ascending'] = '升序'
L['Descending'] = '降序'
L['Filter items'] = '過濾物品'
--L['No item selected'] = true;
L['Qty: O, Max Stacks: 0'] = '數量：0，最大堆疊可售：0組'
L['Last scan: ---'] = '上次掃瞄：'
L['Bid Per Item'] = '每單位競標價'
L['Buy Per Item'] = '每單位直購價'
L['Stack Size'] = '堆疊'
L['# Stacks'] = '出售幾組' -- this make me and other confuse, actually transelate as "組", it means a set/packet, 出售幾組 means how many sets wanna sell as that stack
--L['Item Settings'] = true;
--L['Auction Info'] = true;
L['Refresh Auctions'] = '更新拍賣'
L['Post All'] = '上架全部'
L['Post One'] = '上架一個'
--L['Chain Buy'] = true;
--L['Please select item first'] = true;
--L['Seller'] = true;
--L['Qty'] = true;
L['Lvl'] = '等級'
--L['Bid / Item'] = true;
--L['Buy / Item'] = true;

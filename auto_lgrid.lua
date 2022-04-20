bots = {   
    "",
    "",
    "",
    ""
}
daftarbot = {
    GetBot(bots[1]),
    GetBot(bots[2]),
    GetBot(bots[3]),
    GetBot(bots[4]),
}
-------------------------------------------------------------------------------------------------------
----------------------------------------------Runthread 1----------------------------------------------
-------------------------------------------------------------------------------------------------------
RunThread(function()
    bot1 = daftarbot[1]
    if bot1 == nil then
        return
    end
    w1 = bot1:GetWorld()
    htpnb1 = false
    pt1 = false
    if w1 ~= nil then
        bot1:Say("Created by Finer")
    end
    logulang1 = false
    local function CollectItems1(range)
        plr = bot1:GetLocal()
        if plr ~= nil then
            for _, obj in pairs(bot1:GetWorld():GetObjects()) do
                if math.abs(obj.pos_x - plr.pos_x) <= range and math.abs(obj.pos_y - plr.pos_y) <= range then
                    pkt = GamePacket()
                    pkt.type = 11
                    pkt.int_data = obj.index
                    pkt.pos_x = obj.pos_x
                    pkt.pos_y = obj.pos_y
                    bot1:SendPacketRaw(pkt)
                end     
            end
        end
    end
    local function CollectItemsb1()
        plr = bot1:GetLocal()
        if plr ~= nil then
            for _, obj in pairs(bot1:GetWorld():GetObjects()) do
                if math.abs(obj.pos_x - plr.pos_x) <= 50 and math.abs(obj.pos_y - plr.pos_y) <= 75 then
                    pkt = GamePacket()
                    pkt.type = 11
                    pkt.int_data = obj.index
                    pkt.pos_x = obj.pos_x
                    pkt.pos_y = obj.pos_y
                    bot1:SendPacketRaw(pkt)
                end
            end
        end
    end
    function door1(x, y)
        pkt1 = GamePacket()
        pkt1.type = 7
        pkt1.int_data = 18
        pkt1.tile_x = x
        pkt1.tile_y = y
        pkt1.pos_x = bot1:GetLocal().pos_x
        pkt1.pos_y = bot1:GetLocal().pos_y
        bot1:SendPacketRaw(pkt1)
    end
    local function hasItem1(id)
        inv1 = bot1:GetInventory()
        invs1 = inv1:GetItem(id).amount
        if invs1 ~= 0 then
            return true
        else
            return false
        end
    end
    local function trashAllItems(itemid, amount)
        bot1:SendPacket(2, "action|trash\n|itemID|".. itemid)
        bot1:SendPacket(2, "action|dialog_return\ndialog_name|trash_item\nitemID|"..itemid.."|\ncount|".. amount)
    end
    local function getItemCount1(id)
        inven1 = bot1:GetInventory()
        if inven1:GetItem(id) == nil then
            return 0
        else 
            return inven1:GetItem(id).amount
        end
    end
    

    function dropItem1(itemID)
        count = getItemCount1(itemID)
        hideDrop = true
        bot1:SendPacket(2, "action|drop\n|itemID|" .. itemID)
        bot1:SendPacket(2, "action|dialog_return\ndialog_name|drop_item\nitemID|" .. itemID .. "|\ncount|" .. count)
        Sleep(175)
        hideDrop = false
    end

    function faceSide1()
        pkt = GamePacket()
        pkt.type = 0
        pkt.pos_x = bot1:GetLocal().pos_x
        pkt.pos_y = bot1:GetLocal().pos_y
        pkt.flags = 48
        bot1:SendPacketRaw(pkt)
    end
------------------------------------------------------------------------- pnb
    local function breakk1()
        CollectItems1(25)
        while true do
            if getItemCount1(5666) == 0 then
                lax = bot1:GetLocal().pos_x / 32
                lay = bot1:GetLocal().pos_y / 32
                while true do
                    Sleep(200)
                    blocknya = w1:GetTile(lax, lay).fg
                    if blocknya ~= 0 then
                        bot1:HitTile(lax, lay)
                    elseif blocknya == 0 then
                        break
                    end
                end
                Sleep(20)
                CollectItems1(25)
                break
            elseif getItemCount1(5667) >= 180 then
                lax = bot1:GetLocal().pos_x / 32
                lay = bot1:GetLocal().pos_y / 32
                while true do
                    Sleep(200)
                    blocknya = w1:GetTile(lax, lay).fg
                    if blocknya ~= 0 then
                        bot1:HitTile(lax, lay)
                    elseif blocknya == 0 then
                        break
                    end
                end
                Sleep(20)
                CollectItems1(25)
                break
            elseif htpnb1 == false then
                break
            end
            lax = bot1:GetLocal().pos_x / 32
            lay = bot1:GetLocal().pos_y / 32
            bot1:PlaceTile(lax, lay,  5666)
            while true do
                Sleep(200)
                blocknya = w1:GetTile(lax, lay).fg
                if blocknya ~= 0 then
                    bot1:HitTile(lax, lay)
                elseif blocknya == 0 then
                    break
                end
            end
            Sleep(20)
            CollectItems1(25)
        end
    end
    local function breakkb1()
        CollectItems1(25)
        while true do
            if getItemCount1(5666) == 0 then
                lax = bot1:GetLocal().pos_x / 32
                lay = bot1:GetLocal().pos_y / 32
                while true do
                    Sleep(200)
                    blocknya = w1:GetTile(lax, lay).fg
                    if blocknya ~= 0 then
                        bot1:HitTile(lax, lay)
                    elseif blocknya == 0 then
                        break
                    end
                end
                Sleep(60)
                CollectItems1(25)
                break
            elseif getItemCount1(5667) >= 180 then
                gax = bot1:GetLocal().pos_x / 32
                gay = bot1:GetLocal().pos_y / 32
                bot1:FindPath(1,0)
                Sleep(500)
                faceSide1()
                Sleep(500)
                dropItem1(5667)
                Sleep(500)
                bot1:FindPath(gax, gay)
                Sleep(500)
            elseif htpnb1 == false then
                break
            end
            lax = bot1:GetLocal().pos_x / 32
            lay = bot1:GetLocal().pos_y / 32
            bot1:PlaceTile(lax, lay,  5666)
            while true do
                Sleep(200)
                blocknya = w1:GetTile(lax, lay).fg
                if blocknya ~= 0 then
                    bot1:HitTile(lax, lay)
                elseif blocknya == 0 then
                    break
                end
            end
            Sleep(60)
            CollectItems1(25)
        end
    end
------------------------------------------------------------------------- harvest tree
    local function ht1()
        for _, tile in pairs(w1:GetTiles()) do
            if getItemCount1(5666) >= 150  then
                break
            elseif getItemCount1(5667) >= 180 then
                break
            elseif htpnb1 == false then
                break
            end
            if tile.pos_x == 99 and tile.pos_y == 53 then
                breakkb1()
                Sleep(2000)
                for _, tiles in pairs(w1:GetTiles()) do
                    if tiles.fg ==5666 then
                        bot1:FindPath(tiles.pos_x, tiles.pos_y)
                        Sleep(300)
                        lax = bot1:GetLocal().pos_x / 32
                        lay = bot1:GetLocal().pos_y / 32
                        while true do
                            Sleep(1000)
                            blocknya = w1:GetTile(lax, lay).fg
                            if blocknya ~= 0 then
                                bot1:HitTile(lax, lay)
                            elseif blocknya == 0 then
                                break
                            end
                        end
                        Sleep(60)
                        CollectItems1(25)
                        if tiles.pos_x == 99 and tile.pos_y == 53 then
                            break
                        end
                    end
                end
                bot1:Say("Auto HTPNB done, beralih ke auto PT")
                Sleep(500)
                htpnb1 = false
                pt1 = true
                break
            end
            if tile.fg == 5667 then
                bot1:FindPath(tile.pos_x, tile.pos_y)
                bot1:HitTile(tile.pos_x,tile.pos_y)
                CollectItemsb1()
                Sleep(251)
                lax = bot1:GetLocal().pos_x / 32
                lay = bot1:GetLocal().pos_y / 32
                if w1:GetTile(lax + 1,lay).fg ~= 5667 then
                    CollectItemsb1()
                    Sleep(2000)
                end
            end
        end
    end
------------------------------------------------------------------------- auto plant
    local function autoplant1(seedID, tileID, delay)
        delay=delay or 500
        for _,v in pairs(w1:GetTiles()) do
            if getItemCount1(5667) < 6 then
                Sleep(2000)
                break
            end
            if pt1 == false then
                bot1:Say("oke berhenti")
                break
            end
            if v.pos_x == 99 and v.pos_y == 53 then
                bot1:Say("Auto PT done")
                gax = bot1:GetLocal().pos_x / 32
                gay = bot1:GetLocal().pos_y / 32
                bot1:FindPath(1,0)
                Sleep(500)
                faceSide1()
                Sleep(500)
                dropItem1(5667)
                Sleep(500)
                bot1:SendPacket(2, "action|respawn")
                Sleep(500)
                pt1 = false
                break
            end
            local fg1=w1:GetTile(v.pos_x, v.pos_y+1).fg
            if fg1==0 then 
                goto SKIP 
            end
            if v.fg==0 and fg1==(tileID or fg1) then
                while w1:GetTile(v.pos_x, v.pos_y).fg~=seedID do
                    if not hasItem1(seedID) then 
                        break 
                    end
                    bot1:FindPath(v.pos_x, v.pos_y)
                    bot1:PlaceTile(v.pos_x, v.pos_y, 5667)
                    Sleep(delay)
                end
            end
            if v.fg==0 and fg1==(8 or fg1) then
                while w1:GetTile(v.pos_x, v.pos_y).fg~=seedID do
                    if not hasItem1(seedID) then 
                        break 
                    end
                    bot1:FindPath(v.pos_x, v.pos_y)
                    bot1:PlaceTile(v.pos_x, v.pos_y, 5667)
                    Sleep(delay)
                end
            end
            if v.fg==0 and fg1==(10 or fg1) then
                while w1:GetTile(v.pos_x, v.pos_y).fg~=seedID do
                    if not hasItem1(seedID) then 
                        break 
                    end
                    bot1:FindPath(v.pos_x, v.pos_y)
                    bot1:PlaceTile(v.pos_x, v.pos_y, 5667)
                    Sleep(delay)
                end
            end
            ::SKIP::
        end
    end
------------------------------------------------------------------------- hook1
    local function hook1(current_bot, vlist, netid, delay)
        if vlist[0] == "OnConsoleMessage" and vlist[1]:find("!htpnb")  then
            bot1:Say("HTPNB ON")
            bot1:Move(3)
            bot1:Move(3)
            bot1:Move(3)
            htpnb1 = true
        elseif vlist[0] == "OnConsoleMessage" and vlist[1]:find("!pt")  then
            bot1:Say("PT ON")
            bot1:Move(3)
            bot1:Move(3)
            bot1:Move(3)
            pt1 = true
        elseif vlist[0] == "OnConsoleMessage" and vlist[1]:find("!res")  then
            bot1:SendPacket(2, "action|respawn")
        elseif vlist[0] == "OnConsoleMessage" and vlist[1]:find("!mu")  then
            bot1:Move(1)
        elseif vlist[0] == "OnConsoleMessage" and vlist[1]:find("!md")  then
            bot1:Move(2)
        elseif vlist[0] == "OnConsoleMessage" and vlist[1]:find("!ml")  then
            bot1:Move(3)
        elseif vlist[0] == "OnConsoleMessage" and vlist[1]:find("!mr")  then
            bot1:Move(4)
        elseif vlist[0] == "OnConsoleMessage" and vlist[1]:find("!in")  then
            bot1:Say("Oke, aku masuk brok")
            drax = bot1:GetLocal().pos_x / 32
            dray = bot1:GetLocal().pos_y / 32
            door1(drax, dray)
            logulang1 = true
        elseif vlist[0] == "OnConsoleMessage" and vlist[1]:find("!nwarp")  then
            bot1:Warp(vlist[1]:match("!nwarp (.+)"))
        elseif vlist[0] == "OnConsoleMessage" and vlist[1]:find("!warp")  then
            bot1:Warp(vlist[1]:match("!warp (.+)"))
            logulang1 = true
        elseif vlist[0] == "OnConsoleMessage" and vlist[1]:find("!gems")  then
            bot1:Say(bot1.gems)
        elseif vlist[0] == "OnConsoleMessage" and vlist[1]:find("!stop")  then
            bot1:Say("Oke stop")
            htpnb1 = false
            pt1 = false
        elseif vlist[0] == "OnConsoleMessage" and vlist[1]:find("!log")  then
            bot1:Say("Tungu...")
            logulang1 = true
        end
    end
    bot1:AddCallback(VARIANTLIST, "hook1", hook1)
------------------------------------------------------------------------- main
    while true do
        if bot1.connected then
            if logulang1 == true then
                Sleep(10000)
                if w1 ~= nil then
                    bot1:Say("Login ulang dulu")
                end
                bot1:SendPacket(3, "action|quit")
                Sleep(500)
                bot1:Connect()
                Sleep(10000)
                while bot1.connected == false do
                    bot1:SendPacket(3, "action|quit")
                    Sleep(500)
                    bot1:Connect()
                    Sleep(60000)
                end
                while bot1:GetWorld().name == "EXIT" do
                    bot1:SendPacket(3, "action|quit")
                    Sleep(1000)
                    bot1:Connect()
                    Sleep(10000)
                end
                bot1 = GetBot(bots[1])
                Sleep(500)
                w1 = bot1:GetWorld()
                logulang1 = false
                Sleep(500)
                bot1:AddCallback(VARIANTLIST, "hook1", hook1)
                if w1 ~= nil then
                    bot1:Say("udah selesai login")
                end
            end
            if htpnb1 == true then
                w1 = bot1:GetWorld()
                if getItemCount1(5666) <150 and getItemCount1(5667) <180 then
                    ht1()
                elseif getItemCount1(5666) >= 150 and getItemCount1(5667) < 180 then
                    breakk1()
                elseif getItemCount1(5667) >= 180 then
                    gax = bot1:GetLocal().pos_x / 32
                    gay = bot1:GetLocal().pos_y / 32
                    bot1:FindPath(1,0)
                    Sleep(500)
                    faceSide1()
                    Sleep(500)
                    dropItem1(5667)
                    Sleep(500)
                    if getItemCount1(5028) >= 100 then
                        if getItemCount1(5028) >= 100 then
                        trashAllItems(5028, 100)
                        Sleep(2000)
                        end
                        if getItemCount1(5032) >= 100 then
                        trashAllItems(5032, 100)
                        Sleep(2000)
                        end
                        if getItemCount1(5034) >= 100 then
                        trashAllItems(5034, 100)
                        Sleep(2000)
                        end
                        if getItemCount1(5036) >= 100 then
                        trashAllItems(5036, 100)
                        Sleep(2000)
                        end
                        if getItemCount1(5038) >= 100 then
                        trashAllItems(5038, 100)
                        Sleep(2000)
                        end
                        if getItemCount1(5040) >= 100 then
                        trashAllItems(5040, 100)
                        Sleep(2000)
                        end
                        if getItemCount1(5042) >= 100 then
                        trashAllItems(5042, 100)
                        Sleep(2000)
                        end
                        if getItemCount1(5044) >= 100 then
                        trashAllItems(5044, 100)
                        Sleep(2000)
                        end
                        if getItemCount1(7162) >= 100 then
                        trashAllItems(7162, 100)
                        Sleep(2000)
                        end
                        if getItemCount1(7164) >= 100 then
                        trashAllItems(7164, 100)
                        Sleep(2000)
                        end
                    end
                    bot1:FindPath(gax, gay)
                    Sleep(500)
                end
            end
            if pt1 == true then
                w1 = bot1:GetWorld()
                if getItemCount1(5667) > 5 then
                    
                    autoplant1(5667, 2, 330)
                elseif getItemCount1(5667) < 6 then
                    bot1:FindPath(0, 0)
                    Sleep(500)
                    CollectItems1(25)
                    Sleep(2000)
                    if getItemCount1(5667) <= 5 then
                        bot1:Say("Seed habis berhenti cuy")
                        pt1 = false
                    end
                end
            end
        else
            Sleep(500)
            bot1:Connect()
            Sleep(10000)
            while bot1.connected == false do
                bot1:SendPacket(3, "action|quit")
                Sleep(500)
                bot1:Connect()
                Sleep(60000)
            end
            while bot1:GetWorld().name == "EXIT" do
                bot1:SendPacket(3, "action|quit")
                Sleep(1000)
                bot1:Connect()
                Sleep(10000)
            end
            bot1 = GetBot(bots[1])
            Sleep(500)
            w1 = bot1:GetWorld()
            logulang1 = false
            Sleep(500)
            bot1:AddCallback(VARIANTLIST, "hook1", hook1)
            if w1 ~= nil then
                bot1:Say("udah selesai login")
            end
        end
        Sleep(2000)
    end
end)


-------------------------------------------------------------------------------------------------------
----------------------------------------------Runthread 2----------------------------------------------
-------------------------------------------------------------------------------------------------------
RunThread(function()
    bot2 = daftarbot[2]
    if bot2 == nil then
        return
    end
    w2 = bot2:GetWorld()
    htpnb2 = false
    pt2 = false
    if w2 ~= nil then
        bot2:Say("Created by Finer")
    end
    logulang2 = false
    local function CollectItems2(range)
        plr = bot2:GetLocal()
        if plr ~= nil then
            for _, obj in pairs(bot2:GetWorld():GetObjects()) do
                if math.abs(obj.pos_x - plr.pos_x) <= range and math.abs(obj.pos_y - plr.pos_y) <= range then
                    pkt = GamePacket()
                    pkt.type = 11
                    pkt.int_data = obj.index
                    pkt.pos_x = obj.pos_x
                    pkt.pos_y = obj.pos_y
                    bot2:SendPacketRaw(pkt)
                end
            end
        end
    end
    local function CollectItemsb2()
        plr = bot2:GetLocal()
        if plr ~= nil then
            for _, obj in pairs(bot2:GetWorld():GetObjects()) do
                if math.abs(obj.pos_x - plr.pos_x) <= 50 and math.abs(obj.pos_y - plr.pos_y) <= 75 then
                    pkt = GamePacket()
                    pkt.type = 11
                    pkt.int_data = obj.index
                    pkt.pos_x = obj.pos_x
                    pkt.pos_y = obj.pos_y
                    bot2:SendPacketRaw(pkt)
                end
            end
        end
    end
    function door2(x, y)
        pkt2 = GamePacket()
        pkt2.type = 7
        pkt2.int_data = 18
        pkt2.tile_x = x
        pkt2.tile_y = y
        pkt2.pos_x = bot2:GetLocal().pos_x
        pkt2.pos_y = bot2:GetLocal().pos_y
        bot2:SendPacketRaw(pkt2)
    end
    local function hasItem2(id)
        inv2 = bot2:GetInventory()
        invs2 = inv2:GetItem(id).amount
        if invs2 ~= 0 then
            return true
        else
            return false
        end
    end
    local function trashAllItems(itemid, amount)
        bot2:SendPacket(2, "action|trash\n|itemID|".. itemid)
        bot2:SendPacket(2, "action|dialog_return\ndialog_name|trash_item\nitemID|"..itemid.."|\ncount|".. amount)
    end
    local function getItemCount2(id)
        inven2 = bot2:GetInventory()
        if inven2:GetItem(id) == nil then
            return 0
        else 
            return inven2:GetItem(id).amount
        end
    end
    function dropItem2(itemID)
        count = getItemCount2(itemID)
        hideDrop = true
        bot2:SendPacket(2, "action|drop\n|itemID|" .. itemID)
        bot2:SendPacket(2, "action|dialog_return\ndialog_name|drop_item\nitemID|" .. itemID .. "|\ncount|" .. count)
        Sleep(175)
        hideDrop = false
    end

    function faceSide2()
        pkt = GamePacket()
        pkt.type = 0
        pkt.pos_x = bot2:GetLocal().pos_x
        pkt.pos_y = bot2:GetLocal().pos_y
        pkt.flags = 48
        bot2:SendPacketRaw(pkt)
    end
------------------------------------------------------------------------- pnb
    local function breakk2()
        CollectItems2(25)
        while true do
            if getItemCount2(5666) == 0 then
                lbx = bot2:GetLocal().pos_x / 32
                lby = bot2:GetLocal().pos_y / 32
                while true do
                    Sleep(200)
                    blocknya = w2:GetTile(lbx, lby).fg
                    if blocknya ~= 0 then
                        bot2:HitTile(lbx, lby)
                    elseif blocknya == 0 then
                        break
                    end
                end
                Sleep(60)
                CollectItems2(25)
                break
            elseif getItemCount2(5667) >= 180 then
                lbx = bot2:GetLocal().pos_x / 32
                lby = bot2:GetLocal().pos_y / 32
                while true do
                    Sleep(200)
                    blocknya = w2:GetTile(lbx, lby).fg
                    if blocknya ~= 0 then
                        bot2:HitTile(lbx, lby)
                    elseif blocknya == 0 then
                        break
                    end
                end
                Sleep(60)
                CollectItems2(25)
                break
            elseif htpnb2 == false then
                break
            end
            lbx = bot2:GetLocal().pos_x / 32
            lby = bot2:GetLocal().pos_y / 32
            bot2:PlaceTile(lbx, lby,  5666)
            while true do
                Sleep(200)
                blocknya = w2:GetTile(lbx, lby).fg
                if blocknya ~= 0 then
                    bot2:HitTile(lbx, lby)
                elseif blocknya == 0 then
                    break
                end
            end
            Sleep(60)
            CollectItems2(25)
        end
    end

    local function breakkb2()
        CollectItems2(25)
        while true do
            if getItemCount2(5666) == 0 then
                lbx = bot2:GetLocal().pos_x / 32
                lby = bot2:GetLocal().pos_y / 32
                while true do
                    Sleep(200)
                    blocknya = w2:GetTile(lbx, lby).fg
                    if blocknya ~= 0 then
                        bot2:HitTile(lbx, lby)
                    elseif blocknya == 0 then
                        break
                    end
                end
                Sleep(60)
                CollectItems2(25)
                break
            elseif getItemCount2(5667) >= 180 then
                gbx = bot2:GetLocal().pos_x / 32
                gby = bot2:GetLocal().pos_y / 32
                bot2:FindPath(1,0)
                Sleep(500)
                faceSide2()
                Sleep(500)
                dropItem2(5667)
                Sleep(500)
                bot2:FindPath(gbx, gby)
                Sleep(500)
            elseif htpnb2 == false then
                break
            end
            lbx = bot2:GetLocal().pos_x / 32
            lby = bot2:GetLocal().pos_y / 32
            bot2:PlaceTile(lbx, lby,  5666)
            while true do
                Sleep(200)
                blocknya = w2:GetTile(lbx, lby).fg
                if blocknya ~= 0 then
                    bot2:HitTile(lbx, lby)
                elseif blocknya == 0 then
                    break
                end
            end
            Sleep(60)
            CollectItems2(25)
        end
    end
------------------------------------------------------------------------- harvest tree
    local function ht2()
        for _, tile in pairs(w2:GetTiles()) do
            if getItemCount2(5666) >= 150  then
                break
            elseif getItemCount2(5667) >= 180 then
                break
            elseif htpnb2 == false then
                break
            end
            if tile.pos_x == 99 and tile.pos_y == 53 then
                breakkb2()
                Sleep(2000)
                for _, tiles in pairs(w2:GetTiles()) do
                    if tiles.fg ==5666 then
                        bot2:FindPath(tiles.pos_x, tiles.pos_y)
                        Sleep(300)
                        lbx = bot2:GetLocal().pos_x / 32
                        lby = bot2:GetLocal().pos_y / 32
                        while true do
                            Sleep(1000)
                            blocknya = w2:GetTile(lbx, lby).fg
                            if blocknya ~= 0 then
                                bot2:HitTile(lbx, lby)
                            elseif blocknya == 0 then
                                break
                            end
                        end
                        Sleep(60)
                        CollectItems2(25)
                        if tiles.pos_x == 99 and tile.pos_y == 53 then
                            break
                        end
                    end
                end
                bot2:Say("Auto HTPNB done, beralih ke auto PT")
                Sleep(500)
                htpnb2 = false
                pt2 = true
                break
            end
            if tile.fg == 5667 then
                bot2:FindPath(tile.pos_x, tile.pos_y)
                bot2:HitTile(tile.pos_x,tile.pos_y)
                CollectItemsb2()
                Sleep(251)
                lbx = bot2:GetLocal().pos_x / 32
                lby = bot2:GetLocal().pos_y / 32
                if w2:GetTile(lbx + 1,lby).fg ~= 5667 then
                    CollectItemsb2()
                    Sleep(2000)
                end
            end
        end
    end
------------------------------------------------------------------------- auto plant
    local function autoplant2(seedID, tileID, delay)
        delay=delay or 500
        for _,v in pairs(w2:GetTiles()) do
            if getItemCount2(5667) < 6 then
                Sleep(2000)
                break
            end
            if pt2 == false then
                bot2:Say("oke berhenti")
                break
            end
            if v.pos_x == 99 and v.pos_y == 53 then
                bot2:Say("Auto PT done")
                gbx = bot2:GetLocal().pos_x / 32
                gby = bot2:GetLocal().pos_y / 32
                bot2:FindPath(1,0)
                Sleep(500)
                faceSide2()
                Sleep(500)
                dropItem2(5667)
                Sleep(500)
                bot2:SendPacket(2, "action|respawn")
                Sleep(500)
                pt2 = false
                break
            end
            local fg2=w2:GetTile(v.pos_x, v.pos_y+1).fg
            if fg2==0 then 
                goto SKIP 
            end
            if v.fg==0 and fg2==(tileID or fg2) then
                while w2:GetTile(v.pos_x, v.pos_y).fg~=seedID do
                    if not hasItem2(seedID) then 
                        break 
                    end
                    bot2:FindPath(v.pos_x, v.pos_y)
                    bot2:PlaceTile(v.pos_x, v.pos_y, 5667)
                    Sleep(delay)
                end
            end
            if v.fg==0 and fg2==(8 or fg2) then
                while w2:GetTile(v.pos_x, v.pos_y).fg~=seedID do
                    if not hasItem2(seedID) then 
                        break 
                    end
                    bot2:FindPath(v.pos_x, v.pos_y)
                    bot2:PlaceTile(v.pos_x, v.pos_y, 5667)
                    Sleep(delay)
                end
            end
            if v.fg==0 and fg2==(10 or fg2) then
                while w2:GetTile(v.pos_x, v.pos_y).fg~=seedID do
                    if not hasItem2(seedID) then 
                        break 
                    end
                    bot2:FindPath(v.pos_x, v.pos_y)
                    bot2:PlaceTile(v.pos_x, v.pos_y, 5667)
                    Sleep(delay)
                end
            end

            ::SKIP::
        end
    end 
------------------------------------------------------------------------- hook2
    local function hook2(current_bot, vlist, netid, delay)
        if vlist[0] == "OnConsoleMessage" and vlist[1]:find("!htpnb")  then
            bot2:Say("HTPNB ON")
            bot2:Move(3)
            bot2:Move(3)
            bot2:Move(3)
            htpnb2 = true
        elseif vlist[0] == "OnConsoleMessage" and vlist[1]:find("!pt")  then
            bot2:Say("PT ON")
            bot2:Move(3)
            bot2:Move(3)
            bot2:Move(3)
            pt2 = true
        elseif vlist[0] == "OnConsoleMessage" and vlist[1]:find("!res")  then
            bot2:SendPacket(2, "action|respawn")
        elseif vlist[0] == "OnConsoleMessage" and vlist[1]:find("!mu")  then
            bot2:Move(1)
        elseif vlist[0] == "OnConsoleMessage" and vlist[1]:find("!md")  then
            bot2:Move(2)
        elseif vlist[0] == "OnConsoleMessage" and vlist[1]:find("!ml")  then
            bot2:Move(3)
        elseif vlist[0] == "OnConsoleMessage" and vlist[1]:find("!mr")  then
            bot2:Move(4)
        elseif vlist[0] == "OnConsoleMessage" and vlist[1]:find("!in")  then
            bot2:Say("Oke, aku masuk brok")
            drbx = bot2:GetLocal().pos_x / 32
            drby = bot2:GetLocal().pos_y / 32
            door2(drbx, drby)
            logulang2 = true
        elseif vlist[0] == "OnConsoleMessage" and vlist[1]:find("!nwarp")  then
            bot2:Warp(vlist[1]:match("!nwarp (.+)"))
        elseif vlist[0] == "OnConsoleMessage" and vlist[1]:find("!warp")  then
            bot2:Warp(vlist[1]:match("!warp (.+)"))
            logulang2 = true
        elseif vlist[0] == "OnConsoleMessage" and vlist[1]:find("!gems")  then
            bot2:Say(bot2.gems)
        elseif vlist[0] == "OnConsoleMessage" and vlist[1]:find("!stop")  then
            bot2:Say("Oke stop")
            htpnb2 = false
            pt2 = false
        elseif vlist[0] == "OnConsoleMessage" and vlist[1]:find("!log")  then
            bot2:Say("Tungu...")
            logulang2 = true
        end
    end
    bot2:AddCallback(VARIANTLIST, "hook2", hook2)
------------------------------------------------------------------------- main
    while true do
        if logulang2 == true then
            Sleep(10000)
            if w2 ~= nil then
                bot2:Say("Login ulang dulu")
            end
            bot2:SendPacket(3, "action|quit")
            Sleep(500)
            bot2:Connect()
            Sleep(10000)
            while bot2.connected == false do
                Sleep(10000)
                bot2:Connect()
            end
            bot2 = GetBot(bots[2])
            Sleep(500)
            w2 = bot2:GetWorld()
            logulang2 = false
            Sleep(500)
            bot2:AddCallback(VARIANTLIST, "hook2", hook2)
            if w2 ~= nil then
                bot2:Say("udah selesai login")
            end
        end
        if htpnb2 == true then
            w2 = bot2:GetWorld()
            if getItemCount2(5666) <150 and getItemCount2(5667) <180 then
                ht2()
            elseif getItemCount2(5666) >= 150 and getItemCount2(5667) < 180 then
                breakk2()
            elseif getItemCount2(5667) >= 180 then
                gbx = bot2:GetLocal().pos_x / 32
                gby = bot2:GetLocal().pos_y / 32
                bot2:FindPath(1,0)
                Sleep(500)
                faceSide2()
                Sleep(500)
                dropItem2(5667)
                Sleep(500)
                if getItemCount2(5028) >= 100 then
                    if getItemCount2(5028) >= 100 then
                      trashAllItems(5028, 100)
                      Sleep(2000)
                    end
                    if getItemCount2(5032) >= 100 then
                      trashAllItems(5032, 100)
                      Sleep(2000)
                    end
                    if getItemCount2(5034) >= 100 then
                      trashAllItems(5034, 100)
                      Sleep(2000)
                    end
                    if getItemCount2(5036) >= 100 then
                      trashAllItems(5036, 100)
                      Sleep(2000)
                    end
                    if getItemCount2(5038) >= 100 then
                      trashAllItems(5038, 100)
                      Sleep(2000)
                    end
                    if getItemCount2(5040) >= 100 then
                      trashAllItems(5040, 100)
                      Sleep(2000)
                    end
                    if getItemCount2(5042) >= 100 then
                      trashAllItems(5042, 100)
                      Sleep(2000)
                    end
                    if getItemCount2(5044) >= 100 then
                      trashAllItems(5044, 100)
                      Sleep(2000)
                    end
                    if getItemCount2(7162) >= 100 then
                      trashAllItems(7162, 100)
                      Sleep(2000)
                    end
                    if getItemCount2(7164) >= 100 then
                      trashAllItems(7164, 100)
                      Sleep(2000)
                    end
                  end
                bot2:FindPath(gbx, gby)
                Sleep(500)
            end
        end
        if pt2 == true then
            w2 = bot2:GetWorld()
            if getItemCount2(5667) > 5 then
                autoplant2(5667, 2, 330)
            elseif getItemCount2(5667) < 6 then
                bot2:FindPath(0, 0)
                Sleep(500)
                CollectItems2(25)
                Sleep(2000)
                if getItemCount2(5667) <= 5 then
                    bot2:Say("Seed habis berhenti cuy")
                    pt2 = false
                end
            end
        end
        Sleep(2000)
    end
end)

-------------------------------------------------------------------------------------------------------
----------------------------------------------Runthread 3----------------------------------------------
-------------------------------------------------------------------------------------------------------
RunThread(function()
    bot3 = daftarbot[3]
    if bot3 == nil then
        return
    end
    w3 = bot3:GetWorld()
    htpnb3 = false
    pt3 = false
    if w3 ~= nil then
        bot3:Say("Created by Finer")
    end
    logulang3 = false
    local function CollectItems3(range)
        plr = bot3:GetLocal()
        if plr ~= nil then
            for _, obj in pairs(bot3:GetWorld():GetObjects()) do
                if math.abs(obj.pos_x - plr.pos_x) <= range and math.abs(obj.pos_y - plr.pos_y) <= range then
                    pkt = GamePacket()
                    pkt.type = 11
                    pkt.int_data = obj.index
                    pkt.pos_x = obj.pos_x
                    pkt.pos_y = obj.pos_y
                    bot3:SendPacketRaw(pkt)
                end
            end
        end
    end
    local function CollectItemsb3()
        plr = bot3:GetLocal()
        if plr ~= nil then
            for _, obj in pairs(bot3:GetWorld():GetObjects()) do
                if math.abs(obj.pos_x - plr.pos_x) <= 50 and math.abs(obj.pos_y - plr.pos_y) <= 75 then
                    pkt = GamePacket()
                    pkt.type = 11
                    pkt.int_data = obj.index
                    pkt.pos_x = obj.pos_x
                    pkt.pos_y = obj.pos_y
                    bot3:SendPacketRaw(pkt)
                end
            end
        end
    end
    function door3(x, y)
        pkt3 = GamePacket()
        pkt3.type = 7
        pkt3.int_data = 18
        pkt3.tile_x = x
        pkt3.tile_y = y
        pkt3.pos_x = bot3:GetLocal().pos_x
        pkt3.pos_y = bot3:GetLocal().pos_y
        bot3:SendPacketRaw(pkt3)
    end
    local function hasItem3(id)
        inv3 = bot3:GetInventory()
        invs3 = inv3:GetItem(id).amount
        if invs3 ~= 0 then
            return true
        else
            return false
        end
    end
    local function trashAllItems(itemid, amount)
        bot3:SendPacket(2, "action|trash\n|itemID|".. itemid)
        bot3:SendPacket(2, "action|dialog_return\ndialog_name|trash_item\nitemID|"..itemid.."|\ncount|".. amount)
    end
    local function getItemCount3(id)
        inven3 = bot3:GetInventory()
        if inven3:GetItem(id) == nil then
            return 0
        else 
            return inven3:GetItem(id).amount
        end
    end
    

    function dropItem3(itemID)
        count = getItemCount3(itemID)
        hideDrop = true
        bot3:SendPacket(2, "action|drop\n|itemID|" .. itemID)
        bot3:SendPacket(2, "action|dialog_return\ndialog_name|drop_item\nitemID|" .. itemID .. "|\ncount|" .. count)
        Sleep(175)
        hideDrop = false
    end

    function faceSide3()
        pkt = GamePacket()
        pkt.type = 0
        pkt.pos_x = bot3:GetLocal().pos_x
        pkt.pos_y = bot3:GetLocal().pos_y
        pkt.flags = 48
        bot3:SendPacketRaw(pkt)
    end
------------------------------------------------------------------------- pnb
    local function breakk3()
        CollectItems3(25)
        while true do
            if getItemCount3(5666) == 0 then
                lcx = bot3:GetLocal().pos_x / 32
                lcy = bot3:GetLocal().pos_y / 32
                while true do
                    Sleep(200)
                    blocknya = w3:GetTile(lcx, lcy).fg
                    if blocknya ~= 0 then
                        bot3:HitTile(lcx, lcy)
                    elseif blocknya == 0 then
                        break
                    end
                end
                Sleep(60)
                CollectItems3(25)
                break
            elseif getItemCount3(5667) >= 180 then
                lcx = bot3:GetLocal().pos_x / 32
                lcy = bot3:GetLocal().pos_y / 32
                while true do
                    Sleep(200)
                    blocknya = w3:GetTile(lcx, lcy).fg
                    if blocknya ~= 0 then
                        bot3:HitTile(lcx, lcy)
                    elseif blocknya == 0 then
                        break
                    end
                end
                Sleep(60)
                CollectItems3(25)
                break
            elseif htpnb3 == false then
                break
            end
            lcx = bot3:GetLocal().pos_x / 32
            lcy = bot3:GetLocal().pos_y / 32
            bot3:PlaceTile(lcx, lcy,  5666)
            while true do
                Sleep(200)
                blocknya = w3:GetTile(lcx, lcy).fg
                if blocknya ~= 0 then
                    bot3:HitTile(lcx, lcy)
                elseif blocknya == 0 then
                    break
                end
            end
            Sleep(60)
            CollectItems3(25)
        end
    end

    local function breakkb3()
        CollectItems3(25)
        while true do
            if getItemCount3(5666) == 0 then
                lcx = bot3:GetLocal().pos_x / 32
                lcy = bot3:GetLocal().pos_y / 32
                while true do
                    Sleep(200)
                    blocknya = w3:GetTile(lcx, lcy).fg
                    if blocknya ~= 0 then
                        bot3:HitTile(lcx, lcy)
                    elseif blocknya == 0 then
                        break
                    end
                end
                Sleep(60)
                CollectItems3(25)
                break
            elseif getItemCount3(5667) >= 180 then
                gcx = bot3:GetLocal().pos_x / 32
                gcy = bot3:GetLocal().pos_y / 32
                bot3:FindPath(1,0)
                Sleep(500)
                faceSide3()
                Sleep(500)
                dropItem3(5667)
                Sleep(500)
                bot3:FindPath(gcx, gcy)
                Sleep(500)
            elseif htpnb3 == false then
                break
            end
            lcx = bot3:GetLocal().pos_x / 32
            lcy = bot3:GetLocal().pos_y / 32
            bot3:PlaceTile(lcx, lcy,  5666)
            while true do
                Sleep(200)
                blocknya = w3:GetTile(lcx, lcy).fg
                if blocknya ~= 0 then
                    bot3:HitTile(lcx, lcy)
                elseif blocknya == 0 then
                    break
                end
            end
            Sleep(60)
            CollectItems3(25)
        end
    end
------------------------------------------------------------------------- harvest tree
    local function ht3()
        for _, tile in pairs(w3:GetTiles()) do
            if getItemCount3(5666) >= 150  then
                break
            elseif getItemCount3(5667) >= 180 then
                break
            elseif htpnb3 == false then
                break
            end
            if tile.pos_x == 99 and tile.pos_y == 53 then
                breakkb3()
                Sleep(2000)
                for _, tiles in pairs(w3:GetTiles()) do
                    if tiles.fg ==5666 then
                        bot3:FindPath(tiles.pos_x, tiles.pos_y)
                        Sleep(300)
                        lcx = bot3:GetLocal().pos_x / 32
                        lcy = bot3:GetLocal().pos_y / 32
                        while true do
                            Sleep(1000)
                            blocknya = w3:GetTile(lcx, lcy).fg
                            if blocknya ~= 0 then
                                bot3:HitTile(lcx, lcy)
                            elseif blocknya == 0 then
                                break
                            end
                        end
                        Sleep(60)
                        CollectItems3(25)
                        if tiles.pos_x == 99 and tile.pos_y == 53 then
                            break
                        end
                    end
                end
                bot3:Say("Auto HTPNB done, beralih ke auto PT")
                Sleep(500)
                htpnb3 = false
                pt3 = true
                break
            end
            if tile.fg == 5667 then
                bot3:FindPath(tile.pos_x, tile.pos_y)
                bot3:HitTile(tile.pos_x,tile.pos_y)
                CollectItemsb3()
                Sleep(251)
                lcx = bot3:GetLocal().pos_x / 32
                lcy = bot3:GetLocal().pos_y / 32
                if w3:GetTile(lcx + 1,lcy).fg ~= 5667 then
                    CollectItemsb3()
                    Sleep(2000)
                end
            end
        end
    end
------------------------------------------------------------------------- auto plant
    local function autoplant3(seedID, tileID, delay)
        delay=delay or 500
        for _,v in pairs(w3:GetTiles()) do
            if getItemCount3(5667) < 6 then
                Sleep(2000)
                break
            end
            if pt3 == false then
                bot3:Say("oke berhenti")
                break
            end
            if v.pos_x == 99 and v.pos_y == 53 then
                bot3:Say("Auto PT done")
                gcx = bot3:GetLocal().pos_x / 32
                gcy = bot3:GetLocal().pos_y / 32
                bot3:FindPath(1,0)
                Sleep(500)
                faceSide3()
                Sleep(500)
                dropItem3(5667)
                Sleep(500)
                bot3:SendPacket(2, "action|respawn")
                Sleep(500)
                pt3 = false
                break
            end
            local fg3=w3:GetTile(v.pos_x, v.pos_y+1).fg
            if fg3==0 then 
                goto SKIP 
            end
            if v.fg==0 and fg3==(tileID or fg3) then
                while w3:GetTile(v.pos_x, v.pos_y).fg~=seedID do
                    if not hasItem3(seedID) then 
                        break 
                    end
                    bot3:FindPath(v.pos_x, v.pos_y)
                    bot3:PlaceTile(v.pos_x, v.pos_y, 5667)
                    Sleep(delay)
                end
            end
            if v.fg==0 and fg3==(8 or fg3) then
                while w3:GetTile(v.pos_x, v.pos_y).fg~=seedID do
                    if not hasItem3(seedID) then 
                        break 
                    end
                    bot3:FindPath(v.pos_x, v.pos_y)
                    bot3:PlaceTile(v.pos_x, v.pos_y, 5667)
                    Sleep(delay)
                end
            end
            if v.fg==0 and fg3==(10 or fg3) then
                while w3:GetTile(v.pos_x, v.pos_y).fg~=seedID do
                    if not hasItem3(seedID) then 
                        break 
                    end
                    bot3:FindPath(v.pos_x, v.pos_y)
                    bot3:PlaceTile(v.pos_x, v.pos_y, 5667)
                    Sleep(delay)
                end
            end

            ::SKIP::
        end
    end 
------------------------------------------------------------------------- hook3
    local function hook3(current_bot, vlist, netid, delay)
        if vlist[0] == "OnConsoleMessage" and vlist[1]:find("!htpnb")  then
            bot3:Say("HTPNB ON")
            bot3:Move(3)
            bot3:Move(3)
            bot3:Move(3)
            htpnb3 = true
        elseif vlist[0] == "OnConsoleMessage" and vlist[1]:find("!pt")  then
            bot3:Say("PT ON")
            bot3:Move(3)
            bot3:Move(3)
            bot3:Move(3)
            pt3 = true
        elseif vlist[0] == "OnConsoleMessage" and vlist[1]:find("!res")  then
            bot3:SendPacket(2, "action|respawn")
        elseif vlist[0] == "OnConsoleMessage" and vlist[1]:find("!mu")  then
            bot3:Move(1)
        elseif vlist[0] == "OnConsoleMessage" and vlist[1]:find("!md")  then
            bot3:Move(2)
        elseif vlist[0] == "OnConsoleMessage" and vlist[1]:find("!ml")  then
            bot3:Move(3)
        elseif vlist[0] == "OnConsoleMessage" and vlist[1]:find("!mr")  then
            bot3:Move(4)
        elseif vlist[0] == "OnConsoleMessage" and vlist[1]:find("!in")  then
            bot3:Say("Oke, aku masuk brok")
            drcx = bot3:GetLocal().pos_x / 32
            drcy = bot3:GetLocal().pos_y / 32
            door3(drcx, drcy)
            logulang3 = true
        elseif vlist[0] == "OnConsoleMessage" and vlist[1]:find("!nwarp")  then
            bot3:Warp(vlist[1]:match("!nwarp (.+)"))
        elseif vlist[0] == "OnConsoleMessage" and vlist[1]:find("!warp")  then
            bot3:Warp(vlist[1]:match("!warp (.+)"))
            logulang3 = true
        elseif vlist[0] == "OnConsoleMessage" and vlist[1]:find("!gems")  then
            bot3:Say(bot3.gems)
        elseif vlist[0] == "OnConsoleMessage" and vlist[1]:find("!stop")  then
            bot3:Say("Oke stop")
            htpnb3 = false
            pt3 = false
        elseif vlist[0] == "OnConsoleMessage" and vlist[1]:find("!log")  then
            bot3:Say("Tungu...")
            logulang3 = true
        end
    end
    bot3:AddCallback(VARIANTLIST, "hook3", hook3)
------------------------------------------------------------------------- main
    while true do
        if logulang3 == true then
            Sleep(10000)
            if w3 ~= nil then
                bot3:Say("Login ulang dulu")
            end
            bot3:SendPacket(3, "action|quit")
            Sleep(500)
            bot3:Connect()
            Sleep(10000)
            while bot3.connected == false do
                Sleep(10000)
                bot3:Connect()
            end
            bot3 = GetBot(bots[3])
            Sleep(500)
            w3 = bot3:GetWorld()
            logulang3 = false
            Sleep(500)
            bot3:AddCallback(VARIANTLIST, "hook3", hook3)
            if w3 ~= nil then
                bot3:Say("udah selesai login")
            end
        end
        if htpnb3 == true then
            w3 = bot3:GetWorld()
            if getItemCount3(5666) <150 and getItemCount3(5667) <180 then
                ht3()
            elseif getItemCount3(5666) >= 150 and getItemCount3(5667) < 180 then
                breakk3()
            elseif getItemCount3(5667) >= 180 then
                gcx = bot3:GetLocal().pos_x / 32
                gcy = bot3:GetLocal().pos_y / 32
                bot3:FindPath(1,0)
                Sleep(500)
                faceSide3()
                Sleep(500)
                dropItem3(5667)
                Sleep(500)
                if getItemCount3(5028) >= 100 then
                    if getItemCount3(5028) >= 100 then
                      trashAllItems(5028, 100)
                      Sleep(2000)
                    end
                    if getItemCount3(5032) >= 100 then
                      trashAllItems(5032, 100)
                      Sleep(2000)
                    end
                    if getItemCount3(5034) >= 100 then
                      trashAllItems(5034, 100)
                      Sleep(2000)
                    end
                    if getItemCount3(5036) >= 100 then
                      trashAllItems(5036, 100)
                      Sleep(2000)
                    end
                    if getItemCount3(5038) >= 100 then
                      trashAllItems(5038, 100)
                      Sleep(2000)
                    end
                    if getItemCount3(5040) >= 100 then
                      trashAllItems(5040, 100)
                      Sleep(2000)
                    end
                    if getItemCount3(5042) >= 100 then
                      trashAllItems(5042, 100)
                      Sleep(2000)
                    end
                    if getItemCount3(5044) >= 100 then
                      trashAllItems(5044, 100)
                      Sleep(2000)
                    end
                    if getItemCount3(7162) >= 100 then
                      trashAllItems(7162, 100)
                      Sleep(2000)
                    end
                    if getItemCount3(7164) >= 100 then
                      trashAllItems(7164, 100)
                      Sleep(2000)
                    end
                  end
                bot3:FindPath(gcx, gcy)
                Sleep(500)
            end
        end
        if pt3 == true then
            w3 = bot3:GetWorld()
            if getItemCount3(5667) > 5 then
                autoplant3(5667, 2, 330)
            elseif getItemCount3(5667) < 6 then
                bot3:FindPath(0, 0)
                Sleep(500)
                CollectItems3(25)
                Sleep(2000)
                if getItemCount3(5667) <= 5 then
                    bot3:Say("Seed habis berhenti cuy")
                    pt3 = false
                end
            end
        end
        Sleep(2000)
    end
end)
-------------------------------------------------------------------------------------------------------
----------------------------------------------Runthread 4----------------------------------------------
-------------------------------------------------------------------------------------------------------
RunThread(function()
    bot4 = daftarbot[4]
    if bot4 == nil then
        return
    end
    w4 = bot4:GetWorld()
    htpnb4 = false
    pt4 = false
    if w4 ~= nil then
        bot4:Say("Created by Finer")
    end
    logulang4 = false
    local function CollectItems4(range)
        plr = bot4:GetLocal()
        if plr ~= nil then
            for _, obj in pairs(bot4:GetWorld():GetObjects()) do
                if math.abs(obj.pos_x - plr.pos_x) <= range and math.abs(obj.pos_y - plr.pos_y) <= range then
                    pkt = GamePacket()
                    pkt.type = 11
                    pkt.int_data = obj.index
                    pkt.pos_x = obj.pos_x
                    pkt.pos_y = obj.pos_y
                    bot4:SendPacketRaw(pkt)
                end
            end
        end
    end
    local function CollectItemsb4()
        plr = bot4:GetLocal()
        if plr ~= nil then
            for _, obj in pairs(bot4:GetWorld():GetObjects()) do
                if math.abs(obj.pos_x - plr.pos_x) <= 50 and math.abs(obj.pos_y - plr.pos_y) <= 75 then
                    pkt = GamePacket()
                    pkt.type = 11
                    pkt.int_data = obj.index
                    pkt.pos_x = obj.pos_x
                    pkt.pos_y = obj.pos_y
                    bot4:SendPacketRaw(pkt)
                end
            end
        end
    end
    function door4(x, y)
        pkt4 = GamePacket()
        pkt4.type = 7
        pkt4.int_data = 18
        pkt4.tile_x = x
        pkt4.tile_y = y
        pkt4.pos_x = bot4:GetLocal().pos_x
        pkt4.pos_y = bot4:GetLocal().pos_y
        bot4:SendPacketRaw(pkt4)
    end
    local function hasItem4(id)
        inv4 = bot4:GetInventory()
        invs4 = inv4:GetItem(id).amount
        if invs4 ~= 0 then
            return true
        else
            return false
        end
    end
    local function trashAllItems(itemid, amount)
        bot4:SendPacket(2, "action|trash\n|itemID|".. itemid)
        bot4:SendPacket(2, "action|dialog_return\ndialog_name|trash_item\nitemID|"..itemid.."|\ncount|".. amount)
    end
    local function getItemCount4(id)
        inven4 = bot4:GetInventory()
        if inven4:GetItem(id) == nil then
            return 0
        else 
            return inven4:GetItem(id).amount
        end
    end
    

    function dropItem4(itemID)
        count = getItemCount4(itemID)
        hideDrop = true
        bot4:SendPacket(2, "action|drop\n|itemID|" .. itemID)
        bot4:SendPacket(2, "action|dialog_return\ndialog_name|drop_item\nitemID|" .. itemID .. "|\ncount|" .. count)
        Sleep(175)
        hideDrop = false
    end

    function faceSide4()
        pkt = GamePacket()
        pkt.type = 0
        pkt.pos_x = bot4:GetLocal().pos_x
        pkt.pos_y = bot4:GetLocal().pos_y
        pkt.flags = 48
        bot4:SendPacketRaw(pkt)
    end
------------------------------------------------------------------------- pnb
    local function breakk4()
        CollectItems4(25)
        while true do
            if getItemCount4(5666) == 0 then
                ldx = bot4:GetLocal().pos_x / 32
                ldy = bot4:GetLocal().pos_y / 32
                while true do
                    Sleep(200)
                    blocknya = w4:GetTile(ldx, ldy).fg
                    if blocknya ~= 0 then
                        bot4:HitTile(ldx, ldy)
                    elseif blocknya == 0 then
                        break
                    end
                end
                Sleep(60)
                CollectItems4(25)
                break
            elseif getItemCount4(5667) >= 180 then
                ldx = bot4:GetLocal().pos_x / 32
                ldy = bot4:GetLocal().pos_y / 32
                while true do
                    Sleep(200)
                    blocknya = w4:GetTile(ldx, ldy).fg
                    if blocknya ~= 0 then
                        bot4:HitTile(ldx, ldy)
                    elseif blocknya == 0 then
                        break
                    end
                end
                Sleep(60)
                CollectItems4(25)
                break
            elseif htpnb4 == false then
                break
            end
            ldx = bot4:GetLocal().pos_x / 32
            ldy = bot4:GetLocal().pos_y / 32
            bot4:PlaceTile(ldx, ldy,  5666)
            while true do
                Sleep(200)
                blocknya = w4:GetTile(ldx, ldy).fg
                if blocknya ~= 0 then
                    bot4:HitTile(ldx, ldy)
                elseif blocknya == 0 then
                    break
                end
            end
            Sleep(60)
            CollectItems4(25)
        end
    end

    local function breakkb4()
        CollectItems4(25)
        while true do
            if getItemCount4(5666) == 0 then
                ldx = bot4:GetLocal().pos_x / 32
                ldy = bot4:GetLocal().pos_y / 32
                while true do
                    Sleep(200)
                    blocknya = w4:GetTile(ldx, ldy).fg
                    if blocknya ~= 0 then
                        bot4:HitTile(ldx, ldy)
                    elseif blocknya == 0 then
                        break
                    end
                end
                Sleep(60)
                CollectItems4(25)
                break
            elseif getItemCount4(5667) >= 180 then
                gdx = bot4:GetLocal().pos_x / 32
                gdy = bot4:GetLocal().pos_y / 32
                bot4:FindPath(1,0)
                Sleep(500)
                faceSide4()
                Sleep(500)
                dropItem4(5667)
                Sleep(500)
                bot4:FindPath(gdx, gdy)
                Sleep(500)
            elseif htpnb4 == false then
                break
            end
            ldx = bot4:GetLocal().pos_x / 32
            ldy = bot4:GetLocal().pos_y / 32
            bot4:PlaceTile(ldx, ldy,  5666)
            while true do
                Sleep(200)
                blocknya = w4:GetTile(ldx, ldy).fg
                if blocknya ~= 0 then
                    bot4:HitTile(ldx, ldy)
                elseif blocknya == 0 then
                    break
                end
            end
            Sleep(60)
            CollectItems4(25)
        end
    end
------------------------------------------------------------------------- harvest tree
    local function ht4()
        for _, tile in pairs(w4:GetTiles()) do
            if getItemCount4(5666) >= 150  then
                break
            elseif getItemCount4(5667) >= 180 then
                break
            elseif htpnb4 == false then
                break
            end
            if tile.pos_x == 99 and tile.pos_y == 53 then
                breakkb4()
                Sleep(2000)
                for _, tiles in pairs(w4:GetTiles()) do
                    if tiles.fg ==5666 then
                        bot4:FindPath(tiles.pos_x, tiles.pos_y)
                        Sleep(300)
                        ldx = bot4:GetLocal().pos_x / 32
                        ldy = bot4:GetLocal().pos_y / 32
                        while true do
                            Sleep(1000)
                            blocknya = w4:GetTile(ldx, ldy).fg
                            if blocknya ~= 0 then
                                bot4:HitTile(ldx, ldy)
                            elseif blocknya == 0 then
                                break
                            end
                        end
                        Sleep(60)
                        CollectItems4(25)
                        if tiles.pos_x == 99 and tile.pos_y == 53 then
                            break
                        end
                    end
                end
                bot4:Say("Auto HTPNB done, beralih ke auto PT")
                Sleep(500)
                htpnb4 = false
                pt4 = true
                break
            end
            if tile.fg == 5667 then
                bot4:FindPath(tile.pos_x, tile.pos_y)
                bot4:HitTile(tile.pos_x,tile.pos_y)
                CollectItemsb4()
                Sleep(251)
                ldx = bot4:GetLocal().pos_x / 32
                ldy = bot4:GetLocal().pos_y / 32
                if w4:GetTile(ldx + 1,ldy).fg ~= 5667 then
                    CollectItemsb4()
                    Sleep(2000)
                end
            end
        end
    end
------------------------------------------------------------------------- auto plant
    local function autoplant4(seedID, tileID, delay)
        delay=delay or 500
        for _,v in pairs(w4:GetTiles()) do
            if getItemCount4(5667) < 6 then
                Sleep(2000)
                break
            end
            if pt4 == false then
                bot4:Say("oke berhenti")
                break
            end
            if v.pos_x == 99 and v.pos_y == 53 then
                bot4:Say("Auto PT done")
                gdx = bot4:GetLocal().pos_x / 32
                gdy = bot4:GetLocal().pos_y / 32
                bot4:FindPath(1,0)
                Sleep(500)
                faceSide4()
                Sleep(500)
                dropItem4(5667)
                Sleep(500)
                bot4:SendPacket(2, "action|respawn")
                Sleep(500)
                pt4 = false
                break
            end
            local fg4=w4:GetTile(v.pos_x, v.pos_y+1).fg
            if fg4==0 then 
                goto SKIP 
            end
            if v.fg==0 and fg4==(tileID or fg4) then
                while w4:GetTile(v.pos_x, v.pos_y).fg~=seedID do
                    if not hasItem4(seedID) then 
                        break 
                    end
                    bot4:FindPath(v.pos_x, v.pos_y)
                    bot4:PlaceTile(v.pos_x, v.pos_y, 5667)
                    Sleep(delay)
                end
            end
            if v.fg==0 and fg4==(8 or fg4) then
                while w4:GetTile(v.pos_x, v.pos_y).fg~=seedID do
                    if not hasItem4(seedID) then 
                        break 
                    end
                    bot4:FindPath(v.pos_x, v.pos_y)
                    bot4:PlaceTile(v.pos_x, v.pos_y, 5667)
                    Sleep(delay)
                end
            end
            if v.fg==0 and fg4==(10 or fg4) then
                while w4:GetTile(v.pos_x, v.pos_y).fg~=seedID do
                    if not hasItem4(seedID) then 
                        break 
                    end
                    bot4:FindPath(v.pos_x, v.pos_y)
                    bot4:PlaceTile(v.pos_x, v.pos_y, 5667)
                    Sleep(delay)
                end
            end

            ::SKIP::
        end
    end 
------------------------------------------------------------------------- hook4
    local function hook4(current_bot, vlist, netid, delay)
        if vlist[0] == "OnConsoleMessage" and vlist[1]:find("!htpnb")  then
            bot4:Say("HTPNB ON")
            bot4:Move(3)
            bot4:Move(3)
            bot4:Move(3)
            htpnb4 = true
        elseif vlist[0] == "OnConsoleMessage" and vlist[1]:find("!pt")  then
            bot4:Say("PT ON")
            bot4:Move(3)
            bot4:Move(3)
            bot4:Move(3)
            pt4 = true
        elseif vlist[0] == "OnConsoleMessage" and vlist[1]:find("!res")  then
            bot4:SendPacket(2, "action|respawn")
        elseif vlist[0] == "OnConsoleMessage" and vlist[1]:find("!mu")  then
            bot4:Move(1)
        elseif vlist[0] == "OnConsoleMessage" and vlist[1]:find("!md")  then
            bot4:Move(2)
        elseif vlist[0] == "OnConsoleMessage" and vlist[1]:find("!ml")  then
            bot4:Move(3)
        elseif vlist[0] == "OnConsoleMessage" and vlist[1]:find("!mr")  then
            bot4:Move(4)
        elseif vlist[0] == "OnConsoleMessage" and vlist[1]:find("!in")  then
            bot4:Say("Oke, aku masuk brok")
            drdx = bot4:GetLocal().pos_x / 32
            drdy = bot4:GetLocal().pos_y / 32
            door4(drdx, drdy)
            logulang4 = true
        elseif vlist[0] == "OnConsoleMessage" and vlist[1]:find("!nwarp")  then
            bot4:Warp(vlist[1]:match("!nwarp (.+)"))
        elseif vlist[0] == "OnConsoleMessage" and vlist[1]:find("!warp")  then
            bot4:Warp(vlist[1]:match("!warp (.+)"))
            logulang4 = true
        elseif vlist[0] == "OnConsoleMessage" and vlist[1]:find("!gems")  then
            bot4:Say(bot4.gems)
        elseif vlist[0] == "OnConsoleMessage" and vlist[1]:find("!stop")  then
            bot4:Say("Oke stop")
            htpnb4 = false
            pt4 = false
        elseif vlist[0] == "OnConsoleMessage" and vlist[1]:find("!log")  then
            bot4:Say("Tungu...")
            logulang4 = true
        end
    end
    bot4:AddCallback(VARIANTLIST, "hook4", hook4)
------------------------------------------------------------------------- main
    while true do
        if logulang4 == true then
            Sleep(10000)
            if w4 ~= nil then
                bot4:Say("Login ulang dulu")
            end
            bot4:SendPacket(3, "action|quit")
            Sleep(500)
            bot4:Connect()
            Sleep(10000)
            while bot4.connected == false do
                Sleep(10000)
                bot4:Connect()
            end
            bot4 = GetBot(bots[4])
            Sleep(500)
            w4 = bot4:GetWorld()
            logulang4 = false
            Sleep(500)
            bot4:AddCallback(VARIANTLIST, "hook4", hook4)
            if w4 ~= nil then
                bot4:Say("udah selesai login")
            end
        end
        if htpnb4 == true then
            w4 = bot4:GetWorld()
            if getItemCount4(5666) <150 and getItemCount4(5667) <180 then
                ht4()
            elseif getItemCount4(5666) >= 150 and getItemCount4(5667) < 180 then
                breakk4()
            elseif getItemCount4(5667) >= 180 then
                gdx = bot4:GetLocal().pos_x / 32
                gdy = bot4:GetLocal().pos_y / 32
                bot4:FindPath(1,0)
                Sleep(500)
                faceSide4()
                Sleep(500)
                dropItem4(5667)
                Sleep(500)
                if getItemCount4(5028) >= 100 then
                    if getItemCount4(5028) >= 100 then
                      trashAllItems(5028, 100)
                      Sleep(2000)
                    end
                    if getItemCount4(5032) >= 100 then
                      trashAllItems(5032, 100)
                      Sleep(2000)
                    end
                    if getItemCount4(5034) >= 100 then
                      trashAllItems(5034, 100)
                      Sleep(2000)
                    end
                    if getItemCount4(5036) >= 100 then
                      trashAllItems(5036, 100)
                      Sleep(2000)
                    end
                    if getItemCount4(5038) >= 100 then
                      trashAllItems(5038, 100)
                      Sleep(2000)
                    end
                    if getItemCount4(5040) >= 100 then
                      trashAllItems(5040, 100)
                      Sleep(2000)
                    end
                    if getItemCount4(5042) >= 100 then
                      trashAllItems(5042, 100)
                      Sleep(2000)
                    end
                    if getItemCount4(5044) >= 100 then
                      trashAllItems(5044, 100)
                      Sleep(2000)
                    end
                    if getItemCount4(7162) >= 100 then
                      trashAllItems(7162, 100)
                      Sleep(2000)
                    end
                    if getItemCount4(7164) >= 100 then
                      trashAllItems(7164, 100)
                      Sleep(2000)
                    end
                  end
                bot4:FindPath(gdx, gdy)
                Sleep(500)
            end
        end
        if pt4 == true then
            w4 = bot4:GetWorld()
            if getItemCount4(5667) > 5 then
                autoplant4(5667, 2, 330)
            elseif getItemCount4(5667) < 6 then
                bot4:FindPath(0, 0)
                Sleep(500)
                CollectItems4(25)
                Sleep(2000)
                if getItemCount4(5667) <= 5 then
                    bot4:Say("Seed habis berhenti cuy")
                    pt4 = false
                end
            end
        end
        Sleep(2000)
    end
end)

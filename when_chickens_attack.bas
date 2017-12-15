'When Chickens Attack!!!
'By Bennett Cyphers, 2008
'--------------------------------------------------------------------------------
'The situation: You are a wandering adventurer who has just stumbled upon a
'village, seemingly overrun by chickens of the mutant, evil variety. No one
'knows where they came from, but everyone knows a wierd sense of irony as they
'flee from hordes of chickens. To stop the bombardment and save the town,
'you, the hero, must battle your way to the Boss Chicken, and defeat him.
'Buy weapons, armor, and heal yourself in the town. Explore the outskirts of
'town first, they're less dangerous. To win, you'll have to defeat all the forest
'and all the mountain chickens, working your way up to slaying the Boss...
'--------------------------------------------------------------------------------

nomainwin

playerlevel = 1
levelup = 10
totalhealth = 100
currenthealth = 100
totalmag = 40
currentmag = 40
attackpwr = 4
attackbonus = 0
attackpower = attackpwr + attackbonus
deflvl= 1
magpower = 10
exp = 0
lives = 5
gold = 100
weapons = 0
head = 0
body = 0
shield = 0
legs = 0
suit = 0
mountainchx = 50
forestchx = 50
weapon$ = ""
fullbody = legs + head + body + shield

[main]

    WindowWidth = 400
    WindowHeight = 340

    statictext #play.statictext1, "WHEN CHICKENS ATTACK!!!", 90, 20, 300, 30
    statictext #play.statictext2, "Health", 20, 255, 40, 20
    statictext #play.statictext3, "Magic", 80, 255, 30, 20
    statictext #play.statictext4, "Exp", 140, 255, 50, 20
    statictext #play.statictext5, "Level", 200, 255, 50, 20
    statictext #play.statictext6, "Lives", 260, 255, 50, 20
    statictext #play.statictext7, "Gold", 320, 255, 50, 20

    textbox #play.healthbox, 20, 280, 50, 20
    textbox #play.magbox, 80, 280, 50, 20
    textbox #play.expbox, 140, 280, 50, 20
    textbox #play.levelbox, 200, 280, 50, 20
    textbox #play.lifebox, 260, 280, 50, 20
    textbox #play.goldbox, 320, 280, 50, 20

    button #play.button1, "Forest", [goforest], UL, 90, 60, 60, 30
    button #play.button2, "Mountains", [gomountains], UL, 250, 60, 60, 30
    button #play.button3, "Outskirts", [gooutskirts], UL, 170, 110, 60, 30
    button #play.button4, "Town", [gotown], UL, 175, 150, 50, 30
    button #play.button5, "Save", [savegame], UL, 100, 200, 50, 30
    button #play.button6, "Load", [loadgame], UL, 250, 200, 50, 30

    open "WHEN CHICKENS ATTACK!!!" for window_nf as #play

    print #play.statictext1, "!font Arial 0 20"
    print #play.healthbox, currenthealth; "/" ;totalhealth
    print #play.magbox, currentmag; "/" ;totalmag
    print #play.expbox, exp; "/" ; levelup
    print #play.levelbox, playerlevel
    print #play.lifebox, lives
    print #play.goldbox, gold
    print #play.button4, "!setfocus"
    print #play, "trapclose [closeplay]"

    wait

[gotown]

    if towninuse = 0 then
    WindowWidth = 210
    WindowHeight = 200

    button #town.button1, "Armory", [armory], UL, 30, 100, 50, 30
    button #town.button2, "Blacksmith", [blacksmith], UL, 20, 30, 70, 30
    button #town.button3, "Inn", [inn], UL, 120, 30, 50, 30
    button #town.button4, "Chicken Farmer", [farmer], UL, 100, 100, 90, 30
    open "Town" for window_nf as #town
    print #town, "trapclose [exitt]"
    towninuse = 1
    end if

    wait

    [armory]

        if armoryinuse = 0 then
        WindowWidth = 250
        WindowHeight = 300

        statictext #armory.text, "Shopkeeper says: 'Buy something or get out.'", 10, 10, 220, 40

        textbox #armory.textbox, 10, 220, 70, 20

        button #armory.button1, "Helmet, 150g", [buyhelm], UL, 10, 50, 90, 30
        button #armory.button2, "Mail body, 500g", [buymail], UL, 130, 50, 90, 30
        button #armory.button3, "Mail legs, 300g", [buylegs], UL, 10, 100, 90, 30
        button #armory.button4, "Shield, 200g", [buyshield], UL, 130, 100, 90, 30
        button #armory.button5, "Super Suit, 5,000g", [buysuit], UL, 10, 150, 110, 30
        button #armory.button6, "Back", [exitar], UL, 160, 150, 40, 30
        button #armory.button7, "Unequip Armor", [unequipa], UL, 150, 220, 80, 30

        open "Armory" for window_nf as #armory

        print #armory.textbox, gold; " g"
        print #armory, "trapclose [exitar]"
        armoryinuse = 1
        end if

        wait

        [buyhelm]
            if gold < 150 then
                notice "Hey, what are you trying to pull?"
            end if
            if head > 0 then
                notice "You can't wear all that. Take some stuff off or don't buy it."
            end if
            if gold >= 150 then
                if head = 0 then
                    gold = gold - 150
                    deflvl = deflvl*1.1
                    head = head + 1

                    print #armory.button1, "!disable"
                    print #armory.textbox, gold;" g"

                    notice "You have successfully purchased your overpriced merchendice."
                end if
            end if
            wait

        [buymail]
            if gold < 500 then
                notice "Hey, what are you trying to pull?"
            end if
            if body > 0 then
                notice "You can't wear all that. Take some stuff off or don't buy it."
            end if
            if gold >= 500 then
                if body = 0 then
                    gold = gold - 500
                    deflvl = deflvl*1.3
                    body = body + 1

                    print #armory.button2, "!disable"
                    print #armory.textbox, gold;" g"

                    notice "You have successfully purchased your overpriced merchendice."
                end if
            end if
            wait

        [buylegs]
            if gold < 300 then
                notice "Hey, what are you trying to pull?"
            end if
            if legs > 0 then
                notice "You can't wear all that. Take some stuff off or don't buy it."
            end if
            if gold >= 300 then
                if legs = 0 then
                    gold = gold - 300
                    deflvl = deflvl*1.2
                    legs = legs + 1

                    print #armory.button3, "!disable"
                    print #armory.textbox, gold;" g"

                    notice "You have successfully purchased your overpriced merchendice."
                end if
            end if
            wait

        [buyshield]
            if gold < 200 then
                notice "Hey, what are you trying to pull?"
            end if
            if shield > 0 then
                notice "You can't wear all that. Take some stuff off or don't buy it."
            end if
            if gold >= 200 then
                if shield = 0 then
                    gold = gold - 200
                    deflvl = deflvl*1.15
                    shield = shield + 1

                    print #armory.button4, "!disable"
                    print #armory.textbox, gold;" g"

                    notice "You have successfully purchased your overpriced merchendice."
                end if
            end if
            wait

        [buysuit]
            if gold < 5000 then
                notice "Hey, what are you trying to pull?"
            end if
            if fullbody > 0 then
                notice "You can't wear all that. Take some stuff off or don't buy it."
            end if
            if gold >= 5000 then
                if fullbody = 0 then
                    gold = gold - 5000
                    deflvl = deflvl*3
                    head = head + 1
                    body = body + 1
                    shield = shield + 1
                    legs = legs + 1
                    suit = suit + 1

                    print #armory.button5, "!disable"
                    print #armory.textbox, gold;" g"

                    notice "You have successfully purchased your Super Suit!!!"
                end if
            end if
            wait

        [unequipa]
            gold = gold + head*100 + body*250 + legs*150 + shield*100 + suit*1800

            head = 0
            body = 0
            shield = 0
            legs = 0
            suit = 0
            deflvl = 1

            print #armory.button1, "!enable"
            print #armory.button2, "!enable"
            print #armory.button3, "!enable"
            print #armory.button4, "!enable"
            print #armory.button5, "!enable"
            print #armory.textbox, gold;" g"

            notice "You can't help but feel ripped off as you sell back all your armor for half price."

            wait

        [exitar]
            Close #armory
            print #play.healthbox, currenthealth; "/" ;totalhealth
            print #play.magbox, currentmag; "/" ;totalmag
            print #play.expbox, exp; "/" ; levelup
            print #play.levelbox, playerlevel
            print #play.lifebox, lives
            print #play.goldbox, gold
            armoryinuse = 0
            wait

    [blacksmith]

    if blacksmithinuse = 0 then

        WindowWidth = 250
        WindowHeight = 300

        statictext #smith.text, "Shopkeeper says: 'Buy something or get out.'", 10, 10, 220, 40

        textbox #smith.textbox, 10, 220, 70, 20

        button #smith.button1, "Club, 50g", [buyclub], UL, 10, 50, 90, 30
        button #smith.button2, "Dagger, 150g", [buydagger], UL, 130, 50, 90, 30
        button #smith.button3, "Mace, 300g", [buymace], UL, 10, 100, 90, 30
        button #smith.button4, "Broad Sword, 800g", [buysword], UL, 120, 100, 100, 30
        button #smith.button5, "Chainsaw, 10,000g", [buysaw], UL, 10, 150, 110, 30
        button #smith.button6, "Back", [exitbs], UL, 160, 150, 40, 30
        button #smith.button7, "Unequip Weapons", [unequips], UL, 120, 210, 100, 30

        open "Blacksmith" for window_nf as #smith

        print #smith.textbox, gold;" g"
        print #smith, "trapclose [exitbs]"
        blacksmithinuse = 1
    end if

    wait

        [buyclub]
            if gold < 50 then
                notice "Hey, what are you trying to pull?"
                wait
            end if
            if weapons > 0 then
                notice "You can only equip one weapon at a time."
            end if
            if gold >= 50 then
                if weapons = 0 then
                    gold = gold - 50
                    attackbonus = attackbonus + 4
                    attackpower = attackpwr + attackbonus
                    weapons = 1
                    weapon$ = "club"

                    print #smith.textbox, gold;" g"
                    print #smith.button1, "!disable"

                    notice "You are now armed and dangerous. Come again soon!"
                end if
            end if

            wait

        [buydagger]
            if gold < 150 then
                notice "Hey, what are you trying to pull?"
                wait
            end if
            if weapons > 0 then
                notice "You can only equip one weapon at a time."
            end if
            if gold >= 150 then
                if weapons = 0 then
                    gold = gold - 150
                    attackbonus = attackbonus + 6
                    attackpower = attackpwr + attackbonus
                    weapons = 1
                    weapon$ = "dagger"

                    print #smith.textbox, gold;" g"
                    print #smith.button2, "!disable"

                    notice "You are now armed and dangerous. Come again soon!"
                end if
            end if

            wait

        [buymace]
            if gold < 300 then
                notice "Hey, what are you trying to pull?"
                wait
            end if
            if weapons > 0 then
                notice "You can only equip one weapon at a time."
            end if
            if gold >= 300 then
                if weapons = 0 then
                    gold = gold - 300
                    attackbonus = attackbonus + 10
                    attackpower = attackpwr + attackbonus
                    weapons = 1
                    weapon$ = "mace"

                    print #smith.textbox, gold;" g"
                    print #smith.button3, "!disable"

                    notice "You are now armed and dangerous. Come again soon!"
                end if
            end if

            wait

        [buysword]
            if gold < 800 then
                notice "Hey, what are you trying to pull?"
                wait
            end if
            if weapons > 0 then
                notice "You can only equip one weapon at a time."
            end if
            if gold >= 800 then
                if weapons = 0 then
                    gold = gold - 500
                    attackbonus = attackbonus + 20
                    attackpower = attackpwr + attackbonus
                    weapons = 1
                    weapon$ = "sword"

                    print #smith.textbox, gold;" g"
                    print #smith.button4, "!disable"

                    notice "You are now armed and dangerous. Come again soon!"
                end if
            end if

            wait

        [buysaw]
            if gold < 10000 then
                notice "Hey, what are you trying to pull?"
                wait
            end if
            if weapons > 0 then
                notice "You can only equip one weapon at a time."
            end if
            if gold >= 10000 then
                if weapons = 0 then
                    gold = gold - 10000
                    attackbonus = attackbonus + 50
                    attackpower = attackpwr + attackbonus
                    weapons = 1
                    weapon$ = "saw"

                    print #smith.textbox, gold
                    print #smith.button5, "!disable"

                    notice "You are now the reason the Chupacabra myths exist. Happy hunting!"
                end if
            end if

            wait

        [unequips]
            if weapon$ = "club" then
                weapon$ = ""
                weapons = 0
                gold = gold + 25
                attackpower = attackpwr

                print #smith.textbox, gold;" g"
                print #smith.button1, "!enable"

                notice "You sell back your weapon for a scrawny 50%"
            end if
            if weapon$ = "dagger" then
                weapon$ = ""
                weapons = 0
                gold = gold + 75
                attackpower = attackpwr

                print #smith.textbox, gold;" g"
                print #smith.button2, "!enable"

                notice "You sell back your weapon for a scrawny 50%"
            end if
            if weapon$ = "mace" then
                weapon$ = ""
                weapons = 0
                gold = gold + 150
                attackpower = attackpwr

                print #smith.textbox, gold;" g"
                print #smith.button3, "!enable"

                notice "You sell back your weapon for a scrawny 50%"
            end if
            if weapon$ = "sword" then
                weapon$ = ""
                weapons = 0
                gold = gold + 400
                attackpower = attackpwr

                print #smith.textbox, gold;" g"
                print #smith.button4, "!enable"

                notice "You sell back your weapon for a scrawny 50%"
            end if
            if weapon$ = "saw" then
                weapon$ = ""
                weapons = 0
                gold = gold + 5000
                attackpower = attackpwr

                print #smith.textbox, gold;" g"
                print #smith.button5, "!enable"

                notice "You sell back your weapon for a scrawny 50%"
            end if

            wait

        [exitbs]

            Close #smith
            print #play.healthbox, currenthealth; "/" ;totalhealth
            print #play.magbox, currentmag; "/" ;totalmag
            print #play.expbox, exp; "/" ; levelup
            print #play.levelbox, playerlevel
            print #play.lifebox, lives
            print #play.goldbox, gold;" g"
            blacksmithinuse = 0
            wait

    [inn]

    if inninuse = 0 then

        WindowWidth = 200
        WindowHeight = 200

        button #inn.button1, "Heal, 50 gold", [heal], UL, 50, 50, 90, 30
        button #inn.button2, "Back", [backinn], UL, 75, 100, 50, 30
        open "Inn" for window_nf as #inn
        print #inn, "trapclose [backinn]"
        inninuse = 1
    end if

    wait

        [heal]

            if gold < 50 then
                notice "Not enough gold"
            end if
            if gold >= 50 then
                gold = gold - 50
                currenthealth = totalhealth
                currentmag = totalmag
                notice "You are refreshed and ready to bash more chickens."
                print #play.healthbox, currenthealth; "/" ;totalhealth
                print #play.magbox, currentmag; "/" ;totalmag
            end if
            wait

        [backinn]

            close #inn
            inninuse = 0
            wait

    [farmer]

        notice "Farm"+chr$(13)+"The crazy farmer runs around in circles, screaming "+chr$(13)+"'Them chickens is everywhere!!! EVERYWHERE!!!'"+chr$(13)+" You back away slowly."
        wait

    [exitt]

        close #town
        print #play.healthbox, currenthealth; "/" ;totalhealth
        print #play.magbox, currentmag; "/" ;totalmag
        print #play.expbox, exp; "/" ; levelup
        print #play.levelbox, playerlevel
        print #play.lifebox, lives
        print #play.goldbox, gold
        print #play.button4, "!setfocus"
        towninuse = 0

        wait

[gooutskirts]

if osinuse = 0 then

    WindowWidth = 200
    WindowHeight = 150

    button #outskirts.button1, "Explore", [battleos], UL, 20, 45, 50, 30
    button #outskirts.button2, "Run Away", [backos], UL, 100, 45, 70, 30
    open "Outskirts" for window_nf as #outskirts
    print #outskirts, "trapclose [backos]"
    osinuse = 1
end if

wait

    [battleos]

    if battleinuse = 0 then

        osinuse = 0
        chickenlevel = int(rnd(1)*4) + playerlevel - 2
            if chickenlevel < 1 then chickenlevel = 1
            if chickenlevel > 12 then chickenlevel = 12
        chickenhp = 20 + chickenlevel*5
        chickengold = int(rnd(1)*10) + (chickenlevel*2)
        chicken$ = "Chicken Minion"
        chickenexp = 1

        battleinuse = 1

        goto [battle]

    end if

    wait



    [backos]

        close #outskirts
        print #play.healthbox, currenthealth; "/" ;totalhealth
        print #play.magbox, currentmag; "/" ;totalmag
        print #play.expbox, exp; "/" ; levelup
        print #play.levelbox, playerlevel
        print #play.lifebox, lives
        print #play.goldbox, gold
        print #play.button4, "!setfocus"
        osinuse = 0
        wait

[gomountains]

if mtninuse = 0 then

    WindowWidth = 200
    WindowHeight = 150

    button #mountains.button1, "Explore", [battlemt], UL, 20, 45, 50, 30
    button #mountains.button2, "Run Away", [backmt], UL, 100, 45, 70, 30
    open "Mountains" for window_nf as #mountains
    print #mountains, "trapclose [backmt]"
    mtninuse = 1
end if

    wait

    [battlemt]

    if battleinuse = 0 then

        mtninuse = 0

        if mountainchx <= 0 then
            if forestchx > 0 then
                notice "You have defeated all the chickens in the mountains. There is nothing left to fight."
            end if
            if forestchx <= 0 goto [bossbattle]
        end if

    if mountainchx > 0 then
        chickenlevel = int(rnd(1)*5) + playerlevel - 2
            if chickenlevel < 1 then chickenlevel = 1
            if chickenlevel > 25 then chickenlevel = 25
        chickenhp = 100 + chickenlevel*10
        chickengold = int(rnd(1)*30) + (chickenlevel*2)
        chickenexp = 3
        chicken$ = "Mountain Chicken"

        goto [battle]

        battleinuse = 1
    end if
    end if

    wait


    [backmt]

        close #mountains
        print #play.healthbox, currenthealth; "/" ;totalhealth
        print #play.magbox, currentmag; "/" ;totalmag
        print #play.expbox, exp; "/" ; levelup
        print #play.levelbox, playerlevel
        print #play.lifebox, lives
        print #play.goldbox, gold
        print #play.button4, "!setfocus"
        mtninuse = 0
        wait

[goforest]

if forinuse = 0 then

    WindowWidth = 200
    WindowHeight = 150

    button #forest.button1, "Explore", [battlefo], UL, 20, 45, 50, 30
    button #forest.button2, "Run Away", [backfo], UL, 100, 45, 70, 30
    open "Forest" for window_nf as #forest
    print #forest, "trapclose [backfo]"
    forinuse = 1
end if

wait

    [battlefo]

    if battleinuse = 0 then

        forinuse = 0

    if forestchx <= 0 then
        if mountainchx > 0 then
            notice "You have defeated all the chickens in the forest. There is nothing left to fight."
        end if
        if mountainchx <= 0 goto [bossbattle]
    end if

    if forestchx > 0 then
        chickenlevel = int(rnd(1)*5) + playerlevel - 2
            if chickenlevel < 1 then chickenlevel = 1
            if chickenlevel > 25 then chickenlevel = 25
        chickenhp = 100 + chickenlevel*10
        chickengold = int(rnd(1)*30) + (chickenlevel*2)
        chickenexp = 3
        chicken$ = "Forest Chicken"

        goto [battle]

        battleinuse = 1
    end if
    end if

    wait

    [backfo]

        close #forest
        print #play.healthbox, currenthealth; "/" ;totalhealth
        print #play.magbox, currentmag; "/" ;totalmag
        print #play.expbox, exp; "/" ; levelup
        print #play.levelbox, playerlevel
        print #play.lifebox, lives
        print #play.goldbox, gold
        print #play.button4, "!setfocus"
        forinuse = 0
        wait

[levelup]

    levelup = levelup + playerlevel*10
    playerlevel = playerlevel + 1
    attackpwr = attackpwr + 2
    totalhealth = totalhealth + (playerlevel*10)
    currenthealth = totalhealth
    totalmag = totalmag + (playerlevel*5)
    currentmag = totalmag
    magpower = magpower + 2
    attackpower = attackpwr + attackbonus

    notice "Yay!!! You leveled up. Now go out, train longer, and try to level up so you can get this message again!!!"

    print #play.healthbox, currenthealth; "/" ;totalhealth
    print #play.magbox, currentmag; "/" ;totalmag
    print #play.expbox, exp; "/" ; levelup
    print #play.levelbox, playerlevel
    print #play.lifebox, lives
    print #play.goldbox, gold
    print #play.button4, "!setfocus"

    wait

[dead]

    lives = lives - 1
    if lives > 0 then
        currenthealth = totalhealth
        currentmag = totalmag
        attackbonus = 0
        attackpower = attackpwr + attackbonus
        lives = lives
        gold = 0
        weapons = 0
        head = 0
        body = 0
        shield = 0
        legs = 0
        suit = 0
        weapon$ = ""
        fullbody = legs + head + body + shield

        notice "Ugh! You lost a life! You also lost all your weapons, armor, and gold!"
    end if
    if lives = 0 then
        playerlevel = 1
        totalhealth = 100
        currenthealth = 100
        totalmag = 40
        currentmag = 40
        attackpwr = 4
        attackbonus = 0
        attackpower = attackpwr + attackbonus
        deflvl= 1
        magpower = 10
        exp = 0
        lives = 5
        gold = 100
        weapons = 0
        head = 0
        body = 0
        shield = 0
        legs = 0
        suit = 0
        weapon$ = ""
        fullbody = legs + head + body + shield

        notice "Oh man, you're out of lives. Time to load a different character or start over."
    end if

    print #play.healthbox, currenthealth; "/" ;totalhealth
    print #play.magbox, currentmag; "/" ;totalmag
    print #play.expbox, exp; "/" ; levelup
    print #play.levelbox, playerlevel
    print #play.lifebox, lives
    print #play.goldbox, gold
    print #play.button4, "!setfocus"

    wait

[battle]

        WindowWidth = 300
        WindowHeight = 300

        statictext #battle.statictext1, "You fight a "+chicken$+"!", 10, 10, 150, 30
        statictext #battle.statictext2, "Your HP", 30, 180, 50, 20
        statictext #battle.statictext3, "Chicken HP", 220, 180, 60, 20
        statictext #battle.statictext4, "Magic", 100, 180, 50, 20
        statictext #battle.statictext5, "Chicken Level = ", 50, 50, 80, 30

        textbox #battle.healthbox, 30, 200, 50, 20
        textbox #battle.magbox, 100, 200, 50, 20
        textbox #battle.chickenbox, 220, 200, 50, 20
        textbox #battle.lvlbox, 130, 50, 50, 20

        button #battle.button1, "Attack", [attack], UL, 50, 115, 50, 30
        button #battle.button2, "Magic", [magic], UL, 125, 115, 50, 30
        button #battle.button3, "Run away", [run], UL, 200, 115, 60, 30

        open "Fight!" for window_nf as #battle

        print #battle.healthbox, currenthealth; "/" ;totalhealth
        print #battle.magbox, currentmag; "/" ;totalmag
        print #battle.chickenbox, chickenhp
        print #battle.lvlbox, chickenlevel
        print #battle, "trapclose [run]"

        wait


        [attack]

            currenthealth = currenthealth - int(int(rnd(1)*4) - int(rnd(1)*chickenlvl)/deflvl)
            chickenhp = chickenhp - int(rnd(1)*4) - int(rnd(1)*attackpower*0.5)
            print #battle.healthbox, currenthealth; "/" ;totalhealth
            print #battle.chickenbox, chickenhp
            if currenthealth < 1 then
                currenthealth = 0
                close #battle
                battleinuse = 0
                goto [dead]
            end if
            if chickenhp < 1 then
                chickenhp = 0
                exp = exp + chickenexp
                gold = gold + chickengold
                print #battle.chickenbox, chickenhp
                notice "You defeat the evil "+chicken$+" and recieve ";chickenexp;" exp, plus " ;chickengold; " gold."
                close #battle
                battleinuse = 0
                if exp = levelup then
                    goto [levelup]
                end if
                print #play.healthbox, currenthealth; "/" ;totalhealth
                print #play.magbox, currentmag; "/" ;totalmag
                print #play.expbox, exp; "/" ; levelup
                print #play.levelbox, playerlevel
                print #play.lifebox, lives
                print #play.goldbox, gold
            end if
            wait

        [magic]

            if currentmag < 10 then
                notice "You don't have enough magic power!"
            end if
            if currentmag >= 10 then
                currenthealth = currenthealth - int(int(rnd(1)*4) - int(rnd(1)*chickenlevel)/deflvl)
                chickenhp = chickenhp - magpower - int(rnd(1)*4) + 2
                currentmag = currentmag - 10
                print #battle.healthbox, currenthealth; "/" ;totalhealth
                print #battle.chickenbox, chickenhp
                print #battle.magbox, currentmag; "/" ;totalmag
                if currenthealth < 1 then
                    currenthealth = 0
                    close #battle
                    battleinuse = 0
                    goto [dead]
                end if
                if chickenhp < 1 then
                    chickenhp = 0
                    exp = exp + chickenexp
                    gold = gold + chickengold
                    print #battle.chickenbox, chickenhp
                    notice "You defeat the evil "+chicken$+" and receive ";chickenexp;" exp, plus " ;chickengold; " gold."
                    close #battle
                    battleinuse = 0
                    if exp = levelup then
                        goto [levelup]
                    end if
                    print #play.healthbox, currenthealth; "/" ;totalhealth
                    print #play.magbox, currentmag; "/" ;totalmag
                    print #play.expbox, exp; "/" ; levelup
                    print #play.levelbox, playerlevel
                    print #play.lifebox, lives
                    print #play.goldbox, gold
                end if
            end if

            wait

        [run]

            currenthealth = currenthealth - int(rnd(1)*4) - int(rnd(1)*chickenlevel)
            print #battle.healthbox, currenthealth; "/" ;totalhealth
            print #battle.chickenbox, chickenhp
            if currenthealth < 1 then
                currenthealth = 0
                close #battle
                battleinuse = 0
                goto [dead]
            end if
            if currenthealth >= 1 then
                notice "You are damaged, but manage to get away."
                close #battle
                battleinuse = 0
                print #play.healthbox, currenthealth; "/" ;totalhealth
                print #play.magbox, currentmag; "/" ;totalmag
                print #play.expbox, exp; "/" ; levelup
                print #play.levelbox, playerlevel
                print #play.lifebox, lives
                print #play.goldbox, gold
            end if

            wait

[bossbattle]

    [goboss]

    WindowWidth = 200
    WindowHeight = 150

    button #boss.button1, "Enter Lair", [battlebo], UL, 20, 45, 70, 30
    button #boss.button2, "Run Away", [backbo], UL, 100, 45, 70, 30
    open "Boss battle" for window_nf as #boss
    print #boss, "trapclose [backbo]"

    notice "You approach a dark and menacing lair, the home of the Boss Chicken. Do you dare to enter?"

    wait

    [battlebo]

        close #boss

        bosslevel = 10
        bosshp = 500

        WindowWidth = 300
        WindowHeight = 300

        statictext #battlebo.statictext1, "You fight the Boss Chicken!", 10, 10, 150, 30
        statictext #battlebo.statictext2, "Your HP", 30, 180, 50, 20
        statictext #battlebo.statictext3, "Chicken HP", 220, 180, 60, 20
        statictext #battlebo.statictext4, "Magic", 100, 180, 50, 20
        statictext #battlebo.statictext5, "Chicken Level = ", 50, 50, 80, 30

        textbox #battlebo.healthbox, 30, 200, 50, 20
        textbox #battlebo.magbox, 100, 200, 50, 20
        textbox #battlebo.bossbox, 220, 200, 50, 20
        textbox #battlebo.lvlbox, 130, 50, 50, 20

        button #battlebo.button1, "Attack", [attackbo], UL, 50, 115, 50, 30
        button #battlebo.button2, "Magic", [magicbo], UL, 125, 115, 50, 30

        open "Boss Fight!" for window_nf as #battlebo

        print #battlebo.healthbox, currenthealth; "/" ;totalhealth
        print #battlebo.magbox, currentmag; "/" ;totalmag
        print #battlebo.bossbox, bosshp
        print #battlebo.lvlbox, bosslevel
        print #battlebo, "trapclose [runbo]"

        wait

        [attackbo]

            currenthealth = currenthealth - int(int(rnd(1)*30)/deflvl)- 10
            bosshp = bosshp - int(rnd(1)*4) - int(rnd(1)*attackpower*0.5)
            print #battlebo.healthbox, currenthealth; "/" ;totalhealth
            print #battlebo.bossbox, bosshp
            if currenthealth < 1 then
                currenthealth = 0
                close #battlebo
                goto [dead]
            end if
            if bosshp < 1 then
                close #battlebo
                goto [wingame]
            end if
            wait

        [magicbo]

            if currentmag < 10 then
                notice "You don't have enough magic power!"
            end if
            if currentmag >= 10 then
                currenthealth = currenthealth - int(int(rnd(1)*30)/deflvl)- 10
                bosshp = bosshp - magpower - int(rnd(1)*4) + 2
                currentmag = currentmag - 10
                print #battlebo.healthbox, currenthealth; "/" ;totalhealth
                print #battlebo.bossbox, bosshp
                print #battlebo.magbox, currentmag; "/" ;totalmag
                if currenthealth < 1 then
                    currenthealth = 0
                    close #battlebo
                    goto [dead]
                end if
                if bosshp < 1 then
                    close #battlebo
                    goto [wingame]
                end if
            end if

            wait

        [runbo]

            confirm "You cannot run from a boss fight. If you leave now, "+chr$(13)+"you will automatically forefeit and lose a life. Still quit?"; answer$
            if answer$ = "yes" then
                close #battlebo
                goto [dead]
            end if
            if answer$ = "no" then
                wait
            end if

    [backbo]

        close #boss
        print #play.healthbox, currenthealth; "/" ;totalhealth
        print #play.magbox, currentmag; "/" ;totalmag
        print #play.expbox, exp; "/" ; levelup
        print #play.levelbox, playerlevel
        print #play.lifebox, lives
        print #play.goldbox, gold
        print #play.button4, "!setfocus"
        wait

[wingame]

    notice "The townspeople are eternally endebted to you!!! Play again soon!"
    close #play
    end

[savegame]

if saveinuse = 0 and loadinuse = 0 then

    WindowWidth = 200
    WindowHeight = 150

    statictext #save.statictext, "Enter name of character:", 10, 10, 120, 20
    textbox #save.textbox, 10, 40, 100, 20
    button #save.button1, "OK", [oks], UL, 20, 80, 50, 30
    button #save.button2, "Cancel", [cancels], UL, 100, 80, 50, 30

    open "Save" for window_nf as #save

    print #save, "trapclose [cancels]"
    saveinuse = 1
end if

wait

    [oks]

        print #save.textbox, "!contents? playername$"

        open "save"; playername$;".txt" for output as #savegame
        print #savegame, playerlevel
        print #savegame, levelup
        print #savegame, totalhealth
        print #savegame, currenthealth
        print #savegame, totalmag
        print #savegame, currentmag
        print #savegame, attackpwr
        print #savegame, attackbonus
        print #savegame, deflvl
        print #savegame, magpower
        print #savegame, exp
        print #savegame, lives
        print #savegame, gold
        print #savegame, weapons
        print #savegame, head
        print #savegame, body
        print #savegame, shield
        print #savegame, legs
        print #savegame, suit
        print #savegame, mountainchx
        print #savegame, forestchx
        print #savegame, weapon$
        close #savegame

        notice "You have successfully saved your game."
        close #save

        wait

    [cancels]
        close #save
        saveinuse = 0
        wait

[loadgame]

if loadinuse = 0 and saveinuse = 0 then

    WindowWidth = 200
    WindowHeight = 150

    statictext #load.statictext, "Enter name of character:", 10, 10, 120, 20
    textbox #load.textbox, 10, 40, 100, 20
    button #load.button1, "OK", [okl], UL, 20, 80, 50, 30
    button #load.button2, "Cancel", [cancell], UL, 100, 80, 50, 30

    open "Load" for window_nf as #load

    print #load, "trapclose [cancell]"
    loadinuse = 1
end if

wait

    [okl]

    print #load.textbox, "!contents? loadname$"

        open "save"; loadname$;".txt" for input as #loadgame
        input #loadgame, playerlevel
        input #loadgame, levelup
        input #loadgame, totalhealth
        input #loadgame, currenthealth
        input #loadgame, totalmag
        input #loadgame, currentmag
        input #loadgame, attackpwr
        input #loadgame, attackbonus
        input #loadgame, deflvl
        input #loadgame, magpower
        input #loadgame, exp
        input #loadgame, lives
        input #loadgame, gold
        input #loadgame, weapons
        input #loadgame, head
        input #loadgame, body
        input #loadgame, shield
        input #loadgame, legs
        input #loadgame, suit
        input #loadgame, mountainchx
        input #loadgame, forestchx
        input #loadgame, weapon$
        close #loadgame

        print #play.healthbox, currenthealth; "/" ;totalhealth
        print #play.magbox, currentmag; "/" ;totalmag
        print #play.expbox, exp; "/" ; levelup
        print #play.levelbox, playerlevel
        print #play.lifebox, lives
        print #play.goldbox, gold

        notice "Game successfully loaded."
        close #load

        wait

    [cancell]
        close #load
        loadinuse = 0
        wait

[closeplay]
    close #play
    end



--[[Thanks for downloading my mod !
I hope you'll enjoy it 
You can take a look at the code if you want, but credit me !
made by caimez_
--]]



local So_Many_Cards = RegisterMod("[REP]So many cards",1)



local MANY_CARDS_SPRITESHEET = "gfx/items/pick ups/carddrop_back.png"


local SuperCloth_id = Isaac.GetItemIdByName("Super Cloth")
local cards_itemid = Isaac.GetItemIdByName("Caaaaaaaaaarrrdddssss")
local BiggerDeckId = Isaac.GetTrinketIdByName("Bigger Deck")

So_Many_Cards.COSTUME_CAAARDS= Isaac.GetCostumeIdByPath("gfx/characters/caaards.anm2")

--Id cards/trinkets/items
So_Many_Cards.Items =
{
Putrified_c = Isaac.GetCardIdByName("Putrified"),
Justice_c = Isaac.GetCardIdByName("Justice ?"),
Casino_c = Isaac.GetCardIdByName("Casino"),
water_c = Isaac.GetCardIdByName("Water"),
air_c = Isaac.GetCardIdByName("Air"),
fire_c = Isaac.GetCardIdByName("Fire"),
earth_c = Isaac.GetCardIdByName("Earth"),
gatcha_c = Isaac.GetCardIdByName("Gatcha"),
dmg_c = Isaac.GetCardIdByName("Damage"),
loveIt_c = Isaac.GetCardIdByName("I Love it"),
anarchist_c = Isaac.GetCardIdByName("Anarchist"),
More_items_c = Isaac.GetCardIdByName("More items"),
sale_c = Isaac.GetCardIdByName("Sales"),
solar_system_c = Isaac.GetCardIdByName("The Galaxy"),
key_c = Isaac.GetCardIdByName("Unlock"),
bombs_c = Isaac.GetCardIdByName("Exepelozion"),
batteries_c = Isaac.GetCardIdByName("240 Volts"),
coin_c = Isaac.GetCardIdByName("Jackpot !"),
eternal_c = Isaac.GetCardIdByName("Blessed"),
flies_convert_c = Isaac.GetCardIdByName("Ace of flies"),
bb_hearts_conv_c = Isaac.GetCardIdByName("Ace of souls"),
chest_c = Isaac.GetCardIdByName("Treasure map"),
creep_c = Isaac.GetCardIdByName("Lemon Juice"),
speed_c = Isaac.GetCardIdByName("Swiftness"),
bhearts_drop_c = Isaac.GetCardIdByName("Soul protection"),
et_heart_drop_c = Isaac.GetCardIdByName("Eternal protection"),
double_c = Isaac.GetCardIdByName("Magic trick"),
colorblind_c = Isaac.GetCardIdByName("Colorblind"),
slowness_c = Isaac.GetCardIdByName("Slowness"),
dmg_room_c = Isaac.GetCardIdByName("Spikes"),
fear_c = Isaac.GetCardIdByName("The Fear"),
library_c = Isaac.GetCardIdByName("The Librarian"),
glitch_c = Isaac.GetCardIdByName("3RR0R"),
max_ennemies_c = Isaac.GetCardIdByName("Reduced staff"),
relax_c = Isaac.GetCardIdByName("Relax"),
charge_c = Isaac.GetCardIdByName("Charges !"),
revive_c = Isaac.GetCardIdByName("Another life..."),
soul_double_c = Isaac.GetCardIdByName("2 of soul"),
spiderfly3_c = Isaac.GetCardIdByName("Your only friends"),
genocide_c = Isaac.GetCardIdByName("Genocide"),
no_choice_c = Isaac.GetCardIdByName("Trust"),
golden_h_c = Isaac.GetCardIdByName("Golden Present"),
what_c = Isaac.GetCardIdByName("What ?"),
demon_present_c = Isaac.GetCardIdByName("Demon Present"),
bombs_coin_c = Isaac.GetCardIdByName("Bombs are coins"),
bloat_c = Isaac.GetCardIdByName("EXTERMINATION")

}

local MANY_CARDS =
{
	So_Many_Cards.Items.Putrified_c,
	So_Many_Cards.Items.Justice_c,
  So_Many_Cards.Items.Casino_c,
	So_Many_Cards.Items.water_c,
	So_Many_Cards.Items.air_c,
	So_Many_Cards.Items.fire_c,
	So_Many_Cards.Items.earth_c,
	So_Many_Cards.Items.gatcha_c,
	So_Many_Cards.Items.dmg_c,
	So_Many_Cards.Items.loveIt_c,
	So_Many_Cards.Items.anarchist_c,
	So_Many_Cards.Items.More_items_c,
	So_Many_Cards.Items.sale_c,
	So_Many_Cards.Items.solar_system_c,
	So_Many_Cards.Items.key_c,
	So_Many_Cards.Items.bombs_c,
	So_Many_Cards.Items.batteries_c,
	So_Many_Cards.Items.coin_c,
	So_Many_Cards.Items.eternal_c,
	So_Many_Cards.Items.flies_convert_c,
	So_Many_Cards.Items.bb_hearts_conv_c,
	So_Many_Cards.Items.chest_c,
	So_Many_Cards.Items.creep_c,
	So_Many_Cards.Items.speed_c,
	So_Many_Cards.Items.bhearts_drop_c,
	So_Many_Cards.Items.et_heart_drop_c,
	So_Many_Cards.Items.double_c,
	So_Many_Cards.Items.colorblind_c,
	So_Many_Cards.Items.slowness_c,
	So_Many_Cards.Items.dmg_room_c,
	So_Many_Cards.Items.fear_c,
	So_Many_Cards.Items.library_c,
	So_Many_Cards.Items.glitch_c,
	So_Many_Cards.Items.max_ennemies_c,
	So_Many_Cards.Items.relax_c,
	So_Many_Cards.Items.charge_c,
	So_Many_Cards.Items.revive_c,
	So_Many_Cards.Items.soul_double_c,
	So_Many_Cards.Items.spiderfly3_c,
	So_Many_Cards.Items.genocide_c,
	So_Many_Cards.Items.no_choice_c,
	So_Many_Cards.Items.golden_h_c,
	So_Many_Cards.Items.what_c,
	So_Many_Cards.Items.demon_present_c,
	So_Many_Cards.Items.bombs_coin_c,
	So_Many_Cards.Items.bloat_c
}

local Challenges={
      CHALLENGE_CARDS2 = Isaac.GetChallengeIdByName("It's in the cards 2")
  }



--Card's variable
local bheartsDrop = false
local etheartsDrop = false
local prettyDrop = false
local Revive_room = false
local count_coin_c = 1
local slow_room = 0
local dmg_room = 0
local fear_room = 0
local max_ennemies = 0
local max_ennemies_count = 0
local relax_room = 0
--Item's variables
local already_cloth = false
local cloth_tarot =0
local already_card = false



-- External Item Descriptions support.
if not __eidItemDescriptions then
  __eidItemDescriptions = {}
end
--This part is to make the mod compatible with eid
__eidTrinketDescriptions[BiggerDeckId] = "Modded cards are now 2 times more likely to replace regular cards"
__eidItemDescriptions[SuperCloth_id] = "Every card now triggers an additional modded card#Overridden by Tarot Cloth" --It's very difficult to trigger an other activation with the tarot cloth
__eidItemDescriptions[cards_itemid] = "50% chance that pickups turn into cards#Every time you see a non-card pickup, gives another chance to convert it#Adds Spoon bender"
__eidCardDescriptions[So_Many_Cards.Items.Putrified_c] ="Spawns 4 flies and 2 spiders"
__eidCardDescriptions[So_Many_Cards.Items.Justice_c] = "Spawns  bombs, coin, hearts and keys randomly"
__eidCardDescriptions[So_Many_Cards.Items.Casino_c] ="50% chance to spawn a card, then 1/4,1/8,1/10..."
__eidCardDescriptions[So_Many_Cards.Items.water_c] ="Deals 40 damages and colors enemies in blue"
__eidCardDescriptions[So_Many_Cards.Items.air_c] ="Shrinks enemies"
__eidCardDescriptions[So_Many_Cards.Items.fire_c] ="Burns enemies and colors them in red"
__eidCardDescriptions[So_Many_Cards.Items.earth_c] ="Stuns and immobilises enemies"
__eidCardDescriptions[So_Many_Cards.Items.gatcha_c] ="Spawns a random trinket"
__eidCardDescriptions[So_Many_Cards.Items.dmg_c] ="Grants +1-4 damage until the next damage update"
__eidCardDescriptions[So_Many_Cards.Items.loveIt_c] ="+1HP up"
__eidCardDescriptions[So_Many_Cards.Items.anarchist_c]="Adds 3 black hearts"
__eidCardDescriptions[So_Many_Cards.Items.More_items_c] ="50% chance to add a random item (it can be an active item or a special item)"
__eidCardDescriptions[So_Many_Cards.Items.sale_c]="Gives 20 coins"
__eidCardDescriptions[So_Many_Cards.Items.solar_system_c]="Adds 2 Pretty Flies"
__eidCardDescriptions[So_Many_Cards.Items.key_c]="Gives a key or golden key"
__eidCardDescriptions[So_Many_Cards.Items.bombs_c] = "Gives a bomb or a golden bomb"
__eidCardDescriptions[So_Many_Cards.Items.batteries_c]="Drops 1-3 batteries"
__eidCardDescriptions[So_Many_Cards.Items.coin_c]="Drops 1 coin#For each activation, the amount of dropped money is *2"
__eidCardDescriptions[So_Many_Cards.Items.eternal_c]="Gives an eternal heart"
__eidCardDescriptions[So_Many_Cards.Items.flies_convert_c]="Turns all pickups and enemies flies into blue flies"
__eidCardDescriptions[So_Many_Cards.Items.bb_hearts_conv_c]="Turns all pickups into soulhearts#For each pickup, 50% chance for it to be converted"
__eidCardDescriptions[So_Many_Cards.Items.chest_c]="Spawns 5 chests in the middle of the room"
__eidCardDescriptions[So_Many_Cards.Items.creep_c]="Spawns 4 lemon creeps at each corner of the room#Small and big rooms will cause creeps to spawn out of the borders or in the middle of the room"
__eidCardDescriptions[So_Many_Cards.Items.speed_c]="Grants +0.25 speed until the next speed update"
__eidCardDescriptions[So_Many_Cards.Items.bhearts_drop_c]="While active, each time you take damages, has a chance to drop soulhearts"
__eidCardDescriptions[So_Many_Cards.Items.et_heart_drop_c]="While active, each time you take damages, has a chance to drop eternalhearts"
__eidCardDescriptions[So_Many_Cards.Items.double_c]="Triggers randomly 2 cards effect of the mod"
__eidCardDescriptions[So_Many_Cards.Items.colorblind_c]="Causes all colors to change and even disapear"
__eidCardDescriptions[So_Many_Cards.Items.slowness_c]="For the next 3 rooms, slows all enemies#If you have rooms remaining with this effect, re-activating it will add another 3 rooms"
__eidCardDescriptions[So_Many_Cards.Items.dmg_room_c]="For the next 3 rooms, deals 10 damages to all enemies#If you have rooms remaining with this effect, re-activating it will add another 3 rooms"
__eidCardDescriptions[So_Many_Cards.Items.fear_c]="For the next 3 rooms, fears all enemies#If you have rooms remaining with this effect, re-activating it will add another 3 rooms"
__eidCardDescriptions[So_Many_Cards.Items.library_c]="Teleports you inside a unique library"
__eidCardDescriptions[So_Many_Cards.Items.glitch_c]="Teleports you inside a unique glitch room"
__eidCardDescriptions[So_Many_Cards.Items.max_ennemies_c]="For the next 2 rooms, the maximum number of enemies is 4#If you have rooms remaining with this effect, re-activatng it will add another 2 rooms"
__eidCardDescriptions[So_Many_Cards.Items.relax_c]="The next room doesn't have enemies"
__eidCardDescriptions[So_Many_Cards.Items.charge_c]="Charges your active item"
__eidCardDescriptions[So_Many_Cards.Items.revive_c]="In the current room, if you die, all your redhearts will be refilled instead"
__eidCardDescriptions[So_Many_Cards.Items.soul_double_c]="Duplicates your souls and black hearts#Even if black hearts are counted, it will only add soulhearts"
__eidCardDescriptions[So_Many_Cards.Items.spiderfly3_c]="Multiplies your spiders and flies by *3#If you haven't any spiders or flies, gives you 1 of each"
__eidCardDescriptions[So_Many_Cards.Items.genocide_c]="For the next 2 rooms, kills a type of enemy#If you have rooms remaining with this effect, re-activating it will add another 2 rooms"
__eidCardDescriptions[So_Many_Cards.Items.no_choice_c]="Removes all pedestal items and gives you a random item for each removal (it can be an active item or a special items)"
__eidCardDescriptions[So_Many_Cards.Items.golden_h_c]="Gives you 3 golden hearts"
__eidCardDescriptions[So_Many_Cards.Items.what_c]="Mystery...."
__eidCardDescriptions[So_Many_Cards.Items.demon_present_c]="If you have Additionals (another mod by this creator), gives you the Demon Ring"
__eidCardDescriptions[So_Many_Cards.Items.bombs_coin_c]="Inverts your bombs and your coins"
__eidCardDescriptions[So_Many_Cards.Items.bloat_c]="You hate The Bloat ? Me too. Kill him with this for a reward !"

--If the card called is a modded card
--Test it and make the effect
function So_Many_Cards:onCard(cardId,player)
  
  local player = Isaac.GetPlayer(0)
  local pos = Vector(player.Position.X, player.Position.Y)
  local vel = Vector(0,0)
  local center = Vector(320,300)
  local rng_more = math.random(1,539)
  

  if cardId == So_Many_Cards.Items.Putrified_c then
    SFXManager():Play(SoundEffect.SOUND_FART, 1.0 ,0, false ,1.0)
    player:AddBlueFlies(4,pos,player)
    player:AddBlueSpider(pos)
    player:AddBlueSpider(pos)
    
  elseif cardId == So_Many_Cards.Items.Justice_c then
    SFXManager():Play(SoundEffect.SOUND_BEEP, 1.0 ,0, false ,1.0) 
    local rng =math.random(2,5)
    for i = 1, rng do
      local rng2= math.random(0,3)--bomb,coin,battery,key,heart,soulheart,blackheart
      if rng2 == 0 then
        
        Isaac.Spawn(EntityType.ENTITY_PICKUP,PickupVariant.PICKUP_BOMB,BombSubType.BOMB_NORMAL, Game():GetLevel():GetCurrentRoom():FindFreePickupSpawnPosition(pos, 0, false, true),vel,player)
      elseif rng2 == 1 then
        Isaac.Spawn(EntityType.ENTITY_PICKUP,PickupVariant.PICKUP_COIN,CoinSubType.COIN_PENNY, Game():GetLevel():GetCurrentRoom():FindFreePickupSpawnPosition(pos, 0, false, true),vel,player)
      elseif rng2 == 2 then
        Isaac.Spawn(EntityType.ENTITY_PICKUP,PickupVariant.PICKUP_KEY,KeySubType.KEY_NORMAL, Game():GetLevel():GetCurrentRoom():FindFreePickupSpawnPosition(pos, 0, false, true),vel,player)
      elseif rng2 == 3 then
        local rng3 = math.random(0,2)
        if rng3 ==0 then
          Isaac.Spawn(EntityType.ENTITY_PICKUP,PickupVariant.PICKUP_HEART,HeartSubType.HEART_BLACK, Game():GetLevel():GetCurrentRoom():FindFreePickupSpawnPosition(pos, 0, false, true),vel,player)
        elseif rng3 == 1 then
          Isaac.Spawn(EntityType.ENTITY_PICKUP,PickupVariant.PICKUP_HEART,HeartSubType.HEART_SOUL, Game():GetLevel():GetCurrentRoom():FindFreePickupSpawnPosition(pos, 0, false, true),vel,player)
        else
          Isaac.Spawn(EntityType.ENTITY_PICKUP,PickupVariant.PICKUP_HEART,HeartSubType.HEART_FULL, Game():GetLevel():GetCurrentRoom():FindFreePickupSpawnPosition(pos, 0, false, true),vel,player)
        end
      end
    end
    
  elseif cardId == So_Many_Cards.Items.Casino_c then
    SFXManager():Play(SoundEffect.SOUND_COIN_SLOT, 1.0 ,0, false ,1.0)
    local count_casino = 1
    local again_casino = true
    while again_casino do
      if math.random(0,count_casino)== 0 then
        Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TAROTCARD, 0, Vector(player.Position.X, player.Position.Y), Vector(0,0), nil)
        count_casino = count_casino +1
      else
        again_casino = false
      end
    end
    
  elseif cardId == So_Many_Cards.Items.water_c then
    SFXManager():Play(SoundEffect.SOUND_WATER_DROP, 1.0 ,0, false ,1.0)
    local entities = Isaac.GetRoomEntities()
    for i = 1, #entities do
      local color = Color(0,0,1,1,0,0,0)
        if(entities[ i ]:IsVulnerableEnemy()) then
           entities[ i ]:SetColor(color,100,0,0,0)
           entities[ i ]:TakeDamage(50, 0, EntityRef(player),0)
        end
    end
    
  elseif cardId == So_Many_Cards.Items.fire_c then
    SFXManager():Play(SoundEffect.SOUND_FIREDEATH_HISS, 1.0 ,0, false ,1.0)
    local entities = Isaac.GetRoomEntities()
    for i = 1, #entities do
      local color = Color(1,0,0,1,0,0,0)
        if(entities[ i ]:IsVulnerableEnemy()) then
           entities[ i ]:SetColor(color,150,0,0,0)
           entities[ i ]:AddBurn(EntityRef(player),60,15)
        end
    end
    
  elseif cardId == So_Many_Cards.Items.earth_c then
    SFXManager():Play(SoundEffect.SOUND_HELLBOSS_GROUNDPOUND, 1.0 ,0, false ,1.0)
    
    local entities = Isaac.GetRoomEntities()
    for i = 1, #entities do
      local color = Color(1,1,1,1,0,0,0)
        if(entities[ i ]:IsVulnerableEnemy()) then
           entities[ i ]:SetColor(color,200,0,0,0)
           entities[ i ]:AddConfusion(EntityRef(player),600,0)
           entities[ i ]:AddFreeze(EntityRef(player),50)
        end
    end
  elseif cardId == So_Many_Cards.Items.air_c then
    SFXManager():Play(SoundEffect.SOUND_WHISTLE, 1.0 ,0, false ,1.0)
    local entities = Isaac.GetRoomEntities()
    for i = 1, #entities do
        if(entities[ i ]:IsVulnerableEnemy()) then
           entities[ i ]:AddShrink(EntityRef(player),400)
           entities[ i ]:TakeDamage(10, 0, EntityRef(player),0)
        end
    end
    
  elseif cardId == So_Many_Cards.Items.gatcha_c then
    SFXManager():Play(SoundEffect.SOUND_CHEST_DROP, 1.0 ,0, false ,1.0)
    Isaac.Spawn(EntityType.ENTITY_PICKUP,PickupVariant.PICKUP_TRINKET,0,Game():GetLevel():GetCurrentRoom():FindFreePickupSpawnPosition(pos, 0, false, true),vel,player)
  
  
  elseif cardId == So_Many_Cards.Items.dmg_c then
    player.Damage = player.Damage + math.random(1,4)
    
  elseif cardId == So_Many_Cards.Items.loveIt_c then
    SFXManager():Play(SoundEffect.SOUND_1UP, 1.0 ,0, false ,1.0)
    player:AddMaxHearts(2)
    player:AddHearts(99)
    
  elseif cardId == So_Many_Cards.Items.anarchist_c then
    SFXManager():Play(SoundEffect.SOUND_DEVIL_CARD, 1.0 ,0, false ,1.0)
    player:AddBlackHearts(6)
    
  elseif cardId == So_Many_Cards.Items.More_items_c then
    SFXManager():Play(SoundEffect.SOUND_POWERUP1, 1.0 ,0, false ,1.0)
    if math.random(0,1) == 0 then
      So_Many_Cards:GiveRandomItem(player)
    else
      if math.random(0,4) == 0 then
        Isaac.Spawn(EntityType.ENTITY_PICKUP,PickupVariant.PICKUP_COIN,CoinSubType.COIN_LUCKYPENNY,Game():GetLevel():GetCurrentRoom():FindFreePickupSpawnPosition(pos, 0, false, true),vel,player)
      else
        Isaac.Spawn(EntityType.ENTITY_PICKUP,PickupVariant.PICKUP_COIN,CoinSubType.COIN_PENNY,Game():GetLevel():GetCurrentRoom():FindFreePickupSpawnPosition(pos, 0, false, true),vel,player)
      end
    end
    
  elseif cardId == So_Many_Cards.Items.sale_c then
    SFXManager():Play(SoundEffect.SOUND_POWERUP2, 1.0 ,0, false ,1.0)
    player:AddCoins(20)
    --player:GetEffects():AddCollectibleEffect(CollectibleType.COLLECTIBLE_STEAM_SALE, false)
  
  elseif cardId == So_Many_Cards.Items.solar_system_c then
    player:AddPrettyFly()
    player:AddPrettyFly()
    
  elseif cardId == So_Many_Cards.Items.key_c then
    SFXManager():Play(SoundEffect.SOUND_KEYPICKUP_GAUNTLET, 1.0 ,0, false ,1.0) 
    if  math.random(0,1)== 0 then
      Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_KEY, KeySubType.KEY_GOLDEN,Game():GetLevel():GetCurrentRoom():FindFreePickupSpawnPosition(pos, 0, false, true),vel,player) 
    else
      Isaac.Spawn(EntityType.ENTITY_PICKUP,PickupVariant.PICKUP_KEY,KeySubType.KEY_NORMAL,Game():GetLevel():GetCurrentRoom():FindFreePickupSpawnPosition(pos, 0, false, true),vel,player)
    end
    
  elseif cardId == So_Many_Cards.Items.bombs_c then
    SFXManager():Play(SoundEffect.SOUND_BOSS1_EXPLOSIONS, 1.0 ,0, false ,1.0)
    if math.random(0,1) == 0 then
      Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_BOMB, BombSubType.BOMB_GOLDEN,Game():GetLevel():GetCurrentRoom():FindFreePickupSpawnPosition(pos, 0, false, true),vel,player) 
    else
      Isaac.Spawn(EntityType.ENTITY_PICKUP,PickupVariant.PICKUP_BOMB,BombSubType.BOMB_NORMAL,Game():GetLevel():GetCurrentRoom():FindFreePickupSpawnPosition(pos, 0, false, true),vel,player)
    end
    
  elseif cardId == So_Many_Cards.Items.batteries_c then
    SFXManager():Play(SoundEffect.SOUND_BATTERYCHARGE, 1.0 ,0, false ,1.0)
    for i=1, math.random(1,3) do
      Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_LIL_BATTERY, 0, Game():GetLevel():GetCurrentRoom():FindFreePickupSpawnPosition(pos, 0, false, true), vel, player)
    end
    
  elseif cardId == So_Many_Cards.Items.coin_c then
    SFXManager():Play(SoundEffect.SOUND_COIN_SLOT, 1.0 ,0, false ,1.0)
    for i=1, count_coin_c do
      Isaac.Spawn(EntityType.ENTITY_PICKUP,PickupVariant.PICKUP_COIN, CoinSubType.COIN_PENNY,Game():GetLevel():GetCurrentRoom():FindFreePickupSpawnPosition(pos, 0, false, true),vel,player)
    end
    count_coin_c = count_coin_c*2
    
    
  elseif cardId == So_Many_Cards.Items.eternal_c then
    SFXManager():Play(SoundEffect.SOUND_HOLY, 1.0 ,0, false ,1.0)
    player:AddEternalHearts(1)
    
  elseif cardId == So_Many_Cards.Items.flies_convert_c then
    SFXManager():Play(SoundEffect.SOUND_BEEP, 1.0 ,0, false ,1.0)
    
    local AttackFly= Isaac.FindByType(EntityType.ENTITY_ATTACKFLY,-1,-1)
    local NeutralFly=Isaac.FindByType(EntityType.ENTITY_FLY,-1,-1)
    local pickups= Isaac.FindByType(5,-1,-1)
    local ToxicFly= Isaac.FindByType(868,-1,-1)
    
    if ToxicFly ~=nil then
      for i=1, #ToxicFly do
        player:AddBlueFlies(1,pos,player)
        ToxicFly[i]:Remove()
      end
    end
    
    
    if AttackFly ~=nil then
      for i=1, #AttackFly do
        player:AddBlueFlies(1,pos,player)
        AttackFly[i]:Remove()
      end
    end
    
    if NeutralFlyIsaac ~= nil then
      for i=1, #NeutralFlyIsaac do
        player:AddBlueFlies(1,pos,player)
        NeutralFly[i]:Remove()
      end
    end
    
    if pickups ~= nil then
      for i=1, #pickups do
        player:AddBlueFlies(2,pos,player)
        pickups[i]:Remove()
      end
    end
    
  elseif cardId == So_Many_Cards.Items.bb_hearts_conv_c then
    SFXManager():Play(SoundEffect.SOUND_HOLY, 1.0 ,0, false ,1.0)
    local pickups= Isaac.FindByType(5,-1,-1)
    for i=1, #pickups do
      if math.random(0,1) == 0 then
        player:AddSoulHearts(1)
      end
      pickups[i]:Remove()
    end
    
  elseif cardId == So_Many_Cards.Items.chest_c then
    SFXManager():Play(SoundEffect.SOUND_CHEST_DROP, 1.0 ,0, false ,1.0)
    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_LOCKEDCHEST,ChestSubType.CHEST_CLOSED,Vector(320,300),vel,player)
    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_CHEST, ChestSubType.CHEST_CLOSED,Vector(370,300), vel,player)
    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_REDCHEST, ChestSubType.CHEST_CLOSED,Vector(270,300), vel,player)
    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_ETERNALCHEST, ChestSubType.CHEST_CLOSED,Vector(320,350), vel,player)
    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_SPIKEDCHEST, ChestSubType.CHEST_CLOSED,Vector(320,250), vel,player)
   
  elseif cardId == So_Many_Cards.Items.creep_c then
    SFXManager():Play(SoundEffect.SOUND_ANIMAL_SQUISH, 1.0 ,0, false ,1.0)
    Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.PLAYER_CREEP_LEMON_PARTY,0, Vector(100,100), vel,player):ToEffect()
    Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.PLAYER_CREEP_LEMON_PARTY,0, Vector(100,400), vel,player):ToEffect()
    Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.PLAYER_CREEP_LEMON_PARTY,0, Vector(500,100), vel,player):ToEffect()
    Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.PLAYER_CREEP_LEMON_PARTY,0, Vector(500,400), vel,player):ToEffect()
    
  elseif cardId == So_Many_Cards.Items.speed_c then
    SFXManager():Play(SoundEffect.SOUND_POWERUP_SPEWER, 1.0 ,0, false ,1.0)
    if player.MoveSpeed <= 1.75 then
      player.MoveSpeed = player.MoveSpeed + 0.25
    else 
      player.MoveSpeed = player.MoveSpeed + (2-player.MoveSpeed)
    end
    
  elseif cardId == So_Many_Cards.Items.bhearts_drop_c then
    SFXManager():Play(SoundEffect.SOUND_UNHOLY, 1.0 ,0, false ,1.0)
    bheartsDrop = true 

  elseif cardId == So_Many_Cards.Items.et_heart_drop_c then
  SFXManager():Play(SoundEffect.SOUND_UNHOLY, 1.0 ,0, false ,1.0)
    etheartsDrop = true
    
  elseif cardId == So_Many_Cards.Items.double_c then
    player:UseCard(math.random(So_Many_Cards.Items.Putrified_c,So_Many_Cards.Items.solar_system_c))
    player:UseCard(math.random(So_Many_Cards.Items.Putrified_c,So_Many_Cards.Items.solar_system_c))
    
    
  elseif cardId == So_Many_Cards.Items.colorblind_c then
    SFXManager():Play(SoundEffect.SOUND_LOW_INHALE, 1.0 ,0, false ,1.0)
    local entities = Isaac.GetRoomEntities()
    player:AddBlueFlies(1,pos,player)
    for i = 1, #entities do
      local color = Color(math.random(0,1),math.random(0,1),math.random(0,1),math.random(0,1),math.random(0,1),math.random(0,1),math.random(0,1))
        entities[ i ]:SetColor(color,2000,0,0,0)
    end
    
  elseif cardId == So_Many_Cards.Items.slowness_c then
    slow_room = slow_room + 3
    
  elseif cardId == So_Many_Cards.Items.dmg_room_c then
    SFXManager():Play(SoundEffect.SOUND_INHALE, 1.0 ,0, false ,1.0)
    dmg_room = dmg_room + 3
    
  elseif  cardId == So_Many_Cards.Items.fear_c then
    SFXManager():Play(SoundEffect.SOUND_SATAN_APPEAR, 1.0 ,0, false ,1.0)
    fear_room = fear_room +3
    
  elseif cardId == So_Many_Cards.Items.library_c then
    SFXManager():Play(SoundEffect.SOUND_BIRD_FLAP, 1.0 ,0, false ,1.0)
    local rng_lib = math.random(0,15)
    if rng_lib == 0 then
      Isaac.ExecuteCommand("goto s.library.0")
    elseif rng_lib == 1 then
      Isaac.ExecuteCommand("goto s.library.1")
    elseif rng_lib == 2 then
      Isaac.ExecuteCommand("goto s.library.2")
    elseif rng_lib == 3 then
      Isaac.ExecuteCommand("goto s.library.3")
    elseif rng_lib == 4 then
      Isaac.ExecuteCommand("goto s.library.4")
    elseif rng_lib == 5 then
      Isaac.ExecuteCommand("goto s.library.5") 
    elseif rng_lib == 6 then
      Isaac.ExecuteCommand("goto s.library.6") 
    elseif rng_lib == 7 then
      Isaac.ExecuteCommand("goto s.library.7") 
    elseif rng_lib == 8 then
      Isaac.ExecuteCommand("goto s.library.8")  
    elseif rng_lib == 9 then
      Isaac.ExecuteCommand("goto s.library.9") 
    elseif rng_lib == 10 then
      Isaac.ExecuteCommand("goto s.library.10") 
    elseif rng_lib == 11 then
      Isaac.ExecuteCommand("goto s.library.11")
    elseif rng_lib == 12 then
      Isaac.ExecuteCommand("goto s.library.12")
    elseif rng_lib == 13 then
      Isaac.ExecuteCommand("goto s.library.13")
    elseif rng_lib == 14 then
      Isaac.ExecuteCommand("goto s.library.14")
    else
      Isaac.ExecuteCommand("goto s.library.15")
    end  
    
    
  elseif cardId == So_Many_Cards.Items.glitch_c then 
    SFXManager():Play(SoundEffect.SOUND_MULTI_SCREAM, 1.0 ,0, false ,1.0)
    local rng_lib = math.random(0,14)
    if rng_lib == 0 then
      Isaac.ExecuteCommand("goto s.error.0")
    elseif rng_lib == 1 then
      Isaac.ExecuteCommand("goto s.error.2")
    elseif rng_lib == 2 then
      Isaac.ExecuteCommand("goto s.error.4")
    elseif rng_lib == 3 then
      Isaac.ExecuteCommand("goto s.error.6")
    elseif rng_lib == 4 then
      Isaac.ExecuteCommand("goto s.error.8")
    elseif rng_lib == 5 then
      Isaac.ExecuteCommand("goto s.error.10") 
    elseif rng_lib == 6 then
      Isaac.ExecuteCommand("goto s.error.12") 
    elseif rng_lib == 7 then
      Isaac.ExecuteCommand("goto s.error.14") 
    elseif rng_lib == 8 then
      Isaac.ExecuteCommand("goto s.error.16")  
    elseif rng_lib == 9 then
      Isaac.ExecuteCommand("goto s.error.18") 
    elseif rng_lib == 10 then
      Isaac.ExecuteCommand("goto s.error.20") 
    elseif rng_lib == 11 then
      Isaac.ExecuteCommand("goto s.error.22")
    elseif rng_lib == 12 then
      Isaac.ExecuteCommand("goto s.error.24")
    elseif rng_lib == 13 then
      Isaac.ExecuteCommand("goto s.error.26")
    else
      Isaac.ExecuteCommand("goto s.error.28")
    end
    
  elseif cardId == So_Many_Cards.Items.max_ennemies_c then
    SFXManager():Play(SoundEffect.SOUND_MOM_FOOTSTEPS, 1.0 ,0, false ,1.0)
    max_ennemies = max_ennemies + 2  
    
  elseif cardId == So_Many_Cards.Items.relax_c then
    SFXManager():Play(SoundEffect.SOUND_DEATH_CARD, 1.0 ,0, false ,1.0)
    relax_room = relax_room + 1
    
  elseif cardId == So_Many_Cards.Items.charge_c then
   SFXManager():Play(SoundEffect.SOUND_ITEMRECHARGE, 1.0 ,0, false ,1.0) 
    player:SetActiveCharge(999)    
    
  elseif cardId == So_Many_Cards.Items.revive_c then
    SFXManager():Play(SoundEffect.SOUND_SUMMONSOUND, 1.0 ,0, false ,1.0) 
    Revive_room = true
    
    
  elseif cardId == So_Many_Cards.Items.soul_double_c then
    SFXManager():Play(SoundEffect.SOUND_HOLY, 1.0 ,0, false ,1.0) 
    player:AddSoulHearts(player:GetSoulHearts())
    
  elseif cardId == So_Many_Cards.Items.spiderfly3_c then
    SFXManager():Play(SoundEffect.SOUND_FART, 1.0 ,0, false ,1.0) 
    local num_spider = player:GetNumBlueSpiders()
    local num_flies = player:GetNumBlueFlies()
    --Spider
    if num_spider == 0 then
      player:AddBlueSpider(pos)
    else
      for i=1, (2*num_spider) do
        player:AddBlueSpider(pos)   --Why spiders just don't have an "amount" arg ?
      end
    end
    --Flies
    if num_flies == 0 then
      player:AddBlueFlies(1,pos,player)
    else
      player:AddBlueFlies(2*num_flies,pos,player)
    end
    
  elseif cardId == So_Many_Cards.Items.genocide_c then
    SFXManager():Play(SoundEffect.SOUND_MEATHEADSHOOT, 1.0 ,0, false ,1.0) 
    genocide_room =genocide_room +2

    
  elseif cardId == So_Many_Cards.Items.no_choice_c then
    SFXManager():Play(SoundEffect.SOUND_POWERUP1, 1.0 ,0, false ,1.0) 
    
    local roomItems = Isaac.FindByType(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, -1, false, false)
  	for _,entity in ipairs(roomItems) do
      local pickup = entity:ToPickup()
      if pickup.Price == 0 and pickup.SubType > 0 then
        So_Many_Cards:GiveRandomItem(player)
        pickup:Remove()
      end
    end
  elseif cardId == So_Many_Cards.Items.golden_h_c then
    SFXManager():Play(SoundEffect.SOUND_GOLD_HEART, 1.0 ,0, false ,1.0) 
    player:AddGoldenHearts(3)
    
  elseif cardId == So_Many_Cards.Items.what_c then
    
    if math.random(1,100000) == 4269 then
      SFXManager():Play(SoundEffect.SOUND_HEARTBEAT_FASTEST, 1.0 ,0, false ,1.0) 
      SFXManager():Play(SoundEffect.SOUND_HOLY, 1.0 ,0, false ,1.0) 
      SFXManager():Play(SoundEffect.SOUND_UNHOLY, 1.0 ,0, false ,1.0) 
      SFXManager():Play(SoundEffect.SOUND_BEEP, 1.0 ,0, false ,1.0) 
      SFXManager():Play(SoundEffect.SOUND_RAGMAN_1, 1.0 ,0, false ,1.0) 
      SFXManager():Play(SoundEffect.SOUND_POWERUP1, 1.0 ,0, false ,1.0) 
      Isaac.ExecuteCommand("debug 10")
    else
      SFXManager():Play(SoundEffect.SOUND_THUMBS_DOWN, 1.0 ,0, false ,1.0) 
    end
    
  elseif cardId == So_Many_Cards.Items.demon_present_c then
    SFXManager():Play(SoundEffect.SOUND_DEVILROOM_DEAL, 1.0 ,0, false ,1.0) 
    Isaac.ExecuteCommand("g Demon Ring")
    
  elseif cardId == So_Many_Cards.Items.bombs_coin_c then
    SFXManager():Play(SoundEffect.SOUND_BOSS1_EXPLOSIONS, 1.0 ,0, false ,1.0) 
    if PickupCapCoinNum ~= nil then
      local tmp_bombs = PickupCapBombNum
      PickupCapBombNum = PickupCapCoinNum
      PickupCapCoinNum = tmp_bombs
    else
      local tmp_coins = player:GetNumCoins()
      local tmp_bombs = player:GetNumBombs()
      player:AddCoins(-tmp_coins)
      player:AddBombs(-tmp_bombs)
      player:AddCoins(tmp_bombs)
      player:AddBombs(tmp_coins)
    end
    
  elseif cardId == So_Many_Cards.Items.bloat_c then
    SFXManager():Play(SoundEffect.SOUND_BOIL_HATCH, 1.0 ,0, false ,1.0) 
    local bloat_ent = Isaac.FindByType(EntityType.ENTITY_PEEP, 1, -1, false, false)
    if #bloat_ent >0 then
      for i = 1, #bloat_ent do
        bloat_ent[i]:Remove()
        So_Many_Cards:GiveRandomItem(player)
      end
    end
  end

  
  
  
  --Super cloth item
  --reactivate cards when cards activation
  --Don't forget to check if it already happens
  --check for tarot cloth (overridden)
    if player:HasCollectible(SuperCloth_id) and not player:HasCollectible(CollectibleType.COLLECTIBLE_TAROT_CLOTH) and not already_cloth then
      already_cloth = true
      player:UseCard(math.random(So_Many_Cards.Items.Putrified_c,So_Many_Cards.Items.solar_system_c))
    else
      already_cloth = false
    end
    
end

So_Many_Cards:AddCallback(ModCallbacks.MC_USE_CARD, So_Many_Cards.onCard)





function So_Many_Cards:OnDamagePlayer(entity, dmgAmount, dmgFlag, source, dmgCountDownFrames)
  local player = Isaac.GetPlayer(0)
  local pos = Vector(player.Position.X, player.Position.Y)
  local vel = Vector(0,0)
  
  if bheartsDrop then
    if source ~= nil then
      if math.random(1,3) == 1 then
        if math.random(0,1) == 0 then
          Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_HEART, HeartSubType.HEART_SOUL, Game():GetLevel():GetCurrentRoom():FindFreePickupSpawnPosition(pos, 0, false, true), vel, player)
        else
          Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_HEART, HeartSubType.HEART_SOUL, Game():GetLevel():GetCurrentRoom():FindFreePickupSpawnPosition(pos, 0, false, true), vel, player)
        end
      end
    end
  end  
  if etheartsDrop then
    if source ~= nil then
      if math.random(1,8) == 1 then
        Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_HEART, HeartSubType.HEART_ETERNAL, Game():GetLevel():GetCurrentRoom():FindFreePickupSpawnPosition(pos, 0, false, true), vel, player)
      end
    end
  end
  
end
So_Many_Cards:AddCallback(ModCallbacks.MC_ENTITY_TAKE_DMG,So_Many_Cards.OnDamagePlayer,EntityType.ENTITY_PLAYER)



function So_Many_Cards:OnNewRoom()
  player = Isaac.GetPlayer(0)
  bheartsDrop = false
  etheartsDrop = false
  prettyDrop = false
  Revive_room = false
  
  if slow_room >0 then
    local entities = Isaac.GetRoomEntities()
    
    local slowColor = Color(0,1,1,1,0,0,0)
    slowColor:SetColorize(255, 255, 255, 1)
    for i = 1, #entities do
        if(entities[ i ]:IsVulnerableEnemy()) then
           entities[ i ]:AddSlowing(EntityRef(player),99999999,0.5, slowColor)
        end
    end
    slow_room = slow_room -1
  end  
  
  
  if dmg_room>0 then
    local entities = Isaac.GetRoomEntities()
    player:AnimateHappy()
    
    for i = 1, #entities do
        if(entities[ i ]:IsVulnerableEnemy()) then
           entities[ i ]:TakeDamage(10, 0, EntityRef(player),0)
        end
    end
    dmg_room = dmg_room -1
  end  
  
  
  if fear_room>0 then
    local entities = Isaac.GetRoomEntities()
    
    for i = 1, #entities do
        if(entities[ i ]:IsVulnerableEnemy()) then
           entities[ i ]:AddFear(EntityRef(player),999999)
        end
    end
    fear_room = fear_room -1
  end
  
  if max_ennemies>0 then
    local entities = Isaac.GetRoomEntities()
    max_ennemies_count = 0
    for i = 1, #entities do
        if(entities[ i ]:IsVulnerableEnemy()) then
          if max_ennemies_count <4 then
            max_ennemies_count = max_ennemies_count + 1
          else
            entities[ i ]:Remove()
          end
        end
    end
    max_ennemies = max_ennemies - 1
  end
  
  if relax_room>0 then
    local entities = Isaac.GetRoomEntities()
    for i = 1, #entities do
        if(entities[ i ]:IsVulnerableEnemy()) then
            entities[ i ]:Remove()
        end
    end
    relax_room = relax_room- 1
  end
  
  if genocide_room >0 then
    local target
    local already_target = false
    for i, entity in pairs(Isaac.GetRoomEntities()) do
      if entity:IsVulnerableEnemy() then
          if not already_target then
            target = entity.Type
            already_target = true
          end
          if entity.Type == target then
            entity:Kill()
          end
      end		
    end
    already_target = false
    genocide_room = genocide_room -1
  end
end
So_Many_Cards:AddCallback(ModCallbacks.MC_POST_NEW_ROOM,So_Many_Cards.OnNewRoom)


function So_Many_Cards:OnInit()
  count_coin_c = 1
  bheartsDrop = false
  etheartsDrop = false
  Revive_room = false
  slow_room = 0
  dmg_room = 0
  fear_room = 0
  max_ennemies = 0
  max_ennemies_count = 0
  relax_room = 0
  cloth_tarot =0
  genocide_room =0
  already_card = false
  local game = Game()
  local player = Isaac.GetPlayer(0)
  if game.Challenge == Challenges.CHALLENGE_CARDS2 then
    player:AddCollectible(SuperCloth_id,0,true)
    player:AddCollectible(cards_itemid,0,true)
    player:AddTrinket(BiggerDeckId)
  end
end
So_Many_Cards:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, So_Many_Cards.OnInit)



function So_Many_Cards:Revive()
  if Revive_room then
    local player = Isaac.GetPlayer(0)
    if player:IsDead() and player:GetExtraLives() == 0 then
      player:Revive()
      player:AddHearts(7)
      Revive_room = false
    end
  end
end

So_Many_Cards:AddCallback(ModCallbacks.MC_POST_UPDATE, So_Many_Cards.Revive, EntityType.ENTITY_PLAYER) --And the callback for the player on every update

function So_Many_Cards:GiveRandomItem(player)
    if(player:GetPlayerType() == 29 or player:GetPlayerType() == 38 or player:GetPlayerType() == 20) then -- This characters crash the game :/
      local pos = player.Position
      local vel = Vector(0,0)
      Isaac.Spawn(EntityType.ENTITY_PICKUP,PickupVariant.PICKUP_COLLECTIBLE,-1,Game():GetLevel():GetCurrentRoom():FindFreePickupSpawnPosition(pos, 0, false, true),vel,player)
    else
      local other_collectibles = {}
      local RNG = player:GetDropRNG()
      --the author of this part is atomoton (https://github.com/atomoton/crackedDice/blob/master/main.lua)
      for i=1, CollectibleType.NUM_COLLECTIBLES do 
        if not player:HasCollectible(i) then
          table.insert(other_collectibles, i)
        end
      end
      local itemAdd = other_collectibles[(RNG:RandomInt(#other_collectibles) + 1)]
      player:AddCollectible(itemAdd, 0, false) -- add a new item
      -- need to check that the item is added correctly
      while player:HasCollectible(itemAdd) == false do
        itemAdd = other_collectibles[(RNG:RandomInt(#other_collectibles) + 1)]
        player:AddCollectible(itemAdd, 0, false) -- add an other item
      end
    end
  end
function So_Many_Cards:OnPickupInit(entity)
	if So_Many_Cards:GetPositionInList(entity.SubType, MANY_CARDS) ~= -1 then
		local sprite = entity:GetSprite()
		sprite:ReplaceSpritesheet(0, MANY_CARDS_SPRITESHEET)
		sprite:LoadGraphics()
	end
end

function So_Many_Cards:GetPositionInList(item, list)
	for i = 1, #list do
		if list[i] == item then
			return i
		end
	end

	return -1
end
So_Many_Cards:AddCallback(ModCallbacks.MC_POST_PICKUP_INIT, So_Many_Cards.OnPickupInit, PickupVariant.PICKUP_TAROTCARD)



--Spawn of the cards
function So_Many_Cards:getCard(rng,current,playing,runes,onlyrunes)
  local player = Isaac.GetPlayer(0)
  local chancereplace = 4
  if player:HasTrinket(BiggerDeckId) then
    chancereplace = 2
  end
  if math.random(1,chancereplace) == 1 then
  local cardDistrib = math.random(1,100)
  if cardDistrib >=1 and cardDistrib<=60 and not onlyrunes and current ~= Card.CARD_CHAOS then --Normal
    local normal = rng:RandomInt(33)
      if normal == 1 then
        return So_Many_Cards.Items.Putrified_c
      elseif normal ==2 then
        return So_Many_Cards.Items.Justice_c
      elseif normal ==3 then
        return So_Many_Cards.Items.Casino_c
      elseif normal ==4 then
        return So_Many_Cards.Items.water_c
      elseif normal ==5 then
        return So_Many_Cards.Items.fire_c
      elseif normal ==6 then
        return So_Many_Cards.Items.earth_c
      elseif normal ==7 then
        return So_Many_Cards.Items.air_c
      elseif normal ==8 then
        return So_Many_Cards.Items.dmg_c
      elseif normal ==9 then
        return So_Many_Cards.Items.sale_c
      elseif normal ==10 then
        return So_Many_Cards.Items.solar_system_c
      elseif normal ==11 then
        return So_Many_Cards.Items.key_c
      elseif normal ==12 then
        return So_Many_Cards.Items.bombs_c
      elseif normal ==13 then
        return So_Many_Cards.Items.batteries_c
      elseif normal ==14 then
        return So_Many_Cards.Items.coin_c
      elseif normal ==15 then
        return So_Many_Cards.Items.flies_convert_c
      elseif normal ==16 then
        return So_Many_Cards.Items.bb_hearts_conv_c
      elseif normal ==17 then
        return So_Many_Cards.Items.chest_c
      elseif normal ==18 then
        return So_Many_Cards.Items.creep_c
      elseif normal ==19 then
        return So_Many_Cards.Items.speed_c
      elseif normal ==20 then
        return So_Many_Cards.Items.bhearts_drop_c
      elseif normal ==21 then
        return So_Many_Cards.Items.et_heart_drop_c
      elseif normal ==22 then
        return So_Many_Cards.Items.double_c
      elseif normal ==23 then
        return So_Many_Cards.Items.colorblind_c
      elseif normal ==24 then
        return So_Many_Cards.Items.slowness_c
      elseif normal ==25 then
        return So_Many_Cards.Items.dmg_room_c
      elseif normal == 26 then
        return So_Many_Cards.Items.fear_c
      elseif normal == 27 then
        return So_Many_Cards.Items.max_ennemies_c
      elseif normal == 28 then
        return So_Many_Cards.Items.spiderfly3_c
      elseif normal == 29 then
        return So_Many_Cards.Items.what_c
      elseif normal == 30 then
        return So_Many_Cards.Items.demon_present_c
      elseif normal == 31 then
        return So_Many_Cards.Items.bombs_coin_c
      elseif normal ==32 then
        return So_Many_Cards.Items.bloat_c
      else
        return So_Many_Cards.Items.charge_c
      end
    
  elseif cardDistrib >=61 and cardDistrib<=90 and not onlyrunes and current ~= Card.CARD_CHAOS then --Rare
    local rare =rng:RandomInt(9)
    if rare == 1 then
      return So_Many_Cards.Items.gatcha_c
    elseif rare == 2 then
      return So_Many_Cards.Items.loveIt_c
    elseif rare == 3 then
      return So_Many_Cards.Items.anarchist_c
    elseif rare == 4 then
      return So_Many_Cards.Items.eternal_c
    elseif rare == 5 then
      return So_Many_Cards.Items.relax_c
    elseif rare == 6 then
      return So_Many_Cards.Items.soul_double_c
    elseif rare == 7  then
      return So_Many_Cards.Items.no_choice_c
    elseif rare == 8 then
      return So_Many_Cards.Items.golden_h_c
    else
      return So_Many_Cards.Items.revive_c
    end
    
  elseif cardDistrib >=91 and cardDistrib<=100 and not onlyrunes and current ~= Card.CARD_CHAOS then --Very Rare
    local vrare = rng:RandomInt(4)
    if vrare == 1 then
      return So_Many_Cards.Items.glitch_c
    elseif vrare == 2 then
      return So_Many_Cards.Items.library_c
    elseif vrare == 3 then
      return So_Many_Cards.Items.genocide_c
    else
      return So_Many_Cards.Items.More_items_c 
    end
  end
  end
end
So_Many_Cards:AddCallback(ModCallbacks.MC_GET_CARD, So_Many_Cards.getCard)

function So_Many_Cards:PreEntity(etype, vari, stype, pos, vel, spawner, seed)
  local player = Isaac.GetPlayer(0)
  if player:HasCollectible(cards_itemid) then
    if math.random(0,1)==0 and etype == 5 then
      if vari == PickupVariant.PICKUP_BOMB or vari ==PickupVariant.PICKUP_COIN or vari ==PickupVariant.PICKUP_KEY or vari ==PickupVariant.PICKUP_PILL or vari ==PickupVariant.PICKUP_HEART or vari ==PickupVariant.PICKUP_LIL_BATTERY then
      return {etype, PickupVariant.PICKUP_TAROTCARD, 0, seed }
      end
    end
  end
end

So_Many_Cards:AddCallback(ModCallbacks.MC_PRE_ENTITY_SPAWN , So_Many_Cards.PreEntity)


function So_Many_Cards:onCache(player,cacheFlag)
  local player =  Isaac.GetPlayer(0)
  
  if player:HasCollectible(cards_itemid) then
    if cacheFlag == CacheFlag.CACHE_LUCK then
      player.Luck = player.Luck +3
    end
    if cacheFlag == CacheFlag.CACHE_SPEED then
      player.MoveSpeed = player.MoveSpeed +0.25
    end
    if cacheFlag == CacheFlag.CACHE_DAMAGE then
      player.Damage = player.Damage +2
    end
  end
  if player:HasCollectible(SuperCloth_id) then
    if cacheFlag == CacheFlag.CACHE_LUCK then
      player.Luck = player.Luck +2
    end
  end
end
So_Many_Cards:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, So_Many_Cards.onCache)


function So_Many_Cards:peffect()
  local player =  Isaac.GetPlayer(0)
    if already_card == false  and player:HasCollectible(cards_itemid) then
      player:AddCollectible(CollectibleType.COLLECTIBLE_SPOON_BENDER,0,false)
      player:AddNullCostume(So_Many_Cards.COSTUME_CAAARDS)
      local itemConfig = Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_SPOON_BENDER)
      player:RemoveCostume(itemConfig)
      already_card = true
    end

end
So_Many_Cards:AddCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE, So_Many_Cards.peffect)




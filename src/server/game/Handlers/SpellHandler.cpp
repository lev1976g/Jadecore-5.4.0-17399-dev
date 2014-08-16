/*
 * Copyright (C) 2008-2012 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include "Common.h"
#include "DBCStores.h"
#include "WorldPacket.h"
#include "WorldSession.h"
#include "ObjectMgr.h"
#include "GuildMgr.h"
#include "SpellMgr.h"
#include "Log.h"
#include "Opcodes.h"
#include "Spell.h"
#include "Totem.h"
#include "TemporarySummon.h"
#include "SpellAuras.h"
#include "CreatureAI.h"
#include "ScriptMgr.h"
#include "GameObjectAI.h"
#include "SpellAuraEffects.h"

void WorldSession::HandleClientCastFlags(WorldPacket& recvPacket, uint8 castFlags, SpellCastTargets& targets)
{
}

void WorldSession::HandleUseItemOpcode(WorldPacket& recvPacket)
{
    // TODO: add targets.read() check
    Player* pUser = _player;

    // ignore for remote control state
    if (pUser->m_mover != pUser)
        return;

    float speed = 0.00f, elevation = 0.00f;
    std::string unkString;
    uint8 unkStringLen = 0;

    uint8 bagIndex, slot, castFlags = 0;
    uint8 castCount = 0;                                // next cast if exists (single or not)
    uint32 glyphIndex = 0;                              // something to do with glyphs?
    uint32 spellId = 0;                                 // casted spell id

    recvPacket >> bagIndex >> slot;

    ObjectGuid itemGuid, guid2, guid3, guid4, guid5, guid6, guid7;

    bool bit28 = recvPacket.ReadBit();
    bool bit64 = !recvPacket.ReadBit();
    bool hasUnkString = !recvPacket.ReadBit();
    bool bit56 = !recvPacket.ReadBit();
    itemGuid[5] = recvPacket.ReadBit();
    bool hasSpellID = !recvPacket.ReadBit();
    uint8 archeologyCounter = recvPacket.ReadBits(2);

    uint8* archeologyType;
    uint32* entry;
    uint32* usedCount;

    archeologyType = new uint8[archeologyCounter];
    entry = new uint32[archeologyCounter];
    usedCount = new uint32[archeologyCounter];

    bool hasGuid5 = recvPacket.ReadBit();
    bool hasMovement = recvPacket.ReadBit();
    bool hasSpeed = !recvPacket.ReadBit();
    bool hasElevation = !recvPacket.ReadBit();
    bool bit40 = !recvPacket.ReadBit();
    itemGuid[0] = recvPacket.ReadBit();
    bool bit52 = !recvPacket.ReadBit();
    itemGuid[6] = recvPacket.ReadBit();
    itemGuid[2] = recvPacket.ReadBit();
    itemGuid[1] = recvPacket.ReadBit();
    bool bit48 = !recvPacket.ReadBit();
    bool hasGuid4 = recvPacket.ReadBit();
    bool v9 = !recvPacket.ReadBit();

    itemGuid[3] = recvPacket.ReadBit();

    for (uint8 i = 0; i < archeologyCounter; i++)
        archeologyType[i] = recvPacket.ReadBits(2);

    itemGuid[7] = recvPacket.ReadBit();

    if (hasGuid5)
    {
        uint8 bitsOrder[8] = { 6, 1, 5, 0, 3, 2, 7, 4 };
        recvPacket.ReadBitInOrder(guid5, bitsOrder);
    }

    uint32 bits416 = 0;
    bool bit404 = false;
    bool bit400 = false;
    bool bit368 = false;
    bool bit356 = false;
    bool bit364 = false;
    bool bit296 = false;

    if (hasMovement)
    {
        // Kebab client side
    }

    uint8 bitsOrder2[8] = { 0, 4, 7, 1, 2, 3, 6, 5 };
    recvPacket.ReadBitInOrder(guid2, bitsOrder2);

    if (bit56)
        uint32 values = recvPacket.ReadBits(24);

    if (hasGuid4)
    {
        uint8 bitsOrder[8] = { 2, 0, 1, 5, 7, 4, 3, 6 };
        recvPacket.ReadBitInOrder(guid4, bitsOrder);
    }

    uint8 bitsOrder3[8] = { 0, 4, 3, 5, 1, 7, 6, 2 };
    recvPacket.ReadBitInOrder(guid3, bitsOrder3);

    if (bit52)
        uint8 values = recvPacket.ReadBits(5);

    if (hasUnkString)
        unkStringLen = recvPacket.ReadBits(8);

    recvPacket.FlushBits();

    recvPacket.ReadByteSeq(itemGuid[7]);

    for (uint8 i = 0; i < archeologyCounter; i++)
    {
        switch (archeologyType[i])
        {
            case 1: // Fragments
                recvPacket >> entry[i];     // Currency ID
                recvPacket >> usedCount[i]; // Currency count
                break;
            case 2: // Keystones
                recvPacket >> entry[i];     // Item ID
                recvPacket >> usedCount[i]; // ItemCount
                break;
            default:
                break;
        }
    }

    recvPacket.ReadByteSeq(itemGuid[3]);
    recvPacket.ReadByteSeq(itemGuid[6]);
    recvPacket.ReadByteSeq(itemGuid[5]);
    recvPacket.ReadByteSeq(itemGuid[4]);
    recvPacket.ReadByteSeq(itemGuid[1]);
    recvPacket.ReadByteSeq(itemGuid[0]);
    recvPacket.ReadByteSeq(itemGuid[2]);

    uint8 bytesOrder3[8] = { 0, 4, 1, 7, 3, 6, 5, 2 };
    recvPacket.ReadBytesSeq(guid3, bytesOrder3);

    WorldLocation srcPos;
    if (hasGuid4)
    {
        recvPacket.ReadByteSeq(guid4[7]);
        recvPacket.ReadByteSeq(guid4[5]);
        recvPacket.ReadByteSeq(guid4[6]);
        recvPacket >> srcPos.m_positionX;
        recvPacket.ReadByteSeq(guid4[3]);
        recvPacket.ReadByteSeq(guid4[1]);
        recvPacket >> srcPos.m_positionY;
        recvPacket >> srcPos.m_positionZ;
        recvPacket.ReadByteSeq(guid4[0]);
        recvPacket.ReadByteSeq(guid4[2]);
        recvPacket.ReadByteSeq(guid4[4]);
    }

    if (hasMovement)
    {
        // Kebab client side
    }

    if (bit40)
        recvPacket >> castCount;

    WorldLocation destPos;
    if (hasGuid5)
    {
        recvPacket.ReadByteSeq(guid5[6]);
        recvPacket.ReadByteSeq(guid5[1]);
        recvPacket >> destPos.m_positionZ;
        recvPacket.ReadByteSeq(guid5[0]);
        recvPacket >> destPos.m_positionX;
        recvPacket.ReadByteSeq(guid5[5]);
        recvPacket >> destPos.m_positionY;
        recvPacket.ReadByteSeq(guid5[7]);
        recvPacket.ReadByteSeq(guid5[2]);
        recvPacket.ReadByteSeq(guid5[4]);
        recvPacket.ReadByteSeq(guid5[3]);
    }

    if (hasSpeed)
        recvPacket >> speed;

    uint8 bytesOrder[8] = { 1, 3, 7, 0, 4, 6, 2, 5 };
    recvPacket.ReadBytesSeq(guid2, bytesOrder);

    if (hasSpellID)
        recvPacket >> spellId;

    if (hasElevation)
        recvPacket >> elevation;

    if (hasUnkString)
        unkString = recvPacket.ReadString(unkStringLen);

    if (bit48)
        recvPacket >> glyphIndex;

    if (glyphIndex >= MAX_GLYPH_SLOT_INDEX)
    {
        pUser->SendEquipError(EQUIP_ERR_ITEM_NOT_FOUND, NULL, NULL);
        return;
    }

    Item* pItem = pUser->GetUseableItemByPos(bagIndex, slot);
    if (!pItem)
    {
        pUser->SendEquipError(EQUIP_ERR_ITEM_NOT_FOUND, NULL, NULL);
        return;
    }

    if (pItem->GetGUID() != itemGuid)
    {
        pUser->SendEquipError(EQUIP_ERR_ITEM_NOT_FOUND, NULL, NULL);
        return;
    }

    sLog->outDebug(LOG_FILTER_NETWORKIO, "WORLD: CMSG_USE_ITEM packet, bagIndex: %u, slot: %u, castCount: %u, spellId: %u, Item: %u, glyphIndex: %u, data length = %i", bagIndex, slot, castCount, spellId, pItem->GetEntry(), glyphIndex, (uint32)recvPacket.size());

    ItemTemplate const* proto = pItem->GetTemplate();
    if (!proto)
    {
        pUser->SendEquipError(EQUIP_ERR_ITEM_NOT_FOUND, pItem, NULL);
        return;
    }

    // some item classes can be used only in equipped state
    if (proto->InventoryType != INVTYPE_NON_EQUIP && !pItem->IsEquipped())
    {
        pUser->SendEquipError(EQUIP_ERR_ITEM_NOT_FOUND, pItem, NULL);
        return;
    }

    InventoryResult msg = pUser->CanUseItem(pItem);
    if (msg != EQUIP_ERR_OK)
    {
        pUser->SendEquipError(msg, pItem, NULL);
        return;
    }

    // only allow conjured consumable, bandage, poisons (all should have the 2^21 item flag set in DB)
    if (proto->Class == ITEM_CLASS_CONSUMABLE && !(proto->Flags & ITEM_PROTO_FLAG_USEABLE_IN_ARENA) && pUser->InArena())
    {
        pUser->SendEquipError(EQUIP_ERR_NOT_DURING_ARENA_MATCH, pItem, NULL);
        return;
    }

    // don't allow items banned in arena
    if (proto->Flags & ITEM_PROTO_FLAG_NOT_USEABLE_IN_ARENA && pUser->InArena())
    {
        pUser->SendEquipError(EQUIP_ERR_NOT_DURING_ARENA_MATCH, pItem, NULL);
        return;
    }

    if (pUser->isInCombat())
    {
        for (int i = 0; i < MAX_ITEM_PROTO_SPELLS; ++i)
        {
            if (SpellInfo const* spellInfo = sSpellMgr->GetSpellInfo(proto->Spells[i].SpellId))
            {
                if (!spellInfo->CanBeUsedInCombat())
                {
                    pUser->SendEquipError(EQUIP_ERR_NOT_IN_COMBAT, pItem, NULL);
                    return;
                }
            }
        }
    }

    // check also  BIND_WHEN_PICKED_UP and BIND_QUEST_ITEM for .additem or .additemset case by GM (not binded at adding to inventory)
    if (pItem->GetTemplate()->Bonding == BIND_WHEN_USE || pItem->GetTemplate()->Bonding == BIND_WHEN_PICKED_UP || pItem->GetTemplate()->Bonding == BIND_QUEST_ITEM)
    {
        if (!pItem->IsSoulBound())
        {
            pItem->SetState(ITEM_CHANGED, pUser);
            pItem->SetBinding(true);
        }
    }

    SpellCastTargets targets;
    HandleClientCastFlags(recvPacket, castFlags, targets);

    // Note: If script stop casting it must send appropriate data to client to prevent stuck item in gray state.
    if (!sScriptMgr->OnItemUse(pUser, pItem, targets))
    {
        // no script or script not process request by self
        pUser->CastItemUseSpell(pItem, targets, castCount, glyphIndex);
    }
}

void WorldSession::HandleOpenItemOpcode(WorldPacket& recvPacket)
{
    sLog->outDebug(LOG_FILTER_NETWORKIO, "WORLD: CMSG_OPEN_ITEM packet, data length = %i", (uint32)recvPacket.size());

    Player* pUser = _player;

    // ignore for remote control state
    if (pUser->m_mover != pUser)
        return;

    uint8 bagIndex, slot;

    recvPacket >> bagIndex >> slot;

    sLog->outInfo(LOG_FILTER_NETWORKIO, "bagIndex: %u, slot: %u", bagIndex, slot);

    Item* item = pUser->GetItemByPos(bagIndex, slot);
    if (!item)
    {
        pUser->SendEquipError(EQUIP_ERR_ITEM_NOT_FOUND, NULL, NULL);
        return;
    }

    ItemTemplate const* proto = item->GetTemplate();
    if (!proto)
    {
        pUser->SendEquipError(EQUIP_ERR_ITEM_NOT_FOUND, item, NULL);
        return;
    }

    // Verify that the bag is an actual bag or wrapped item that can be used "normally"
    if (!(proto->Flags & ITEM_PROTO_FLAG_OPENABLE) && !item->HasFlag(ITEM_FIELD_FLAGS, ITEM_FLAG_WRAPPED))
    {
        pUser->SendEquipError(EQUIP_ERR_CLIENT_LOCKED_OUT, item, NULL);
        sLog->outError(LOG_FILTER_NETWORKIO, "Possible hacking attempt: Player %s [guid: %u] tried to open item [guid: %u, entry: %u] which is not openable!",
                pUser->GetName(), pUser->GetGUIDLow(), item->GetGUIDLow(), proto->ItemId);
        return;
    }

    // locked item
    uint32 lockId = proto->LockID;
    if (lockId)
    {
        LockEntry const* lockInfo = sLockStore.LookupEntry(lockId);

        if (!lockInfo)
        {
            pUser->SendEquipError(EQUIP_ERR_ITEM_LOCKED, item, NULL);
            sLog->outError(LOG_FILTER_NETWORKIO, "WORLD::OpenItem: item [guid = %u] has an unknown lockId: %u!", item->GetGUIDLow(), lockId);
            return;
        }

        // was not unlocked yet
        if (item->IsLocked())
        {
            pUser->SendEquipError(EQUIP_ERR_ITEM_LOCKED, item, NULL);
            return;
        }
    }

    if (item->HasFlag(ITEM_FIELD_FLAGS, ITEM_FLAG_WRAPPED))// wrapped?
    {
        PreparedStatement* stmt = CharacterDatabase.GetPreparedStatement(CHAR_SEL_CHARACTER_GIFT_BY_ITEM);

        stmt->setUInt32(0, item->GetGUIDLow());

        PreparedQueryResult result = CharacterDatabase.Query(stmt);

        if (result)
        {
            Field* fields = result->Fetch();
            uint32 entry = fields[0].GetUInt32();
            uint32 flags = fields[1].GetUInt32();

            item->SetUInt64Value(ITEM_FIELD_GIFTCREATOR, 0);
            item->SetEntry(entry);
            item->SetUInt32Value(ITEM_FIELD_FLAGS, flags);
            item->SetState(ITEM_CHANGED, pUser);
        }
        else
        {
            sLog->outError(LOG_FILTER_NETWORKIO, "Wrapped item %u don't have record in character_gifts table and will deleted", item->GetGUIDLow());
            pUser->DestroyItem(item->GetBagSlot(), item->GetSlot(), true);
            return;
        }

        stmt = CharacterDatabase.GetPreparedStatement(CHAR_DEL_GIFT);

        stmt->setUInt32(0, item->GetGUIDLow());

        CharacterDatabase.Execute(stmt);
    }
    else
        pUser->SendLoot(item->GetGUID(), LOOT_CORPSE);
}

void WorldSession::HandleGameObjectUseOpcode(WorldPacket& recvData)
{
    ObjectGuid guid;

    guid[5] = recvData.ReadBit();
    guid[2] = recvData.ReadBit();
    guid[7] = recvData.ReadBit();
    guid[3] = recvData.ReadBit();
    guid[0] = recvData.ReadBit();
    guid[6] = recvData.ReadBit();
    guid[4] = recvData.ReadBit();
    guid[1] = recvData.ReadBit();

    recvData.ReadByteSeq(guid[6]);
    recvData.ReadByteSeq(guid[0]);
    recvData.ReadByteSeq(guid[5]);
    recvData.ReadByteSeq(guid[3]);
    recvData.ReadByteSeq(guid[4]);
    recvData.ReadByteSeq(guid[1]);
    recvData.ReadByteSeq(guid[7]);
    recvData.ReadByteSeq(guid[2]);

    sLog->outDebug(LOG_FILTER_NETWORKIO, "WORLD: Recvd CMSG_GAMEOBJECT_USE Message [guid=%u]", GUID_LOPART(guid));

    // ignore for remote control state
    if (_player->m_mover != _player)
        return;

    if (GameObject* obj = GetPlayer()->GetMap()->GetGameObject(guid))
        obj->Use(_player);
}

void WorldSession::HandleGameobjectReportUse(WorldPacket& recvPacket)
{
    ObjectGuid guid;

    guid[5] = recvPacket.ReadBit();
    guid[3] = recvPacket.ReadBit();
    guid[1] = recvPacket.ReadBit();
    guid[4] = recvPacket.ReadBit();
    guid[6] = recvPacket.ReadBit();
    guid[7] = recvPacket.ReadBit();
    guid[2] = recvPacket.ReadBit();
    guid[0] = recvPacket.ReadBit();

    recvPacket.ReadByteSeq(guid[6]);
    recvPacket.ReadByteSeq(guid[1]);
    recvPacket.ReadByteSeq(guid[5]);
    recvPacket.ReadByteSeq(guid[3]);
    recvPacket.ReadByteSeq(guid[4]);
    recvPacket.ReadByteSeq(guid[0]);
    recvPacket.ReadByteSeq(guid[2]);
    recvPacket.ReadByteSeq(guid[7]);

    sLog->outDebug(LOG_FILTER_NETWORKIO, "WORLD: Recvd CMSG_GAMEOBJECT_REPORT_USE Message [in game guid: %u]", GUID_LOPART(guid));

    // ignore for remote control state
    if (_player->m_mover != _player)
        return;

    GameObject* go = GetPlayer()->GetMap()->GetGameObject(guid);
    if (!go)
        return;

    if (!go->IsWithinDistInMap(_player, INTERACTION_DISTANCE))
        return;

    if (go->AI()->GossipHello(_player))
        return;

    _player->UpdateAchievementCriteria(ACHIEVEMENT_CRITERIA_TYPE_USE_GAMEOBJECT, go->GetEntry());
}

void WorldSession::HandleCastSpellOpcode(WorldPacket& recvPacket)
{
    uint32 spellId, glyphIndex = 0;
    uint8  castCount, unkStringLength;
    float speed = 0.00f, elevation = 0.00f;
    std::string unkString;

    ObjectGuid itemTarget, Guid2, Guid3, targetGuid;

    bool hasTargetFlags = !(recvPacket.ReadBit());
    bool hasCountCast = !(recvPacket.ReadBit());
    bool hasUnk1 = !(recvPacket.ReadBit());
    bool hasSpellId = !(recvPacket.ReadBit());
    uint8 archeologyCounter = recvPacket.ReadBits(2);
    bool hasGuid0 = !(recvPacket.ReadBit());
    bool hasElevation = !(recvPacket.ReadBit());
    bool hasTargetGuid = !(recvPacket.ReadBit());
    bool hasGuid3 = recvPacket.ReadBit();
    bool hasSpeed = !(recvPacket.ReadBit());
    bool hasUnkString = !(recvPacket.ReadBit());
    bool hasGuid2 = recvPacket.ReadBit();
    bool hasMovement = recvPacket.ReadBit();
    bool hasUnk4 = !(recvPacket.ReadBit());

    uint8* archeologyType;
    uint32* entry;
    uint32* usedCount;

    uint32 targetFlags = 0;

    archeologyType = new uint8[archeologyCounter];
    entry = new uint32[archeologyCounter];
    usedCount = new uint32[archeologyCounter];

    for (int i = 0; i < archeologyCounter; i++)
        archeologyType[i] = recvPacket.ReadBits(2);

    if (hasMovement)
    {
        // Kebab client side
    }

    if (hasTargetFlags)
        targetFlags = recvPacket.ReadBits(20);

    uint8 bitsOrder[8] = { 2, 1, 3, 6, 5, 4, 7, 0 };
    recvPacket.ReadBitInOrder(itemTarget, bitsOrder);

    if (hasGuid3)
    {
        uint8 bitsOrder2[8] = { 3, 6, 1, 0, 4, 5, 7, 2 };
        recvPacket.ReadBitInOrder(Guid3, bitsOrder2);
    }

    if (hasGuid2)
    {
        uint8 bitsOrder3[8] = { 6, 3, 5, 2, 0, 4, 1, 7 };
        recvPacket.ReadBitInOrder(Guid2, bitsOrder3);
    }

    uint8 bitsOrder4[8] = { 5, 0, 2, 3, 1, 4, 6, 7 };
    recvPacket.ReadBitInOrder(targetGuid, bitsOrder4);

    if (hasUnkString)
        unkStringLength = recvPacket.ReadBits(7);

    if (hasUnk4)
        recvPacket.ReadBits(5);

    recvPacket.FlushBits();

    for (int i = 0; i < archeologyCounter; i++)
    {
        switch (archeologyType[i])
        {
            case 2: // Keystones
                recvPacket >> entry[i];        // Item id
                recvPacket >> usedCount[i];    // Item count
                break;
            case 1: // Fragments
                recvPacket >> entry[i];        // Currency id
                recvPacket >> usedCount[i];    // Currency count
                break;
            default:
                break;
        }
    }

    if (hasMovement)
    {
        // Kebab client side
    }

    if (hasSpellId)
        recvPacket >> spellId;

    WorldLocation srcPos;
    if (hasGuid2)
    {
        recvPacket.ReadByteSeq(Guid2[7]);
        recvPacket >> srcPos.m_positionX;
        recvPacket.ReadByteSeq(Guid2[6]);
        recvPacket.ReadByteSeq(Guid2[0]);
        recvPacket >> srcPos.m_positionY;
        recvPacket.ReadByteSeq(Guid2[1]);
        recvPacket.ReadByteSeq(Guid2[4]);
        recvPacket >> srcPos.m_positionZ;
        recvPacket.ReadByteSeq(Guid2[3]);
        recvPacket.ReadByteSeq(Guid2[2]);
        recvPacket.ReadByteSeq(Guid2[5]);
    }

    WorldLocation destPos;
    if (hasGuid3)
    {
        recvPacket.ReadByteSeq(Guid3[5]);
        recvPacket.ReadByteSeq(Guid3[4]);
        recvPacket.ReadByteSeq(Guid3[3]);
        recvPacket.ReadByteSeq(Guid3[1]);
        recvPacket >> destPos.m_positionZ;
        recvPacket >> destPos.m_positionY;
        recvPacket.ReadByteSeq(Guid3[2]);
        recvPacket.ReadByteSeq(Guid3[6]);
        recvPacket.ReadByteSeq(Guid3[7]);
        recvPacket >> destPos.m_positionX;
        recvPacket.ReadByteSeq(Guid3[0]);
    }

    uint8 byteOrder[8] = { 7, 2, 6, 0, 4, 5, 1, 3 };
    recvPacket.ReadBytesSeq(targetGuid, byteOrder);

    uint8 byteOrder2[8] = { 1, 0, 2, 3, 5, 6, 7, 4 };
    recvPacket.ReadBytesSeq(itemTarget, byteOrder2);

    if (hasCountCast)
        recvPacket >> castCount;

    if (hasSpeed)
        recvPacket >> speed;

    if (hasUnkString)
        unkString = recvPacket.ReadString(unkStringLength);

    if (hasUnk1)
        recvPacket >> glyphIndex; // not sure about this ...

    if (hasElevation)
        recvPacket >> elevation;

    sLog->outDebug(LOG_FILTER_NETWORKIO, "WORLD: got cast spell packet, castCount: %u, spellId: %u, targetFlags: %u, data length = %u", castCount, spellId, targetFlags, (uint32)recvPacket.size());

    // ignore for remote control state (for player case)
    Unit* mover = _player->m_mover;
    if (mover != _player && mover->GetTypeId() == TYPEID_PLAYER)
    {
        recvPacket.rfinish(); // prevent spam at ignore packet
        return;
    }

    SpellInfo const* spellInfo = sSpellMgr->GetSpellInfo(spellId);
    if (!spellInfo)
    {
        sLog->outError(LOG_FILTER_NETWORKIO, "WORLD: unknown spell id %u", spellId);
        recvPacket.rfinish(); // prevent spam at ignore packet
        return;
    }

    // Override spell Id, client send base spell and not the overrided id
    if (!spellInfo->OverrideSpellList.empty())
    {
        for (auto itr : spellInfo->OverrideSpellList)
        {
            if (_player->HasSpell(itr))
            {
                SpellInfo const* overrideSpellInfo = sSpellMgr->GetSpellInfo(itr);
                if (overrideSpellInfo)
                {
                    spellInfo = overrideSpellInfo;
                    spellId = itr;
                }
                break;
            }
        }
    }

    if (mover->GetTypeId() == TYPEID_PLAYER)
    {
        // not have spell in spellbook or spell passive and not casted by client
        if (!mover->ToPlayer()->HasActiveSpell(spellId) || spellInfo->IsPassive())
        {
            //cheater? kick? ban?
            recvPacket.rfinish(); // prevent spam at ignore packet
            return;
        }
    }
    else
    {
        // not have spell in spellbook or spell passive and not casted by client
        if ((mover->GetTypeId() == TYPEID_UNIT && !mover->ToCreature()->HasSpell(spellId)) || spellInfo->IsPassive())
        {
            //cheater? kick? ban?
            recvPacket.rfinish(); // prevent spam at ignore packet
            return;
        }
    }

    Unit::AuraEffectList swaps = mover->GetAuraEffectsByType(SPELL_AURA_OVERRIDE_ACTIONBAR_SPELLS);
    Unit::AuraEffectList const& swaps2 = mover->GetAuraEffectsByType(SPELL_AURA_OVERRIDE_ACTIONBAR_SPELLS_2);
    if (!swaps2.empty())
        swaps.insert(swaps.end(), swaps2.begin(), swaps2.end());

    if (!swaps.empty())
    {
        for (Unit::AuraEffectList::const_iterator itr = swaps.begin(); itr != swaps.end(); ++itr)
        {
            if ((*itr)->IsAffectingSpell(spellInfo))
            {
                if (SpellInfo const* newInfo = sSpellMgr->GetSpellInfo((*itr)->GetAmount()))
                {
                    spellInfo = newInfo;
                    spellId = newInfo->Id;
                }
                break;
            }
        }
    }

    // Client is resending autoshot cast opcode when other spell is casted during shoot rotation
    // Skip it to prevent "interrupt" message
    if (spellInfo->IsAutoRepeatRangedSpell() && _player->GetCurrentSpell(CURRENT_AUTOREPEAT_SPELL)
        && _player->GetCurrentSpell(CURRENT_AUTOREPEAT_SPELL)->m_spellInfo == spellInfo)
    {
        recvPacket.rfinish();
        return;
    }

    // can't use our own spells when we're in possession of another unit,
    if (_player->isPossessing())
    {
        recvPacket.rfinish(); // prevent spam at ignore packet
        return;
    }

    // client provided targets
    SpellCastTargets targets;
    //HandleClientCastFlags(recvPacket, castFlags, targets);

    // Build SpellCastTargets
    /*uint32 targetFlags = 0;

    if (itemTarget)
        targetFlags |= TARGET_FLAG_ITEM;

    if (IS_UNIT_GUID(targetGuid))
        targetFlags |= TARGET_FLAG_UNIT;

    if (IS_GAMEOBJECT_GUID(targetGuid))
        targetFlags |= TARGET_FLAG_GAMEOBJECT;*/

    // TODO : TARGET_FLAG_TRADE_ITEM, TARGET_FLAG_SOURCE_LOCATION, TARGET_FLAG_DEST_LOCATION, TARGET_FLAG_UNIT_MINIPET, TARGET_FLAG_CORPSE_ENEMY, TARGET_FLAG_CORPSE_ALLY

    targets.Initialize(targetFlags, targetGuid, itemTarget, Guid3, destPos, Guid2, srcPos);
    targets.SetElevation(elevation);
    targets.SetSpeed(speed);
    targets.Update(mover);

    // auto-selection buff level base at target level (in spellInfo)
    if (targets.GetUnitTarget())
    {
        SpellInfo const* actualSpellInfo = spellInfo->GetAuraRankForLevel(targets.GetUnitTarget()->getLevel());

        // if rank not found then function return NULL but in explicit cast case original spell can be casted and later failed with appropriate error message
        if (actualSpellInfo)
            spellInfo = actualSpellInfo;
    }

    // Custom MoP Script
    // Power Word : Solace - 129250 and Power Word : Insanity - 129249
    if (spellInfo->Id == 129250 && _player->GetShapeshiftForm() == FORM_SHADOW)
    {
        SpellInfo const* newSpellInfo = sSpellMgr->GetSpellInfo(129249);
        if (newSpellInfo)
        {
            spellInfo = newSpellInfo;
            spellId = newSpellInfo->Id;
        }
    }
    // Aimed Shot - 19434 and Aimed Shot (for Master Marksman) - 82928
    else if (spellInfo->Id == 19434 && _player->HasAura(82926))
    {
        SpellInfo const* newSpellInfo = sSpellMgr->GetSpellInfo(82928);
        if (newSpellInfo)
        {
            spellInfo = newSpellInfo;
            spellId = newSpellInfo->Id;
        }
    }
    // Alter Time - 108978 and Alter Time (overrided) - 127140
    else if (spellInfo->Id == 108978 && _player->HasAura(110909))
    {
        SpellInfo const* newSpellInfo = sSpellMgr->GetSpellInfo(127140);
        if (newSpellInfo)
        {
            spellInfo = newSpellInfo;
            spellId = newSpellInfo->Id;
        }
    }
    // Fix Dark Soul for Destruction warlocks
    else if (spellInfo->Id == 113860 && _player->GetSpecializationId(_player->GetActiveSpec()) == SPEC_WARLOCK_DESTRUCTION)
    {
        SpellInfo const* newSpellInfo = sSpellMgr->GetSpellInfo(113858);
        if (newSpellInfo)
        {
            spellInfo = newSpellInfo;
            spellId = newSpellInfo->Id;
        }
    }
    // Halo - 120517 and Halo - 120644 (shadow form)
    else if (spellInfo->Id == 120517 && _player->HasAura(15473))
    {
        SpellInfo const* newSpellInfo = sSpellMgr->GetSpellInfo(120644);
        if (newSpellInfo)
        {
            spellInfo = newSpellInfo;
            spellId = newSpellInfo->Id;
        }
    }
    // Consecration - 116467 and Consecration - 26573
    else if (spellInfo->Id == 116467)
    {
        SpellInfo const* newSpellInfo = sSpellMgr->GetSpellInfo(26573);
        if (newSpellInfo)
        {
            spellInfo = newSpellInfo;
            spellId = newSpellInfo->Id;
        }
    }
    // Cascade (shadow) - 127632 and Cascade - 121135
    else if (spellInfo->Id == 121135 && _player->HasAura(15473))
    {
        SpellInfo const* newSpellInfo = sSpellMgr->GetSpellInfo(127632);
        if (newSpellInfo)
        {
            spellInfo = newSpellInfo;
            spellId = newSpellInfo->Id;
        }
    }
    // Zen Pilgrimage - 126892 and Zen Pilgrimage : Return - 126895
    else if (spellInfo->Id == 126892 && _player->HasAura(126896))
    {
        SpellInfo const* newSpellInfo = sSpellMgr->GetSpellInfo(126895);
        if (newSpellInfo)
        {
            spellInfo = newSpellInfo;
            spellId = newSpellInfo->Id;
        }
    }
    // Soul Swap - 86121 and Soul Swap : Exhale - 86213
    else if (spellInfo->Id == 86121 && _player->HasAura(86211))
    {
        SpellInfo const* newSpellInfo = sSpellMgr->GetSpellInfo(86213);
        if (newSpellInfo)
        {
            spellInfo = newSpellInfo;
            spellId = newSpellInfo->Id;
            _player->RemoveAura(86211);
        }
    }
    // Mage Bomb - 125430 and  Living Bomb - 44457
    else if (spellInfo->Id == 125430 && _player->HasSpell(44457))
    {
        SpellInfo const* newSpellInfo = sSpellMgr->GetSpellInfo(44457);
        if (newSpellInfo)
        {
            spellInfo = newSpellInfo;
            spellId = newSpellInfo->Id;
        }
    }
    // Mage Bomb - 125430 and Frost Bomb - 112948
    else if (spellInfo->Id == 125430 && _player->HasSpell(112948))
    {
        SpellInfo const* newSpellInfo = sSpellMgr->GetSpellInfo(112948);
        if (newSpellInfo)
        {
            spellInfo = newSpellInfo;
            spellId = newSpellInfo->Id;
        }
    }
    // Mage Bomb - 125430 and  Nether Tempest - 114923
    else if (spellInfo->Id == 125430 && _player->HasSpell(114923))
    {
        SpellInfo const* newSpellInfo = sSpellMgr->GetSpellInfo(114923);
        if (newSpellInfo)
        {
            spellInfo = newSpellInfo;
            spellId = newSpellInfo->Id;
        }
    }
    // Evocation - 12051 and  Rune of Power - 116011
    else if (spellInfo->Id == 12051 && _player->HasSpell(116011))
    {
        SpellInfo const* newSpellInfo = sSpellMgr->GetSpellInfo(116011);
        if (newSpellInfo)
        {
            spellInfo = newSpellInfo;
            spellId = newSpellInfo->Id;
        }
    }
    // Frostbolt - 116 and Frostbolt - 126201 (heal for water elemental)
    else if (spellInfo->Id == 116 && targets.GetUnitTarget())
    {
        if (targets.GetUnitTarget()->GetOwner() && targets.GetUnitTarget()->GetOwner()->GetTypeId() == TYPEID_PLAYER && targets.GetUnitTarget()->GetOwner()->GetGUID() == _player->GetGUID())
        {
            SpellInfo const* newSpellInfo = sSpellMgr->GetSpellInfo(126201);
            if (newSpellInfo)
            {
                spellInfo = newSpellInfo;
                spellId = newSpellInfo->Id;
            }
        }
    }
    // Surging Mist - 116694 and Surging Mist - 116995
    // Surging Mist is instantly casted if player is channeling Soothing Mist
    else if (spellInfo->Id == 116694 && _player->GetCurrentSpell(CURRENT_CHANNELED_SPELL) && _player->GetCurrentSpell(CURRENT_CHANNELED_SPELL)->GetSpellInfo()->Id == 115175)
    {
        recvPacket.rfinish();
        _player->CastSpell(targets.GetUnitTarget(), 116995, true);
        _player->EnergizeBySpell(_player, 116995, 1, POWER_CHI);
        int32 powerCost = spellInfo->CalcPowerCost(_player, spellInfo->GetSchoolMask(), _player->GetSpellPowerEntryBySpell(spellInfo));
        _player->ModifyPower(POWER_MANA, -powerCost);
        return;
    }
    // Enveloping Mist - 124682 and Enveloping Mist - 132120
    // Enveloping Mist is instantly casted if player is channeling Soothing Mist
    else if (spellInfo->Id == 124682 && _player->GetCurrentSpell(CURRENT_CHANNELED_SPELL) && _player->GetCurrentSpell(CURRENT_CHANNELED_SPELL)->GetSpellInfo()->Id == 115175)
    {
        recvPacket.rfinish();
        _player->CastSpell(targets.GetUnitTarget(), 132120, true);
        int32 powerCost = spellInfo->CalcPowerCost(_player, spellInfo->GetSchoolMask(), _player->GetSpellPowerEntryBySpell(spellInfo));
        _player->ModifyPower(POWER_CHI, -powerCost);
        return;
    }

    Spell* spell = new Spell(mover, spellInfo, TRIGGERED_NONE, 0, false);
    spell->m_cast_count = castCount;                       // set count of casts
    spell->m_glyphIndex = glyphIndex;
    spell->prepare(&targets);
}

void WorldSession::HandleCancelCastOpcode(WorldPacket& recvPacket)
{
    uint32 spellId;
    bool unk, hasSpell;

    unk = recvPacket.ReadBit();
    hasSpell = !recvPacket.ReadBit();
    recvPacket.FlushBits();

    if (hasSpell)
        recvPacket >> spellId;

    recvPacket.read_skip<uint8>();                          // counter, increments with every CANCEL packet, don't use for now

    if (_player->IsNonMeleeSpellCasted(false))
        _player->InterruptNonMeleeSpells(false, spellId, false);
}

void WorldSession::HandleCancelAuraOpcode(WorldPacket& recvPacket)
{
    uint32 spellId;
    ObjectGuid casterGuid;
    bool unk;

    recvPacket >> spellId;

    unk = recvPacket.ReadBit();

    uint8 bitsOrder[8] = { 0, 2, 4, 1, 3, 7, 5, 6 };
    recvPacket.ReadBitInOrder(casterGuid, bitsOrder);

    recvPacket.FlushBits();

    uint8 bytesOrder[8] = { 5, 1, 4, 6, 0, 7, 3, 2 };
    recvPacket.ReadBytesSeq(casterGuid, bytesOrder);

    SpellInfo const* spellInfo = sSpellMgr->GetSpellInfo(spellId);
    if (!spellInfo)
        return;

    // not allow remove spells with attr SPELL_ATTR0_CANT_CANCEL
    if (spellInfo->Attributes & SPELL_ATTR0_CANT_CANCEL)
        return;

    // channeled spell case (it currently casted then)
    if (spellInfo->IsChanneled())
    {
        if (Spell* curSpell = _player->GetCurrentSpell(CURRENT_CHANNELED_SPELL))
            if (curSpell->m_spellInfo->Id == spellId)
                _player->InterruptSpell(CURRENT_CHANNELED_SPELL);
        return;
    }

    // non channeled case:
    // don't allow remove non positive spells
    // don't allow cancelling passive auras (some of them are visible)
    if (!spellInfo->IsPositive() || spellInfo->IsPassive())
        return;

    _player->RemoveOwnedAura(spellId, casterGuid, 0, AURA_REMOVE_BY_CANCEL);
}

void WorldSession::HandlePetCancelAuraOpcode(WorldPacket& recvPacket)
{
    uint64 guid;
    uint32 spellId;

    recvPacket >> guid;
    recvPacket >> spellId;

    SpellInfo const* spellInfo = sSpellMgr->GetSpellInfo(spellId);
    if (!spellInfo)
    {
        sLog->outError(LOG_FILTER_NETWORKIO, "WORLD: unknown PET spell id %u", spellId);
        return;
    }

    Creature* pet=ObjectAccessor::GetCreatureOrPetOrVehicle(*_player, guid);

    if (!pet)
    {
        sLog->outError(LOG_FILTER_NETWORKIO, "HandlePetCancelAura: Attempt to cancel an aura for non-existant pet %u by player '%s'", uint32(GUID_LOPART(guid)), GetPlayer()->GetName());
        return;
    }

    if (pet != GetPlayer()->GetGuardianPet() && pet != GetPlayer()->GetCharm())
    {
        sLog->outError(LOG_FILTER_NETWORKIO, "HandlePetCancelAura: Pet %u is not a pet of player '%s'", uint32(GUID_LOPART(guid)), GetPlayer()->GetName());
        return;
    }

    if (!pet->isAlive())
    {
        pet->SendPetActionFeedback(FEEDBACK_PET_DEAD);
        return;
    }

    pet->RemoveOwnedAura(spellId, 0, 0, AURA_REMOVE_BY_CANCEL);

    pet->AddCreatureSpellCooldown(spellId);
}

void WorldSession::HandleCancelGrowthAuraOpcode(WorldPacket& /*recvPacket*/)
{
}

void WorldSession::HandleCancelAutoRepeatSpellOpcode(WorldPacket& /*recvPacket*/)
{
    // may be better send SMSG_CANCEL_AUTO_REPEAT?
    // cancel and prepare for deleting
    _player->InterruptSpell(CURRENT_AUTOREPEAT_SPELL);
}

void WorldSession::HandleCancelChanneling(WorldPacket& recvData)
{
    recvData.read_skip<uint32>();                          // spellid, not used

    // ignore for remote control state (for player case)
    Unit* mover = _player->m_mover;
    if (mover != _player && mover->GetTypeId() == TYPEID_PLAYER)
        return;

    mover->InterruptSpell(CURRENT_CHANNELED_SPELL);
}

void WorldSession::HandleTotemDestroyed(WorldPacket& recvPacket)
{
    // ignore for remote control state
    if (_player->m_mover != _player)
        return;

    uint8 slotId;
    uint64 unkSkip;

    recvPacket >> slotId;
    recvPacket >> unkSkip;

    ++slotId;
    if (slotId >= MAX_TOTEM_SLOT)
        return;

    if (!_player->m_SummonSlot[slotId])
        return;

    Creature* totem = GetPlayer()->GetMap()->GetCreature(_player->m_SummonSlot[slotId]);
    if (totem && totem->isTotem())
        totem->ToTotem()->UnSummon();
}

void WorldSession::HandleSelfResOpcode(WorldPacket& /*recvData*/)
{
    sLog->outDebug(LOG_FILTER_NETWORKIO, "WORLD: CMSG_SELF_RES");                  // empty opcode

    if (_player->HasAuraType(SPELL_AURA_PREVENT_RESURRECTION))
        return; // silent return, client should display error by itself and not send this opcode

    if (_player->GetUInt32Value(PLAYER_SELF_RES_SPELL))
    {
        SpellInfo const* spellInfo = sSpellMgr->GetSpellInfo(_player->GetUInt32Value(PLAYER_SELF_RES_SPELL));
        if (spellInfo)
            _player->CastSpell(_player, spellInfo, false, 0);

        _player->SetUInt32Value(PLAYER_SELF_RES_SPELL, 0);
    }
}

void WorldSession::HandleSpellClick(WorldPacket& recvData)
{
    ObjectGuid guid;
    
    guid[1] = recvData.ReadBit();
    guid[7] = recvData.ReadBit();
    guid[4] = recvData.ReadBit();
    guid[5] = recvData.ReadBit();
    guid[3] = recvData.ReadBit();
    guid[6] = recvData.ReadBit();
    guid[2] = recvData.ReadBit();
    recvData.ReadBit();
    guid[0] = recvData.ReadBit();

    recvData.ReadByteSeq(guid[0]);
    recvData.ReadByteSeq(guid[2]);
    recvData.ReadByteSeq(guid[3]);
    recvData.ReadByteSeq(guid[1]);
    recvData.ReadByteSeq(guid[4]);
    recvData.ReadByteSeq(guid[6]);
    recvData.ReadByteSeq(guid[5]);
    recvData.ReadByteSeq(guid[7]);

    // this will get something not in world. crash
    Creature* unit = ObjectAccessor::GetCreatureOrPetOrVehicle(*_player, guid);

    if (!unit)
        return;

    // TODO: Unit::SetCharmedBy: 28782 is not in world but 0 is trying to charm it! -> crash
    if (!unit->IsInWorld())
        return;

    unit->HandleSpellClick(_player);
}

void WorldSession::HandleMirrorImageDataRequest(WorldPacket& recvData)
{
    sLog->outDebug(LOG_FILTER_NETWORKIO, "WORLD: CMSG_GET_MIRRORIMAGE_DATA");
    uint64 guid;
    uint32 displayId;
    recvData >> guid >> displayId;

    // Get unit for which data is needed by client
    Unit* unit = ObjectAccessor::GetObjectInWorld(guid, (Unit*)NULL);
    if (!unit)
        return;

    if (!unit->HasAuraType(SPELL_AURA_CLONE_CASTER))
        return;

    // Get creator of the unit (SPELL_AURA_CLONE_CASTER does not stack)
    Unit* creator = unit->GetAuraEffectsByType(SPELL_AURA_CLONE_CASTER).front()->GetCaster();
    if (!creator)
        return;

    if (creator->GetDarkSimulacrum())
        creator = creator->GetDarkSimulacrum();

    WorldPacket data(SMSG_MIRROR_IMAGE_DATA, 68);
    data << uint64(guid);
    data << uint32(creator->GetDisplayId());
    data << uint8(creator->getRace());
    data << uint8(creator->getGender());
    data << uint8(creator->getClass());

    if (creator->GetTypeId() == TYPEID_PLAYER)
    {
        Player* player = creator->ToPlayer();
        Guild* guild = NULL;

        if (uint32 guildId = player->GetGuildId())
            guild = sGuildMgr->GetGuildById(guildId);

        data << uint8(player->GetByteValue(PLAYER_FIELD_BYTES, 0));   // skin
        data << uint8(player->GetByteValue(PLAYER_FIELD_BYTES, 1));   // face
        data << uint8(player->GetByteValue(PLAYER_FIELD_BYTES, 2));   // hair
        data << uint8(player->GetByteValue(PLAYER_FIELD_BYTES, 3));   // haircolor
        data << uint8(player->GetByteValue(PLAYER_BYTES_2, 0)); // facialhair
        data << uint64(guild ? guild->GetGUID() : 0);

        static EquipmentSlots const itemSlots[] =
        {
            EQUIPMENT_SLOT_HEAD,
            EQUIPMENT_SLOT_SHOULDERS,
            EQUIPMENT_SLOT_BODY,
            EQUIPMENT_SLOT_CHEST,
            EQUIPMENT_SLOT_WAIST,
            EQUIPMENT_SLOT_LEGS,
            EQUIPMENT_SLOT_FEET,
            EQUIPMENT_SLOT_WRISTS,
            EQUIPMENT_SLOT_HANDS,
            EQUIPMENT_SLOT_BACK,
            EQUIPMENT_SLOT_TABARD,
            EQUIPMENT_SLOT_END
        };

        // Display items in visible slots
        for (EquipmentSlots const* itr = &itemSlots[0]; *itr != EQUIPMENT_SLOT_END; ++itr)
        {
            if (*itr == EQUIPMENT_SLOT_HEAD && player->HasFlag(PLAYER_FLAGS, PLAYER_FLAGS_HIDE_HELM))
                data << uint32(0);
            else if (*itr == EQUIPMENT_SLOT_BACK && player->HasFlag(PLAYER_FLAGS, PLAYER_FLAGS_HIDE_CLOAK))
                data << uint32(0);
            else if (Item const* item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, *itr))
                data << uint32(item->GetTemplate()->DisplayInfoID);
            else
                data << uint32(0);
        }
    }
    else
    {
        // Skip player data for creatures
        data << uint8(0);
        data << uint32(0);
        data << uint32(0);
        data << uint32(0);
        data << uint32(0);
        data << uint32(0);
        data << uint32(0);
        data << uint32(0);
        data << uint32(0);
        data << uint32(0);
        data << uint32(0);
        data << uint32(0);
        data << uint32(0);
        data << uint32(0);
    }

    SendPacket(&data);
}

void WorldSession::HandleUpdateProjectilePosition(WorldPacket& recvPacket)
{
    sLog->outDebug(LOG_FILTER_NETWORKIO, "WORLD: CMSG_UPDATE_PROJECTILE_POSITION");

    uint64 casterGuid;
    uint32 spellId;
    uint8 castCount;
    float x, y, z;    // Position of missile hit

    recvPacket >> casterGuid;
    recvPacket >> spellId;
    recvPacket >> castCount;
    recvPacket >> x;
    recvPacket >> y;
    recvPacket >> z;

    Unit* caster = ObjectAccessor::GetUnit(*_player, casterGuid);
    if (!caster)
        return;

    Spell* spell = caster->FindCurrentSpellBySpellId(spellId);
    if (!spell || !spell->m_targets.HasDst())
        return;

    Position pos = *spell->m_targets.GetDstPos();
    pos.Relocate(x, y, z);
    spell->m_targets.ModDst(pos);

    WorldPacket data(SMSG_SET_PROJECTILE_POSITION, 21);
    data << uint64(casterGuid);
    data << uint8(castCount);
    data << float(x);
    data << float(y);
    data << float(z);
    caster->SendMessageToSet(&data, true);
}
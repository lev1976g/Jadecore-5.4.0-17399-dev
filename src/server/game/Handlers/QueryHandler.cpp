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
#include "Language.h"
#include "DatabaseEnv.h"
#include "WorldPacket.h"
#include "WorldSession.h"
#include "Opcodes.h"
#include "Log.h"
#include "World.h"
#include "ObjectMgr.h"
#include "Player.h"
#include "UpdateMask.h"
#include "NPCHandler.h"
#include "Pet.h"
#include "MapManager.h"

void WorldSession::SendNameQueryOpcode(uint64 guid)
{
    Player* player = ObjectAccessor::FindPlayer(guid);
    CharacterNameData const* nameData = sWorld->GetCharacterNameData(GUID_LOPART(guid));
	
    WorldPacket data(SMSG_NAME_QUERY_RESPONSE, (8+1+1+1+1+1+10));
    ObjectGuid guid1 = guid;
    ObjectGuid guid2 = guid;
    
    data.WriteBit(guid1[5]);
    data.WriteBit(guid1[7]);
    data.WriteBit(guid1[3]);
    data.WriteBit(guid1[0]);
    data.WriteBit(guid1[4]);
    data.WriteBit(guid1[1]);
    data.WriteBit(guid1[6]);
    data.WriteBit(guid1[2]);

    data.WriteByteSeq(guid1[7]);
    data.WriteByteSeq(guid1[4]);
    data.WriteByteSeq(guid1[3]);

    data << uint8(nameData ? 0 : 1);
    if (nameData)
    {
        data << uint32(0);
        data << uint8(nameData->m_race);
        data << uint8(nameData->m_gender);
        data << uint8(nameData->m_level);
        data << uint8(nameData->m_class);
        data << uint32(realmID);
    }

    data.WriteByteSeq(guid1[1]);
    data.WriteByteSeq(guid1[5]);
    data.WriteByteSeq(guid1[0]);
    data.WriteByteSeq(guid1[6]);
    data.WriteByteSeq(guid1[2]);

    if (nameData)
    {
        data.WriteBit(guid2[6]);
        data.WriteBit(0);
        data.WriteBits(nameData->m_name.length(), 6);
        data.WriteBit(guid2[1]);
        data.WriteBit(guid2[7]);
        data.WriteBit(guid2[2]);
        data.WriteBit(0);
        data.WriteBit(guid2[4]);
        data.WriteBit(guid2[0]);
        data.WriteBit(0);

        for (uint8 i = 0; i < MAX_DECLINED_NAME_CASES; ++i)
            data.WriteBits(0/*names->name[i].length()*/, 7);

        data.WriteBit(0);
        data.WriteBit(guid2[3]);
        data.WriteBit(0);
        data.WriteBit(0);
        data.WriteBit(guid2[5]);

        data.WriteBit(0);

        data.WriteBit(0);
        data.WriteBit(0);

        data.FlushBits();
        data.WriteString(nameData->m_name);

        data.WriteByteSeq(guid2[4]);
        data.WriteByteSeq(guid2[6]);
        data.WriteByteSeq(guid2[5]);
        data.WriteByteSeq(guid2[1]);
        data.WriteByteSeq(guid2[7]);

        //for (uint8 i = 0; i < MAX_DECLINED_NAME_CASES; ++i)
        //    data.WriteString(nameData->m_declinedNames[i]);

        data.WriteByteSeq(guid2[3]);
        data.WriteByteSeq(guid2[0]);
        data.WriteByteSeq(guid2[2]);
    }

    SendPacket(&data);
}

void WorldSession::HandleNameQueryOpcode(WorldPacket& recvData)
{
    ObjectGuid guid;
    uint32 l_RealmID;
    uint32 unk2;
     
    guid[5]     = recvData.ReadBit();
    guid[7]     = recvData.ReadBit();
    guid[0]     = recvData.ReadBit();
    guid[1]     = recvData.ReadBit();
    l_RealmID   = recvData.ReadBit();
    guid[6]     = recvData.ReadBit();
    unk2        = recvData.ReadBit();
    guid[3]     = recvData.ReadBit();
    guid[2]     = recvData.ReadBit();
    guid[4]     = recvData.ReadBit();

    recvData.ReadByteSeq(guid[0]);
    recvData.ReadByteSeq(guid[1]);
    recvData.ReadByteSeq(guid[3]);
    recvData.ReadByteSeq(guid[4]);
    recvData.ReadByteSeq(guid[6]);
    recvData.ReadByteSeq(guid[5]);
    recvData.ReadByteSeq(guid[2]);
    recvData.ReadByteSeq(guid[7]);

    if (unk2)
        recvData >> unk2;
    if (l_RealmID)
        recvData >> l_RealmID;

    // This is disable by default to prevent lots of console spam
    // sLog->outInfo(LOG_FILTER_NETWORKIO, "HandleNameQueryOpcode %u", guid);

    SendNameQueryOpcode(guid);
}

void WorldSession::HandleQueryTimeOpcode(WorldPacket & /*recvData*/)
{
    SendQueryTimeResponse();
}

void WorldSession::SendQueryTimeResponse()
{
    WorldPacket data(SMSG_QUERY_TIME_RESPONSE, 4+4);
    data << uint32(time(NULL));
    data << uint32(sWorld->GetNextDailyQuestsResetTime() - time(NULL));
    SendPacket(&data);
}

/// Only _static_ data is sent in this packet !!!
void WorldSession::HandleCreatureQueryOpcode(WorldPacket & recvData)
{
    uint32 entry;
    recvData >> entry;
	
    WorldPacket data(SMSG_CREATURE_QUERY_RESPONSE, 100);
    data << uint32(entry);                                                          // creature entry

    if (CreatureTemplate const* ci = sObjectMgr->GetCreatureTemplate(entry))
    {
        std::string Name, SubName;
        Name = ci->Name;
        SubName = ci->SubName;

        int loc_idx = GetSessionDbLocaleIndex();
        if (loc_idx >= 0)
        {
            if (CreatureLocale const* cl = sObjectMgr->GetCreatureLocale(entry))
            {
                ObjectMgr::GetLocaleString(cl->Name, loc_idx, Name);
                ObjectMgr::GetLocaleString(cl->SubName, loc_idx, SubName);
            }
        }
        sLog->outDebug(LOG_FILTER_NETWORKIO, "WORLD: CMSG_CREATURE_QUERY '%s' - Entry: %u.", ci->Name.c_str(), entry);

        data.WriteBit(1);                                                               // has valid data
        data.WriteBits(Name.size() ? Name.size() + 1 : 0, 11);                          // Male

        for (int i = 0; i < 7; i++)
            data.WriteBits(Name.size() ? Name.size() + 1 : 0, 11);
		
        data.WriteBits(MAX_CREATURE_QUEST_ITEMS, 22);
        data.WriteBits(ci->IconName.size() ? ci->IconName.size() + 1 : 0, 6);
        data.WriteBits(SubName.size() ? SubName.size() + 1 : 0, 11);
        data.WriteBits(0, 11);
        data.WriteBit(ci->RacialLeader);                    // isRacialLeader
        data.FlushBits();
        data << uint32(ci->type);                           // CreatureType.dbc
        data << uint32(ci->KillCredit[1]);                  // new in 3.1, kill credit
        data << uint32(ci->Modelid4);                       // Modelid4
        data << uint32(ci->Modelid3);                       // Modelid3

        for (uint32 i = 0; i < MAX_CREATURE_QUEST_ITEMS; ++i)
                data << uint32(ci->questItems[i]);

        data << uint32(ci->expansionUnknown);               // unknown meaning

        if (ci->Name.size())
            data << Name;                                   // Name
		
        for (int i = 0; i < 7; i++)
            data << Name;

        data << float(ci->ModMana);                         // dmg/mana modifier
        data << uint32(ci->Modelid1);                       // Modelid1

        if (ci->IconName != "")
            data << ci->IconName;                           // Icon Name

        data << uint32(ci->KillCredit[0]);                  // new in 3.1, kill credit
        data << uint32(ci->Modelid2);                       // Modelid2

        if (SubName != "")
            data << SubName;                                // Sub Name

        data << uint32(ci->type_flags);                     // flags
        data << uint32(ci->type_flags2);                    // unknown meaning
        data << float(ci->ModHealth);                       // dmg/hp modifier
        data << uint32(ci->family);                         // CreatureFamily.dbc
        data << uint32(ci->rank);                           // Creature Rank (elite, boss, etc)
        data << uint32(ci->movementId);                     // CreatureMovementInfo.dbc

        SendPacket(&data);
        sLog->outDebug(LOG_FILTER_NETWORKIO, "WORLD: Sent SMSG_CREATURE_QUERY_RESPONSE");
    }
    else
    {
        sLog->outDebug(LOG_FILTER_NETWORKIO, "WORLD: CMSG_CREATURE_QUERY - NO CREATURE INFO! (ENTRY: %u)", entry);
        WorldPacket data(SMSG_CREATURE_QUERY_RESPONSE, 4);
        data << uint32(entry | 0x80000000);
        data.WriteBit(0); // has no valid data
        SendPacket(&data);
        sLog->outDebug(LOG_FILTER_NETWORKIO, "WORLD: Sent SMSG_CREATURE_QUERY_RESPONSE");
    }
}

/// Only _static_ data is sent in this packet !!!
void WorldSession::HandleGameObjectQueryOpcode(WorldPacket & recvData)
{
    uint32 entry;
    recvData >> entry;
    ObjectGuid guid;

    uint8 bitOrder[8] = { 2, 4, 3, 7, 0, 6, 1, 5 };
    recvData.ReadBitInOrder(guid, bitOrder);

    recvData.FlushBits();

    uint8 byteOrder[8] = { 1, 7, 2, 3, 6, 5, 4, 0 };
    recvData.ReadBytesSeq(guid, byteOrder);

    if (const GameObjectTemplate* info = sObjectMgr->GetGameObjectTemplate(entry))
    {
        std::string Name;
        std::string IconName;
        std::string CastBarCaption;

        Name = info->name;
        IconName = info->IconName;
        CastBarCaption = info->castBarCaption;

        int loc_idx = GetSessionDbLocaleIndex();
        if (loc_idx >= 0)
        {
            if (GameObjectLocale const* gl = sObjectMgr->GetGameObjectLocale(entry))
            {
                ObjectMgr::GetLocaleString(gl->Name, loc_idx, Name);
                ObjectMgr::GetLocaleString(gl->CastBarCaption, loc_idx, CastBarCaption);
            }
        }

        sLog->outDebug(LOG_FILTER_NETWORKIO, "WORLD: CMSG_GAMEOBJECT_QUERY '%s' - Entry: %u. ", info->name.c_str(), entry);
        WorldPacket data (SMSG_GAMEOBJECT_QUERY_RESPONSE);
        ByteBuffer byteBuffer;

        data.WriteBit(1);                                               // Always 1, from sniffs
        data.FlushBits();

        data << uint32(entry);

        {
            byteBuffer << uint32(info->type);
            byteBuffer << uint32(info->displayId);
            byteBuffer << Name;
            byteBuffer << uint32(0);                                    // unk
            byteBuffer << CastBarCaption;                               // 2.0.3, string. Text will appear in Cast Bar when using GO (ex: "Collecting")
            byteBuffer << IconName;                                     // 2.0.3, string. Icon name to use instead of default icon for go's (ex: "Attack" makes sword)

            for (int i = 0; i < 32; i++)
                byteBuffer << uint32(info->raw.data[i]);

            byteBuffer << float(info->size);                            // go size

            uint8 questItemCount = 0;
            for (uint32 i = 0; i < MAX_GAMEOBJECT_QUEST_ITEMS; ++i)
                if (info->questItems[i])
                    questItemCount++;

            byteBuffer << uint8(questItemCount);

            for (int i = 0; i < MAX_GAMEOBJECT_QUEST_ITEMS && questItemCount > 0; i++)
            {
                if (info->questItems[i])
                {
                    byteBuffer << uint32(info->questItems[i]);          // itemId[6], quest drop
                    questItemCount--;
                }
            }

            byteBuffer << uint32(info->unkInt32);                       // 4.x, unknown
        }

        data << uint32(byteBuffer.size());
        data.append(byteBuffer);

        SendPacket(&data);
        sLog->outDebug(LOG_FILTER_NETWORKIO, "WORLD: Sent SMSG_GAMEOBJECT_QUERY_RESPONSE");
    }
    else
    {
        sLog->outDebug(LOG_FILTER_NETWORKIO, "WORLD: CMSG_GAMEOBJECT_QUERY - Missing gameobject info for (GUID: %u, ENTRY: %u)",
            GUID_LOPART(guid), entry);
        WorldPacket data (SMSG_GAMEOBJECT_QUERY_RESPONSE, 4);
        data << uint32(entry | 0x80000000);
        SendPacket(&data);
        sLog->outDebug(LOG_FILTER_NETWORKIO, "WORLD: Sent SMSG_GAMEOBJECT_QUERY_RESPONSE");
    }
}

void WorldSession::HandleCorpseQueryOpcode(WorldPacket& /*recvData*/)
{
    sLog->outDebug(LOG_FILTER_NETWORKIO, "WORLD: Received CMSG_CORPSE_QUERY");

    Corpse* corpse = GetPlayer()->GetCorpse();

    if (!corpse)
    {
        WorldPacket data(SMSG_CORPSE_QUERY);

        data << uint32(0);
        data << float(0);
        data << uint32(0);
        data << float(0);
        data << float(0);

        data.WriteBit(0);
        data.WriteBit(0);
        data.WriteBit(0);
        data.WriteBit(0);
        data.WriteBit(0);
        data.WriteBit(0);
        data.WriteBit(0);
        data.WriteBit(0);
        data.WriteBit(0);

        SendPacket(&data);
        return;
    }

    uint32 mapid = corpse->GetMapId();
    float x = corpse->GetPositionX();
    float y = corpse->GetPositionY();
    float z = corpse->GetPositionZ();
    uint32 corpsemapid = mapid;

    // if corpse at different map
    if (mapid != _player->GetMapId())
    {
        // search entrance map for proper show entrance
        if (MapEntry const* corpseMapEntry = sMapStore.LookupEntry(mapid))
        {
            if (corpseMapEntry->IsDungeon() && corpseMapEntry->entrance_map >= 0)
            {
                // if corpse map have entrance
                if (Map const* entranceMap = sMapMgr->CreateBaseMap(corpseMapEntry->entrance_map))
                {
                    mapid = corpseMapEntry->entrance_map;
                    x = corpseMapEntry->entrance_x;
                    y = corpseMapEntry->entrance_y;
                    z = entranceMap->GetHeight(GetPlayer()->GetPhaseMask(), x, y, MAX_HEIGHT);
                }
            }
        }
    }
    ObjectGuid guid = corpse->GetGUID();

    WorldPacket data(SMSG_CORPSE_QUERY);

    data << uint32(mapid);
    data << float(x);
    data << uint32(corpsemapid);
    data << float(y);
    data << float(z);

    data.WriteBit(guid[5]);
    data.WriteBit(guid[3]);
    data.WriteBit(guid[4]);
    data.WriteBit(guid[2]);
    data.WriteBit(guid[6]);
    data.WriteBit(guid[0]);
    data.WriteBit(guid[7]);
    data.WriteBit(guid[1]);
    data.WriteBit(1);

    data.WriteByteSeq(guid[4]);
    data.WriteByteSeq(guid[5]);
    data.WriteByteSeq(guid[2]);
    data.WriteByteSeq(guid[0]);
    data.WriteByteSeq(guid[1]);
    data.WriteByteSeq(guid[6]);
    data.WriteByteSeq(guid[7]);
    data.WriteByteSeq(guid[3]);

    SendPacket(&data);
}

void WorldSession::HandleNpcTextQueryOpcode(WorldPacket & recvData)
{
    ObjectGuid guid;
    uint32 textID;
    sLog->outDebug(LOG_FILTER_NETWORKIO, "WORLD: CMSG_NPC_TEXT_QUERY ID '%u'", textID);

    recvData >> textID;

	recvData.ReadBits(guid[7]);
	recvData.ReadBits(guid[3]);
	recvData.ReadBits(guid[1]);
	recvData.ReadBits(guid[5]);
	recvData.ReadBits(guid[6]);
	recvData.ReadBits(guid[4]);
	recvData.ReadBits(guid[0]);
	recvData.ReadBits(guid[2]);
	
    recvData.ReadByteSeq(guid[1]);
    recvData.ReadByteSeq(guid[5]);
    recvData.ReadByteSeq(guid[2]);
    recvData.ReadByteSeq(guid[7]);
    recvData.ReadByteSeq(guid[3]);
    recvData.ReadByteSeq(guid[6]);
    recvData.ReadByteSeq(guid[4]);
    recvData.ReadByteSeq(guid[0]);

    GetPlayer()->SetSelection(guid);

    GossipText const* pGossip = sObjectMgr->GetGossipText(textID);

    WorldPacket data(SMSG_NPC_TEXT_UPDATE, 100);          // guess size
    data << textID;
    data << uint32(0);	/// Data size
	
    for (size_t l_I = 0 ; l_I < TOTAL_LOCALES ; l_I++)
        data << uint32(textID);

    for (size_t l_I = 0 ; l_I < TOTAL_LOCALES ; l_I++)
        data << uint32(textID);
	
    data.WriteBit(1);
    data.FlushBits();

    data.wpos(4);
    data << uint32(data.size() - 9);

    SendPacket(&data);

    sLog->outDebug(LOG_FILTER_NETWORKIO, "WORLD: Sent SMSG_NPC_TEXT_UPDATE");
}

#define DEFAULT_GREETINGS_GOSSIP      68

void WorldSession::SendBroadcastTextDb2Reply(uint32 entry)
{
    ByteBuffer buff;
    WorldPacket data(SMSG_DB_REPLY);

    GossipText const* pGossip = sObjectMgr->GetGossipText(entry);

    if (!pGossip)
        pGossip = sObjectMgr->GetGossipText(DEFAULT_GREETINGS_GOSSIP);

    std::string text = "Greetings, $N";

    uint16 size1 = pGossip ? pGossip->Options[0].Text_0.length() : text.length();
    uint16 size2 = pGossip ? pGossip->Options[0].Text_1.length() : text.length();

    buff << uint32(entry);
    buff << uint32(0); // unk
    buff << uint16(size1);
    if(size1)
        buff << std::string( pGossip ? pGossip->Options[0].Text_0 : text);
    buff << uint16(size2);
    if(size2)
        buff << std::string(pGossip ? pGossip->Options[0].Text_1 : text);

    buff << uint32(0);
    buff << uint32(0);
    buff << uint32(0);

    buff << uint32(0);
    buff << uint32(0);
    buff << uint32(0);

    buff << uint32(0); // sound Id
    buff << uint32(pGossip ? pGossip->Options[0].Emotes[0]._Delay : 0); // Delay
    buff << uint32(pGossip ? pGossip->Options[0].Emotes[0]._Emote : 0); // Emote

    data << uint32(buff.size());
    data.append(buff);

    data << uint32(DB2_REPLY_BROADCAST_TEXT);
    data << uint32(sObjectMgr->GetHotfixDate(entry, DB2_REPLY_BROADCAST_TEXT));
    data << uint32(entry);

    SendPacket(&data);
}

/// Only _static_ data is sent in this packet !!!
void WorldSession::HandlePageTextQueryOpcode(WorldPacket& recvData)
{
    sLog->outDebug(LOG_FILTER_NETWORKIO, "WORLD: Received CMSG_PAGE_TEXT_QUERY");

    uint32 pageID;
    recvData >> pageID;
    recvData.read_skip<uint64>();                          // guid

    while (pageID)
    {
        PageText const* pageText = sObjectMgr->GetPageText(pageID);
                                                            // guess size
        WorldPacket data(SMSG_PAGE_TEXT_QUERY_RESPONSE, 50);
        data << pageID;

        if (!pageText)
        {
            data << "Item page missing.";
            data << uint32(0);
            pageID = 0;
        }
        else
        {
            std::string Text = pageText->Text;

            int loc_idx = GetSessionDbLocaleIndex();
            if (loc_idx >= 0)
                if (PageTextLocale const* player = sObjectMgr->GetPageTextLocale(pageID))
                    ObjectMgr::GetLocaleString(player->Text, loc_idx, Text);

            data << Text;
            data << uint32(pageText->NextPage);
            pageID = pageText->NextPage;
        }
        SendPacket(&data);

        sLog->outDebug(LOG_FILTER_NETWORKIO, "WORLD: Sent SMSG_PAGE_TEXT_QUERY_RESPONSE");
    }
}

void WorldSession::HandleCorpseMapPositionQuery(WorldPacket& recvData)
{
    sLog->outDebug(LOG_FILTER_NETWORKIO, "WORLD: Recv CMSG_CORPSE_MAP_POSITION_QUERY");

    // Read guid, useless
    recvData.rfinish();

    WorldPacket data(SMSG_CORPSE_MAP_POSITION_QUERY_RESPONSE, 4+4+4+4);
    data << float(0);
    data << float(0);
    data << float(0);
    data << float(0);
    SendPacket(&data);
}

void WorldSession::HandleQuestPOIQuery(WorldPacket& recvData)
{
    uint32 count;
    count = recvData.ReadBits(22); // quest count, max=25

    if (count >= MAX_QUEST_LOG_SIZE)
    {
        recvData.rfinish();
        return;
    }
	
    WorldPacket data(SMSG_QUEST_POI_QUERY_RESPONSE, 4+(4+4)*count);
    data << uint32(count); // count
    data.WriteBits(count, 20); // count

    for (uint32 i = 0; i < count; ++i)
    {
        uint32 questId;
        recvData >> questId; // quest id

        bool questOk = false;

        uint16 questSlot = _player->FindQuestSlot(questId);

        if (questSlot != MAX_QUEST_LOG_SIZE)
            questOk =_player->GetQuestSlotQuestId(questSlot) == questId;

        if (questOk)
        {
            QuestPOIVector const* POI = sObjectMgr->GetQuestPOIVector(questId);

            if (POI)
            {
                data << uint32(questId); // quest ID
                data << uint32(POI->size()); // POI count

                for (QuestPOIVector::const_iterator itr = POI->begin(); itr != POI->end(); ++itr)
                {
                    data << uint32(itr->Id);                // POI index
                    data << int32(itr->ObjectiveIndex);     // objective index
                    data << uint32(0);
                    data << uint32(itr->MapId);             // mapid
                    data << uint32(itr->AreaId);            // areaid
                    data << uint32(itr->Unk2);              // unknown
                    data << uint32(itr->Unk3);              // unknown
                    data << uint32(itr->Unk4);              // unknown
                    data << uint32(0);
                    data << uint32(0);
                    data << uint32(itr->points.size());     // POI points count

                    for (std::vector<QuestPOIPoint>::const_iterator itr2 = itr->points.begin(); itr2 != itr->points.end(); ++itr2)
                    {
                        data << int32(itr2->x); // POI point x
                        data << int32(itr2->y); // POI point y
                    }
                }
            }
            else
            {
                data << uint32(questId); // quest ID
                data << uint32(0); // POI count
            }
        }
        else
        {
            data << uint32(questId); // quest ID
            data << uint32(0); // POI count
        }
    }

    SendPacket(&data);
}

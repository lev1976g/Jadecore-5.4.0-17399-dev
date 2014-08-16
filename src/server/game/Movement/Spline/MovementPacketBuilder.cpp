/*
 * Copyright (C) 2008-2012 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#include "MovementPacketBuilder.h"
#include "MoveSpline.h"
#include "WorldPacket.h"
#include "Object.h"

namespace Movement
{
    inline void operator << (ByteBuffer& b, const Vector3& v)
    {
        b << v.x << v.y << v.z;
    }

    inline void operator >> (ByteBuffer& b, Vector3& v)
    {
        b >> v.x >> v.y >> v.z;
    }

    enum MonsterMoveType
    {
        MonsterMoveNormal       = 0,
        MonsterMoveStop         = 1,
        MonsterMoveFacingSpot   = 2,
        MonsterMoveFacingTarget = 3,
        MonsterMoveFacingAngle  = 4
    };

    void PacketBuilder::WriteCommonMonsterMovePart(const MoveSpline& move_spline, WorldPacket& data)
    {
        MoveSplineFlag splineflags = move_spline.splineflags;

        data << uint8(0);                                       // sets/unsets MOVEMENTFLAG2_UNK7 (0x40)
        data << move_spline.spline.getPoint(move_spline.spline.first());
        data << move_spline.GetId();

        switch (splineflags & MoveSplineFlag::Mask_Final_Facing)
        {
            case MoveSplineFlag::Final_Target:
                data << uint8(MonsterMoveFacingTarget);
                data << move_spline.facing.target;
                break;
            case MoveSplineFlag::Final_Angle:
                data << uint8(MonsterMoveFacingAngle);
                data << move_spline.facing.angle;
                break;
            case MoveSplineFlag::Final_Point:
                data << uint8(MonsterMoveFacingSpot);
                data << move_spline.facing.f.x << move_spline.facing.f.y << move_spline.facing.f.z;
                break;
            default:
                data << uint8(MonsterMoveNormal);
                break;
        }

        // add fake Enter_Cycle flag - needed for client-side cyclic movement (client will erase first spline vertex after first cycle done)
        splineflags.enter_cycle = move_spline.isCyclic();
        data << uint32(splineflags & ~MoveSplineFlag::Mask_No_Monster_Move);

        if (splineflags.animation)
        {
            data << splineflags.getAnimationId();
            data << move_spline.effect_start_time;
        }

        data << move_spline.Duration();

        if (splineflags.parabolic)
        {
            data << move_spline.vertical_acceleration;
            data << move_spline.effect_start_time;
        }
    }

    void PacketBuilder::WriteStopMovement(Vector3 const& pos, uint32 splineId, ByteBuffer& data)
    {
        data << uint8(0);                                       // sets/unsets MOVEMENTFLAG2_UNK7 (0x40)
        data << pos;
        data << splineId;
        data << uint8(MonsterMoveStop);
    }

    void PacketBuilder::WriteMonsterMove(const MoveSpline& move_spline, WorldPacket& data)
    {
        WriteCommonMonsterMovePart(move_spline, data);

        const Spline<int32>& spline = move_spline.spline;
        MoveSplineFlag splineflags = move_spline.splineflags;
        /*if (splineflags & MoveSplineFlag::UncompressedPath)
        {
            if (splineflags.cyclic)
                WriteCatmullRomCyclicPath(spline, data);
            else
                WriteCatmullRomPath(spline, data);
        }*/
        //else
            //WriteLinearPath(spline, data);
    }

    void PacketBuilder::WriteCreateBits(MoveSpline const& moveSpline, ByteBuffer& data)
    {
        if (!data.WriteBit(!moveSpline.Finalized()))
            return;

        data.WriteBit(moveSpline.splineflags & (MoveSplineFlag::Parabolic | MoveSplineFlag::Animation)); //   hasSplineStartTime = packet.ReadBit();

        data.WriteBits(uint8(moveSpline.spline.mode()), 2); // packet.ReadEnum<SplineMode>("Spline Mode", 2, index);
        data.WriteBits(moveSpline.splineflags.raw(), 20); // packet.ReadEnum<SplineFlag434>("Spline flags", 20, index);
        data.WriteBit(0); // unk
        data.WriteBits(moveSpline.getPath().size(), 25); // splineCount = packet.ReadBits("Spline Waypoints", 22, index);
        data.WriteBit((moveSpline.splineflags & MoveSplineFlag::Parabolic) && moveSpline.effect_start_time < moveSpline.Duration());

        /*switch (moveSpline.splineflags & MoveSplineFlag::Mask_Final_Facing)
        {
            case MoveSplineFlag::Final_Target:
            {
                ObjectGuid targetGuid = moveSpline.facing.target;
                data.WriteBits(0, 2);
                data.WriteBit(targetGuid[4]);
                data.WriteBit(targetGuid[5]);
                data.WriteBit(targetGuid[0]);
                data.WriteBit(targetGuid[7]);
                data.WriteBit(targetGuid[1]);
                data.WriteBit(targetGuid[3]);
                data.WriteBit(targetGuid[2]);
                data.WriteBit(targetGuid[6]);
                break;
            }
            case MoveSplineFlag::Final_Angle:
                data.WriteBits(3, 2);
                break;
            case MoveSplineFlag::Final_Point:
                data.WriteBits(1, 2);
                break;
            default:
                data.WriteBits(2, 2);
                break;
        }*/
    }

    void PacketBuilder::WriteCreateData(MoveSpline const& moveSpline, ByteBuffer& data, Unit* unit)
    {
        if (!moveSpline.Finalized())
        {
            MoveSplineFlag splineFlags = moveSpline.splineflags;
            uint8 splineType = 0;

            if (splineFlags.final_point)
                splineType = 2;
            else if (splineFlags.final_angle)
                splineType = 4;
            else if ((splineFlags & MoveSplineFlag::Mask_Final_Facing) == MoveSplineFlag::Final_Target)
                splineType = MonsterMoveFacingTarget;

            data << uint8(splineType);
            data << float(1.f);                             // splineInfo.duration_mod; added in 3.1

            uint32 nodes = moveSpline.getPath().size();
            for (uint32 i = 0; i < nodes; ++i)
            {
                data << float(moveSpline.getPath()[i].z);
                data << float(moveSpline.getPath()[i].x);
                data << float(moveSpline.getPath()[i].y);
            }

            data << float(1.f);                             // splineInfo.duration_mod_next; added in 3.1

            if (splineFlags.final_point)
                data << moveSpline.facing.f.z << moveSpline.facing.f.y << moveSpline.facing.f.x;

            if (splineFlags.final_angle)
                data << moveSpline.facing.angle;

            if ((splineFlags & MoveSplineFlag::Parabolic) && moveSpline.effect_start_time < moveSpline.Duration())
                data << moveSpline.vertical_acceleration;   // added in 3.1

            if (splineFlags & (MoveSplineFlag::Parabolic | MoveSplineFlag::Animation))
                data << moveSpline.effect_start_time;       // added in 3.1

            data << moveSpline.timePassed();
            data << moveSpline.Duration();
        }

        data << uint32(moveSpline.GetId());
        data << float(unit->GetPositionZ());
        data << float(unit->GetPositionX());
        data << float(unit->GetPositionY());
    }

    void PacketBuilder::WriteCreateGuid(MoveSpline const& moveSpline, ByteBuffer& data)
    {
        if (!moveSpline.Finalized() && (moveSpline.splineflags & MoveSplineFlag::Mask_Final_Facing == MoveSplineFlag::Final_Target))
        {
            ObjectGuid facingGuid = moveSpline.facing.target;

            uint8 bitOrder[8] = { 3, 1, 0, 7, 6, 4, 5, 2 };
            data.WriteBitInOrder(facingGuid, bitOrder);

            uint8 byteOrder[8] = { 3, 0, 4, 6, 1, 5, 2, 7 };
            data.WriteBytesSeq(facingGuid, byteOrder);
        }
    }
}

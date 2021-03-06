-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           5.6.11-log - MySQL Community Server (GPL)
-- Serveur OS:                   Win32
-- HeidiSQL Version:             8.1.0.4545
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Export de la structure de table world. access_requirement
CREATE TABLE IF NOT EXISTS `access_requirement` (
  `mapId` mediumint(8) unsigned NOT NULL,
  `difficulty` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `level_min` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `level_max` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest_done_A` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest_done_H` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `completed_achievement` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest_failed_text` text,
  `comment` text,
  PRIMARY KEY (`mapId`,`difficulty`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Access Requirements';

-- Export de données de la table world.access_requirement: 0 rows
/*!40000 ALTER TABLE `access_requirement` DISABLE KEYS */;
/*!40000 ALTER TABLE `access_requirement` ENABLE KEYS */;


-- Export de la structure de table world. achievement_criteria_data
CREATE TABLE IF NOT EXISTS `achievement_criteria_data` (
  `criteria_id` mediumint(8) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `value1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `value2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ScriptName` char(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`criteria_id`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Achievment system';

-- Export de données de la table world.achievement_criteria_data: 0 rows
/*!40000 ALTER TABLE `achievement_criteria_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `achievement_criteria_data` ENABLE KEYS */;


-- Export de la structure de table world. achievement_dbc
CREATE TABLE IF NOT EXISTS `achievement_dbc` (
  `ID` int(10) unsigned NOT NULL,
  `requiredFaction` int(11) NOT NULL DEFAULT '-1',
  `mapID` int(11) NOT NULL DEFAULT '-1',
  `points` int(10) unsigned NOT NULL DEFAULT '0',
  `flags` int(10) unsigned NOT NULL DEFAULT '0',
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  `refAchievement` int(10) unsigned NOT NULL DEFAULT '0',
  `comment` text,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.achievement_dbc: 0 rows
/*!40000 ALTER TABLE `achievement_dbc` DISABLE KEYS */;
/*!40000 ALTER TABLE `achievement_dbc` ENABLE KEYS */;


-- Export de la structure de table world. achievement_reward
CREATE TABLE IF NOT EXISTS `achievement_reward` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title_A` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title_H` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `sender` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) DEFAULT NULL,
  `text` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';

-- Export de données de la table world.achievement_reward: 0 rows
/*!40000 ALTER TABLE `achievement_reward` DISABLE KEYS */;
/*!40000 ALTER TABLE `achievement_reward` ENABLE KEYS */;


-- Export de la structure de table world. areatrigger_involvedrelation
CREATE TABLE IF NOT EXISTS `areatrigger_involvedrelation` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Trigger System';

-- Export de données de la table world.areatrigger_involvedrelation: 0 rows
/*!40000 ALTER TABLE `areatrigger_involvedrelation` DISABLE KEYS */;
/*!40000 ALTER TABLE `areatrigger_involvedrelation` ENABLE KEYS */;


-- Export de la structure de table world. areatrigger_scripts
CREATE TABLE IF NOT EXISTS `areatrigger_scripts` (
  `entry` mediumint(8) NOT NULL,
  `ScriptName` char(64) NOT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.areatrigger_scripts: 0 rows
/*!40000 ALTER TABLE `areatrigger_scripts` DISABLE KEYS */;
/*!40000 ALTER TABLE `areatrigger_scripts` ENABLE KEYS */;


-- Export de la structure de table world. areatrigger_tavern
CREATE TABLE IF NOT EXISTS `areatrigger_tavern` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `name` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Trigger System';

-- Export de données de la table world.areatrigger_tavern: 0 rows
/*!40000 ALTER TABLE `areatrigger_tavern` DISABLE KEYS */;
/*!40000 ALTER TABLE `areatrigger_tavern` ENABLE KEYS */;


-- Export de la structure de table world. areatrigger_teleport
CREATE TABLE IF NOT EXISTS `areatrigger_teleport` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `name` text,
  `target_map` smallint(5) unsigned NOT NULL DEFAULT '0',
  `target_position_x` float NOT NULL DEFAULT '0',
  `target_position_y` float NOT NULL DEFAULT '0',
  `target_position_z` float NOT NULL DEFAULT '0',
  `target_orientation` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  FULLTEXT KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Trigger System';

-- Export de données de la table world.areatrigger_teleport: 0 rows
/*!40000 ALTER TABLE `areatrigger_teleport` DISABLE KEYS */;
/*!40000 ALTER TABLE `areatrigger_teleport` ENABLE KEYS */;


-- Export de la structure de table world. battleground_template
CREATE TABLE IF NOT EXISTS `battleground_template` (
  `id` mediumint(8) unsigned NOT NULL,
  `MinPlayersPerTeam` smallint(5) unsigned NOT NULL DEFAULT '0',
  `MaxPlayersPerTeam` smallint(5) unsigned NOT NULL DEFAULT '0',
  `MinLvl` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MaxLvl` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `AllianceStartLoc` mediumint(8) unsigned NOT NULL,
  `AllianceStartO` float NOT NULL,
  `HordeStartLoc` mediumint(8) unsigned NOT NULL,
  `HordeStartO` float NOT NULL,
  `StartMaxDist` float NOT NULL DEFAULT '0',
  `Weight` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `holiday` int(3) NOT NULL DEFAULT '0',
  `ScriptName` char(64) NOT NULL DEFAULT '',
  `Comment` char(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.battleground_template: 0 rows
/*!40000 ALTER TABLE `battleground_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `battleground_template` ENABLE KEYS */;


-- Export de la structure de table world. battlemaster_entry
CREATE TABLE IF NOT EXISTS `battlemaster_entry` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Entry of a creature',
  `bg_template` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Battleground template id',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.battlemaster_entry: 0 rows
/*!40000 ALTER TABLE `battlemaster_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `battlemaster_entry` ENABLE KEYS */;


-- Export de la structure de table world. blackmarket_template
CREATE TABLE IF NOT EXISTS `blackmarket_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Global Identifier',
  `itemEntry` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entry of the item',
  `itemCount` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of copies selled',
  `seller` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entry of the npc vendor',
  `startBid` bigint(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Price when added',
  `duration` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The duration of the general bid',
  `chance` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Chance for this item to be displayed',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Export de données de la table world.blackmarket_template: ~0 rows (environ)
/*!40000 ALTER TABLE `blackmarket_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `blackmarket_template` ENABLE KEYS */;


-- Export de la structure de table world. character_aura
CREATE TABLE IF NOT EXISTS `character_aura` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `slot` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `caster_guid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Full Global Unique Identifier',
  `item_guid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `spell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `effect_mask` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `recalculate_mask` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stackcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `maxduration` int(11) NOT NULL DEFAULT '0',
  `remaintime` int(11) NOT NULL DEFAULT '0',
  `remaincharges` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`caster_guid`,`item_guid`,`spell`,`effect_mask`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

-- Export de données de la table world.character_aura: ~0 rows (environ)
/*!40000 ALTER TABLE `character_aura` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_aura` ENABLE KEYS */;


-- Export de la structure de table world. character_aura_effect
CREATE TABLE IF NOT EXISTS `character_aura_effect` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `slot` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `effect` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `baseamount` int(11) NOT NULL DEFAULT '0',
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`guid`,`slot`,`effect`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Export de données de la table world.character_aura_effect: ~0 rows (environ)
/*!40000 ALTER TABLE `character_aura_effect` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_aura_effect` ENABLE KEYS */;


-- Export de la structure de table world. command
CREATE TABLE IF NOT EXISTS `command` (
  `name` varchar(50) NOT NULL DEFAULT '',
  `security` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `help` longtext,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Chat System';

-- Export de données de la table world.command: 0 rows
/*!40000 ALTER TABLE `command` DISABLE KEYS */;
/*!40000 ALTER TABLE `command` ENABLE KEYS */;


-- Export de la structure de table world. conditions
CREATE TABLE IF NOT EXISTS `conditions` (
  `SourceTypeOrReferenceId` mediumint(8) NOT NULL DEFAULT '0',
  `SourceGroup` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `SourceEntry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `SourceId` int(11) NOT NULL DEFAULT '0',
  `ElseGroup` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ConditionTypeOrReference` mediumint(8) NOT NULL DEFAULT '0',
  `ConditionTarget` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ConditionValue1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ConditionValue2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ConditionValue3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `NegativeCondition` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ErrorTextId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ScriptName` char(64) NOT NULL DEFAULT '',
  `Comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Condition System';

-- Export de données de la table world.conditions: 0 rows
/*!40000 ALTER TABLE `conditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `conditions` ENABLE KEYS */;


-- Export de la structure de table world. creature
CREATE TABLE IF NOT EXISTS `creature` (
  `guid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Global Unique Identifier',
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Creature Identifier',
  `map` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `zoneId` int(8) unsigned NOT NULL DEFAULT '0',
  `areaId` int(8) unsigned NOT NULL DEFAULT '0',
  `spawnMask` int(8) unsigned NOT NULL DEFAULT '0',
  `phaseMask` int(10) unsigned NOT NULL DEFAULT '1',
  `modelid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `equipment_id` mediumint(8) NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `spawntimesecs` int(10) unsigned NOT NULL DEFAULT '120',
  `spawndist` float NOT NULL DEFAULT '0',
  `currentwaypoint` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `curhealth` int(10) unsigned NOT NULL DEFAULT '1',
  `curmana` int(10) unsigned NOT NULL DEFAULT '0',
  `MovementType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `npcflag` int(10) unsigned NOT NULL DEFAULT '0',
  `unit_flags` int(10) unsigned NOT NULL DEFAULT '0',
  `dynamicflags` int(10) unsigned NOT NULL DEFAULT '0',
  `isActive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`),
  KEY `idx_map` (`map`),
  KEY `idx_id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Creature System';

-- Export de données de la table world.creature: 0 rows
/*!40000 ALTER TABLE `creature` DISABLE KEYS */;
/*!40000 ALTER TABLE `creature` ENABLE KEYS */;


-- Export de la structure de table world. creatureadd
CREATE TABLE IF NOT EXISTS `creatureadd` (
  `guid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Global Unique Identifier',
  `loli` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Creature System';

-- Export de données de la table world.creatureadd: 0 rows
/*!40000 ALTER TABLE `creatureadd` DISABLE KEYS */;
/*!40000 ALTER TABLE `creatureadd` ENABLE KEYS */;


-- Export de la structure de table world. creature_addon
CREATE TABLE IF NOT EXISTS `creature_addon` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `path_id` int(10) unsigned NOT NULL DEFAULT '0',
  `mount` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `bytes1` int(10) unsigned NOT NULL DEFAULT '0',
  `bytes2` int(10) unsigned NOT NULL DEFAULT '0',
  `emote` int(10) unsigned NOT NULL DEFAULT '0',
  `auras` text,
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.creature_addon: 0 rows
/*!40000 ALTER TABLE `creature_addon` DISABLE KEYS */;
/*!40000 ALTER TABLE `creature_addon` ENABLE KEYS */;


-- Export de la structure de table world. creature_addon_copy
CREATE TABLE IF NOT EXISTS `creature_addon_copy` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `path_id` int(10) unsigned NOT NULL DEFAULT '0',
  `mount` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `bytes1` int(10) unsigned NOT NULL DEFAULT '0',
  `bytes2` int(10) unsigned NOT NULL DEFAULT '0',
  `emote` int(10) unsigned NOT NULL DEFAULT '0',
  `auras` text,
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.creature_addon_copy: 0 rows
/*!40000 ALTER TABLE `creature_addon_copy` DISABLE KEYS */;
/*!40000 ALTER TABLE `creature_addon_copy` ENABLE KEYS */;


-- Export de la structure de table world. creature_addon_qsdsqd
CREATE TABLE IF NOT EXISTS `creature_addon_qsdsqd` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `path_id` int(10) unsigned NOT NULL DEFAULT '0',
  `mount` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `bytes1` int(10) unsigned NOT NULL DEFAULT '0',
  `bytes2` int(10) unsigned NOT NULL DEFAULT '0',
  `emote` int(10) unsigned NOT NULL DEFAULT '0',
  `auras` text,
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.creature_addon_qsdsqd: 0 rows
/*!40000 ALTER TABLE `creature_addon_qsdsqd` DISABLE KEYS */;
/*!40000 ALTER TABLE `creature_addon_qsdsqd` ENABLE KEYS */;


-- Export de la structure de table world. creature_area
CREATE TABLE IF NOT EXISTS `creature_area` (
  `guid` int(11) unsigned NOT NULL,
  `zone` int(11) NOT NULL,
  `area` int(11) DEFAULT NULL,
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Export de données de la table world.creature_area: ~0 rows (environ)
/*!40000 ALTER TABLE `creature_area` DISABLE KEYS */;
/*!40000 ALTER TABLE `creature_area` ENABLE KEYS */;


-- Export de la structure de table world. creature_classlevelstats
CREATE TABLE IF NOT EXISTS `creature_classlevelstats` (
  `level` tinyint(4) NOT NULL,
  `class` tinyint(4) NOT NULL,
  `basehp0` mediumint(8) unsigned NOT NULL DEFAULT '1',
  `basehp1` mediumint(8) unsigned NOT NULL DEFAULT '1',
  `basehp2` mediumint(8) unsigned NOT NULL DEFAULT '1',
  `basehp3` mediumint(8) unsigned NOT NULL DEFAULT '1',
  `basehp4` mediumint(8) unsigned NOT NULL DEFAULT '1',
  `basemana` mediumint(8) unsigned NOT NULL DEFAULT '1',
  `basearmor` mediumint(8) unsigned NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.creature_classlevelstats: 0 rows
/*!40000 ALTER TABLE `creature_classlevelstats` DISABLE KEYS */;
/*!40000 ALTER TABLE `creature_classlevelstats` ENABLE KEYS */;


-- Export de la structure de table world. creature_copy
CREATE TABLE IF NOT EXISTS `creature_copy` (
  `guid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Global Unique Identifier',
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Creature Identifier',
  `map` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `spawnMask` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `phaseMask` smallint(5) unsigned NOT NULL DEFAULT '1',
  `modelid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `equipment_id` mediumint(8) NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `spawntimesecs` int(10) unsigned NOT NULL DEFAULT '120',
  `spawndist` float NOT NULL DEFAULT '0',
  `currentwaypoint` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `curhealth` int(10) unsigned NOT NULL DEFAULT '1',
  `curmana` int(10) unsigned NOT NULL DEFAULT '0',
  `MovementType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `npcflag` int(10) unsigned NOT NULL DEFAULT '0',
  `unit_flags` int(10) unsigned NOT NULL DEFAULT '0',
  `dynamicflags` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`),
  KEY `idx_map` (`map`),
  KEY `idx_id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Creature System';

-- Export de données de la table world.creature_copy: 0 rows
/*!40000 ALTER TABLE `creature_copy` DISABLE KEYS */;
/*!40000 ALTER TABLE `creature_copy` ENABLE KEYS */;


-- Export de la structure de table world. creature_equip_template
CREATE TABLE IF NOT EXISTS `creature_equip_template` (
  `entry` smallint(5) unsigned NOT NULL DEFAULT '0',
  `itemEntry1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `itemEntry2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `itemEntry3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Creature System (Equipment)';

-- Export de données de la table world.creature_equip_template: 0 rows
/*!40000 ALTER TABLE `creature_equip_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `creature_equip_template` ENABLE KEYS */;


-- Export de la structure de table world. creature_formations
CREATE TABLE IF NOT EXISTS `creature_formations` (
  `leaderGUID` int(10) unsigned NOT NULL,
  `memberGUID` int(10) unsigned NOT NULL,
  `dist` float unsigned NOT NULL,
  `angle` float unsigned NOT NULL,
  `groupAI` int(10) unsigned NOT NULL,
  `point_1` int(10) unsigned NOT NULL,
  `point_2` int(10) unsigned NOT NULL,
  PRIMARY KEY (`memberGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.creature_formations: 0 rows
/*!40000 ALTER TABLE `creature_formations` DISABLE KEYS */;
/*!40000 ALTER TABLE `creature_formations` ENABLE KEYS */;


-- Export de la structure de table world. creature_formations_copy
CREATE TABLE IF NOT EXISTS `creature_formations_copy` (
  `leaderGUID` int(10) unsigned NOT NULL,
  `memberGUID` int(10) unsigned NOT NULL,
  `dist` float unsigned NOT NULL,
  `angle` float unsigned NOT NULL,
  `groupAI` int(10) unsigned NOT NULL,
  PRIMARY KEY (`memberGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.creature_formations_copy: 0 rows
/*!40000 ALTER TABLE `creature_formations_copy` DISABLE KEYS */;
/*!40000 ALTER TABLE `creature_formations_copy` ENABLE KEYS */;


-- Export de la structure de table world. creature_involvedrelation
CREATE TABLE IF NOT EXISTS `creature_involvedrelation` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Creature System';

-- Export de données de la table world.creature_involvedrelation: 0 rows
/*!40000 ALTER TABLE `creature_involvedrelation` DISABLE KEYS */;
/*!40000 ALTER TABLE `creature_involvedrelation` ENABLE KEYS */;


-- Export de la structure de table world. creature_loot_currency
CREATE TABLE IF NOT EXISTS `creature_loot_currency` (
  `creature_id` mediumint(8) unsigned NOT NULL,
  `CurrencyId1` smallint(5) unsigned DEFAULT '0',
  `CurrencyId2` smallint(5) unsigned DEFAULT '0',
  `CurrencyId3` smallint(5) unsigned DEFAULT '0',
  `CurrencyCount1` int(10) DEFAULT '0',
  `CurrencyCount2` int(10) DEFAULT '0',
  `CurrencyCount3` int(10) DEFAULT '0',
  PRIMARY KEY (`creature_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.creature_loot_currency: 0 rows
/*!40000 ALTER TABLE `creature_loot_currency` DISABLE KEYS */;
/*!40000 ALTER TABLE `creature_loot_currency` ENABLE KEYS */;


-- Export de la structure de table world. creature_loot_template
CREATE TABLE IF NOT EXISTS `creature_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `lootmode` smallint(5) unsigned NOT NULL DEFAULT '1',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(8) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Loot System';

-- Export de données de la table world.creature_loot_template: 0 rows
/*!40000 ALTER TABLE `creature_loot_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `creature_loot_template` ENABLE KEYS */;


-- Export de la structure de table world. creature_model_info
CREATE TABLE IF NOT EXISTS `creature_model_info` (
  `modelid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `bounding_radius` float NOT NULL DEFAULT '0',
  `combat_reach` float NOT NULL DEFAULT '0',
  `gender` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `modelid_other_gender` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`modelid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Creature System (Model related info)';

-- Export de données de la table world.creature_model_info: 0 rows
/*!40000 ALTER TABLE `creature_model_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `creature_model_info` ENABLE KEYS */;


-- Export de la structure de table world. creature_onkill_reputation
CREATE TABLE IF NOT EXISTS `creature_onkill_reputation` (
  `creature_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Creature Identifier',
  `RewOnKillRepFaction1` smallint(6) NOT NULL DEFAULT '0',
  `RewOnKillRepFaction2` smallint(6) NOT NULL DEFAULT '0',
  `MaxStanding1` tinyint(4) NOT NULL DEFAULT '0',
  `IsTeamAward1` tinyint(4) NOT NULL DEFAULT '0',
  `RewOnKillRepValue1` mediumint(8) NOT NULL DEFAULT '0',
  `MaxStanding2` tinyint(4) NOT NULL DEFAULT '0',
  `IsTeamAward2` tinyint(4) NOT NULL DEFAULT '0',
  `RewOnKillRepValue2` mediumint(9) NOT NULL DEFAULT '0',
  `TeamDependent` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`creature_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Creature OnKill Reputation gain';

-- Export de données de la table world.creature_onkill_reputation: 0 rows
/*!40000 ALTER TABLE `creature_onkill_reputation` DISABLE KEYS */;
/*!40000 ALTER TABLE `creature_onkill_reputation` ENABLE KEYS */;


-- Export de la structure de table world. creature_questender
CREATE TABLE IF NOT EXISTS `creature_questender` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Creature System';

-- Export de données de la table world.creature_questender: 0 rows
/*!40000 ALTER TABLE `creature_questender` DISABLE KEYS */;
/*!40000 ALTER TABLE `creature_questender` ENABLE KEYS */;


-- Export de la structure de table world. creature_questrelation
CREATE TABLE IF NOT EXISTS `creature_questrelation` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Creature System';

-- Export de données de la table world.creature_questrelation: 0 rows
/*!40000 ALTER TABLE `creature_questrelation` DISABLE KEYS */;
/*!40000 ALTER TABLE `creature_questrelation` ENABLE KEYS */;


-- Export de la structure de table world. creature_queststarter
CREATE TABLE IF NOT EXISTS `creature_queststarter` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Creature System';

-- Export de données de la table world.creature_queststarter: 0 rows
/*!40000 ALTER TABLE `creature_queststarter` DISABLE KEYS */;
/*!40000 ALTER TABLE `creature_queststarter` ENABLE KEYS */;


-- Export de la structure de table world. creature_summon_groups
CREATE TABLE IF NOT EXISTS `creature_summon_groups` (
  `summonerId` int(11) DEFAULT NULL,
  `summonerType` int(11) DEFAULT NULL,
  `groupId` int(11) DEFAULT NULL,
  `entry` int(11) DEFAULT NULL,
  `position_x` int(11) DEFAULT NULL,
  `position_y` int(11) DEFAULT NULL,
  `position_z` int(11) DEFAULT NULL,
  `orientation` int(11) DEFAULT NULL,
  `summonType` int(11) DEFAULT NULL,
  `summonTime` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Export de données de la table world.creature_summon_groups: ~0 rows (environ)
/*!40000 ALTER TABLE `creature_summon_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `creature_summon_groups` ENABLE KEYS */;


-- Export de la structure de table world. creature_template
CREATE TABLE IF NOT EXISTS `creature_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `difficulty_entry_1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `difficulty_entry_2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `difficulty_entry_3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `difficulty_entry_4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `difficulty_entry_5` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `difficulty_entry_6` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `difficulty_entry_7` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `difficulty_entry_8` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `difficulty_entry_9` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `difficulty_entry_10` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `difficulty_entry_11` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `difficulty_entry_12` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `difficulty_entry_13` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `difficulty_entry_14` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `difficulty_entry_15` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `KillCredit1` int(10) unsigned NOT NULL DEFAULT '0',
  `KillCredit2` int(10) unsigned NOT NULL DEFAULT '0',
  `modelid1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `modelid2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `modelid3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `modelid4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` char(100) NOT NULL DEFAULT '0',
  `subname` char(100) DEFAULT NULL,
  `IconName` char(100) DEFAULT NULL,
  `gossip_menu_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `minlevel` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `maxlevel` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `exp` smallint(6) NOT NULL DEFAULT '0',
  `exp_unk` smallint(2) NOT NULL DEFAULT '0',
  `faction_A` smallint(5) unsigned NOT NULL DEFAULT '0',
  `faction_H` smallint(5) unsigned NOT NULL DEFAULT '0',
  `npcflag` int(10) unsigned NOT NULL DEFAULT '0',
  `speed_walk` float NOT NULL DEFAULT '1' COMMENT 'Result of 2.5/2.5, most common value',
  `speed_run` float NOT NULL DEFAULT '1.14286' COMMENT 'Result of 8.0/7.0, most common value',
  `speed_fly` float NOT NULL DEFAULT '1.14286' COMMENT 'Result of 8.0/7.0, most common value',
  `scale` float NOT NULL DEFAULT '1',
  `rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mindmg` float NOT NULL DEFAULT '0',
  `maxdmg` float NOT NULL DEFAULT '0',
  `dmgschool` tinyint(4) NOT NULL DEFAULT '0',
  `attackpower` int(10) unsigned NOT NULL DEFAULT '0',
  `dmg_multiplier` float NOT NULL DEFAULT '1',
  `baseattacktime` int(10) unsigned NOT NULL DEFAULT '0',
  `rangeattacktime` int(10) unsigned NOT NULL DEFAULT '0',
  `unit_class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `unit_flags` int(10) unsigned NOT NULL DEFAULT '0',
  `unit_flags2` int(10) unsigned NOT NULL DEFAULT '0',
  `dynamicflags` int(10) unsigned NOT NULL DEFAULT '0',
  `family` mediumint(8) NOT NULL DEFAULT '0',
  `trainer_type` tinyint(4) NOT NULL DEFAULT '0',
  `trainer_spell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `trainer_class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `trainer_race` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `minrangedmg` float NOT NULL DEFAULT '0',
  `maxrangedmg` float NOT NULL DEFAULT '0',
  `rangedattackpower` smallint(5) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `type_flags` int(10) unsigned NOT NULL DEFAULT '0',
  `type_flags2` int(10) unsigned NOT NULL DEFAULT '0',
  `lootid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `pickpocketloot` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `skinloot` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `resistance1` smallint(6) NOT NULL DEFAULT '0',
  `resistance2` smallint(6) NOT NULL DEFAULT '0',
  `resistance3` smallint(6) NOT NULL DEFAULT '0',
  `resistance4` smallint(6) NOT NULL DEFAULT '0',
  `resistance5` smallint(6) NOT NULL DEFAULT '0',
  `resistance6` smallint(6) NOT NULL DEFAULT '0',
  `spell1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spell2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spell3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spell4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spell5` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spell6` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spell7` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spell8` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `PetSpellDataId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `VehicleId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `mingold` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `maxgold` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `AIName` char(64) NOT NULL DEFAULT '',
  `MovementType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `InhabitType` tinyint(3) unsigned NOT NULL DEFAULT '3',
  `HoverHeight` float NOT NULL DEFAULT '1',
  `Health_mod` float NOT NULL DEFAULT '1',
  `Mana_mod` float NOT NULL DEFAULT '1',
  `Mana_mod_extra` float NOT NULL DEFAULT '1',
  `Armor_mod` float NOT NULL DEFAULT '1',
  `RacialLeader` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `questItem1` int(10) unsigned NOT NULL DEFAULT '0',
  `questItem2` int(10) unsigned NOT NULL DEFAULT '0',
  `questItem3` int(10) unsigned NOT NULL DEFAULT '0',
  `questItem4` int(10) unsigned NOT NULL DEFAULT '0',
  `questItem5` int(10) unsigned NOT NULL DEFAULT '0',
  `questItem6` int(10) unsigned NOT NULL DEFAULT '0',
  `movementId` int(11) unsigned NOT NULL DEFAULT '0',
  `RegenHealth` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `equipment_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `mechanic_immune_mask` int(10) unsigned NOT NULL DEFAULT '0',
  `flags_extra` int(10) unsigned NOT NULL DEFAULT '0',
  `ScriptName` char(64) NOT NULL DEFAULT '',
  `WDBVerified` smallint(6) DEFAULT '1',
  PRIMARY KEY (`entry`),
  KEY `idx_name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Creature System';

-- Export de données de la table world.creature_template: 0 rows
/*!40000 ALTER TABLE `creature_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `creature_template` ENABLE KEYS */;


-- Export de la structure de table world. creature_template_addon
CREATE TABLE IF NOT EXISTS `creature_template_addon` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `path_id` int(10) unsigned NOT NULL DEFAULT '0',
  `mount` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `bytes1` int(10) unsigned NOT NULL DEFAULT '0',
  `bytes2` int(10) unsigned NOT NULL DEFAULT '0',
  `emote` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auras` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.creature_template_addon: 0 rows
/*!40000 ALTER TABLE `creature_template_addon` DISABLE KEYS */;
/*!40000 ALTER TABLE `creature_template_addon` ENABLE KEYS */;


-- Export de la structure de table world. creature_text
CREATE TABLE IF NOT EXISTS `creature_text` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `text` longtext,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `language` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `probability` float NOT NULL DEFAULT '0',
  `emote` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `duration` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `sound` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `comment` varchar(255) DEFAULT '',
  PRIMARY KEY (`entry`,`groupid`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.creature_text: 0 rows
/*!40000 ALTER TABLE `creature_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `creature_text` ENABLE KEYS */;


-- Export de la structure de table world. creature_transport
CREATE TABLE IF NOT EXISTS `creature_transport` (
  `guid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'GUID of NPC on transport - not the same as creature.guid',
  `transport_entry` int(11) NOT NULL COMMENT 'Transport entry',
  `npc_entry` int(11) NOT NULL COMMENT 'NPC entry',
  `TransOffsetX` float NOT NULL DEFAULT '0',
  `TransOffsetY` float NOT NULL DEFAULT '0',
  `TransOffsetZ` float NOT NULL DEFAULT '0',
  `TransOffsetO` float NOT NULL DEFAULT '0',
  `emote` int(11) NOT NULL,
  PRIMARY KEY (`transport_entry`,`guid`),
  UNIQUE KEY `entry` (`transport_entry`,`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.creature_transport: 0 rows
/*!40000 ALTER TABLE `creature_transport` DISABLE KEYS */;
/*!40000 ALTER TABLE `creature_transport` ENABLE KEYS */;


-- Export de la structure de table world. creature_transport_copy
CREATE TABLE IF NOT EXISTS `creature_transport_copy` (
  `guid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'GUID of NPC on transport - not the same as creature.guid',
  `transport_entry` int(11) NOT NULL COMMENT 'Transport entry',
  `npc_entry` int(11) NOT NULL COMMENT 'NPC entry',
  `TransOffsetX` float NOT NULL DEFAULT '0',
  `TransOffsetY` float NOT NULL DEFAULT '0',
  `TransOffsetZ` float NOT NULL DEFAULT '0',
  `TransOffsetO` float NOT NULL DEFAULT '0',
  `emote` int(11) NOT NULL,
  PRIMARY KEY (`transport_entry`,`guid`),
  UNIQUE KEY `entry` (`transport_entry`,`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.creature_transport_copy: 0 rows
/*!40000 ALTER TABLE `creature_transport_copy` DISABLE KEYS */;
/*!40000 ALTER TABLE `creature_transport_copy` ENABLE KEYS */;


-- Export de la structure de table world. custom_texts
CREATE TABLE IF NOT EXISTS `custom_texts` (
  `entry` mediumint(8) NOT NULL,
  `content_default` text NOT NULL,
  `content_loc1` text,
  `content_loc2` text,
  `content_loc3` text,
  `content_loc4` text,
  `content_loc5` text,
  `content_loc6` text,
  `content_loc7` text,
  `content_loc8` text,
  `content_loc9` text,
  `content_loc10` text,
  `sound` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `language` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `emote` smallint(5) unsigned NOT NULL DEFAULT '0',
  `comment` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Custom Texts';

-- Export de données de la table world.custom_texts: 0 rows
/*!40000 ALTER TABLE `custom_texts` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_texts` ENABLE KEYS */;


-- Export de la structure de table world. daily_players_reports
CREATE TABLE IF NOT EXISTS `daily_players_reports` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `creation_time` int(10) unsigned NOT NULL DEFAULT '0',
  `average` float NOT NULL DEFAULT '0',
  `total_reports` bigint(20) unsigned NOT NULL DEFAULT '0',
  `speed_reports` bigint(20) unsigned NOT NULL DEFAULT '0',
  `fly_reports` bigint(20) unsigned NOT NULL DEFAULT '0',
  `jump_reports` bigint(20) unsigned NOT NULL DEFAULT '0',
  `waterwalk_reports` bigint(20) unsigned NOT NULL DEFAULT '0',
  `teleportplane_reports` bigint(20) unsigned NOT NULL DEFAULT '0',
  `climb_reports` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Export de données de la table world.daily_players_reports: ~0 rows (environ)
/*!40000 ALTER TABLE `daily_players_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_players_reports` ENABLE KEYS */;


-- Export de la structure de table world. db_script_string
CREATE TABLE IF NOT EXISTS `db_script_string` (
  `entry` int(10) unsigned NOT NULL DEFAULT '0',
  `content_default` text NOT NULL,
  `content_loc1` text,
  `content_loc2` text,
  `content_loc3` text,
  `content_loc4` text,
  `content_loc5` text,
  `content_loc6` text,
  `content_loc7` text,
  `content_loc8` text,
  `content_loc9` text,
  `content_loc10` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.db_script_string: 0 rows
/*!40000 ALTER TABLE `db_script_string` DISABLE KEYS */;
/*!40000 ALTER TABLE `db_script_string` ENABLE KEYS */;


-- Export de la structure de table world. disables
CREATE TABLE IF NOT EXISTS `disables` (
  `sourceType` int(10) unsigned NOT NULL,
  `entry` int(10) unsigned NOT NULL,
  `flags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `params_0` varchar(255) NOT NULL DEFAULT '',
  `params_1` varchar(255) NOT NULL DEFAULT '',
  `comment` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`sourceType`,`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.disables: 0 rows
/*!40000 ALTER TABLE `disables` DISABLE KEYS */;
/*!40000 ALTER TABLE `disables` ENABLE KEYS */;


-- Export de la structure de table world. disenchant_loot_template
CREATE TABLE IF NOT EXISTS `disenchant_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Recommended id selection: item_level*100 + item_quality',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `lootmode` smallint(5) unsigned NOT NULL DEFAULT '1',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';

-- Export de données de la table world.disenchant_loot_template: 0 rows
/*!40000 ALTER TABLE `disenchant_loot_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `disenchant_loot_template` ENABLE KEYS */;


-- Export de la structure de table world. event_scripts
CREATE TABLE IF NOT EXISTS `event_scripts` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `delay` int(10) unsigned NOT NULL DEFAULT '0',
  `command` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong2` int(10) unsigned NOT NULL DEFAULT '0',
  `dataint` int(11) NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.event_scripts: 0 rows
/*!40000 ALTER TABLE `event_scripts` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_scripts` ENABLE KEYS */;


-- Export de la structure de table world. exploration_basexp
CREATE TABLE IF NOT EXISTS `exploration_basexp` (
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `basexp` mediumint(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Exploration System';

-- Export de données de la table world.exploration_basexp: 0 rows
/*!40000 ALTER TABLE `exploration_basexp` DISABLE KEYS */;
/*!40000 ALTER TABLE `exploration_basexp` ENABLE KEYS */;


-- Export de la structure de table world. fishing_loot_template
CREATE TABLE IF NOT EXISTS `fishing_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `lootmode` smallint(5) unsigned NOT NULL DEFAULT '1',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(8) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Loot System';

-- Export de données de la table world.fishing_loot_template: 0 rows
/*!40000 ALTER TABLE `fishing_loot_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `fishing_loot_template` ENABLE KEYS */;


-- Export de la structure de table world. gameobject
CREATE TABLE IF NOT EXISTS `gameobject` (
  `guid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Global Unique Identifier',
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Gameobject Identifier',
  `map` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `zoneId` int(8) unsigned NOT NULL DEFAULT '0',
  `areaId` int(8) unsigned NOT NULL DEFAULT '0',
  `spawnMask` int(8) DEFAULT NULL,
  `phaseMask` smallint(5) unsigned NOT NULL DEFAULT '1',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `rotation0` float NOT NULL DEFAULT '0',
  `rotation1` float NOT NULL DEFAULT '0',
  `rotation2` float NOT NULL DEFAULT '0',
  `rotation3` float NOT NULL DEFAULT '0',
  `spawntimesecs` int(11) NOT NULL DEFAULT '0',
  `animprogress` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `isActive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Gameobject System';

-- Export de données de la table world.gameobject: 0 rows
/*!40000 ALTER TABLE `gameobject` DISABLE KEYS */;
/*!40000 ALTER TABLE `gameobject` ENABLE KEYS */;


-- Export de la structure de table world. gameobject_involvedrelation
CREATE TABLE IF NOT EXISTS `gameobject_involvedrelation` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.gameobject_involvedrelation: 0 rows
/*!40000 ALTER TABLE `gameobject_involvedrelation` DISABLE KEYS */;
/*!40000 ALTER TABLE `gameobject_involvedrelation` ENABLE KEYS */;


-- Export de la structure de table world. gameobject_loot_template
CREATE TABLE IF NOT EXISTS `gameobject_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `lootmode` smallint(5) unsigned NOT NULL DEFAULT '1',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(8) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Loot System';

-- Export de données de la table world.gameobject_loot_template: 0 rows
/*!40000 ALTER TABLE `gameobject_loot_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `gameobject_loot_template` ENABLE KEYS */;


-- Export de la structure de table world. gameobject_questender
CREATE TABLE IF NOT EXISTS `gameobject_questender` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  `pool_entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.gameobject_questender: 0 rows
/*!40000 ALTER TABLE `gameobject_questender` DISABLE KEYS */;
/*!40000 ALTER TABLE `gameobject_questender` ENABLE KEYS */;


-- Export de la structure de table world. gameobject_questrelation
CREATE TABLE IF NOT EXISTS `gameobject_questrelation` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.gameobject_questrelation: 0 rows
/*!40000 ALTER TABLE `gameobject_questrelation` DISABLE KEYS */;
/*!40000 ALTER TABLE `gameobject_questrelation` ENABLE KEYS */;


-- Export de la structure de table world. gameobject_queststarter
CREATE TABLE IF NOT EXISTS `gameobject_queststarter` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  `pool_entry` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.gameobject_queststarter: 0 rows
/*!40000 ALTER TABLE `gameobject_queststarter` DISABLE KEYS */;
/*!40000 ALTER TABLE `gameobject_queststarter` ENABLE KEYS */;


-- Export de la structure de table world. gameobject_scripts
CREATE TABLE IF NOT EXISTS `gameobject_scripts` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `delay` int(10) unsigned NOT NULL DEFAULT '0',
  `command` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong2` int(10) unsigned NOT NULL DEFAULT '0',
  `dataint` int(11) NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.gameobject_scripts: 0 rows
/*!40000 ALTER TABLE `gameobject_scripts` DISABLE KEYS */;
/*!40000 ALTER TABLE `gameobject_scripts` ENABLE KEYS */;


-- Export de la structure de table world. gameobject_template
CREATE TABLE IF NOT EXISTS `gameobject_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `displayId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `IconName` varchar(100) NOT NULL DEFAULT '',
  `castBarCaption` varchar(100) NOT NULL DEFAULT '',
  `unk1` varchar(100) NOT NULL DEFAULT '',
  `faction` smallint(5) unsigned NOT NULL DEFAULT '0',
  `flags` int(10) unsigned NOT NULL DEFAULT '0',
  `size` float NOT NULL DEFAULT '1',
  `questItem1` int(11) unsigned NOT NULL DEFAULT '0',
  `questItem2` int(11) unsigned NOT NULL DEFAULT '0',
  `questItem3` int(11) unsigned NOT NULL DEFAULT '0',
  `questItem4` int(11) unsigned NOT NULL DEFAULT '0',
  `questItem5` int(11) unsigned NOT NULL DEFAULT '0',
  `questItem6` int(11) unsigned NOT NULL DEFAULT '0',
  `data0` int(10) unsigned NOT NULL DEFAULT '0',
  `data1` int(11) NOT NULL DEFAULT '-1',
  `data2` int(10) unsigned NOT NULL DEFAULT '0',
  `data3` int(10) unsigned NOT NULL DEFAULT '0',
  `data4` int(10) unsigned NOT NULL DEFAULT '0',
  `data5` int(10) unsigned NOT NULL DEFAULT '0',
  `data6` int(11) NOT NULL DEFAULT '-1',
  `data7` int(10) unsigned NOT NULL DEFAULT '0',
  `data8` int(10) unsigned NOT NULL DEFAULT '0',
  `data9` int(10) unsigned NOT NULL DEFAULT '0',
  `data10` int(10) unsigned NOT NULL DEFAULT '0',
  `data11` int(10) unsigned NOT NULL DEFAULT '0',
  `data12` int(10) unsigned NOT NULL DEFAULT '0',
  `data13` int(10) unsigned NOT NULL DEFAULT '0',
  `data14` int(10) unsigned NOT NULL DEFAULT '0',
  `data15` int(10) unsigned NOT NULL DEFAULT '0',
  `data16` int(10) unsigned NOT NULL DEFAULT '0',
  `data17` int(10) unsigned NOT NULL DEFAULT '0',
  `data18` int(10) unsigned NOT NULL DEFAULT '0',
  `data19` int(10) unsigned NOT NULL DEFAULT '0',
  `data20` int(10) unsigned NOT NULL DEFAULT '0',
  `data21` int(10) unsigned NOT NULL DEFAULT '0',
  `data22` int(10) unsigned NOT NULL DEFAULT '0',
  `data23` int(10) unsigned NOT NULL DEFAULT '0',
  `data24` int(10) NOT NULL DEFAULT '0',
  `data25` int(10) NOT NULL DEFAULT '0',
  `data26` int(10) NOT NULL DEFAULT '0',
  `data27` int(10) NOT NULL DEFAULT '0',
  `data28` int(10) NOT NULL DEFAULT '0',
  `data29` int(10) NOT NULL DEFAULT '0',
  `data30` int(10) NOT NULL DEFAULT '0',
  `data31` int(10) NOT NULL DEFAULT '0',
  `unkInt32` int(10) NOT NULL DEFAULT '0',
  `AIName` char(64) NOT NULL DEFAULT '',
  `ScriptName` varchar(64) NOT NULL DEFAULT '',
  `WDBVerified` smallint(6) DEFAULT '1',
  PRIMARY KEY (`entry`),
  KEY `idx_name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Gameobject System';

-- Export de données de la table world.gameobject_template: 0 rows
/*!40000 ALTER TABLE `gameobject_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `gameobject_template` ENABLE KEYS */;


-- Export de la structure de table world. game_event
CREATE TABLE IF NOT EXISTS `game_event` (
  `eventEntry` tinyint(3) unsigned NOT NULL COMMENT 'Entry of the game event',
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Absolute start date, the event will never start before',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Absolute end date, the event will never start afler',
  `occurence` bigint(20) unsigned NOT NULL DEFAULT '5184000' COMMENT 'Delay in minutes between occurences of the event',
  `length` bigint(20) unsigned NOT NULL DEFAULT '2592000' COMMENT 'Length in minutes of the event',
  `holiday` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Client side holiday id',
  `description` varchar(255) DEFAULT NULL COMMENT 'Description of the event displayed in console',
  `world_event` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 if normal event, 1 if world event',
  PRIMARY KEY (`eventEntry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.game_event: 0 rows
/*!40000 ALTER TABLE `game_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_event` ENABLE KEYS */;


-- Export de la structure de table world. game_event_arena_seasons
CREATE TABLE IF NOT EXISTS `game_event_arena_seasons` (
  `eventEntry` tinyint(3) unsigned NOT NULL COMMENT 'Entry of the game event',
  `season` tinyint(3) unsigned NOT NULL COMMENT 'Arena season number',
  UNIQUE KEY `season` (`season`,`eventEntry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.game_event_arena_seasons: 0 rows
/*!40000 ALTER TABLE `game_event_arena_seasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_event_arena_seasons` ENABLE KEYS */;


-- Export de la structure de table world. game_event_battleground_holiday
CREATE TABLE IF NOT EXISTS `game_event_battleground_holiday` (
  `eventEntry` tinyint(3) unsigned NOT NULL COMMENT 'Entry of the game event',
  `bgflag` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`eventEntry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.game_event_battleground_holiday: 0 rows
/*!40000 ALTER TABLE `game_event_battleground_holiday` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_event_battleground_holiday` ENABLE KEYS */;


-- Export de la structure de table world. game_event_condition
CREATE TABLE IF NOT EXISTS `game_event_condition` (
  `eventEntry` tinyint(3) unsigned NOT NULL COMMENT 'Entry of the game event',
  `condition_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `req_num` float DEFAULT '0',
  `max_world_state_field` smallint(5) unsigned NOT NULL DEFAULT '0',
  `done_world_state_field` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`eventEntry`,`condition_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.game_event_condition: 0 rows
/*!40000 ALTER TABLE `game_event_condition` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_event_condition` ENABLE KEYS */;


-- Export de la structure de table world. game_event_creature
CREATE TABLE IF NOT EXISTS `game_event_creature` (
  `eventEntry` tinyint(4) NOT NULL COMMENT 'Entry of the game event. Put negative entry to remove during event.',
  `guid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`guid`,`eventEntry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.game_event_creature: 0 rows
/*!40000 ALTER TABLE `game_event_creature` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_event_creature` ENABLE KEYS */;


-- Export de la structure de table world. game_event_creature_quest
CREATE TABLE IF NOT EXISTS `game_event_creature_quest` (
  `eventEntry` tinyint(3) unsigned NOT NULL COMMENT 'Entry of the game event.',
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.game_event_creature_quest: 0 rows
/*!40000 ALTER TABLE `game_event_creature_quest` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_event_creature_quest` ENABLE KEYS */;


-- Export de la structure de table world. game_event_gameobject
CREATE TABLE IF NOT EXISTS `game_event_gameobject` (
  `eventEntry` tinyint(4) NOT NULL COMMENT 'Entry of the game event. Put negative entry to remove during event.',
  `guid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`guid`,`eventEntry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.game_event_gameobject: 0 rows
/*!40000 ALTER TABLE `game_event_gameobject` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_event_gameobject` ENABLE KEYS */;


-- Export de la structure de table world. game_event_gameobject_quest
CREATE TABLE IF NOT EXISTS `game_event_gameobject_quest` (
  `eventEntry` tinyint(3) unsigned NOT NULL COMMENT 'Entry of the game event',
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`quest`,`eventEntry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.game_event_gameobject_quest: 0 rows
/*!40000 ALTER TABLE `game_event_gameobject_quest` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_event_gameobject_quest` ENABLE KEYS */;


-- Export de la structure de table world. game_event_model_equip
CREATE TABLE IF NOT EXISTS `game_event_model_equip` (
  `eventEntry` tinyint(4) NOT NULL COMMENT 'Entry of the game event.',
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `modelid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `equipment_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.game_event_model_equip: 0 rows
/*!40000 ALTER TABLE `game_event_model_equip` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_event_model_equip` ENABLE KEYS */;


-- Export de la structure de table world. game_event_npcflag
CREATE TABLE IF NOT EXISTS `game_event_npcflag` (
  `eventEntry` tinyint(3) unsigned NOT NULL COMMENT 'Entry of the game event',
  `guid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `npcflag` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`eventEntry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.game_event_npcflag: 0 rows
/*!40000 ALTER TABLE `game_event_npcflag` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_event_npcflag` ENABLE KEYS */;


-- Export de la structure de table world. game_event_npc_vendor
CREATE TABLE IF NOT EXISTS `game_event_npc_vendor` (
  `eventEntry` tinyint(4) NOT NULL COMMENT 'Entry of the game event.',
  `guid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `slot` smallint(6) NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `maxcount` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `incrtime` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ExtendedCost` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`guid`,`item`,`ExtendedCost`,`type`),
  KEY `slot` (`slot`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.game_event_npc_vendor: 0 rows
/*!40000 ALTER TABLE `game_event_npc_vendor` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_event_npc_vendor` ENABLE KEYS */;


-- Export de la structure de table world. game_event_pool
CREATE TABLE IF NOT EXISTS `game_event_pool` (
  `eventEntry` tinyint(4) NOT NULL COMMENT 'Entry of the game event. Put negative entry to remove during event.',
  `pool_entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Id of the pool',
  PRIMARY KEY (`pool_entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.game_event_pool: 0 rows
/*!40000 ALTER TABLE `game_event_pool` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_event_pool` ENABLE KEYS */;


-- Export de la structure de table world. game_event_prerequisite
CREATE TABLE IF NOT EXISTS `game_event_prerequisite` (
  `eventEntry` tinyint(3) unsigned NOT NULL COMMENT 'Entry of the game event',
  `prerequisite_event` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`eventEntry`,`prerequisite_event`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.game_event_prerequisite: 0 rows
/*!40000 ALTER TABLE `game_event_prerequisite` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_event_prerequisite` ENABLE KEYS */;


-- Export de la structure de table world. game_event_quest_condition
CREATE TABLE IF NOT EXISTS `game_event_quest_condition` (
  `eventEntry` tinyint(3) unsigned NOT NULL COMMENT 'Entry of the game event.',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `condition_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `num` float DEFAULT '0',
  PRIMARY KEY (`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.game_event_quest_condition: 0 rows
/*!40000 ALTER TABLE `game_event_quest_condition` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_event_quest_condition` ENABLE KEYS */;


-- Export de la structure de table world. game_event_seasonal_questrelation
CREATE TABLE IF NOT EXISTS `game_event_seasonal_questrelation` (
  `questId` int(10) unsigned NOT NULL COMMENT 'Quest Identifier',
  `eventEntry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Entry of the game event',
  PRIMARY KEY (`questId`,`eventEntry`),
  KEY `idx_quest` (`questId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Player System';

-- Export de données de la table world.game_event_seasonal_questrelation: 0 rows
/*!40000 ALTER TABLE `game_event_seasonal_questrelation` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_event_seasonal_questrelation` ENABLE KEYS */;


-- Export de la structure de table world. game_graveyard_zone
CREATE TABLE IF NOT EXISTS `game_graveyard_zone` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ghost_zone` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `faction` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`ghost_zone`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Trigger System';

-- Export de données de la table world.game_graveyard_zone: 0 rows
/*!40000 ALTER TABLE `game_graveyard_zone` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_graveyard_zone` ENABLE KEYS */;


-- Export de la structure de table world. game_tele
CREATE TABLE IF NOT EXISTS `game_tele` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `map` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Tele Command';

-- Export de données de la table world.game_tele: 0 rows
/*!40000 ALTER TABLE `game_tele` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_tele` ENABLE KEYS */;


-- Export de la structure de table world. game_weather
CREATE TABLE IF NOT EXISTS `game_weather` (
  `zone` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spring_rain_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `spring_snow_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `spring_storm_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `summer_rain_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `summer_snow_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `summer_storm_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `fall_rain_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `fall_snow_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `fall_storm_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `winter_rain_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `winter_snow_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `winter_storm_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `ScriptName` char(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`zone`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Weather System';

-- Export de données de la table world.game_weather: 0 rows
/*!40000 ALTER TABLE `game_weather` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_weather` ENABLE KEYS */;


-- Export de la structure de table world. gossip_menu
CREATE TABLE IF NOT EXISTS `gossip_menu` (
  `entry` smallint(5) unsigned NOT NULL DEFAULT '0',
  `text_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`text_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.gossip_menu: 0 rows
/*!40000 ALTER TABLE `gossip_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `gossip_menu` ENABLE KEYS */;


-- Export de la structure de table world. gossip_menu_option
CREATE TABLE IF NOT EXISTS `gossip_menu_option` (
  `menu_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `option_icon` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `option_text` text,
  `option_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `npc_option_npcflag` int(10) unsigned NOT NULL DEFAULT '0',
  `action_menu_id` int(10) unsigned NOT NULL DEFAULT '0',
  `action_poi_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `box_coded` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `box_money` int(10) unsigned NOT NULL DEFAULT '0',
  `box_text` text,
  PRIMARY KEY (`menu_id`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.gossip_menu_option: 0 rows
/*!40000 ALTER TABLE `gossip_menu_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `gossip_menu_option` ENABLE KEYS */;


-- Export de la structure de table world. guild_finder_applicant
CREATE TABLE IF NOT EXISTS `guild_finder_applicant` (
  `guildId` int(10) unsigned DEFAULT NULL,
  `playerGuid` int(10) unsigned DEFAULT NULL,
  `availability` tinyint(3) unsigned DEFAULT '0',
  `classRole` tinyint(3) unsigned DEFAULT '0',
  `interests` tinyint(3) unsigned DEFAULT '0',
  `comment` varchar(255) DEFAULT NULL,
  `submitTime` int(10) unsigned DEFAULT NULL,
  UNIQUE KEY `guildId` (`guildId`,`playerGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Export de données de la table world.guild_finder_applicant: ~0 rows (environ)
/*!40000 ALTER TABLE `guild_finder_applicant` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_finder_applicant` ENABLE KEYS */;


-- Export de la structure de table world. guild_finder_guild_settings
CREATE TABLE IF NOT EXISTS `guild_finder_guild_settings` (
  `guildId` int(10) unsigned NOT NULL,
  `availability` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `classRoles` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `interests` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `listed` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`guildId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Export de données de la table world.guild_finder_guild_settings: ~0 rows (environ)
/*!40000 ALTER TABLE `guild_finder_guild_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_finder_guild_settings` ENABLE KEYS */;


-- Export de la structure de table world. guild_rewards
CREATE TABLE IF NOT EXISTS `guild_rewards` (
  `entry` int(10) unsigned NOT NULL DEFAULT '0',
  `standing` tinyint(3) unsigned DEFAULT '0',
  `racemask` int(11) DEFAULT '0',
  `price` bigint(20) unsigned DEFAULT '0',
  `achievement` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.guild_rewards: 0 rows
/*!40000 ALTER TABLE `guild_rewards` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_rewards` ENABLE KEYS */;


-- Export de la structure de table world. guild_xp_for_level
CREATE TABLE IF NOT EXISTS `guild_xp_for_level` (
  `lvl` int(11) unsigned NOT NULL,
  `xp_for_next_level` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`lvl`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.guild_xp_for_level: 0 rows
/*!40000 ALTER TABLE `guild_xp_for_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_xp_for_level` ENABLE KEYS */;


-- Export de la structure de table world. hotfix_data
CREATE TABLE IF NOT EXISTS `hotfix_data` (
  `entry` int(10) unsigned NOT NULL,
  `type` int(10) unsigned NOT NULL DEFAULT '0',
  `hotfixDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`entry`,`type`,`hotfixDate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.hotfix_data: 0 rows
/*!40000 ALTER TABLE `hotfix_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `hotfix_data` ENABLE KEYS */;


-- Export de la structure de table world. instance_encounters
CREATE TABLE IF NOT EXISTS `instance_encounters` (
  `entry` int(10) unsigned NOT NULL COMMENT 'Unique entry from DungeonEncounter.dbc',
  `creditType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `creditEntry` int(10) unsigned NOT NULL DEFAULT '0',
  `lastEncounterDungeon` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'If not 0, LfgDungeon.dbc entry for the instance it is last encounter in',
  `comment` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.instance_encounters: 0 rows
/*!40000 ALTER TABLE `instance_encounters` DISABLE KEYS */;
/*!40000 ALTER TABLE `instance_encounters` ENABLE KEYS */;


-- Export de la structure de table world. instance_template
CREATE TABLE IF NOT EXISTS `instance_template` (
  `map` smallint(5) unsigned NOT NULL,
  `parent` smallint(5) unsigned NOT NULL,
  `script` varchar(128) NOT NULL DEFAULT '',
  `allowMount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`map`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.instance_template: 0 rows
/*!40000 ALTER TABLE `instance_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `instance_template` ENABLE KEYS */;


-- Export de la structure de table world. ip2nation
CREATE TABLE IF NOT EXISTS `ip2nation` (
  `ip` int(10) unsigned NOT NULL DEFAULT '0',
  `country` char(2) NOT NULL DEFAULT '',
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Export de données de la table world.ip2nation: ~0 rows (environ)
/*!40000 ALTER TABLE `ip2nation` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip2nation` ENABLE KEYS */;


-- Export de la structure de table world. ip2nationcountries
CREATE TABLE IF NOT EXISTS `ip2nationcountries` (
  `code` varchar(4) NOT NULL DEFAULT '',
  `iso_code_2` varchar(2) NOT NULL DEFAULT '',
  `iso_code_3` varchar(3) DEFAULT '',
  `iso_country` varchar(255) NOT NULL DEFAULT '',
  `country` varchar(255) NOT NULL DEFAULT '',
  `lat` float NOT NULL DEFAULT '0',
  `lon` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`code`),
  KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Export de données de la table world.ip2nationcountries: ~0 rows (environ)
/*!40000 ALTER TABLE `ip2nationcountries` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip2nationcountries` ENABLE KEYS */;


-- Export de la structure de table world. item_enchantment_template
CREATE TABLE IF NOT EXISTS `item_enchantment_template` (
  `entry` mediumint(8) DEFAULT NULL,
  `ench` mediumint(8) DEFAULT NULL,
  `chance` float DEFAULT NULL,
  `type` mediumint(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Export de données de la table world.item_enchantment_template: ~0 rows (environ)
/*!40000 ALTER TABLE `item_enchantment_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_enchantment_template` ENABLE KEYS */;


-- Export de la structure de table world. item_extended_cost
CREATE TABLE IF NOT EXISTS `item_extended_cost` (
  `ID` mediumint(11) DEFAULT NULL,
  `RequiredArenaSlot` mediumint(11) DEFAULT NULL,
  `RequiredItem1` mediumint(11) DEFAULT NULL,
  `RequiredItem2` mediumint(11) DEFAULT NULL,
  `RequiredItem3` mediumint(11) DEFAULT NULL,
  `RequiredItem4` mediumint(11) DEFAULT NULL,
  `RequiredItem5` mediumint(11) DEFAULT NULL,
  `RequiredItemCount1` mediumint(11) DEFAULT NULL,
  `RequiredItemCount2` mediumint(11) DEFAULT NULL,
  `RequiredItemCount3` mediumint(11) DEFAULT NULL,
  `RequiredItemCount4` mediumint(11) DEFAULT NULL,
  `RequiredItemCount5` mediumint(11) DEFAULT NULL,
  `RequiredPersonalArenaRating` mediumint(11) DEFAULT NULL,
  `RequiredCurrency1` mediumint(11) DEFAULT NULL,
  `RequiredCurrency2` mediumint(11) DEFAULT NULL,
  `RequiredCurrency3` mediumint(11) DEFAULT NULL,
  `RequiredCurrency4` mediumint(11) DEFAULT NULL,
  `RequiredCurrency5` mediumint(11) DEFAULT NULL,
  `RequiredCurrencyCount1` mediumint(11) DEFAULT NULL,
  `RequiredCurrencyCount2` mediumint(11) DEFAULT NULL,
  `RequiredCurrencyCount3` mediumint(11) DEFAULT NULL,
  `RequiredCurrencyCount4` mediumint(11) DEFAULT NULL,
  `RequiredCurrencyCount5` mediumint(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Export de données de la table world.item_extended_cost: ~0 rows (environ)
/*!40000 ALTER TABLE `item_extended_cost` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_extended_cost` ENABLE KEYS */;


-- Export de la structure de table world. item_loot_template
CREATE TABLE IF NOT EXISTS `item_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `lootmode` smallint(5) unsigned NOT NULL DEFAULT '1',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(8) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';

-- Export de données de la table world.item_loot_template: 0 rows
/*!40000 ALTER TABLE `item_loot_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_loot_template` ENABLE KEYS */;


-- Export de la structure de table world. item_script_names
CREATE TABLE IF NOT EXISTS `item_script_names` (
  `Id` int(10) unsigned NOT NULL,
  `ScriptName` varchar(64) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Export de données de la table world.item_script_names: 0 rows
/*!40000 ALTER TABLE `item_script_names` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_script_names` ENABLE KEYS */;


-- Export de la structure de table world. item_template
CREATE TABLE IF NOT EXISTS `item_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `subclass` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `SoundOverrideSubclass` tinyint(3) NOT NULL DEFAULT '-1',
  `name` varchar(255) NOT NULL DEFAULT '',
  `displayid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `armor` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Quality` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Flags` bigint(20) NOT NULL DEFAULT '0',
  `FlagsExtra` int(10) unsigned NOT NULL DEFAULT '0',
  `Unk430_1` float unsigned NOT NULL DEFAULT '1',
  `Unk430_2` float NOT NULL DEFAULT '1',
  `BuyCount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `BuyPrice` bigint(20) NOT NULL DEFAULT '0',
  `SellPrice` int(10) unsigned NOT NULL DEFAULT '0',
  `InventoryType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `AllowableClass` int(11) NOT NULL DEFAULT '-1',
  `AllowableRace` int(11) NOT NULL DEFAULT '-1',
  `ItemLevel` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RequiredSkill` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredSkillRank` smallint(5) unsigned NOT NULL DEFAULT '0',
  `requiredspell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `requiredhonorrank` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredCityRank` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredReputationFaction` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredReputationRank` smallint(5) unsigned NOT NULL DEFAULT '0',
  `maxcount` int(11) NOT NULL DEFAULT '0',
  `stackable` int(11) DEFAULT '1',
  `ContainerSlots` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_type1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value1` smallint(6) NOT NULL DEFAULT '0',
  `stat_unk1_1` int(11) NOT NULL DEFAULT '0',
  `stat_unk2_1` int(11) NOT NULL DEFAULT '0',
  `stat_type2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value2` smallint(6) NOT NULL DEFAULT '0',
  `stat_unk1_2` int(11) NOT NULL DEFAULT '0',
  `stat_unk2_2` int(11) NOT NULL DEFAULT '0',
  `stat_type3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value3` smallint(6) NOT NULL DEFAULT '0',
  `stat_unk1_3` int(11) NOT NULL DEFAULT '0',
  `stat_unk2_3` int(11) NOT NULL DEFAULT '0',
  `stat_type4` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value4` smallint(6) NOT NULL DEFAULT '0',
  `stat_unk1_4` int(11) NOT NULL DEFAULT '0',
  `stat_unk2_4` int(11) NOT NULL DEFAULT '0',
  `stat_type5` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value5` smallint(6) NOT NULL DEFAULT '0',
  `stat_unk1_5` int(11) NOT NULL DEFAULT '0',
  `stat_unk2_5` int(11) NOT NULL DEFAULT '0',
  `stat_type6` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value6` smallint(6) NOT NULL DEFAULT '0',
  `stat_unk1_6` int(11) NOT NULL DEFAULT '0',
  `stat_unk2_6` int(11) NOT NULL DEFAULT '0',
  `stat_type7` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value7` smallint(6) NOT NULL DEFAULT '0',
  `stat_unk1_7` int(11) NOT NULL DEFAULT '0',
  `stat_unk2_7` int(11) NOT NULL DEFAULT '0',
  `stat_type8` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value8` smallint(6) NOT NULL DEFAULT '0',
  `stat_unk1_8` int(11) NOT NULL DEFAULT '0',
  `stat_unk2_8` int(11) NOT NULL DEFAULT '0',
  `stat_type9` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value9` smallint(6) NOT NULL DEFAULT '0',
  `stat_unk1_9` int(11) NOT NULL DEFAULT '0',
  `stat_unk2_9` int(11) NOT NULL DEFAULT '0',
  `stat_type10` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value10` smallint(6) NOT NULL DEFAULT '0',
  `stat_unk1_10` int(11) NOT NULL DEFAULT '0',
  `stat_unk2_10` int(11) NOT NULL DEFAULT '0',
  `ScalingStatDistribution` smallint(6) NOT NULL DEFAULT '0',
  `DamageType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `delay` smallint(5) unsigned NOT NULL DEFAULT '1000',
  `RangedModRange` float NOT NULL DEFAULT '0',
  `spellid_1` mediumint(8) NOT NULL DEFAULT '0',
  `spelltrigger_1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `spellcharges_1` smallint(6) DEFAULT NULL,
  `spellcooldown_1` int(11) NOT NULL DEFAULT '-1',
  `spellcategory_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_1` int(11) NOT NULL DEFAULT '-1',
  `spellid_2` mediumint(8) NOT NULL DEFAULT '0',
  `spelltrigger_2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `spellcharges_2` smallint(6) DEFAULT NULL,
  `spellcooldown_2` int(11) NOT NULL DEFAULT '-1',
  `spellcategory_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_2` int(11) NOT NULL DEFAULT '-1',
  `spellid_3` mediumint(8) NOT NULL DEFAULT '0',
  `spelltrigger_3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `spellcharges_3` smallint(6) DEFAULT NULL,
  `spellcooldown_3` int(11) NOT NULL DEFAULT '-1',
  `spellcategory_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_3` int(11) NOT NULL DEFAULT '-1',
  `spellid_4` mediumint(8) NOT NULL DEFAULT '0',
  `spelltrigger_4` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `spellcharges_4` smallint(6) DEFAULT NULL,
  `spellcooldown_4` int(11) NOT NULL DEFAULT '-1',
  `spellcategory_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_4` int(11) NOT NULL DEFAULT '-1',
  `spellid_5` mediumint(8) NOT NULL DEFAULT '0',
  `spelltrigger_5` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `spellcharges_5` smallint(6) DEFAULT NULL,
  `spellcooldown_5` int(11) NOT NULL DEFAULT '-1',
  `spellcategory_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_5` int(11) NOT NULL DEFAULT '-1',
  `bonding` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `PageText` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `LanguageID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `PageMaterial` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `startquest` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lockid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Material` tinyint(4) NOT NULL DEFAULT '0',
  `sheath` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RandomProperty` mediumint(8) NOT NULL DEFAULT '0',
  `RandomSuffix` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `itemset` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `MaxDurability` smallint(5) unsigned NOT NULL DEFAULT '0',
  `area` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Map` smallint(6) NOT NULL DEFAULT '0',
  `BagFamily` mediumint(8) NOT NULL DEFAULT '0',
  `TotemCategory` mediumint(8) NOT NULL DEFAULT '0',
  `socketColor_1` tinyint(4) NOT NULL DEFAULT '0',
  `socketContent_1` mediumint(8) NOT NULL DEFAULT '0',
  `socketColor_2` tinyint(4) NOT NULL DEFAULT '0',
  `socketContent_2` mediumint(8) NOT NULL DEFAULT '0',
  `socketColor_3` tinyint(4) NOT NULL DEFAULT '0',
  `socketContent_3` mediumint(8) NOT NULL DEFAULT '0',
  `socketBonus` mediumint(8) NOT NULL DEFAULT '0',
  `GemProperties` mediumint(8) NOT NULL DEFAULT '0',
  `ArmorDamageModifier` float NOT NULL DEFAULT '0',
  `duration` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemLimitCategory` smallint(6) NOT NULL DEFAULT '0',
  `HolidayId` int(11) unsigned NOT NULL DEFAULT '0',
  `StatScalingFactor` float NOT NULL DEFAULT '0',
  `CurrencySubstitutionId` int(10) unsigned NOT NULL DEFAULT '0',
  `CurrencySubstitutionCount` int(10) unsigned NOT NULL DEFAULT '0',
  `flagsCustom` int(10) unsigned NOT NULL DEFAULT '0',
  `WDBVerified` smallint(6) DEFAULT '1',
  PRIMARY KEY (`entry`),
  KEY `idx_name` (`name`),
  KEY `items_index` (`class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Item System';

-- Export de données de la table world.item_template: 0 rows
/*!40000 ALTER TABLE `item_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_template` ENABLE KEYS */;


-- Export de la structure de table world. item_template_addon
CREATE TABLE IF NOT EXISTS `item_template_addon` (
  `Id` int(10) unsigned NOT NULL,
  `FlagsCu` int(10) unsigned NOT NULL DEFAULT '0',
  `FoodType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MinMoneyLoot` int(10) unsigned NOT NULL DEFAULT '0',
  `MaxMoneyLoot` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellPPMChance` float unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Export de données de la table world.item_template_addon: 0 rows
/*!40000 ALTER TABLE `item_template_addon` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_template_addon` ENABLE KEYS */;


-- Export de la structure de table world. lfg_dungeon_rewards
CREATE TABLE IF NOT EXISTS `lfg_dungeon_rewards` (
  `dungeonId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Dungeon entry from dbc',
  `maxLevel` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Max level at which this reward is rewarded',
  `firstQuestId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest id with rewards for first dungeon this day',
  `firstMoneyVar` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Money multiplier for completing the dungeon first time in a day with less players than max',
  `firstXPVar` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Experience multiplier for completing the dungeon first time in a day with less players than max',
  `otherQuestId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest id with rewards for Nth dungeon this day',
  `otherMoneyVar` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Money multiplier for completing the dungeon Nth time in a day with less players than max',
  `otherXPVar` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Experience multiplier for completing the dungeon Nth time in a day with less players than max',
  PRIMARY KEY (`dungeonId`,`maxLevel`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.lfg_dungeon_rewards: 0 rows
/*!40000 ALTER TABLE `lfg_dungeon_rewards` DISABLE KEYS */;
/*!40000 ALTER TABLE `lfg_dungeon_rewards` ENABLE KEYS */;


-- Export de la structure de table world. lfg_entrances
CREATE TABLE IF NOT EXISTS `lfg_entrances` (
  `dungeonId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Unique id from LFGDungeons.dbc',
  `name` varchar(255) DEFAULT NULL,
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`dungeonId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Export de données de la table world.lfg_entrances: ~0 rows (environ)
/*!40000 ALTER TABLE `lfg_entrances` DISABLE KEYS */;
/*!40000 ALTER TABLE `lfg_entrances` ENABLE KEYS */;


-- Export de la structure de table world. linked_respawn
CREATE TABLE IF NOT EXISTS `linked_respawn` (
  `guid` int(10) unsigned NOT NULL COMMENT 'dependent creature',
  `linkedGuid` int(10) unsigned NOT NULL COMMENT 'master creature',
  `linkType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`linkType`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Creature Respawn Link System';

-- Export de données de la table world.linked_respawn: 0 rows
/*!40000 ALTER TABLE `linked_respawn` DISABLE KEYS */;
/*!40000 ALTER TABLE `linked_respawn` ENABLE KEYS */;


-- Export de la structure de table world. locales_achievement_reward
CREATE TABLE IF NOT EXISTS `locales_achievement_reward` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `subject_loc1` varchar(100) NOT NULL DEFAULT '',
  `subject_loc2` varchar(100) NOT NULL DEFAULT '',
  `subject_loc3` varchar(100) NOT NULL DEFAULT '',
  `subject_loc4` varchar(100) NOT NULL DEFAULT '',
  `subject_loc5` varchar(100) NOT NULL DEFAULT '',
  `subject_loc6` varchar(100) NOT NULL DEFAULT '',
  `subject_loc7` varchar(100) NOT NULL DEFAULT '',
  `subject_loc8` varchar(100) NOT NULL DEFAULT '',
  `subject_loc9` varchar(100) NOT NULL DEFAULT '',
  `subject_loc10` varchar(100) NOT NULL DEFAULT '',
  `text_loc1` text,
  `text_loc2` text,
  `text_loc3` text,
  `text_loc4` text,
  `text_loc5` text,
  `text_loc6` text,
  `text_loc7` text,
  `text_loc8` text,
  `text_loc9` text,
  `text_loc10` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.locales_achievement_reward: 0 rows
/*!40000 ALTER TABLE `locales_achievement_reward` DISABLE KEYS */;
/*!40000 ALTER TABLE `locales_achievement_reward` ENABLE KEYS */;


-- Export de la structure de table world. locales_creature
CREATE TABLE IF NOT EXISTS `locales_creature` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name_loc1` varchar(100) NOT NULL DEFAULT '',
  `name_loc2` varchar(100) NOT NULL DEFAULT '',
  `name_loc3` varchar(100) NOT NULL DEFAULT '',
  `name_loc4` varchar(100) NOT NULL DEFAULT '',
  `name_loc5` varchar(100) NOT NULL DEFAULT '',
  `name_loc6` varchar(100) NOT NULL DEFAULT '',
  `name_loc7` varchar(100) NOT NULL DEFAULT '',
  `name_loc8` varchar(100) NOT NULL DEFAULT '',
  `name_loc9` varchar(100) DEFAULT '',
  `name_loc10` varchar(100) DEFAULT '',
  `subname_loc1` varchar(100) DEFAULT '',
  `subname_loc2` varchar(100) DEFAULT '',
  `subname_loc3` varchar(100) DEFAULT '',
  `subname_loc4` varchar(100) DEFAULT '',
  `subname_loc5` varchar(100) DEFAULT '',
  `subname_loc6` varchar(100) DEFAULT '',
  `subname_loc7` varchar(100) DEFAULT '',
  `subname_loc8` varchar(100) DEFAULT '',
  `subname_loc9` varchar(100) DEFAULT '',
  `subname_loc10` varchar(100) DEFAULT '',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.locales_creature: 0 rows
/*!40000 ALTER TABLE `locales_creature` DISABLE KEYS */;
/*!40000 ALTER TABLE `locales_creature` ENABLE KEYS */;


-- Export de la structure de table world. locales_creature_text
CREATE TABLE IF NOT EXISTS `locales_creature_text` (
  `entry` int(10) unsigned NOT NULL,
  `textGroup` tinyint(3) unsigned NOT NULL,
  `id` int(10) unsigned NOT NULL,
  `text_loc1` text,
  `text_loc2` text,
  `text_loc3` text,
  `text_loc4` text,
  `text_loc5` text,
  `text_loc6` text,
  `text_loc7` text,
  `text_loc8` text,
  `text_loc9` text,
  `text_loc10` text,
  PRIMARY KEY (`entry`,`textGroup`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.locales_creature_text: 0 rows
/*!40000 ALTER TABLE `locales_creature_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `locales_creature_text` ENABLE KEYS */;


-- Export de la structure de table world. locales_gameobject
CREATE TABLE IF NOT EXISTS `locales_gameobject` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name_loc1` varchar(100) NOT NULL DEFAULT '',
  `name_loc2` varchar(100) NOT NULL DEFAULT '',
  `name_loc3` varchar(100) NOT NULL DEFAULT '',
  `name_loc4` varchar(100) NOT NULL DEFAULT '',
  `name_loc5` varchar(100) NOT NULL DEFAULT '',
  `name_loc6` varchar(100) NOT NULL DEFAULT '',
  `name_loc7` varchar(100) NOT NULL DEFAULT '',
  `name_loc8` varchar(100) NOT NULL DEFAULT '',
  `name_loc9` varchar(100) NOT NULL DEFAULT '',
  `name_loc10` varchar(100) NOT NULL DEFAULT '',
  `castbarcaption_loc1` varchar(100) NOT NULL DEFAULT '',
  `castbarcaption_loc2` varchar(100) NOT NULL DEFAULT '',
  `castbarcaption_loc3` varchar(100) NOT NULL DEFAULT '',
  `castbarcaption_loc4` varchar(100) NOT NULL DEFAULT '',
  `castbarcaption_loc5` varchar(100) NOT NULL DEFAULT '',
  `castbarcaption_loc6` varchar(100) NOT NULL DEFAULT '',
  `castbarcaption_loc7` varchar(100) NOT NULL DEFAULT '',
  `castbarcaption_loc8` varchar(100) NOT NULL DEFAULT '',
  `castbarcaption_loc9` varchar(100) NOT NULL DEFAULT '',
  `castbarcaption_loc10` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.locales_gameobject: 0 rows
/*!40000 ALTER TABLE `locales_gameobject` DISABLE KEYS */;
/*!40000 ALTER TABLE `locales_gameobject` ENABLE KEYS */;


-- Export de la structure de table world. locales_gossip_menu_option
CREATE TABLE IF NOT EXISTS `locales_gossip_menu_option` (
  `menu_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `option_text_loc1` text,
  `option_text_loc2` text,
  `option_text_loc3` text,
  `option_text_loc4` text,
  `option_text_loc5` text,
  `option_text_loc6` text,
  `option_text_loc7` text,
  `option_text_loc8` text,
  `option_text_loc9` text,
  `option_text_loc10` text,
  `box_text_loc1` text,
  `box_text_loc2` text,
  `box_text_loc3` text,
  `box_text_loc4` text,
  `box_text_loc5` text,
  `box_text_loc6` text,
  `box_text_loc7` text,
  `box_text_loc8` text,
  `box_text_loc9` text,
  `box_text_loc10` text,
  PRIMARY KEY (`menu_id`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.locales_gossip_menu_option: 0 rows
/*!40000 ALTER TABLE `locales_gossip_menu_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `locales_gossip_menu_option` ENABLE KEYS */;


-- Export de la structure de table world. locales_item
CREATE TABLE IF NOT EXISTS `locales_item` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name_loc1` varchar(100) NOT NULL DEFAULT '',
  `name_loc2` varchar(100) NOT NULL DEFAULT '',
  `name_loc3` varchar(100) NOT NULL DEFAULT '',
  `name_loc4` varchar(100) NOT NULL DEFAULT '',
  `name_loc5` varchar(100) NOT NULL DEFAULT '',
  `name_loc6` varchar(100) NOT NULL DEFAULT '',
  `name_loc7` varchar(100) NOT NULL DEFAULT '',
  `name_loc8` varchar(100) NOT NULL DEFAULT '',
  `name_loc9` varchar(100) DEFAULT '',
  `name_loc10` varchar(100) DEFAULT '',
  `description_loc1` varchar(255) DEFAULT NULL,
  `description_loc2` varchar(255) DEFAULT NULL,
  `description_loc3` varchar(255) DEFAULT NULL,
  `description_loc4` varchar(255) DEFAULT NULL,
  `description_loc5` varchar(255) DEFAULT NULL,
  `description_loc6` varchar(255) DEFAULT NULL,
  `description_loc7` varchar(255) DEFAULT NULL,
  `description_loc8` varchar(255) DEFAULT NULL,
  `description_loc9` varchar(255) DEFAULT NULL,
  `description_loc10` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.locales_item: 0 rows
/*!40000 ALTER TABLE `locales_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `locales_item` ENABLE KEYS */;


-- Export de la structure de table world. locales_npc_text
CREATE TABLE IF NOT EXISTS `locales_npc_text` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Text0_0_loc1` longtext,
  `Text0_0_loc2` longtext,
  `Text0_0_loc3` longtext,
  `Text0_0_loc4` longtext,
  `Text0_0_loc5` longtext,
  `Text0_0_loc6` longtext,
  `Text0_0_loc7` longtext,
  `Text0_0_loc8` longtext,
  `Text0_0_loc9` longtext,
  `Text0_0_loc10` longtext,
  `Text0_1_loc1` longtext,
  `Text0_1_loc2` longtext,
  `Text0_1_loc3` longtext,
  `Text0_1_loc4` longtext,
  `Text0_1_loc5` longtext,
  `Text0_1_loc6` longtext,
  `Text0_1_loc7` longtext,
  `Text0_1_loc8` longtext,
  `Text0_1_loc9` longtext,
  `Text0_1_loc10` longtext,
  `Text1_0_loc1` longtext,
  `Text1_0_loc2` longtext,
  `Text1_0_loc3` longtext,
  `Text1_0_loc4` longtext,
  `Text1_0_loc5` longtext,
  `Text1_0_loc6` longtext,
  `Text1_0_loc7` longtext,
  `Text1_0_loc8` longtext,
  `Text1_0_loc9` longtext,
  `Text1_0_loc10` longtext,
  `Text1_1_loc1` longtext,
  `Text1_1_loc2` longtext,
  `Text1_1_loc3` longtext,
  `Text1_1_loc4` longtext,
  `Text1_1_loc5` longtext,
  `Text1_1_loc6` longtext,
  `Text1_1_loc7` longtext,
  `Text1_1_loc8` longtext,
  `Text1_1_loc9` longtext,
  `Text1_1_loc10` longtext,
  `Text2_0_loc1` longtext,
  `Text2_0_loc2` longtext,
  `Text2_0_loc3` longtext,
  `Text2_0_loc4` longtext,
  `Text2_0_loc5` longtext,
  `Text2_0_loc6` longtext,
  `Text2_0_loc7` longtext,
  `Text2_0_loc8` longtext,
  `Text2_0_loc9` longtext,
  `Text2_0_loc10` longtext,
  `Text2_1_loc1` longtext,
  `Text2_1_loc2` longtext,
  `Text2_1_loc3` longtext,
  `Text2_1_loc4` longtext,
  `Text2_1_loc5` longtext,
  `Text2_1_loc6` longtext,
  `Text2_1_loc7` longtext,
  `Text2_1_loc8` longtext,
  `Text2_1_loc9` longtext,
  `Text2_1_loc10` longtext,
  `Text3_0_loc1` longtext,
  `Text3_0_loc2` longtext,
  `Text3_0_loc3` longtext,
  `Text3_0_loc4` longtext,
  `Text3_0_loc5` longtext,
  `Text3_0_loc6` longtext,
  `Text3_0_loc7` longtext,
  `Text3_0_loc8` longtext,
  `Text3_0_loc9` longtext,
  `Text3_0_loc10` longtext,
  `Text3_1_loc1` longtext,
  `Text3_1_loc2` longtext,
  `Text3_1_loc3` longtext,
  `Text3_1_loc4` longtext,
  `Text3_1_loc5` longtext,
  `Text3_1_loc6` longtext,
  `Text3_1_loc7` longtext,
  `Text3_1_loc8` longtext,
  `Text3_1_loc9` longtext,
  `Text3_1_loc10` longtext,
  `Text4_0_loc1` longtext,
  `Text4_0_loc2` longtext,
  `Text4_0_loc3` longtext,
  `Text4_0_loc4` longtext,
  `Text4_0_loc5` longtext,
  `Text4_0_loc6` longtext,
  `Text4_0_loc7` longtext,
  `Text4_0_loc8` longtext,
  `Text4_0_loc9` longtext,
  `Text4_0_loc10` longtext,
  `Text4_1_loc1` longtext,
  `Text4_1_loc2` longtext,
  `Text4_1_loc3` longtext,
  `Text4_1_loc4` longtext,
  `Text4_1_loc5` longtext,
  `Text4_1_loc6` longtext,
  `Text4_1_loc7` longtext,
  `Text4_1_loc8` longtext,
  `Text4_1_loc9` longtext,
  `Text4_1_loc10` longtext,
  `Text5_0_loc1` longtext,
  `Text5_0_loc2` longtext,
  `Text5_0_loc3` longtext,
  `Text5_0_loc4` longtext,
  `Text5_0_loc5` longtext,
  `Text5_0_loc6` longtext,
  `Text5_0_loc7` longtext,
  `Text5_0_loc8` longtext,
  `Text5_0_loc9` longtext,
  `Text5_0_loc10` longtext,
  `Text5_1_loc1` longtext,
  `Text5_1_loc2` longtext,
  `Text5_1_loc3` longtext,
  `Text5_1_loc4` longtext,
  `Text5_1_loc5` longtext,
  `Text5_1_loc6` longtext,
  `Text5_1_loc7` longtext,
  `Text5_1_loc8` longtext,
  `Text5_1_loc9` longtext,
  `Text5_1_loc10` longtext,
  `Text6_0_loc1` longtext,
  `Text6_0_loc2` longtext,
  `Text6_0_loc3` longtext,
  `Text6_0_loc4` longtext,
  `Text6_0_loc5` longtext,
  `Text6_0_loc6` longtext,
  `Text6_0_loc7` longtext,
  `Text6_0_loc8` longtext,
  `Text6_0_loc9` longtext,
  `Text6_0_loc10` longtext,
  `Text6_1_loc1` longtext,
  `Text6_1_loc2` longtext,
  `Text6_1_loc3` longtext,
  `Text6_1_loc4` longtext,
  `Text6_1_loc5` longtext,
  `Text6_1_loc6` longtext,
  `Text6_1_loc7` longtext,
  `Text6_1_loc8` longtext,
  `Text6_1_loc9` longtext,
  `Text6_1_loc10` longtext,
  `Text7_0_loc1` longtext,
  `Text7_0_loc2` longtext,
  `Text7_0_loc3` longtext,
  `Text7_0_loc4` longtext,
  `Text7_0_loc5` longtext,
  `Text7_0_loc6` longtext,
  `Text7_0_loc7` longtext,
  `Text7_0_loc8` longtext,
  `Text7_0_loc9` longtext,
  `Text7_0_loc10` longtext,
  `Text7_1_loc1` longtext,
  `Text7_1_loc2` longtext,
  `Text7_1_loc3` longtext,
  `Text7_1_loc4` longtext,
  `Text7_1_loc5` longtext,
  `Text7_1_loc6` longtext,
  `Text7_1_loc7` longtext,
  `Text7_1_loc8` longtext,
  `Text7_1_loc9` longtext,
  `Text7_1_loc10` longtext,
  `Text8_0_loc1` longtext,
  `Text8_0_loc2` longtext,
  `Text8_0_loc3` longtext,
  `Text8_0_loc4` longtext,
  `Text8_0_loc5` longtext,
  `Text8_0_loc6` longtext,
  `Text8_0_loc7` longtext,
  `Text8_0_loc8` longtext,
  `Text8_0_loc9` longtext,
  `Text8_0_loc10` longtext,
  `Text8_1_loc1` longtext,
  `Text8_1_loc2` longtext,
  `Text8_1_loc3` longtext,
  `Text8_1_loc4` longtext,
  `Text8_1_loc5` longtext,
  `Text8_1_loc6` longtext,
  `Text8_1_loc7` longtext,
  `Text8_1_loc8` longtext,
  `Text8_1_loc9` longtext,
  `Text8_1_loc10` longtext,
  `Text9_0_loc1` longtext,
  `Text9_0_loc2` longtext,
  `Text9_0_loc3` longtext,
  `Text9_0_loc4` longtext,
  `Text9_0_loc5` longtext,
  `Text9_0_loc6` longtext,
  `Text9_0_loc7` longtext,
  `Text9_0_loc8` longtext,
  `Text9_0_loc9` longtext,
  `Text9_0_loc10` longtext,
  `Text9_1_loc1` longtext,
  `Text9_1_loc2` longtext,
  `Text9_1_loc3` longtext,
  `Text9_1_loc4` longtext,
  `Text9_1_loc5` longtext,
  `Text9_1_loc6` longtext,
  `Text9_1_loc7` longtext,
  `Text9_1_loc8` longtext,
  `Text9_1_loc9` longtext,
  `Text9_1_loc10` longtext,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.locales_npc_text: 0 rows
/*!40000 ALTER TABLE `locales_npc_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `locales_npc_text` ENABLE KEYS */;


-- Export de la structure de table world. locales_page_text
CREATE TABLE IF NOT EXISTS `locales_page_text` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Text_loc1` longtext,
  `Text_loc2` longtext,
  `Text_loc3` longtext,
  `Text_loc4` longtext,
  `Text_loc5` longtext,
  `Text_loc6` longtext,
  `Text_loc7` longtext,
  `Text_loc8` longtext,
  `Text_loc9` longtext,
  `Text_loc10` longtext,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.locales_page_text: 0 rows
/*!40000 ALTER TABLE `locales_page_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `locales_page_text` ENABLE KEYS */;


-- Export de la structure de table world. locales_points_of_interest
CREATE TABLE IF NOT EXISTS `locales_points_of_interest` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `icon_name_loc1` text,
  `icon_name_loc2` text,
  `icon_name_loc3` text,
  `icon_name_loc4` text,
  `icon_name_loc5` text,
  `icon_name_loc6` text,
  `icon_name_loc7` text,
  `icon_name_loc8` text,
  `icon_name_loc9` text,
  `icon_name_loc10` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.locales_points_of_interest: 0 rows
/*!40000 ALTER TABLE `locales_points_of_interest` DISABLE KEYS */;
/*!40000 ALTER TABLE `locales_points_of_interest` ENABLE KEYS */;


-- Export de la structure de table world. locales_quest
CREATE TABLE IF NOT EXISTS `locales_quest` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Title_loc1` text,
  `Title_loc2` text,
  `Title_loc3` text,
  `Title_loc4` text,
  `Title_loc5` text,
  `Title_loc6` text,
  `Title_loc7` text,
  `Title_loc8` text,
  `Title_loc9` text,
  `Title_loc10` text,
  `Details_loc1` text,
  `Details_loc2` text,
  `Details_loc3` text,
  `Details_loc4` text,
  `Details_loc5` text,
  `Details_loc6` text,
  `Details_loc7` text,
  `Details_loc8` text,
  `Details_loc9` text,
  `Details_loc10` text,
  `Objectives_loc1` text,
  `Objectives_loc2` text,
  `Objectives_loc3` text,
  `Objectives_loc4` text,
  `Objectives_loc5` text,
  `Objectives_loc6` text,
  `Objectives_loc7` text,
  `Objectives_loc8` text,
  `Objectives_loc9` text,
  `Objectives_loc10` text,
  `OfferRewardText_loc1` text,
  `OfferRewardText_loc2` text,
  `OfferRewardText_loc3` text,
  `OfferRewardText_loc4` text,
  `OfferRewardText_loc5` text,
  `OfferRewardText_loc6` text,
  `OfferRewardText_loc7` text,
  `OfferRewardText_loc8` text,
  `OfferRewardText_loc9` text,
  `OfferRewardText_loc10` text,
  `RequestItemsText_loc1` text,
  `RequestItemsText_loc2` text,
  `RequestItemsText_loc3` text,
  `RequestItemsText_loc4` text,
  `RequestItemsText_loc5` text,
  `RequestItemsText_loc6` text,
  `RequestItemsText_loc7` text,
  `RequestItemsText_loc8` text,
  `RequestItemsText_loc9` text,
  `RequestItemsText_loc10` text,
  `EndText_loc1` text,
  `EndText_loc2` text,
  `EndText_loc3` text,
  `EndText_loc4` text,
  `EndText_loc5` text,
  `EndText_loc6` text,
  `EndText_loc7` text,
  `EndText_loc8` text,
  `EndText_loc9` text,
  `EndText_loc10` text,
  `CompletedText_loc1` text,
  `CompletedText_loc2` text,
  `CompletedText_loc3` text,
  `CompletedText_loc4` text,
  `CompletedText_loc5` text,
  `CompletedText_loc6` text,
  `CompletedText_loc7` text,
  `CompletedText_loc8` text,
  `CompletedText_loc9` text,
  `CompletedText_loc10` text,
  `ObjectiveText1_loc1` text,
  `ObjectiveText1_loc2` text,
  `ObjectiveText1_loc3` text,
  `ObjectiveText1_loc4` text,
  `ObjectiveText1_loc5` text,
  `ObjectiveText1_loc6` text,
  `ObjectiveText1_loc7` text,
  `ObjectiveText1_loc8` text,
  `ObjectiveText1_loc9` text,
  `ObjectiveText1_loc10` text,
  `ObjectiveText2_loc1` text,
  `ObjectiveText2_loc2` text,
  `ObjectiveText2_loc3` text,
  `ObjectiveText2_loc4` text,
  `ObjectiveText2_loc5` text,
  `ObjectiveText2_loc6` text,
  `ObjectiveText2_loc7` text,
  `ObjectiveText2_loc8` text,
  `ObjectiveText2_loc9` text,
  `ObjectiveText2_loc10` text,
  `ObjectiveText3_loc1` text,
  `ObjectiveText3_loc2` text,
  `ObjectiveText3_loc3` text,
  `ObjectiveText3_loc4` text,
  `ObjectiveText3_loc5` text,
  `ObjectiveText3_loc6` text,
  `ObjectiveText3_loc7` text,
  `ObjectiveText3_loc8` text,
  `ObjectiveText3_loc9` text,
  `ObjectiveText3_loc10` text,
  `ObjectiveText4_loc1` text,
  `ObjectiveText4_loc2` text,
  `ObjectiveText4_loc3` text,
  `ObjectiveText4_loc4` text,
  `ObjectiveText4_loc5` text,
  `ObjectiveText4_loc6` text,
  `ObjectiveText4_loc7` text,
  `ObjectiveText4_loc8` text,
  `ObjectiveText4_loc9` text,
  `ObjectiveText4_loc10` text,
  `QuestGiverTextWindow_loc1` text,
  `QuestGiverTextWindow_loc2` text,
  `QuestGiverTextWindow_loc3` text,
  `QuestGiverTextWindow_loc4` text,
  `QuestGiverTextWindow_loc5` text,
  `QuestGiverTextWindow_loc6` text,
  `QuestGiverTextWindow_loc7` text,
  `QuestGiverTextWindow_loc8` text,
  `QuestGiverTextWindow_loc9` text,
  `QuestGiverTextWindow_loc10` text,
  `QuestGiverTargetName_loc1` text,
  `QuestGiverTargetName_loc2` text,
  `QuestGiverTargetName_loc3` text,
  `QuestGiverTargetName_loc4` text,
  `QuestGiverTargetName_loc5` text,
  `QuestGiverTargetName_loc6` text,
  `QuestGiverTargetName_loc7` text,
  `QuestGiverTargetName_loc8` text,
  `QuestGiverTargetName_loc9` text,
  `QuestGiverTargetName_loc10` text,
  `QuestTurnTextWindow_loc1` text,
  `QuestTurnTextWindow_loc2` text,
  `QuestTurnTextWindow_loc3` text,
  `QuestTurnTextWindow_loc4` text,
  `QuestTurnTextWindow_loc5` text,
  `QuestTurnTextWindow_loc6` text,
  `QuestTurnTextWindow_loc7` text,
  `QuestTurnTextWindow_loc8` text,
  `QuestTurnTextWindow_loc9` text,
  `QuestTurnTextWindow_loc10` text,
  `QuestTurnTargetName_loc1` text,
  `QuestTurnTargetName_loc2` text,
  `QuestTurnTargetName_loc3` text,
  `QuestTurnTargetName_loc4` text,
  `QuestTurnTargetName_loc5` text,
  `QuestTurnTargetName_loc6` text,
  `QuestTurnTargetName_loc7` text,
  `QuestTurnTargetName_loc8` text,
  `QuestTurnTargetName_loc9` text,
  `QuestTurnTargetName_loc10` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.locales_quest: 0 rows
/*!40000 ALTER TABLE `locales_quest` DISABLE KEYS */;
/*!40000 ALTER TABLE `locales_quest` ENABLE KEYS */;


-- Export de la structure de table world. mail_level_reward
CREATE TABLE IF NOT EXISTS `mail_level_reward` (
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `raceMask` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `mailTemplateId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `senderEntry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`level`,`raceMask`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Mail System';

-- Export de données de la table world.mail_level_reward: 0 rows
/*!40000 ALTER TABLE `mail_level_reward` DISABLE KEYS */;
/*!40000 ALTER TABLE `mail_level_reward` ENABLE KEYS */;


-- Export de la structure de table world. mail_loot_template
CREATE TABLE IF NOT EXISTS `mail_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `lootmode` smallint(5) unsigned NOT NULL DEFAULT '1',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(8) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';

-- Export de données de la table world.mail_loot_template: 0 rows
/*!40000 ALTER TABLE `mail_loot_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `mail_loot_template` ENABLE KEYS */;


-- Export de la structure de table world. milling_loot_template
CREATE TABLE IF NOT EXISTS `milling_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `lootmode` smallint(5) unsigned NOT NULL DEFAULT '1',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(8) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';

-- Export de données de la table world.milling_loot_template: 0 rows
/*!40000 ALTER TABLE `milling_loot_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `milling_loot_template` ENABLE KEYS */;


-- Export de la structure de table world. npc_spellclick_spells
CREATE TABLE IF NOT EXISTS `npc_spellclick_spells` (
  `npc_entry` int(10) unsigned NOT NULL COMMENT 'reference to creature_template',
  `spell_id` int(10) unsigned NOT NULL COMMENT 'spell which should be casted ',
  `cast_flags` tinyint(3) unsigned NOT NULL COMMENT 'first bit defines caster: 1=player, 0=creature; second bit defines target, same mapping as caster bit',
  `user_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'relation with summoner: 0-no 1-friendly 2-raid 3-party player can click',
  PRIMARY KEY (`npc_entry`,`spell_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.npc_spellclick_spells: 0 rows
/*!40000 ALTER TABLE `npc_spellclick_spells` DISABLE KEYS */;
/*!40000 ALTER TABLE `npc_spellclick_spells` ENABLE KEYS */;


-- Export de la structure de table world. npc_text
CREATE TABLE IF NOT EXISTS `npc_text` (
  `ID` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `text0_0` longtext,
  `text0_1` longtext,
  `lang0` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `prob0` float NOT NULL DEFAULT '0',
  `em0_0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em0_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em0_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em0_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em0_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em0_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `text1_0` longtext,
  `text1_1` longtext,
  `lang1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `prob1` float NOT NULL DEFAULT '0',
  `em1_0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em1_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em1_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em1_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em1_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em1_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `text2_0` longtext,
  `text2_1` longtext,
  `lang2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `prob2` float NOT NULL DEFAULT '0',
  `em2_0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em2_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em2_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em2_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em2_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em2_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `text3_0` longtext,
  `text3_1` longtext,
  `lang3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `prob3` float NOT NULL DEFAULT '0',
  `em3_0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em3_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em3_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em3_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em3_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em3_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `text4_0` longtext,
  `text4_1` longtext,
  `lang4` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `prob4` float NOT NULL DEFAULT '0',
  `em4_0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em4_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em4_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em4_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em4_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em4_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `text5_0` longtext,
  `text5_1` longtext,
  `lang5` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `prob5` float NOT NULL DEFAULT '0',
  `em5_0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em5_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em5_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em5_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em5_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em5_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `text6_0` longtext,
  `text6_1` longtext,
  `lang6` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `prob6` float NOT NULL DEFAULT '0',
  `em6_0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em6_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em6_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em6_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em6_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em6_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `text7_0` longtext,
  `text7_1` longtext,
  `lang7` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `prob7` float NOT NULL DEFAULT '0',
  `em7_0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em7_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em7_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em7_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em7_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em7_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `WDBVerified` smallint(5) DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.npc_text: 0 rows
/*!40000 ALTER TABLE `npc_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `npc_text` ENABLE KEYS */;


-- Export de la structure de table world. npc_trainer
CREATE TABLE IF NOT EXISTS `npc_trainer` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spell` mediumint(8) NOT NULL DEFAULT '0',
  `spellcost` int(10) unsigned NOT NULL DEFAULT '0',
  `reqskill` smallint(5) unsigned NOT NULL DEFAULT '0',
  `reqskillvalue` smallint(5) unsigned NOT NULL DEFAULT '0',
  `reqlevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`spell`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.npc_trainer: 0 rows
/*!40000 ALTER TABLE `npc_trainer` DISABLE KEYS */;
/*!40000 ALTER TABLE `npc_trainer` ENABLE KEYS */;


-- Export de la structure de table world. npc_vendor
CREATE TABLE IF NOT EXISTS `npc_vendor` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `slot` smallint(6) NOT NULL DEFAULT '0',
  `item` mediumint(8) NOT NULL DEFAULT '0',
  `maxcount` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `incrtime` int(10) unsigned NOT NULL DEFAULT '0',
  `ExtendedCost` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`item`,`ExtendedCost`,`type`),
  KEY `slot` (`slot`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Npc System';

-- Export de données de la table world.npc_vendor: 0 rows
/*!40000 ALTER TABLE `npc_vendor` DISABLE KEYS */;
/*!40000 ALTER TABLE `npc_vendor` ENABLE KEYS */;


-- Export de la structure de table world. outdoorpvp_template
CREATE TABLE IF NOT EXISTS `outdoorpvp_template` (
  `TypeId` tinyint(3) unsigned NOT NULL,
  `ScriptName` char(64) NOT NULL DEFAULT '',
  `comment` text,
  PRIMARY KEY (`TypeId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='OutdoorPvP Templates';

-- Export de données de la table world.outdoorpvp_template: 0 rows
/*!40000 ALTER TABLE `outdoorpvp_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `outdoorpvp_template` ENABLE KEYS */;


-- Export de la structure de table world. page_text
CREATE TABLE IF NOT EXISTS `page_text` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `text` longtext NOT NULL,
  `next_page` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `WDBVerified` smallint(6) DEFAULT '1',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Item System';

-- Export de données de la table world.page_text: 0 rows
/*!40000 ALTER TABLE `page_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_text` ENABLE KEYS */;


-- Export de la structure de table world. pet_aura
CREATE TABLE IF NOT EXISTS `pet_aura` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `slot` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `caster_guid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Full Global Unique Identifier',
  `spell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `effect_mask` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `recalculate_mask` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stackcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `maxduration` int(11) NOT NULL DEFAULT '0',
  `remaintime` int(11) NOT NULL DEFAULT '0',
  `remaincharges` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spell`,`effect_mask`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Pet System';

-- Export de données de la table world.pet_aura: ~0 rows (environ)
/*!40000 ALTER TABLE `pet_aura` DISABLE KEYS */;
/*!40000 ALTER TABLE `pet_aura` ENABLE KEYS */;


-- Export de la structure de table world. pet_aura_effect
CREATE TABLE IF NOT EXISTS `pet_aura_effect` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `slot` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `effect` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `amount` int(11) NOT NULL DEFAULT '0',
  `baseamount` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`slot`,`effect`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Export de données de la table world.pet_aura_effect: ~0 rows (environ)
/*!40000 ALTER TABLE `pet_aura_effect` DISABLE KEYS */;
/*!40000 ALTER TABLE `pet_aura_effect` ENABLE KEYS */;


-- Export de la structure de table world. pet_levelstats
CREATE TABLE IF NOT EXISTS `pet_levelstats` (
  `creature_entry` mediumint(8) unsigned NOT NULL,
  `level` tinyint(3) unsigned NOT NULL,
  `hp` mediumint(8) unsigned NOT NULL,
  `mana` mediumint(8) unsigned NOT NULL,
  `armor` int(10) unsigned NOT NULL DEFAULT '0',
  `str` smallint(5) unsigned NOT NULL,
  `agi` smallint(5) unsigned NOT NULL,
  `sta` smallint(5) unsigned NOT NULL,
  `inte` smallint(5) unsigned NOT NULL,
  `spi` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`creature_entry`,`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0 COMMENT='Stores pet levels stats.';

-- Export de données de la table world.pet_levelstats: 0 rows
/*!40000 ALTER TABLE `pet_levelstats` DISABLE KEYS */;
/*!40000 ALTER TABLE `pet_levelstats` ENABLE KEYS */;


-- Export de la structure de table world. pet_name_generation
CREATE TABLE IF NOT EXISTS `pet_name_generation` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `word` tinytext NOT NULL,
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `half` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.pet_name_generation: 0 rows
/*!40000 ALTER TABLE `pet_name_generation` DISABLE KEYS */;
/*!40000 ALTER TABLE `pet_name_generation` ENABLE KEYS */;


-- Export de la structure de table world. phase_definitions
CREATE TABLE IF NOT EXISTS `phase_definitions` (
  `zoneId` mediumint(7) unsigned NOT NULL DEFAULT '0',
  `entry` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `phasemask` bigint(20) unsigned NOT NULL DEFAULT '0',
  `phaseId` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `terrainswapmap` smallint(5) unsigned NOT NULL DEFAULT '0',
  `flags` tinyint(3) unsigned DEFAULT '0',
  `comment` text,
  PRIMARY KEY (`zoneId`,`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.phase_definitions: 0 rows
/*!40000 ALTER TABLE `phase_definitions` DISABLE KEYS */;
/*!40000 ALTER TABLE `phase_definitions` ENABLE KEYS */;


-- Export de la structure de table world. pickpocketing_loot_template
CREATE TABLE IF NOT EXISTS `pickpocketing_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `lootmode` smallint(5) unsigned NOT NULL DEFAULT '1',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(8) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';

-- Export de données de la table world.pickpocketing_loot_template: 0 rows
/*!40000 ALTER TABLE `pickpocketing_loot_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `pickpocketing_loot_template` ENABLE KEYS */;


-- Export de la structure de table world. playercreateinfo
CREATE TABLE IF NOT EXISTS `playercreateinfo` (
  `race` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `map` smallint(5) unsigned NOT NULL DEFAULT '0',
  `zone` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`race`,`class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.playercreateinfo: 0 rows
/*!40000 ALTER TABLE `playercreateinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `playercreateinfo` ENABLE KEYS */;


-- Export de la structure de table world. playercreateinfo_action
CREATE TABLE IF NOT EXISTS `playercreateinfo_action` (
  `race` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `button` smallint(5) unsigned NOT NULL DEFAULT '0',
  `action` int(10) unsigned NOT NULL DEFAULT '0',
  `type` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`race`,`class`,`button`),
  KEY `playercreateinfo_race_class_index` (`race`,`class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.playercreateinfo_action: 0 rows
/*!40000 ALTER TABLE `playercreateinfo_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `playercreateinfo_action` ENABLE KEYS */;


-- Export de la structure de table world. playercreateinfo_item
CREATE TABLE IF NOT EXISTS `playercreateinfo_item` (
  `race` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `itemid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `amount` tinyint(4) NOT NULL DEFAULT '1',
  KEY `playercreateinfo_race_class_index` (`race`,`class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.playercreateinfo_item: 0 rows
/*!40000 ALTER TABLE `playercreateinfo_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `playercreateinfo_item` ENABLE KEYS */;


-- Export de la structure de table world. playercreateinfo_spell
CREATE TABLE IF NOT EXISTS `playercreateinfo_spell` (
  `race` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Spell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`race`,`class`,`Spell`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.playercreateinfo_spell: 0 rows
/*!40000 ALTER TABLE `playercreateinfo_spell` DISABLE KEYS */;
/*!40000 ALTER TABLE `playercreateinfo_spell` ENABLE KEYS */;


-- Export de la structure de table world. playercreateinfo_spell_custom
CREATE TABLE IF NOT EXISTS `playercreateinfo_spell_custom` (
  `race` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Spell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`race`,`class`,`Spell`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.playercreateinfo_spell_custom: 0 rows
/*!40000 ALTER TABLE `playercreateinfo_spell_custom` DISABLE KEYS */;
/*!40000 ALTER TABLE `playercreateinfo_spell_custom` ENABLE KEYS */;


-- Export de la structure de table world. players_reports_status
CREATE TABLE IF NOT EXISTS `players_reports_status` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `creation_time` int(10) unsigned NOT NULL DEFAULT '0',
  `average` float NOT NULL DEFAULT '0',
  `total_reports` bigint(20) unsigned NOT NULL DEFAULT '0',
  `speed_reports` bigint(20) unsigned NOT NULL DEFAULT '0',
  `fly_reports` bigint(20) unsigned NOT NULL DEFAULT '0',
  `jump_reports` bigint(20) unsigned NOT NULL DEFAULT '0',
  `waterwalk_reports` bigint(20) unsigned NOT NULL DEFAULT '0',
  `teleportplane_reports` bigint(20) unsigned NOT NULL DEFAULT '0',
  `climb_reports` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Export de données de la table world.players_reports_status: ~0 rows (environ)
/*!40000 ALTER TABLE `players_reports_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `players_reports_status` ENABLE KEYS */;


-- Export de la structure de table world. player_factionchange_achievement
CREATE TABLE IF NOT EXISTS `player_factionchange_achievement` (
  `alliance_id` int(10) unsigned NOT NULL,
  `horde_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.player_factionchange_achievement: 0 rows
/*!40000 ALTER TABLE `player_factionchange_achievement` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_factionchange_achievement` ENABLE KEYS */;


-- Export de la structure de table world. player_factionchange_items
CREATE TABLE IF NOT EXISTS `player_factionchange_items` (
  `race_A` int(10) unsigned NOT NULL,
  `alliance_id` int(10) unsigned NOT NULL,
  `commentA` text,
  `race_H` int(10) unsigned NOT NULL,
  `horde_id` int(10) unsigned NOT NULL,
  `commentH` text,
  PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.player_factionchange_items: 0 rows
/*!40000 ALTER TABLE `player_factionchange_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_factionchange_items` ENABLE KEYS */;


-- Export de la structure de table world. player_factionchange_reputations
CREATE TABLE IF NOT EXISTS `player_factionchange_reputations` (
  `alliance_id` int(10) unsigned NOT NULL,
  `horde_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.player_factionchange_reputations: 0 rows
/*!40000 ALTER TABLE `player_factionchange_reputations` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_factionchange_reputations` ENABLE KEYS */;


-- Export de la structure de table world. player_factionchange_spells
CREATE TABLE IF NOT EXISTS `player_factionchange_spells` (
  `alliance_id` int(10) unsigned NOT NULL,
  `horde_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.player_factionchange_spells: 0 rows
/*!40000 ALTER TABLE `player_factionchange_spells` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_factionchange_spells` ENABLE KEYS */;


-- Export de la structure de table world. player_factionchange_titles
CREATE TABLE IF NOT EXISTS `player_factionchange_titles` (
  `alliance_id` int(8) NOT NULL,
  `horde_id` int(8) NOT NULL,
  PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.player_factionchange_titles: 0 rows
/*!40000 ALTER TABLE `player_factionchange_titles` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_factionchange_titles` ENABLE KEYS */;


-- Export de la structure de table world. player_levelstats
CREATE TABLE IF NOT EXISTS `player_levelstats` (
  `race` tinyint(3) unsigned NOT NULL,
  `class` tinyint(3) unsigned NOT NULL,
  `level` tinyint(3) unsigned NOT NULL,
  `str` tinyint(3) unsigned NOT NULL,
  `agi` tinyint(3) unsigned NOT NULL,
  `sta` tinyint(3) unsigned NOT NULL,
  `inte` tinyint(3) unsigned NOT NULL,
  `spi` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`race`,`class`,`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0 COMMENT='Stores levels stats.';

-- Export de données de la table world.player_levelstats: 0 rows
/*!40000 ALTER TABLE `player_levelstats` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_levelstats` ENABLE KEYS */;


-- Export de la structure de table world. player_xp_for_level
CREATE TABLE IF NOT EXISTS `player_xp_for_level` (
  `lvl` tinyint(3) unsigned NOT NULL,
  `xp_for_next_level` int(10) unsigned NOT NULL,
  PRIMARY KEY (`lvl`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.player_xp_for_level: 0 rows
/*!40000 ALTER TABLE `player_xp_for_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_xp_for_level` ENABLE KEYS */;


-- Export de la structure de table world. points_of_interest
CREATE TABLE IF NOT EXISTS `points_of_interest` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `icon` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `flags` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `data` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `icon_name` text NOT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.points_of_interest: 0 rows
/*!40000 ALTER TABLE `points_of_interest` DISABLE KEYS */;
/*!40000 ALTER TABLE `points_of_interest` ENABLE KEYS */;


-- Export de la structure de table world. pool_creature
CREATE TABLE IF NOT EXISTS `pool_creature` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `pool_entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `chance` float unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`guid`),
  KEY `idx_guid` (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.pool_creature: 0 rows
/*!40000 ALTER TABLE `pool_creature` DISABLE KEYS */;
/*!40000 ALTER TABLE `pool_creature` ENABLE KEYS */;


-- Export de la structure de table world. pool_gameobject
CREATE TABLE IF NOT EXISTS `pool_gameobject` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `pool_entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `chance` float unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`guid`),
  KEY `idx_guid` (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.pool_gameobject: 0 rows
/*!40000 ALTER TABLE `pool_gameobject` DISABLE KEYS */;
/*!40000 ALTER TABLE `pool_gameobject` ENABLE KEYS */;


-- Export de la structure de table world. pool_pool
CREATE TABLE IF NOT EXISTS `pool_pool` (
  `pool_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `mother_pool` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `chance` float NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pool_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.pool_pool: 0 rows
/*!40000 ALTER TABLE `pool_pool` DISABLE KEYS */;
/*!40000 ALTER TABLE `pool_pool` ENABLE KEYS */;


-- Export de la structure de table world. pool_quest
CREATE TABLE IF NOT EXISTS `pool_quest` (
  `entry` int(10) unsigned NOT NULL DEFAULT '0',
  `pool_entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entry`),
  KEY `idx_guid` (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.pool_quest: 0 rows
/*!40000 ALTER TABLE `pool_quest` DISABLE KEYS */;
/*!40000 ALTER TABLE `pool_quest` ENABLE KEYS */;


-- Export de la structure de table world. pool_template
CREATE TABLE IF NOT EXISTS `pool_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Pool entry',
  `max_limit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Max number of objects (0) is no limit',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.pool_template: 0 rows
/*!40000 ALTER TABLE `pool_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `pool_template` ENABLE KEYS */;


-- Export de la structure de table world. prospecting_loot_template
CREATE TABLE IF NOT EXISTS `prospecting_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `lootmode` smallint(5) unsigned NOT NULL DEFAULT '1',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(8) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';

-- Export de données de la table world.prospecting_loot_template: 0 rows
/*!40000 ALTER TABLE `prospecting_loot_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `prospecting_loot_template` ENABLE KEYS */;


-- Export de la structure de table world. quest_end_scripts
CREATE TABLE IF NOT EXISTS `quest_end_scripts` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `delay` int(10) unsigned NOT NULL DEFAULT '0',
  `command` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong2` int(10) unsigned NOT NULL DEFAULT '0',
  `dataint` int(11) NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.quest_end_scripts: 0 rows
/*!40000 ALTER TABLE `quest_end_scripts` DISABLE KEYS */;
/*!40000 ALTER TABLE `quest_end_scripts` ENABLE KEYS */;


-- Export de la structure de table world. quest_poi
CREATE TABLE IF NOT EXISTS `quest_poi` (
  `questId` int(10) unsigned NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `objIndex` int(11) NOT NULL DEFAULT '0',
  `mapid` int(10) unsigned NOT NULL DEFAULT '0',
  `WorldMapAreaId` int(10) unsigned NOT NULL DEFAULT '0',
  `unk2` int(10) unsigned NOT NULL DEFAULT '0',
  `unk3` int(10) unsigned NOT NULL DEFAULT '0',
  `unk4` int(10) unsigned NOT NULL DEFAULT '0',
  `FloorId` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`questId`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.quest_poi: 0 rows
/*!40000 ALTER TABLE `quest_poi` DISABLE KEYS */;
/*!40000 ALTER TABLE `quest_poi` ENABLE KEYS */;


-- Export de la structure de table world. quest_poi_points
CREATE TABLE IF NOT EXISTS `quest_poi_points` (
  `questId` int(10) unsigned NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `idx` int(10) unsigned NOT NULL DEFAULT '0',
  `x` int(11) NOT NULL DEFAULT '0',
  `y` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`questId`,`id`,`idx`),
  KEY `questId_id` (`questId`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.quest_poi_points: 0 rows
/*!40000 ALTER TABLE `quest_poi_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `quest_poi_points` ENABLE KEYS */;


-- Export de la structure de table world. quest_start_scripts
CREATE TABLE IF NOT EXISTS `quest_start_scripts` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `delay` int(10) unsigned NOT NULL DEFAULT '0',
  `command` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong2` int(10) unsigned NOT NULL DEFAULT '0',
  `dataint` int(11) NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.quest_start_scripts: 0 rows
/*!40000 ALTER TABLE `quest_start_scripts` DISABLE KEYS */;
/*!40000 ALTER TABLE `quest_start_scripts` ENABLE KEYS */;


-- Export de la structure de table world. quest_template
CREATE TABLE IF NOT EXISTS `quest_template` (
  `Id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Method` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `Level` smallint(3) NOT NULL DEFAULT '1',
  `MinLevel` smallint(6) NOT NULL DEFAULT '0',
  `MaxLevel` smallint(6) NOT NULL DEFAULT '0',
  `ZoneOrSort` smallint(6) NOT NULL DEFAULT '0',
  `Type` smallint(5) unsigned NOT NULL DEFAULT '0',
  `SuggestedPlayers` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `LimitTime` int(10) unsigned NOT NULL DEFAULT '0',
  `RequiredTeam` tinyint(1) NOT NULL DEFAULT '-1',
  `RequiredClasses` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredRaces` int(10) unsigned NOT NULL DEFAULT '0',
  `RequiredSkillId` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredSkillPoints` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredFactionId1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredFactionId2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredFactionValue1` mediumint(8) NOT NULL DEFAULT '0',
  `RequiredFactionValue2` mediumint(8) NOT NULL DEFAULT '0',
  `RequiredFactionKills` mediumint(8) NOT NULL DEFAULT '0',
  `RequiredFactionKillsCount` smallint(5) NOT NULL DEFAULT '0',
  `RequiredPetBattleWith` mediumint(8) NOT NULL DEFAULT '0',
  `RequiredMinRepFaction` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredMaxRepFaction` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredMinRepValue` mediumint(8) NOT NULL DEFAULT '0',
  `RequiredMaxRepValue` mediumint(8) NOT NULL DEFAULT '0',
  `PrevQuestId` mediumint(8) NOT NULL DEFAULT '0',
  `NextQuestId` mediumint(8) NOT NULL DEFAULT '0',
  `ExclusiveGroup` mediumint(8) NOT NULL DEFAULT '0',
  `NextQuestIdChain` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewardXPId` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RewardOrRequiredMoney` int(11) NOT NULL DEFAULT '0',
  `RewardMoneyMaxLevel` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardSpell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewardSpellCast` int(11) NOT NULL DEFAULT '0',
  `RewardHonor` int(11) NOT NULL DEFAULT '0',
  `RewardHonorMultiplier` float NOT NULL DEFAULT '1',
  `RewardMailTemplateId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewardMailDelay` int(11) unsigned NOT NULL DEFAULT '0',
  `SourceItemId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `SourceItemCount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `SourceSpellId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Flags` int(10) unsigned NOT NULL DEFAULT '0',
  `SpecialFlags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MinimapTargetMark` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RewardTitleId` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RequiredPlayerKills` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RewardTalents` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RewardArenaPoints` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewardSkillId` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewardSkillPoints` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RewardReputationMask` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `QuestGiverPortrait` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `QuestTurnInPortrait` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewardItemId1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewardItemId2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewardItemId3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewardItemId4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewardItemCount1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewardItemCount2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewardItemCount3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewardItemCount4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemId1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemId2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemId3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemId4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemId5` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemId6` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemCount1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemCount2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemCount3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemCount4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemCount5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemCount6` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewardFactionId1` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewardFactionId2` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewardFactionId3` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewardFactionId4` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewardFactionId5` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewardFactionValueId1` mediumint(8) NOT NULL DEFAULT '0',
  `RewardFactionValueId2` mediumint(8) NOT NULL DEFAULT '0',
  `RewardFactionValueId3` mediumint(8) NOT NULL DEFAULT '0',
  `RewardFactionValueId4` mediumint(8) NOT NULL DEFAULT '0',
  `RewardFactionValueId5` mediumint(8) NOT NULL DEFAULT '0',
  `RewardFactionValueIdOverride1` int(11) NOT NULL DEFAULT '0',
  `RewardFactionValueIdOverride2` int(11) NOT NULL DEFAULT '0',
  `RewardFactionValueIdOverride3` int(11) NOT NULL DEFAULT '0',
  `RewardFactionValueIdOverride4` int(11) NOT NULL DEFAULT '0',
  `RewardFactionValueIdOverride5` int(11) NOT NULL DEFAULT '0',
  `PointMapId` smallint(5) unsigned NOT NULL DEFAULT '0',
  `PointX` float NOT NULL DEFAULT '0',
  `PointY` float NOT NULL DEFAULT '0',
  `PointOption` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Title` text,
  `Objectives` text,
  `Details` text,
  `EndText` text,
  `OfferRewardText` text,
  `RequestItemsText` text,
  `CompletedText` text,
  `RequiredNpcOrGo1` mediumint(8) NOT NULL DEFAULT '0',
  `RequiredNpcOrGo2` mediumint(8) NOT NULL DEFAULT '0',
  `RequiredNpcOrGo3` mediumint(8) NOT NULL DEFAULT '0',
  `RequiredNpcOrGo4` mediumint(8) NOT NULL DEFAULT '0',
  `RequiredNpcOrGo5` mediumint(8) NOT NULL DEFAULT '0',
  `RequiredNpcOrGoCount1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredNpcOrGoCount2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredNpcOrGoCount3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredNpcOrGoCount4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredNpcOrGoCount5` smallint(5) NOT NULL DEFAULT '0',
  `RequiredSourceItemId1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredSourceItemId2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredSourceItemId3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredSourceItemId4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredSourceItemCount1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredSourceItemCount2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredSourceItemCount3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredSourceItemCount4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredItemId1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredItemId2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredItemId3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredItemId4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredItemId5` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredItemId6` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredItemCount1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredItemCount2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredItemCount3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredItemCount4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredItemCount5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredItemCount6` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredSpell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredSpellCast1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredSpellCast2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredSpellCast3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredSpellCast4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ObjectiveText1` text,
  `ObjectiveText2` text,
  `ObjectiveText3` text,
  `ObjectiveText4` text,
  `ObjectiveText5` text,
  `RewardCurrencyId1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewardCurrencyId2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewardCurrencyId3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewardCurrencyId4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewardCurrencyCount1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RewardCurrencyCount2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RewardCurrencyCount3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RewardCurrencyCount4` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RequiredCurrencyId1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredCurrencyId2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredCurrencyId3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredCurrencyId4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredCurrencyCount1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RequiredCurrencyCount2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RequiredCurrencyCount3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RequiredCurrencyCount4` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `QuestGiverTextWindow` text,
  `QuestGiverTargetName` text,
  `QuestTurnTextWindow` text,
  `QuestTurnTargetName` text,
  `SoundAccept` smallint(5) unsigned NOT NULL DEFAULT '890',
  `SoundTurnIn` smallint(5) unsigned NOT NULL DEFAULT '878',
  `DetailsEmote1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `DetailsEmote2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `DetailsEmote3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `DetailsEmote4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `DetailsEmoteDelay1` int(10) unsigned NOT NULL DEFAULT '0',
  `DetailsEmoteDelay2` int(10) unsigned NOT NULL DEFAULT '0',
  `DetailsEmoteDelay3` int(10) unsigned NOT NULL DEFAULT '0',
  `DetailsEmoteDelay4` int(10) unsigned NOT NULL DEFAULT '0',
  `EmoteOnIncomplete` smallint(5) unsigned NOT NULL DEFAULT '0',
  `EmoteOnComplete` smallint(5) unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmote1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmote2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmote3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmote4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmoteDelay1` int(10) unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmoteDelay2` int(10) unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmoteDelay3` int(10) unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmoteDelay4` int(10) unsigned NOT NULL DEFAULT '0',
  `StartScript` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `CompleteScript` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `WDBVerified` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Quest System';

-- Export de données de la table world.quest_template: 0 rows
/*!40000 ALTER TABLE `quest_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `quest_template` ENABLE KEYS */;


-- Export de la structure de table world. quest_template_copy
CREATE TABLE IF NOT EXISTS `quest_template_copy` (
  `Id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Method` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `Level` smallint(3) NOT NULL DEFAULT '1',
  `MinLevel` smallint(6) NOT NULL DEFAULT '0',
  `MaxLevel` smallint(6) NOT NULL DEFAULT '0',
  `ZoneOrSort` smallint(6) NOT NULL DEFAULT '0',
  `Type` smallint(5) unsigned NOT NULL DEFAULT '0',
  `SuggestedPlayers` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `LimitTime` int(10) unsigned NOT NULL DEFAULT '0',
  `RequiredClasses` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredRaces` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredSkillId` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredSkillPoints` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredFactionId1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredFactionId2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredFactionValue1` mediumint(8) NOT NULL DEFAULT '0',
  `RequiredFactionValue2` mediumint(8) NOT NULL DEFAULT '0',
  `RequiredMinRepFaction` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredMaxRepFaction` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredMinRepValue` mediumint(8) NOT NULL DEFAULT '0',
  `RequiredMaxRepValue` mediumint(8) NOT NULL DEFAULT '0',
  `PrevQuestId` mediumint(8) NOT NULL DEFAULT '0',
  `NextQuestId` mediumint(8) NOT NULL DEFAULT '0',
  `ExclusiveGroup` mediumint(8) NOT NULL DEFAULT '0',
  `NextQuestIdChain` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewardXPId` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RewardOrRequiredMoney` int(11) NOT NULL DEFAULT '0',
  `RewardMoneyMaxLevel` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardSpell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewardSpellCast` int(11) NOT NULL DEFAULT '0',
  `RewardHonor` int(11) NOT NULL DEFAULT '0',
  `RewardHonorMultiplier` float NOT NULL DEFAULT '1',
  `RewardMailTemplateId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewardMailDelay` int(11) unsigned NOT NULL DEFAULT '0',
  `SourceItemId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `SourceItemCount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `SourceSpellId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Flags` int(10) unsigned NOT NULL DEFAULT '0',
  `SpecialFlags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MinimapTargetMark` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RewardTitleId` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RequiredPlayerKills` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RewardTalents` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RewardArenaPoints` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewardSkillId` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewardSkillPoints` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RewardReputationMask` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `QuestGiverPortrait` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `QuestTurnInPortrait` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewardItemId1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewardItemId2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewardItemId3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewardItemId4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewardItemCount1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewardItemCount2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewardItemCount3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewardItemCount4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemId1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemId2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemId3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemId4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemId5` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemId6` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemCount1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemCount2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemCount3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemCount4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemCount5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemCount6` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewardFactionId1` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewardFactionId2` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewardFactionId3` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewardFactionId4` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewardFactionId5` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewardFactionValueId1` mediumint(8) NOT NULL DEFAULT '0',
  `RewardFactionValueId2` mediumint(8) NOT NULL DEFAULT '0',
  `RewardFactionValueId3` mediumint(8) NOT NULL DEFAULT '0',
  `RewardFactionValueId4` mediumint(8) NOT NULL DEFAULT '0',
  `RewardFactionValueId5` mediumint(8) NOT NULL DEFAULT '0',
  `RewardFactionValueIdOverride1` int(11) NOT NULL DEFAULT '0',
  `RewardFactionValueIdOverride2` int(11) NOT NULL DEFAULT '0',
  `RewardFactionValueIdOverride3` int(11) NOT NULL DEFAULT '0',
  `RewardFactionValueIdOverride4` int(11) NOT NULL DEFAULT '0',
  `RewardFactionValueIdOverride5` int(11) NOT NULL DEFAULT '0',
  `PointMapId` smallint(5) unsigned NOT NULL DEFAULT '0',
  `PointX` float NOT NULL DEFAULT '0',
  `PointY` float NOT NULL DEFAULT '0',
  `PointOption` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Title` text,
  `Objectives` text,
  `Details` text,
  `EndText` text,
  `OfferRewardText` text,
  `RequestItemsText` text,
  `CompletedText` text,
  `RequiredNpcOrGo1` mediumint(8) NOT NULL DEFAULT '0',
  `RequiredNpcOrGo2` mediumint(8) NOT NULL DEFAULT '0',
  `RequiredNpcOrGo3` mediumint(8) NOT NULL DEFAULT '0',
  `RequiredNpcOrGo4` mediumint(8) NOT NULL DEFAULT '0',
  `RequiredNpcOrGoCount1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredNpcOrGoCount2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredNpcOrGoCount3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredNpcOrGoCount4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredSourceItemId1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredSourceItemId2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredSourceItemId3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredSourceItemId4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredSourceItemCount1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredSourceItemCount2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredSourceItemCount3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredSourceItemCount4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredItemId1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredItemId2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredItemId3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredItemId4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredItemId5` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredItemId6` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredItemCount1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredItemCount2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredItemCount3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredItemCount4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredItemCount5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredItemCount6` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredSpell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredSpellCast1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredSpellCast2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredSpellCast3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredSpellCast4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ObjectiveText1` text,
  `ObjectiveText2` text,
  `ObjectiveText3` text,
  `ObjectiveText4` text,
  `RewardCurrencyId1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewardCurrencyId2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewardCurrencyId3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewardCurrencyId4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewardCurrencyCount1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RewardCurrencyCount2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RewardCurrencyCount3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RewardCurrencyCount4` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RequiredCurrencyId1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredCurrencyId2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredCurrencyId3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredCurrencyId4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredCurrencyCount1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RequiredCurrencyCount2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RequiredCurrencyCount3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RequiredCurrencyCount4` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `QuestGiverTextWindow` text,
  `QuestGiverTargetName` text,
  `QuestTurnTextWindow` text,
  `QuestTurnTargetName` text,
  `SoundAccept` smallint(5) unsigned NOT NULL DEFAULT '890',
  `SoundTurnIn` smallint(5) unsigned NOT NULL DEFAULT '878',
  `DetailsEmote1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `DetailsEmote2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `DetailsEmote3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `DetailsEmote4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `DetailsEmoteDelay1` int(10) unsigned NOT NULL DEFAULT '0',
  `DetailsEmoteDelay2` int(10) unsigned NOT NULL DEFAULT '0',
  `DetailsEmoteDelay3` int(10) unsigned NOT NULL DEFAULT '0',
  `DetailsEmoteDelay4` int(10) unsigned NOT NULL DEFAULT '0',
  `EmoteOnIncomplete` smallint(5) unsigned NOT NULL DEFAULT '0',
  `EmoteOnComplete` smallint(5) unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmote1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmote2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmote3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmote4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmoteDelay1` int(10) unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmoteDelay2` int(10) unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmoteDelay3` int(10) unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmoteDelay4` int(10) unsigned NOT NULL DEFAULT '0',
  `StartScript` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `CompleteScript` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `WDBVerified` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.quest_template_copy: 0 rows
/*!40000 ALTER TABLE `quest_template_copy` DISABLE KEYS */;
/*!40000 ALTER TABLE `quest_template_copy` ENABLE KEYS */;


-- Export de la structure de table world. reference_loot_template
CREATE TABLE IF NOT EXISTS `reference_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `lootmode` smallint(5) unsigned NOT NULL DEFAULT '1',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(8) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';

-- Export de données de la table world.reference_loot_template: 0 rows
/*!40000 ALTER TABLE `reference_loot_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `reference_loot_template` ENABLE KEYS */;


-- Export de la structure de table world. reputation_reward_rate
CREATE TABLE IF NOT EXISTS `reputation_reward_rate` (
  `faction` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest_rate` float NOT NULL DEFAULT '1',
  `creature_rate` float NOT NULL DEFAULT '1',
  `spell_rate` float NOT NULL DEFAULT '1',
  PRIMARY KEY (`faction`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.reputation_reward_rate: 0 rows
/*!40000 ALTER TABLE `reputation_reward_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `reputation_reward_rate` ENABLE KEYS */;


-- Export de la structure de table world. reputation_spillover_template
CREATE TABLE IF NOT EXISTS `reputation_spillover_template` (
  `faction` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'faction entry',
  `faction1` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'faction to give spillover for',
  `rate_1` float NOT NULL DEFAULT '0' COMMENT 'the given rep points * rate',
  `rank_1` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'max rank,above this will not give any spillover',
  `faction2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `rate_2` float NOT NULL DEFAULT '0',
  `rank_2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `faction3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `rate_3` float NOT NULL DEFAULT '0',
  `rank_3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `faction4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `rate_4` float NOT NULL DEFAULT '0',
  `rank_4` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `faction5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `rate_5` float NOT NULL DEFAULT '0',
  `rank_5` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`faction`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Reputation spillover reputation gain';

-- Export de données de la table world.reputation_spillover_template: 0 rows
/*!40000 ALTER TABLE `reputation_spillover_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `reputation_spillover_template` ENABLE KEYS */;


-- Export de la structure de table world. script_texts
CREATE TABLE IF NOT EXISTS `script_texts` (
  `npc_entry` mediumint(8) NOT NULL DEFAULT '0' COMMENT 'creature_template entry',
  `entry` mediumint(8) NOT NULL,
  `content_default` text NOT NULL,
  `content_loc1` text,
  `content_loc2` text,
  `content_loc3` text,
  `content_loc4` text,
  `content_loc5` text,
  `content_loc6` text,
  `content_loc7` text,
  `content_loc8` text,
  `content_loc9` text,
  `content_loc10` text,
  `sound` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `language` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `emote` smallint(5) unsigned NOT NULL DEFAULT '0',
  `comment` text,
  PRIMARY KEY (`npc_entry`,`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Script Texts';

-- Export de données de la table world.script_texts: 0 rows
/*!40000 ALTER TABLE `script_texts` DISABLE KEYS */;
/*!40000 ALTER TABLE `script_texts` ENABLE KEYS */;


-- Export de la structure de table world. script_waypoint
CREATE TABLE IF NOT EXISTS `script_waypoint` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'creature_template entry',
  `pointid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `location_x` float NOT NULL DEFAULT '0',
  `location_y` float NOT NULL DEFAULT '0',
  `location_z` float NOT NULL DEFAULT '0',
  `waittime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'waittime in millisecs',
  `point_comment` text,
  PRIMARY KEY (`entry`,`pointid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Script Creature waypoints';

-- Export de données de la table world.script_waypoint: 0 rows
/*!40000 ALTER TABLE `script_waypoint` DISABLE KEYS */;
/*!40000 ALTER TABLE `script_waypoint` ENABLE KEYS */;


-- Export de la structure de table world. shop_item
CREATE TABLE IF NOT EXISTS `shop_item` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `category_id` mediumint(8) DEFAULT NULL,
  `item_id` mediumint(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Export de données de la table world.shop_item: ~0 rows (environ)
/*!40000 ALTER TABLE `shop_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_item` ENABLE KEYS */;


-- Export de la structure de table world. skill_discovery_template
CREATE TABLE IF NOT EXISTS `skill_discovery_template` (
  `spellId` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'SpellId of the discoverable spell',
  `reqSpell` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'spell requirement',
  `reqSkillValue` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'skill points requirement',
  `chance` float NOT NULL DEFAULT '0' COMMENT 'chance to discover',
  PRIMARY KEY (`spellId`,`reqSpell`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Skill Discovery System';

-- Export de données de la table world.skill_discovery_template: 0 rows
/*!40000 ALTER TABLE `skill_discovery_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `skill_discovery_template` ENABLE KEYS */;


-- Export de la structure de table world. skill_extra_item_template
CREATE TABLE IF NOT EXISTS `skill_extra_item_template` (
  `spellId` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'SpellId of the item creation spell',
  `requiredSpecialization` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Specialization spell id',
  `additionalCreateChance` float NOT NULL DEFAULT '0' COMMENT 'chance to create add',
  `additionalMaxNum` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'max num of adds',
  PRIMARY KEY (`spellId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Skill Specialization System';

-- Export de données de la table world.skill_extra_item_template: 0 rows
/*!40000 ALTER TABLE `skill_extra_item_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `skill_extra_item_template` ENABLE KEYS */;


-- Export de la structure de table world. skill_fishing_base_level
CREATE TABLE IF NOT EXISTS `skill_fishing_base_level` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Area identifier',
  `skill` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Base skill level requirement',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Fishing system';

-- Export de données de la table world.skill_fishing_base_level: 0 rows
/*!40000 ALTER TABLE `skill_fishing_base_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `skill_fishing_base_level` ENABLE KEYS */;


-- Export de la structure de table world. skinning_loot_template
CREATE TABLE IF NOT EXISTS `skinning_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `lootmode` smallint(5) unsigned NOT NULL DEFAULT '1',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(8) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';

-- Export de données de la table world.skinning_loot_template: 0 rows
/*!40000 ALTER TABLE `skinning_loot_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `skinning_loot_template` ENABLE KEYS */;


-- Export de la structure de table world. smart_scripts
CREATE TABLE IF NOT EXISTS `smart_scripts` (
  `entryorguid` int(11) NOT NULL,
  `source_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `link` smallint(5) unsigned NOT NULL DEFAULT '0',
  `event_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `event_phase_mask` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `event_chance` tinyint(3) unsigned NOT NULL DEFAULT '100',
  `event_flags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `event_param1` int(10) unsigned NOT NULL DEFAULT '0',
  `event_param2` int(10) unsigned NOT NULL DEFAULT '0',
  `event_param3` int(10) unsigned NOT NULL DEFAULT '0',
  `event_param4` int(10) unsigned NOT NULL DEFAULT '0',
  `action_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `action_param1` int(10) unsigned NOT NULL DEFAULT '0',
  `action_param2` int(10) unsigned NOT NULL DEFAULT '0',
  `action_param3` int(10) unsigned NOT NULL DEFAULT '0',
  `action_param4` int(10) unsigned NOT NULL DEFAULT '0',
  `action_param5` int(10) unsigned NOT NULL DEFAULT '0',
  `action_param6` int(10) unsigned NOT NULL DEFAULT '0',
  `target_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `target_param1` int(10) unsigned NOT NULL DEFAULT '0',
  `target_param2` int(10) unsigned NOT NULL DEFAULT '0',
  `target_param3` int(10) unsigned NOT NULL DEFAULT '0',
  `target_x` float NOT NULL DEFAULT '0',
  `target_y` float NOT NULL DEFAULT '0',
  `target_z` float NOT NULL DEFAULT '0',
  `target_o` float NOT NULL DEFAULT '0',
  `comment` text NOT NULL COMMENT 'Event Comment',
  PRIMARY KEY (`entryorguid`,`source_type`,`id`,`link`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- Export de données de la table world.smart_scripts: 0 rows
/*!40000 ALTER TABLE `smart_scripts` DISABLE KEYS */;
/*!40000 ALTER TABLE `smart_scripts` ENABLE KEYS */;


-- Export de la structure de table world. spelldifficulty_dbc
CREATE TABLE IF NOT EXISTS `spelldifficulty_dbc` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `spellid0` int(11) unsigned NOT NULL DEFAULT '0',
  `spellid1` int(11) unsigned NOT NULL DEFAULT '0',
  `spellid2` int(11) unsigned NOT NULL DEFAULT '0',
  `spellid3` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.spelldifficulty_dbc: 0 rows
/*!40000 ALTER TABLE `spelldifficulty_dbc` DISABLE KEYS */;
/*!40000 ALTER TABLE `spelldifficulty_dbc` ENABLE KEYS */;


-- Export de la structure de table world. spell_area
CREATE TABLE IF NOT EXISTS `spell_area` (
  `spell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `area` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest_start` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest_end` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `aura_spell` mediumint(8) NOT NULL DEFAULT '0',
  `racemask` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `gender` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `autocast` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `quest_start_status` int(11) unsigned NOT NULL DEFAULT '64',
  `quest_end_status` int(11) unsigned NOT NULL DEFAULT '11',
  PRIMARY KEY (`spell`,`area`,`quest_start`,`aura_spell`,`racemask`,`gender`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.spell_area: 0 rows
/*!40000 ALTER TABLE `spell_area` DISABLE KEYS */;
/*!40000 ALTER TABLE `spell_area` ENABLE KEYS */;


-- Export de la structure de table world. spell_bonus_data
CREATE TABLE IF NOT EXISTS `spell_bonus_data` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `direct_bonus` float NOT NULL DEFAULT '0',
  `dot_bonus` float NOT NULL DEFAULT '0',
  `ap_bonus` float NOT NULL DEFAULT '0',
  `ap_dot_bonus` float NOT NULL DEFAULT '0',
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.spell_bonus_data: 0 rows
/*!40000 ALTER TABLE `spell_bonus_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `spell_bonus_data` ENABLE KEYS */;


-- Export de la structure de table world. spell_dbc
CREATE TABLE IF NOT EXISTS `spell_dbc` (
  `Id` int(10) unsigned NOT NULL,
  `Dispel` int(10) unsigned NOT NULL DEFAULT '0',
  `Mechanic` int(10) unsigned NOT NULL DEFAULT '0',
  `Attributes` int(10) unsigned NOT NULL DEFAULT '0',
  `AttributesEx` int(10) unsigned NOT NULL DEFAULT '0',
  `AttributesEx2` int(10) unsigned NOT NULL DEFAULT '0',
  `AttributesEx3` int(10) unsigned NOT NULL DEFAULT '0',
  `AttributesEx4` int(10) unsigned NOT NULL DEFAULT '0',
  `AttributesEx5` int(10) unsigned NOT NULL DEFAULT '0',
  `AttributesEx6` int(10) unsigned NOT NULL DEFAULT '0',
  `AttributesEx7` int(10) unsigned NOT NULL DEFAULT '0',
  `Stances` int(10) unsigned NOT NULL DEFAULT '0',
  `StancesNot` int(10) unsigned NOT NULL DEFAULT '0',
  `Targets` int(10) unsigned NOT NULL DEFAULT '0',
  `CastingTimeIndex` int(10) unsigned NOT NULL DEFAULT '1',
  `AuraInterruptFlags` int(10) unsigned NOT NULL DEFAULT '0',
  `ProcFlags` int(10) unsigned NOT NULL DEFAULT '0',
  `ProcChance` int(10) unsigned NOT NULL DEFAULT '0',
  `ProcCharges` int(10) unsigned NOT NULL DEFAULT '0',
  `MaxLevel` int(10) unsigned NOT NULL DEFAULT '0',
  `BaseLevel` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellLevel` int(10) unsigned NOT NULL DEFAULT '0',
  `DurationIndex` int(10) unsigned NOT NULL DEFAULT '0',
  `RangeIndex` int(10) unsigned NOT NULL DEFAULT '1',
  `StackAmount` int(10) unsigned NOT NULL DEFAULT '0',
  `EquippedItemClass` int(11) NOT NULL DEFAULT '-1',
  `EquippedItemSubClassMask` int(11) NOT NULL DEFAULT '0',
  `EquippedItemInventoryTypeMask` int(11) NOT NULL DEFAULT '0',
  `Effect1` int(10) unsigned NOT NULL DEFAULT '0',
  `Effect2` int(10) unsigned NOT NULL DEFAULT '0',
  `Effect3` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectDieSides1` int(11) NOT NULL DEFAULT '0',
  `EffectDieSides2` int(11) NOT NULL DEFAULT '0',
  `EffectDieSides3` int(11) NOT NULL DEFAULT '0',
  `EffectRealPointsPerLevel1` float NOT NULL DEFAULT '0',
  `EffectRealPointsPerLevel2` float NOT NULL DEFAULT '0',
  `EffectRealPointsPerLevel3` float NOT NULL DEFAULT '0',
  `EffectBasePoints1` int(11) NOT NULL DEFAULT '0',
  `EffectBasePoints2` int(11) NOT NULL DEFAULT '0',
  `EffectBasePoints3` int(11) NOT NULL DEFAULT '0',
  `EffectMechanic1` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectMechanic2` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectMechanic3` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetA1` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetA2` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetA3` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetB1` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetB2` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetB3` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectRadiusIndex1` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectRadiusIndex2` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectRadiusIndex3` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectApplyAuraName1` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectApplyAuraName2` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectApplyAuraName3` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectAmplitude1` int(11) NOT NULL DEFAULT '0',
  `EffectAmplitude2` int(11) NOT NULL DEFAULT '0',
  `EffectAmplitude3` int(11) NOT NULL DEFAULT '0',
  `EffectMultipleValue1` float NOT NULL DEFAULT '0',
  `EffectMultipleValue2` float NOT NULL DEFAULT '0',
  `EffectMultipleValue3` float NOT NULL DEFAULT '0',
  `EffectMiscValue1` int(11) NOT NULL DEFAULT '0',
  `EffectMiscValue2` int(11) NOT NULL DEFAULT '0',
  `EffectMiscValue3` int(11) NOT NULL DEFAULT '0',
  `EffectMiscValueB1` int(11) NOT NULL DEFAULT '0',
  `EffectMiscValueB2` int(11) NOT NULL DEFAULT '0',
  `EffectMiscValueB3` int(11) NOT NULL DEFAULT '0',
  `EffectTriggerSpell1` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectTriggerSpell2` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectTriggerSpell3` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskA1` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskA2` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskA3` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskB1` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskB2` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskB3` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskC1` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskC2` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskC3` int(10) unsigned NOT NULL DEFAULT '0',
  `MaxTargetLevel` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellFamilyName` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellFamilyFlags1` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellFamilyFlags2` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellFamilyFlags3` int(10) unsigned NOT NULL DEFAULT '0',
  `MaxAffectedTargets` int(10) unsigned NOT NULL DEFAULT '0',
  `DmgClass` int(10) unsigned NOT NULL DEFAULT '0',
  `PreventionType` int(10) unsigned NOT NULL DEFAULT '0',
  `DmgMultiplier1` float NOT NULL DEFAULT '0',
  `DmgMultiplier2` float NOT NULL DEFAULT '0',
  `DmgMultiplier3` float NOT NULL DEFAULT '0',
  `AreaGroupId` int(11) NOT NULL DEFAULT '0',
  `SchoolMask` int(10) unsigned NOT NULL DEFAULT '0',
  `Comment` text NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Custom spell.dbc entries';

-- Export de données de la table world.spell_dbc: 0 rows
/*!40000 ALTER TABLE `spell_dbc` DISABLE KEYS */;
/*!40000 ALTER TABLE `spell_dbc` ENABLE KEYS */;


-- Export de la structure de table world. spell_enchant_proc_data
CREATE TABLE IF NOT EXISTS `spell_enchant_proc_data` (
  `entry` int(10) unsigned NOT NULL,
  `customChance` int(10) unsigned NOT NULL DEFAULT '0',
  `PPMChance` float unsigned NOT NULL DEFAULT '0',
  `procEx` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Spell enchant proc data';

-- Export de données de la table world.spell_enchant_proc_data: 0 rows
/*!40000 ALTER TABLE `spell_enchant_proc_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `spell_enchant_proc_data` ENABLE KEYS */;


-- Export de la structure de table world. spell_forbidden
CREATE TABLE IF NOT EXISTS `spell_forbidden` (
  `spell_id` int(11) unsigned NOT NULL,
  `comment` blob,
  PRIMARY KEY (`spell_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Export de données de la table world.spell_forbidden: ~0 rows (environ)
/*!40000 ALTER TABLE `spell_forbidden` DISABLE KEYS */;
/*!40000 ALTER TABLE `spell_forbidden` ENABLE KEYS */;


-- Export de la structure de table world. spell_group
CREATE TABLE IF NOT EXISTS `spell_group` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `spell_id` int(11) NOT NULL DEFAULT '0',
  `coment` char(50) NOT NULL,
  PRIMARY KEY (`id`,`spell_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Spell System';

-- Export de données de la table world.spell_group: 0 rows
/*!40000 ALTER TABLE `spell_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `spell_group` ENABLE KEYS */;


-- Export de la structure de table world. spell_group_stack_rules
CREATE TABLE IF NOT EXISTS `spell_group_stack_rules` (
  `group_id` int(11) unsigned NOT NULL DEFAULT '0',
  `stack_rule` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.spell_group_stack_rules: 0 rows
/*!40000 ALTER TABLE `spell_group_stack_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `spell_group_stack_rules` ENABLE KEYS */;


-- Export de la structure de table world. spell_learn_spell
CREATE TABLE IF NOT EXISTS `spell_learn_spell` (
  `entry` smallint(5) unsigned NOT NULL DEFAULT '0',
  `SpellID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`SpellID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Item System';

-- Export de données de la table world.spell_learn_spell: 0 rows
/*!40000 ALTER TABLE `spell_learn_spell` DISABLE KEYS */;
/*!40000 ALTER TABLE `spell_learn_spell` ENABLE KEYS */;


-- Export de la structure de table world. spell_linked_spell
CREATE TABLE IF NOT EXISTS `spell_linked_spell` (
  `spell_trigger` mediumint(8) NOT NULL,
  `spell_effect` mediumint(8) NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  UNIQUE KEY `trigger_effect_type` (`spell_trigger`,`spell_effect`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Spell System';

-- Export de données de la table world.spell_linked_spell: 0 rows
/*!40000 ALTER TABLE `spell_linked_spell` DISABLE KEYS */;
/*!40000 ALTER TABLE `spell_linked_spell` ENABLE KEYS */;


-- Export de la structure de table world. spell_loot_template
CREATE TABLE IF NOT EXISTS `spell_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `lootmode` smallint(5) unsigned NOT NULL DEFAULT '1',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(8) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';

-- Export de données de la table world.spell_loot_template: 0 rows
/*!40000 ALTER TABLE `spell_loot_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `spell_loot_template` ENABLE KEYS */;


-- Export de la structure de table world. spell_pet_auras
CREATE TABLE IF NOT EXISTS `spell_pet_auras` (
  `spell` mediumint(8) unsigned NOT NULL COMMENT 'dummy spell id',
  `effectId` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `pet` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'pet id; 0 = all',
  `aura` mediumint(8) unsigned NOT NULL COMMENT 'pet aura id',
  PRIMARY KEY (`spell`,`effectId`,`pet`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.spell_pet_auras: 0 rows
/*!40000 ALTER TABLE `spell_pet_auras` DISABLE KEYS */;
/*!40000 ALTER TABLE `spell_pet_auras` ENABLE KEYS */;


-- Export de la structure de table world. spell_phase
CREATE TABLE IF NOT EXISTS `spell_phase` (
  `id` mediumint(7) unsigned NOT NULL DEFAULT '0',
  `phasemask` bigint(20) unsigned NOT NULL DEFAULT '1',
  `terrainswapmap` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.spell_phase: 0 rows
/*!40000 ALTER TABLE `spell_phase` DISABLE KEYS */;
/*!40000 ALTER TABLE `spell_phase` ENABLE KEYS */;


-- Export de la structure de table world. spell_proc
CREATE TABLE IF NOT EXISTS `spell_proc` (
  `spellId` mediumint(8) NOT NULL DEFAULT '0',
  `schoolMask` tinyint(4) NOT NULL DEFAULT '0',
  `spellFamilyName` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spellFamilyMask0` int(10) unsigned NOT NULL DEFAULT '0',
  `spellFamilyMask1` int(10) unsigned NOT NULL DEFAULT '0',
  `spellFamilyMask2` int(10) unsigned NOT NULL DEFAULT '0',
  `typeMask` int(10) unsigned NOT NULL DEFAULT '0',
  `spellTypeMask` int(10) unsigned NOT NULL DEFAULT '0',
  `spellPhaseMask` int(11) NOT NULL DEFAULT '0',
  `hitMask` int(11) NOT NULL DEFAULT '0',
  `attributesMask` int(10) unsigned NOT NULL DEFAULT '0',
  `ratePerMinute` float NOT NULL DEFAULT '0',
  `chance` float NOT NULL DEFAULT '0',
  `cooldown` float unsigned NOT NULL DEFAULT '0',
  `charges` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`spellId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.spell_proc: 0 rows
/*!40000 ALTER TABLE `spell_proc` DISABLE KEYS */;
/*!40000 ALTER TABLE `spell_proc` ENABLE KEYS */;


-- Export de la structure de table world. spell_proc_event
CREATE TABLE IF NOT EXISTS `spell_proc_event` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `SchoolMask` tinyint(4) NOT NULL DEFAULT '0',
  `SpellFamilyName` smallint(5) unsigned NOT NULL DEFAULT '0',
  `SpellFamilyMask0` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellFamilyMask1` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellFamilyMask2` int(10) unsigned NOT NULL DEFAULT '0',
  `procFlags` int(10) unsigned NOT NULL DEFAULT '0',
  `procEx` int(10) unsigned NOT NULL DEFAULT '0',
  `ppmRate` float NOT NULL DEFAULT '0',
  `CustomChance` float NOT NULL DEFAULT '0',
  `Cooldown` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.spell_proc_event: 0 rows
/*!40000 ALTER TABLE `spell_proc_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `spell_proc_event` ENABLE KEYS */;


-- Export de la structure de table world. spell_ranks
CREATE TABLE IF NOT EXISTS `spell_ranks` (
  `first_spell_id` int(10) unsigned NOT NULL DEFAULT '0',
  `spell_id` int(10) unsigned NOT NULL DEFAULT '0',
  `rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`first_spell_id`,`rank`),
  UNIQUE KEY `spell_id` (`spell_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Spell Rank Data';

-- Export de données de la table world.spell_ranks: 0 rows
/*!40000 ALTER TABLE `spell_ranks` DISABLE KEYS */;
/*!40000 ALTER TABLE `spell_ranks` ENABLE KEYS */;


-- Export de la structure de table world. spell_required
CREATE TABLE IF NOT EXISTS `spell_required` (
  `spell_id` mediumint(8) NOT NULL DEFAULT '0',
  `req_spell` mediumint(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`spell_id`,`req_spell`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Spell Additinal Data';

-- Export de données de la table world.spell_required: 0 rows
/*!40000 ALTER TABLE `spell_required` DISABLE KEYS */;
/*!40000 ALTER TABLE `spell_required` ENABLE KEYS */;


-- Export de la structure de table world. spell_scripts
CREATE TABLE IF NOT EXISTS `spell_scripts` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `effIndex` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `delay` int(10) unsigned NOT NULL DEFAULT '0',
  `command` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong2` int(10) unsigned NOT NULL DEFAULT '0',
  `dataint` int(11) NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.spell_scripts: 0 rows
/*!40000 ALTER TABLE `spell_scripts` DISABLE KEYS */;
/*!40000 ALTER TABLE `spell_scripts` ENABLE KEYS */;


-- Export de la structure de table world. spell_script_names
CREATE TABLE IF NOT EXISTS `spell_script_names` (
  `spell_id` int(11) NOT NULL,
  `ScriptName` char(64) NOT NULL,
  UNIQUE KEY `spell_id` (`spell_id`,`ScriptName`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.spell_script_names: 0 rows
/*!40000 ALTER TABLE `spell_script_names` DISABLE KEYS */;
/*!40000 ALTER TABLE `spell_script_names` ENABLE KEYS */;


-- Export de la structure de table world. spell_target_position
CREATE TABLE IF NOT EXISTS `spell_target_position` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `target_map` smallint(5) unsigned NOT NULL DEFAULT '0',
  `target_position_x` float NOT NULL DEFAULT '0',
  `target_position_y` float NOT NULL DEFAULT '0',
  `target_position_z` float NOT NULL DEFAULT '0',
  `target_orientation` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Spell System';

-- Export de données de la table world.spell_target_position: 0 rows
/*!40000 ALTER TABLE `spell_target_position` DISABLE KEYS */;
/*!40000 ALTER TABLE `spell_target_position` ENABLE KEYS */;


-- Export de la structure de table world. spell_threat
CREATE TABLE IF NOT EXISTS `spell_threat` (
  `entry` mediumint(8) unsigned NOT NULL,
  `flatMod` int(11) DEFAULT NULL,
  `pctMod` float NOT NULL DEFAULT '1' COMMENT 'threat multiplier for damage/healing',
  `apPctMod` float NOT NULL DEFAULT '0' COMMENT 'additional threat bonus from attack power',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- Export de données de la table world.spell_threat: 0 rows
/*!40000 ALTER TABLE `spell_threat` DISABLE KEYS */;
/*!40000 ALTER TABLE `spell_threat` ENABLE KEYS */;


-- Export de la structure de table world. time_diff_log
CREATE TABLE IF NOT EXISTS `time_diff_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `time` int(10) unsigned DEFAULT '0',
  `average` int(10) unsigned DEFAULT '0',
  `max` int(10) unsigned DEFAULT '0',
  `players` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.time_diff_log: 0 rows
/*!40000 ALTER TABLE `time_diff_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_diff_log` ENABLE KEYS */;


-- Export de la structure de table world. transports
CREATE TABLE IF NOT EXISTS `transports` (
  `guid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` text,
  `period` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ScriptName` char(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `idx_entry` (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Transports';

-- Export de données de la table world.transports: 0 rows
/*!40000 ALTER TABLE `transports` DISABLE KEYS */;
/*!40000 ALTER TABLE `transports` ENABLE KEYS */;


-- Export de la structure de table world. trinity_string
CREATE TABLE IF NOT EXISTS `trinity_string` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `content_default` text NOT NULL,
  `content_loc1` text,
  `content_loc2` text,
  `content_loc3` text,
  `content_loc4` text,
  `content_loc5` text,
  `content_loc6` text,
  `content_loc7` text,
  `content_loc8` text,
  `content_loc9` text,
  `content_loc10` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.trinity_string: 0 rows
/*!40000 ALTER TABLE `trinity_string` DISABLE KEYS */;
/*!40000 ALTER TABLE `trinity_string` ENABLE KEYS */;


-- Export de la structure de table world. vehicle_accessory
CREATE TABLE IF NOT EXISTS `vehicle_accessory` (
  `guid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `accessory_entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `seat_id` tinyint(4) NOT NULL DEFAULT '0',
  `minion` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `summontype` tinyint(3) unsigned NOT NULL DEFAULT '6' COMMENT 'see enum TempSummonType',
  `summontimer` int(10) unsigned NOT NULL DEFAULT '30000' COMMENT 'timer, only relevant for certain summontypes',
  PRIMARY KEY (`guid`,`seat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- Export de données de la table world.vehicle_accessory: 0 rows
/*!40000 ALTER TABLE `vehicle_accessory` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_accessory` ENABLE KEYS */;


-- Export de la structure de table world. vehicle_template_accessory
CREATE TABLE IF NOT EXISTS `vehicle_template_accessory` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `accessory_entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `seat_id` tinyint(4) NOT NULL DEFAULT '0',
  `minion` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `summontype` tinyint(3) unsigned NOT NULL DEFAULT '6' COMMENT 'see enum TempSummonType',
  `summontimer` int(10) unsigned NOT NULL DEFAULT '30000' COMMENT 'timer, only relevant for certain summontypes',
  PRIMARY KEY (`entry`,`seat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- Export de données de la table world.vehicle_template_accessory: 0 rows
/*!40000 ALTER TABLE `vehicle_template_accessory` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_template_accessory` ENABLE KEYS */;


-- Export de la structure de table world. version
CREATE TABLE IF NOT EXISTS `version` (
  `core_version` varchar(120) DEFAULT NULL COMMENT 'Core revision dumped at startup.',
  `core_revision` varchar(120) DEFAULT NULL,
  `db_version` varchar(120) DEFAULT NULL COMMENT 'Version of world DB.',
  `cache_id` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Version Notes';

-- Export de données de la table world.version: 0 rows
/*!40000 ALTER TABLE `version` DISABLE KEYS */;
/*!40000 ALTER TABLE `version` ENABLE KEYS */;


-- Export de la structure de table world. warden_checks
CREATE TABLE IF NOT EXISTS `warden_checks` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned DEFAULT NULL,
  `data` varchar(48) DEFAULT NULL,
  `str` varchar(20) DEFAULT NULL,
  `address` int(10) unsigned DEFAULT NULL,
  `length` tinyint(3) unsigned DEFAULT NULL,
  `result` varchar(24) DEFAULT NULL,
  `comment` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.warden_checks: 0 rows
/*!40000 ALTER TABLE `warden_checks` DISABLE KEYS */;
/*!40000 ALTER TABLE `warden_checks` ENABLE KEYS */;


-- Export de la structure de table world. warden_data_result
CREATE TABLE IF NOT EXISTS `warden_data_result` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `check` int(3) DEFAULT NULL,
  `data` tinytext,
  `str` tinytext,
  `address` int(8) DEFAULT NULL,
  `length` int(2) DEFAULT NULL,
  `result` tinytext,
  `comment` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Export de données de la table world.warden_data_result: ~0 rows (environ)
/*!40000 ALTER TABLE `warden_data_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `warden_data_result` ENABLE KEYS */;


-- Export de la structure de table world. waypoints
CREATE TABLE IF NOT EXISTS `waypoints` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `pointid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `point_comment` text,
  PRIMARY KEY (`entry`,`pointid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Creature waypoints';

-- Export de données de la table world.waypoints: 0 rows
/*!40000 ALTER TABLE `waypoints` DISABLE KEYS */;
/*!40000 ALTER TABLE `waypoints` ENABLE KEYS */;


-- Export de la structure de table world. waypoint_data
CREATE TABLE IF NOT EXISTS `waypoint_data` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Creature GUID',
  `point` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `delay` int(10) unsigned NOT NULL DEFAULT '0',
  `move_flag` tinyint(4) NOT NULL DEFAULT '0',
  `action` int(11) NOT NULL DEFAULT '0',
  `action_chance` smallint(6) NOT NULL DEFAULT '100',
  `wpguid` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.waypoint_data: 0 rows
/*!40000 ALTER TABLE `waypoint_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `waypoint_data` ENABLE KEYS */;


-- Export de la structure de table world. waypoint_scripts
CREATE TABLE IF NOT EXISTS `waypoint_scripts` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `delay` int(11) unsigned NOT NULL DEFAULT '0',
  `command` int(11) unsigned NOT NULL DEFAULT '0',
  `datalong` int(11) unsigned NOT NULL DEFAULT '0',
  `datalong2` int(11) unsigned NOT NULL DEFAULT '0',
  `dataint` int(11) unsigned NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0',
  `guid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table world.waypoint_scripts: 0 rows
/*!40000 ALTER TABLE `waypoint_scripts` DISABLE KEYS */;
/*!40000 ALTER TABLE `waypoint_scripts` ENABLE KEYS */;


-- Export de la structure de table world. zone_skip_update
CREATE TABLE IF NOT EXISTS `zone_skip_update` (
  `zone` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`zone`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='latin1_swedish_ci';

-- Export de données de la table world.zone_skip_update: ~0 rows (environ)
/*!40000 ALTER TABLE `zone_skip_update` DISABLE KEYS */;
/*!40000 ALTER TABLE `zone_skip_update` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

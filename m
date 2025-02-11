Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2047.outbound.protection.outlook.com [40.107.236.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8521EF0A9
	for <platform-driver-x86@vger.kernel.org>; Tue, 11 Feb 2025 09:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739265606; cv=fail; b=bO86Vr5J+vRNSaZwaGdXsGI2if9tPNcJjTypBz7pTOI+KWZIzPdroKQ9iGbB6z6gRzoW/1w5YfIHQdA8AvjDIlPDbbQjdnN5Q7tle1qZeWPlWTaRNEpWxuvQMRbX4n5gsVUNTSU+8/lwoOE6lcKUQ8r0I8RjaMhz/0BtIDziWLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739265606; c=relaxed/simple;
	bh=/5YsUNQScHo8gCFqcfBS5U5dUUIA5T8XpCtXmsU0MhE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ow5WIVOUDqy7hEDjLYnCdC8/O6Cb0RHvK0I0MAreY3y1bbJmDs+ANl97hbt40rMRjcUAfFBqDmho7+EkmkWwhheY6F241Uga2NtrjgAkPNr6iOTVpxGH7KdqGSkAXzOnpVvjxvj3Xg4T/VY5XyLSDah2jakk8sTFHmT1MjMzy1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QW18m1k9; arc=fail smtp.client-ip=40.107.236.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QW18m1k9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NetvAs0aFw1pomnNmqlirxGvZfcuuSvLeLVl+23lkkoZ3TuJaj/ZroDLbrfKhiSgF/ILAvfWj6arLC4FfpZjRoRgMDnEG8cJAW2LMqIlsUxizDMLTrgT9GUOAajTTXRPmXm2ICWHEFCkIAj3Q3E6aoaxG1eFw7MzoCFAgmssd5kOy7VyIJAzIBzUSDABewb43IKDei6JDSDYRmieF18IoGIL9r+pEZrWHwNKufjhdQOSBZ/NHeGwOIuNpv0H8e4JRznWsEf4w7S2r5sDUry9FO6AzmjdQ8srKIX4gW2raKAIi43yG2UoHhj+GTA6wUgCHMa3hcJ6lUZ1nO8mjBIi4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rwSobYDUMRteEJBnNDDttmy71zW3KSxO0M/meCUyycA=;
 b=woHldi5Qj2QKpw8pmDkOiWphybEuhfQdFfrg6S6S3MULmBDLlmbe6i3aqf4Ct8LdevzI7wodJyWMq30orvTN/Qt/DrnY5Okey/pF5K/u5RzuDC/rciPUsQaVUXoRnTvflSb/EdTzeAK93H7HFtb6gECpv5JFUfPwSe11EeyRWGprOyoXsfK+KygTV3utt4efLoaCSNhVAlvEvDydUYJGscA4lNgAU9tk4W1KDGcaDtZ60DhTc+sryPb+IWHvXUhrZdVlGmkz2PKL58LZU+cX1UB41SylkSzi6VEm8B6/c6hh+gO9Jt0bBWTHE4/4lJwDbMNVpSsjusdKzBSCHJX7+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rwSobYDUMRteEJBnNDDttmy71zW3KSxO0M/meCUyycA=;
 b=QW18m1k9bZ6iam5D5u2FEYgjqAs7J/qW4GzMykkgouimX53INH5YOK+C4JxHHtrEanGSXx6yA4/6dYW/kREPtYzahbrc1g4A6xd6CXyz9HYj5js6dKKxbF9Xrh16x/hHyGCNoS5SmvAuPV/TeAlZFg2phoqzZFQ+pC3hBvewwSu0sqh133WfuVKC7EDJzfiN0WMEKLzTBzHlcz14n7jpJ2YwwExGjwx+UwFHY9GCyaSvO5eeXCB4tX6IszzAyYkGVgmC2Im5nwZsvPKw4NqdkSkyuk9hT2FpDo/h7yW6LISBFkRL0dWO4H10vOVD7hgtUJhgiiyw+CyRruLeiumOmw==
Received: from DS7PR06CA0015.namprd06.prod.outlook.com (2603:10b6:8:2a::26) by
 SJ0PR12MB8168.namprd12.prod.outlook.com (2603:10b6:a03:4e7::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.19; Tue, 11 Feb 2025 09:20:01 +0000
Received: from DS2PEPF00003444.namprd04.prod.outlook.com
 (2603:10b6:8:2a:cafe::e6) by DS7PR06CA0015.outlook.office365.com
 (2603:10b6:8:2a::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.31 via Frontend Transport; Tue,
 11 Feb 2025 09:20:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003444.mail.protection.outlook.com (10.167.17.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.10 via Frontend Transport; Tue, 11 Feb 2025 09:20:00 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 11 Feb
 2025 01:19:48 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 11 Feb 2025 01:19:45 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH v6 2/9] platform/mellanox mlxreg-hotplug: Add support for new flavor of capability registers
Date: Tue, 11 Feb 2025 11:19:05 +0200
Message-ID: <20250211091912.36787-3-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250211091912.36787-1-vadimp@nvidia.com>
References: <20250211091912.36787-1-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003444:EE_|SJ0PR12MB8168:EE_
X-MS-Office365-Filtering-Correlation-Id: 1393e3ba-7b23-473f-2d17-08dd4a7d42c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KGhTx8msYiTnTBfv5UH6cSaSmapurdFcCg6aZWlfPZDVpfrEXm5tDMGOBI55?=
 =?us-ascii?Q?A4/qPXGzZEvv2zLoDxaH/UhAB1McacY73GheZnMNi9qjIGFBwm50rV+0wWUU?=
 =?us-ascii?Q?VJODesYzI2JeoeOBepBJjqZY7EIiHyyItKBlIjGZo9ya4CFvvelyasy7O1e1?=
 =?us-ascii?Q?Fe7GSXgVnhC4SbvdvYrLpGE9S9GEwqp61ISbr13huNtcieXTuGYEvtNA5ji2?=
 =?us-ascii?Q?LX99efDb4snXGAJ4bgureJAS+Y9Jhbc/TXCyF3Nzyr9ej5RhARg7bBqAO7Go?=
 =?us-ascii?Q?0m915QDph5tyZabRHAAx+ShdBHtUAOAREgnphnzQVlK2CqD0ZXWHQXu92g9K?=
 =?us-ascii?Q?EzK0nY8bXB5tAnsJ7KCw01fq5wkwEN7jctTIROFa0Rv5xJEJygSlaLeAAa6d?=
 =?us-ascii?Q?andfENUWQwEhR/iCFrsDtEo6AGsmCVo2XGEC5kMfu2QCCis0qIVdy4cJVZRV?=
 =?us-ascii?Q?9M5a224mXV439GrZtN7CVd15NmxSjzRfCEAUKGnwaAFHZWx5jNUxeOFG4IiU?=
 =?us-ascii?Q?fEAdnYGsGbFIWg0HJ4Cx0Vh18xBSyMAOAAD0P5nnfTNlhRecuND7/drOzDD5?=
 =?us-ascii?Q?uNaEY4Uj21moihnu9SR1Cpxz+4GcsSQhbnBdjOTjL6sOct3DoEsc5Dm4f4Lw?=
 =?us-ascii?Q?sXcv5TAAV5ZVpAKbyybxQiDkg3OUfa6y3MVDCH82bCuxAzHXo6SRn6M7++dD?=
 =?us-ascii?Q?sERAGF37e5GVU0m67N8cET9OZd6UW2C69mrh49TkmACeTc6vhGI4j+Eb+qY0?=
 =?us-ascii?Q?yg7E4FYdpgQQ4zKNJAoknNB4vxOwfVQChq3uKPXphhjegT07qa3tlLfKqSwG?=
 =?us-ascii?Q?Sk0h5qELSDIXj12oQyaMVAh400xhGgtpq4H9nF5E/wHvs4cvv2HA2uaCCy4O?=
 =?us-ascii?Q?d9cgK+wFaa26UtvC7YzMedH0mX0Ry7RRn8CT5L8iY82dyaK+lpFhv280PUxE?=
 =?us-ascii?Q?4H0E717EBEIaYRkIfB1qT/L7COjjm0fkCrpWnsp+exo0DF9Q3JNUzS8y1Xwh?=
 =?us-ascii?Q?wyutfrDqkLhxWEPa/JKKmFf5oAUdrMDGqBAh6NSzHwvt4ocUwdJRyXqbciio?=
 =?us-ascii?Q?hiuXEJgKpD6/w6OnbV/8M31esmI9OCppbudKs5uyVoqADd4cM57p9nBqKqwe?=
 =?us-ascii?Q?MOKDujpa6m3mA9kP+p5OaiozVj25ApseaRV1kjpxch+r76LyucIRGm23RCsM?=
 =?us-ascii?Q?bNl4jJgIGs+3/jUlIlbCJ559yJX/niYS3z1LoF7ceBqpeHjhyyiipt7JkGPg?=
 =?us-ascii?Q?IImH7QFNq8K73OqhIHo0Jzk9WDKMQfoNrzEWSfrI0nu8ZvwYf8F0gWi7sxqU?=
 =?us-ascii?Q?pxx6MaX308LQVbMd4CpGj+pjnd4CcRUx5jL3F6Ia5glAgM/FypuMlQD2GrC5?=
 =?us-ascii?Q?tks7YycKmLYP2NZ/Q+yMNPT3OQdH/F00DoY20VxHicreEXb1+1XTK3CbWFgg?=
 =?us-ascii?Q?oZ7hXln/2GyHf64kHP5VA+/882Eo+sp4zywK9Kmbx8KnjetaJIuXmwiEnLuJ?=
 =?us-ascii?Q?y2NygoZ6sUcosIM=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 09:20:00.6330
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1393e3ba-7b23-473f-2d17-08dd4a7d42c0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003444.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8168

Hotplug platform data is common across the various systems, while
hotplug driver should be able to configure only the instances relevant
to specific system.

For example, platform hoptplug data might contain descriptions for fan1,
fan2, ..., fan{n}, while some systems equipped with all 'n' fans,
others with less. Same for power units, power controllers, ASICs and so
on.

New 'capability_mask' is introduced to allow sharing of same hoptplug
structure between different systems, equipped with different number of
hotplug devices. It contains superset mask for all systems sharing the
same configuration.

The purpose is to reduce unnecessary duplication of hoptplug structures
between different systems - same structure is to be used for example for
system equipped fir for 4, 6 or 8 fans.

For detection of the real number of equipped devices capability
registers are used. These registers used to indicate presence of
hotplug devices. On some systems presence is porvided through the
bitmap. For some new big modular systems, these registers will provide
presence by counters. Use slot parameter to determine whether
capability register contains bitmask or counter.

Reviewed-by: Felix Radensky <fradensky@nvidia.com>
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
v5->v6
Revised after comments pointed out by Ilpo:
- Drop 'capability_bit' from structure 'mlxreg_core_data', since it is
  not used.
---
 drivers/platform/mellanox/mlxreg-hotplug.c | 25 ++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
index 0ce9fff1f7d4..93bdd20fd71a 100644
--- a/drivers/platform/mellanox/mlxreg-hotplug.c
+++ b/drivers/platform/mellanox/mlxreg-hotplug.c
@@ -274,6 +274,16 @@ static int mlxreg_hotplug_attr_init(struct mlxreg_hotplug_priv_data *priv)
 			if (ret)
 				return ret;
 
+			if (!regval)
+				continue;
+
+			/*
+			 * Remove non-relevant bits: 'regval' contains bitmask of attributes or
+			 * number of attributtes, which should be handled. While 'capability mask'
+			 * is superset mask.
+			 */
+			if (item->capability_mask)
+				regval = (regval & item->capability_mask);
 			item->mask = GENMASK((regval & item->mask) - 1, 0);
 		}
 
@@ -294,7 +304,18 @@ static int mlxreg_hotplug_attr_init(struct mlxreg_hotplug_priv_data *priv)
 				if (ret)
 					return ret;
 
-				if (!(regval & data->bit)) {
+				if (data->capability_mask)
+					regval = (regval & data->capability_mask);
+
+				/*
+				 * In case slot field is provided, capability register contains
+				 * counter, otherwise bitmask. Skip non-relevant entries if slot
+				 * is set and exceeds counter. Othewise validate entry by matching
+				 * bitmask.
+				 */
+				if (data->slot > regval)
+					break;
+				if (!(regval & data->bit) && !data->slot) {
 					data++;
 					continue;
 				}
@@ -611,7 +632,7 @@ static int mlxreg_hotplug_set_irq(struct mlxreg_hotplug_priv_data *priv)
 				if (ret)
 					goto out;
 
-				if (!(regval & data->bit))
+				if (!(regval & data->bit) && !data->slot)
 					item->mask &= ~BIT(j);
 			}
 		}
-- 
2.44.0


Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2058.outbound.protection.outlook.com [40.107.93.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9121A8F63
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Mar 2025 16:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743093578; cv=fail; b=slo7z58Rp3d6QMx8KawVGOE5IbRusCpgIf16LppYo3o858rAsgUxe1Dzmi1pyaEMD5z3bz2JNoZsEitcTpXxFxbGbxZ0kLM7glhjrQ7x0K7ihUGeGndzTaUId+FUDj8bRbWjFV1oTxXOQlGi7dJmPAwBq2t40slfvJZb0Ucsm7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743093578; c=relaxed/simple;
	bh=9PCLlz3vwp8edN4qq09qtuyL74+Kf/MBH17TPtub9AA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gb+eudtMhkSKdxPwAW7DSnWFtp0ocwkp1vSXNYl1BGj+BBiJa30EUcZi0axxEDl//fW0Wjt5K6p0wuwvaVaXV2owNLbFSPcHCo7OrkTYLyCzEPFPnVbN8bSvZIWS1fay34Gzs/LH9E0FLKkM6LmEG8anEchJOr0bb2ifhu7+qYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Z4yAgTiP; arc=fail smtp.client-ip=40.107.93.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Z4yAgTiP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iv3NJdkF5EMxPd9CCijsLagq/pXIZUfz7Job7w8a4ZHquvDJUl4tgnam7bqihIzn1Andb2HXdURQhlxJAAT0pFiJMCuoDJc+pgIFtlnC47qZJciAYKyswf6rEtau/ioF3X+8o15IwVy6EgGV4DrgR3R0x5hZUvlFYx1/azZCFvJKceTsVi7MhHk7gfdxo+ZWRBJq7IJZ6nT0v+q75DY9qi0+TP5FJz2t35ggwkz+Ztnodx58+uMUlCxAuO08iVJDreT3xe+jY9p2y01UeEoRf5CYU37+4hB87S88QqQasXKLRzpGxnrEoerCThhBpKrKOWanE7zgZsl05gy/J/P79A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KizzOw6u54W1AIsZGgfWAKPKiroqjnUDZb1jb9VFlMw=;
 b=QWUPvsHGS75qauQIQdOfzbIsb0LH+kdhC/fsctpjjmTKMMHdb1Z86TLGwWjIsLgG01S+/2+cjPMq3k3GOPJIcFDaG+nJasOQhubj5kTLTUWBCKDBDXMe4V0VVfWTuxQ5VG5cmEeL+XWRG8m3aH9x0gvMXkPUHyL7/Ds72quMQ3KetKLRlRciPlZKTjLrRJLuhQxui3SaWXEVwBfCwN+zO5zE7xJxx7h4H7G7eAxRtlY539l0cvOGfT2OAUasl2qMji/9uibUX72zpY8AYLYr/M5RUerdJ4KR8DU/3yXGMzirJsZXreaKf1L4PtkMhdDx0frxIUMSZc9d+ugGeACvOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KizzOw6u54W1AIsZGgfWAKPKiroqjnUDZb1jb9VFlMw=;
 b=Z4yAgTiPNsjIriURdB1JwNayc2jyaeqDWkEb0ML6D9ys3EsCg4QOvNAlHqB3Hf5WwPvXIRNVaHlUPl4tJfz2UbhPdu3m/IozdIJhjt6xoP3IsLhkQgqGILJqcucgwU+z1IyMKSiTOVoX9tP0YyQMRfUMxCdrIzfe9BRtnLq5KRLClSc97TaxPi5sO3LxeGhAATdK/XptTuUHrvanZfADoTT0cVjR0pqrnIbM7KnzGCrfcrCPims2S48x/CLMT6j85JI9tagJs+JFl/XGKysbBrhAYEw8Al2MNQdySkknaAObzpqdB3a08pMtSAT21oKye2yjgpW79NuLC5XL/ry48A==
Received: from BYAPR05CA0070.namprd05.prod.outlook.com (2603:10b6:a03:74::47)
 by DM3PR12MB9391.namprd12.prod.outlook.com (2603:10b6:0:3d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 16:39:33 +0000
Received: from CO1PEPF000044EF.namprd05.prod.outlook.com
 (2603:10b6:a03:74:cafe::2f) by BYAPR05CA0070.outlook.office365.com
 (2603:10b6:a03:74::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8583.27 via Frontend Transport; Thu,
 27 Mar 2025 16:39:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000044EF.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Thu, 27 Mar 2025 16:39:32 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 27 Mar
 2025 09:39:26 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 27 Mar 2025 09:39:23 -0700
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform-next v7 1/8] platform/mellanox mlxreg-hotplug: Add support for new flavor of capability registers
Date: Thu, 27 Mar 2025 18:38:48 +0200
Message-ID: <20250327163855.48294-2-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250327163855.48294-1-vadimp@nvidia.com>
References: <20250327163855.48294-1-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EF:EE_|DM3PR12MB9391:EE_
X-MS-Office365-Filtering-Correlation-Id: 417ec941-be56-491a-8e73-08dd6d4df3d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Xqm/A7ryjvEbEU3AgxETNG8/Ss1IxfJPcxVbaAhQ2suDgELALjeZvEcN4yAT?=
 =?us-ascii?Q?6DUuS8+BnpR9SGbzDNuZ4YQGJ3fOzjWiNkOE5kPMa1MjU8SqF/iMfQFGVng7?=
 =?us-ascii?Q?x8PnLtFaHZHmTFOAqm49CytSgM1rVL54BKdIty55T4olvVX+ngkW9C2ug3bf?=
 =?us-ascii?Q?IncWshjlJxyhZAOhQgGRgfMEWDYX3dBC8j3sy5EQuphUUPVhpvWJxC3L+A1P?=
 =?us-ascii?Q?mG0oYgpdjPRzDSSSQScXZyug6Ngdz9iKb/8/iVCNZbIqSBTr4Bq56/bdpUmy?=
 =?us-ascii?Q?l/jYa6Xs/Mo7Ww1rIq8Zr7buJolF2rfk+cwc7wiiOCneoE6cB6i6024emKSM?=
 =?us-ascii?Q?+i8gduABXs3djLkWgthbCGnKg6ezbKKexa/K4FCpGGTwCiz2mjp9IT9TX5p2?=
 =?us-ascii?Q?EBJMYC5pDXYjmHqQtJLnAo+TqWBGyE0yM/Nsli40969dae/eBIPjegbRwisH?=
 =?us-ascii?Q?6uXKpC8nRC0eO6Ge72sofGoJ6wAv4m1RZIlLhzpEEjOrizUAa2zVq9jBMcmd?=
 =?us-ascii?Q?FCauHnGp2Ntyd1FqZUzmTVD9kar21sDG8jMnOv6/6JHp+gVfCA17ySzL4ODf?=
 =?us-ascii?Q?b9k8bGcFfr0XeFRXh++10yDopSEKaq123aXcx/N5u49eKsfvAhinuYFZVFB/?=
 =?us-ascii?Q?QCYccHGhVUXTjv/zHURjGbkzdUPwGtFwCEWgmBUDV8LKDOVaDQlnbN4B2Pio?=
 =?us-ascii?Q?PQg7YCMH7KlLY6MOktejCMSkDIP4HRf63UepH4g12nDgwLHKHwgQAXv+m74d?=
 =?us-ascii?Q?nC/B9lmG3w1AT++k8wXl6h5XDs8tp9tccfvrzKfT1tbPhbioYno6RWzQkJRi?=
 =?us-ascii?Q?CQLGtxDgFD59ZsdA0CDY6ew2+kyFLIb+sK2gYdxQxLYg5/fpm67rGktTONjM?=
 =?us-ascii?Q?VOowBVt5iTqphanBHa2zV/uTU8E1nx07vG9RQImgiPKQN3vuCivEQMeYGcja?=
 =?us-ascii?Q?GvYvGkdedXcxSpEdNMkMnceznb3vr5IwGNKX0SRfaiwjAex69ShDdU0HD4nO?=
 =?us-ascii?Q?Ce9BXx0fvKCM1ziSDg6uja8WBQmL9AO9wjUM25jKvQKZ7C64Jn/nUmfxdSwb?=
 =?us-ascii?Q?y/GZNtpr76+DEEv8/ahYLh8WSsjZmscujHhEIPke1xdF2+WueMP/+08rD0fz?=
 =?us-ascii?Q?bXL4QHeGJS++B9hc0cvOgfJofdNXWhARG+BC9N/x7D5ppowvcyyMJtjFp7Ii?=
 =?us-ascii?Q?SXjoBi5CJhlewn3UW7GZg/1YAE+ZsnN1orIS35CGnnpwbvN0/cQ7sxtrvyzM?=
 =?us-ascii?Q?FmgluM6CK5SXfvNvOqE+V7MuIpARZM60VY40I9Bx8MTKLN2cAIr5Ex+I7hiB?=
 =?us-ascii?Q?kdHwhGOi16fxWmoRUScB4YVp86Txct/kR7BM2mwTCahrhwSwdw4tjamPg+7p?=
 =?us-ascii?Q?wsYkSRhSQEFc1r2jy7NSfQSlRaIrVGD2OFokVOiuCKiD0LLshFIkjB+tr9pT?=
 =?us-ascii?Q?3TvSTy54yjrGZbLxVCmu/F8EhIiUNNGrys/q7MyZBGLnAO6HB1o27NGC9L8u?=
 =?us-ascii?Q?jwSY6BftjG5UIjI=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 16:39:32.5946
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 417ec941-be56-491a-8e73-08dd6d4df3d9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9391

The hotplug platform data is common across various systems, but the
hotplug driver should only configure instances relevant to specific
systems.

For example, platform hotplug data might contain descriptions for fan1,
fan2, ..., fan{n}, while some systems are equipped with all 'n' fans,
others with less. This applies to power controllers, ASICs, and other
components as well.

The 'capability' register in 'mlxreg_core_item' structure specifies the
total number of elements. All registers are 8 bits wide. When the number
of attributes exceeds 8 bits, they are distributed across multiple
hotplug register sets. The 'capability' register provides the total
count across all sets.
Example for 20 attributes:
- Set 1: attributes 1-8.
- Set 2: attributes 9-16.
- Set 3: attributes 17-20.

The content of the 'capability' register in 'mlxreg_core_data' structure
depends on presence of the 'slot' field in this structure:
- If both 'capability' and 'slot' fields are provided: register contains
  count of elements.
- Otherwise: register contains bitmask.

Use slot parameter to determine whether capability register contains
bitmask or counter.

This change reduces unnecessary duplication of hotplug structures
between different systems - the same structure can be used for systems
equipped with 4, 12, or 18 fans.

Reviewed-by: Felix Radensky <fradensky@nvidia.com>
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
v6->v7
Revised after comment pointed out by Ilpo:
- Renove capability_mask field.
- Modify comments and commit text.
v5->v6
Revised after comments pointed out by Ilpo:
- Drop 'capability_bit' from structure 'mlxreg_core_data', since it is
  not used.
---
 drivers/platform/mellanox/mlxreg-hotplug.c | 29 +++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
index 0ce9fff1f7d4..bec12bc73e67 100644
--- a/drivers/platform/mellanox/mlxreg-hotplug.c
+++ b/drivers/platform/mellanox/mlxreg-hotplug.c
@@ -274,7 +274,22 @@ static int mlxreg_hotplug_attr_init(struct mlxreg_hotplug_priv_data *priv)
 			if (ret)
 				return ret;
 
-			item->mask = GENMASK((regval & item->mask) - 1, 0);
+			if (!regval)
+				continue;
+
+			/*
+			 * The 'regval' contains a bitmask or count of attributes to be handled.
+			 * When the 'capability' register is configured, for 'item' it specifies the
+			 * total number of elements. All registers are 8 bits wide. If the number of
+			 * attributes exceeds 8 bits, they are distributed across multiple hotplug
+			 * register sets. The 'capability' register provides the total count across
+			 * all sets.
+			 * Example for 20 attributes:
+			 * - Set 1: attributes 1-8.
+			 * - Set 2: attributes 9-16.
+			 * - Set 3: attributes 17-20.
+			 */
+			item->mask = GENMASK(((regval % 8) & item->mask) - 1, 0);
 		}
 
 		data = item->data;
@@ -294,7 +309,15 @@ static int mlxreg_hotplug_attr_init(struct mlxreg_hotplug_priv_data *priv)
 				if (ret)
 					return ret;
 
-				if (!(regval & data->bit)) {
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
@@ -611,7 +634,7 @@ static int mlxreg_hotplug_set_irq(struct mlxreg_hotplug_priv_data *priv)
 				if (ret)
 					goto out;
 
-				if (!(regval & data->bit))
+				if (!(regval & data->bit) && !data->slot)
 					item->mask &= ~BIT(j);
 			}
 		}
-- 
2.44.0


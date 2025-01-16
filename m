Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2083.outbound.protection.outlook.com [40.107.93.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200C814A62A
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jan 2025 08:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737014504; cv=fail; b=rVkbuMNxdHPKO/5KwCsQvgXLwsFPf5hDG6vDx8pdvEb6pGKoVRZG6AC/kIIuFdfM4VjlTAeS19EQOuncy0gD2mKKSCVNchIPvnh7vrWzKWpDkNCoSrb7fkoTScBIpB3M0G/mrMbjf5lf1psJeYoKdeJoVbAYhOBPRr8PZl6jwb8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737014504; c=relaxed/simple;
	bh=dM78CiEF10KfQZVdA2uYOU7ee9XL53iHYCd89BEWLec=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EF2/J5IybkrMpKQSjd5WP3TsycddaR5tBziQEPXOcchxzyzr78TZ0pNaQ9dR0vuXbERQYlC//0clxh/rD0Nuofn3e/Xqh9ixQVK6v/N9fRutuz6cigFL4L98HLQnmQBWBOG6cktLqoti/VfGrtpSmSX2YgV45hxENVc5OUScn08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kBzINplS; arc=fail smtp.client-ip=40.107.93.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kBzINplS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zA+5AqCKnRJoLvA1tbst8YTkqsFJAmi6kuehaLiW9gEweUKThn6OzCKrgN98J7kB3aKS79BssanWfUa0Mouw/54GDcJHoxnNNytilBnP1UQ3b3nd8136JlgEkg9jT/yCkYm3xsAzP4syXZ5a5cB2LrYxPBuTyh/jEJ30WsMoANXoFUnvsna6X0/nxbsDIEIjzZtpwXcHX4nv1lDDXuyrJKiuGqLReEUyeOwkfp6RlsJZvQvPMmcmT+0DsorIp+8XCvwk81Dh/dM7E2FqVFb5EJsfWCLt8FXYExoq6e35gxCIbElfLjtowwYSeBfg+3Y/iHOGp+tna5ZifK49zh9/pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i1GPICH/CsYgtTeF+91GkQrmSijxAW1UibSKEz4z7ws=;
 b=ZAPkgAqlESh54vvXeYS/jKGEFc1TCLNZZpL1AMkFmuq8iWZGZmukbzHHEUsYFjOtZ9+t9furHeXCq6EwhcwYHlQ4ocg0eP5Y7v60XE6NnYjkAkSUJLSAHf1bJdrzCueWVKEGQiBTL2cJvbkNh1Ss3oLn4lcWBHD8hwrJgMTzzOXYLE7cYjpefqrtosF6KhaKDKi6C/fGICQthlMtKjQ8ctX7j+OxVtByL/ztdEHaGhZy2j/Fqxm0PZsv93pEWcMWilbGUsPzM2BLP4CJAFsPF3U6ADiEIIteqa6nz81ArzD1T9QhDyd3wCwuT3sAg5wwVfrDCloZlFfVlu7WETXTrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i1GPICH/CsYgtTeF+91GkQrmSijxAW1UibSKEz4z7ws=;
 b=kBzINplSJDSvTDfQOANV6fp+dD6wzqlOtZvtCyiXKq3D1qfyqXePl3thk53Ktx/hnGL99o/RAu186b9qzoX0cBVo858Dfpj076qzOQAsfMU9UAYFUazBYCK/23WvnTA5S9Lu6otdNRaW0RTmPDXvUzMAOMAXTHvL9CVonT6IqBejDl7kxrh0yCiKB70ykH1JRZRkGjyLOPvZ3EeSfpfYQDKoDmF4iPhHfkC3Po5QlA9MUsmEFYWjBTAha6fEkn0ETIDmDNIeSfaGb9C48DZ/cCqji69w6H6vDD+AiSunmRo8VxN4n6mp9If6kzcqAHK0oQr0G8RqntKeu56DEKwJEA==
Received: from CH0PR03CA0076.namprd03.prod.outlook.com (2603:10b6:610:cc::21)
 by BL3PR12MB6452.namprd12.prod.outlook.com (2603:10b6:208:3bb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 08:01:37 +0000
Received: from CH3PEPF00000011.namprd21.prod.outlook.com
 (2603:10b6:610:cc:cafe::ce) by CH0PR03CA0076.outlook.office365.com
 (2603:10b6:610:cc::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.13 via Frontend Transport; Thu,
 16 Jan 2025 08:01:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH3PEPF00000011.mail.protection.outlook.com (10.167.244.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.0 via Frontend Transport; Thu, 16 Jan 2025 08:01:37 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 16 Jan
 2025 00:01:25 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 16 Jan 2025 00:01:23 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH v3 05/10] platform/mellanox: mlxreg-hotplug: Add support for new flavor of capability registers
Date: Thu, 16 Jan 2025 09:59:11 +0200
Message-ID: <20250116075919.34270-6-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250116075919.34270-1-vadimp@nvidia.com>
References: <20250116075919.34270-1-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000011:EE_|BL3PR12MB6452:EE_
X-MS-Office365-Filtering-Correlation-Id: 661e3a5b-4ef3-484b-6b23-08dd36040090
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mPpcoOzKokfpfIPwLihXInlxWpXZlX7loXq15RsE3rF6VLAG5Z+b3aquR/B+?=
 =?us-ascii?Q?DG94kkRXf7Oa4Cl/vpaLbYNEWGbJOPSnQHxQLeVWZ/oA0W/Yzjkpo73KWVXN?=
 =?us-ascii?Q?ga2ML7FezTecK3YDtOVFs20YRx3BRHD/A5ue8xofzdGpWXJvCJKFUX2kA2Wb?=
 =?us-ascii?Q?EoRX6/h9YgLuoixpi1wmfcgOuuDUuRRaOTl0j2pjZeZj55c4QTI7fiqT2dWK?=
 =?us-ascii?Q?0zxAMu39/r1L2eViwlPs/+jngXXxb5Nm2Tl6rvBdETlNojgLOIQDrOvs2BK2?=
 =?us-ascii?Q?3AGwb3SNKJgKnup/XFiPLbSZa+S8zhlN4uNaYD9Wadq0gCvgJFTB3+D7z7dM?=
 =?us-ascii?Q?jUMc83QlOeaDO9aJGpKxH7jSIrUKl+tUESTLTcywZOGXFsaWFvZAv1BqgMPX?=
 =?us-ascii?Q?4Kv73SSiNl4hKKKf5oeRENVt3rUu1I0okz7m/AKKEEQBjr1vdndcSDTJaWxL?=
 =?us-ascii?Q?CL7eApQ8l+urzap0EyT+bKNRv96TslkoWyQ/xJRnpUGehL7hcpec7qOcIFD/?=
 =?us-ascii?Q?ts2lDZuA0pbNnWX+R1WzhR9F3JhsWlzqalBtupb1FVT91cy2rNHJWWDGy34k?=
 =?us-ascii?Q?fHBpYYjae2YJ/XtHnHuizSTEUnLtMTD//H+P9GqxQuqB3fdsySFZpQyvJKjT?=
 =?us-ascii?Q?q4o6y5vwKgkgJdSxyiBmFrHtzJVZF1P+dTq5B7mXw7BBW6Y7pJFnfSgykGl0?=
 =?us-ascii?Q?PrV52RrFeriibTAOMQhzCoONWqYP3xmKY580/+1OhirpAc0sCruFMwxigTEb?=
 =?us-ascii?Q?sGkE5zOYtFivH/QjnqdL1WdX5clsqRw1ylAsrWBE+cbFUr4PD9X3TWr3oOWl?=
 =?us-ascii?Q?nmuQUnU+BYEabHdx3+Mu8kzDR7np8OWR9DS9Yc7VZE0IRa7j4fKuSkqc4MqZ?=
 =?us-ascii?Q?YEF1fId8uPho30S9NduuCW/qKZiqpLaiB3fTyhqFHxYitHsiXRbXtwDKOe2H?=
 =?us-ascii?Q?+/3Ew9VLoS3WvDBWR3eusaY1+8cGktri7PxWjDzK7nc3CC1hJTOa+Hb1fniA?=
 =?us-ascii?Q?TlNYMoA/PKcLwAnA82Sdr/2NXI7AMXK0CbfS43D+F+SULp4/gnA9aoj8zFGo?=
 =?us-ascii?Q?20LhNYe2W0XWiIRc6sDxDYm47+bCLpuqHPioIh3JaWqVLT2n32CpvUz6xnLG?=
 =?us-ascii?Q?TYOyLGRLJI6f2vdjHZ3U4MJ7Y82V7zwMmt27o7jcmZX05+6310wmLSAWwPjg?=
 =?us-ascii?Q?AwkU6oyGL5cGOFpoq9hasFLPtHwHBRAG11m4YELQOIcHeLpJUXHmXnVmbjlc?=
 =?us-ascii?Q?4R/9px/cf9dc3UCxFkhF1Dn0NRYKvnXkK1/Rn+VcCWbzBoBODJkYJjsHUXM4?=
 =?us-ascii?Q?i1s4AZ9S9h4cYNDjXXf2aperkAeftH6bLaure8objK9FP6B9FjtGyIp104DO?=
 =?us-ascii?Q?Js+bI1zSf6vA4ORspoUTksPxo9awUlFt41TPZkWlprkK1u6z62bTLZYyN/DJ?=
 =?us-ascii?Q?RB7+K3qhGlbS08u4Sf7qQpCEov83hq+ga3YTRuzDLyffEKcbDZwssgLJju3a?=
 =?us-ascii?Q?9XmeSqWzexHkIB0=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 08:01:37.1837
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 661e3a5b-4ef3-484b-6b23-08dd36040090
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000011.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6452

Hotplug platform data is common across the various systems, while
hotplug driver should be able to configure only the instances relevant
to specific system.

For example, platform hoptplug data might contain descriptions for fan1,
fan2, ..., fan{n}, while some systems equipped with all 'n' fans,
others with less.
Same for power units, power controllers, ASICs and so on.

For detection of the real number of equipped devices capability
registers are used.
These registers used to indicate presence of hotplug devices through
the bitmap.

For some new big modular systems, these registers will provide presence
by counters.

Use slot parameter to determine whether capability register contains
bitmask or counter.

Some 'capability' registers can be shared between different resources.
Use fields 'capability_bit' and 'capability_mask' for getting only
relevant capability bits.

Reviewed-by: Felix Radensky <fradensky@nvidia.com>
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
v2->v3
Comments pointed out by Ilpo:
- Change rol32() to shift left.
---
 drivers/platform/mellanox/mlxreg-hotplug.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
index 0ce9fff1f7d4..c525b8754d48 100644
--- a/drivers/platform/mellanox/mlxreg-hotplug.c
+++ b/drivers/platform/mellanox/mlxreg-hotplug.c
@@ -274,6 +274,12 @@ static int mlxreg_hotplug_attr_init(struct mlxreg_hotplug_priv_data *priv)
 			if (ret)
 				return ret;
 
+			if (!regval)
+				continue;
+
+			/* Remove non-relevant bits. */
+			if (item->capability_mask)
+				regval = (regval & item->capability_mask) << item->capability_bit;
 			item->mask = GENMASK((regval & item->mask) - 1, 0);
 		}
 
@@ -294,7 +300,19 @@ static int mlxreg_hotplug_attr_init(struct mlxreg_hotplug_priv_data *priv)
 				if (ret)
 					return ret;
 
-				if (!(regval & data->bit)) {
+				/*
+				 * In case slot field is provided, capability
+				 * register contains counter, otherwise bitmask.
+				 * Skip non-relevant entries if slot set and
+				 * exceeds counter. Othewise validate entry by
+				 * matching bitmask.
+				 */
+				if (data->capability_mask)
+					regval = (regval & item->capability_mask) <<
+						 item->capability_bit;
+				if (data->slot > regval) {
+					break;
+				} else if (!(regval & data->bit) && !data->slot) {
 					data++;
 					continue;
 				}
@@ -611,7 +629,7 @@ static int mlxreg_hotplug_set_irq(struct mlxreg_hotplug_priv_data *priv)
 				if (ret)
 					goto out;
 
-				if (!(regval & data->bit))
+				if (!(regval & data->bit) && !data->slot)
 					item->mask &= ~BIT(j);
 			}
 		}
-- 
2.44.0


Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F8C199932
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jan 2025 19:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737659443; cv=fail; b=TZVzpsaCj8fvnGLexs0cAoWKytQi2Pf0peMgN84JC0DpeNNX24PG9v2+dWb8xyPj9GjyzbUzoj7sBCvkABtY10og/9Hoc+dPRHqqFQLHOhAH+N5qjazSlSsAiW4owvKMzWrq7VkQnZsLSp7poQxlZHPmu2ZjKlRdckFPRADOa5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737659443; c=relaxed/simple;
	bh=dM78CiEF10KfQZVdA2uYOU7ee9XL53iHYCd89BEWLec=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QJCdIou0b4W9HVoeIAakxULoUnI7E6H2ERZA4ylfKIxR5Zgq9wibsnJKDRdDymNo0ORL0ghycg8K02itlQBP1qXazKHTIvQpEZWIV1zQ4K4PkGtNEBac/QBgDHOd0lcFdi+JXL7JvNxWPOluyAbj0MUdRSbGt6earYla457kapI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=M3t90M10; arc=fail smtp.client-ip=40.107.92.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="M3t90M10"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FQOZ6vRYNYTxbWIIjQgrwJ3miJu+yehBsJBCeumYhhhSYX2W9o916r71ByL7BxGqnnY/IciO99FlE5w+JxEJlD1AQpVkHi4AymcIhDK6oP/WBzg3+a7BWV8lfqdtVHBAmlI7sXTjIlYg7t/uBAzMxmjYjf8e/n481MgPSdq3Eyl9O+bRFsAXaOyGzgLothCCOW/eyKSCa762cjiv1y3U7/H2ObLMdrGT8yKiyQlFK/p7Ly+1LunjLfEq9q/WXKm/DNvC2y9UZ0iMXVcayjufaHqrKrbd6SnrQNdYJRqRHv0TzZ6/0b9JZzz0lTUpa/f+ZaCnruy8/mUVnCkAMQ7tjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i1GPICH/CsYgtTeF+91GkQrmSijxAW1UibSKEz4z7ws=;
 b=kTGLULswlCZjfzqiq1Ve2z5fOTHpo7vcuaMR1WkoIINFR+O2s7SJX8izOR/U7Zm1Ago7jIJBGCk8bjKWy6kbBo4LqDabfeym7MO8sFJswIGOYG1DnCzLo/haD4LSLLrzE57MQxkhDFG62veLRfjHrnAPVzv7BAPwxBrkOBfoKo54u5MW5jTUYh2dlLTgPOdhlbgXcIvkm7DErpAvCVJGIcPYbufDK+PRBiC3qFez0J7AouJ43XAdWZDB3CYP80qoyAJWhcPXzymrtGen/XlJSqxy+jAtYKLOvD36f6mfh8axdVxWE7fpvWwR+0EwvrEQNlSvdYDGSCd3QwSbbPutvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i1GPICH/CsYgtTeF+91GkQrmSijxAW1UibSKEz4z7ws=;
 b=M3t90M10g5uoElrukRqc/9wgNeJCc0oQ2yW2IBnQruUzpUgVIOC39G3iza7OzWrfoldJ3mhRz+Pfvy6AsR++1kBt0S1EmM3MVn2vkYpXyA4QVIIe/YCOQAjILKe1224JCi0i7iOQWhhVCOcbrnY7lZVj0s2Xf4MyLgdCDhN6pBDQuv45QmHOT95oqXPUiMYL15A9iWxLpMBW3rNIDoVq/79OZCNJl9kHOka1Ox5nuIKLW5cF6QhuPnH2Pg8FeqsONbfS15x0cGKjHf0OBghGEIyq1IDqx9PhU1IenZ7hCs8/Yto9wmKSNBiqTxjjoBBXr7xKgBk3tWjV5ikYkjI+/g==
Received: from CH0PR13CA0004.namprd13.prod.outlook.com (2603:10b6:610:b1::9)
 by CH3PR12MB8459.namprd12.prod.outlook.com (2603:10b6:610:139::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.18; Thu, 23 Jan
 2025 19:10:32 +0000
Received: from CH2PEPF0000009B.namprd02.prod.outlook.com
 (2603:10b6:610:b1:cafe::11) by CH0PR13CA0004.outlook.office365.com
 (2603:10b6:610:b1::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8293.9 via Frontend Transport; Thu,
 23 Jan 2025 19:10:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000009B.mail.protection.outlook.com (10.167.244.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.8 via Frontend Transport; Thu, 23 Jan 2025 19:10:32 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 23 Jan
 2025 11:10:16 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 23 Jan 2025 11:10:13 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH v4 05/12] platform/mellanox: mlxreg-hotplug: Add support for new flavor of capability registers
Date: Thu, 23 Jan 2025 21:08:09 +0200
Message-ID: <20250123190818.3834-6-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250123190818.3834-1-vadimp@nvidia.com>
References: <20250123190818.3834-1-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009B:EE_|CH3PR12MB8459:EE_
X-MS-Office365-Filtering-Correlation-Id: c2684960-7dab-4c0f-2885-08dd3be19bcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?msuwpdbnjoRL6OT4iTdcORGW+wcro+VTXxaloUh44IrdaBMs48HV1SDDDRXT?=
 =?us-ascii?Q?E4CI8Du0c1KzRl/orCPafA1H53msGWjzqJxcEvvCZkiJuZ1d9NQG5gfffqCm?=
 =?us-ascii?Q?OnTEx5up8e3n1LLhT4FIhDPRa6XezItZZ5N34UsN6mU9HBEQ7BwebHEmg0rN?=
 =?us-ascii?Q?ueHVYviG737Zem34uAihU/ZMQRmzdG4DJ4Mf8CHlo6SoCgXeNeR35ZgYjFM9?=
 =?us-ascii?Q?ExsbtogGUoojd4HWXqzRm+C6LPJosHFu3k6m7Nbh6zAG0qC4XMkglZ8W/LHd?=
 =?us-ascii?Q?kJhokDaalfkqQ29h4arAYAHxYIxiDztUK4aTrkVlMISW0auuy/kpp3f1J/ks?=
 =?us-ascii?Q?UTEg5gznKExIFEua52EknyhYSv3xWNMpUmOHr174QYGd16/9vG+t2dUn/cCT?=
 =?us-ascii?Q?Bz7yye67ke7Ec4PA1iuNWlBuOK3yoKZsqq5FQF0AfYP6ThMtfEZ74dgY8gb6?=
 =?us-ascii?Q?Njx1Thdmi3TW7BwOMyFu4BQOqAmm63mI1kK2Thtt0ogFWdOvtOAeuXv0Cz+r?=
 =?us-ascii?Q?uuUwc7NF/t26B9vIjKM7Oo4jdLcW5sxzz4iDU6KkPrRHZoVzSA1VP8ZOTHzM?=
 =?us-ascii?Q?FpsN+4vMaZU7/l1pZxwjv6/libTiMlZJ6K2X0I2tqhdirUMvUZWWeXn6Keun?=
 =?us-ascii?Q?7jLywDmLAcsdfvC7bijg7R20xNIfAlouX/WTgSTJnF/Sfdj8rXjrUG1QgEMM?=
 =?us-ascii?Q?SoKLRTRJ6waUsiFLHhW5TxLMPCocDiyKY3D31cR1PPYR4pkmHO3uMk+7RNl4?=
 =?us-ascii?Q?/gJCpz7RVO99OnVxkmwWcxD9x7ZCkV97+rzr2fEErlslT7b46sX9MoI9JTuT?=
 =?us-ascii?Q?rtEiiQJn4irSTY5wVYA55Lh54VTs4Uaem7KcaNHyJgf6bKgKCX2p3bnZlvTu?=
 =?us-ascii?Q?yuje3TeFtWVuLh0IGdm7bx4swD46GddfgxAxjlxn0SW14jtKTS4prI4GM5oF?=
 =?us-ascii?Q?N3cqY64VPwo/onpQCpHhG/nPmVJqQL5ofqLmgaqUuva+fFaSmozITm/sXUa3?=
 =?us-ascii?Q?VSZYo0jC5Iff7qMaJvd1mAab/5WOonLWx5lPrDo11klQn89VAX/5qg88F8Hr?=
 =?us-ascii?Q?xbhxER+21vwVxWStph9yJcdP9DoUojTHt9LymxrvBdxgbAuCKvZkEcV1i89i?=
 =?us-ascii?Q?fHuhglWNG6RrNWISmKwlH6ZuZPGD5yfCfGK+F8anZtDpEDNeQhqJthsnk1Hw?=
 =?us-ascii?Q?QePwSqqcgt90KHxy92zb+vaWBf0f1r/qOr7JH5aFxIzMrWth0iRVfcl8ANF7?=
 =?us-ascii?Q?eN8muXSQIoCsdvCQ7MssfhBsfh79WAcLlK6ePBOYw8sPDKKpPMJqDdoL+wRh?=
 =?us-ascii?Q?641otYOwhUdNj3/sY4D7pBp9jEv0QXsJcNIvNzFL9Sem/wnft4qKP7K7xU6e?=
 =?us-ascii?Q?b6ZVJBAwFlEDeJM21l41mJvjM/E2es5X8grbdVA12Ao/DJY4LMeR25877j+7?=
 =?us-ascii?Q?2TwOzRs/CKaWRzuUNQ1B3p861camL3Z2BJ23vY1/r7fHcFA9IrbcO59zH+QK?=
 =?us-ascii?Q?JNRWDdQeO2aMy+4=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 19:10:32.2641
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2684960-7dab-4c0f-2885-08dd3be19bcf
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8459

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


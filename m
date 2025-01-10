Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2066.outbound.protection.outlook.com [40.107.93.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D044B20E6E7
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jan 2025 13:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736516849; cv=fail; b=UA22wDuniEnFC9JLxqSJ/V4VmtVqOIhOiZY1SFIH+t1Xkb6JrHZz95KvKpaozElYyaWb+ISI9BRVcguwOMV6Uy914EIjDx9Ti7/7gqiE6KPwkZmKqQV3xAKoV55Dqj2aVrJZ1iO+59AAHEp7ORBLPIOwTvyCK+bKtsLoCDIj03Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736516849; c=relaxed/simple;
	bh=IkOjiXc1iM224cpCW/lai9J8f1aQa4L2Be6Egk7j86c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nX07C4B0vx9fF8Mjv19zpQ0VOzVpPZ/BN0OdRZjiO1UUjCkTgID18pL1ZsSK7cqsW+B9kEgdfwk9qCCSFRImBaMa7OvFDRVrIBbxRyhtaFAasB14HMJFABM5m5KqxNVY7hhjcAes7VENjcO5lR5Io5OxArN6kENqVcS6fwrkl2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YXivOBCH; arc=fail smtp.client-ip=40.107.93.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YXivOBCH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dRFdHbT3oOZdiqenJHrxgSRcFG1KLwWXU3JszsSFwzJduRE5AOJSrMEnyQAmUs5LiGUW3TUaRyX06EfCR/lHjIQWgN0Wlv+n9uEFfwCRFAtObnUszOGcE+bkgHG2k9NdInFQJe4mKHxCRF7Kv63kcr/UOFq0jCBeOQkgHTwHFHRMkQP5DjfEyjP9GKS98p2dEqgoWxMmT1EDtHPrXGb7mikTgf6YPHbU7dEUsqeJ1/VlEQYVIx3tdv/vFEQxCyXUmhFnIYgcq3GXp81sICGeNtBw8FiahQaBUTQT8PVgqWd78gptale5veUaUn0sGALNKaYFUa7GvRLrZXAL4UE4eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fw5+mcEDQ+yDs5KNY3g0CBzzH3tqZqrcGfGYGV3+SI4=;
 b=NRz31U5dKwA1BkkqC8467472BNbmRUmMJSbac2qZi9pAhmCGswuVc0Zyo0gb71iCQVXNZl3lFCas9YfZOJ1zlB3uXnvjbIX8HY0SQxU4E8qsN4aa+YWV5Kqauv7taB8yR3XOuqgOETR5h/iDnEFso0q+lw16fy2WWpdLzR73LeqbSRpc36hvWNV3qPJ7aAxuIo5lLk8+9c2Y8u5Y4H3zwtJPfrMFMd+Bh6bvQfo8bQsFq7bQjKqcQpRJWR3BHtOwvUpZsye7yVOELCH02pOiFLGC91JA2GaQVQR1B/JaWN/rOvVWrUoRMTva/On/YDqiHxxj8t0y0cnniIefpyo+3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fw5+mcEDQ+yDs5KNY3g0CBzzH3tqZqrcGfGYGV3+SI4=;
 b=YXivOBCHOAKijBDTNcSaZ4IgusuUZPr5iTB2EZxMHUhYxb3QD23vSQeHvrg1nSKDNCsU4K6E5EoqVROaCE4oodAJp37aFFN4031tZYT/nDWzCZUKviqsR0ATzMYO/rvLfH0FAt939PTYXmMEJzUcJ4DRrQy5aLqTsAbUxwxNfST6eNqIu29lpCGjvd3Y/tqMuGGLbbQFupXm3gzjpEN+F4i6meOBHUYJzMRpJlsaZgoOvKPZrBWs7xask0zBC2vYZUUo6aZk4srGpiaufTikluxrmHS13XcOIJp8Y0ZkVa2x4C9oIORrp7K+S0IFz6Uj1P8TtAhXg3YpbD5ajV+vxA==
Received: from SA1P222CA0189.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c4::15)
 by IA1PR12MB6649.namprd12.prod.outlook.com (2603:10b6:208:3a2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Fri, 10 Jan
 2025 13:47:21 +0000
Received: from SA2PEPF00003AEA.namprd02.prod.outlook.com
 (2603:10b6:806:3c4:cafe::5c) by SA1P222CA0189.outlook.office365.com
 (2603:10b6:806:3c4::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.13 via Frontend Transport; Fri,
 10 Jan 2025 13:47:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SA2PEPF00003AEA.mail.protection.outlook.com (10.167.248.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.7 via Frontend Transport; Fri, 10 Jan 2025 13:47:20 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 10 Jan
 2025 05:47:14 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 10 Jan 2025 05:47:12 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 05/11] platform/mellanox: mlxreg-hotplug: Add support for new flavor of capability registers
Date: Fri, 10 Jan 2025 15:45:03 +0200
Message-ID: <20250110134515.8164-6-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250110134515.8164-1-vadimp@nvidia.com>
References: <20250110134515.8164-1-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEA:EE_|IA1PR12MB6649:EE_
X-MS-Office365-Filtering-Correlation-Id: 43c77df1-3c43-4c89-b508-08dd317d4e54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YjKco0viiRw3YoL9T8LBBryVA2k1lf+62xYnZKGXrY64uzPDFPq9IIyBbjvT?=
 =?us-ascii?Q?iY8SXgLIiqY1UYUHdgocfnwh3aR/NCNze2ul0AXb2PMwu+aupJ8vRDNBLw2B?=
 =?us-ascii?Q?1oAEWjik0+sOdCyoO4JXVhSvonBpYperxnWMI6Er4+oaqqXYXwi4NMk+P/KA?=
 =?us-ascii?Q?vgm0+zUG002MDXyVuC/+nAHBgFNdSRFwgjGKKHc8KRqOhv8bz07fT6DyMgtB?=
 =?us-ascii?Q?GF3AdYBxtO9cfm5cqP1XiAcJ2T860El4D3bsGKf4Le42SYaBxBeiO8pyRqW1?=
 =?us-ascii?Q?MIbHsAJhZXb7OzKvRzinTndZTvgJAVsvTOz0Ult5ilrQNgMFLb2Yz8cuURyZ?=
 =?us-ascii?Q?GXHdkYk1pAw+vECrKCWF5oYTa7Q27boo17zmU6Efe4m21LDwuAjZN+JXrMgq?=
 =?us-ascii?Q?bessCbL6MC9lWSW9o13ASzghtdyGixAZg9rbxiHSwAro9ah6FskOXf1TdyKH?=
 =?us-ascii?Q?UlPcVNSXSi06KdcTbkFxpnnSMrcPiLMreuHa/uk7BpfkFYPKTZ+prmpvHuEy?=
 =?us-ascii?Q?2Z8P+V8K5lK1h5NyIBvO95jvWKb7ueVpA0eukl3oPIaslKHmIo9KBojxVnXl?=
 =?us-ascii?Q?50osuK5XpspRQFxefwC9fnkyIW2f4km3LZIcXoOLOWqueBO5t+t+k/8zU8de?=
 =?us-ascii?Q?uusO5ySvaAUdeeFvgvEFcxlcs8ax+Oc5g39MZsbIKbiNDvO+unoym3aIgicn?=
 =?us-ascii?Q?Wlm3vRBodqbboTZh+9GUZXNoLYq+8ZqLIEIErLWIO4VwKELCa5A2pBOi3+ld?=
 =?us-ascii?Q?TAi7GNBf66pzbqSXM/gnBE+xo7dG1qaWe9IWJeoBk9I+XYCumCRkf2/J6p2E?=
 =?us-ascii?Q?J47nZtw/EjQAhwhVnUnff40XHIgD1U80z60OS1bn6EGSPiYClq5GQjAFWv4m?=
 =?us-ascii?Q?pPccXNXB/rg6M4XEq0+NOMYmb5lGmDko7qe800tPIY4V7dVXJXk9OdmM/FxD?=
 =?us-ascii?Q?UNF0ijd+eUXblrDVSI0e2uPMGq42SZ3AJNvgvEKlVgvlMh5XFlF2VhveeuHK?=
 =?us-ascii?Q?z1Du59S+27llYNkP+7H4QyBYUNU3ek0B4NgqG7xV4WF7iYPoWCDlA5tkZCRE?=
 =?us-ascii?Q?DQRFomCXezE7QiNYGxNZD8JQtWBD3/xI9P3hqOZ0hMNhptPp9VAxLdFO6Eyk?=
 =?us-ascii?Q?D91NMB6AVfmPDrfb/GLtOJsGUvDtxSa0HFL0SlbWxzsdl5nkdiH/ciTpt546?=
 =?us-ascii?Q?hvUzEgjeUjGCLOkzBgxf9fniIY4kiU23JsqD7I2BdfAgMI7DxCLlNdhSxywJ?=
 =?us-ascii?Q?nKgT9oXeXNHe4TbLSMkpssMZWonvelVBAcQ7/QwaC/0G0fiHGwDKV1jJIhig?=
 =?us-ascii?Q?xqJA9rEo1K3xzUXon3OmRj1KwnoerfC1Go33Eyv0rECad5vwoTFMuEgA7bC6?=
 =?us-ascii?Q?IiDqrJYI9Z5RS/8iayDB+cKMGSfcIE30N7RNTQSSKCBiWEkRxHo4kk6VFxdy?=
 =?us-ascii?Q?se29miC5iFSLawTKvsQbhsN64MCON3u+baGhn529/Pt/tkh/T0D6iUoh+Sgq?=
 =?us-ascii?Q?JWhYDbBa6yaCKjE=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 13:47:20.9763
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43c77df1-3c43-4c89-b508-08dd317d4e54
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AEA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6649

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

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Felix Radensky <fradensky@nvidia.com>
---
 drivers/platform/mellanox/mlxreg-hotplug.c | 23 ++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
index 6aa2a4650367..613485c8d22b 100644
--- a/drivers/platform/mellanox/mlxreg-hotplug.c
+++ b/drivers/platform/mellanox/mlxreg-hotplug.c
@@ -274,6 +274,13 @@ static int mlxreg_hotplug_attr_init(struct mlxreg_hotplug_priv_data *priv)
 			if (ret)
 				return ret;
 
+			if (!regval)
+				continue;
+
+			/* Remove non-relevant bits. */
+			if (item->capability_mask)
+				regval = rol32(regval & item->capability_mask,
+					       item->capability_bit);
 			item->mask = GENMASK((regval & item->mask) - 1, 0);
 		}
 
@@ -294,7 +301,19 @@ static int mlxreg_hotplug_attr_init(struct mlxreg_hotplug_priv_data *priv)
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
+					regval = rol32(regval & data->capability_mask,
+						       data->capability_bit);
+				if (data->slot > regval) {
+					break;
+				} else if (!(regval & data->bit) && !data->slot) {
 					data++;
 					continue;
 				}
@@ -611,7 +630,7 @@ static int mlxreg_hotplug_set_irq(struct mlxreg_hotplug_priv_data *priv)
 				if (ret)
 					goto out;
 
-				if (!(regval & data->bit))
+				if (!(regval & data->bit) && !data->slot)
 					item->mask &= ~BIT(j);
 			}
 		}
-- 
2.44.0


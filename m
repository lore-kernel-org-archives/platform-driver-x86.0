Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2088.outbound.protection.outlook.com [40.107.243.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63041E47CC
	for <platform-driver-x86@vger.kernel.org>; Sat, 30 Aug 2025 05:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756530050; cv=fail; b=mSSbblVeJj5gFyV40DVv3Y6bhYVR318FBSf3QoIj2dQd3PVULtmFW8OP2/vb3aWqN5adj3X8YfJVWOT6IbfCCe+b5d9+7VG3/4alopBMT1gzhDxxMVSDIQ2KfxrkNLncYT0JgmudlqAuyNQ3wYtygg1iZDZzwcCQZJKqaPupCZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756530050; c=relaxed/simple;
	bh=kdmACCpNgBimmejj2nWizU/n7zYQzsxAOr/RlG7GbUA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qpsw7k9ytn8YO9zwy3SXGckVuBAzlCfb6GpzamC0S0JiPXhnAyD+PwzNlJgWc/N6BJCXEwP/BxRCiXbCWw0IdoPlSDLB2IE8kldGexT2kyisiAWlXJhBk1o4s6JrQZzmTFMu16lljSfSgrq3upAnFhc1G7ss7ki3L9p2aqfV96M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tSdR2P6x; arc=fail smtp.client-ip=40.107.243.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tSdR2P6x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lNDe8meYfhVtm5Rz3o22REOJk2YruCd420vgA3l8ReB4U8uaLBej7Df4oNYigjfgELdaGo3CG89ms2bV1UVU31aXEqCVY08yfIKqieviLrM9SwqbgrvVr+rtrtdY84HRsgUgdpiyZ11DDAS2x+74EkdPDY9fNAr5yoo5HWYmiGSEF9/BazP1KOXn7VEUMEp8mUz5TfBJTuE+iI+cuoqa+rmRXxBKuM3RPmV7E1XUonc67tUWEs1PB4hO4BBS6U3vmnPfRSBjhj+v8d/ZvjtEt7B6tw8PdGik9PEyUlOFWd0z84mjgHty9s2D3PFvngqP2ZOaOQ+909NTYkPUreISBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SObzcSGyADUqDcaiq5H3IaKEkj6i1llcRWqA/CanyFw=;
 b=tE2a6MI0J9/pvcqZLY3ddKVkbFescD/PADFpTblSWK5kOs4KxgO8ms2l5YLi8j++OOZdK7hvroZ17kYOf4O1X1c8SDaFAvAGsUlCTNUaWiHL2+ILghyf9lBlqgg6WODBLlpLAmxODh2MTuqMXMs0BljCnbmN4b5ZcBL5UVcKmOxk/uicpJjIlVlkQ5jUYn7IidbE+7B/0Ogw/6cWen1ydoKQvLIOJjt6GlDbpndb8J+vd4L/B4MTMGJCcsKWutWLXUNazP8tZD8bRgBXTwV13DH4tWjz7s112m/zkKiPvNE7tM7KiLXJ9B2BZhNTLjArjGomM95puLsPPBen0qeRtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SObzcSGyADUqDcaiq5H3IaKEkj6i1llcRWqA/CanyFw=;
 b=tSdR2P6xcTe0mMTKFipFAoD/nlqot+Sw6EwfSIoPzvG59wDjvXE0DTGnq8cb2zO/1zUaZcs6MW0PXdslnGZ2BUrtPO6MW9/P69IO9l10id9pgn6BL5Qnmuw82apnOicL3j0VxOGLgunr+bOdWYSGj2lzjHrxihadhRo+7kgaY2M=
Received: from BLAPR05CA0046.namprd05.prod.outlook.com (2603:10b6:208:335::26)
 by CH3PR12MB8584.namprd12.prod.outlook.com (2603:10b6:610:164::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Sat, 30 Aug
 2025 05:00:39 +0000
Received: from BL6PEPF0001AB53.namprd02.prod.outlook.com
 (2603:10b6:208:335:cafe::a0) by BLAPR05CA0046.outlook.office365.com
 (2603:10b6:208:335::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.10 via Frontend Transport; Sat,
 30 Aug 2025 05:00:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB53.mail.protection.outlook.com (10.167.241.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Sat, 30 Aug 2025 05:00:39 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 30 Aug
 2025 00:00:38 -0500
Received: from airavat.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Fri, 29 Aug
 2025 22:00:35 -0700
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>, Yijun Shen <Yijun.Shen@Dell.com>
Subject: [PATCH v5 3/9] platform/x86/amd/pmf: Extend custom BIOS inputs for more policies
Date: Sat, 30 Aug 2025 10:30:03 +0530
Message-ID: <20250830050009.454739-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250830050009.454739-1-Shyam-sundar.S-k@amd.com>
References: <20250830050009.454739-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB53:EE_|CH3PR12MB8584:EE_
X-MS-Office365-Filtering-Correlation-Id: 79e2fb42-9576-4c99-d3e0-08dde7822a0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RC9y0fwmVYP/2utgsvxv4TT+ihzrOWPqeLZPLWMcdvCb/dVpmYorMU+2+HT3?=
 =?us-ascii?Q?cfXdnVpaZqaiw6O0f5UyOrHn3O7hMT+UtFICo9Kf4Z6kjcFMhs66xyiYEH8M?=
 =?us-ascii?Q?wxuywvKkRFHwIxh7dl/Fm/mAdCtvbO7CxFO1RKSqOWVgPhc23EgAZcCX/wpl?=
 =?us-ascii?Q?38QItmkBR+cw59TPQmIvunUaSwIeuzUM4Lq10PSEQGJx7Ao2qtD8UA0if5Ga?=
 =?us-ascii?Q?6ybnZGxQjf+h7ACvpkQi0lCgmIH7IIyppgWTVQxkrBKP9VerRuU1j1gW9/WX?=
 =?us-ascii?Q?N5X+NbTsjJzKqQ7th6Ll1cF2TKOYRP6WSWE0q46Acu0QLseKPh5G3a77Ckgh?=
 =?us-ascii?Q?fRo+z8CRG8bSCrRR027TYQom0n8VcU6myOs9jrDTeEZ5oGdrbT20txkbTYE5?=
 =?us-ascii?Q?9Cz9GizH+M2kCOBJ4759sqYp4Tj8BCkE2vgEzWTzIJPOWMvjtWrGBp5tZhxm?=
 =?us-ascii?Q?xGbu/BeGrZk1kpD6aESFKNpDZu8t4vv/WZzyFPAeMpF3NolbASC7KHn3tLzS?=
 =?us-ascii?Q?VQwnJ5OLtesBEQ52TjEjabM+nOoEzwi/zbORUKHeICxti1NEVD64hBE8yu5D?=
 =?us-ascii?Q?ozYd1WtWY7315ZHuOW8OqDf21UnYrM2apnkfEzDeefV7aLP6zdVHvzxG8zjf?=
 =?us-ascii?Q?5YdT+aInLJwCBf2xEo+jBMC/z4747C59Y5QUC+tY8bo+MPquTE0+BCF4QbT6?=
 =?us-ascii?Q?xRDnv22xzqt3N6nh7wp5NMLyXHEuloPVdgZr4FYCc6U6mgvyO9FLkXSuVWtg?=
 =?us-ascii?Q?Jao0aooHtZWmOEp1eKpKeHQzoP6O6+0HhcRXyK96WxlT33FqqeQAN1aX7SaR?=
 =?us-ascii?Q?i2uj7N85Ffaq1FabamYMQUO+egx02sNW+IJd4P+F2OwSsTn6hixGWStyI777?=
 =?us-ascii?Q?vrM28+7fjiwGfRpGisl19QpqOcXTFu8i/dii4yBFfyebZ8J7GmhMWi2luzW6?=
 =?us-ascii?Q?uKsUTnKyZkgSawUbYKw1H/y6aBjq3EDWr5sPByU7+xIYat04BpQW/iqQyhPY?=
 =?us-ascii?Q?FGhWidL1GyIj2BxnWGwuR//X8009MxE2gLcc15U3m1Dd9OGbRRspR6uERtPK?=
 =?us-ascii?Q?TF0gQHEM/3G6+xA5OwQ4W5FW3SNF1nVluoT2xgXRRRqJxAJGNsW7X5UA6qM7?=
 =?us-ascii?Q?itXyEA5UZ9NwbvRC+TNwcpCKMQMEMnPYLuMCSCRaVWVLHuMZii7ShbP1HVfK?=
 =?us-ascii?Q?Af6mUN5p/tEdPQ8cn9RQYZYkexh15S+azAu3lduwDN7ANI4bwNtV5yiRQQbx?=
 =?us-ascii?Q?8wWD4w6531dhLnbapF+LwhuSVacC/muDaAj7i1HYg/VS8AxJF9+vGAsmRY+a?=
 =?us-ascii?Q?1l+wDvGrpPnHtOV66pxEUItOaEz1v4xwddx1RZ/gEyWrWhLPrO9QnRmdhYD1?=
 =?us-ascii?Q?U1GVfxL2k8rfswkHGOjus8NLOTt8NwwNEch1fVbEkS8aHJOEb5JzU6jppQAA?=
 =?us-ascii?Q?UjLJiNx93nhZiaZOb3a7xMYDyFgjE2WKLqGSEqYwJxVQfKKTv4dreYDUWwrp?=
 =?us-ascii?Q?DOuChhEThTSa+UoNmd6KxbvtCeGsrBgnbcSg?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2025 05:00:39.3419
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79e2fb42-9576-4c99-d3e0-08dde7822a0e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB53.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8584

The existing amd_pmf driver is limited to supporting just two custom BIOS
inputs. However, with the updates to the latest PMF TA, there's a
requirement to broaden this capacity to handle 10 inputs, aligning with
the TA firmware's capabilities.

The necessary logic should be implemented to facilitate this expansion of
functionality.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Tested-by: Yijun Shen <Yijun.Shen@Dell.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h | 12 +++++++++++-
 drivers/platform/x86/amd/pmf/spc.c |  5 +++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 79defe2c91e6..2fcdc2493552 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -631,6 +631,14 @@ struct amd_pmf_pb_bitmap {
 static const struct amd_pmf_pb_bitmap custom_bios_inputs[] __used = {
 	{"NOTIFY_CUSTOM_BIOS_INPUT1",     BIT(5)},
 	{"NOTIFY_CUSTOM_BIOS_INPUT2",     BIT(6)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT3",     BIT(7)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT4",     BIT(8)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT5",     BIT(9)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT6",     BIT(10)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT7",     BIT(11)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT8",     BIT(12)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT9",     BIT(13)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT10",    BIT(14)},
 };
 
 enum platform_type {
@@ -714,7 +722,9 @@ struct ta_pmf_condition_info {
 	u32 workload_type;
 	u32 display_type;
 	u32 display_state;
-	u32 rsvd5[150];
+	u32 rsvd5_1[17];
+	u32 bios_input_2[8];
+	u32 rsvd5[125];
 };
 
 struct ta_pmf_load_policy_table {
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 869b4134513f..06b7760b2a8b 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -75,6 +75,8 @@ static u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *in, int
 	switch (index) {
 	case 0 ... 1:
 		return in->ev_info.bios_input_1[index];
+	case 2 ... 9:
+		return in->ev_info.bios_input_2[index - 2];
 	default:
 		return 0;
 	}
@@ -122,6 +124,9 @@ static void amd_pmf_set_ta_custom_bios_input(struct ta_pmf_enact_table *in, int
 	case 0 ... 1:
 		in->ev_info.bios_input_1[index] = value;
 		break;
+	case 2 ... 9:
+		in->ev_info.bios_input_2[index - 2] = value;
+		break;
 	default:
 		return;
 	}
-- 
2.34.1


Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2053.outbound.protection.outlook.com [40.107.223.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDE715C144
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 Nov 2024 17:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730828294; cv=fail; b=RpdvRfO1K0UZVF46KSQ2hoPOmOOKR+hXpxKRFgdFZ62ApcNbwPQmnwxK2T1WMm3E1ZzKM5JdMsZMwU5AGrTiSVvqTqoHQZERYV6NefeqLnfz1MiH1e9kyQUB9HsYeKr3HCGt5/P1ALOF3gIrgWHd5Adscn2EDnBEqWxV9QZtz6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730828294; c=relaxed/simple;
	bh=Iu6YwLJ9OMVh4+XZMxtyISvpBjGAZJ1kKz6pb9hdZ+I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KZSHOPHSmIHnXJVHXz82c8Xy+yfK56LFxufHjg13tKZhWULpMC3RVNDg70QJZfaVCo6X4vHsiVu9ELUG8oYGEdvXIMQOqjrIc6Nx7VID+Su/0CC5tE6aY6dchoVEunUbTOAM9CSkOphdk50WLgmAVkai9Xr2GzmDk6Y8Y/v73YY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NhWJsI1J; arc=fail smtp.client-ip=40.107.223.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NhWJsI1J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OrU0byu+Fruls5Xic6ciQvLyNrszIK/d0Ks+UTxGy1NIi7OxgZxzifkAjuUlOWbQGemfPK1lQzCQcC6xN9iVi+uxepWZWKLxSMQpWMxIcZu3XtnrYr46YkOM4Jdw+e+C1Ug5StnkusyarNCngghyL0nDuVAmpViL220PZOsp283IrFpchDDunwSQyBUFln0P8pDp10A/61rx0ZjTUdYlQwkBGTl+i34syv5G1vKO1vUL12889uOaJ4l9+57qjonvF/+pvUZrUNJhjhS5nigp7F5umnNEc+0WIVwpEIelxh7Y5Xh/5iK9Iuh/eqPmFv8xGrY+gomPSx+yow4DAf0WDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GCjnunvn4XfJs4efjTzSEtEOXbZwaZdyAEuamuhw3Ik=;
 b=EZPQ8JsGWT6L+KEPbGv7bxn71lvq2rA0tYvMVKtXoMfuYrJs+sBcG/qZXhvQMrAec00b2aaQLOJ8yJWHBr0KY+rxjMjoSdqka2y+A8MYPpTOiMoEDDmpnvvY9yeRat5Us3PmUA+8Z2PJrgGJUu/DD6UJVY9ZcGoWQEMM58swt3XE4xLuxk4drJDvOKiGgKsX1XBd8qHjy6RozUopUu3WyeIb9YIxG/14NKK9JZujwRfcAjIWgZ1J2eivAHTgnEudek+kdnAMu0MjCiNo/Vza2aFsqf34CR9zB82q5oBc44xk34YWxYzX5YWplvOZ7ve7TIHT2DzmCj3qt4VrdKLH1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GCjnunvn4XfJs4efjTzSEtEOXbZwaZdyAEuamuhw3Ik=;
 b=NhWJsI1Jk+av5LFBgQNG1F5ZKsdHPVzKwjAjNRZm4uhOZLscMupFdlLpiMsckL5wUvlmpVQSuaqMh/aCBUjrF2z+SYV139sVbEWUbl51Ayol5RTY9pC7HYnd/dGTeEWwI72kEjbJX1Eu5Q8tYln8Tcx0jo5sYCZHLRWgvKBu2Lo=
Received: from BYAPR02CA0033.namprd02.prod.outlook.com (2603:10b6:a02:ee::46)
 by DM4PR12MB5721.namprd12.prod.outlook.com (2603:10b6:8:5c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 17:38:09 +0000
Received: from SJ1PEPF00002313.namprd03.prod.outlook.com
 (2603:10b6:a02:ee:cafe::2e) by BYAPR02CA0033.outlook.office365.com
 (2603:10b6:a02:ee::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31 via Frontend
 Transport; Tue, 5 Nov 2024 17:38:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002313.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Tue, 5 Nov 2024 17:38:08 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 5 Nov
 2024 11:38:06 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>
Subject: [PATCH v3 12/13] platform/x86/amd/pmc: Add STB support for AMD Desktop variants
Date: Tue, 5 Nov 2024 23:06:36 +0530
Message-ID: <20241105173637.733589-13-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241105173637.733589-1-Shyam-sundar.S-k@amd.com>
References: <20241105173637.733589-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002313:EE_|DM4PR12MB5721:EE_
X-MS-Office365-Filtering-Correlation-Id: ba92d10d-5a6a-430e-2b66-08dcfdc09cf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DMH4T2zRB2p1mkXJy+EYqQNcStq5kqpRaRN2jxcAPAgKb+FCXQGklA5yzgO5?=
 =?us-ascii?Q?15s76RL6DiWmwsXJf7qOasFNmuQbUj9fGpgkerJpYkkkZifDXvhaI6qiXjVg?=
 =?us-ascii?Q?fb32TSevuksHw6nCstJyJZIg2DOB8eZVx9v66tUR67wdALbM+YPdtoXgwjjT?=
 =?us-ascii?Q?aZGbihIOI+z9K0O21nb+TUqhWuPSNVphBYR/CTcN9P/Z+WFRtW51QJ1ddmJC?=
 =?us-ascii?Q?6nqoHdTXt6lCXskMYPoDhFZf2cruFZBooZ3azX2SwZZq5YqUAAo/WPRLrNJY?=
 =?us-ascii?Q?sbaU1OKw5xGiLhNBFuITj4VbNmIQqdWXgyPMQJqn82dgPsKM3tUnF1Pqevkt?=
 =?us-ascii?Q?XMpFibxSKTDa5Kr1VRTUbuj4rlgytGmjNYjUi0MvvWuCHH9DC1Z80At5gfBF?=
 =?us-ascii?Q?WrluYwn6+1911pO8eQE4q+fzCuMReoJmHc6ff8aemu8F1gIddZDp7NNqGkgj?=
 =?us-ascii?Q?An9fbZJvy/NdoMdR6VOMu23bngnvu+CI+K9kMopHcE9ZZV2S1jfNhlnlkqqA?=
 =?us-ascii?Q?sEvZ3DB5ABsUJX654Q3XkX4TsSxaYYNDPf7eCFOiZUaz+DdJ2sPW7LjKntp7?=
 =?us-ascii?Q?Trrh59uViiDn+5jSdLOqXUv376OMvexhGXT1hGV2+PGkHl7A4mTWhgwQIQuL?=
 =?us-ascii?Q?EPD82BesWwObZV9EUkZfr+n1sh+SY7pK15GjfiYTQJcaw5106S4L0T2DnNR1?=
 =?us-ascii?Q?tKJ8o3d3sb2L9V24js1ZbXNMUusp22i+BOo7S9yzQZtc1t5BUbw9/SKjkJnf?=
 =?us-ascii?Q?VYw61ZJASiZWNANsD2vllW9OFEtJUxp0Xsvv/ipXwqYw8hFDMxthydlInBEI?=
 =?us-ascii?Q?peo3BAyDAYlNIr04/yAVye8b/v08guscYtvQrGCYuobm5YGD60MXVD4vq3r2?=
 =?us-ascii?Q?2qJUMA0ztbKWmiosftoWFC9aW0EwgkVg95vYpU/N+U78aHMslZvELCq2MhXe?=
 =?us-ascii?Q?AwC9puOZuX+l516I7Aoy8NyLhHAeUul38X9PiJPiqlkPmt92LbJhX6QFiUbW?=
 =?us-ascii?Q?RRi8ZIZ4f/DuYEjYfR8KUguhnQDh6LJ3DrwOiAaDVT39yoILCwWtZ88PVzLg?=
 =?us-ascii?Q?3ENvyGo0THoRqBzwGfa68Iq2VhRkHf9qTXqX558Nyco7wx/VMtMfTPjijgvI?=
 =?us-ascii?Q?aLdp09QldUhG2rmYhtxzAlULmKE74ZKTx0dSLiIeqFv4OIsy6bWCAYG3H8X3?=
 =?us-ascii?Q?31CQFCK4qn6HgyijbndjGXNJfIZVfpBK5aFH4SruqNKiq6iIHGoHqyo40z8B?=
 =?us-ascii?Q?AF5+lzcG8aUNW5lRW1qLS8zYNnwOmeydB7WILXTvz4H29wWflpJ4pJ643dbD?=
 =?us-ascii?Q?H22u+gFkKA3U58ajDbP9KCya7y3C5W93lFl2skfD7BftW5934a2mSr1PhNCR?=
 =?us-ascii?Q?tMJUWIBVr+CSlM1mTKNOdwYj4arSp0gf+3f/FoFNOeNNsKsZRw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 17:38:08.7066
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba92d10d-5a6a-430e-2b66-08dcfdc09cf5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002313.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5721

Previously, AMD's Ryzen Desktop SoCs did not include support for STB.
However, to accommodate this recent change, PMFW has implemented a new
message port pair mechanism for handling messages, arguments, and
responses, specifically designed for distinguishing from Mobile SoCs.
Therefore, it is necessary to update the driver to properly handle this
incoming change.

Add a new function amd_stb_update_args() to simply the arguments that
needs to be passed between S2D supported Mobile SoCs vs Desktop SoCs.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/mp1_stb.c | 33 ++++++++++++++++++++++----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/mp1_stb.c b/drivers/platform/x86/amd/pmc/mp1_stb.c
index ed1723853158..f0d063b4cba3 100644
--- a/drivers/platform/x86/amd/pmc/mp1_stb.c
+++ b/drivers/platform/x86/amd/pmc/mp1_stb.c
@@ -36,6 +36,11 @@
 #define AMD_S2D_REGISTER_RESPONSE	0xA80
 #define AMD_S2D_REGISTER_ARGUMENT	0xA88
 
+/* STB S2D (Spill to DRAM) message port offset for 44h model */
+#define AMD_GNR_REGISTER_MESSAGE	0x524
+#define AMD_GNR_REGISTER_RESPONSE	0x570
+#define AMD_GNR_REGISTER_ARGUMENT	0xA40
+
 static bool enable_stb;
 module_param(enable_stb, bool, 0644);
 MODULE_PARM_DESC(enable_stb, "Enable the STB debug mechanism");
@@ -238,12 +243,33 @@ static const struct file_operations amd_stb_debugfs_fops_v2 = {
 	.release = amd_stb_debugfs_release_v2,
 };
 
+static void amd_stb_update_args(struct amd_pmc_dev *dev)
+{
+	if (cpu_feature_enabled(X86_FEATURE_ZEN5))
+		switch (boot_cpu_data.x86_model) {
+		case 0x44:
+			dev->stb_arg.msg = AMD_GNR_REGISTER_MESSAGE;
+			dev->stb_arg.arg = AMD_GNR_REGISTER_ARGUMENT;
+			dev->stb_arg.resp = AMD_GNR_REGISTER_RESPONSE;
+			return;
+		default:
+			break;
+	}
+
+	dev->stb_arg.msg = AMD_S2D_REGISTER_MESSAGE;
+	dev->stb_arg.arg = AMD_S2D_REGISTER_ARGUMENT;
+	dev->stb_arg.resp = AMD_S2D_REGISTER_RESPONSE;
+}
+
 static bool amd_is_stb_supported(struct amd_pmc_dev *dev)
 {
 	switch (dev->cpu_id) {
 	case AMD_CPU_ID_YC:
 	case AMD_CPU_ID_CB:
-		dev->stb_arg.s2d_msg_id = 0xBE;
+		if (boot_cpu_data.x86_model == 0x44)
+			dev->stb_arg.s2d_msg_id = 0x9B;
+		else
+			dev->stb_arg.s2d_msg_id = 0xBE;
 		break;
 	case AMD_CPU_ID_PS:
 		dev->stb_arg.s2d_msg_id = 0x85;
@@ -259,10 +285,7 @@ static bool amd_is_stb_supported(struct amd_pmc_dev *dev)
 		return false;
 	}
 
-	dev->stb_arg.msg = AMD_S2D_REGISTER_MESSAGE;
-	dev->stb_arg.arg = AMD_S2D_REGISTER_ARGUMENT;
-	dev->stb_arg.resp = AMD_S2D_REGISTER_RESPONSE;
-
+	amd_stb_update_args(dev);
 	return true;
 }
 
-- 
2.34.1


Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2047.outbound.protection.outlook.com [40.107.236.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D69196D9D
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 Nov 2024 07:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730964478; cv=fail; b=I3Hke3ElHRMOJUhgoJN9jX+zrJNFrQc/jfwBxFWw3VT57D1vyE4eSj5qTOXsGjeLl54NCsMgGpjAcJFZFSqTiQewRe5dMiNRTeoQmd9V69c8d6PckO2x2nPR2erjh/F7rnZBLkjRLcUKi11J9NEVIaFstWgZZBMp9DEll3cL8VM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730964478; c=relaxed/simple;
	bh=/pP3zgOqPJXrGI3XuQfUTszCxSIcckTmjeEb15xiJGA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SPGGeyI3Q+iVLYJZeB5jc+aYVlTxquEdcnP3nlrDyaVASNNLtiz1ilzjYh6V72Rz21gZQ23HXIVDH45/X+e305uzRWN5d3AaGCX1j/RwzW+xy6Rt47WoMQubqJpVqN25xIlDdoyE03zlYdcK8z/LshnVb/7G5p34dsXihoIAQyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qExGrFfz; arc=fail smtp.client-ip=40.107.236.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qExGrFfz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c6idnzA1bwEE6sd8KtsVa1bQfMbaCaNIpXe49UY87xu3HCqkfADh1D80c3i4qUkmSog4sSSqBf78/mDkyMHByjtBQf+Q627Rger8ZpeeRqRUcJlIWHTUKmwfa6RU8XAhUU8QJgYQVEj5W28LvdYjDqlQuORK9NdWuSwoNZLalCEN0x2KkFNvVUT4Zw2AHFbOkifmYfQuUkwHh6oSnPPiYwzH4xcts4xcFh9zROqi3P4CadL5Uyx91PtU8dBoycrtQxyg+NlsEuwnat7DfeoKD1qnnSmYQtKno7pQJ4Kv5fd2oXAQcZbe/kyREAt8h9uxyEwPvkbj3yf54g/EZ9FVnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ANLe2AzFf2d36GQZwoiuD3S55CjPJwmYcGPf6jjU1Q=;
 b=o7wvhJOIckNvTeSytLWEnbr6ipgWFVaa6SUC5PA9K7eVt/HxzdVkbr3J0CuOK6jPSepMVIa/3nEmqKxXNUSEbbU53SeFfO0QaV3ckox8kF9rPyTNoZz3/IbHG58yI6Fvsr6FFKpi7QQdSvMZZPEws8yC68anYIUZ2dXN+nnjH+m+4TXqdIbB1YytT/LKbiJZ8hQg/liIXrB9Bo22/t8egHCPjxDMo0afzaN5f9MvO4cctgtZoeybRvpMnUK88tRmmk+KNtB+sUcDHtbG1WPElTCMDnaJrG9/lHrscV32s4C4R3TCi67MYdYk549xa/QJ4NCaQCT1aMQ29nu8GxIVBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ANLe2AzFf2d36GQZwoiuD3S55CjPJwmYcGPf6jjU1Q=;
 b=qExGrFfzzp+1ZmdMV5QJigHZRs2BG15jZMMHrCbPGHMjzraSCQhd4xk5JwIHKcIY/DRlcEIkVEWL1GWdwwheXPTgjEPYrYm9R3eC8kujjxbdjgm/MFF86NvLtklkPv+yIzgHa/xCNMzgXMMcigXTsMaUscQMc6C3jX+inwxttL0=
Received: from SN7PR04CA0154.namprd04.prod.outlook.com (2603:10b6:806:125::9)
 by MW4PR12MB7141.namprd12.prod.outlook.com (2603:10b6:303:213::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Thu, 7 Nov
 2024 07:27:53 +0000
Received: from SN1PEPF00036F42.namprd05.prod.outlook.com
 (2603:10b6:806:125:cafe::d) by SN7PR04CA0154.outlook.office365.com
 (2603:10b6:806:125::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18 via Frontend
 Transport; Thu, 7 Nov 2024 07:27:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F42.mail.protection.outlook.com (10.167.248.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Thu, 7 Nov 2024 07:27:52 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Nov
 2024 01:27:50 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>
Subject: [PATCH v4 10/11] platform/x86/amd/pmc: Add STB support for AMD Desktop variants
Date: Thu, 7 Nov 2024 12:57:13 +0530
Message-ID: <20241107072714.943423-11-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241107072714.943423-1-Shyam-sundar.S-k@amd.com>
References: <20241107072714.943423-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F42:EE_|MW4PR12MB7141:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ded350e-b02b-4d53-6e33-08dcfefdb0c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oagklkoZBBkdQ3Nx6/pwU12Pb0TRfVuZMmKJWVV1pHoWxmMe3yXvz1VODUgQ?=
 =?us-ascii?Q?yiCkTy4zzC7XcAaSo4V1KCQg+DWPyA6zmP+ywozKZaZhZlea1WBJtzYYn3dZ?=
 =?us-ascii?Q?/EjICHMibmxShtVFmCajQIDxvG8+Zv2LXsj1agQjtgxPuCZ4sTQGa9+NQb+4?=
 =?us-ascii?Q?jXIRTsJlfwL77RO9gbjqEG2wzF/hETLdBwtdmZEhQcmNw8mWIIiu/eCT1w+d?=
 =?us-ascii?Q?HGj1mZbbcJREjlrNW8/1qwJZnqK5p4IYeWs7sMI6vhoyDiH4KCx+rsqbYuQw?=
 =?us-ascii?Q?YfKGIFvxsiSX/bRhwkj3EiIMrWQJSvfN5dgcqVvl4LDJexBsS7qUVCS2C+V4?=
 =?us-ascii?Q?CPzq5uMvI/CuMDpGzEnkN8xsUbfvl5JXY1g7oHkhlHuN7R8CBh3V6HhM8f5H?=
 =?us-ascii?Q?hFG85R90G9g7KYCL4WvffI3ca3MefeIgJtiCEadDbqKVxRAmMotE7+puoD23?=
 =?us-ascii?Q?JtkLCqgGnLttUfT++t9Ps/LDDvwZwG+tcAVbZxbUP7FJF0wyk8wir/WO3C9M?=
 =?us-ascii?Q?QVjSgziGG6Nf5vMjFj5OTYX8zdN5KiONmLP1eBQoh+5o7zi144JrmnEHhZN7?=
 =?us-ascii?Q?r6+JPnwsnXHbzNWQZsRJnLj5o0dnx185LTUYQarZDjS2vE+xy6T5RVcJiWss?=
 =?us-ascii?Q?qjRXQM9RXLf7WWSxY7ecCFCSAHP1zRgk7xM3fI9jDdIIo6IEhh2hmHgwn9ba?=
 =?us-ascii?Q?AhEy+YNi4UAXnOwQ1L0IN+AF3+d00jg+KdaLyUzhedajwsmt7f0jgHar83Uu?=
 =?us-ascii?Q?NsVHuBq0BKQn3vtlpxZAvsRJK/DQqOJQZVMLnOpWsXvWZm+T/ojkvriWX7M5?=
 =?us-ascii?Q?hqJvo7OtobWDRWjPW1o4DXqGEmua/GhbmBeUSP9rTOeekce9Z38qsr/iu80y?=
 =?us-ascii?Q?5/NX9ikuHWqHalVckFrPuQWCY+LVe36qi7gDZQhtiEP26ZIsMqB5p0SNk9EN?=
 =?us-ascii?Q?T7icjbqAFFYcU+nwoZ4gjYSgvrTY5U6nOrjqBq8Mxmux8UTmc9+DPjQKTYwu?=
 =?us-ascii?Q?A4E46hlnZHsyYkOqnTMuW4caFr6jZp18VpOqqlw4/3Fk3WpOUZ4D0b5xYzYH?=
 =?us-ascii?Q?s1SVA6HKjRcpN57y/WxWJDsc7gb99Z+bK1JO2UVypeDgjnxg/egVwS8DJvar?=
 =?us-ascii?Q?xkvD653q9z5Lfn3bjLJwY7NZcFXduwKOI7Ja2K5akTBRNjxkqAKmAjwlHHZw?=
 =?us-ascii?Q?Im31nRNAmY1WWRiTnFO7CZZPikWcGJNDRmmBad01IMDUri9xFL53TDlgz7CD?=
 =?us-ascii?Q?pYarysh3J+APGCyyX5no3+ARA1CbxfP2wjRJ4buLpkc88FYNzFMeMjx/8yyy?=
 =?us-ascii?Q?bJHDZDJCjAoxPBt3MpR7yrcWEMX0b/FfJsyFGs/GoQd9Tpiy4HoCN+CjyZ4e?=
 =?us-ascii?Q?R3M+RsbSZzFD4tcRYPzCbb5GkNOip8O+enro/zFE3JgZ8sfGHQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 07:27:52.5002
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ded350e-b02b-4d53-6e33-08dcfefdb0c9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F42.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7141

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
index d19a13a82e1e..c005f00988f7 100644
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
@@ -233,12 +238,33 @@ static const struct file_operations amd_stb_debugfs_fops_v2 = {
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
@@ -254,10 +280,7 @@ static bool amd_is_stb_supported(struct amd_pmc_dev *dev)
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


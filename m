Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A335A7AA
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Jun 2024 08:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717402553; cv=fail; b=ZX2LvgXWxKK3M+RLBFIQsTS//C++EtIhl2PQPqg7MMSdb8PS+bjR4RsldSPOHV73JK4N8i0ZqtyYxaMvDd8Iwq6MtzM1r6TLwc8YkinwGinfYz0iXSBnok8FRe7Nh48s8lZfh3yx9BiN34WByeFtCNeCB4N2Oogy1Lbfi/7D3Tw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717402553; c=relaxed/simple;
	bh=DsGohvc91u4aYjpHHUnGsXlSsy0CbLHsD1y3Q/gMIIY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OjY7flaeKvfPiBJv8LgyhYhLTAyQeNH9Ze4hDusq18fVbbvu0wqXJz2yQDwn1faJUwJPxoJFLWj05MI6mwZM6uL34qKhOPIi4gWiPBSe/kVtds0/lm7csVqiCKwpICl4ixTVAUITMZ6HZEDASRvibI+hbeBo3VW+IirfMbSM+Mg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZulDlRRF; arc=fail smtp.client-ip=40.107.236.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZulDlRRF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n5bwocecTsBwpRYWLsuc1Grd9C+MpEjeM6mdRtf3AcHAYVujla37g0tSCGJmGvXwJkzbBXyoFeu3R2Np63wKwycK5FvIxTR4bLqRqC2xUvEm/Uj1Z3QydAXuIeKt4KgPs1fpqDpMzamx99fAl2vgaPshkNtyIRRzYp7O938TIPmw6YaLNrZWrPX1RD/wdAtqRCfaXUlfL2HUJxoArJhwITXtMohr397qy1Iuo0+EQufZA5e0c5tQFOL9b4YlTeNsTlqkKUhH0Y1ZuOe71X2nra2YtAu9YjKC2DcgxKG5sQQgRwfHT3SYhuHEL3zGVTCaBpeFmMtvD6wxr6j3nWLaVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OaqmnICP3p0Yf0Cnhna4EU2SKq5hvId8PgrkQi7vjSA=;
 b=F4k8H3a8lHGfN5BtvDxb+AKiyUxIPhChWf4tzjgxbJNfJgPAydsmKewNLN88dm3oGAM3JVZJxV+9ZsA0KwZ//HpShtLTfAtw8Ze8vHDuE/1X5dS2WoEY2z9aQ7sknbdC7n1YOlA/wsKlOvTbCL1WHd/PcYNWFAlWf16esed7NXGh3cb06ve0qGOaI9O6zjS5K11wPYENXfx4ciw3x08a0SZ5VkER2iFerm+OhALKdHTbHADCi0ckUjDkabjBvQvWekRZsSfB3a6ncLtOslgTZTZDdCztsgV2veC+42S4BBDkmmAmKsCSslCoj8vWmzPeVmjFuyUs31nYnZZwIftVCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OaqmnICP3p0Yf0Cnhna4EU2SKq5hvId8PgrkQi7vjSA=;
 b=ZulDlRRFvkFSUpchU2OSeA9WG+mRTnJj40wzByUh82bwmiD7gjpBmjASjPOJnvPqI4NHWAjP0f4O6Ag73D9zhAX0Wu4Wk28ZjG5msjoOCzfOOyTQhEO3BMysi80FtP7XWou+6nGXeMyWdcWof1VdBwCkdm4IXkaCJeJAshjgSIU=
Received: from CH2PR11CA0030.namprd11.prod.outlook.com (2603:10b6:610:54::40)
 by MW6PR12MB8706.namprd12.prod.outlook.com (2603:10b6:303:249::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.17; Mon, 3 Jun
 2024 08:15:48 +0000
Received: from CH1PEPF0000AD80.namprd04.prod.outlook.com
 (2603:10b6:610:54:cafe::ad) by CH2PR11CA0030.outlook.office365.com
 (2603:10b6:610:54::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.29 via Frontend
 Transport; Mon, 3 Jun 2024 08:15:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD80.mail.protection.outlook.com (10.167.244.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Mon, 3 Jun 2024 08:15:48 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 3 Jun
 2024 03:15:46 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [PATCH] platform/x86/amd/hsmp: Check HSMP support on AMD family of processors
Date: Mon, 3 Jun 2024 08:15:12 +0000
Message-ID: <20240603081512.142909-1-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD80:EE_|MW6PR12MB8706:EE_
X-MS-Office365-Filtering-Correlation-Id: c439bfed-ed90-4b91-0b0f-08dc83a5600c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|376005|82310400017|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?leulHwFa1RLhPi2wcK1cHB5Pcqvqmj6eyEk2cfS66nTk5LXGiYDnePHR9eLp?=
 =?us-ascii?Q?xbUYnqV6CkjjooWhqmNup8n9IvdfgMiESYH437XcpmJO5udq1H5FXL3ukIGW?=
 =?us-ascii?Q?+IBSzAa9sHW6ZwJi7ZUl1yOeBIcj9BtLdm0tA6S3YkIctU1vSkmLHtkiWHgQ?=
 =?us-ascii?Q?dNG0ze5eGg7HtqK7WDXmQ4vZFZkLNo9sse9cq/3laFq7l8069Bms2FddcqBv?=
 =?us-ascii?Q?p4+/A99i1EIg0DAXF4bYM2gIQimeAwTiAKzwZbWMca6r6bJOLraM61ajGOpw?=
 =?us-ascii?Q?XtxeKzylwO5L+j8u51K4zR+B9QJOhaAsd4SBcOI4Dfg/3x6VKLrjWgbA+61O?=
 =?us-ascii?Q?xx3y3IHEY2Hm9GmUmsepxfyRxaoHrcmNZs6QAPoTneQ1XDVkeJ4nocnazFIO?=
 =?us-ascii?Q?tJHN9Ro5h1se5x8zEVKCprEDrxkdCU3ptGI4mpVaARF1Uc4gyv+QUv6tTfah?=
 =?us-ascii?Q?Y/LovfQA/h4GoFivtNisFSB97bM4FhdvhddWPMhfh3LzQUomNuOJ5UOEnlNV?=
 =?us-ascii?Q?P1GmzDV4+iC+/YCyxCu/WczghuNDgBNAwEtZXULLUIhm1YKTPGKDfCkzahO1?=
 =?us-ascii?Q?ysvil2gEl6EHRemxAzfB1YchA5iEHo18WW+0PPYBoSrOvlwNF2Ej/ZFxklhY?=
 =?us-ascii?Q?bS9LlExfBaTslkU6NghYH92TNymeDYFCUzhn/r4VRXC1wlK6v1x1Tvt2TfrP?=
 =?us-ascii?Q?X/mpuJeBEKFD5qNA/BpKqsi3WvMB7ynoD6IyIg/NTMgrnaj3c/3lzBpuZtxT?=
 =?us-ascii?Q?L62lqlzIcQRsh3Eqcrrg+MZCS9Zm4ZZmIE5cFg7XSbHpzQ8TSp/0Pu2KL07m?=
 =?us-ascii?Q?VbcuffALzFOkH7N1nhzaHunJF4YRtaXv0HcEoYDBJ/3TncpNaee+/giH53Sd?=
 =?us-ascii?Q?kZ6Sc+0bLc0fLOxZK2U+r+qHIVuUPZ7Zs6KB2VCIv7P6TlALlmYZI43DeMuM?=
 =?us-ascii?Q?k4z70XtZp9n4USH5uKAwL3vNmmaZP1nXw2yoDA3RWjaa+3XRwp/XkW8PEmac?=
 =?us-ascii?Q?SV3XexgV62ZymDezDB9uhsnNO123l9s9lAjso689ebN3dkdnfYaV7cvmZu9n?=
 =?us-ascii?Q?3h924IW0Mug0Oq8dbt0NyBm4RcFRCSZliOYO131x1IxkkfQGy1M6uz3ScCKf?=
 =?us-ascii?Q?06k+ynECkh9w/f4jMcGOAYXHJz7zL5f8lSNqD+0g+1F5pMIbjVhTKM0Rne2m?=
 =?us-ascii?Q?LfRr73ZhhYWNgrR4FE82+nL8LAR+WP4nuHJnox526WZBTrKiCkD2Jn77LUx+?=
 =?us-ascii?Q?L0XJmW613ZU/A1ffZHZ5yv7kiT37mhA+dY834XbgK1M4WeqtvA66tC4ml/iH?=
 =?us-ascii?Q?oDaliK/uTgieZZEzo4AQ27Czu3ZGkrEA4qh8Uav664qO45VSLSWG66PKuLdQ?=
 =?us-ascii?Q?pHKDOw8olBrwCxzxg9brXarWVeC3?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400017)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 08:15:48.3387
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c439bfed-ed90-4b91-0b0f-08dc83a5600c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD80.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8706

HSMP interface is supported only on few x86 processors from AMD.
Accessing HSMP registers on rest of the platforms might cause
unexpected behaviour. So add a check.

Also unavailability of this interface on rest of the processors
is not an error. Hence, use pr_info() instead of the pr_err() to
log the message.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
This patch addresses review comments from Mario Limonciello for 
"Check HSMP support on AMD family of processors" patch at
<https://lore.kernel.org/platform-driver-x86/20240423091434.2063246-2-suma.hegde@amd.com/>
Please ignore the patch "platform/x86/amd/hsmp: Split the ACPI and non-ACPI code" in the above series.
<https://lore.kernel.org/platform-driver-x86/20240423091434.2063246-3-suma.hegde@amd.com/>

We are working on addressing Hans comments on sysfs patch "Remove devm_* call for sysfs and use dev_groups"
<https://lore.kernel.org/platform-driver-x86/20240410121746.1955500-1-suma.hegde@amd.com/>

 drivers/platform/x86/amd/hsmp.c | 50 ++++++++++++++++++++++++++++-----
 1 file changed, 43 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
index d84ea66eecc6..8fcf38eed7f0 100644
--- a/drivers/platform/x86/amd/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp.c
@@ -907,16 +907,44 @@ static int hsmp_plat_dev_register(void)
 	return ret;
 }
 
+/*
+ * This check is only needed for backward compatibility of previous platforms.
+ * All new platforms are expected to support ACPI based probing.
+ */
+static bool legacy_hsmp_support(void)
+{
+	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
+		return false;
+
+	switch (boot_cpu_data.x86) {
+	case 0x19:
+		switch (boot_cpu_data.x86_model) {
+		case 0x00 ... 0x1F:
+		case 0x30 ... 0x3F:
+		case 0x90 ... 0x9F:
+		case 0xA0 ... 0xAF:
+			return true;
+		default:
+			return false;
+		}
+	case 0x1A:
+		switch (boot_cpu_data.x86_model) {
+		case 0x00 ... 0x1F:
+			return true;
+		default:
+			return false;
+		}
+	default:
+		return false;
+	}
+
+	return false;
+}
+
 static int __init hsmp_plt_init(void)
 {
 	int ret = -ENODEV;
 
-	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD || boot_cpu_data.x86 < 0x19) {
-		pr_err("HSMP is not supported on Family:%x model:%x\n",
-		       boot_cpu_data.x86, boot_cpu_data.x86_model);
-		return ret;
-	}
-
 	/*
 	 * amd_nb_num() returns number of SMN/DF interfaces present in the system
 	 * if we have N SMN/DF interfaces that ideally means N sockets
@@ -930,7 +958,15 @@ static int __init hsmp_plt_init(void)
 		return ret;
 
 	if (!plat_dev.is_acpi_device) {
-		ret = hsmp_plat_dev_register();
+		if (legacy_hsmp_support()) {
+			/* Not ACPI device, but supports HSMP, register a plat_dev */
+			ret = hsmp_plat_dev_register();
+		} else {
+			/* Not ACPI, Does not support HSMP */
+			pr_info("HSMP is not supported on Family:%x model:%x\n",
+				boot_cpu_data.x86, boot_cpu_data.x86_model);
+			ret = -ENODEV;
+		}
 		if (ret)
 			platform_driver_unregister(&amd_hsmp_driver);
 	}
-- 
2.25.1


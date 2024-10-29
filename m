Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A87D195FE8
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Oct 2024 15:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730217330; cv=fail; b=H0RR/TsRWxIBozt1Gh91iX/CQBW5cMm2HLnjkojz1JDEOp1PP8MpmWwDWLUYycSWUXqcXXKTcvWNwkjXBDTEh7MI0W9mJfos/hjLHGtbPZt0TxjOb8jY9jzbR5XSSVFT0/8yA4V2RnR7poao4YFJOIMLaIU7gAiI/VhoyfjDgCE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730217330; c=relaxed/simple;
	bh=y623mwSs31Wb0JKe1s4zSKBsdBc3t3XzwNocoHyCPpc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hB9sk+8Rgp4HzZ6xj1la1+vDhVPRtspPWPugQrZupfT5p/amcMUKn+ZMnThkhx+S8AhxpAQ4VcTj0RfORASZZVvqZT6wNcLeISXwO2ZduW+M0y031AtR7kJuegXm+OCfQ6aWWvfzoK6ticA4vyJAo7y7Gp66LVA7xhs0ZUvjfsA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BTKXEzU/; arc=fail smtp.client-ip=40.107.92.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BTKXEzU/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YgQiU70MJM1VoAKhtET3Xhdq4nkqt7V2IFQiDhLeggqzT1KtgNhBsxwCxHwKBVYYMcMCaFPg1/UER+ZNrQxGoh07jW7IFLks0nnZz+vOy49aSJYu4AyeRvWkwTDWsdqwFPeFtOAG5OFyW1vHxw40qmfNAmcrDt6oVmBlxUkFuiAvGc2rDT58HoOgmre8kIpBxcPgl88Zq3tQ8MnlwMI2hKrdLXviyiYR72x5zK01aV9ZJ8LgqhIJ/QvxGWmG+FbbwK1RivDDt7RKUGqRzL7l24InVzzfGZQ9ogdbEbZT55qq0Jvj3Ug50K6QqOs9UEj9o4fWRubJXzJfMVK6HPGLKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=71/0rAfMtJbL6TtDByo2rJ15jkbgO0FqWYI6DvErQ+w=;
 b=vRUmLSVjN3h5pY1cNha0gNTl3oklYF3/lfhQOqNDrhG6xqrskwoUxs6OMzuW9St/FKfMjdsRycPd8GPKw4NKAlf7h3+QPqBJRZem1zd7Tk+tM4HB7bpAFZwcu0hAIbh0NNJX+OtaByCdrUi1BDLUUIFRH2pg0e+sVpz89HR/IAk7NutEZTIWC2S9GMMUVC3h9cmTCvQeKz+wuKFXKOxGGC6gF4zDx8IbC2Jo2OVmaUMRWeE1h3uuHspcUtqy1uL8pOFdVlTahZeVp+Fwyh0uYtHwgCm1Tx3eoDrQoO1esyZXnuF0Gqge+j3Vl2JJaTHqFdKb95lTHgDJEt08J+e0Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=71/0rAfMtJbL6TtDByo2rJ15jkbgO0FqWYI6DvErQ+w=;
 b=BTKXEzU/OfRRieiteuPeVBTna7d6VgJXMVAl/q0oCJqcaLJz4Djzh/LlCGw+bjAPjLDZdnS+LTkvVvuOKeBtusXfJy0r1Z/Cniv1JCojxmN5aqd9GafnxXV5sPHs3C3bBijYBdRqP2TJX8RAvp8E+baliH0ep0105BP8I3treb0=
Received: from BYAPR08CA0010.namprd08.prod.outlook.com (2603:10b6:a03:100::23)
 by SJ0PR12MB7457.namprd12.prod.outlook.com (2603:10b6:a03:48d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Tue, 29 Oct
 2024 15:55:23 +0000
Received: from MWH0EPF000989E8.namprd02.prod.outlook.com
 (2603:10b6:a03:100:cafe::61) by BYAPR08CA0010.outlook.office365.com
 (2603:10b6:a03:100::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.26 via Frontend
 Transport; Tue, 29 Oct 2024 15:55:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E8.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Tue, 29 Oct 2024 15:55:23 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Oct
 2024 10:55:19 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 7/8] platform/x86/amd/pmc: Add STB support for AMD Desktop variants
Date: Tue, 29 Oct 2024 21:24:39 +0530
Message-ID: <20241029155440.3499273-8-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029155440.3499273-1-Shyam-sundar.S-k@amd.com>
References: <20241029155440.3499273-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E8:EE_|SJ0PR12MB7457:EE_
X-MS-Office365-Filtering-Correlation-Id: 5560903c-e89f-4ab3-8584-08dcf8321919
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dyTCdhtWZAvs5DcOc41pZXFwFxeWfwtWaRYOPqBzPaBNGy/SNtR/3jAp0aK6?=
 =?us-ascii?Q?MlIyIUlyZsipuYplnUOnh0+TvvqI3yLpB1yc9oqclItKIv6GwIdEF8FT+4qJ?=
 =?us-ascii?Q?DupjRWlAHjbwr7Rk6UzXixsGc0XDoEkH6bW2onn1zaIrhKasrM82tmYJOtw0?=
 =?us-ascii?Q?fcNHI5NBzWJ5CRfCLL6aSspXeT9PvhZKeogrzpeHPOQ7ayXr1NC/aIvkbN5D?=
 =?us-ascii?Q?Pd5AVSqyGsyunC8NCFYR+Vl3zr2avuWX/N5X1j2G5jrY0ds5T1n9pPa/1EzJ?=
 =?us-ascii?Q?6pAq8HJFyyiYR+cFW0pMR+4fA0AcRP2MscaD/RdWJGqtZvH72kUxSZff+akP?=
 =?us-ascii?Q?Gj16wf0ElnO9HcEcT0QWWVKhQhmYfD/H6MECCNR0g0en/slX3QSJMob16Jyz?=
 =?us-ascii?Q?azNuJ4JRgU56tsQT8C4JM1F0YKxpjsTYP3BXvOmgvzcMF0GWF5eiYIMLolJG?=
 =?us-ascii?Q?WpWxEw3pK9qLaQig2jC+7ZwH+cO5wuhQarLlN9ofzJAcSNqlCutCfCdQV7aP?=
 =?us-ascii?Q?7J5ctdV7gUoVJ2Q/oBqj4b3J2WzBZE1qRA0/OBmQmFCs4z5OREywDzBDVhs+?=
 =?us-ascii?Q?5AMjDZDS4EeAhlLXuXXIPb6LMenokQO9tJ70VkpGpZOjDQg0HGjOvlphC6GI?=
 =?us-ascii?Q?3+FFgfcRGkKpA9SCl6Ax3UUDnhPGX0ARDoPXsgeFL6HB0heXaDhYvodnbKPA?=
 =?us-ascii?Q?o4B52KnlMBcb9z6c98W8aSga7aAVlSEcexo76l2NgU+iJWp3ZqRZTeP/daWt?=
 =?us-ascii?Q?8ApHW4QmaME9xknQMP8hB0VQ2FrlIJfN4YR/dTFoECX7ZBYAKuDbRijqN9BA?=
 =?us-ascii?Q?81fN7dt653s8W2kr2XzAMCy5rAXNlwq972EnKDi1aol0114jwFQsc5dvxETt?=
 =?us-ascii?Q?rm861gKhtjg/hi+3i8uBpDWANkidX/WCC+0F5CfNY/DhLmJxnrPFGbc12IGM?=
 =?us-ascii?Q?iI7y3/PubSv2pQgJB2/rOt3s1i7Z7seAiIJwWbPQvazDxTIvoRkm9gi5uoHY?=
 =?us-ascii?Q?VjKCBIh6JGN2BOcVuzc+I+Pieap1pu6cBZvo8N9GImc2Kk9Iqk65hcWuHBpm?=
 =?us-ascii?Q?uLp8R0riLkwjEJrvfHVL4nXrrwjTRBjBzes4Wb3cgzgrnbqPmDL2/yN7FH0m?=
 =?us-ascii?Q?Xo8wmn1btWkSIm7Ef3oG64ms/+uc6xmwuJAQ0FyXBQs0yhzJNf93U0JMwwd5?=
 =?us-ascii?Q?vfCtr5YAX+n63ZE85uGbo0CC3xGzB1uKVAnfqrhNZ19SYi7mnxf35cw5HEdw?=
 =?us-ascii?Q?0NtUJN5AH/xvxxNuDenWX9eRc6wz8N0rMWTM1jE+XlIpG8yE6v7R4KBcqR0n?=
 =?us-ascii?Q?P6vL0yQGc9m8Q4G33tEr8xRylaVl7/b4JhBwfPYiib9foKzllpz9hNLwoS2A?=
 =?us-ascii?Q?NJMaRsWC3qwzFnOeM95Y51ABZg+0vSk6NYYo0Q24XXyR3ozDtQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 15:55:23.1361
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5560903c-e89f-4ab3-8584-08dcf8321919
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7457

Previously, AMD's Ryzen Desktop SoCs did not include support for STB.
However, to accommodate this recent change, PMFW has implemented a new
message port pair mechanism for handling messages, arguments, and
responses, specifically designed for distinguishing from Mobile SoCs.
Therefore, it is necessary to update the driver to properly handle this
incoming change.

Add a new function amd_stb_update_args() to simply the arguments that
needs to be passed between S2D supported Mobile SoCs vs Desktop SoCs.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/mp1_stb.c | 31 +++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/mp1_stb.c b/drivers/platform/x86/amd/pmc/mp1_stb.c
index 917c111b31c9..6a3cfcbb614e 100644
--- a/drivers/platform/x86/amd/pmc/mp1_stb.c
+++ b/drivers/platform/x86/amd/pmc/mp1_stb.c
@@ -36,6 +36,11 @@
 #define AMD_S2D_REGISTER_RESPONSE	0xA80
 #define AMD_S2D_REGISTER_ARGUMENT	0xA88
 
+/* STB S2D(Spill to DRAM) message port offset for 44h model */
+#define AMD_GNR_REGISTER_MESSAGE	0x524
+#define AMD_GNR_REGISTER_RESPONSE	0x570
+#define AMD_GNR_REGISTER_ARGUMENT	0xA40
+
 static bool enable_stb;
 module_param(enable_stb, bool, 0644);
 MODULE_PARM_DESC(enable_stb, "Enable the STB debug mechanism");
@@ -239,12 +244,31 @@ static const struct file_operations amd_stb_debugfs_fops_v2 = {
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
@@ -260,10 +284,7 @@ static bool amd_is_stb_supported(struct amd_pmc_dev *dev)
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


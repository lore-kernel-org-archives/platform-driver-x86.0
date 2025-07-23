Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2059.outbound.protection.outlook.com [40.107.244.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A4826E6F2
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Jul 2025 06:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753252919; cv=fail; b=SC6X0W6QfgbtdKEHauu7tYSJgE4TNGzoeDyUbzwGybAULrKQ/tTxG9Dr1W2mBLKkCJd5gr17gzA8jSC+ZclVJ58gei3eqoR1vTcepoQu1ZUSOdH5neYVPSKvsjix/UxAaXSnP3Y9WznLWMyE20yLATZeq8UUNlbQK1HWPeWNkug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753252919; c=relaxed/simple;
	bh=ntCRXp34b38F/eWhuwDyn+4FgX3ms6aRhHPTIfOor6E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Trn2mjuroKa1Up9UV1f103PW4kkjiCalWJfzb2V8UnusGqBZZNc43mj5a1WhkgA2WdaEaYoc3tfpnjmfD9BdMe33zq2QtQgpwQuqhRzC9AJECsoJrUTfXItGzQiWOC7vuT3hkFpFqd0Y4jAiBYs1sNyQT8pXSH+dbJajzHUU4yM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HW8moF8b; arc=fail smtp.client-ip=40.107.244.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HW8moF8b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VqzaFCnu0BoKv5ah+rzDQUi309JrUEaCWt2ZhFW+U2LhW/Mz2R1ZKohl1StudIKr/KGFeoAQiNpqyGzpi4TkbtjOvgSHlPCittxz6Zxj5f/JotbNF5IcIDJHKqWv75dBmDCj0aoYpKLEM6Ktow2TJQKJNc6ooliMvo4i9HB4wcc3idonjZZKUSBdJ7nnSPE8w3m300Y9bs+V57V9Q6wiava3lr1lp5T6FnqUJ62m3cnoYfNtM+xO4LpG0C1BuxJ9jgNGasH0ycQzIZM3JmWuH9sCM/tm/4sMfjanxaFzGDQ8V3uBin9gO1VXzDJBGFAgxxic4WD4Za6Wdr/e7TnzlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gxPNGdVnCKjVwSFtMxciHTLyVhusUnABeYbbAijxk/0=;
 b=RnDKjKx/zV1J5yKi1HGzDUSWpGDtz6ieCp9AcC1fOvNqwY/vhk5QLe2pNo1x10uG+OihN298eliwW4JRcppbeeV1p63ogj2ftMjvovOaAe8K2bTZjyhVLu2uc23pW4OKwQ5nOxGH4spEKfvdWT/CWQIteLBa31xdRm0t+XWNKYVHxw/4RoRl3BBcR3N+GAymemhB6n/GTI0SGjaITPAOJQqv2AEckiNd2/jJiSfRyFs5OHARYEi7Z0raNQILfmjR/DRA8S9sz6xW/UtAI9ijKREA/IQVDblzdn+ylJWq3NZ+97cmtj6Mrztho15NedId5Tkukrh8lB8B1TVvaIDtkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gxPNGdVnCKjVwSFtMxciHTLyVhusUnABeYbbAijxk/0=;
 b=HW8moF8bHIr00OpapVBXyqySWt8FlXei4Q0UjnJzo2GVs/pmCtBXYV5EoB9FPxTafo5LpVW8VeSnUn16ONZ+102BrqkmNldMCIC5LSartgk2nnhcRUVCVKW1JaZiNd3a72qcmKNyEj5mZqBNKMqPkCJ8lDeIdm86sRfu9fvlS90=
Received: from MW3PR06CA0023.namprd06.prod.outlook.com (2603:10b6:303:2a::28)
 by SA1PR12MB5614.namprd12.prod.outlook.com (2603:10b6:806:228::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 06:41:51 +0000
Received: from SJ1PEPF000023CF.namprd02.prod.outlook.com
 (2603:10b6:303:2a:cafe::78) by MW3PR06CA0023.outlook.office365.com
 (2603:10b6:303:2a::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Wed,
 23 Jul 2025 06:41:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023CF.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Wed, 23 Jul 2025 06:41:50 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 01:41:48 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 1/9] platform/x86/amd/pmf: Add support for adjusting PMF PPT and PPT APU thresholds
Date: Wed, 23 Jul 2025 12:11:13 +0530
Message-ID: <20250723064121.2051232-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250723064121.2051232-1-Shyam-sundar.S-k@amd.com>
References: <20250723064121.2051232-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CF:EE_|SA1PR12MB5614:EE_
X-MS-Office365-Filtering-Correlation-Id: b07cba7b-f18c-4ffe-ff24-08ddc9b40157
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SHQ1Nm9aVytHK0VzSGRnT21CNEVvNVhQQTNVa3pnT0U0WG85YTZKZThvSW9m?=
 =?utf-8?B?M1NSTXBhMi9jOERrWURYaGVMTlhjWWZUWHdoVWVsUm9CUU5hUWVBeWJwVXJt?=
 =?utf-8?B?U0pVcUJLZmtJakhNbW9na0VOS2hObUFLWHhYQlhucHZoWlUxdFpiajQzbmpI?=
 =?utf-8?B?UnBZVm9idG1NcHFXWEUxSU1UUG5zUkx2QkdBQnIwN0F4TmFIVWdXK01NQjBD?=
 =?utf-8?B?ZDBKS2hwYmVodkhNdElMN0xTbVM4dmdiSU16cGpWL05OQjJlbG13cS9wRU9z?=
 =?utf-8?B?OGErQkVxek83Z0ZEbGdPcEo0MTcrNzhBR0lSblJyZSt0VzlmaklHR2hiM2Ra?=
 =?utf-8?B?cHFuTjkrQTN1aE93dlE5SXQ1R0R4VDh5UW93SEJQSVVGRmx6R3plZGExS2NT?=
 =?utf-8?B?NnJHZFlxbDB3NXpxazdtZGJLSnA0aldmc0cxZEFLazVjdFI0aFhqVDFlbzNh?=
 =?utf-8?B?c1JKOEdXSzRvU2FNeElXbS9JVXl6U0d0SnlDSTVDSDV2azhkUGlRYXAxMHgv?=
 =?utf-8?B?bDFGYzdOZU9oSXRFaHJBd1YxN01TVG14Qytqc1NJUEVEVXN3aDZuNEJvSHpi?=
 =?utf-8?B?Sm9RL1FhWWU3VitDSlNQbmdMNVlWMkdvYmdvYkFBRWQzTlpYWjZ6dXB3K29E?=
 =?utf-8?B?amUyNkZCWDVWRmRaNTR1K2lGeU9JdUNDUCswckFhTi9uakMvRHcvc01yci9i?=
 =?utf-8?B?cGVWTWpFUGxEQllBTHJzYm04WWZFN0VBL3lEUTZzdytZTlA5cXRBcm8yT0FP?=
 =?utf-8?B?bmQwRFpyMEx0ZWw0VWFlN1BHWTRod1EwMkFYU1c3YmtBcTlkUGh1ZjJXUEtq?=
 =?utf-8?B?TXBjSGdxeitKY3Q0akhzczdJTEt2dkd4ckpVWGRYYytxSkRmYllCTjdzSHhu?=
 =?utf-8?B?Y3JnM3ZzWkRGTG5kZE9iVm82aldRZm16aDJKa29OaG1uVmxpcjJnUDlhajVP?=
 =?utf-8?B?TU5XQXJGcHBjZ2Q2QXBnSkZQcXdQOW5kaCtJZGd6aVBxcjZWQVVKL3lmOGpa?=
 =?utf-8?B?TDJ0WWEwaXhZNzRUTVU0Z3VibmI5NnNUcnVnQmpIOTNFUDFNUExsdEluSDBs?=
 =?utf-8?B?NEtVcC9JMmNZZHN2UklMWkljSlNMK1V2YTJvSmliQjBuc1ltRERvaVpCaXJz?=
 =?utf-8?B?ZnpjazFZRmdER1hlZXZIeVZSRGVNU211UXd3VUk4bU5FRU9JbnJHM01FVllv?=
 =?utf-8?B?aVZMbmhLRFV1Ull4WHRxajdWR25ITnROYTB4VW1YbEkrbE1UTDJ2ak5PczBF?=
 =?utf-8?B?UmptSCtMRUdtQ3dFNUVQSGxBemRNT3BwYk1mUnovRFZxQmFlS0wzcFdCcUpm?=
 =?utf-8?B?eXNMdXR3SHJHd2EwdEtPWlVWYmZRY1Z0TWd4andYM0FPbEJQWEJjSDMwVnA3?=
 =?utf-8?B?aGdkVWt0TGVlUHJsNERkc1ZPc3JKWDhZTU5Qb29SdnZVWGVzOUFja0FzVm9k?=
 =?utf-8?B?blR2UGRMVzREN0Jja2xXcXVDSHlXN3lFb0RDSzR5ZDZiS2FmNlhOQWV0UnUy?=
 =?utf-8?B?OE8xL1Q3ZFlkaE45QkRmOGo1NktQNDFxNXl5Snk1S3BVZWt1bGRoUlprZVRh?=
 =?utf-8?B?WlNHZDNMNFZKZEhVL0tTM0xJY2pTQ1JnbWlLa0oxRmVLZG9yczRHdnhxcWxV?=
 =?utf-8?B?Wm1LRTRPeDJiSzNVenZpVzJEWWlZOFZGdHZIUlYrRmxYRG0zQS9RUVMzSUkx?=
 =?utf-8?B?aklkUGRmSmdHTEFBcTFKUFB5ZDZnYWVMaUZOcTNwdWw5M3lWVklpVis5Vmhh?=
 =?utf-8?B?UkhQSnVBRGZOL3BWcFR6SUtGMDNLR20yNlhWYVdYTHRZdTJBTmh3UlJ2RGtF?=
 =?utf-8?B?VUtvTmgxNUU4VXdKWU5GK0RCMGFadUhnbmpEMUNqN2lIaUc3OGYzQnhQQTZU?=
 =?utf-8?B?eVVReDN6WkV3SERLbjQwTmQ0cmxZYlVJcTd5STUvRHNLa3F5eHdaZmM1WDl5?=
 =?utf-8?B?TWcyMXJ0bzZyWjZNVVBsa0pHeHdJLzNJajhLTUhIcVd2UUxRVzNCTlZLYmhT?=
 =?utf-8?B?V29PUHQ0dFg3bkdTZ05QQUlYb2ZFcVZuUU1iOUpsNkpzSjQ1cW5iOTBDRTlo?=
 =?utf-8?Q?8nzNXJ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 06:41:50.8981
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b07cba7b-f18c-4ffe-ff24-08ddc9b40157
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5614

The most recent PMF Trusted Application includes enhanced features that
allow for modifications to PMF thermal parameters such as PPT and PPT APU.

This update introduces the necessary driver support to utilize these
capabilities.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h    |  4 ++++
 drivers/platform/x86/amd/pmf/tee-if.c | 16 ++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 45b60238d527..1a5a8d70c360 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -93,6 +93,8 @@ struct cookie_header {
 #define PMF_POLICY_BIOS_OUTPUT_1				10
 #define PMF_POLICY_BIOS_OUTPUT_2				11
 #define PMF_POLICY_P3T						38
+#define PMF_POLICY_PMF_PPT					54
+#define PMF_POLICY_PMF_PPT_APU_ONLY				55
 #define PMF_POLICY_BIOS_OUTPUT_3				57
 #define PMF_POLICY_BIOS_OUTPUT_4				58
 #define PMF_POLICY_BIOS_OUTPUT_5				59
@@ -677,6 +679,8 @@ struct pmf_action_table {
 	u32 stt_skintemp_apu;	/* in C */
 	u32 stt_skintemp_hs2;	/* in C */
 	u32 p3t_limit;		/* in mW */
+	u32 pmf_ppt;		/* in mW */
+	u32 pmf_ppt_apu_only;	/* in mW */
 };
 
 /* Input conditions */
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 4f626ebcb619..b29f92183b2a 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -147,6 +147,22 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 			}
 			break;
 
+		case PMF_POLICY_PMF_PPT:
+			if (dev->prev_data->pmf_ppt != val) {
+				amd_pmf_send_cmd(dev, SET_PMF_PPT, false, val, NULL);
+				dev_dbg(dev->dev, "update PMF PPT: %u\n", val);
+				dev->prev_data->pmf_ppt = val;
+			}
+			break;
+
+		case PMF_POLICY_PMF_PPT_APU_ONLY:
+			if (dev->prev_data->pmf_ppt_apu_only != val) {
+				amd_pmf_send_cmd(dev, SET_PMF_PPT_APU_ONLY, false, val, NULL);
+				dev_dbg(dev->dev, "update PMF PPT APU ONLY: %u\n", val);
+				dev->prev_data->pmf_ppt_apu_only = val;
+			}
+			break;
+
 		case PMF_POLICY_SYSTEM_STATE:
 			switch (val) {
 			case 0:
-- 
2.34.1


Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2081.outbound.protection.outlook.com [40.107.243.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C838376F1
	for <platform-driver-x86@vger.kernel.org>; Sat, 30 Aug 2025 05:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756530046; cv=fail; b=mb/WXOTUObEBfe0hYCb1wpUDwmr82JQSoSyAYSPoev2wlATH2qAZZHZJUlCesFbYZ1695EQog1f3kbWPSRiajqkyZDv9iE6Yq508KuivBxJbZqcDykQZ5hwevoSXI8imYZRdwfA7Sd8+cNnXooDokSTa5k9oxhjJvqlUkWbplsw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756530046; c=relaxed/simple;
	bh=gK8S3W0iNqMozoHmZtySE4+v4MXABW6xSbQ2LRdiiMk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dyum4YSJltvNS5fgqYwWJgzZUz+U7AxD1HTjRIg9IDWKItQzL6Gm4VCQeRH5PPv9aXS2pSwEk3cLEcUxp7s3RarivtAzCM2d51wsWLVv176LOjY95lsMgAseRbCi2C96Qa2ZDIrysQWaquxeDLXA61pzbu1bW6FVDBCIAcDKvEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XlLHU1Fd; arc=fail smtp.client-ip=40.107.243.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XlLHU1Fd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F/1zTeD3tO6RL0R4cT65A0FANnIFTPuHWNo0Q32L/mt2vZm73oiEz3qK34QWpF3QOrXL7PcpR1bKlXnfCAu8DBJ6xEmFfVxXDO5t7hl5cgepu4kUxfnU5ZKLopMgwZfUxQujwN4down15TpOuTlmSt/gijjO7lrs9+e5iAUFpvJcw0F6FEuvNBq6ejEZ3mbFvVWwn2Tx7qN5BCR+cIvoyd4tYA3af+ZMGW7XzjHeSQb9TXEWsecuS6CBSbxMm5czzl5K6VqnEwE3OSrXHwNZa5Xf5Ee7OaJ+5QlJ+GxXeCUVpMFSqiR8QM2eozHFfzbvpIcxfpTRmGnfEGXs1PVe7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F1zqw5gtX7wG28Je24VEI6iwvcVIkUdKuduUwFnF8Ms=;
 b=UyKoOJc9ZdcHGdlYscmGwOmeTG3DtwNDLaEm/1R7rUabvxkBMyQsn3LYGSek5rRpOH08vMu0KEZyzM+/yINpDIj38jwRz3h0UVExqDiUzJwvtvI8aPjXTKHvNXlop36znt6imG562hlv504x2rQt2rQ5csp6fhY+CnWf95qcH3zGWyoXk/p1HarezG1Z8UITGSRyL0bOtHzkjtydyaKkhrd2YOzPKGfO0YFppsB4/qK2ysITRXj+eZ+OqcVGA5z25Utkvct6n3Cp5wiynFIXd9EglQjPYsAW8a6GAYebYD9VikSGSl2qprU3hStc70NQo/tN6C9jQRDvNAOuyerpNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F1zqw5gtX7wG28Je24VEI6iwvcVIkUdKuduUwFnF8Ms=;
 b=XlLHU1FdGe5EIWwlEVoNxdz/RgTxXq1YPzKDnsB1MGXgVOF0YsOrFCL5Dycu7aYPKyj0u06ASWYxsNwTcRYcrhBtuzGHjV19bbSqv4r/VpiIr9iG7LcyPL2Hw606V8xJwFVv0xoUpX4QG8u16husab/+cf7PQngr8kA1eiFWRcw=
Received: from SJ0PR03CA0118.namprd03.prod.outlook.com (2603:10b6:a03:333::33)
 by SA1PR12MB6919.namprd12.prod.outlook.com (2603:10b6:806:24e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Sat, 30 Aug
 2025 05:00:33 +0000
Received: from SJ1PEPF000026C4.namprd04.prod.outlook.com
 (2603:10b6:a03:333:cafe::d2) by SJ0PR03CA0118.outlook.office365.com
 (2603:10b6:a03:333::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.20 via Frontend Transport; Sat,
 30 Aug 2025 05:00:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026C4.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Sat, 30 Aug 2025 05:00:33 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 30 Aug
 2025 00:00:32 -0500
Received: from airavat.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Fri, 29 Aug
 2025 22:00:30 -0700
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>, Yijun Shen <Yijun.Shen@Dell.com>
Subject: [PATCH v5 1/9] platform/x86/amd/pmf: Add support for adjusting PMF PPT and PPT APU thresholds
Date: Sat, 30 Aug 2025 10:30:01 +0530
Message-ID: <20250830050009.454739-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250830050009.454739-1-Shyam-sundar.S-k@amd.com>
References: <20250830050009.454739-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C4:EE_|SA1PR12MB6919:EE_
X-MS-Office365-Filtering-Correlation-Id: f052b7d6-10e3-4e32-b6ff-08dde78226a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aGlpMi9PdjhmYnlDVlVBNFk4Q3ZPR0ZHR2dhaWpNZ3V5MFRCSDNoSlA5Zzl2?=
 =?utf-8?B?bmFRQ0FGbG1aQW9aZ040b2JFWFFCUUdZanlvVUhJWkRmd3RqZ0VRRk8xR1BX?=
 =?utf-8?B?UGM3TEhqQm90cHdOejh6RDg1QnpUaGFIeEdrSEFtUU5xcEZydk9ZRWpUNGM3?=
 =?utf-8?B?d3EzaUttVVI3Yi8rTlpFR21HaXlHVjM4bU5IZU1wc0ZNSGRXcDNGQWcxZGJp?=
 =?utf-8?B?NEJkNWg5NDhDZEp3ZGNvbXpzM1lDYXFucG53MFRiY0pNNWtIalJYRUNJWW4r?=
 =?utf-8?B?cVRRSEg4VTNvNElNZEFhbm1adm1hbkdqZmVjUURsbVpkbm1pb05nYmt3Wlp6?=
 =?utf-8?B?WC9JNjRZRWloZlhvbHRGSFBxckhiYkV3c093TE8xa3g4YVExVTR0OEtEL3Zz?=
 =?utf-8?B?WHYwRHQ1YWt0SFNodHhRalAxTStjRm9wUWVNdW1aYVNBd1d2TUwxMFgycHhC?=
 =?utf-8?B?bi93dHZ0VlFZUmZYemxiNmJLOWcxSHBiY1Q4c0tQNFBGT1pzekRRQW1jWjVa?=
 =?utf-8?B?TTg5NE5PR3dnMnZsaHZJUlcyT1NoZk5PbExOK3VnMHlWcmpzUng4T1dGM0Zu?=
 =?utf-8?B?d0FIcjBqTVBaNThia2dNdU9NN2pJNUlyUTBiVkQ2VE1JUWwzUEZ5V2xuNWdB?=
 =?utf-8?B?SGNkb0kvZFN4elRWQ3JqanhkMThxN2VlMmVNT0NmMXZMUTd0dy9OMU9EdkNY?=
 =?utf-8?B?cnVJalQ4V2taRU9oc0xrc01zYk90ZUNiYXhGNllqc0d5SFpzdnFYdmYrckYy?=
 =?utf-8?B?Sms2dGxpaERQWXNhUEljdktnbVN1VUJwY2dUazJWWE5ITmZ2Qk5CMGJaTmsz?=
 =?utf-8?B?ZXlwWloxNUNKWk40cXhRRUJIU2Zwb1VWNWZ6K21SOEVlL2JaSTE4OXI4Q204?=
 =?utf-8?B?VzBZenA0d2J4bjRsSXZSdFlLeFlUVzA4UUNORkh5d1p4SW1xNDVsYVR5M0pS?=
 =?utf-8?B?YXc5dTRZL3RYOURHWnVXMjQwZVlHMHpkM01YQ1YzbytmS0kvRkxYdHk0TXdz?=
 =?utf-8?B?Uzh2TGpiK0VpQm5GQTB5N09mRnA4eFQ5ZmViRlRHdlVsVUNTbnFTaGRleEYy?=
 =?utf-8?B?azFGenl4YklhVG90WGpIQlIyUUZlTjVnS0UwR2s4VkFQWHpoZm9RMnRrRU9P?=
 =?utf-8?B?Y0tMWW9qVWNWUDRCQ1M3cXZGTW5KWFk2SVYreThwNTkzZFpicmpMM2NyKzJ0?=
 =?utf-8?B?V1ZUa2d1V1RGc2prMXU3K1ZOWU5mbjA4WmVJQkhnNU9EZy9BMjdTNG5MNjZ5?=
 =?utf-8?B?UDZuZlkyckZkMi9UcFJCdm10N0gxU1B2dXdHREo2R096V1FpektSSThzUHg3?=
 =?utf-8?B?OFQ4STdDbi9YWVUzeEVMTDM5L2xlK1QyTVBXb2Z2dWNrR05VejI4ZWJ1WWNO?=
 =?utf-8?B?NjQyak5pdnB1ZTFMcFNjY2dhNGZHK0hDZ0pmcUM5aGFwdW1CeWdLWWRTUWda?=
 =?utf-8?B?QURXRUg1SFh1blJpUEFqOTJ4N1FvTkVBOHl0NUx6WTE4SjlmWUZZV3REeWJN?=
 =?utf-8?B?K0h3d01SNzd3cjZMUmZZekJDODFWRnRyUkhKV1hhM0RCSXV5b0tCVVpKbS9Q?=
 =?utf-8?B?WTlKK2U0TVZUdTVFbE10SktKelQrZkhZV0VIZExHd1B1cnRLeTlFZXdqME1N?=
 =?utf-8?B?WHVVQmlPNFhlL0dmRTNaSFNIRXVGaGtNVEJueGxOOXpsZDFyNkVhRzlPNjgv?=
 =?utf-8?B?aDdMYmVZQ1ppSGZrTGVIeENFcEVBVUFNbTFYb3JEU1JLbmhaYTZkcklHZSsx?=
 =?utf-8?B?N21lNUIzQ1RubUFnUStmaVB4TmFFYmNOcEJiR1Voa1E3QVZDVDhhS3lWMGpI?=
 =?utf-8?B?N09LNDRqMDF2SFlqenJXa2pob3l5Nkt6V2RFSDROQUFRSTBBQ3RVd2dwR1Ez?=
 =?utf-8?B?d0RyVmdlODAySXUwSFoyMS9GRm82VUJXUEtwODZQb3pXdEF2bUdUQ1F2SUha?=
 =?utf-8?B?TFJPeFZ6UXFPMDNMcWFMRlNPeC9JelZrcEZIRFBxU3hJck5FWUpyMyt4b1pJ?=
 =?utf-8?B?M25pTE83azQ3Rll6Z1g3Rk9EUGwyTnl1bGhwc1JhdmdRd3ExQ2lWSHU2RXE2?=
 =?utf-8?Q?yPx5yu?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2025 05:00:33.5283
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f052b7d6-10e3-4e32-b6ff-08dde78226a5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6919

The most recent PMF Trusted Application includes enhanced features that
allow for modifications to PMF thermal parameters such as PPT and PPT APU.

This update introduces the necessary driver support to utilize these
capabilities.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Tested-by: Yijun Shen <Yijun.Shen@Dell.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
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


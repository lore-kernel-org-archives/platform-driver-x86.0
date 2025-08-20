Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2067.outbound.protection.outlook.com [40.107.102.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF372DC333
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Aug 2025 11:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755690682; cv=fail; b=UkOKrmbtlz7p5hE3I+AyOpwlYAm6lcBzwJ2KRfEavzc04m+9XgxIIq0LL6/COXzjKD//OJa8wI+1l4ILd/V70hm8AHC1Hm9Po1Md6vhHeBkfqR2FmRlhK8L+1cb+sDYucNRmOquc7IZ9TId8K7D0j1fHPKAKORZOAyRfCEOVU/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755690682; c=relaxed/simple;
	bh=gK8S3W0iNqMozoHmZtySE4+v4MXABW6xSbQ2LRdiiMk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S9kAfvtS9BtynOTUnmw+/cDr8Ceugys2sDuneU1XMsqol3FMZ7XFJvidFOr8/tIXQZBblmYkueNaGG62IW2SmpReFEhBSkrXoZkOl/SwOkiaSBnZtvqyvObjXTlev7BTDe0DNFZbgIdMtIhJsp0I6KpY/mF9Vaqx0bVWJbD5iRA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=G3KCRpPn; arc=fail smtp.client-ip=40.107.102.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="G3KCRpPn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LiuM/C8nb6I6/fFJHoFIWnURxseA+64TdvZoTXpry2z0TVAPZkM4sxHuueuD/JGaJjjtJDPQwBknto7786Pu1QAvNxhjEjOgB5V8egYQADk0mLErYlP4hJHbKFnZSeTUmrQy1Ef7lH1JovVQ2eJyQPcsMXZ2fGiTo/uPRjxHdgNnWYCrwmhhE5GQZu+6bqiMoSKf9IpxDQkPCU4dByL9Ia7z/VK3EbYVvfe9lpts1B5WXoYzu2qGnvyh3XqnCezSO2nlCJGSJk/P/avkywvA/s9PJ/wuJq0rM7Mz7KLR9Bar1HBy0z58yAensITDIDraO7MEjw9i0O3jn2fshK9FSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F1zqw5gtX7wG28Je24VEI6iwvcVIkUdKuduUwFnF8Ms=;
 b=uxKjFQ/HoOqljuEdrJglcnU2k77m8PvINsn3ME9trlYyfjKli2GNRfcRaJhnDEcwZV0Wyls3wfuu5fMxMbaooL9CsJHcb903C8ugbRkqws5sr9/JL2NHvH+sRv1fVM1P1RUqQ/UQrTrY6cNR3Ow4smsiTOph+z0fB9FE7AoDidhGDEMRiNycFVjJXfw78rKqEV0vpiBMznqnKxVeaPB/8gUDJ5sVf+Cj4qipLAJynPB2x/T61A4ikn230mIuVZyF0flJeQeelfQZADiNuwk2d+AQCgh+0SOl/aukjmV1LACTNslPyLU5wiX+7NN/953OCgeRc4XOMPJGTMXNPUThuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F1zqw5gtX7wG28Je24VEI6iwvcVIkUdKuduUwFnF8Ms=;
 b=G3KCRpPnkXhhYZaeSb0F4mj5qWjufIK8PhO0ZiijJC/EObU+6m8dq6p0FHu2OpPz7OQu3Be8uK0rF/IgoQoW3nQFwFjRmPGyA1gCfA2EeBO2Tm+ZK72j37e5A730CXjVq8/GrQNem82JAdGJMQ/C5xQnRafMTnYKo7Bvy4rQ+VA=
Received: from BN9PR03CA0059.namprd03.prod.outlook.com (2603:10b6:408:fb::34)
 by IA0PR12MB7699.namprd12.prod.outlook.com (2603:10b6:208:431::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Wed, 20 Aug
 2025 11:51:16 +0000
Received: from BL6PEPF00022573.namprd02.prod.outlook.com
 (2603:10b6:408:fb:cafe::d9) by BN9PR03CA0059.outlook.office365.com
 (2603:10b6:408:fb::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.13 via Frontend Transport; Wed,
 20 Aug 2025 11:51:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00022573.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Wed, 20 Aug 2025 11:51:16 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 20 Aug
 2025 06:51:13 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>, Yijun Shen <Yijun.Shen@Dell.com>
Subject: [PATCH v4 1/9] platform/x86/amd/pmf: Add support for adjusting PMF PPT and PPT APU thresholds
Date: Wed, 20 Aug 2025 17:20:03 +0530
Message-ID: <20250820115011.1448026-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250820115011.1448026-1-Shyam-sundar.S-k@amd.com>
References: <20250820115011.1448026-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022573:EE_|IA0PR12MB7699:EE_
X-MS-Office365-Filtering-Correlation-Id: 7095ecd2-632d-4669-2bf4-08dddfdfdebd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YkRUN2dNSlBQSGdjdWpyMXArNFc3UzZhUlhDTGFCaUpqNGF2eVJ4UmNNMXNq?=
 =?utf-8?B?N1NVcW55Vy9XQ2huNGVJNGdZc3ZsTWRuNW9pdUd4SEQwRk5lbW1ocjJWSW1i?=
 =?utf-8?B?SkgwNUV4LzFZZUNJSW5vT1VjSklEclkwdUN4b3laYnhIRWtJaXpqOENWUVRL?=
 =?utf-8?B?WGZFMlVseitLRE9MTjJBbGkzS3JuRUVnRnMxNlY4REM4SlVqRjBMNC9YTWFJ?=
 =?utf-8?B?Ymp3WVA4SU5XWERzNjBUVGpTdHV3bEJIK3NnUjNtcEYzV283QzRzMWRzVC84?=
 =?utf-8?B?MmV3UzlTMFdMSXJhZ0xDUlA3SzNIbkx2bFhsRGFBL3BrRUdjaHBQa1g4LzYx?=
 =?utf-8?B?c2RZeGZaVzU4MklnQXZkSGZNUEFtQzdwY2wxRjdhOHI1YUVSZHcwelRNc3FD?=
 =?utf-8?B?MXdFNTczOUlNN1ZXUHRHZ3BUS1pIS0pQbEk3aXJqL2ZUN3dBN0hIQldJdGY3?=
 =?utf-8?B?RTBvUm1vNXNpcFlMUzJsY0pkME1RYXVBSEcvbUhTc1QzTHhwbjZwaW1USC8y?=
 =?utf-8?B?SWlQbWx5S0VIRTFZR0Q2RFRKTXZzRXNaNmUrM3dDU04xOHNaaE1Vc0V0ZXNt?=
 =?utf-8?B?UG5NcHpuNjhJbFg1djNjZzFVV2VRclFibmZpcTJRUE92OWRwSndvdGVTcW1L?=
 =?utf-8?B?ODFaTWxMZzhmVGV5ZjI4eHpJUFBDbkZJME94V2lEZnhxTHpRcS9uMHRONTZv?=
 =?utf-8?B?S1N2OERJSmQ5aHVXMURpcGljVmEreGZzbFRxa3IvWE81R1JaZWIwVXlpQnc0?=
 =?utf-8?B?L3k3TTMyZzRTeDErYXVONS9HYWlIRFY0M29GTEJobUZGaWpSZ2NuYVJnMmxl?=
 =?utf-8?B?OFUvV1V3Y2wyZHVWNlBnQkpuZjgyM01iU2gyMFFpY3k3ZnB6TEdUak1oVkpk?=
 =?utf-8?B?V29SYW9RVDR0c1ZYVHlkVSt2RE9DZmZ4dXVjTWpJcHkrdm1kZm0xWXBVQjBB?=
 =?utf-8?B?aS9iRy9sVkdFdjRpSlphKzNqVkk4aUlqdk1BNXp3Y3prTEhtOFE0amtTYk5x?=
 =?utf-8?B?UERqRmt6N2k1VHU2cGwwa29xbk5oNUxFZXNwL09Zcm1hOWlyN0syWDAvazEr?=
 =?utf-8?B?ZW1nTDR2MUpIczhQMDMyT2lGL1I4WWhNaHJ4aDNhRnVXRTAvdUx0dTNrMzhK?=
 =?utf-8?B?Q3ViRmRBMkhVYk9LNEFLNlpXUEMzZllvU2hPaFpIUXlBWDVoMTR0QjFNVC9Y?=
 =?utf-8?B?a3lTWmNxTXo0SnJ3Q0NyQlJ1L1cySHZ6YXNwV2V4aC9qQWFmb3VDWVd3eXNN?=
 =?utf-8?B?SGFEL21jWUdZRG5ZcnE5QjFORFR3dHhtNGxXdHhDejdKZDJEQS9ZV0V6bVVl?=
 =?utf-8?B?b0dKTDRPZkF1TWVqZFM0SjJDZHRnQUtNOStXb0MzUHNKZStWV3RNTUM3aUh5?=
 =?utf-8?B?bUtoc1h0TDhWTUFaUFhmQ0Y1dUFBY2FkSXUzM3pjc2tZYVFJK2ZmYTdvTG1v?=
 =?utf-8?B?UVJaYnRnOU9DTy9JUnJxdC9ReGdOQVhNVjVHWTJRdnRxa1pWUlRGOThwMkhB?=
 =?utf-8?B?Qm04YnhXdmVpMXphZ0dPK2JYaGdzTFpCNU9wL3dNR2F2VThBQm9wZjlQbVpY?=
 =?utf-8?B?Y1I1YlNZclFyYUpMb24zNU5NNlZwbmFkeTZ2VlEySExKUEE3Vm9BYzV3QnVm?=
 =?utf-8?B?QjZvOXdVeUF4ZWNUbTJMM3RFMXBTUFdrQ2s4cWoyQUFCTWNYYUFYUjZUTWsx?=
 =?utf-8?B?azF3UXJBZXlBOWR4RExzUnRvOGFoOER2SUxkWVBrcW52K1VXTi9BZlpDVGgz?=
 =?utf-8?B?em5zL1hjVnBmQzR0ZGphQXQvd09zTWtqUHBtdHVTRTVXZFVJM3ZvZkJ0WjA5?=
 =?utf-8?B?K1FhZDJXcUlkU1FoL1RvaE1LZk14M215YXp6OU1aenpHcUZSRXhLZDZQLzlR?=
 =?utf-8?B?aHRDeG8yN0xvbjhkZ013U3dwbnV6a0tVYWVIeWwyTXViMmpVSDhVVCsrY1lx?=
 =?utf-8?B?UWl6QlV0R0NUbmlLV3lyWEdSOWF0Y2tPNC9GNFY1b3k1ejFGb2xjWHcwRlBa?=
 =?utf-8?B?MVFmTEtSZkhvbmk2UExKR0ZUWmRSaGt2R3p1eTVYNTIzLzdZUWlLbnBvNG8y?=
 =?utf-8?Q?Bb617O?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 11:51:16.3671
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7095ecd2-632d-4669-2bf4-08dddfdfdebd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022573.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7699

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


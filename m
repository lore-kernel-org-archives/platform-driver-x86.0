Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2046.outbound.protection.outlook.com [40.107.94.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685352609C8
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Jun 2025 07:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750144480; cv=fail; b=p/scmTQsteHAKIhpFhqFrYZjfzr2sDLi10LFefLaal6eaRgyD1K+fDxAfOOYEn+3nWaOux2grDXKnqxpxugVh8OZ1fzstQ+aGyeu7QXpcqUVRW9NJLA0BNmh/T5r40iwbxi20d/lraslt3vGIhnGk5qCzxZa4o2YNGiedjNZO2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750144480; c=relaxed/simple;
	bh=TtfjB3DQcX9mx2NQAOhimpZZOyZDQT1G1AeBFYEZv+8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rDQS+hbRC7mWfSeeZIf34vdqZXUOrLnD1D9YVCFdG+1ysDefiGgc0u7a0IdgdBNcYNwEINTzECbk4sE1pRzh/XVaMBosrYQcqw9kEt8OzaQXuLEvBeEcJ9syZMjA+dyuWcmtKWyd54CurvOD8TKg3zDbjk1GQane61QBV050SyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Kc2X41GK; arc=fail smtp.client-ip=40.107.94.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Kc2X41GK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s383zfQBfZ3EjjZpSHvx0l8QAR2pwd6fKCiU6czBw2OIcd10FMqtvrF540pwhp8e2Cy4lSBQraNfN9qCUcDvJ/pGBVDJaVMDX3XRLbxvmKVrSPl4dI8dNLvQmJD3oSAG5ebF9B1XpmkrfyUkkQxAAqLOHp5h3CLsNofZdir3SFbNrS4wt025AplrJ22WgUl2g8gDXmD/rRebRKdeoUmofO3HHo3pDfeo3DeYQiW/QC4325StvA3FhvVHbASPadh+IARjjvBxvNKvPEs+x2E2hJSzMKz/fYvFHz1DPw6w7mO7jIZZGMdMU3VYAaANC9HmAAFrFWJWkXw9GBkMXSDKzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QQJSMkm+g7b9HPok1iwncxBLqg1LsYkrb1NdkUCONtc=;
 b=i2ov/dNbtHQY/fwNbLMYcDz5K0rG5mPGd0Giar995YO1lo0NbN7LHjjefVGb5bOI/B7x2NBCn3Jg2ucND99dVgXNgnSlYbd60DMeN0JshhszIa2L8/s0vfci8CJNEKugiHsJAU/ijnAc73ctIZcd1T3BYalHces3Cw4JF2RQ/LNSAKUyTXjJam/6z2Ewy3lNU7OSZFlDCnE4TDHV4gmUj5ZqEPe24EdaksWImNvdCQO2YCav6GJR2+GIAaWvLu7SRglNEB1Q+2xAfm2vapcmRrUDEkBJLuZtyHS9zgh/ZtL8c3ulLozlQM4zeyKTuPPBuNOkXlhZ6+L6MhwxrCPvZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQJSMkm+g7b9HPok1iwncxBLqg1LsYkrb1NdkUCONtc=;
 b=Kc2X41GKh2I1hr6QRX7327ZUv2+IyTvTjyABOhJLTKpZVT+YupEg+4qb1ZHnAV8tR4ZHKPkx95rkMgUXX+D8lifFG88LBO5dT+kTIFD3aJDPrS18SXkciHidjLPn7jso787tAdABY+wypJziGlzEyh07HCI7rMG3xC/8ypmTdMg=
Received: from CH5P223CA0014.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::16)
 by MW4PR12MB6900.namprd12.prod.outlook.com (2603:10b6:303:20e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 07:14:33 +0000
Received: from CH3PEPF00000011.namprd21.prod.outlook.com
 (2603:10b6:610:1f3:cafe::2b) by CH5P223CA0014.outlook.office365.com
 (2603:10b6:610:1f3::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.28 via Frontend Transport; Tue,
 17 Jun 2025 07:14:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000011.mail.protection.outlook.com (10.167.244.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.0 via Frontend Transport; Tue, 17 Jun 2025 07:14:33 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 02:14:31 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 1/9] platform/x86/amd/pmf: Add support for adjusting PMF PPT and PPT APU thresholds
Date: Tue, 17 Jun 2025 12:44:04 +0530
Message-ID: <20250617071413.3906284-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250617071413.3906284-1-Shyam-sundar.S-k@amd.com>
References: <20250617071413.3906284-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000011:EE_|MW4PR12MB6900:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e02b4ca-21b4-4c46-9d05-08ddad6e9c45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SFo3ZnFhcHllcHhvMytnUTBMVVgvZFE2UU43akFsc0NDaXh3ZCtNeDI0UEts?=
 =?utf-8?B?cXhTQkcweTNZa1FkaVNIWW1MNSs5Szl3WFVML2ZudmpSZVc5N2YveEY1VUJ3?=
 =?utf-8?B?RXBWVnZZM1BGVVRzQ053eldpQjJlTlBwakN3ak9PZ2d2Tnpla0trZmR5aWla?=
 =?utf-8?B?cFU3ZUloMHF2Tnh6aUg5ZHVjeUp5NzAzdGI2NWE1QUJkb2xKRjBHZXQ3MURN?=
 =?utf-8?B?S1dQS1pVSjJkeWQ3QnhUcGJUOGtnME54dVcwMVNmTlNKMG04VXN1V3N0YlE0?=
 =?utf-8?B?UEpQcDZ0Tk1Sd0EvOHZFblhySW9rMU9mRDIrOVdybk04bjloejBMaXhZSEdT?=
 =?utf-8?B?UVBka3QwWmdrZWVleEp3Tjc0ZFh3SkRuTHJuUjJpMXF3ZEwxcUlPdGZ6RlRQ?=
 =?utf-8?B?L1pWRDljVXI3SGkyMitEYVp0dk5KcWJsdUhkREQvOGFxYXdYYVdiTUdJNVli?=
 =?utf-8?B?K1B4NXloVXc0OCtaVjAyemtmUVZCUGZRdUFjek02Zm9rbEYrcmVGQUtPalBZ?=
 =?utf-8?B?SWQrUlRqd3huNEFQUUh2blI0VTIxL3BZTzRqRmw5Q1pUdHFSRktPWDhkREsr?=
 =?utf-8?B?eFRlc1hNeVhrNjUyaVlvNVgrN0lHL1FaNjBabnA1THdyaHgrdk8zUWV4b3Az?=
 =?utf-8?B?Z3pVc1AvMjdGaFQwelRseVU5MkRKTXNKRjNDWFpDT3lJb1VjWjdubEdxZW1t?=
 =?utf-8?B?VkhsN29SNndDc2Z4a0tMZCtFYmxKZjlENTBQL0gvNDMxQUQzR1F2Zkp3ZEJ6?=
 =?utf-8?B?RzYxMnNzYTV2QmFKcW0zL21haGlRMmlJNExmNktETWt6aDVpMVFNd1VpMmxW?=
 =?utf-8?B?WkNJZ0lRMndHOHMzdUdFSWtuQ2VyUHJPSTMwWEc2MWVOUTBGRzRUeDV5M0sw?=
 =?utf-8?B?TGlQaDRkWkp2YnFqTVlLS1VBQ1pWbDd6Y2Z0cE8zOWdTWC9tbmFzVUNLU1Vu?=
 =?utf-8?B?SURyaVVURm1MenEwNXoxSjFSelRPRE5WaUhmOFBuSUw1aXlRRkZ2cml6Nm5v?=
 =?utf-8?B?T0pKdThTL08wdVQ0bllPdEQxNVZtMTdFbkFGbVd6L1hwUFNuNno4bFJGS01G?=
 =?utf-8?B?NXFndGFVQmRlRTZoWU00Y1k2NktCSzJyUThUbnVLMkl5dzdFM3R5NFFLcDdB?=
 =?utf-8?B?T3hCM2xNeFhhdS9JMzZaOXhNUUhWN2k1M0lFd1k0bjlpOUFRU01wRDJ0U1Vm?=
 =?utf-8?B?aU92WjZaSmhJSkJWMTYwbG9QUnYrK3NrRkpWcHBnd01yQVRsczNxNDVjbmhL?=
 =?utf-8?B?dnZwQWZ4UlVCK0NlamZDUFJlaVlNb1JBVWwwL0lZeXZsbnZkM0RKZG1qK3dt?=
 =?utf-8?B?cW1qaW9sL29pSnpZczBnNHUvNm1VYmF1V2JWMVUweFRuQzZWM1B0ak9Ec08v?=
 =?utf-8?B?dWp6aWlvUU04RWJOYXhzWWJ1akJDU2JDU0xWVWRKZ0R4SE1UK0FYbnBzaDRI?=
 =?utf-8?B?cEErYm1XNytFNStGbkZEbmZDVWJTS1MxUnNnNXkvTEFIZGE1UGhVV1hnZmcv?=
 =?utf-8?B?cGdxSjRMK1FvbEpuaklZSExBYko4TFFENU90cmFOb1ZLWkcyMis0QTBqd0Ir?=
 =?utf-8?B?SlN5dnRtcC83NWlWUUZESy8rUGdiQnRKVUxMZmdGU0N1Z0ZPcG0yemRKcncy?=
 =?utf-8?B?N1RXblZ6elRXK3d1YTFpRU1sOFU5ZUJOSFUzU05NSWJFeGIyVFBHWFJpa3pO?=
 =?utf-8?B?N1B2UHdVYWJxU2s3Y25ySHQwVG9BcjdOdy90YVB5UHZzWnROaktqWkY1NDhM?=
 =?utf-8?B?cSthcVdMWHhmbjkyU3c3dFp3OWFyRklSdDM4RUE4bHVUamdZQ1IybitOdXlH?=
 =?utf-8?B?bkhZTUNrdWFDOTUvd2tWQXlGNjB1bDRsenAxT1VubzNkSWZCdFFpQjFiSGtZ?=
 =?utf-8?B?QnhkUVBPSkJjSkJLejMxR3FWclIvbVJFUUZnelNwT0JWR0w4bnN2VUtQcTV5?=
 =?utf-8?B?SWcvV29uS2hDQjY4QWJxK1VuSUhmZ2pyMUl6TlNCU2h1U04rc3JpTHB1REpr?=
 =?utf-8?B?QTlDQjNqNmltYVdzVVhmWmVZUm9wTkt3empBTURqU2hmL0pvd2lkS3hDMWlo?=
 =?utf-8?Q?cA5e+3?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 07:14:33.5733
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e02b4ca-21b4-4c46-9d05-08ddad6e9c45
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000011.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6900

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
index d3bd12ad036a..870857574f0d 100644
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


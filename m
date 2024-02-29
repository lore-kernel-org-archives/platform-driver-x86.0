Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2072.outbound.protection.outlook.com [40.107.102.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A576844C9B
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Feb 2024 07:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709191971; cv=fail; b=OeNrqsdqJsx3lnLehDWAIKkoQp5L/Jluzn0iS+H/w8C8Cu1NHkRhVkYHHM3uhWlfwCE9W63GPD4qm+U9l5pFLHaYbYJNAw0CM+qXY6lj6xH6ecNtKBZV/ktSY5e2qCMhXYC72m1UqoeM37HbXANl/zGwu3n+sjeLqegZmr6T/Kg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709191971; c=relaxed/simple;
	bh=bA0648WVEr2bBaWaDgz0cdWi6INH8m1hGyk+HkASNE4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Od98Ak1QLsGP0+EpkpbCqGumdGDaut+N4QeFkxK69iTmoPiT+vLkiD9hnPIoTDpJj4CqctWuQ/BeXTZCs2VuHbuxVwcGWjMJDrlqwWbf8V2Va1NPUyLebPd84a3iJydpouarEri64eJK1UJ+YuijKsLytT11AOvfR0hz7dlu4Hs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=iVKEZFyn; arc=fail smtp.client-ip=40.107.102.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="iVKEZFyn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nr26q6eBfsG8RdoUERKKnrVWbGfW1j+ndJPEc2QgAvrWO9a9wPgIIeRDmJZUnmviWkBKXi4GZL9unbtpM7WgaVvNe4bndgDidmNfVYXdS9SSX0+4m6P58LVklSjqasVqMxx3Ovx/+1yEBEtI4BBAG1lyYdnwKE26CdX1aqX7A4qKT4i5R5kmhE15ktBHIf3Pr3L7w53bzL0oUzKNKnTj+CyyvUZy2Y2Kl2wB495xB2Qm9Yet/UcIfDX+EodheGMQ00L650k1tx0yrU+KveZIw9S/kzr+yNwLErlkuCQPkqc5Ezrea0PCoGhcgdn8N5YUTRwmNKf9ZQIB8yQXgSJ4Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Ep+J25dw9DnIeiAX4PGnorlEO+HgYlcGea90kfnoDs=;
 b=Q1/F2FxllCZymA1nz1hsszd25QBsWPk9K8Z0/2R7DCIxdin9wthp0tP2dCoXi6a/DwkvHRg1RxC9CRiR8vqcMS/6z+VijathSCB7va2um0etHWvUx0nSYjSXKGIorZCr+NoJMXr5FkPRwuMmlag7lp+adTth1eMUUOf9E70IbBdTvB0WIDKvKFZrSNDrgo0NJpXjZkiks4z4Bsm0aKGlCh9RaUmKaIeEJlO7Il6seUfChSpiAtGDn5WyndYNoNmr4Q4jjUmIYezkCtBjQNvguR85HcPePVAiI8tlG7rsttayPksxQG6QTTgnFuKEp9L5bhnk0Omt0DqtoruGbxRHqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Ep+J25dw9DnIeiAX4PGnorlEO+HgYlcGea90kfnoDs=;
 b=iVKEZFynSMXTZOLAleX6GpvdoJleq86VxdyQot3DPSK8m5eCUr17eXBUk/qPd257SMZzab7qu2l5qbC7CycvgzNUruBlEqFFcWxquk9dT4NCBGLB2MEGqmNJpigdW5Xa1TEM/Z3qz28ksklwbT3Nd2AbWOhXdmb9fYWotGOPASI=
Received: from BL1P222CA0010.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::15)
 by PH8PR12MB7350.namprd12.prod.outlook.com (2603:10b6:510:216::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Thu, 29 Feb
 2024 07:32:46 +0000
Received: from BL6PEPF0001AB4C.namprd04.prod.outlook.com
 (2603:10b6:208:2c7:cafe::74) by BL1P222CA0010.outlook.office365.com
 (2603:10b6:208:2c7::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.32 via Frontend
 Transport; Thu, 29 Feb 2024 07:32:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4C.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Thu, 29 Feb 2024 07:32:45 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 29 Feb
 2024 01:32:43 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 7/7] platform/x86/amd/pmf: Update sps power thermals according to the platform-profiles
Date: Thu, 29 Feb 2024 13:02:07 +0530
Message-ID: <20240229073207.4092698-8-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240229073207.4092698-1-Shyam-sundar.S-k@amd.com>
References: <20240229073207.4092698-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4C:EE_|PH8PR12MB7350:EE_
X-MS-Office365-Filtering-Correlation-Id: 797ffab4-b9b9-4891-8cfc-08dc38f89fbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Lgc1P1kk4uZZ7IOjmMrwWRbjswnNZNb8ForEmFViuPCKtG1CIi2VzVWu2Ko611JUO4fchbEKEphtq7rLW8h+eMVstiAhOKSEoVI3tYhpiB49fuwD2O7rJMo+JJUN9C5ss5bFANFZTWx6/AvH7U/3MBGjv2SCgURrghlRey5ALmmHUo0uPqSfRSqi6vYLnhaPaTjtY+vw80MwgCESYhwONQ6fXhESstIzryJgTB2jUphn+vQMnJ2arnVlknpmBzUskdvh9wN+IYZi0RdLY9+5mbQrgF0v+vWWlcC8Oyi/LVN6VpBa+XNMCf3cM/T+eiM/71ptEgjQG88bEJW2y8NuizftmGHbQMb1EXNWBKpeEhP8BgZ/WAGYnGe7LBxFCqFNaWW9O7X1OkBtHwBhgY4jGvJsmniaKHWfL5ZvEJ73gjO6E2Y8hfhl0mU8kylOJk0o1mkAjKC5SL6vw2DZ3ka2kdSzJ0hJDbET/Sz0E/exDekLdHqXAdG6WuCo0YkCUewNOaBR7HW3n1Ydyh8vMPh0gQAZeJah5+YUWH5vgrYc36Zbl9sfxn1znjpApSDGqN5fpLFV5Su/bqESYkAZM5HLHGfOlps8qn3Ur7vrh7RNWDU4CQxHOo83R1BvSYdYJMgVVm9P+2rUfC3IOly2t/Dyt6cSeqT0FNCQX1KaebFhg2WuE5740x36NLPjHm2bWkCaU6jIc0CZMk0al8jeoSQulH1y2H5wt5gHvfT9s8LmElZXzL35WLvZfKL+VEwXn2En
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 07:32:45.5937
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 797ffab4-b9b9-4891-8cfc-08dc38f89fbd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7350

Update power thermals according to the platform-profiles selected by the
user.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h |  2 ++
 drivers/platform/x86/amd/pmf/sps.c | 42 ++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 2d0601897f4a..c95e43077c03 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -51,6 +51,8 @@
 #define GET_STT_LIMIT_APU	0x20
 #define GET_STT_LIMIT_HS2	0x21
 #define SET_P3T				0x23 /* P3T: Peak Package Power Limit */
+#define SET_PMF_PPT            0x25
+#define SET_PMF_PPT_APU_ONLY   0x26
 
 /* OS slider update notification */
 #define DC_BEST_PERF		0
diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
index 4683b0e6323c..9cab4e8bace2 100644
--- a/drivers/platform/x86/amd/pmf/sps.c
+++ b/drivers/platform/x86/amd/pmf/sps.c
@@ -190,6 +190,19 @@ static void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev)
 	amd_pmf_dump_sps_defaults(&config_store);
 }
 
+static void amd_pmf_update_slider_v2(struct amd_pmf_dev *dev, int idx)
+{
+	amd_pmf_send_cmd(dev, SET_PMF_PPT, false, apts_config_store.val[idx].pmf_ppt, NULL);
+	amd_pmf_send_cmd(dev, SET_PMF_PPT_APU_ONLY, false,
+			 apts_config_store.val[idx].ppt_pmf_apu_only, NULL);
+	amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false,
+			 apts_config_store.val[idx].stt_min_limit, NULL);
+	amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false,
+			 apts_config_store.val[idx].stt_skin_temp_limit_apu, NULL);
+	amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false,
+			 apts_config_store.val[idx].stt_skin_temp_limit_hs2, NULL);
+}
+
 void amd_pmf_update_slider(struct amd_pmf_dev *dev, bool op, int idx,
 			   struct amd_pmf_static_slider_granular *table)
 {
@@ -222,6 +235,32 @@ void amd_pmf_update_slider(struct amd_pmf_dev *dev, bool op, int idx,
 	}
 }
 
+static int amd_pmf_update_sps_power_limits_v2(struct amd_pmf_dev *pdev, int pwr_mode)
+{
+	int src, index;
+
+	src = amd_pmf_get_power_source();
+
+	switch (pwr_mode) {
+	case POWER_MODE_PERFORMANCE:
+		index = config_store_v2.sps_idx.power_states[src][POWER_MODE_BEST_PERFORMANCE];
+		amd_pmf_update_slider_v2(pdev, index);
+		break;
+	case POWER_MODE_BALANCED_POWER:
+		index = config_store_v2.sps_idx.power_states[src][POWER_MODE_BALANCED];
+		amd_pmf_update_slider_v2(pdev, index);
+		break;
+	case POWER_MODE_POWER_SAVER:
+		index = config_store_v2.sps_idx.power_states[src][POWER_MODE_BEST_POWER_EFFICIENCY];
+		amd_pmf_update_slider_v2(pdev, index);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 int amd_pmf_set_sps_power_limits(struct amd_pmf_dev *pmf)
 {
 	int mode;
@@ -230,6 +269,9 @@ int amd_pmf_set_sps_power_limits(struct amd_pmf_dev *pmf)
 	if (mode < 0)
 		return mode;
 
+	if (pmf->pmf_if_version == PMF_IF_V2)
+		return amd_pmf_update_sps_power_limits_v2(pmf, mode);
+
 	amd_pmf_update_slider(pmf, SLIDER_OP_SET, mode, NULL);
 
 	return 0;
-- 
2.25.1


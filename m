Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012057.outbound.protection.outlook.com [52.101.48.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0F631DD97
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Mar 2026 13:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772370719; cv=fail; b=nJw4w53ovnHGjPCdJmsggTllGftlYI+i/pj0/h3JbB+Hgdu8YzjJ/rGix07IAoeQuxOLbD219+7Nj3fhGlZjY5isL8RHc2uC5+Wv8ZwMVeGNqkZ/TNK0HDInSnd2NlLuQHNaqyfadTKPIzjZXLTfP83WWt6UoqZf/S/7Ls5lNmU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772370719; c=relaxed/simple;
	bh=yVNkJc3kJ24Y9KJoUXR1guSKXHAOs1dUndPMuCQDp+E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G+IEn7lgmNer/7iygEimN8SNnDBBpZBJP5UEryiTgcn1u0c+XZlizzYoNuESQB9420qKrKc41ciSh90chLp2zqCpoxr0hxDVdU2agGVr8/zeWezZw/wJUivcuVZkGpwBcP3R30VER7PlHkvqD1Z+jc7JOwjRhli227YG8C+UQ7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=VKGYhJtF; arc=fail smtp.client-ip=52.101.48.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="VKGYhJtF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nkIfnlQNv1bvnzxjdg5fiskrshZPbT1/VBfiqn9oxQ2+KAudwYtL0qf3TCgvDtvS3VHm73B3RqO33ZdjoyJUglwBlBMiyamQZiJ/ZbpibavWM2mlzelYtloU5YqgNmLJpAfvdjjssLj62N0jgqi+DH7U7/gO4HXZJbvzizkodKY7gDBWiP3QVfzAi2ZN5WR1tWGC5DrBdIPgjsBZG8qxThgPCDhJcVTQFdcawntZMlybM2/muu1dbpwngJYUm9tpPyU87JKkc1bs4U8nGdhtZxp07mheFlIM5xLpI8FO8pN7wcEsHZWFdsCBXKUxJC/QSeM+UHuotqwMhNBTwIfCrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CcyWV88pdy04M8oZAVqXIv/skHWlkAsTqsoH9fGNhTM=;
 b=P48S3O92qT+69ZQycD73l0HXus18Egc4XAPMEv0KTZdOoYeLL8oo/YmFbakf0IvvTc5S5X/+6cViezt992JQfmSQ+Tb5aMadH5dK0V5HB5Yw1CFD359cz1eE59s3xzGtjL2OVYcviSxGtkNFKPKOl0NwVkI73RV9rgwaW41JDTqLNG+7yTGuWrcnYFiGKqYymHgd5pQpChCxLIN+A1OWcMEaZ3bfh8EcitMrPtJxeh4ZTCVel06dDRBd+zbPtE867ETByWUyLU8z3HrVEFcYVJ8Q4B/c6AMLNsRYoQFZ66NGaa6AQoGS0d6KMF3ijDcCOHGPW/Rrje+Bz0dpl1VuAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CcyWV88pdy04M8oZAVqXIv/skHWlkAsTqsoH9fGNhTM=;
 b=VKGYhJtFUM2nAehsGPNoL8+Kwtgdh/9h8spo9GkL8mH6VVL4Aiy9e3r+pWpbuYZGwlb79VwTV/UsioxV9tqTEUs+/niwk3QMwIKzqBnGyiWqjaMdS1UxdPvMz9ktDMGlT7Mu8jpgu1puBXdFV+fAhqs9RZoR+gG/m7sUK2TGbDA=
Received: from BL1PR13CA0383.namprd13.prod.outlook.com (2603:10b6:208:2c0::28)
 by MN2PR12MB4424.namprd12.prod.outlook.com (2603:10b6:208:26a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Sun, 1 Mar
 2026 13:11:54 +0000
Received: from BN2PEPF00004FBB.namprd04.prod.outlook.com
 (2603:10b6:208:2c0:cafe::1d) by BL1PR13CA0383.outlook.office365.com
 (2603:10b6:208:2c0::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16 via Frontend Transport; Sun,
 1 Mar 2026 13:11:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF00004FBB.mail.protection.outlook.com (10.167.243.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Sun, 1 Mar 2026 13:11:54 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 1 Mar
 2026 07:11:52 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Yijun.Shen@Dell.com>, <Sanket.Goswami@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 2/7] platform/x86/amd/pmf: cache BIOS output values for user-space metrics via util IOCTL
Date: Sun, 1 Mar 2026 18:41:19 +0530
Message-ID: <20260301131124.1370565-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260301131124.1370565-1-Shyam-sundar.S-k@amd.com>
References: <20260301131124.1370565-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBB:EE_|MN2PR12MB4424:EE_
X-MS-Office365-Filtering-Correlation-Id: 51ab9879-87f1-4468-4e1e-08de77941c25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	CrTR9Eoz172fVR6E0DiTdh7EaMiMnQi4L6ZqwFdRBE6+V2UB1k3TpjCCHQElcDN7EmlRtiOQSzPL37adyhBbzvk08d9WK45vQDg4Y7is71eJktwZaU35HXA9cXqXc64twwy8RvgvEN9x0G1IH526WJoLMNdNOmL8wAflKLKW7hnxIPKwcBO9jvE8vbH/gvUXuaQqJKGe+h11miNAxFltJs8iLBmSJIf/Mi6URQq37niYJg1MIiGwunAOH0Bl4BgRe3l0POzwjvpY9+IUTNOwhoKHZKoYYBSWecU7tq8UEJIyOhiklNbkbuaLSeiKoRlpqGtxaw6nVC+axAXVb+wiF2lrD3LSLYKMUcxWwR+Yx6n30O614Odr9bPhrmdwMm8NF1z8vK/nxka82rasEDQ8r4LSy3U9jE5xTv5agT2hJkuA7ZkfbXrWWGAuZ9tP7UD31QeRjYK/8lic83lKuIblkjgmuVvXaUoGON0ohdLYVlJH3zaOFgUOXNmHqg3m9rCORRyM2kPgke62HQjb4Tcn8YiyNy+C4zT4fWMW+2Mr7JdtADi0H30n59TimIfw0ohRoutGuU8k4rJk6d+NbqZ2a2ROQ42NPi+tz07jv6cRG+jOkrO6EZY/BFMOBzfnUwqBRXVtojFUhv6iqu4kGS5qcbdUGtd1wy+VA3PSaUFgK7NKMMmtsM4stzrPyFVwTYoT4UoW0c/Yca4CxZ9lLD7OCCpVK3hdPJSqIL8nndkKJv+6y/eqZSOmYog3tcOg3yHP61FY5oFwnAjZPDJzJt0ZtHDCfGe/ZlXbljxZxsteGKvilksAN6JDsR8SZf7ApQ0XO04GDcADFPvhGBH7hMBTZQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	udUp4rHXWJ6PZExwsK3xT8cogf+lL2+aA+ME9WQTdqK7qI/tXl+pHhSy7kYuoHLyes5fWA/SlSqID/fiHJkgTUHMsZ561gCk4UPIJDOjclDLjxRzYx/izPvHeVJ+CPM3va/OOgidyXOlpcEXn5QQ2CVxEK75lVFNG1pkT7ceXkYZhMdGh01iQDSWz7X1rk5BKlnNBti9P7z64Cf+s42RpxbhbQcQxN9JlV/LiUYSmRRw32njJGYb6eIXtuWaCK+3v3iJ4Vm91UkxX4zDS3nSMtUx5sXksnM3g+WSV7zdlC7xnbw//dU6AWcTDEqDvuYBA4ixwAfF/JeFjXl72A2yvVGTinMfDGxcj1UT8gXtDiGP+0kU8g/3Tf9rGCE00Rtm7041v3NpcfIaDOcH6vU/AO/MwUkogOfRP5YgO1sgqIZfjwOwWhrFZkVC72MJiElN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 13:11:54.3861
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51ab9879-87f1-4468-4e1e-08de77941c25
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4424

Add a bios_output[] cache to amd_pmf_dev and store the latest values for
BIOS output policies when applying PMF policies. This enables the AMD PMF
util layer to expose these BIOS outputs alongside selected thermal and
power metrics to user space via /dev/amdpmf_interface and a new IOCTL,
supporting real-time monitoring tools such as SystemDeck.

The bios_output array is initialized to zero during device probe, and
bounds checking is added to prevent potential buffer overflows when
caching values.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c   |  3 +++
 drivers/platform/x86/amd/pmf/pmf.h    |  1 +
 drivers/platform/x86/amd/pmf/tee-if.c |  9 ++++++++-
 drivers/platform/x86/amd/pmf/util.c   | 15 +++++++++++++++
 include/uapi/linux/amd-pmf.h          | 22 +++++++++++++++++++++-
 5 files changed, 48 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 919d02f30aae..b5cab7c937ce 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -634,6 +634,9 @@ static int amd_pmf_probe(struct platform_device *pdev)
 
 	pmf_device = dev->dev;
 
+	/* Initialize BIOS output cache for util layer */
+	memset(dev->bios_output, 0, sizeof(dev->bios_output));
+
 	err = amd_pmf_cdev_register(dev);
 	if (err)
 		dev_warn(dev->dev, "failed to register util interface: %d\n", err);
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 6f61076a9386..0d879f0fd8e2 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -442,6 +442,7 @@ struct amd_pmf_dev {
 	struct pmf_cbi_ring_buffer cbi_buf;
 	struct mutex cbi_mutex;		     /* Protects ring buffer access */
 	struct mutex metrics_mutex;
+	u32 bios_output[10];
 };
 
 struct apmf_sps_prop_granular_v2 {
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 7ccd93f506b2..f749115bf970 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -98,10 +98,17 @@ static int amd_pmf_get_bios_output_idx(u32 action_idx)
 static void amd_pmf_update_bios_output(struct amd_pmf_dev *pdev, struct ta_pmf_action *action)
 {
 	u32 bios_idx;
+	int ret;
 
 	bios_idx = amd_pmf_get_bios_output_idx(action->action_index);
+	if (bios_idx >= ARRAY_SIZE(pdev->bios_output)) {
+		dev_warn(pdev->dev, "BIOS output index %u out of bounds\n", bios_idx);
+		return;
+	}
 
-	amd_pmf_smartpc_apply_bios_output(pdev, action->value, BIT(bios_idx), bios_idx);
+	ret = amd_pmf_smartpc_apply_bios_output(pdev, action->value, BIT(bios_idx), bios_idx);
+	if (!ret)
+		pdev->bios_output[bios_idx] = action->value;
 }
 
 static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
diff --git a/drivers/platform/x86/amd/pmf/util.c b/drivers/platform/x86/amd/pmf/util.c
index c6837caa44e0..59a125deb6b6 100644
--- a/drivers/platform/x86/amd/pmf/util.c
+++ b/drivers/platform/x86/amd/pmf/util.c
@@ -22,6 +22,9 @@ static int amd_pmf_get_bios_idx(u32 control_code)
 	if (control_code >= IOCTL_BIOS_INPUT_1 && control_code <= IOCTL_BIOS_INPUT_10)
 		return control_code - IOCTL_BIOS_INPUT_1;
 
+	if (control_code >= IOCTL_BIOS_OUTPUT_1 && control_code <= IOCTL_BIOS_OUTPUT_10)
+		return control_code - IOCTL_BIOS_OUTPUT_1;
+
 	return -EINVAL;
 }
 
@@ -34,6 +37,15 @@ static long long amd_pmf_populate_bios_input(struct ta_pmf_enact_table *in, u32
 	return (idx < 2) ? in->ev_info.bios_input_1[idx] : in->ev_info.bios_input_2[idx - 2];
 }
 
+static long long amd_pmf_populate_bios_output(struct amd_pmf_dev *pdev, u32 control_code)
+{
+	u32 idx;
+
+	idx = amd_pmf_get_bios_idx(control_code);
+
+	return pdev->bios_output[idx];
+}
+
 static long long amd_pmf_device_state(struct ta_pmf_enact_table *in, u32 control_code)
 {
 	switch (control_code) {
@@ -101,6 +113,9 @@ static int amd_pmf_populate_data(struct device *dev, void __user *argp)
 	case IOCTL_SOCKET_POWER:
 		output.val = in->ev_info.socket_power;
 		break;
+	case IOCTL_BIOS_OUTPUT_1 ... IOCTL_BIOS_OUTPUT_10:
+		output.val = amd_pmf_populate_bios_output(pdev, output.control_code);
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/include/uapi/linux/amd-pmf.h b/include/uapi/linux/amd-pmf.h
index d29431c67eaa..f93767248169 100644
--- a/include/uapi/linux/amd-pmf.h
+++ b/include/uapi/linux/amd-pmf.h
@@ -60,6 +60,16 @@
  * @IOCTL_MAX_C0_RES: Query maximum C0 residency
  * @IOCTL_SOCKET_POWER: Query current socket power consumption
  * @IOCTL_TA_BIN_VER: Query Trusted Application binary version
+ * @IOCTL_BIOS_OUTPUT_1: Query BIOS output parameter 1
+ * @IOCTL_BIOS_OUTPUT_2: Query BIOS output parameter 2
+ * @IOCTL_BIOS_OUTPUT_3: Query BIOS output parameter 3
+ * @IOCTL_BIOS_OUTPUT_4: Query BIOS output parameter 4
+ * @IOCTL_BIOS_OUTPUT_5: Query BIOS output parameter 5
+ * @IOCTL_BIOS_OUTPUT_6: Query BIOS output parameter 6
+ * @IOCTL_BIOS_OUTPUT_7: Query BIOS output parameter 7
+ * @IOCTL_BIOS_OUTPUT_8: Query BIOS output parameter 8
+ * @IOCTL_BIOS_OUTPUT_9: Query BIOS output parameter 9
+ * @IOCTL_BIOS_OUTPUT_10: Query BIOS output parameter 10
  *
  * These control codes are used with the IOCTL_PMF_POPULATE_DATA ioctl
  * to specify which metrics data to retrieve from the AMD PMF driver.
@@ -90,7 +100,17 @@ enum pmf_ioctl_id {
 	IOCTL_AVG_C0_RES = 36,
 	IOCTL_MAX_C0_RES,
 	IOCTL_SOCKET_POWER = 50,
-	IOCTL_TA_BIN_VER
+	IOCTL_TA_BIN_VER,
+	IOCTL_BIOS_OUTPUT_1,
+	IOCTL_BIOS_OUTPUT_2,
+	IOCTL_BIOS_OUTPUT_3,
+	IOCTL_BIOS_OUTPUT_4,
+	IOCTL_BIOS_OUTPUT_5,
+	IOCTL_BIOS_OUTPUT_6,
+	IOCTL_BIOS_OUTPUT_7,
+	IOCTL_BIOS_OUTPUT_8,
+	IOCTL_BIOS_OUTPUT_9,
+	IOCTL_BIOS_OUTPUT_10
 };
 
 /**
-- 
2.34.1


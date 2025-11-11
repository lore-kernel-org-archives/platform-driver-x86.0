Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010059.outbound.protection.outlook.com [52.101.193.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E88D2D9786
	for <platform-driver-x86@vger.kernel.org>; Tue, 11 Nov 2025 06:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762843116; cv=fail; b=cZgy63SSFOh14eoBXWZB36pMRjDS2Z8ZRRaLaYp2KIKfIQXwfWSn168xu2U9rkJdYSacmWXgOdrScMK8CgIVZtzG0GodYa4pB/6ML8vPvDOrhs7nf0CJqiQHR66UxxA4nSbgKoc1qBi22RHG4Wv/kgDizlIsvUccXrhYdqzw+cQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762843116; c=relaxed/simple;
	bh=bl1g+lI3Jk8hg40HydQ8KFsIudm9dMS/9qI1JvhS7RQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hLkd4y5MggzLfhacQuFFKI4Ox3h1cmWkjjq6anMCUaGGM3sfZfs921wJjTna1F8Yt3TjbEVxvlbs30N6ljJsBQgsXcanBQFKiofSUTVdpjI4O4WOVyGk+/iGZkdUxBlKGfJgdsiS5UYZInyFy8gm5lU61GZFw00Jz0FcRgVlNKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=O4Z4jsMr; arc=fail smtp.client-ip=52.101.193.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="O4Z4jsMr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oIcHIxki+naH3ITXakOkIMdqjRgcuRmfMGj5Xckssndu+t/7nxc2UjCoZDt338nlA8eIy3dJXxPezJFMyFbyZ0hUw4e7kbU3YSO2b65O+pKD3V14yC5gvqiUWGDreEBcqIrck2L46aIO7lwaFCBUcJVoWsLuOdPNt+2m7hsGX3sf2XVyjNwmHY8SNHJw0YnX3EXyJ3w1DAxrh9SJcw/Kjd0H8PlmuEA0Ui10Sa7fXLUX9rU3gGCtG/ZDSp53rE//evxZq9nDVI2dbGAQySMQeEVkZGVdj69PmZZB+kFahWRDYYNZ+CibLgtlMSG5RJPOYMsNstVma5FIfsQcZy8mhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjRRUcmorDJtsLoR+rI4gz4U0evG6pnfFRxZLvMljiM=;
 b=Xqfx8OTYRiDbOUcIzbpCoUAPuEpLO2BPuXbsCIEfroy7xncxE4lEiSIZ6sK5pdyHyeihHFgKF7D9iLjH3uDd+82pMfWOdhJjhCCtyyUfRGzAUi9AU9veD803tHVbeezcZohMxNKiRYK60NioBViCCQXALrjdcMXY4uy1Ol/tfGYsTI1RxayBT6MtdQ7Vi6Quh1EEc5GKI+8OPf4gm2EjZB8kJ0EVvhzN7ao6VPMk8aHXtSsUKo4yt85pnqL8cCbsdPFokFoe2vTiQMceKpjfTBUk/hm6OQlcWjBWims/Vh7fECqmJ5yx8t5L0Ohm9Qk7TFWRUGcxiFtM120g0kk1kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjRRUcmorDJtsLoR+rI4gz4U0evG6pnfFRxZLvMljiM=;
 b=O4Z4jsMripSN52VkKE9zMAyrvE142VUjFFGROF1p6wgqY1KWFfcuxy4yZN/72TLEhdNRFOMdzTwEnNoEQuLzCHkmWEfOcZONp183UCh6H+wQLbdX6TKieiWHup3KWq1bsD3DU+Ayfv/PSpPi/SuxE0AHzjvMdM4kEExj0mUbKIY=
Received: from CH0P221CA0009.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11c::11)
 by SJ0PR12MB5636.namprd12.prod.outlook.com (2603:10b6:a03:42b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 06:38:30 +0000
Received: from CH1PEPF0000AD7B.namprd04.prod.outlook.com
 (2603:10b6:610:11c:cafe::5b) by CH0P221CA0009.outlook.office365.com
 (2603:10b6:610:11c::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.15 via Frontend Transport; Tue,
 11 Nov 2025 06:38:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD7B.mail.protection.outlook.com (10.167.244.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Tue, 11 Nov 2025 06:38:30 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 10 Nov
 2025 22:38:26 -0800
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <lizhi.hou@amd.com>, VinitKumar Shukla
	<VinitKumar.Shukla@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 5/5] accel/amdxdna: Provide real-time NPU power estimate via AMD PMF
Date: Tue, 11 Nov 2025 12:07:37 +0530
Message-ID: <20251111063737.4156385-6-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251111063737.4156385-1-Shyam-sundar.S-k@amd.com>
References: <20251111063737.4156385-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7B:EE_|SJ0PR12MB5636:EE_
X-MS-Office365-Filtering-Correlation-Id: 28b51cde-9940-406a-85b7-08de20eceda5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mKIVm8m/rWSC75fIrdH5MA88P2ga2KX1mtmJteVI1T/DZedF2sXxGGYCZmAG?=
 =?us-ascii?Q?WV5asCMo90dFgTHHyRxfsmVCq2SqCPKT50Mpdw4ZK+ZJcAMzQ7VXzo76FQDE?=
 =?us-ascii?Q?FHQPJORSYsLSMx8MGCrsI7vUIb3dgY4iER0MUWd5sE8J88lkMiIjZqw/VQ1/?=
 =?us-ascii?Q?QriaKyGn6FkENRsbKvjamo08jhlOwXPydHKRohUs637+njcnTEbAQ4EYQWmI?=
 =?us-ascii?Q?Qr7XYRYUPdpdJhl4JdLllBhK+4fmqiYdKXU3FfOaN6cisHAzEwzlz/6CHdaG?=
 =?us-ascii?Q?XQeJlH1tZXDTrfp+5s8ErBpKxmI+mMYHG1PXj7J5tnBfX8sun/3G3MFDCWky?=
 =?us-ascii?Q?O52UtBkXldGLiPjK0SXIvCmaG31ZT6LaiByS9GVzV4LXpIwOB4zuqS0kpwNk?=
 =?us-ascii?Q?X4fCfNr0p4Uy1kZss09YogZ4POxDjDnR7JCSCn1VVYoMPJmK1mPwKYgHKdjD?=
 =?us-ascii?Q?mGQAfZ9oepDiNNfxQ/qwwGDbRlqroNF/A1H8ETheR810zWVWFShGk0cKddRJ?=
 =?us-ascii?Q?6uA7Qw7R/wl59WFw39cg+PGlFm4jS0b4VrHVjKGnG8GqFnoGmVKCO0TTFtnC?=
 =?us-ascii?Q?85Wow6e3rxn8KsFqZjlGtLyHG8aPRmZriFVj4HJs3hCiIb3Ok0tmoXyNOiHh?=
 =?us-ascii?Q?1KHvxKJ7szU/IWKjyqk7MQUbHtc1X05rVLRsSU++KK1ouy8sldgP1G2tPLiY?=
 =?us-ascii?Q?G1ZRqOKqsbwEy6pnbthrplGycsCQApc3qButUKiH0Qdp+6nAWdCu0KlR4ZhS?=
 =?us-ascii?Q?cJJD7iNFEam7mLe+F+vx9LzNsboblLS+XY2wj+ZxFMzKKCccoSBcll9KzoFe?=
 =?us-ascii?Q?E59jMXDXJmhVgTVS3rz+fjGFFgC771/rtVK1lZ+fDnrxrhC0VLOgzExYyNMy?=
 =?us-ascii?Q?WrPBkaCwKGaq0dPSs823sQzTAv6EkulEE601Zi+FScsxTis5hWclFqimPYS9?=
 =?us-ascii?Q?yaSzS208OQnHMsJtknhAApmbV5gOVq5jK17ifEUJyy9FzHUV7uJjyI9DlDlo?=
 =?us-ascii?Q?32IWfbZnu7dOdzEl4RwUzAMiKj4fI8fz2vR580YSowl2I0IxRrMYO9A8VGZW?=
 =?us-ascii?Q?EfUVCOQd1XBgztyjcSolV7CejcMBRjkUrsTvQB+ZXpcne+srrbhBGd7hPT7a?=
 =?us-ascii?Q?iXXUBBxmJxYDHOmKx2dHEZa0qvnYfeJmngxh1bnnZdssPl+4equxsBxPiG+f?=
 =?us-ascii?Q?lIY+2ShjjqWZktTMDq0Ha3EwlqE0eOQWuVoLyByGbDXkZjpal92eQcGI9+ru?=
 =?us-ascii?Q?NlR1rBENrzOH7PwZW4C2x9uxl6uiwhlfTfSSAomUf1SBGWS+5LrLBLmneBKK?=
 =?us-ascii?Q?mLkKui1IM/aunfyj5TfuI/IwnhqGeh/cC+qCkjpbgUkHritJGR51h2VcG0+P?=
 =?us-ascii?Q?EWOSFpOtkSuwcpCiJgzh3Cf94KwdtyDVQYy1aqVR+kN+1oVTO5/D+mdXJYYO?=
 =?us-ascii?Q?kNQ8vVt/79rr7AGbUN/0zOb4QVhAADZpORUqd92+HjA5Wwgk4qGxUdanhgR+?=
 =?us-ascii?Q?srAUD1Jtls4lAblaBVExli8oXSvNR9yN5Yt+boRqnbPtbpNNQWeZ6ZGLaImw?=
 =?us-ascii?Q?NDVOptJ/ODgrMfZ4TlE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 06:38:30.4076
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28b51cde-9940-406a-85b7-08de20eceda5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5636

From: VinitKumar Shukla <VinitKumar.Shukla@amd.com>

Add aie2_smu_get_power_estimate() to obtain NPU power readings from the
AMD PMF driver. This xdna interface enables user space to reflect current
workload power consumption in real time.

Signed-off-by: VinitKumar Shukla <VinitKumar.Shukla@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/accel/amdxdna/aie2_pci.h |  2 ++
 drivers/accel/amdxdna/aie2_smu.c | 12 ++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
index 91a8e948f82a..5601de841b5b 100644
--- a/drivers/accel/amdxdna/aie2_pci.h
+++ b/drivers/accel/amdxdna/aie2_pci.h
@@ -8,6 +8,7 @@
 
 #include <drm/amdxdna_accel.h>
 #include <linux/semaphore.h>
+#include <linux/amd-pmf-io.h>
 
 #include "amdxdna_mailbox.h"
 
@@ -240,6 +241,7 @@ int aie2_smu_init(struct amdxdna_dev_hdl *ndev);
 void aie2_smu_fini(struct amdxdna_dev_hdl *ndev);
 int npu1_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level);
 int npu4_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level);
+int aie2_smu_get_power_estimate(void);
 
 /* aie2_pm.c */
 int aie2_pm_init(struct amdxdna_dev_hdl *ndev);
diff --git a/drivers/accel/amdxdna/aie2_smu.c b/drivers/accel/amdxdna/aie2_smu.c
index d303701b0ded..7b5e2c383dd3 100644
--- a/drivers/accel/amdxdna/aie2_smu.c
+++ b/drivers/accel/amdxdna/aie2_smu.c
@@ -54,6 +54,18 @@ static int aie2_smu_exec(struct amdxdna_dev_hdl *ndev, u32 reg_cmd,
 	return 0;
 }
 
+int aie2_smu_get_power_estimate(void)
+{
+	struct amd_pmf_npu_metrics npu_metrics;
+	int ret;
+
+	ret = amd_pmf_get_npu_data(&npu_metrics);
+	if (ret)
+		return ret;
+
+	return npu_metrics.npu_power;
+}
+
 int npu1_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
 {
 	u32 freq;
-- 
2.34.1


Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011013.outbound.protection.outlook.com [52.101.52.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C1E45198A;
	Mon, 12 Oct 2026 08:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791795327; cv=fail; b=a2mPV1AB3CmGqD+H5UdXY8J1JUFiNJxs8BEjDwlHDOB9Sq1bczBDcdvtmLq0eLeANy3ywJWxs88qkqDjhDrR9bqDlcotTIo47C9o3WhGog3we+7INS38ljFm9K+Ci4BSWi5QiAPICXC+JCNFZ5EBFawT+BGsOD+vz0k6RPXDFnw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791795327; c=relaxed/simple;
	bh=lLJVLCGDp9U3loCiGB+sSQ4VYCgoMvGrzseMxAoBR70=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SgVeCnAgyGk4y3Pf79wVh5hDEu8bOVgzSmCLWXvRdsokJzFuKT4MLkiZFUbIhk8NrBMW6DTJE2cHa3pYhlmN4YdeiRbq9XQ5eUeOiYWAA/WWVnD+aE5a+igaYxMprHGKClY5TnPMUvdQ6JD9DW3yriwTIH8VzlE9vC452aaF9wU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=m5yOrJ30; arc=fail smtp.client-ip=52.101.52.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="m5yOrJ30"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hMvuaVphtwJsUfsJT2lWLkB196RVzpyXvyO8urTO+YuINhnJoMsn2ZJWnT9lTeWwrHQNCoqLAZYu4xcX+tgbmdDg1ldv67MmpoTsbLegiM0XwOYXhx/FhnpL6H36vMTFep/XVHSP7PScGUCQO3xucH6oFtf7+vpMvINGzEjPumEYtJb7C+GObO0LVElIYoLH79jQld3T5nRCC577fHLSLjwCsngpNQR1JcpFeR/FpZtMGb/i9RVhG3Uu5a01miXH50zPvC2yVOV/X0Rkw7hhkWWOz9mCbupEw0L1u3Qrn2UGknLqJQTVQdBKQnSMWOqXgNosQLwuhf927DKiipByYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bshFA+oBOBdFXm9PGuxS6rQ/qPQKdLnWUqICn/RQyKc=;
 b=kG//D4Qb5YkUP9NdeCIcLkqO7C5GgP9vgZuq7uwdFCwtdcb5UiyamI3aKQzas/VfMxVsfknAJ4V5XUDm4Vp+CG2QiSn67vhXBSrLL7BBDJlhc60xgSLoTSWGUYijWi0QmI0zhblN+llDYX0O1EvpX+5W950v1WAcXiC9xJ2V8DJHs/1knb9aTaiDnBKQVWcYLjE7V5nDJp98m/PlzNzn4nOmu98G2f3aQNEeXAYEvkWCNavHoi9/yUUw3L0ILj6fyEINcmWJZcd1vTBjnrKap25EI4fHx4oeCW7EupOP2xn28myhbsw8OdfprvWMbhE+kQ0EFbUs+XJX5UCyaEzGUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bshFA+oBOBdFXm9PGuxS6rQ/qPQKdLnWUqICn/RQyKc=;
 b=m5yOrJ30zMwrRgEih1aJn2bb1/OGVokFtpKyvyDwxX7rhjsbzJwrfXzydI14NmtvxoFId37rT/YA/vWk49JMZ/fZD1QrhYH4z50kePatJiXnBa2RCiBjEb1vazWHsHm8cqTVRSwJLRy8JPFJmLeNBPoplmo+1GbljQHlQlRq4a8=
Received: from SJ0PR05CA0108.namprd05.prod.outlook.com (2603:10b6:a03:334::23)
 by MN0PR12MB5761.namprd12.prod.outlook.com (2603:10b6:208:374::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 08:54:33 +0000
Received: from SJ5PEPF00000203.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::9d) by SJ0PR05CA0108.outlook.office365.com
 (2603:10b6:a03:334::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Mon, 12
 Oct 2026 08:54:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF00000203.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 12 Oct 2026 08:54:32 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 12 Oct
 2026 03:54:24 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Mario Limonciello
	<superm1@kernel.org>
Subject: [PATCH v9 4/4] platform/x86/amd/hsmp: Document and expose client telemetry table in UAPI
Date: Mon, 12 Oct 2026 14:24:07 +0530
Message-ID: <20261012085407.1202295-5-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261012085407.1202295-1-muralidhara.mk@amd.com>
References: <20261012085407.1202295-1-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000203:EE_|MN0PR12MB5761:EE_
X-MS-Office365-Filtering-Correlation-Id: 99e5d41e-3c6a-4459-9732-08df283e6f3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|23010399003|5023799004|11063799006|56012099006|261009223027099003|10067099003|22082099003|18002099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info:
	QqtG6FMWrHknbNndHrbHpxnUPI7ZGJsIcWMoF0ZEYhOlFQ9wxnzY7UkE/pXwIEvTU7Nfe1/9ZL+SBoowjI9oH6m+jZFjZqmS4zLqoYUb7clUQxor6u8slUwNN+MQ8UOknlxMijLvaYbSVbHr9EvjPrBnHKR3xihrMQJIF8bu+0MSEddJ1lyxdS5jsdMeXgmUmkcRPPqIpM28D1ZYJypsyfJFHCCkBhwx+ghOxz8SajqAS6TIrVTwZsdeJiHiCgO8LCHi9KTT84PN19Y+4nsKgO/Tj/tOXkWpju2iiafxINwGNp4T76q5apJRAGyp4huR9WwU8BBsDhn7CjD4sSJ8E5o6pI5erRjZ2iZzFlfo9OAsbhrvHP3jm7LjVuynMleD8WNIjKg1nh+DCxVW0nwdm5tRj9rRKWwIaJE3Brlsenbun5eVfv9lCrnPtQXxqde2puq8SIkcCq+S7GOFyjztssd2j2n8nJzH9PuQ2ZDahw7wdnib8UhE4Bm3+Pd63lS7G29mmBuGSyCsU5xFmwIU8FcRxEHoprZiuvixMFrkzikV+kYGU6hLBfWR1aShWg5bUOkRnyExeIFfMcbUC26aO3eFL8lNmj3U0fuybJTu7zdeQE/viN19SX3kgjU6FICLd7Thamb4m4MSkYsNq9I4cb0xeMaIjtMUdQjvguwOGt11iM7qeULioXm+cU6RcKxI5vCqIMI+1YZRNp0lvQyzHw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(23010399003)(5023799004)(11063799006)(56012099006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	L4m7/P3oco2UCQBQ/5FZikUGynBTJHcElMpOw0s52T0h4OWFByGEtHxfkUI8hlWvXMxMpshUY4SGSfsmqoPmkcWO+Zx9pS/Pcv6XD4jG7My2RUpLAFR6nDMfrNfdJ0a8WkjJpuxkVXnzZxQqZsj2IH8M6tMYGh40CmapVRlxLU5uGzk4XG4mq82smd1ZKT2XUeiHZ57Yt8qR8DY6elVNUY9g2CSQ/Bvzy1miJTc/BH4Y29I4bmxosiCWNOJ0PJpdZQJ/uOqXZVOyujso2bbSpt/7up8LxjBQDkUM3U7euIcTYLtf5yq6JHIz66pCt7j2+DWoaLeWB1Bccopx57iz49b4Qj7WGJ/99h8NJpC3xpOSImauSX/YIg/MdV80IqzjtOaNqHXn9aSAH7GwZbtS4XvrueXrbDwYLX2KyHKniZUM3qN4FPGp/KHqcNpdMiXT
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 08:54:32.7934
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99e5d41e-3c6a-4459-9732-08df283e6f3c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000203.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5761

Add struct hsmp_telemetry_table_rm to the UAPI header, describing the
Ryzen Master SMC telemetry table (table version 5, as reported by
HSMP_CLIENT_GET_METRICS_TABLE_VER) returned by
HSMP_CLIENT_GET_METRICS_TABLE on the Family 1Ah client models, now
that the previous commit wires that message up to a usable DRAM
mapping.

Point amd_hsmp.rst at struct hsmp_telemetry_table_rm instead of
duplicating the layout in prose. The Public PPR for the model in use
remains the reference for units and encodings.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
 Documentation/arch/x86/amd_hsmp.rst  |  14 ++
 arch/x86/include/uapi/asm/amd_hsmp.h | 257 +++++++++++++++++++++++++++
 2 files changed, 271 insertions(+)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index b95f09945193..c483c68dcfad 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -221,9 +221,23 @@ The following IOCTLs are defined:
   ``sizeof(struct hsmp_metric_table)``.  Later version metrics table
   layout is documented in the Public PPR.
 
+  The Family 1Ah client models carry their own telemetry table instead,
+  described in `Family 1Ah client telemetry table`_ below.
+
 The ioctl would return a non-zero on failure; you can read errno to see
 what happened. The transaction returns 0 on success.
 
+Family 1Ah client telemetry table
+=================================
+On the Family 1Ah client models, ``HSMP_CLIENT_GET_METRICS_TABLE`` (05h)
+returns the Ryzen Master SMC telemetry table, table version 5 as
+reported by ``HSMP_CLIENT_GET_METRICS_TABLE_VER`` (04h). This is the
+Telemetry Table RM layout, defined as ``struct hsmp_telemetry_table_rm``
+in amd_hsmp.h. The driver copies the table out without interpreting it.
+
+See the telemetry table chapter of the AMD Public PPR for the model in
+use for the units and encodings of its fields.
+
 More details on the interface and message definitions can be found in chapter
 "7 Host System Management Port (HSMP)" of the respective family/model PPR
 eg: https://docs.amd.com/v/u/en-US/55898_B1_pub_0_50
diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
index b4f64b2407b6..dcbe89dc4d2b 100644
--- a/arch/x86/include/uapi/asm/amd_hsmp.h
+++ b/arch/x86/include/uapi/asm/amd_hsmp.h
@@ -827,4 +827,261 @@ enum hsmp_client_message_ids {
 	HSMP_CLIENT_MSG_ID_MAX,
 };
 
+#define HSMP_TELEMETRY_RM_MAX_CCX		4
+#define HSMP_TELEMETRY_RM_CORES_PER_CCX	12
+#define HSMP_TELEMETRY_RM_FREQ_TABLE_SIZE	8
+#define HSMP_TELEMETRY_RM_NPU_BUSY_DOMAINS	3
+#define HSMP_TELEMETRY_RM_OC_DOMAINS		5
+#define HSMP_TELEMETRY_RM_OC_SUBDOMAINS	5
+#define HSMP_TELEMETRY_RM_OC_GUARDBANDS	3
+
+/* Firmware packs this table to a 4-byte boundary */
+#pragma pack(push, 4)
+
+/*
+ * struct hsmp_telemetry_table_rm_iod - I/O die counters for RM telemetry.
+ *
+ * Accumulator (*_acc) fields are monotonic counters; consumers derive
+ * deltas across two snapshots and normalise by accumulation_counter.
+ */
+struct hsmp_telemetry_table_rm_iod {
+	__u32 accumulation_counter;
+
+	/* SET VOLTAGES */
+	__u64 vddcr_set_voltage;
+	__u64 vddcr_soc_set_voltage;
+	__u64 vddcr_npu_set_voltage;
+	__u64 vddcr_lp_set_voltage;
+	__u64 vddcr_gfx_set_voltage;
+	__u64 vdd_misc_set_voltage;
+
+	/* TELEMETRY VOLTAGES */
+	__u64 vddcr_telemetry_voltage;
+	__u64 vddcr_soc_telemetry_voltage;
+	__u64 vddcr_npu_telemetry_voltage;
+	__u64 vddcr_lp_telemetry_voltage;
+	__u64 vddcr_gfx_telemetry_voltage;
+	__u64 vdd_misc_telemetry_voltage;
+
+	/* TELEMETRY POWERS */
+	__u64 vddcr_telemetry_power;
+	__u64 vddcr_soc_telemetry_power;
+	__u64 vddcr_npu_telemetry_power;
+	__u64 vddcr_lp_telemetry_power;
+	__u64 vddcr_gfx_telemetry_power;
+	__u64 vdd_misc_telemetry_power;
+
+	/* THROTTLERS - FAST PPT */
+	__u32 fppt_fused_limit;
+	__u32 fppt_max_irm_limit;
+	__u32 fppt_max_pbo_limit;
+	__u32 fppt_limit;
+	__u64 fppt_value_acc;
+	__u32 fppt_residency_acc;
+
+	/* THROTTLERS - SLOW PPT */
+	__u32 sppt_fused_limit;
+	__u32 sppt_max_irm_limit;
+	__u32 sppt_max_pbo_limit;
+	__u32 sppt_limit;
+	__u64 sppt_value_acc;
+	__u32 sppt_residency_acc;
+
+	/* THROTTLERS - SPL */
+	__u32 spl_fused_limit;
+	__u32 spl_max_irm_limit;
+	__u32 spl_max_pbo_limit;
+	__u32 spl_limit;
+	__u64 spl_value_acc;
+	__u32 spl_residency_acc;
+
+	/* THROTTLERS - TDC VDDCR */
+	__u32 tdc_vddcr_fused_limit;
+	__u32 tdc_vddcr_max_irm_limit;
+	__u32 tdc_vddcr_max_pbo_limit;
+	__u32 tdc_vddcr_limit;
+	__u64 tdc_vddcr_value_acc;
+	__u32 tdc_vddcr_residency_acc;
+
+	/* THROTTLERS - TDC VDDCR SOC */
+	__u32 tdc_vddcr_soc_fused_limit;
+	__u32 tdc_vddcr_soc_max_irm_limit;
+	__u32 tdc_vddcr_soc_max_pbo_limit;
+	__u32 tdc_vddcr_soc_limit;
+	__u64 tdc_vddcr_soc_value_acc;
+	__u32 tdc_vddcr_soc_residency_acc;
+
+	/* THROTTLERS - TDC VDDCR NPU */
+	__u32 tdc_vddcr_npu_fused_limit;
+	__u32 tdc_vddcr_npu_max_irm_limit;
+	__u32 tdc_vddcr_npu_max_pbo_limit;
+	__u32 tdc_vddcr_npu_limit;
+	__u64 tdc_vddcr_npu_value_acc;
+	__u32 tdc_vddcr_npu_residency_acc;
+
+	/* THROTTLERS - TDC VDDCR LP */
+	__u32 tdc_vddcr_lp_fused_limit;
+	__u32 tdc_vddcr_lp_max_irm_limit;
+	__u32 tdc_vddcr_lp_max_pbo_limit;
+	__u32 tdc_vddcr_lp_limit;
+	__u64 tdc_vddcr_lp_value_acc;
+	__u32 tdc_vddcr_lp_residency_acc;
+
+	/* THROTTLERS - TDC VDDCR GFX */
+	__u32 tdc_vddcr_gfx_fused_limit;
+	__u32 tdc_vddcr_gfx_max_irm_limit;
+	__u32 tdc_vddcr_gfx_max_pbo_limit;
+	__u32 tdc_vddcr_gfx_limit;
+	__u64 tdc_vddcr_gfx_value_acc;
+	__u32 tdc_vddcr_gfx_residency_acc;
+
+	/* THROTTLERS - EDC VDDCR */
+	__u32 edc_vddcr_fused_limit;
+	__u32 edc_vddcr_max_irm_limit;
+	__u32 edc_vddcr_max_pbo_limit;
+	__u32 edc_vddcr_limit;
+
+	/* THROTTLERS - THERMAL */
+	__u32 thm_fused_limit;
+	__u32 thm_limit;
+	__u64 thm_value_acc;
+	__u32 thm_residency_acc;
+	__u32 prochot_residency_acc;
+	__u64 gfx_temp_acc;
+	__u64 soc_temp_acc;
+	__u32 p3t_fused_limit;
+	__u64 p3t_value_acc;
+
+	/* POWER */
+	__u64 system_power_acc;
+	__u64 apu_power_acc;
+	__u64 dgpu_power_acc;
+	__u64 npu_power_acc;
+
+	/* FREQUENCIES */
+	__u64 fclk_freq_eff_acc;
+	__u64 memclk_freq_eff_acc;
+	__u64 lclk_freq_eff_acc;
+	__u64 gfxclk_freq_eff_acc;
+	__u64 socclk_freq_eff_acc;
+	__u64 vclk_freq_eff_acc;
+	__u64 vpeclk_freq_eff_acc;
+	__u64 aieclk_freq_eff_acc;
+	__u64 npuhclk_freq_eff_acc;
+
+	/* BANDWIDTH */
+	__u64 dram_read_bandwidth;
+	__u64 dram_write_bandwidth;
+
+	/* ACTIVITY MONITORS */
+	__u64 gfx_busy_acc;
+	__u64 vcn_busy_acc;
+	__u64 npu_busy_acc[HSMP_TELEMETRY_RM_NPU_BUSY_DOMAINS];
+
+	/* STT (Skin Temperature Tracking) */
+	__u32 stt_min_limit;
+	__u64 stt_apu_hot_spot_temp_acc;
+	__u64 stt_hs2_hot_spot_temp_acc;
+	__u32 stt_apu_temp_limit;
+	__u64 stt_apu_skin_temp_acc;
+
+	/* RESIDENCIES - per-CCX CPU off */
+	__u64 cpu_off_residency[HSMP_TELEMETRY_RM_MAX_CCX];
+
+	/* DF P-STATES */
+	__u32 fclk_freq_table[HSMP_TELEMETRY_RM_FREQ_TABLE_SIZE];
+	__u32 uclk_freq_table[HSMP_TELEMETRY_RM_FREQ_TABLE_SIZE];
+	__u32 ddr_rate_table[HSMP_TELEMETRY_RM_FREQ_TABLE_SIZE];
+	__u8  df_pstate_source[HSMP_TELEMETRY_RM_FREQ_TABLE_SIZE];
+
+	/* SYSTEM */
+	__u8  gfx_disabled;
+	__u8  spare2[3];
+	__u32 gfxclk_fmax;
+	__u8  cclk_core_fuse_enable[HSMP_TELEMETRY_RM_MAX_CCX][HSMP_TELEMETRY_RM_CORES_PER_CCX];
+	__u8  cclk_core_enabled[HSMP_TELEMETRY_RM_MAX_CCX][HSMP_TELEMETRY_RM_CORES_PER_CCX];
+	__u32 cclk_fmax[HSMP_TELEMETRY_RM_MAX_CCX][HSMP_TELEMETRY_RM_CORES_PER_CCX];
+
+	/* OVERCLOCK CAPABLE */
+	__u8  cpu_precise_and_direct_oc_capable;
+	__u8  gfx_precise_and_direct_oc_capable;
+	__u8  pbo_basic_oc_capable;
+	__u8  pbo_advanced_oc_capable;
+	__u8  pbo_nitro_oc_capable;
+	__u8  memory_and_fabric_oc_capable;
+	__u8  misc_oc_capable;
+	__u8  extreme_cold_oc_capable;
+	__u8  down_config_control_capable;
+	__u8  spare0[3];
+
+	/* OVERCLOCK STATUS */
+	__u32 fit_limit_scalar;
+	__u8  ln2_enabled;
+	__u8  cpu_precise_and_direct_oc_enabled;
+	__u8  gfx_precise_and_direct_oc_enabled;
+	__u8  spare1[2];
+	__s8  psm_guardband[HSMP_TELEMETRY_RM_OC_DOMAINS]
+			   [HSMP_TELEMETRY_RM_OC_SUBDOMAINS]
+			   [HSMP_TELEMETRY_RM_OC_GUARDBANDS];
+	__s32 core_power_limit_offset;
+	__u32 max_freq_offset[HSMP_TELEMETRY_RM_OC_DOMAINS];
+
+	__u64 npu_temp_acc;
+	__u64 df_pstate_residency_acc[HSMP_TELEMETRY_RM_FREQ_TABLE_SIZE];
+	__u32 cclk_fboost;
+
+	/* PMF */
+	__u32 pmf_fast_apu_ppt_limit;
+	__u64 pmf_fast_apu_ppt_value_acc;
+	__u32 pmf_fast_apu_ppt_residency_acc;
+
+	__u32 pmf_slow_apu_ppt_limit;
+	__u64 pmf_slow_apu_ppt_value_acc;
+	__u32 pmf_slow_apu_ppt_residency_acc;
+
+	__u32 pmf_fast_spm_limit;
+	__u64 pmf_fast_spm_value_acc;
+	__u32 pmf_fast_spm_residency_acc;
+
+	__u32 pmf_slow_spm_limit;
+	__u64 pmf_slow_spm_value_acc;
+	__u32 pmf_slow_spm_residency_acc;
+
+	__u32 spare3[5];
+};
+
+/*
+ * struct hsmp_telemetry_table_rm_ccx - Per-CCX core counters for RM telemetry.
+ *
+ * Arrays are sized for the maximum cores per CCX; use the
+ * cclk_core_enabled[] mask in struct hsmp_telemetry_table_rm_iod to tell
+ * which entries are valid.
+ */
+struct hsmp_telemetry_table_rm_ccx {
+	__u64 core_c0[HSMP_TELEMETRY_RM_CORES_PER_CCX];
+	__u64 core_cc6[HSMP_TELEMETRY_RM_CORES_PER_CCX];
+	__u64 core_freq[HSMP_TELEMETRY_RM_CORES_PER_CCX];
+	__u64 core_freq_eff[HSMP_TELEMETRY_RM_CORES_PER_CCX];
+	__u64 core_temp[HSMP_TELEMETRY_RM_CORES_PER_CCX];
+	__u64 core_power[HSMP_TELEMETRY_RM_CORES_PER_CCX];
+};
+
+/**
+ * struct hsmp_telemetry_table_rm - Top-level RM telemetry table.
+ * @iod: I/O die counters and per-rail/per-throttler/SYSTEM telemetry.
+ * @ccx: Per-CCX core counters, one entry per CCX.
+ *
+ * Layout of the table returned by HSMP_CLIENT_GET_METRICS_TABLE on the
+ * Family 1Ah client (Models 80h-8Fh and E0h-E3h), reported as table
+ * version 5 by HSMP_CLIENT_GET_METRICS_TABLE_VER. Units are
+ * firmware-defined; see the AMD HSMP/Ryzen Master SMC spec. Spare
+ * fields are firmware padding and must be preserved.
+ */
+struct hsmp_telemetry_table_rm {
+	struct hsmp_telemetry_table_rm_iod iod;
+	struct hsmp_telemetry_table_rm_ccx ccx[HSMP_TELEMETRY_RM_MAX_CCX];
+};
+
+#pragma pack(pop)
+
 #endif /*_ASM_X86_AMD_HSMP_H_*/
-- 
2.34.1


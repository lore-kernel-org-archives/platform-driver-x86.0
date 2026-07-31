Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011067.outbound.protection.outlook.com [52.101.57.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5827449B2B;
	Fri, 31 Jul 2026 16:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785514577; cv=fail; b=DE+WIpq02Ojx0Hd6QzZH1+BCByvIc6jzy7Tr0RvnkfiuCvYTHeQ6xl6xZqMAER/bePYvuNI7gck9lgOmpnM2ym/FSinNR+N9zGXxL9if4bLqArA/VPpJe33/c6nUMpwzwvuXbxI5cftu7oOaF45EfiIpKCuAkDmK84oPafqSLKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785514577; c=relaxed/simple;
	bh=fpL8Gqf/51t6eqZSbIj5GbKxPaUek8cxzxEbiwJrW90=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T4e0LrzDhV2bIKc3RkS4TuMovCbKUDWJDpAGgoqaxeJHZ8+MIF3/vYylSHIzeMQjtpR3Zm6S2SDA8AbEW6lauzMNtZDa0y9BanA8KTzJUiOxMik8LUvV7Mqbea6Zh9N7qb6Gfdf/Sn3xk8tqk5wtGKkCaQ/JAiYSBVZDWdp/s2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hM82QPKs; arc=fail smtp.client-ip=52.101.57.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hM82QPKs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IF9w5PDsTLJ61u/MKzJt0yA7wXK6YMqjVfTSw911FkVVV9vIvrlyr+0fbTaB/M+Lsy1aIBRKg6D6ZjhEXuRYmXwYa959cJO+95f83dXSqC388nkdreL2/qN1C3wXT6zT6AjSa3DwkEry0BfU3o+zp9yYNBDJ+pG2flKVOxu+4OW7++B55jJPlUCm0ilLI8H7hDBP7i5udhdUyx6jeBE/e5yzfIDXvKWag0xrjHphn5WXunc2ltrxBO6cFN9lSyLGEQMDptaeajT/pgpBW+4w8/SiC0yMq1gCHLnOp2HDsCIHPbhCGfhDNWtj8C02n5jc99pJHbxnp54jIjI2MHWyVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GiJBvLX9CdZNVY/SeCYyFy5KYtbITmmDr93iFeMHrIg=;
 b=hDZTdHTaVtrUkSZLc0JNzP7HzVR8cH/JtlHimQ7DptO+chIR/aAljsnc5yD+k+OfAMMifqX0PRvIe/X+8mhgjgtQmx7xcUOHRqQccn/zS2RiXsEhgq9DazQROtausIAkXTN9cEIkBAAMoQwf3NXkwC9/DSd7BMnFwRKeikHEXWbJ7VEXURny/x9IVg9OCZDFLFwXSnyo6/Dw5UQJyQVea+BTviCmwEnnRouvdqL3gM00Kd6dtFk+DFqMNb+XeZ6BsRDb6AbMXC8AMBnfn6dynQ4AQDsgdIAW8199MIDZAPg52LXbmE+qNoOudOb9tibraPqr6jAOCAr94jUlhjxmpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GiJBvLX9CdZNVY/SeCYyFy5KYtbITmmDr93iFeMHrIg=;
 b=hM82QPKsPaeNMnED31P5BwO4GJtBbfp5mviXBWUy7N8P6t/urxdzEY5E7im04p6+HqiYTtcAKUgQGik5+xwDgmZRuvOBjKrbw8GIFAv/yhRK/2s8qnXZ21bLXyeF/EFgSbJ5CIp8AJb48eV3k34rnXQSQaW0zgIBd7I94OQTqHs=
Received: from CH0PR13CA0035.namprd13.prod.outlook.com (2603:10b6:610:b2::10)
 by PH7PR12MB5656.namprd12.prod.outlook.com (2603:10b6:510:13b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Fri, 31 Jul
 2026 16:15:48 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:b2:cafe::22) by CH0PR13CA0035.outlook.office365.com
 (2603:10b6:610:b2::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.9 via Frontend Transport; Fri, 31
 Jul 2026 16:15:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Fri, 31 Jul 2026 16:15:48 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 31 Jul
 2026 11:15:45 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>, <Mario.Limonciello@amd.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<muthusamy.ramalingam@amd.com>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v2 4/4] Documentation/arch/x86/amd_hsmp: Document the client telemetry table
Date: Fri, 31 Jul 2026 21:45:16 +0530
Message-ID: <20260731161516.2242993-5-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260731161516.2242993-1-muralidhara.mk@amd.com>
References: <20260731161516.2242993-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|PH7PR12MB5656:EE_
X-MS-Office365-Filtering-Correlation-Id: 33a84df0-6f20-48dc-7744-08deef1efb86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|82310400026|1800799024|6133799003|56012099006|5023799004|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6CbgF6pUb1P7xJFFiziPHu6uhR0gUuCmC30e0hrxNP7Pq+bwjUJI4NJY1hO1L9EWNdtMC3mp+nXMjleUZZUwylgZhvQiJ4dFcULyaJvmAKlKKhAYqK4Ov1EcYytOhNGXmkgRxUW6Msh3ziCOS2C5KyJOrdkge+6F8Tdeb3v0gRAP9ESm+brTZ6AtWEpR4agE/xrbLfSfedegOynM1Hz9zv3EVr/qzMPpYoCTyNCNG4aDl5NXdqCxfXOH6ipZzzus0n7jMRca1FAI2ZNLh3NJQ5b6939MyR2w4wkl24IrewBpZ4MWoHnFJdCb5A23nUSq+qgDfvhy2VaDrF4K6PsHas1jwkYSP38uirY1WxQAfwfvNxQVezz9SZUqsSBTyvNz3/ojyhBUZ27BAuTqEyZLNooDN9zRzJ9wy++6rr98XuZ0dfXFq0AGVQ6rlxJHrgrLu9gIBU/277MEH1qWLBnmid4jJo5s5BSXFmTXalsQxL+xYan+OP+uHDssv/owXE9yyhmEkorvKmF29nQMzX7Y6P7DzRM/Dnp96ZrwWHGV9yDLDvtMRaWlvngX7MSRHquOKKEEzvQarp43WhWA1PtZbSKHmYSyjvaOylIrOStZI4CuB6oqyn+nsaIhFk+CpBJ4pamF9F3qkj/RmEEzvAeLx9wQypVaw/wtIhS4Pn2hvi48C0SVrgJGhY9o6daEvBQ83LRNgIwMHSL4VnKszTQDeQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(82310400026)(1800799024)(6133799003)(56012099006)(5023799004)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ljyk4W3bU/NcPOe0Eb4ru3nvTuxCcaHm5XIaLdGmOplVwFq7oLF0TIMnnbbcQPQfxDAYW3yAVC5Sa1+cChCpxDZOrqUaEoP8+oXt/iQgmao0AqAp8/RYY1Rblrv0XhY0xgZStcJFVQ5WCDB4Bb7YTkU3bnIYiNX81UcXIBDZYXKXegma6/nas/ox8ZYeIBDEmPA9qq/f1mbOoXYJ7cFQv4o5skN8a7L71FBaxgHBFYBaBjHjq8G5OPM6w8sxBgFSX5d9VxM+qWdeivLh4mYQUOK4JNQiLN0oOMZU100wYe8lHK78KhX+oRKc4ZiuENkqjO2nLv9ZPL4CK5R/zinyl/fvzG9P60h16tbqhtnk/YqyXZjRhilsygRm1EW8BGeMdANv6CYWHg55Mdbys7LIrs6wVrX34H1ihSqeZIosWrzy5od6kjVdhd4A3ReYpDvl
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 16:15:48.0598
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33a84df0-6f20-48dc-7744-08deef1efb86
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5656

The client models return the Ryzen Master SMC telemetry table, and the
driver copies it out without interpreting it. Document the Telemetry
Table RM layout, which HSMP_CLIENT_GET_METRICS_TABLE_VER reports as
version 5, so that a tool can decode a snapshot from this file.

Carry the RM layout as the structure declarations themselves - the array
size defines, the per-IOD counters, the per-CCX core counters and the
top-level table - rather than as a paraphrase of them, so the file states
the byte layout a decoder has to follow. The Public PPR for the model in
use stays the reference for the units and encodings, which are firmware
defined.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 Documentation/arch/x86/amd_hsmp.rst | 277 ++++++++++++++++++++++++++++
 1 file changed, 277 insertions(+)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index b95f09945193..cf6faba6aa44 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -221,9 +221,286 @@ The following IOCTLs are defined:
   ``sizeof(struct hsmp_metric_table)``.  Later version metrics table
   layout is documented in the Public PPR.
 
+  The Family 1Ah client models carry their own telemetry table instead,
+  described in `Family 1Ah client telemetry table`_ below.
+
 The ioctl would return a non-zero on failure; you can read errno to see
 what happened. The transaction returns 0 on success.
 
+Family 1Ah client telemetry table
+=================================
+On the Family 1Ah client models the table returned by
+``HSMP_CLIENT_GET_METRICS_TABLE`` (05h) uses the Ryzen Master SMC
+telemetry layout.  Table version 5, as reported by
+``HSMP_CLIENT_GET_METRICS_TABLE_VER`` (04h), is the Telemetry Table RM
+layout below.  ``HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR`` (06h) returns
+the DRAM address the SMU writes the table to, and 05h asks it to refill
+that region.  The driver issues both and copies the table out without
+interpreting it.
+
+Use the telemetry table chapter of the AMD Public PPR for the model in
+use as the authoritative reference.
+
+Telemetry Table RM layout::
+
+    /*
+     * Telemetry Table RM (Ryzen Master SMC, F1A Models 80h-8Fh and
+     * E0h-E3h client)
+     *
+     * Layout returned by HSMP_CLIENT_GET_METRICS_TABLE: the SMU writes the
+     * table into DRAM at the address reported by
+     * HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR and the driver returns it
+     * through the HSMP_IOCTL_GET_TELEMETRY_DATA ioctl.  The structure
+     * mirrors the RM spec published with the AMD HSMP telemetry sample
+     * application.
+     * Field grouping (SET VOLTAGES, TELEMETRY VOLTAGES, ... ) matches the
+     * SMU spec; accumulator (*_acc) fields are monotonic counters from
+     * which consumers derive deltas across two snapshots.  Units are
+     * firmware-defined (typically mW for power, milli-degC for temperature,
+     * MHz for frequency); see the AMD HSMP/Ryzen Master SMC spec for exact
+     * unit definitions.
+     *
+     * The composition is:
+     *   struct hsmp_telemetry_table_rm
+     *     +-- struct hsmp_telemetry_table_rm_iod   iod;
+     *     +-- struct hsmp_telemetry_table_rm_ccx   ccx[HSMP_TELEMETRY_RM_MAX_CCX];
+     *
+     * Spare fields are explicit firmware padding and must be preserved to
+     * maintain the on-the-wire byte layout.
+     */
+    #define HSMP_TELEMETRY_RM_MAX_CCX               4
+    #define HSMP_TELEMETRY_RM_CORES_PER_CCX         12
+    #define HSMP_TELEMETRY_RM_FREQ_TABLE_SIZE       8
+    #define HSMP_TELEMETRY_RM_NPU_BUSY_DOMAINS      3
+    #define HSMP_TELEMETRY_RM_OC_DOMAINS            5
+    #define HSMP_TELEMETRY_RM_OC_SUBDOMAINS         5
+    #define HSMP_TELEMETRY_RM_OC_GUARDBANDS         3
+
+    /**
+     * struct hsmp_telemetry_table_rm_iod - I/O die counters for RM telemetry.
+     *
+     * Populated once per SMU telemetry sample.  Accumulator (*_acc) fields
+     * are monotonic; consumers compute deltas across two snapshots and
+     * normalise by accumulation_counter.  Per-rail limit fields report the
+     * currently active limit in firmware-defined units.
+     */
+    struct hsmp_telemetry_table_rm_iod {
+            __u32 accumulation_counter;
+
+            /* SET VOLTAGES */
+            __u64 vddcr_set_voltage;
+            __u64 vddcr_soc_set_voltage;
+            __u64 vddcr_npu_set_voltage;
+            __u64 vddcr_lp_set_voltage;
+            __u64 vddcr_gfx_set_voltage;
+            __u64 vdd_misc_set_voltage;
+
+            /* TELEMETRY VOLTAGES */
+            __u64 vddcr_telemetry_voltage;
+            __u64 vddcr_soc_telemetry_voltage;
+            __u64 vddcr_npu_telemetry_voltage;
+            __u64 vddcr_lp_telemetry_voltage;
+            __u64 vddcr_gfx_telemetry_voltage;
+            __u64 vdd_misc_telemetry_voltage;
+
+            /* TELEMETRY POWERS */
+            __u64 vddcr_telemetry_power;
+            __u64 vddcr_soc_telemetry_power;
+            __u64 vddcr_npu_telemetry_power;
+            __u64 vddcr_lp_telemetry_power;
+            __u64 vddcr_gfx_telemetry_power;
+            __u64 vdd_misc_telemetry_power;
+
+            /* THROTTLERS - FAST PPT */
+            __u32 fppt_fused_limit;
+            __u32 fppt_max_irm_limit;
+            __u32 fppt_max_pbo_limit;
+            __u32 fppt_limit;
+            __u64 fppt_value_acc;
+            __u32 fppt_residency_acc;
+
+            /* THROTTLERS - SLOW PPT */
+            __u32 sppt_fused_limit;
+            __u32 sppt_max_irm_limit;
+            __u32 sppt_max_pbo_limit;
+            __u32 sppt_limit;
+            __u64 sppt_value_acc;
+            __u32 sppt_residency_acc;
+
+            /* THROTTLERS - SPL */
+            __u32 spl_fused_limit;
+            __u32 spl_max_irm_limit;
+            __u32 spl_max_pbo_limit;
+            __u32 spl_limit;
+            __u64 spl_value_acc;
+            __u32 spl_residency_acc;
+
+            /* THROTTLERS - TDC VDDCR */
+            __u32 tdc_vddcr_fused_limit;
+            __u32 tdc_vddcr_max_irm_limit;
+            __u32 tdc_vddcr_max_pbo_limit;
+            __u32 tdc_vddcr_limit;
+            __u64 tdc_vddcr_value_acc;
+            __u32 tdc_vddcr_residency_acc;
+
+            /* THROTTLERS - TDC VDDCR SOC */
+            __u32 tdc_vddcr_soc_fused_limit;
+            __u32 tdc_vddcr_soc_max_irm_limit;
+            __u32 tdc_vddcr_soc_max_pbo_limit;
+            __u32 tdc_vddcr_soc_limit;
+            __u64 tdc_vddcr_soc_value_acc;
+            __u32 tdc_vddcr_soc_residency_acc;
+
+            /* THROTTLERS - TDC VDDCR NPU */
+            __u32 tdc_vddcr_npu_fused_limit;
+            __u32 tdc_vddcr_npu_max_irm_limit;
+            __u32 tdc_vddcr_npu_max_pbo_limit;
+            __u32 tdc_vddcr_npu_limit;
+            __u64 tdc_vddcr_npu_value_acc;
+            __u32 tdc_vddcr_npu_residency_acc;
+
+            /* THROTTLERS - TDC VDDCR LP */
+            __u32 tdc_vddcr_lp_fused_limit;
+            __u32 tdc_vddcr_lp_max_irm_limit;
+            __u32 tdc_vddcr_lp_max_pbo_limit;
+            __u32 tdc_vddcr_lp_limit;
+            __u64 tdc_vddcr_lp_value_acc;
+            __u32 tdc_vddcr_lp_residency_acc;
+
+            /* THROTTLERS - TDC VDDCR GFX */
+            __u32 tdc_vddcr_gfx_fused_limit;
+            __u32 tdc_vddcr_gfx_max_irm_limit;
+            __u32 tdc_vddcr_gfx_max_pbo_limit;
+            __u32 tdc_vddcr_gfx_limit;
+            __u64 tdc_vddcr_gfx_value_acc;
+            __u32 tdc_vddcr_gfx_residency_acc;
+
+            /* THROTTLERS - EDC VDDCR */
+            __u32 edc_vddcr_fused_limit;
+            __u32 edc_vddcr_max_irm_limit;
+            __u32 edc_vddcr_max_pbo_limit;
+            __u32 edc_vddcr_limit;
+
+            /* THROTTLERS - THERMAL */
+            __u32 thm_fused_limit;
+            __u32 thm_limit;
+            __u64 thm_value_acc;
+            __u32 thm_residency_acc;
+            __u32 prochot_residency_acc;
+            __u64 gfx_temp_acc;
+            __u64 soc_temp_acc;
+            __u32 p3t_fused_limit;
+            __u64 p3t_value_acc;
+
+            /* POWER */
+            __u64 system_power_acc;
+            __u64 apu_power_acc;
+            __u64 dgpu_power_acc;
+            __u64 npu_power_acc;
+
+            /* FREQUENCIES */
+            __u64 fclk_freq_eff_acc;
+            __u64 memclk_freq_eff_acc;
+            __u64 lclk_freq_eff_acc;
+            __u64 gfxclk_freq_eff_acc;
+            __u64 socclk_freq_eff_acc;
+            __u64 vclk_freq_eff_acc;
+            __u64 vpeclk_freq_eff_acc;
+            __u64 aieclk_freq_eff_acc;
+            __u64 npuhclk_freq_eff_acc;
+
+            /* BANDWIDTH */
+            __u64 dram_read_bandwidth;
+            __u64 dram_write_bandwidth;
+
+            /* ACTIVITY MONITORS */
+            __u64 gfx_busy_acc;
+            __u64 vcn_busy_acc;
+            __u64 npu_busy_acc[HSMP_TELEMETRY_RM_NPU_BUSY_DOMAINS];
+
+            /* STT (Skin Temperature Tracking) */
+            __u32 stt_min_limit;
+            __u64 stt_apu_hot_spot_temp_acc;
+            __u64 stt_hs2_hot_spot_temp_acc;
+            __u32 stt_apu_temp_limit;
+            __u64 stt_apu_skin_temp_acc;
+
+            /* RESIDENCIES - per-CCX CPU off */
+            __u64 cpu_off_residency[HSMP_TELEMETRY_RM_MAX_CCX];
+
+            /* DF P-STATES */
+            __u32 fclk_freq_table[HSMP_TELEMETRY_RM_FREQ_TABLE_SIZE];
+            __u32 uclk_freq_table[HSMP_TELEMETRY_RM_FREQ_TABLE_SIZE];
+            __u32 ddr_rate_table[HSMP_TELEMETRY_RM_FREQ_TABLE_SIZE];
+            __u8  df_pstate_source[HSMP_TELEMETRY_RM_FREQ_TABLE_SIZE];
+
+            /* SYSTEM */
+            __u8  gfx_disabled;
+            __u8  spare2[3];
+            __u32 gfxclk_fmax;
+            __u8  cclk_core_fuse_enable[HSMP_TELEMETRY_RM_MAX_CCX][HSMP_TELEMETRY_RM_CORES_PER_CCX];
+            __u8  cclk_core_enabled[HSMP_TELEMETRY_RM_MAX_CCX][HSMP_TELEMETRY_RM_CORES_PER_CCX];
+            __u32 cclk_fmax[HSMP_TELEMETRY_RM_MAX_CCX][HSMP_TELEMETRY_RM_CORES_PER_CCX];
+
+            /* OVERCLOCK CAPABLE */
+            __u8  cpu_precise_and_direct_oc_capable;
+            __u8  gfx_precise_and_direct_oc_capable;
+            __u8  pbo_basic_oc_capable;
+            __u8  pbo_advanced_oc_capable;
+            __u8  pbo_nitro_oc_capable;
+            __u8  memory_and_fabric_oc_capable;
+            __u8  misc_oc_capable;
+            __u8  extreme_cold_oc_capable;
+            __u8  down_config_control_capable;
+            __u8  spare0[3];
+
+            /* OVERCLOCK STATUS */
+            __u32 fit_limit_scalar;
+            __u8  ln2_enabled;
+            __u8  cpu_precise_and_direct_oc_enabled;
+            __u8  gfx_precise_and_direct_oc_enabled;
+            __u8  spare1[2];
+            __s8  psm_guardband[HSMP_TELEMETRY_RM_OC_DOMAINS]
+                               [HSMP_TELEMETRY_RM_OC_SUBDOMAINS]
+                               [HSMP_TELEMETRY_RM_OC_GUARDBANDS];
+            __s32 core_power_limit_offset;
+            __u32 max_freq_offset[HSMP_TELEMETRY_RM_OC_DOMAINS];
+    };
+
+    /**
+     * struct hsmp_telemetry_table_rm_ccx - Per-CCX core counters for RM telemetry.
+     *
+     * Each CCX exposes per-core monotonic counters for residency, frequency,
+     * temperature and power.  Arrays are sized for the maximum cores per
+     * CCX; entries past the actual enabled-core count are zero-padded by
+     * the SMU.  Use the cclk_core_enabled[] mask in struct
+     * hsmp_telemetry_table_rm_iod to determine which lanes are valid.
+     */
+    struct hsmp_telemetry_table_rm_ccx {
+            __u64 core_c0[HSMP_TELEMETRY_RM_CORES_PER_CCX];
+            __u64 core_cc6[HSMP_TELEMETRY_RM_CORES_PER_CCX];
+            __u64 core_freq[HSMP_TELEMETRY_RM_CORES_PER_CCX];
+            __u64 core_freq_eff[HSMP_TELEMETRY_RM_CORES_PER_CCX];
+            __u64 core_temp[HSMP_TELEMETRY_RM_CORES_PER_CCX];
+            __u64 core_power[HSMP_TELEMETRY_RM_CORES_PER_CCX];
+    };
+
+    /**
+     * struct hsmp_telemetry_table_rm - Top-level RM telemetry table.
+     * @iod:      I/O die counters and per-rail/per-throttler/SYSTEM telemetry.
+     * @ccx:      Per-CCX core counters, one entry per CCX.
+     *
+     * Returned by the SMU at the DRAM address obtained from
+     * HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR after a successful
+     * HSMP_CLIENT_GET_METRICS_TABLE request.  The on-wire layout is fixed
+     * at the RM spec; future revisions will be exposed via a different
+     * table version and a sibling struct.
+     */
+    struct hsmp_telemetry_table_rm {
+            struct hsmp_telemetry_table_rm_iod iod;
+            struct hsmp_telemetry_table_rm_ccx ccx[HSMP_TELEMETRY_RM_MAX_CCX];
+    };
+
 More details on the interface and message definitions can be found in chapter
 "7 Host System Management Port (HSMP)" of the respective family/model PPR
 eg: https://docs.amd.com/v/u/en-US/55898_B1_pub_0_50
-- 
2.34.1


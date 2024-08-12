Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2054.outbound.protection.outlook.com [40.107.220.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36431D699
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Aug 2024 13:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723468771; cv=fail; b=gNQpitj90JUEaJGBntMjthxgrrEgI5+ZOs2aky/SwkVtCBgOzdoAZX9YRrsyPY5lXQiM98Y3sZOCSIaSiNaSxnMeDfRkdweDpeNuWnJUSpuh0KX4jBBnla47aMJYcGqBzD3kOXJmgCnZcR05ws9Zyfy4hA3TI7dmMU68f3Si478=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723468771; c=relaxed/simple;
	bh=ID8kEnRSKuZPienLV3MhgD4SUTGmuktbX0VNsHaEYJQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Q4SU9U9oyOUxb9ImUji8TVDuflIgU8JQxN7F/v4bNmtuWcbbkFuHOWYnDirAa9I4Omrt4YBLfWJIsmr+aeFqsBvz5J2ZO2k0SR7wRZGmJtlic5n4LhfMyrf83UTCFMYNX+QQKjl5Lpkh5ERyJ+8kF25M+xk7QmvdpkQUqILN+58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=e1+QUB0N; arc=fail smtp.client-ip=40.107.220.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="e1+QUB0N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xh354uYj3b563eosDvEGeB9xep+OvS8v9jUdFrM2bV0/biltvSPsvbEtvk57WUfHziS+LL4Z7ain9j6IHMBwzex3uvlOwwSQeSAMIEt9JKGepPQf2gwcduMxOD0D00WYdjshkgyaoICjd/iL2V8eaELRO8kGiAuo92R1RmcYwuqQNd/AuJMWJuITQ37NO3HNlZBXn8nvbZlkSxr0GnC9I4LZcS542tyXqQ21i2rGECJry2rKuNhYNQM3rU6v1GYmcgoMarqZk6lrmcTNe1P4eqf0tphhtkDwMw7u5ALyylLq8Iva7hXrfJEkqEedpoIPRMb1vwb7wxH4tUOq3LCNbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AbN3HdO1xdjX1GUAUk9hpR2AJLY+OsYjjhtXmYK5XV4=;
 b=axaUfmnlxmm3bp0ko1qxFZpIVfsGfYvVsuZr/vQBLUkwir08YyMolrq3d/Zr1Ow7G8rD+2NHlxLPCaP+IOhQwJ4oweNHOE90bXuJFaN3j7FkJwxfuDyDcwWhywyC4vBTzi4Vgyq3mRzqi4OabVuGhmAKR5rJD3rmY4aBdp2/D11O8+dpB4PO9hjjrnU28ohRiwwfA+IEYdKp5WRAKLyp9lwoQAoV0UG/fW7PvlY1wquN9JPG9mlh571+z1fD/+gqIk2J6YFH7WQ82M9/jG3STpDNvKwFABDRmh93lVKJlE1rCHi1lBTTjPHI9jMTnSGb0faeIkBZ8ZKgtYe6MeLPMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AbN3HdO1xdjX1GUAUk9hpR2AJLY+OsYjjhtXmYK5XV4=;
 b=e1+QUB0N0ex/O6S42qwW4OPGK+kcLdV23F9oVzOMFiMoBzT+ks1gbC7EdY4gaq8UHs8FEBvb+65j3G/sH5EKQ7apLywUeQFm//9GCQURG33SdeSZ4aCAxEOxX5OjNyTPln/BkbmcP62yjMF1gRPpgYsjeVRcNj0zZGJIPhko1W0=
Received: from CH2PR18CA0040.namprd18.prod.outlook.com (2603:10b6:610:55::20)
 by MW4PR12MB6976.namprd12.prod.outlook.com (2603:10b6:303:20a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Mon, 12 Aug
 2024 13:19:25 +0000
Received: from CH3PEPF00000011.namprd21.prod.outlook.com
 (2603:10b6:610:55:cafe::e8) by CH2PR18CA0040.outlook.office365.com
 (2603:10b6:610:55::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22 via Frontend
 Transport; Mon, 12 Aug 2024 13:19:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000011.mail.protection.outlook.com (10.167.244.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7875.2 via Frontend Transport; Mon, 12 Aug 2024 13:19:24 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 12 Aug
 2024 08:19:22 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH] platform/x86/amd/pmf: Add support for notifying Smart PC Solution updates
Date: Mon, 12 Aug 2024 18:48:39 +0530
Message-ID: <20240812131839.308768-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000011:EE_|MW4PR12MB6976:EE_
X-MS-Office365-Filtering-Correlation-Id: 0235bd2d-0943-4fb5-e195-08dcbad162cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PlOsqD44I+/BMpd9nBnthR26Z+e5/8POJgawH7F/N+MIS42F/Xyc/xMYiZEc?=
 =?us-ascii?Q?PrHJFp/S/JtWSAg8viSMunAxRpvKchOyKQmnAglJ2hhiLXlcUHiIdB5lfape?=
 =?us-ascii?Q?49D/7WT2h53OtQv0dGKlv1jNrtzksO20UUQOzNEAASjRtdSqtCOhm3S8c5PV?=
 =?us-ascii?Q?duWkQxJgaUxDV2E129Z/1aBZTLyeJNmWPTPr/vWlXZiKDnyzHsVe7E8xVhzA?=
 =?us-ascii?Q?zLx5KbX5l9Aa1LMQFeeYdPgXUzRPp4kSG3/7CeqgqhmWimeSNSmkXO/9uXBc?=
 =?us-ascii?Q?1mvFjbWpbTSCL7/AMHWYTRCpHH3k9qPQ439iIDjriDvVtaF40zquLzQyvlK6?=
 =?us-ascii?Q?O/otMzth4TFYNywIc/f6gnx9hd4fWiyelL4miWCqhMvg/RYH4XeqgJ+V4fsW?=
 =?us-ascii?Q?XUw5CTtbAH/bVfHySniBt56XRNyHEylyP9gyW0OPbFaZ7wb2dHQ9HSXVnXWf?=
 =?us-ascii?Q?xIPz4EmVvl865hFGFPCrWT7hY7jDrg6FboE6pPIZO6o5oyrK/ZFlrci7PsWW?=
 =?us-ascii?Q?O+Bg+0TZGgQL77SRhZVtRgnS8KybmQhOeuCqI/CEpaysp76BuNupYkPV1N+9?=
 =?us-ascii?Q?q4JTDDNiJfLtJMig44f7OgfKiHq7AWgOCAxNlgNDzhmufk5RNmCvfWihVTEz?=
 =?us-ascii?Q?fwMf7XW+S6aGeAJeARpEU6Hoc662oMAk45/zp1sJ2K7kfARjq9fMY+V2dDkc?=
 =?us-ascii?Q?jWcAm0l+6iKiKfbKP4ZdzZ2ZwwBLuofOBFCcrxHEOXU4mpBt1wrc+DspnybO?=
 =?us-ascii?Q?I/fD4YUSreFQ3C4eghBwijZysONrgksdDZ/ldkvrv+DNOc5e+2PlePZeptvx?=
 =?us-ascii?Q?3Xrt0yFuyzZV7vxgQGyRKH5zjiq33TR569IGgprixwnefHbg49FvhkHJ4Pt5?=
 =?us-ascii?Q?DhWoBXy0Zwi5LFrBM7Myh3tOEz+1jI0byL9fj23R816jIS1K+EbluhYaR823?=
 =?us-ascii?Q?A3cJ+4rKICTlfhOKrfWLfrk6s/L+XpMh72/vsiXfEAQfG6DplIKCZ3U/vhl5?=
 =?us-ascii?Q?MMRW54tMk1LtVJNUexd5dEQr/deKRrqInVI0xcjmaP4YA/+YPOw/jRJ18X+3?=
 =?us-ascii?Q?jgBjCt3cPLzyQjRE6tmTiaynrdhZ7kb5tb6LfW8DBmcu/o5itqB4naHnMYjL?=
 =?us-ascii?Q?93OtBpesE/qg1gzbPXhyghufLW9kK7+KqxzoAk2BA6+vsNTQ5dD/4/kxdlcK?=
 =?us-ascii?Q?+kR7YkE+CrG8lOUt1ZVwrG2z06ca1h8X4sMxw87oMCoRWFjZAh6Idm7Dp478?=
 =?us-ascii?Q?tL0cn9xd6cKmQHN8pdFmCFR+r5tXLAy5bBhktRBBhpGY7aAAXOJ+7aFEdR4w?=
 =?us-ascii?Q?84E+nTV44hc+po4y9+oeALjBuGHPwkkFb5swS3udLRboWSCGrU9QhoJo8mg3?=
 =?us-ascii?Q?7XzgyUGs47gkC9jj6eW8EkwhvsxwwsB3Q2lD7r7QIm20HHJf8cIt25w+t4oj?=
 =?us-ascii?Q?QQXl4RwZ6uBYtFw5Y3Zkj+8pLCI+hWAu?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 13:19:24.7239
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0235bd2d-0943-4fb5-e195-08dcbad162cf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000011.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6976

The APMF function 14 (Notify Smart PC Solution Updates) allows the BIOS
(AMD/OEM) to be informed about the outputs of custom Smart PC policies.
Enhance the PMF driver to invoke APMF function 14 when these custom policy
outputs are triggered.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/acpi.c   | 31 +++++++++++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h    | 18 ++++++++++++
 drivers/platform/x86/amd/pmf/tee-if.c | 40 +++++++++++++++++++++++++++
 3 files changed, 89 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 1157ec148880..d5b496433d69 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -282,6 +282,29 @@ int apmf_update_fan_idx(struct amd_pmf_dev *pdev, bool manual, u32 idx)
 	return 0;
 }
 
+static int apmf_notify_smart_pc_update(struct amd_pmf_dev *pdev, u32 val, u32 preq, u32 index)
+{
+	struct amd_pmf_notify_smart_pc_update args;
+	struct acpi_buffer params;
+	union acpi_object *info;
+
+	args.size = sizeof(args);
+	args.pending_req = preq;
+	args.custom_bios[index] = val;
+
+	params.length = sizeof(args);
+	params.pointer = &args;
+
+	info = apmf_if_call(pdev, APMF_FUNC_NOTIFY_SMART_PC_UPDATES, &params);
+	if (!info)
+		return -EIO;
+
+	kfree(info);
+	dev_dbg(pdev->dev, "Notify smart pc update, val: %u\n", val);
+
+	return 0;
+}
+
 int apmf_get_auto_mode_def(struct amd_pmf_dev *pdev, struct apmf_auto_mode *data)
 {
 	return apmf_if_call_store_buffer(pdev, APMF_FUNC_AUTO_MODE, data, sizeof(*data));
@@ -447,6 +470,14 @@ int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev)
 	return 0;
 }
 
+int amd_pmf_smartpc_apply_bios_output(struct amd_pmf_dev *dev, u32 val, u32 preq, u32 idx)
+{
+	if (!is_apmf_func_supported(dev, APMF_FUNC_NOTIFY_SMART_PC_UPDATES))
+		return -EINVAL;
+
+	return apmf_notify_smart_pc_update(dev, val, preq, idx);
+}
+
 void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev)
 {
 	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 753d5662c080..9bf4326d06c3 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -35,6 +35,7 @@ struct cookie_header {
 #define APMF_FUNC_STATIC_SLIDER_GRANULAR       9
 #define APMF_FUNC_DYN_SLIDER_AC				11
 #define APMF_FUNC_DYN_SLIDER_DC				12
+#define APMF_FUNC_NOTIFY_SMART_PC_UPDATES		14
 #define APMF_FUNC_SBIOS_HEARTBEAT_V2			16
 
 /* Message Definitions */
@@ -82,7 +83,17 @@ struct cookie_header {
 #define PMF_POLICY_STT_SKINTEMP_APU				7
 #define PMF_POLICY_STT_SKINTEMP_HS2				8
 #define PMF_POLICY_SYSTEM_STATE					9
+#define PMF_POLICY_BIOS_OUTPUT_1				10
+#define PMF_POLICY_BIOS_OUTPUT_2				11
 #define PMF_POLICY_P3T						38
+#define PMF_POLICY_BIOS_OUTPUT_3				57
+#define PMF_POLICY_BIOS_OUTPUT_4				58
+#define PMF_POLICY_BIOS_OUTPUT_5				59
+#define PMF_POLICY_BIOS_OUTPUT_6				60
+#define PMF_POLICY_BIOS_OUTPUT_7				61
+#define PMF_POLICY_BIOS_OUTPUT_8				62
+#define PMF_POLICY_BIOS_OUTPUT_9				63
+#define PMF_POLICY_BIOS_OUTPUT_10				64
 
 /* TA macros */
 #define PMF_TA_IF_VERSION_MAJOR				1
@@ -344,6 +355,12 @@ struct os_power_slider {
 	u8 slider_event;
 } __packed;
 
+struct amd_pmf_notify_smart_pc_update {
+	u16 size;
+	u32 pending_req;
+	u32 custom_bios[10];
+} __packed;
+
 struct fan_table_control {
 	bool manual;
 	unsigned long fan_id;
@@ -717,6 +734,7 @@ extern const struct attribute_group cnqf_feature_attribute_group;
 int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev);
 void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev);
 int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev);
+int amd_pmf_smartpc_apply_bios_output(struct amd_pmf_dev *dev, u32 val, u32 preq, u32 idx);
 
 /* Smart PC - TA interfaces */
 void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index e246367aacee..19c27b6e4666 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -160,6 +160,46 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 			dev_dbg(dev->dev, "update SYSTEM_STATE: %s\n",
 				amd_pmf_uevent_as_str(val));
 			break;
+
+		case PMF_POLICY_BIOS_OUTPUT_1:
+			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(0), 0);
+			break;
+
+		case PMF_POLICY_BIOS_OUTPUT_2:
+			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(1), 1);
+			break;
+
+		case PMF_POLICY_BIOS_OUTPUT_3:
+			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(2), 2);
+			break;
+
+		case PMF_POLICY_BIOS_OUTPUT_4:
+			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(3), 3);
+			break;
+
+		case PMF_POLICY_BIOS_OUTPUT_5:
+			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(4), 4);
+			break;
+
+		case PMF_POLICY_BIOS_OUTPUT_6:
+			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(5), 5);
+			break;
+
+		case PMF_POLICY_BIOS_OUTPUT_7:
+			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(6), 6);
+			break;
+
+		case PMF_POLICY_BIOS_OUTPUT_8:
+			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(7), 7);
+			break;
+
+		case PMF_POLICY_BIOS_OUTPUT_9:
+			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(8), 8);
+			break;
+
+		case PMF_POLICY_BIOS_OUTPUT_10:
+			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(9), 9);
+			break;
 		}
 	}
 }
-- 
2.25.1


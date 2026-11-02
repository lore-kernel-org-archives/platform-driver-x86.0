Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793604062;
	b=hXPktX39onNxgPOWJbqcDdFEcwwV5EDeJbnauCA1xv3jzCbASCkwFgKZLLLV/PbfAVRK
	 IU51yEnRLwsJ3l1vRC0yv0JciU/laehryLWT8AED7H1po02gG0FxQ+O/qNs+QkLLZcSwK
	 RynecBJx/kckpTd9bZYMCPNh0LpchzA2Wc6qPP/mBaGXLIIYOBAP/kEKPUc64a00c8mf7
	 ep9uZLsJ8m6PMW6vpW7rNVYwiAmwGRWxZE0mg0WXs4D7Zbp5Vo+mVgNKO7r8YSQTasRW3
	 9eerlJzHTiEf71kDcC6h6JJKH8dIVXtveVOwUftDPtFyrtbiGt1ih1GRjKbidZNeVzA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604062;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=T7wlSlDu2P0hGUfl/EDcG4NOH58h0/jLVHJN9d3q9LQ=;
	b=RdEw+dfdpxQUEjRVo/Jb/LcN2KdVY78PA7J6MGTFcZi0vwB42aIccH/3+w/dkpE0KEg0
	 ofjAcXGCe35UFr9K0xwojm3/ta0PARbGGL104+WGOREvhM6ysWKwfPUYwITLgDnv7CZ/R
	 mflx2+r4zlLuORtoHmKaDmpoSjWWDPgOp/zSc61ct3DwFhMiGpKESvJlu89XnG6Z/8CQb
	 sa1WXqj7FApo6hYL+dk8xT0foch8ivVaLNgGU8x4UMNhLJVguxz76JCXcclD7CxUS4Kh5
	 CczUDIej8xQp+WardvWOACd7g+BTAxkLJJIARv+JcSKRmfO5nc1QBDKzljWqggPgDZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=QWTFpCvG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.29
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012029.outbound.protection.outlook.com [52.101.43.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A08D606A327
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2026 07:21:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A08D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=QWTFpCvG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KAyyZ6rdRcqc6yzIOJ+47Z5mjLRiAuHnX16qCBEAn5B9MiIIo5zVUHAOQNR/171nMXApI2G7rJYUPpn0G8NyXlqnDOAUvEB5G9rSBM4Aj9RICghKGgNxdmwP+xifgLUoBZ6BvI+A076DdvI0uQWmwekeLyUp8OlgHwml/I7+WzWaHsEo6bBG5yeAd+JUQcPhQDwHxVLolswTZJd+hfJUIVvMAnanlQooJwJ3j2hJIMdYPBvdABjMZQ7ksJi9J5Z8UMJK7wQAngAqK1TvBAkzu6Gg2h2+wZ/WeIWTTGjFpwhbRRqSKlTGMqZcoUrzrCXaUk6g/HhBSEVtgYBVW76yeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T7wlSlDu2P0hGUfl/EDcG4NOH58h0/jLVHJN9d3q9LQ=;
 b=rn7otuEHDXx460CtOP+H0J8HGFpJipmyNB/hwKQ+r8hk58UqG+nDKB2e0IgryWWRtwy1L4T02XvD796o+GVJwi0dgEoSJPG44eikTkl8sjZ0eeXTnqVJsZ+Ao921KIXAU4Y4N5rf8oF3WaT3iQZQjf57h6tJEGnrkp6cA0tCi+EG+x4iNd6BhixPYZPqGYntXjGODnncynv616AYboqzxzgcadqDAzX2Eu+RXbEbXjWrD2a8DqiOFfIZTQX29p2DH/ZBlTrhhi/dHM3I1wkr8juEL0phK4YliDTns+XJJKD+qSLPahOUObuYgmYU8wAkdYPjwXee9f0oiVx8gquzaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7wlSlDu2P0hGUfl/EDcG4NOH58h0/jLVHJN9d3q9LQ=;
 b=QWTFpCvGx9Woe3LTH4F6MH5BwcaXDwk/DN0/rfYwzw75vZljouwdmjbL3TOnNAdOqraSLzioe+3pZPsrG+f75P6y8FQ+wlJc65XDB7EFnrA6TD+Llznm2BW9SE3ZISklIGgn/AbhJRpOefvW1/eMe90oEAPc1du41/kCRPekT0M=
Received: from SJ0PR05CA0154.namprd05.prod.outlook.com (2603:10b6:a03:339::9)
 by SA1PR12MB6947.namprd12.prod.outlook.com (2603:10b6:806:24e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 07:20:56 +0000
Received: from SJ1PEPF000037A7.namprd04.prod.outlook.com
 (2603:10b6:a03:339:cafe::5b) by SJ0PR05CA0154.outlook.office365.com
 (2603:10b6:a03:339::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.6 via Frontend Transport; Mon, 2
 Nov 2026 07:20:54 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037A7.mail.protection.outlook.com (10.167.244.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 07:20:54 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 2 Nov
 2026 01:20:52 -0600
From: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <Suma.Hegde@amd.com>,
	<NaveenKrishna.Chatradhi@amd.com>, Muthusamy Ramalingam
	<Muthusamy.Ramalingam@amd.com>
Subject: [PATCH 20/26] platform/x86/amd/hsmp: Add xgmi_pstate_range sysfs file
Date: Mon, 2 Nov 2026 07:19:18 +0000
Message-ID: <4d6d1d6e50391f02b6196e8c25f570d9b576be9e.1793602634.git.Muthusamy.Ramalingam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1793602633.git.Muthusamy.Ramalingam@amd.com>
References: <cover.1793602633.git.Muthusamy.Ramalingam@amd.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A7:EE_|SA1PR12MB6947:EE_
X-MS-Office365-Filtering-Correlation-Id: 303af7a4-c1a5-4ad2-5c6f-08df38b1d52c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|261021123027099003|261021121427099003|261022105027099003|261009223027099003|261026121527099003|261026140227099003|261028144727099003|11063799006|10067099003|56012099006|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	kAfJHC6S06ZaQ9USL6KTqot6TlZjg1i3hs4E3yN9P5b7H4Ib499Ru4axJFCs5PudO/qwzplfRZaGPg3HTG1C79JVe0ferlcdWxfTozj+91rNuc9Fsx3fhXRoaU4JxnrdYrcSHkzyCKEe96JS7PtGBruAuq6fLoXI8mUPi444Egw2m0EXqMS6BgoLgVR7vM+seYAGMnQ7Nsm7DSCP3DmYMhCBriO6iOQdPMehXO6D3qeqb9skDGRTV6n836QBLTZH8HV4HVdVhTCxnTfH0bFlIePY9NkVb3YpNLvHIxD+4VA9l3Z05byvciBcdWFzagqh0H6E4efBPQgJcXCI7s+/k1Yxq0I4/e2yZn6zRmd9zCps6hUQH7q/rIaOfv9fgr5oZnyqZ3K7ht2KynYtEwYYSNuF10aiwa2v3u9qV/qqxZ5qq2uo9XQMhJc8MQCfjVdS9CuLaw6Mj4OgywqdBibs6P3NAqCxDFKfbbYXH2J+JGVUaCDCCoZOl5IldxMI5EgCoA7n+5y5CQzewhv2MFH1kM5sMOQeiUn/HUpNTvOAvY/HMCrTOL5NOoig4O5VbTPsQx4/Zq8Y5LbwHlenigdn7s2QAsLWhq5zfqlwf78pZfCXwNVXg2dSDvpHjpvQCYqY0YlvOHfp7PHwjzyZIRchSz4FCwmgnfoeRjUISX0kQzzeQzMYHoXIdTKjs0hgyo0+s3J3S4eHtV4atjYI3AShKg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(261021123027099003)(261021121427099003)(261022105027099003)(261009223027099003)(261026121527099003)(261026140227099003)(261028144727099003)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8whKerUYqb0k5mPqNfPTc9/LVNDldOgpCxly+4bVX3NA9tav6v7BRnN0Jl+N+7Jb+M7V3NnD1WfZcuSDUIkd03dkCSstgrIhIrg22V1FzNv2RwV4WCCSBN5mWy+6CMIbvx9iRyMVgyIMv+CAcmDqsZFqPs3UwZ2UJa2h95GRv+rJwfjjKrjHlR/433H2kCji/+hTlTwyUKMpTc5x9raKyEpJaFFGFEtiW3TrvhSZwXpLXUnl6b9obMxEgKCOVxLlOgGeDhn6tcKDRNFUbxwssFybW+MqtdhGYbUAidGEI2LP5slTm80AyozeGiwGplFXI7yTComGDML5H4JSv/xZvGUuFmB06EB1nferh8pCfuLv7Y1fAj70fxtDAGN8RsMGcNd7jLSlZFGxS5jiNrc+jS7/vVfG4xLHKbnBUUksmvmYm4h/chIuMcSb1JKZCXwz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 07:20:54.5433
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 303af7a4-c1a5-4ad2-5c6f-08df38b1d52c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6947

Add a read/write socket file for the xGMI P-state range on both the
ACPI and platform drivers.

Read and write are differentiated by bit 31. Setting the bit selects a
read, and resetting it selects a write. A read returns the minimum and
maximum P-states. A write takes "min max", with the minimum in bits
[15:8] and the maximum in bits [7:0]. Each value is an 8-bit field.
Extra arguments are rejected. Firmware rejects unsupported P-states.

Describe the message as get/set with a one-word response so the read
passes validation.

Co-developed-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
---
 Documentation/arch/x86/amd_hsmp.rst   |  3 +
 arch/x86/include/uapi/asm/amd_hsmp.h  | 11 ++--
 drivers/platform/x86/amd/hsmp/acpi.c  |  4 ++
 drivers/platform/x86/amd/hsmp/plat.c  |  5 ++
 drivers/platform/x86/amd/hsmp/sysfs.c | 79 +++++++++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/sysfs.h |  5 ++
 6 files changed, 103 insertions(+), 4 deletions(-)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index 30401c168c503..e1159bbea5991 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -129,6 +129,9 @@ write-only when the platform enables only that direction of the message.
 * xgmi_width: Read/write xGMI link width range as "min max".
   0 is x4, 1 is x8, and 2 is x16. Each value is an 8-bit field.
   Extra arguments are rejected. Firmware rejects unsupported widths.
+* xgmi_pstate_range: Read/write xGMI P-state range as "min max".
+  Each value is an 8-bit field. Extra arguments are rejected. Firmware
+  rejects unsupported P-states.
 * lclk_dpm_range/lclk_0, lclk_dpm_range/lclk_1,
   lclk_dpm_range/lclk_2, lclk_dpm_range/lclk_3: Read/write LCLK DPM
   range for NBIO 0-3. Read returns "min max". Write accepts "min max"
diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
index dcbe89dc4d2b5..0350089bdae43 100644
--- a/arch/x86/include/uapi/asm/amd_hsmp.h
+++ b/arch/x86/include/uapi/asm/amd_hsmp.h
@@ -56,7 +56,7 @@ enum hsmp_message_ids {
 	HSMP_GET_METRIC_TABLE_VER,	/* 23h Get metrics table version */
 	HSMP_GET_METRIC_TABLE,		/* 24h Get metrics table */
 	HSMP_GET_METRIC_TABLE_DRAM_ADDR,/* 25h Get metrics table dram address */
-	HSMP_SET_XGMI_PSTATE_RANGE,	/* 26h Set xGMI P-state range */
+	HSMP_SET_XGMI_PSTATE_RANGE,	/* 26h Get/Set xGMI P-state range */
 	HSMP_CPU_RAIL_ISO_FREQ_POLICY,	/* 27h Get/Set Cpu Iso frequency policy */
 	HSMP_DFC_ENABLE_CTRL,		/* 28h Enable/Disable DF C-state */
 	HSMP_PC6_ENABLE,		/* 29h Get/Set PC6 enable/disable status */
@@ -395,10 +395,13 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[]
 	{0, 3, HSMP_GET},
 
 	/*
-	 * HSMP_SET_XGMI_PSTATE_RANGE, num_args = 1, response_sz = 0
-	 * input: args[0] = min xGMI p-state[15:8] + max xGMI p-state[7:0]
+	 * HSMP_SET_XGMI_PSTATE_RANGE, num_args = 1, response_sz = 1
+	 * input: args[0] = set/get range[31] (0 = set, 1 = get) +
+	 *                  min xGMI p-state[15:8] + max xGMI p-state[7:0]
+	 *                  (min and max are reserved on GET)
+	 * output: args[0] = min xGMI p-state[15:8] + max xGMI p-state[7:0]
 	 */
-	{1, 0, HSMP_SET},
+	{1, 1, HSMP_SET_GET},
 
 	/*
 	 * HSMP_CPU_RAIL_ISO_FREQ_POLICY, num_args = 1, response_sz = 1
diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 35c2085b67e42..284dc21dfdc37 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -556,6 +556,9 @@ HSMP_DEV_ATTR_RW(df_pstate_range, HSMP_SET_PSTATE_MAX_MIN, HSMP_SET_PSTATE_MAX_M
 		 hsmp_df_pstate_range_show, hsmp_df_pstate_range_store, 0644);
 HSMP_DEV_ATTR_RW(xgmi_width, HSMP_SET_XGMI_LINK_WIDTH, HSMP_SET_XGMI_LINK_WIDTH,
 		 hsmp_xgmi_width_show, hsmp_xgmi_width_store, 0644);
+HSMP_DEV_ATTR_RW(xgmi_pstate_range, HSMP_SET_XGMI_PSTATE_RANGE,
+		 HSMP_SET_XGMI_PSTATE_RANGE,
+		 hsmp_xgmi_pstate_range_show, hsmp_xgmi_pstate_range_store, 0644);
 HSMP_DEV_ATTR_W(gmi3_link_width, HSMP_SET_GMI3_WIDTH,
 		hsmp_gmi3_link_width_store, 0200);
 HSMP_DEV_ATTR_W(pcie_link_rate, HSMP_SET_PCI_RATE,
@@ -828,6 +831,7 @@ static struct attribute *hsmp_dev_attr_list[] = {
 	&hattr_sdps_limit.dattr.attr,
 	&hattr_df_pstate_range.dattr.attr,
 	&hattr_xgmi_width.dattr.attr,
+	&hattr_xgmi_pstate_range.dattr.attr,
 	&hattr_gmi3_link_width.dattr.attr,
 	&hattr_pcie_link_rate.dattr.attr,
 	&hattr_dimm_sb_get.dattr.attr,
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index aedc71027b28c..8207900b8a170 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -393,6 +393,10 @@ HSMP_DEV_ATTR_RW_X8(df_pstate_range, HSMP_SET_PSTATE_MAX_MIN,
 HSMP_DEV_ATTR_RW_X8(xgmi_width, HSMP_SET_XGMI_LINK_WIDTH,
 		    HSMP_SET_XGMI_LINK_WIDTH,
 		    hsmp_xgmi_width_show, hsmp_xgmi_width_store, 0644);
+HSMP_DEV_ATTR_RW_X8(xgmi_pstate_range, HSMP_SET_XGMI_PSTATE_RANGE,
+		    HSMP_SET_XGMI_PSTATE_RANGE,
+		    hsmp_xgmi_pstate_range_show, hsmp_xgmi_pstate_range_store,
+		    0644);
 HSMP_DEV_ATTR_W_X8(gmi3_link_width, HSMP_SET_GMI3_WIDTH,
 		   hsmp_gmi3_link_width_store, 0200);
 HSMP_DEV_ATTR_W_X8(pcie_link_rate, HSMP_SET_PCI_RATE,
@@ -1902,6 +1906,7 @@ static struct attribute _name[] = {					       \
 	&hattr_sdps_limit##_sock_ind.dattr.attr,			       \
 	&hattr_df_pstate_range##_sock_ind.dattr.attr,			       \
 	&hattr_xgmi_width##_sock_ind.dattr.attr,			       \
+	&hattr_xgmi_pstate_range##_sock_ind.dattr.attr,			       \
 	&hattr_gmi3_link_width##_sock_ind.dattr.attr,			       \
 	&hattr_pcie_link_rate##_sock_ind.dattr.attr,			       \
 	&hattr_dimm_sb_get##_sock_ind.dattr.attr,			       \
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.c b/drivers/platform/x86/amd/hsmp/sysfs.c
index 8872f63e218df..e941574711687 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.c
+++ b/drivers/platform/x86/amd/hsmp/sysfs.c
@@ -984,6 +984,85 @@ ssize_t hsmp_xgmi_width_store(struct device *dev,
 	return count;
 }
 
+/* xGMI P-state range show function - reads current min and max P-states */
+ssize_t hsmp_xgmi_pstate_range_show(struct device *dev,
+				    struct device_attribute *attr,
+				    char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_message msg = {};
+	u32 min_pstate, max_pstate;
+	int ret;
+
+	/* Set bit 31 to indicate GET operation for HSMP_SET_GET type messages */
+	msg.msg_id = HSMP_SET_XGMI_PSTATE_RANGE;
+	msg.sock_ind = hsmp_sysfs_sock_ind(dev, hattr);
+	msg.num_args = 1;
+	msg.response_sz = 1;
+	msg.args[0] = BIT(31);  /* GET operation */
+
+	ret = hsmp_send_message(&msg);
+	if (ret)
+		return ret;
+
+	/* Extract min P-state[15:8] and max P-state[7:0] */
+	min_pstate = (msg.args[0] >> 8) & 0xFF;
+	max_pstate = msg.args[0] & 0xFF;
+
+	return sysfs_emit(buf, "%u %u\n", min_pstate, max_pstate);
+}
+
+/* xGMI P-state range store function - sets min and max P-states */
+ssize_t hsmp_xgmi_pstate_range_store(struct device *dev,
+				     struct device_attribute *attr,
+				     const char *buf, size_t count)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_message msg = {};
+	u32 min_pstate, max_pstate;
+	u32 vals[2];
+	int ret;
+	int got;
+
+	/* Parse input in format: "min_pstate max_pstate" */
+	ret = hsmp_parse_u32_args(buf, vals, 2, 10, &got);
+	if (ret) {
+		hsmp_err(dev, "xgmi_pstate_range", HSMP_ERR_ARGC,
+			 "want=2 got=%d fmt=\"min max\"", got);
+		return -EINVAL;
+	}
+	min_pstate = vals[0];
+	max_pstate = vals[1];
+
+	/* Min and max are 8-bit fields. Firmware rejects unsupported P-states. */
+	if (min_pstate > 0xFF || max_pstate > 0xFF) {
+		hsmp_err(dev, "xgmi_pstate_range", HSMP_ERR_RANGE,
+			 "min=%u max=%u valid=0-255", min_pstate, max_pstate);
+		return -EINVAL;
+	}
+
+	/* Clear bit 31 for SET operation, pack min[15:8] and max[7:0] */
+	msg.msg_id = HSMP_SET_XGMI_PSTATE_RANGE;
+	msg.sock_ind = hsmp_sysfs_sock_ind(dev, hattr);
+	msg.num_args = 1;
+	msg.response_sz = 1;
+	msg.args[0] = (min_pstate << 8) | max_pstate;
+
+	ret = hsmp_send_message(&msg);
+	if (ret) {
+		if (max_pstate > min_pstate)
+			hsmp_err(dev, "xgmi_pstate_range", HSMP_ERR_ORDER,
+				 "min=%u max=%u rule=max<=min rc=%d",
+				  min_pstate, max_pstate, ret);
+		else
+			hsmp_err(dev, "xgmi_pstate_range", HSMP_ERR_HW,
+				 "min=%u max=%u rc=%d", min_pstate, max_pstate, ret);
+		return ret;
+	}
+
+	return count;
+}
+
 /* GMI3 link width store function - sets min and max link width */
 ssize_t hsmp_gmi3_link_width_store(struct device *dev,
 				   struct device_attribute *attr,
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.h b/drivers/platform/x86/amd/hsmp/sysfs.h
index 8d3a9021ef18e..36368f13d72f0 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.h
+++ b/drivers/platform/x86/amd/hsmp/sysfs.h
@@ -137,6 +137,11 @@ ssize_t hsmp_xgmi_width_show(struct device *dev, struct device_attribute *attr,
 			     char *buf);
 ssize_t hsmp_xgmi_width_store(struct device *dev, struct device_attribute *attr,
 			      const char *buf, size_t count);
+ssize_t hsmp_xgmi_pstate_range_show(struct device *dev,
+				    struct device_attribute *attr, char *buf);
+ssize_t hsmp_xgmi_pstate_range_store(struct device *dev,
+				     struct device_attribute *attr,
+				     const char *buf, size_t count);
 ssize_t hsmp_gmi3_link_width_store(struct device *dev,
 				   struct device_attribute *attr,
 				   const char *buf, size_t count);
-- 
2.34.1


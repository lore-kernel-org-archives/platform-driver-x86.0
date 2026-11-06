Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793983602;
	b=l3hcFc2O+lvE5vxpXRmkMlU+pb7rQYHui+sQ+/skX8c99Hev5YHw7v4o9ROymk5KRkst
	 9EjIQUS3PAEk6WkfKGWbapHbf+rMyENt/iOx+WOibxjnigxRWN6pjVnIPf68FIs1MWMO2
	 TMOQ8sedOdnGHCVhcXh3HN2fcZrIiHhk0/kD8R/HNfXT381b6hLU0hl499zUnhECOagW2
	 dyIUP4Jc9GRPIOsT50bxjquyV1vIYo6rmBmkAyEHoMVPjCEr/AWPBVlR/P7tPZgTI3Hkq
	 4fNV5kG6xLQ3tw7tIce05s0D2cXmvKAGDPvnIzoj3etinX0tSWRwuVFsDmSxcX5PL6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793983602;
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
	bh=pR58bAqqZjHsorrmp0zYW9L2Z3Fvr+ARxTnmAetllcQ=;
	b=EpOpYSXXLMQ8TCrgJJkkXTsATQEBFkuUmTVdjC8YIoIphhwTd/Sx+7XJQIoFjlI9x8qF
	 luyPsvuGumC8TuG50PdGZlU2DEulFmTXIHlFknIztWsmGr62gLgljstTanqhFHxrB++eE
	 VE3GzlL4SwmbrnKCo1OK+k31lCR7DVEdJhySokQDMAlbI/wuDIwyVXsR2JzdQn/7DrKWa
	 7Z/UpzTGKXIJqGZDcl9bPvqA4Vx9pJXw4yDJrn4KTgeVAEpZlSvNrS0GZYKfRaavr5Zw1
	 IhAOma+jmAHZC1JLlz3FliREusCmH0C1tD3qKhrQPqxNoLAZyXOTLeH5ictwvood4Pw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=MyezKrYb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.10
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011010.outbound.protection.outlook.com [40.107.208.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240D2606A332
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Nov 2026 16:46:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 240D2606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=MyezKrYb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B52p5ugJqsI/qJgu3V82U/u5ybPo2b+3IrXGWNY44eIFKrZR5SM1IZtDC81kKV9wXHuPdtH4pN0Jl81YnSYiNe9p4v3lSruaWJcr/z8/Qy0SRxWxYk/Lrv4zVBwEFCHA0mZu9RX7jcENKn/i5bmkBvEF7KPcx6LruBEVzD2K0gsh7XGgno5u1+87+WFWnZqvAgy9ZRkH+zyRS+C1Vos7JDNxtG9tbfJvr/NwT7+kDgM/I0WhZn35/FCy2SRurirH39OqC4gw2OlZBNYV3Kr+oKXBJKs5QSS4r9/t74XOJ3RV/1JwQn/Mk17BCgJLYDLk5cPthxhYT5bpAw9oruB8uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pR58bAqqZjHsorrmp0zYW9L2Z3Fvr+ARxTnmAetllcQ=;
 b=GLNJSO5uDdgMOTsaiAIRY/rYNuZDWPpwm83D80YAowcjES4l2obR9SqW85vNymHo1dbOf4sgikbNWmlodFo9Af2Ja3veiKJKVvc8n1Mn4LXLaZruj1JeeMjvrQMx4h5NlrPOGNvj4Gr/An4jmRVwAwGXaa3G+lWU1FWY/bpH1L50ZW17quUN+u5k5+Uk567DULmWHrOAWFzreyG2iKsK9LSE+liqT8K3GKKTlCcCHdzs1Clz4vaJEGHYDQMR8rbjqdMjmXawyW0tEc3/dSe3F+A9TJOoSXSTOK48U7XSdnvQOLfBMXEV0nFVJcn1Jq7OW9P9KHUyGK45Fq6nvZSPqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pR58bAqqZjHsorrmp0zYW9L2Z3Fvr+ARxTnmAetllcQ=;
 b=MyezKrYbHHxlxO/2muWMJVbY5IEHi5zYPAeoEMNDnVkYrSq6oTwWVLG0upHqmmpFwTFtQzgv0vNCxrg6tzlH2aO9TKRV1k4mD1f1d/Uxe8y7L7o50EZG19hZaMgUqPQhLHbCaZTuPk4HQSNlerkIitiuCDhVUsSVp+IMwGXMHlI=
Received: from MW4PR04CA0312.namprd04.prod.outlook.com (2603:10b6:303:82::17)
 by CH1PPF2D39B31FF.namprd12.prod.outlook.com (2603:10b6:61f:fc00::60a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 16:46:39 +0000
Received: from BY1PEPF00026959.namprd05.prod.outlook.com
 (2603:10b6:303:82:cafe::28) by MW4PR04CA0312.outlook.office365.com
 (2603:10b6:303:82::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 16:46:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF00026959.mail.protection.outlook.com (10.167.244.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 16:46:39 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 10:46:34 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 10/10] platform/x86/amd/pmf: Add extended custom BIOS inputs for 1AH_M80H
Date: Fri, 6 Nov 2026 22:14:29 +0530
Message-ID: <20261106164429.30738-11-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106164429.30738-1-Shyam-sundar.S-k@amd.com>
References: <20261106164429.30738-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF00026959:EE_|CH1PPF2D39B31FF:EE_
X-MS-Office365-Filtering-Correlation-Id: 793c9ba2-2b89-4a27-43eb-08df3c258768
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|261102123227099003|261009223027099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003|261021135927099003|261028144727099003|261026140227099003|56012099006|11063799006|6133799003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1b4xPM6/33lSpNUTtdjrUk/j4U2wrOxLQPOLSFu4t726I3Pk/gX0w36kbHnSrE0nqeFxolqdPC6grE48XI/mvHmHChJ9f5Xe2TdgwJAjkzDC6QQxFd3K/MGr2X5WGNrIK90hpQSyGM8rH5EUm/dbDxkUQAXktmky6ohka2LTh/yArBkuhhgw4NcDZC+Fkc3UVvpLHaMijO/f9sPf7XfXunkDuJ9s6AuELXoceY0NQrrZv7VvZrf7Za3CvVrCqUgiR9/XncDzoqWTW6YE90mBhVOehQ0wTUgEbhVBfY8pGowQNF8PUOdmVAZHSsRss/4YZ5dpo9VZ+9uj9l/LSA/UAhoxYHi30xRw1iP68hQCqey6VfW4tz0rtbqcm7b/0xMQoKKys5inmX9dnXKCMHleHLBDG05oR1aibeB0ggBATCnl7nzGkw+vea6rswyXSobisju0uhcZYLGs0sXdd+xa7Cgjp0uM+NskGlTKMtThogArFAR0BNWp0393UWScY4L66bkrzcIhRrLCBwTyuFl4e1bOL8ab7Xo7hAutczE7ghFPXT4vBV+VpjKGxRCQmk7kDGskFcEz4WXdb4cRflkRHTwVr68fzm5JToZ45FBacMcGep7m2RONZoPa/gn7PUghhl5ydTX+X6TEEmxwjVG6NP/S9/AXRiNLKbcAb1OxhIzsPbjWtsyu3Q9ASx84UztL0Rf8z8S1FFJY60BZ5DtrRw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(261102123227099003)(261009223027099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261021135927099003)(261028144727099003)(261026140227099003)(56012099006)(11063799006)(6133799003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7kS0PmIou0Uz3csdmAloMZeYIulvPkhGB08O48erHhBYkf6NEzbFg3BcexzDq25cd2uOGnIVpjYzeAQ9KOG09z0323PwBcS6SXvW8RNtvizXo6r+Or0kFGlWG7kbsjKJWsyO563sPX1dunlDUCMSo9voBab8B6zo/pCL6xyrkGf85SPCbhvfZaktSd5KFx5VBb4ozgHhMHAU6HgOlcdlwa11rimLWvG3jYrPUiyaLm4A8zS/pMYQu2rMScTSX5WXc/2TIW2aejKvOAXJBHj75YWih5hM1e88+qyWn8uX49W7OuJkesHslvEAnzy0Kpd5ZkCwAA/9Wm3QHcBE4fGZj4qnCAqjtuBKxxcfuV4TxqGH5dePWrUm8FJOyBwrdJY0tXzCCOHKuc+OD7XrIHzXlwBKKWQyKNDT+d63dSD+ZexkA2W14EFFowR5qzzETHyR
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 16:46:39.1853
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 793c9ba2-2b89-4a27-43eb-08df3c258768
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF00026959.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF2D39B31FF

Earlier platforms support up to 10 custom BIOS inputs through the APMF
SBIOS requests function. APMF 2.03 extends this to 20 inputs on
1AH_M80H: the SBIOS request structure gets a second set of 10 values,
and inputs 11-20 have their own notification bits (16-25).

Add the APMF 2.03 SBIOS request structure and use it on 1AH_M80H. Size
the ring buffer entries and the saved values for 20 inputs. Older
platforms keep filling only the first 10 entries. Pass inputs 11-20 to
the TA in the bios_input_3 fields of the v2 condition table, which were
reserved until now.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/acpi.c | 32 +++++++++++++----
 drivers/platform/x86/amd/pmf/pmf.h  | 54 +++++++++++++++++++++++++++--
 drivers/platform/x86/amd/pmf/spc.c  | 11 +++---
 3 files changed, 83 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 20e9603d5c08..4305dfe81c11 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -288,11 +288,18 @@ static void amd_pmf_custom_bios_inputs_rb(struct amd_pmf_dev *pmf_dev)
 		break;
 	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
 	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
-	case PCI_DEVICE_ID_AMD_1AH_M80H_ROOT:
 		for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
 			rb->data[rb->head].val[i] = pmf_dev->req.custom_policy[i];
 		rb->data[rb->head].preq = pmf_dev->req.pending_req;
 		break;
+	case PCI_DEVICE_ID_AMD_1AH_M80H_ROOT:
+		for (i = 0; i < ARRAY_SIZE(custom_bios_inputs_ext); i++)
+			rb->data[rb->head].val[i] =
+				(i < BIOS_INPUTS_MAX) ?
+				pmf_dev->req_ext.custom_policy[i] :
+				pmf_dev->req_ext.custom_policy_ext[i - BIOS_INPUTS_MAX];
+		rb->data[rb->head].preq = pmf_dev->req_ext.pending_req;
+		break;
 	default:
 		return;
 	}
@@ -322,13 +329,24 @@ static void apmf_event_handler_v2(acpi_handle handle, u32 event, void *data)
 
 	guard(mutex)(&pmf_dev->cb_mutex);
 
-	ret = apmf_get_sbios_requests_v2(pmf_dev, &pmf_dev->req);
-	if (ret) {
-		dev_err(pmf_dev->dev, "Failed to get v2 SBIOS requests: %d\n", ret);
-		return;
-	}
+	if (is_amd_pmf_1ah_m80h(pmf_dev)) {
+		ret = apmf_get_sbios_requests_v2_ext(pmf_dev, &pmf_dev->req_ext);
+		if (ret) {
+			dev_err(pmf_dev->dev, "Failed to get v2 ext SBIOS requests: %d\n", ret);
+			return;
+		}
 
-	dev_dbg(pmf_dev->dev, "Pending request (preq): 0x%x\n", pmf_dev->req.pending_req);
+		dev_dbg(pmf_dev->dev, "Pending request v2 ext (preq): 0x%x\n",
+			pmf_dev->req_ext.pending_req);
+	} else {
+		ret = apmf_get_sbios_requests_v2(pmf_dev, &pmf_dev->req);
+		if (ret) {
+			dev_err(pmf_dev->dev, "Failed to get v2 SBIOS requests: %d\n", ret);
+			return;
+		}
+
+		dev_dbg(pmf_dev->dev, "Pending request (preq): 0x%x\n", pmf_dev->req.pending_req);
+	}
 
 	amd_pmf_handle_early_preq(pmf_dev);
 
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 24933da9b3cd..f6c2a9aac00f 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -163,6 +163,7 @@ struct cookie_header {
 #define APTS_MAX_STATES		16
 #define CUSTOM_BIOS_INPUT_BITS	GENMASK(16, 7)
 #define BIOS_INPUTS_MAX		10
+#define BIOS_INPUTS_EXT_MAX	20
 #define CUSTOM_BIOS_INPUT_RING_ENTRIES	64	/* Must be power of two for CIRC_* macros */
 
 /* amd_pmf_send_cmd() set/get */
@@ -312,6 +313,21 @@ struct apmf_sbios_req_v2 {
 	u32 custom_policy[BIOS_INPUTS_MAX];
 } __packed;
 
+/* As per APMF 2.03 */
+struct apmf_sbios_req_v2_ext {
+	u16 size;
+	u32 pending_req;
+	u8 rsvd;
+	u32 ppt_pmf;
+	u32 ppt_pmf_apu_only;
+	u32 stt_min_limit;
+	u8 skin_temp_apu;
+	u8 skin_temp_hs2;
+	u32 custom_policy[BIOS_INPUTS_MAX];	/* inputs 1-10 */
+	u8 asm_lite_ctrl;
+	u32 custom_policy_ext[BIOS_INPUTS_MAX];	/* inputs 11-20 */
+} __packed;
+
 struct apmf_fan_idx {
 	u16 size;
 	u8 fan_ctl_mode;
@@ -641,7 +657,7 @@ enum power_modes_v2 {
 };
 
 struct pmf_bios_inputs_prev {
-	u32 custom_bios_inputs[BIOS_INPUTS_MAX];
+	u32 custom_bios_inputs[BIOS_INPUTS_EXT_MAX];
 };
 
 /**
@@ -650,7 +666,7 @@ struct pmf_bios_inputs_prev {
  * @preq: Pending request value associated with this event
  */
 struct pmf_bios_input_entry {
-	u32 val[BIOS_INPUTS_MAX];
+	u32 val[BIOS_INPUTS_EXT_MAX];
 	u32 preq;
 };
 
@@ -748,6 +764,7 @@ struct amd_pmf_dev {
 	const struct amd_pmf_ta_ops *ta_ops;
 	struct amd_pmf_metrics_v3 smartpc_prev_metrics;	/* Smart PC delta baseline */
 	bool smartpc_metrics_have_prev;
+	struct apmf_sbios_req_v2_ext req_ext;
 };
 
 struct apmf_sps_prop_granular_v2 {
@@ -1017,6 +1034,29 @@ static const struct amd_pmf_pb_bitmap custom_bios_inputs_v1[] __used = {
 	{"NOTIFY_CUSTOM_BIOS_INPUT10",    BIT(16)},
 };
 
+static const struct amd_pmf_pb_bitmap custom_bios_inputs_ext[] __used = {
+	{"NOTIFY_CUSTOM_BIOS_INPUT1",  BIT(5)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT2",  BIT(6)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT3",  BIT(7)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT4",  BIT(8)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT5",  BIT(9)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT6",  BIT(10)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT7",  BIT(11)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT8",  BIT(12)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT9",  BIT(13)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT10", BIT(14)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT11", BIT(16)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT12", BIT(17)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT13", BIT(18)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT14", BIT(19)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT15", BIT(20)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT16", BIT(21)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT17", BIT(22)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT18", BIT(23)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT19", BIT(24)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT20", BIT(25)},
+};
+
 /* Command ids for TA communication */
 enum ta_pmf_command {
 	TA_PMF_COMMAND_POLICY_BUILDER_INITIALIZE,
@@ -1206,7 +1246,7 @@ struct ta_pmf_condition_info_v2 {
 	u32 workload_class;
 	u32 video_enc_sessions;
 	u32 video_dec_sessions;
-	u32 rsvd[10];
+	u32 bios_input_3[10];
 };
 
 struct ta_pmf_enact_table_v2 {
@@ -1414,6 +1454,12 @@ static inline int apmf_get_auto_mode_def(struct amd_pmf_dev *pdev, struct apmf_a
 	return apmf_if_call_store_buffer(pdev, APMF_FUNC_AUTO_MODE, data, sizeof(*data));
 }
 
+static inline int apmf_get_sbios_requests_v2_ext(struct amd_pmf_dev *pdev,
+						 struct apmf_sbios_req_v2_ext *req)
+{
+	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS, req, sizeof(*req));
+}
+
 static inline int apmf_get_sbios_requests_v2(struct amd_pmf_dev *pdev,
 					     struct apmf_sbios_req_v2 *req)
 {
@@ -1482,6 +1528,8 @@ static inline u32 amd_pmf_get_ta_custom_bios_inputs_v2(struct ta_pmf_enact_table
 		return in->ev_info.bios_input_1[index];
 	case 2 ... 9:
 		return in->ev_info.bios_input_2[index - 2];
+	case 10 ... 19:
+		return in->ev_info.bios_input_3[index - 10];
 	default:
 		return 0;
 	}
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 35538732259a..ff80ee9048b7 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -53,7 +53,7 @@ void amd_pmf_dump_ta_inputs_v2(struct amd_pmf_dev *dev, struct ta_pmf_enact_tabl
 		amd_pmf_get_platform_type(in->ev_info.platform_type));
 	dev_dbg(dev->dev, "Laptop placement: %s\n",
 		amd_pmf_get_laptop_placement(in->ev_info.device_state));
-	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
+	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs_ext); i++)
 		dev_dbg(dev->dev, "Custom BIOS input%d: %u\n", i + 1,
 			amd_pmf_get_ta_custom_bios_inputs_v2(in, i));
 	dev_dbg(dev->dev, "==== TA v2 inputs END ====\n");
@@ -100,6 +100,9 @@ static void amd_pmf_set_ta_custom_bios_input_v2(struct ta_pmf_enact_table_v2 *in
 	case 2 ... 9:
 		in->ev_info.bios_input_2[index - 2] = value;
 		break;
+	case 10 ... 19:
+		in->ev_info.bios_input_3[index - 10] = value;
+		break;
 	}
 }
 
@@ -128,8 +131,8 @@ static void amd_pmf_update_bios_inputs_v2(struct amd_pmf_dev *pdev,
 {
 	unsigned int i;
 
-	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++) {
-		if (!(data->preq & custom_bios_inputs[i].bit_mask))
+	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs_ext); i++) {
+		if (!(data->preq & custom_bios_inputs_ext[i].bit_mask))
 			continue;
 		amd_pmf_set_ta_custom_bios_input_v2(in, i, data->val[i]);
 		pdev->cb_prev.custom_bios_inputs[i] = data->val[i];
@@ -160,7 +163,7 @@ static void amd_pmf_get_custom_bios_inputs_v2(struct amd_pmf_dev *pdev,
 
 	guard(mutex)(&pdev->cbi_mutex);
 
-	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
+	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs_ext); i++)
 		amd_pmf_set_ta_custom_bios_input_v2(in, i, pdev->cb_prev.custom_bios_inputs[i]);
 
 	if (CIRC_CNT(rb->head, rb->tail, CUSTOM_BIOS_INPUT_RING_ENTRIES) == 0)
-- 
2.34.1


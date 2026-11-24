Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795506796;
	b=PyYf8yKuQ7JwaH9duyLBXINT+SFoaDM6XhcAS/xf3c9AmXiAo81mjzXo0RmZewmsTBIR
	 RT/LGe37+0UtFAVUPCexihGqyY361nlPd3apaphP9MJCULW8pr9bhJALCvAAguPuxHT/m
	 CHLFWuGjWq72HMl+EeZHxOlYrRrG0+y5HVbJN+sTy+lVDhyy8putBAzqDh16/d0A1c26J
	 qhbprDf2l0VS6fbO4fC+84TIJ8Z1FQ1lWteZChqgf4gJywDyEwhs/w1zX/6Ber7GMdzqc
	 9MbLsZ70w35nDTcpEUe8KKaxtrDKwRuRuVueNU81KXavNHlmz5RP72e+02l/4HJdHCQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506796;
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
	bh=+jIupWZQb6Wc+ExHqZKTWmOZ7sV9MFhR8ybxnFje1/g=;
	b=JPqAWmfrEIZU5sn0CFMeco903KiLkIujWeOVcCEfHZL3JsbMScqhsMZZZIML2kJXlwBV
	 YVZ4cOtxpPZHDnvLCfGSycsBC/1DPMwBPFWkhF3gAUwg0ab1ErBWo+WBvkp8BfVHgAj9Y
	 JWyXzPxzrBJHuOfV4DDyDeSncev0Xli/IkJmzHpfHMGDoZvom6ckDkq6GLjD0WPdZqZeb
	 Zk6zKasHiBQjU30E82ycBUgICMvcr1XRAJf/n3jICnyeq7bS0EJJQKSlwYhpBFjgMniVo
	 zQJHao5M50dCoeEMyH3UFSScddK3VfkOtRdv7O/01hIy9VOCYxaRbEgcWE10hZdyixA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=KS1n3Epv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.19
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010019.outbound.protection.outlook.com [52.101.61.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2F2606A31E
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 07:53:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA2F2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=KS1n3Epv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RkThGVcau205MP+wCokuvvCPutygraKzzvAMW/pcVjCGl33P+D/WHUKwiaiHvo18Bn0B9ZEaYRYAsG4emXPY1PIJkMxfcNSzl01NAOdxbTV+H0x7DpTQQTXMI2NDZvGYLRDDclrqftOiMK+lMy6UkusXaUrtCgg+iAlROD3089B/evJlzPEA+/5x4CSbj74D1KcEBoDaRsNXWciV++dFEbTs8r+c7+JegTDCgQjOpooedrKVNAFK2jM0ESuJT+/GjXtb7olaYLDEyDSlYpa4c6r7HeHtv+LmOAK45IOtve5Mpf935Q3PA70uKojDZcmaCA3ACSZx9dKWnc5tQgyWvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+jIupWZQb6Wc+ExHqZKTWmOZ7sV9MFhR8ybxnFje1/g=;
 b=WomGtyN+sN2zuJtXAoHnABxx/nC3Lz7H7/mryCn9e5TS71sJC5qOnCPb1pkNSKplEA6edrVNo5AG2lUyprGydKOh50uaTfVScr9yuKo8sc/SsdtPkfb8nDxcvtkdy8mgRZnWzuSe4lQd1AyDPKONYbWlAeKf76Bq41vqSoqty6GHqdVHl5EILLZxXlBqEJbGuT0kHrqdFqVkE0n2hZv4ucGtAiXv9MM+f8DFgVi6foIAwpjEJjHNrG1LGJl2sssXy3OBjZRgisatl43vYp7Owbunhz3v5j0O02Tcvmf9HwrwV3THbf/J5s/o/yRkfIriJbIHf7NZCGIpLP8mYEhM4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+jIupWZQb6Wc+ExHqZKTWmOZ7sV9MFhR8ybxnFje1/g=;
 b=KS1n3EpvETLQGuTV5Qf6CQVjGwnrsFDZy6S6Im7gsU/ybm34ylGBjeAAG+L+9Uqd6SX7NjcCoeZDc6INJSOKTVOT4XQH5emVAeNmd2wl0GCndZKrLGanUnK2nugMdHS/6h6PE8gn6VUBgPKE4mIiCSVWmauzDOzpQi152f8//5g=
Received: from PH8PR07CA0005.namprd07.prod.outlook.com (2603:10b6:510:2cd::29)
 by CY5PR12MB6622.namprd12.prod.outlook.com (2603:10b6:930:42::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Tue, 24 Nov
 2026 07:53:05 +0000
Received: from SJ5PEPF000001D3.namprd05.prod.outlook.com
 (2603:10b6:510:2cd:cafe::73) by PH8PR07CA0005.outlook.office365.com
 (2603:10b6:510:2cd::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Tue, 24
 Nov 2026 07:53:05 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001D3.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 07:53:05 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 01:53:02 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Mario Limonciello <superm1@kernel.org>
Subject: [PATCH v4 11/11] platform/x86/amd/pmf: Add extended custom BIOS inputs for 1AH_M80H
Date: Tue, 24 Nov 2026 13:22:13 +0530
Message-ID: <20261124075213.2317127-12-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124075213.2317127-1-Shyam-sundar.S-k@amd.com>
References: <20261124075213.2317127-1-Shyam-sundar.S-k@amd.com>
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
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D3:EE_|CY5PR12MB6622:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bb952c8-7e4f-41da-d24b-08df49fff8ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|36860700016|1800799024|6133799003|18002099003|22082099003|11063799006|261026140227099003|261021123027099003|261022075727099003|261028144727099003|56012099006|261022105027099003|10067099003|261009223027099003|261021135927099003|261021121427099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	cVW8igEs0txImpEF3IkluN0x5boHN6qNQMMumLWsyS/ry0+s5bRv1gQRZzTAy1d72pJ/R4ycs+986Qq8xO6z7CnwOdK7ng/BRDcVhuL+PR7Bo5kUZ+MyoffTPinVbLXum2AUYEwlHy7JIgi8dIdUVmBcHDd9oBou75O9wZ4KZqolAYeMpbKcRr6aY1G5yYfDqc5Gl195BQPvdUNh0nU4JkH60vH4XLfwJEhLPFCK2S5nh/UUNSFiD0Gw7dmbzs0x1P0mOAegIkKPoBhE7nU6EovR2pUJ5tEhwtSHFlDonFRreZOJxvHr3ns2VgHHovqAnqOvKUpfm34UMPnBS4kiyER2h3+4VO/5bajn5g20oSAu/sUaR2pPOo+DulYF1Lid5VZ+aumeQMyjod7gWrPn9+HjpLXzySPiKm9rlBuM/jjIBupcwXl2NdPFs4VIw+GXXNjpwmkwa3X0CzV7vp7CSkqzxiuBVgyDWannJzhvQv+p5EKS0nM2aTXAwZEfWEZQd0WIG8y2KMqAPuLpNt2IYSr3WMBfpbdnnr6U2bsDVU68PBrvOuQ8fILBGNjQkUn0mnnhJ1x3sQM1iB6GWZh8Jxvr7WTYQtGf5ApJIMHLUTtAnbvdr8VJEmwlZCop/71KeoFKnUb+OCz/COJn3x8VL18HXP0vT5wT1izhBesxcncsX1OKAmXJzAweiW5gSxfYcMBhbWrOS1QP3B1fQ+uQKQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(36860700016)(1800799024)(6133799003)(18002099003)(22082099003)(11063799006)(261026140227099003)(261021123027099003)(261022075727099003)(261028144727099003)(56012099006)(261022105027099003)(10067099003)(261009223027099003)(261021135927099003)(261021121427099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mDrHYU4/z41E+8R+ZFTUEVY59QhIpCIG4u6L4BjSh0CYHb6/5Kkg/Hqz9+DI3gXe3EUrYAmRguCLlytd1UVyqxUbV5TLDPBbZgkvleuwaHAqiN6rPil5ZjD9vsPtu05bVLP8zl+Eo0vVCT3QxMMk1XoxmrJ/8bL1m8Ig1OCOJOVADjdHD5uUsGlODfMBuSGdUJXpcSStg2/leA2odQDOEsUTOJIVXWzhB7BS4nm44A3Q/ytJ/TTx+gWZRRO2+oTJ4Mjkc0o4T12GsrveJcQ0PTuHPsFgnmaZQe6HuZ+x6U/S/Nacl0yRR2FraZG/pRUfilb6fWDCw8j2AFK5thgvv+bbyadTFm1b8ArC73w0uPeGu5iUu4CpxrZUpjR042EO3vdsFrksfwGi9C5GKJYei++dvArpPyi5T25ETj2Tr1Mdtl6k7arrAF1WZ0yDp/2L
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 07:53:05.0793
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bb952c8-7e4f-41da-d24b-08df49fff8ee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6622

Earlier platforms support up to 10 custom BIOS inputs through the APMF
SBIOS requests function. APMF 2.03 extends this to 20 inputs on
1AH_M80H: the SBIOS request structure gets a second set of 10 values,
and inputs 11-20 have their own notification bits (16-25).

Add the APMF 2.03 SBIOS request structure and use it on 1AH_M80H. Size
the ring buffer entries and the saved values for 20 inputs. Older
platforms keep filling only the first 10 entries. Pass inputs 11-20 to
the TA in the bios_input_3 fields of the v2 condition table, which were
reserved until now.

Add apmf_get_custom_policy_ext() to get an input from the set it belongs
to, and read the SBIOS requests through amd_pmf_read_sbios_requests_v2()
so that the event handler stays the same for all platforms.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/acpi.c | 31 ++++++++++++--
 drivers/platform/x86/amd/pmf/pmf.h  | 66 +++++++++++++++++++++++++++--
 drivers/platform/x86/amd/pmf/spc.c  | 11 +++--
 3 files changed, 98 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index d2462ad7695d..c920e824a80a 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -278,11 +278,16 @@ static void amd_pmf_custom_bios_inputs_rb(struct amd_pmf_dev *pmf_dev)
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
+				apmf_get_custom_policy_ext(&pmf_dev->req_ext, i);
+		rb->data[rb->head].preq = pmf_dev->req_ext.pending_req;
+		break;
 	default:
 		return;
 	}
@@ -305,20 +310,40 @@ static void amd_pmf_handle_early_preq(struct amd_pmf_dev *pdev)
 	pdev->cb_flag = false;
 }
 
+static int amd_pmf_read_sbios_requests_v2(struct amd_pmf_dev *pdev, u32 *preq)
+{
+	int ret;
+
+	if (is_amd_pmf_1ah_m80h(pdev)) {
+		ret = apmf_get_sbios_requests_v2_ext(pdev, &pdev->req_ext);
+		if (ret)
+			return ret;
+		*preq = pdev->req_ext.pending_req;
+	} else {
+		ret = apmf_get_sbios_requests_v2(pdev, &pdev->req);
+		if (ret)
+			return ret;
+		*preq = pdev->req.pending_req;
+	}
+
+	return 0;
+}
+
 static void apmf_event_handler_v2(acpi_handle handle, u32 event, void *data)
 {
 	struct amd_pmf_dev *pmf_dev = data;
+	u32 preq;
 	int ret;
 
 	guard(mutex)(&pmf_dev->cb_mutex);
 
-	ret = apmf_get_sbios_requests_v2(pmf_dev, &pmf_dev->req);
+	ret = amd_pmf_read_sbios_requests_v2(pmf_dev, &preq);
 	if (ret) {
 		dev_err(pmf_dev->dev, "Failed to get v2 SBIOS requests: %d\n", ret);
 		return;
 	}
 
-	dev_dbg(pmf_dev->dev, "Pending request (preq): 0x%x\n", pmf_dev->req.pending_req);
+	dev_dbg(pmf_dev->dev, "Pending request (preq): 0x%x\n", preq);
 
 	amd_pmf_handle_early_preq(pmf_dev);
 
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 00e2b161c4e5..4412f9e47e84 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -165,6 +165,7 @@ struct cookie_header {
 #define APTS_MAX_STATES		16
 #define CUSTOM_BIOS_INPUT_BITS	GENMASK(16, 7)
 #define BIOS_INPUTS_MAX		10
+#define BIOS_INPUTS_EXT_MAX	20
 #define CUSTOM_BIOS_INPUT_RING_ENTRIES	64	/* Must be power of two for CIRC_* macros */
 
 /* amd_pmf_send_cmd() set/get */
@@ -314,6 +315,21 @@ struct apmf_sbios_req_v2 {
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
@@ -643,7 +659,7 @@ enum power_modes_v2 {
 };
 
 struct pmf_bios_inputs_prev {
-	u32 custom_bios_inputs[BIOS_INPUTS_MAX];
+	u32 custom_bios_inputs[BIOS_INPUTS_EXT_MAX];
 };
 
 /**
@@ -652,7 +668,7 @@ struct pmf_bios_inputs_prev {
  * @preq: Pending request value associated with this event
  */
 struct pmf_bios_input_entry {
-	u32 val[BIOS_INPUTS_MAX];
+	u32 val[BIOS_INPUTS_EXT_MAX];
 	u32 preq;
 };
 
@@ -765,6 +781,7 @@ struct amd_pmf_dev {
 	const struct amd_pmf_ta_ops *ta_ops;
 	struct amd_pmf_metrics_v3 smartpc_prev_metrics;	/* Smart PC delta baseline */
 	bool smartpc_metrics_have_prev;
+	struct apmf_sbios_req_v2_ext req_ext;
 };
 
 struct apmf_sps_prop_granular_v2 {
@@ -1034,6 +1051,29 @@ static const struct amd_pmf_pb_bitmap custom_bios_inputs_v1[] __used = {
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
@@ -1223,7 +1263,7 @@ struct ta_pmf_condition_info_v2 {
 	u32 workload_class;
 	u32 video_enc_sessions;
 	u32 video_dec_sessions;
-	u32 rsvd[10];
+	u32 bios_input_3[10];
 };
 
 struct ta_pmf_enact_table_v2 {
@@ -1431,6 +1471,24 @@ static inline int apmf_get_auto_mode_def(struct amd_pmf_dev *pdev, struct apmf_a
 	return apmf_if_call_store_buffer(pdev, APMF_FUNC_AUTO_MODE, data, sizeof(*data));
 }
 
+static inline u32 apmf_get_custom_policy_ext(struct apmf_sbios_req_v2_ext *req, int index)
+{
+	switch (index) {
+	case 0 ... BIOS_INPUTS_MAX - 1:
+		return req->custom_policy[index];
+	case BIOS_INPUTS_MAX ... BIOS_INPUTS_EXT_MAX - 1:
+		return req->custom_policy_ext[index - BIOS_INPUTS_MAX];
+	default:
+		return 0;
+	}
+}
+
+static inline int apmf_get_sbios_requests_v2_ext(struct amd_pmf_dev *pdev,
+						 struct apmf_sbios_req_v2_ext *req)
+{
+	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS, req, sizeof(*req));
+}
+
 static inline int apmf_get_sbios_requests_v2(struct amd_pmf_dev *pdev,
 					     struct apmf_sbios_req_v2 *req)
 {
@@ -1499,6 +1557,8 @@ static inline u32 amd_pmf_get_ta_custom_bios_inputs_v2(struct ta_pmf_enact_table
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


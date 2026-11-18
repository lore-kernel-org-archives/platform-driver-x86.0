Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795012377;
	b=2OMKzZQrRf5ix9hfinIZqgG4s11I5tLOv+LghAVZ2po2H5Ep6wK3DflgZTUP4P2cg2pu
	 cLRHJLsfCsIrRDqEalKalXltc/itOk1sQ2ufyDbHMBd/et4QZRzvXbIc4lhsDDdvHEILK
	 lpu8mQ4nS5QIMjZV+nlh953XtqdOE/QF+POMrqJvw2l7S4nTWcs2inbZtDHM/ZNaDS7xc
	 fS1ILBtx4aHnBYYftzjByOQQcIgUV9klUIbaJYVsHzcsXliGEdldJAqXKpVsFxKB7lH+R
	 FrQDQrGYNXSyyS31j81u8pWvTIV01cKNawu4sdI7hrgILqXsJtkgnz0ZfZbipHkKAVg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012377;
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
	bh=SqF/+Y5u9VMIwHMgZiwGA0wgpFjy/J+LJmvLCChBZns=;
	b=sjOBcbzph0XOhQIAG4Fqo0GdYR97rNXagRUKe1dVBdxw7NFbLZQwwmmyqYtQepqwATH9
	 BKi60VC2OKXNT8TfEnhmczo+Xo3WlVBlROd1KSwll97oFjymgffEt/uzcH/abFYYZxxeV
	 ImanSi8HaBpIJaTVr5I/MXDV26SCtaQRviD3ky3Xl0iIqQwmN2igLd3XP7CDAeu8E2TxW
	 VNPhh263i1XdN88t175LDm6DSYoq24bLONbNG5D290X7CauapaxgAyJDXYegnponqVg9I
	 3c5KC+wEzZqSOeHVi6S4r68sHw2hbXIlopjDCU3hxWlGE37E8LfBV9uDEdbfUEynQPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=QqVPqVmM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.16
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011016.outbound.protection.outlook.com [52.101.52.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6F3606A325
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 14:32:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE6F3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=QqVPqVmM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VAZ2+bWRfy5GWHPFnm6WvsPAKuqa7G36i0dD6bk8Ap523gdqCN+7Oh5MgEWHkKAd6xig1tcWcaYO7mOg6hXUCpCDtybXgDEL0EshU8+L0PISzJQ2XAQvz/wM1hQS5GvPAvSYlYvltg1xM/n3LYHz9mPVUOG2c1S6/UMlitjuun6o8fH1PhkpTv5Be3hq8y7x+3KwdBlBUudJ5Debzl1+JSqbZ4um9B71eRgn46ZztLKXyG30xFRoaoRVpPvw+xkw36x6rwbM2EUBWiCmxnah9hAkyHjrtMwwmEsVFjlDKH3v4SsIT6al/RAIyVjqpUncfUrcEXI4XE385rS5HobSNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SqF/+Y5u9VMIwHMgZiwGA0wgpFjy/J+LJmvLCChBZns=;
 b=d4dKbGXJWSXpHWjxM9RH2aJWgiDFVdiG0tzNjuKH0AITdhVt29DizQtgj2KlcZUUZnGrxRyqXr8gGmUUQzYPCW3Abed71WVYlNfGqbtrRqw+uxSvBGaMyk0uMqFfTxu3CjSCEP9FAKmKKfwJVk7oswyfT5OjaQ1fw9Vc8PKEpUZqqI9r9qiXAQa8m5ccn5hTKJRMAxvR6zWVllyKVonqB3g4E58kZ0n5f2VLeFjiEY4r1LPatrzNMbp6TNe0ClS+MdGoGdQ3Y+Xfmtui5ZE+eAUDBsYiX5BjXr8gsQt9ti7lA/Wyad84FL7jgT0/TLL8P6Fqu5tgBWDve3hW5Dwrwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SqF/+Y5u9VMIwHMgZiwGA0wgpFjy/J+LJmvLCChBZns=;
 b=QqVPqVmMtvDALa/ms3HYwOZUHD42tYnMhrinK4WrIjJEwy2DylP7xvCTinKii3dVgLFJ9KjZ4fRffvZN7bD6pZA8tDlPyk/Ai38hkAeXsuiDtQje7G45k0iGwdq9AzVFoFrUy65A9ZniiPCON0zKa0pkNE4ORX2dsnzjZvbcd6Q=
Received: from PH8P221CA0058.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:349::7)
 by LV2PR12MB733495.namprd12.prod.outlook.com (2603:10b6:408:423::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 14:32:54 +0000
Received: from PH3PEPF0005961A.namprd05.prod.outlook.com
 (2603:10b6:510:349:cafe::ac) by PH8P221CA0058.outlook.office365.com
 (2603:10b6:510:349::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Wed,
 18 Nov 2026 14:32:54 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH3PEPF0005961A.mail.protection.outlook.com (10.167.243.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 14:32:54 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 08:32:49 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Mario Limonciello <superm1@kernel.org>
Subject: [PATCH v3 10/10] platform/x86/amd/pmf: Add extended custom BIOS inputs for 1AH_M80H
Date: Wed, 18 Nov 2026 20:00:34 +0530
Message-ID: <20261118143034.3566684-11-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118143034.3566684-1-Shyam-sundar.S-k@amd.com>
References: <20261118143034.3566684-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: PH3PEPF0005961A:EE_|LV2PR12MB733495:EE_
X-MS-Office365-Filtering-Correlation-Id: ddd180f2-8c11-49cb-2db1-08df4580d52b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|261021123027099003|261021135927099003|10067099003|261022075727099003|56012099006|11063799006|261026140227099003|261028144727099003|261021121427099003|261022105027099003|261102123227099003|261009223027099003|18002099003|6133799003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Pr6rqgDPvVy2vGDARj0qXrXQJuk3HAiV4UuPYIGXK3k4rPULjUMhDp+eJVVSOZ9xEB/NJ9CCO767mSuXn9oWX3aIXuHMIZzupwrcktsXBat021Vkv1ZSjnYTzZSlUbumxJPbVhkBXVFpjSOESqIY0V/YiCfCOt6vkCalqaBfcpWFOIIx6ZD9UCbWUG9FV7LF+tqWjdRu7ZdyFddVZiB7hjuu/7cqa013yGD7YNeV6ZlHH0N26PGGoBCARsnzz6nj9axZBcwCCHEcViv8Y39OjkMrVZ2BglGfVSR8ydO3RWnHOtxA8A4R7RM1xve85XA9kzTr7lPv5P1/u/Ft6Ir+1C3PS5rsRxndv2FfXhOKBaxwrGkWAzU8T10cFpaKk2XFr39r0qlOJRCsriyqHGO3HTc99byv6X+egxQJvaimnuWg1KidWSnlim/3xiYLc9Oc1ICtmbt/XgY872JRH5XYo436NJ/AR9hGuwu7CbISc1B6HhxNF6OtSungX+q+OiTfIUeJVT8gOlIlz40eAMStSxxj9VUPrBFunFHmLMrrqzj08J5DjnU45kS2pJS9DvQ0ACgSnXzc5oCzVqCbJj07tg6dS7LoyIn8Rp8wKTAajHy6vJORsAUsbFBGAF44OEp0NJAOv57rAfOVk4xIAxTCIoN8U7MTUEc4kXw2p4Tguji4EO06hyElO66wYS7QwfhDRbeLyZA4YbnVzBiKSp0X7g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(261021123027099003)(261021135927099003)(10067099003)(261022075727099003)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261021121427099003)(261022105027099003)(261102123227099003)(261009223027099003)(18002099003)(6133799003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ic2mm7pqSUHcLpWkUHuIydFm5zEZGkUOMtJbFqoNpoYuvNq/JmgVtI/MPk7hGgpz2xjjhdKLrMy97XdU6XcX9/8XFNSbDBN4EFHM5iPTAp8Z3Db9JG0pYjOWspEm2lWpGu0zyTM8AbTdecTtMFA8UMKBvZ8q91r9HqoCbAG5jo6+rYNP0GdbbrGCkAfO8u2F08dgucmtgSorI2Y+cKczyQZdVB0DvhVSFYubr8wnC/8GbfP+fIkn0H4Kgiz7EzWz5bNQctzT4Bv5adDl4ugEW1O50Amwj3C1va2r6EfyUPnlpIErlnn5RzHRvObpLTazXuRbp7NV+4xed5j3Fhe4Dr/G0Use56WljhM/2CSJ8q87rkOd4XFWLkX1CR4vgPIaWgrG9ZiXnK+DWgynK1LIEDpwESYzD9wpl/z6e5+DJ+WWoW0qISD6a3M0cQbkpGE5
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 14:32:54.3200
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddd180f2-8c11-49cb-2db1-08df4580d52b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH3PEPF0005961A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB733495

Earlier platforms support up to 10 custom BIOS inputs through the APMF
SBIOS requests function. APMF 2.03 extends this to 20 inputs on
1AH_M80H: the SBIOS request structure gets a second set of 10 values,
and inputs 11-20 have their own notification bits (16-25).

Add the APMF 2.03 SBIOS request structure and use it on 1AH_M80H. Size
the ring buffer entries and the saved values for 20 inputs. Older
platforms keep filling only the first 10 entries. Pass inputs 11-20 to
the TA in the bios_input_3 fields of the v2 condition table, which were
reserved until now.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
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
index a3b8e11b65a0..29f3dd8c06f2 100644
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
 
@@ -750,6 +766,7 @@ struct amd_pmf_dev {
 	const struct amd_pmf_ta_ops *ta_ops;
 	struct amd_pmf_metrics_v3 smartpc_prev_metrics;	/* Smart PC delta baseline */
 	bool smartpc_metrics_have_prev;
+	struct apmf_sbios_req_v2_ext req_ext;
 };
 
 struct apmf_sps_prop_granular_v2 {
@@ -1019,6 +1036,29 @@ static const struct amd_pmf_pb_bitmap custom_bios_inputs_v1[] __used = {
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
@@ -1208,7 +1248,7 @@ struct ta_pmf_condition_info_v2 {
 	u32 workload_class;
 	u32 video_enc_sessions;
 	u32 video_dec_sessions;
-	u32 rsvd[10];
+	u32 bios_input_3[10];
 };
 
 struct ta_pmf_enact_table_v2 {
@@ -1416,6 +1456,12 @@ static inline int apmf_get_auto_mode_def(struct amd_pmf_dev *pdev, struct apmf_a
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
@@ -1484,6 +1530,8 @@ static inline u32 amd_pmf_get_ta_custom_bios_inputs_v2(struct ta_pmf_enact_table
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


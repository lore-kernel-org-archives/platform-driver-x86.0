Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010019.outbound.protection.outlook.com [52.101.61.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B2C3D525B;
	Wed, 19 Aug 2026 07:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787124743; cv=fail; b=AYS6krgDPCIP8LbeJ0Vv/A3LYOFFSujeL8s7Ow0EcLan+8K2rSS9g+SLzdxFU5CaGK6S2J7Vn4hSkEX4bbQLgaR7FA07NlAN4O/4vRPg2qhil2d2YYmUiLpv09tRyGE2SoPJk1Jiv48T5F5jfFLlisabpcdjcKIFevAWj7jRm1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787124743; c=relaxed/simple;
	bh=6ta+ThnahRmP2x8lJsc+4fYdOOT/w9DaY1vGOEOWBYs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HtxRe9ramRTn43dVDc4OP00YhnSpUtDdMSrgkSeQTY2+985oKohgXh+m1VFWTsX2+95hSTejb6OiXOu1V+V2CSMLm+RXv7V3XzLlrBd0Ii0QFKXL/t2bqTOKSFm0SkAHyadTMDkZLi4ik5HWkaYrVDOyUZhsI8srernKmIAzMhk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=nJPsyQUy; arc=fail smtp.client-ip=52.101.61.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nJPsyQUy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SR9DWzdY3N6evEEsHQS4P0KHGJ5bXXXRVVSz1cnru8oLftfScSytqdAiQSFmq4qOtrPOpoqJqxsoDpbSuDfgLS0g1YCEAluODkXh5hwthZbtma6oA6xwN3mSc0sFEIrYkf5TCE9JEyXXnK6gV+QVHXHKyZO5NFOaWZwN4xDJnbMLOHJMSB0oIU0w4ati3hFCmeO9MgV+IpzgyXwnWW4bGGYoCe+0kk8auRKThfY1yehyG0O9+WzmtAvGAtlNNNeS0NhdTyInrKkcDPpmJF5iM2h4DwJiR5QQlTVdv8M9DlJ1PJJnhHGE0MBMK8MFR1c9r15Rpk8taNZheebCNnzwBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWxoJoLpqxeHbVNpFP+S8/kNmKbqu1to+9a16zrVfB8=;
 b=HX/TwBN5zjHzjadjhg0E7dk4PoZc9nNmySzyhFAEF27XIsnMdx1V8vtYJ4wZxDc5PwI4GRWWtRR07T/Q+ueFzA0Vq8ZSvgub9aE4m2p1VSh3cvOd+/v+mHfv3K1WNkFaEmMenLj3lJlkRMNCcdMBZpRzsCN67uXVnQvqXdVRMgSc0YL7+V7YTH3llYbL5RZFQBN7LnKYjFW7Tc8VwdBYrWGJasY7C83JJftH5oU5EFPQrt3bqop8fwK/wDdCfQhbYMM0oXD2p1VT26/OGw0b3580Dp2Hz4V1AumfNhbTWm+gyvlQKQ9B/PFfnJahcAxfTdlpQyERqcF0PTWLfi2u0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWxoJoLpqxeHbVNpFP+S8/kNmKbqu1to+9a16zrVfB8=;
 b=nJPsyQUytJF2uyGXPjC5kGTiKnM5UHM0uawJ4agRs/4wnVo0zfdvpfKN9Sbz6A4fXsIhXrL50wAPlj2JQC8Vp13Rxaw+56+JjYqnledSgn2rx5ppHb7fL6nVPcXq2JqORFwbyblzIRtF52UHL83UYMV9zW2mb1nkXQPRDUd5AYk=
Received: from CH0PR04CA0050.namprd04.prod.outlook.com (2603:10b6:610:77::25)
 by CH2PR12MB4071.namprd12.prod.outlook.com (2603:10b6:610:7b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 07:32:15 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:77:cafe::94) by CH0PR04CA0050.outlook.office365.com
 (2603:10b6:610:77::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Wed, 19
 Aug 2026 07:32:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Wed, 19 Aug 2026 07:32:15 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 19 Aug
 2026 02:32:12 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>, <Mario.Limonciello@amd.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v3 1/4] platform/x86/amd/hsmp: Add HSMP client support for Family 1Ah
Date: Wed, 19 Aug 2026 13:01:54 +0530
Message-ID: <20260819073157.2426504-2-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260819073157.2426504-1-muralidhara.mk@amd.com>
References: <20260819073157.2426504-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|CH2PR12MB4071:EE_
X-MS-Office365-Filtering-Correlation-Id: eb557332-c79b-414e-ba9c-08defdc3fdcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|22082099003|18002099003|56012099006|3023799007|13003099007|6133799003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	vyv9iQAcjBN664qmK/N5l3R7lKH4ocd3JIx0mNJYgLf25OyWZ88VZMJVdb+igKxizDLFprPypaUzwwPRUvR9nk3grjbhl/JFAa/zUaYy9wIaYevuqkCItzBVSjXNEPg5RDR8FZPdzwk2q4BFKCyI6L8OzAqoGFYRFOncM/8+UpFxxNzl8aONWPua7uLTlZiifgGZ+OrIxlFmrMWqmGsbNDjISOWszvGOe896e6acFU+OXCCMvWSA1iyufEFlSEYvZ5TSY+aXt6JiI+DXq3Zwd1uaY/0YFCmWtvpl4m3ogHd6mpBq7F3R02kFgI62bUEGgZnkCXk2Ut6I7oFetXZ+TMTAlr+4vIMdPyF80LexcEzxAanTcQ0skuNwaYbPns+PCmu02ErDnYyxazzb5jkAk8qWx0wVstjR1ySfarl7cxwk8ELJQflG7WP4gCM3U3O47rUjq2sSypnVqJedG84NLxV0EyQYN/sdHLzg/HbV5bncB2GvqGHuz75coB+9sdjWycvbBwjITJWSlLo6fjxH9XD4mfPCh322Rx1i8yHKJU+OvTqAnkpKhZX0ETG9ZJD+fQI8SCDkXOxdMHHtx4Hn45dX1Vm9iAWOX1B6pAsur2DWhI/CxXuTZf0TDok3DOIQZAfi11PttEFrD4YGIOA4uuj2Yp6eKHN55tcV/u7O+DnwZXQPe3O5g2H7zDsrKi6FUbLdRLDN9/L+YuKpnZSLkw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(3023799007)(13003099007)(6133799003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8D/7SdXA3qHoLZ7wCevUZ02D9Tn/CBUAiT7QNfUzpC+QxHLmZt5505c5p2AxaAFS8vrf3fkbveHVSPPuQHJmqWUXij3Mqkpuo23AwNvOcvvmbD+75GX9H6YrIxWVBXQ2qofQRMXIPKQPceXtpHP/nU4aZFkySICWE6apfa131gDMcO1tGSMrWgw5S6z+eoAyEgXqEvl9+MIri1lZD6OWC1qP8FV9cH+JObg2NJln9LLC7+Nm5FBJRO2HvvGm7TVkxcsbrg6ps4ZgEq8NYHISEc9OS7QPwPehjAUe3+i5gvUzlj8m+YGlx3rMR0mEaTmrQDr69GiqQC9sUfsRN6P+fx2pQVeuU9MmLi//Dl36fJ3fafq1zlV0kZn+TjtZVKqBpk+p1aALC7f0MfUgjE+KRgFLyvbtA9yuJyyFbKHrbn70vLBxMbgRw6/VMTxWebuh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 07:32:15.1432
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb557332-c79b-414e-ba9c-08defdc3fdcd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4071

Enable the HSMP driver on the Family 1Ah client platforms, Models
80h-8Fh and E0h-E3h. These parts speak the Ryzen Master SMC (RMSMC)
message set instead of the server HSMP messages, but describe their
mailbox via ACPI _CRS/_DSD the same way a server socket does, so only
the ACPI driver needs to probe them.

Add the client message set to the UAPI header and its descriptor
table to the driver. struct hsmp_plat_desc picks the right table and
driver-issued message IDs once per boot based on the ACPI-reported PM
profile, which tells client and server apart without pinning the
driver to a fixed set of family/model ranges. Document the client
models in amd_hsmp.rst.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 Documentation/arch/x86/amd_hsmp.rst  |  10 +-
 arch/x86/include/uapi/asm/amd_hsmp.h | 135 ++++++++++++++
 drivers/platform/x86/amd/hsmp/hsmp.c | 255 ++++++++++++++++++++++++---
 drivers/platform/x86/amd/hsmp/hsmp.h |  25 +++
 4 files changed, 396 insertions(+), 29 deletions(-)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index fa1fc240e212..b95f09945193 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -8,6 +8,13 @@ Newer Fam19h(model 0x00-0x1f, 0x30-0x3f, 0x90-0x9f, 0xa0-0xaf),
 Fam1Ah(model 0x00-0x1f) EPYC server line of processors from AMD support
 system management functionality via HSMP (Host System Management Port).
 
+The Fam1Ah(model 0x80-0x8f, 0xe0-0xe3) client line of processors is
+supported as well. Those models share one mailbox and speak the Ryzen
+Master SMC message set instead of the server HSMP message set, so the
+message IDs accepted on them are the HSMP_CLIENT_* ones listed in
+arch/x86/include/uapi/asm/amd_hsmp.h. The character device and ioctl
+interface described below are the same.
+
 The Host System Management Port (HSMP) is an interface to provide
 OS-level software with access to system management functions via a
 set of mailbox registers.
@@ -17,7 +24,8 @@ More details on the interface can be found in chapter
 Eg: https://docs.amd.com/v/u/en-US/55898_B1_pub_0_50
 
 
-HSMP interface is supported on EPYC line of server CPUs and MI300A (APU).
+HSMP interface is supported on EPYC line of server CPUs, MI300A (APU) and
+the Fam1Ah client models listed above.
 
 
 HSMP device
diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
index eda336bfd3e9..00ca7855ca00 100644
--- a/arch/x86/include/uapi/asm/amd_hsmp.h
+++ b/arch/x86/include/uapi/asm/amd_hsmp.h
@@ -664,4 +664,139 @@ struct hsmp_telemetry_data {
 #define HSMP_IOCTL_GET_TELEMETRY_DATA \
 	_IOW(HSMP_BASE_IOCTL_NR, 1, struct hsmp_telemetry_data)
 
+/**
+ * enum hsmp_client_message_ids - Ryzen Master SMC (RMSMC) message IDs
+ * @HSMP_CLIENT_TEST: 01h. Test message. input: args[0] = xx. output:
+ *	args[0] = xx + 1.
+ * @HSMP_CLIENT_GET_SMU_VER: 02h. Get MP1 firmware version. output:
+ *	args[0] = MP1 firmware version.
+ * @HSMP_CLIENT_GET_INTERFACE_VER: 03h. Get interface version. output:
+ *	args[0] = interface version.
+ * @HSMP_CLIENT_GET_METRICS_TABLE_VER: 04h. Get metrics table version.
+ *	output: args[0] = metrics table version.
+ * @HSMP_CLIENT_GET_METRICS_TABLE: 05h. Get metrics table. No arguments.
+ *	Success means firmware has written the metrics table to the DRAM
+ *	address reported by @HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR.
+ * @HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR: 06h. Get metrics table DRAM
+ *	address. output: args[0] = address[31:0], args[1] = address[63:32],
+ *	args[2] = table size in bytes.
+ * @HSMP_CLIENT_SET_CORE_PSM_MARGIN: 07h. Set core voltage margin. input:
+ *	args[0] = ApicId[31:16] + margin in mV[15:0].
+ * @HSMP_CLIENT_SET_ALL_CORE_PSM_MARGIN: 08h. Set voltage margin for all
+ *	cores. input: args[0] = margin in mV[15:0].
+ * @HSMP_CLIENT_SET_FAST_PPT_LIMIT: 09h. Set APU fast PPT limit. input:
+ *	args[0] = limit in mW.
+ * @HSMP_CLIENT_SET_VRM_VDD_CURRENT_LIMIT: 0Ah. Set VDDCR_VDD TDC. input:
+ *	args[0] = limit in mA.
+ * @HSMP_CLIENT_SET_VRM_VDD_MAX_CURRENT_LIMIT: 0Bh. Set VDDCR_VDD EDC.
+ *	input: args[0] = limit in mA.
+ * @HSMP_CLIENT_SET_TJ_MAX: 0Ch. Set maximum junction temperature. input:
+ *	args[0] = temperature in degrees C.
+ * @HSMP_CLIENT_SET_FIT_LIMIT_SCALAR: 0Dh. Set failures-in-time limit
+ *	scalar. input: args[0] = scalar (0 to 100).
+ * @HSMP_CLIENT_ENABLE_OVERCLOCKING: 0Eh. Enable overclocking. No
+ *	arguments.
+ * @HSMP_CLIENT_DISABLE_OVERCLOCKING: 0Fh. Disable overclocking. No
+ *	arguments.
+ * @HSMP_CLIENT_SET_OVERCLOCK_FREQ_ALL_CORES: 10h. Set all-core overclock
+ *	frequency. input: args[0] = frequency in MHz[15:0].
+ * @HSMP_CLIENT_SET_OVERCLOCK_FREQ_PER_CORE: 11h. Set per-core overclock
+ *	frequency. input: args[0] = ApicId[31:16] + frequency in MHz[15:0].
+ * @HSMP_CLIENT_SET_OVERCLOCK_VID: 12h. Set overclock VID. input:
+ *	args[0] = voltage in mV[15:0].
+ * @HSMP_CLIENT_SET_FCLK_OVERCLOCK_ON_THE_FLY: 13h. Set FCLK overclock on
+ *	the fly. input: args[0] = FCLK in MHz[15:0].
+ * @HSMP_CLIENT_GET_CORE_PERF_ORDER: 14h. Get core performance order.
+ *	input: args[0] = ApicId[15:0]. output: args[0] = frequency in
+ *	MHz[15:0].
+ * @HSMP_CLIENT_SET_SUSTAINED_POWER_LIMIT: 15h. Set SOC sustained power
+ *	limit. input: args[0] = limit in mW.
+ * @HSMP_CLIENT_SET_SLOW_PPT_LIMIT: 16h. Set APU slow PPT limit. input:
+ *	args[0] = limit in mW.
+ * @HSMP_CLIENT_SET_VRM_GFX_MAX_CURRENT_LIMIT: 17h. Set VDDCR_GFX EDC.
+ *	input: args[0] = limit in mA.
+ * @HSMP_CLIENT_SET_VRM_SOC_CURRENT_LIMIT: 18h. Set VDDCR_SOC TDC. input:
+ *	args[0] = limit in mA.
+ * @HSMP_CLIENT_SET_FAST_SPM_LIMIT: 19h. Set fast SPM limit. input:
+ *	args[0] = limit in mW.
+ * @HSMP_CLIENT_SET_SLOW_SPM_LIMIT: 1Ah. Set slow SPM limit. input:
+ *	args[0] = limit in mW.
+ * @HSMP_CLIENT_GET_CORE_PSM_MARGIN: 1Bh. Get core voltage margin. input:
+ *	args[0] = ApicId[15:0]. output: args[0] = margin in mV[15:0].
+ * @HSMP_CLIENT_GET_GFX_PSM_MARGIN: 1Ch. Get graphics voltage margin.
+ *	output: args[0] = margin in mV[15:0].
+ * @HSMP_CLIENT_SPARE_0X1D: 1Dh. Reserved.
+ * @HSMP_CLIENT_SPARE_0X1E: 1Eh. Reserved.
+ * @HSMP_CLIENT_SPARE_0X1F: 1Fh. Reserved.
+ * @HSMP_CLIENT_SPARE_0X20: 20h. Reserved.
+ * @HSMP_CLIENT_SET_GFXCLK_OVERDRIVE_BY_FREQ_VID: 21h. Set GfxClk
+ *	overdrive by frequency/VID. input: args[0] = frequency in
+ *	MHz[31:16] + voltage in mV[15:0].
+ * @HSMP_CLIENT_DISABLE_GFXCLK_OVERDRIVE: 22h. Disable GfxClk overdrive.
+ *	No arguments.
+ * @HSMP_CLIENT_SET_GFX_PSM_MARGIN: 23h. Set graphics voltage margin.
+ *	input: args[0] = margin in mV[15:0].
+ * @HSMP_CLIENT_SET_CCLK_FMAX_OFFSET: 24h. Set CCLK Fmax offset. input:
+ *	args[0] = maximum frequency in MHz[15:0].
+ * @HSMP_CLIENT_SET_CORE_POWER_LIMIT_OFFSET: 25h. Set core power limit
+ *	offset. input: args[0] = limit in mW.
+ * @HSMP_CLIENT_ADD_EXTRA_PSM_GUARDBAND: 26h. Add extra core PSM
+ *	guardband. input: args[0] = voltage in mV[15:0].
+ * @HSMP_CLIENT_ADD_EXTRA_PSM_GUARDBAND_GFX: 27h. Add extra graphics PSM
+ *	guardband. input: args[0] = voltage in mV[15:0].
+ * @HSMP_CLIENT_SET_GFXCLK_FMAX: 28h. Set GfxClk Fmax. input: args[0] =
+ *	maximum frequency in MHz[15:0].
+ * @HSMP_CLIENT_MSG_ID_MAX: Number of message IDs, not a valid ID itself.
+ *
+ * Message IDs accepted on the Family 1Ah client platforms, Models 80h-8Fh
+ * and E0h-E3h. These parts drive one mailbox and speak the Ryzen Master
+ * SMC message set instead of the server HSMP message set enumerated in
+ * &enum hsmp_message_ids. Not all platforms support all messages; consult
+ * the supported list of messages in the HSMP chapter of the respective
+ * family/model PPR. Unsupported messages return -ENOMSG.
+ */
+enum hsmp_client_message_ids {
+	HSMP_CLIENT_TEST = 1,
+	HSMP_CLIENT_GET_SMU_VER,
+	HSMP_CLIENT_GET_INTERFACE_VER,
+	HSMP_CLIENT_GET_METRICS_TABLE_VER,
+	HSMP_CLIENT_GET_METRICS_TABLE,
+	HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR,
+	HSMP_CLIENT_SET_CORE_PSM_MARGIN,
+	HSMP_CLIENT_SET_ALL_CORE_PSM_MARGIN,
+	HSMP_CLIENT_SET_FAST_PPT_LIMIT,
+	HSMP_CLIENT_SET_VRM_VDD_CURRENT_LIMIT,
+	HSMP_CLIENT_SET_VRM_VDD_MAX_CURRENT_LIMIT,
+	HSMP_CLIENT_SET_TJ_MAX,
+	HSMP_CLIENT_SET_FIT_LIMIT_SCALAR,
+	HSMP_CLIENT_ENABLE_OVERCLOCKING,
+	HSMP_CLIENT_DISABLE_OVERCLOCKING,
+	HSMP_CLIENT_SET_OVERCLOCK_FREQ_ALL_CORES,
+	HSMP_CLIENT_SET_OVERCLOCK_FREQ_PER_CORE,
+	HSMP_CLIENT_SET_OVERCLOCK_VID,
+	HSMP_CLIENT_SET_FCLK_OVERCLOCK_ON_THE_FLY,
+	HSMP_CLIENT_GET_CORE_PERF_ORDER,
+	HSMP_CLIENT_SET_SUSTAINED_POWER_LIMIT,
+	HSMP_CLIENT_SET_SLOW_PPT_LIMIT,
+	HSMP_CLIENT_SET_VRM_GFX_MAX_CURRENT_LIMIT,
+	HSMP_CLIENT_SET_VRM_SOC_CURRENT_LIMIT,
+	HSMP_CLIENT_SET_FAST_SPM_LIMIT,
+	HSMP_CLIENT_SET_SLOW_SPM_LIMIT,
+	HSMP_CLIENT_GET_CORE_PSM_MARGIN,
+	HSMP_CLIENT_GET_GFX_PSM_MARGIN,
+	HSMP_CLIENT_SPARE_0X1D,
+	HSMP_CLIENT_SPARE_0X1E,
+	HSMP_CLIENT_SPARE_0X1F,
+	HSMP_CLIENT_SPARE_0X20,
+	HSMP_CLIENT_SET_GFXCLK_OVERDRIVE_BY_FREQ_VID,
+	HSMP_CLIENT_DISABLE_GFXCLK_OVERDRIVE,
+	HSMP_CLIENT_SET_GFX_PSM_MARGIN,
+	HSMP_CLIENT_SET_CCLK_FMAX_OFFSET,
+	HSMP_CLIENT_SET_CORE_POWER_LIMIT_OFFSET,
+	HSMP_CLIENT_ADD_EXTRA_PSM_GUARDBAND,
+	HSMP_CLIENT_ADD_EXTRA_PSM_GUARDBAND_GFX,
+	HSMP_CLIENT_SET_GFXCLK_FMAX,
+	HSMP_CLIENT_MSG_ID_MAX,
+};
+
 #endif /*_ASM_X86_AMD_HSMP_H_*/
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 5e123a4ecea9..e8fac2d299f3 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -10,6 +10,8 @@
 #include <asm/amd/hsmp.h>
 
 #include <linux/acpi.h>
+#include <linux/array_size.h>
+#include <linux/build_bug.h>
 #include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -45,8 +47,197 @@
  */
 #define CHECK_GET_BIT		BIT(31)
 
+/* Indexed by enum hsmp_client_message_ids; see there for per-message details */
+static const struct hsmp_msg_desc hsmp_client_msg_desc_table[] = {
+	/* RESERVED */
+	{0, 0, HSMP_RSVD},
+
+	/* HSMP_CLIENT_TEST */
+	{1, 1, HSMP_GET},
+
+	/* HSMP_CLIENT_GET_SMU_VER */
+	{0, 1, HSMP_GET},
+
+	/* HSMP_CLIENT_GET_INTERFACE_VER */
+	{0, 1, HSMP_GET},
+
+	/* HSMP_CLIENT_GET_METRICS_TABLE_VER */
+	{0, 1, HSMP_GET},
+
+	/* HSMP_CLIENT_GET_METRICS_TABLE */
+	{0, 0, HSMP_GET},
+
+	/* HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR */
+	{0, 3, HSMP_GET},
+
+	/* HSMP_CLIENT_SET_CORE_PSM_MARGIN */
+	{1, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_SET_ALL_CORE_PSM_MARGIN */
+	{1, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_SET_FAST_PPT_LIMIT */
+	{1, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_SET_VRM_VDD_CURRENT_LIMIT */
+	{1, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_SET_VRM_VDD_MAX_CURRENT_LIMIT */
+	{1, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_SET_TJ_MAX */
+	{1, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_SET_FIT_LIMIT_SCALAR */
+	{1, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_ENABLE_OVERCLOCKING */
+	{0, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_DISABLE_OVERCLOCKING */
+	{0, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_SET_OVERCLOCK_FREQ_ALL_CORES */
+	{1, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_SET_OVERCLOCK_FREQ_PER_CORE */
+	{1, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_SET_OVERCLOCK_VID */
+	{1, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_SET_FCLK_OVERCLOCK_ON_THE_FLY */
+	{1, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_GET_CORE_PERF_ORDER */
+	{1, 1, HSMP_GET},
+
+	/* HSMP_CLIENT_SET_SUSTAINED_POWER_LIMIT */
+	{1, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_SET_SLOW_PPT_LIMIT */
+	{1, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_SET_VRM_GFX_MAX_CURRENT_LIMIT */
+	{1, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_SET_VRM_SOC_CURRENT_LIMIT */
+	{1, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_SET_FAST_SPM_LIMIT */
+	{1, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_SET_SLOW_SPM_LIMIT */
+	{1, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_GET_CORE_PSM_MARGIN */
+	{1, 1, HSMP_GET},
+
+	/* HSMP_CLIENT_GET_GFX_PSM_MARGIN */
+	{0, 1, HSMP_GET},
+
+	/* HSMP_CLIENT_SPARE_0X1D */
+	{0, 0, HSMP_RSVD},
+
+	/* HSMP_CLIENT_SPARE_0X1E */
+	{0, 0, HSMP_RSVD},
+
+	/* HSMP_CLIENT_SPARE_0X1F */
+	{0, 0, HSMP_RSVD},
+
+	/* HSMP_CLIENT_SPARE_0X20 */
+	{0, 0, HSMP_RSVD},
+
+	/* HSMP_CLIENT_SET_GFXCLK_OVERDRIVE_BY_FREQ_VID */
+	{1, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_DISABLE_GFXCLK_OVERDRIVE */
+	{0, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_SET_GFX_PSM_MARGIN */
+	{1, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_SET_CCLK_FMAX_OFFSET */
+	{1, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_SET_CORE_POWER_LIMIT_OFFSET */
+	{1, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_ADD_EXTRA_PSM_GUARDBAND */
+	{1, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_ADD_EXTRA_PSM_GUARDBAND_GFX */
+	{1, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_SET_GFXCLK_FMAX */
+	{1, 0, HSMP_SET},
+};
+
+/* Catch a table left out of sync with its enum at build time */
+static_assert(ARRAY_SIZE(hsmp_msg_desc_table) == HSMP_MSG_ID_MAX);
+static_assert(ARRAY_SIZE(hsmp_client_msg_desc_table) == HSMP_CLIENT_MSG_ID_MAX);
+
+/* Per-platform message set: which table to use, and driver-issued msg IDs */
+struct hsmp_plat_desc {
+	const struct hsmp_msg_desc	*msg_desc;
+	u32				num_msgs;
+	u32				test_msg;
+	u32				proto_ver_msg;
+};
+
+static const struct hsmp_plat_desc hsmp_desc_server = {
+	.msg_desc		= hsmp_msg_desc_table,
+	.num_msgs		= HSMP_MSG_ID_MAX,
+	.test_msg		= HSMP_TEST,
+	.proto_ver_msg		= HSMP_GET_PROTO_VER,
+};
+
+/* The client drives a different mailbox with the Ryzen Master SMC message set */
+static const struct hsmp_plat_desc hsmp_desc_client = {
+	.msg_desc		= hsmp_client_msg_desc_table,
+	.num_msgs		= HSMP_CLIENT_MSG_ID_MAX,
+	.test_msg		= HSMP_CLIENT_TEST,
+	.proto_ver_msg		= HSMP_CLIENT_GET_INTERFACE_VER,
+};
+
 static struct hsmp_plat_device hsmp_pdev;
 
+/*
+ * Resolved on first use and cached, since is_client_platform() always
+ * settles on the same descriptor once booted. Concurrent first callers are
+ * benign: every one of them computes and stores that same pointer, so
+ * READ_ONCE()/WRITE_ONCE() only need to keep the access from being torn or
+ * reordered by the compiler, not order it against anything else.
+ */
+static const struct hsmp_plat_desc *hsmp_desc_cache;
+
+static inline const struct hsmp_plat_desc *hsmp_desc(void)
+{
+	const struct hsmp_plat_desc *desc = READ_ONCE(hsmp_desc_cache);
+
+	if (likely(desc))
+		return desc;
+
+	desc = is_client_platform() ? &hsmp_desc_client : &hsmp_desc_server;
+	WRITE_ONCE(hsmp_desc_cache, desc);
+
+	return desc;
+}
+
+/* Returns NULL if msg_id is out of range or reserved for this platform */
+static inline const struct hsmp_msg_desc *get_msg_desc(u32 msg_id)
+{
+	const struct hsmp_plat_desc *desc = hsmp_desc();
+
+	if (msg_id >= desc->num_msgs)
+		return NULL;
+
+	if (desc->msg_desc[msg_id].type == HSMP_RSVD)
+		return NULL;
+
+	return &desc->msg_desc[msg_id];
+}
+
 /*
  * Gates the AMD HSMP data plane against socket bring-up and teardown.
  *
@@ -184,30 +375,29 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
 
 static int validate_message(struct hsmp_message *msg)
 {
-	/* msg_id against valid range of message IDs */
-	if (msg->msg_id < HSMP_TEST || msg->msg_id >= HSMP_MSG_ID_MAX)
-		return -ENOMSG;
+	const struct hsmp_msg_desc *desc;
 
-	/* msg_id is a reserved message ID */
-	if (hsmp_msg_desc_table[msg->msg_id].type == HSMP_RSVD)
+	/* Unknown or reserved message ID for this platform */
+	desc = get_msg_desc(msg->msg_id);
+	if (!desc)
 		return -ENOMSG;
 
 	/*
 	 * num_args passed by user should match the num_args specified in
 	 * message description table.
 	 */
-	if (msg->num_args != hsmp_msg_desc_table[msg->msg_id].num_args)
+	if (msg->num_args != desc->num_args)
 		return -EINVAL;
 
 	/*
 	 * As the HSMP protocol evolves, newer platforms may define more
 	 * response arguments for existing messages.  Use an upper-bound
 	 * check so that older userspace callers requesting fewer response
-	 * words than what the current hsmp_msg_desc_table[] defines are
-	 * still accepted, while rejecting requests that exceed the
-	 * hardware capability.
+	 * words than what the current descriptor table defines are still
+	 * accepted, while rejecting requests that exceed the hardware
+	 * capability.
 	 */
-	if (msg->response_sz > hsmp_msg_desc_table[msg->msg_id].response_sz)
+	if (msg->response_sz > desc->response_sz)
 		return -EINVAL;
 
 	return 0;
@@ -316,7 +506,7 @@ int hsmp_test(u16 sock_ind, u32 value)
 	 * Test the hsmp port by performing TEST command. The test message
 	 * takes one argument and returns the value of that argument + 1.
 	 */
-	msg.msg_id	= HSMP_TEST;
+	msg.msg_id	= hsmp_desc()->test_msg;
 	msg.num_args	= 1;
 	msg.response_sz	= 1;
 	msg.args[0]	= value;
@@ -338,12 +528,12 @@ int hsmp_test(u16 sock_ind, u32 value)
 }
 EXPORT_SYMBOL_NS_GPL(hsmp_test, "AMD_HSMP");
 
-static bool is_get_msg(struct hsmp_message *msg)
+static bool is_get_msg(const struct hsmp_msg_desc *desc, struct hsmp_message *msg)
 {
-	if (hsmp_msg_desc_table[msg->msg_id].type == HSMP_GET)
+	if (desc->type == HSMP_GET)
 		return true;
 
-	if (hsmp_msg_desc_table[msg->msg_id].type == HSMP_SET_GET &&
+	if (desc->type == HSMP_SET_GET &&
 	    (msg->args[0] & CHECK_GET_BIT))
 		return true;
 
@@ -354,6 +544,8 @@ static long hsmp_ioctl_msg(struct file *fp, unsigned long arg)
 {
 	int __user *arguser = (int  __user *)arg;
 	struct hsmp_message msg = { 0 };
+	const struct hsmp_plat_desc *plat_desc = hsmp_desc();
+	const struct hsmp_msg_desc *desc;
 	int ret;
 
 	if (copy_struct_from_user(&msg, sizeof(msg), arguser, sizeof(struct hsmp_message)))
@@ -361,23 +553,25 @@ static long hsmp_ioctl_msg(struct file *fp, unsigned long arg)
 
 	/*
 	 * Check msg_id is within the range of supported msg ids
-	 * i.e within the array bounds of hsmp_msg_desc_table
+	 * i.e within the array bounds of the platform's descriptor table
 	 */
-	if (msg.msg_id < HSMP_TEST || msg.msg_id >= HSMP_MSG_ID_MAX)
+	if (msg.msg_id < plat_desc->test_msg || msg.msg_id >= plat_desc->num_msgs)
 		return -ENOMSG;
 
 	/*
 	 * Sanitize the user-controlled msg_id against speculative
 	 * execution.  The bounds check above retires the out-of-range
 	 * case with -ENOMSG, but a mispredicted branch can still let the
-	 * CPU speculatively use msg_id as an index into
-	 * hsmp_msg_desc_table[] (here and in validate_message() /
-	 * is_get_msg() called downstream via hsmp_send_message()), and
-	 * pull arbitrary kernel memory into the cache (Spectre v1,
-	 * CVE-2017-5753).  Clamp once into msg.msg_id so every downstream
-	 * dereference sees the sanitized value.
+	 * CPU speculatively use msg_id as an index into the message
+	 * descriptor table, here and again in validate_message() called
+	 * downstream via hsmp_send_message().
 	 */
-	msg.msg_id = array_index_nospec(msg.msg_id, HSMP_MSG_ID_MAX);
+	msg.msg_id = array_index_nospec(msg.msg_id, plat_desc->num_msgs);
+
+	/* Rejects the reserved IDs the table describes as such */
+	desc = get_msg_desc(msg.msg_id);
+	if (!desc)
+		return -ENOMSG;
 
 	switch (fp->f_mode & (FMODE_WRITE | FMODE_READ)) {
 	case FMODE_WRITE:
@@ -385,7 +579,7 @@ static long hsmp_ioctl_msg(struct file *fp, unsigned long arg)
 		 * Device is opened in O_WRONLY mode
 		 * Execute only set/configure commands
 		 */
-		if (is_get_msg(&msg))
+		if (is_get_msg(desc, &msg))
 			return -EPERM;
 		break;
 	case FMODE_READ:
@@ -393,7 +587,7 @@ static long hsmp_ioctl_msg(struct file *fp, unsigned long arg)
 		 * Device is opened in O_RDONLY mode
 		 * Execute only get/monitor commands
 		 */
-		if (!is_get_msg(&msg))
+		if (!is_get_msg(desc, &msg))
 			return -EPERM;
 		break;
 	case FMODE_READ | FMODE_WRITE:
@@ -410,7 +604,7 @@ static long hsmp_ioctl_msg(struct file *fp, unsigned long arg)
 	if (ret)
 		return ret;
 
-	if (hsmp_msg_desc_table[msg.msg_id].response_sz > 0) {
+	if (desc->response_sz > 0) {
 		/* Copy results back to user for get/monitor commands */
 		if (copy_to_user(arguser, &msg, sizeof(struct hsmp_message)))
 			return -EFAULT;
@@ -685,11 +879,16 @@ EXPORT_SYMBOL_NS_GPL(hsmp_get_tbl_dram_base, "AMD_HSMP");
 int hsmp_cache_proto_ver(u16 sock_ind)
 {
 	struct hsmp_message msg = { 0 };
+	const struct hsmp_msg_desc *desc;
 	int ret;
 
-	msg.msg_id	= HSMP_GET_PROTO_VER;
+	msg.msg_id	= hsmp_desc()->proto_ver_msg;
+	desc = get_msg_desc(msg.msg_id);
+	if (WARN_ON(!desc))
+		return -ENOMSG;
+
 	msg.sock_ind	= sock_ind;
-	msg.response_sz = hsmp_msg_desc_table[HSMP_GET_PROTO_VER].response_sz;
+	msg.response_sz	= desc->response_sz;
 
 	ret = hsmp_send_message_locked(&msg);
 	if (!ret)
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index 8dbff16a87b1..77a96d1bdc24 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -10,6 +10,9 @@
 #ifndef HSMP_H
 #define HSMP_H
 
+#include <asm/amd/hsmp.h>
+
+#include <linux/acpi.h>
 #include <linux/compiler_types.h>
 #include <linux/device.h>
 #include <linux/hwmon.h>
@@ -17,6 +20,7 @@
 #include <linux/miscdevice.h>
 #include <linux/mutex.h>
 #include <linux/pci.h>
+#include <linux/processor.h>
 #include <linux/rwsem.h>
 #include <linux/semaphore.h>
 #include <linux/sysfs.h>
@@ -32,6 +36,27 @@
 
 #define DRIVER_VERSION		"2.6"
 
+/*
+ * Family/model ranges need a driver update every generation and miss new
+ * client parts until then. The ACPI-reported PM profile does not: it says
+ * what kind of system this is regardless of which CPU is in it.
+ */
+static inline bool is_client_platform(void)
+{
+	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
+		return false;
+
+	switch (acpi_gbl_FADT.preferred_profile) {
+	case PM_DESKTOP:
+	case PM_MOBILE:
+	case PM_WORKSTATION:
+	case PM_TABLET:
+		return true;
+	default:
+		return false;
+	}
+}
+
 struct hsmp_mbaddr_info {
 	u32 base_addr;
 	u32 msg_id_off;
-- 
2.34.1


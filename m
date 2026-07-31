Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012070.outbound.protection.outlook.com [40.107.200.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F5C2E0B5C;
	Fri, 31 Jul 2026 16:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785514558; cv=fail; b=rd/5BmSDWUAJr9BvA9JMDibqf6YkMbvIqVKR4ZaWxWUFTfo29TYNAhVcKtlScPMI3U+AEWMM+MeLqafB50aZMKwDqxOj2cs4bACdcccxcUiw9dfJtn8X4WnDPHl3K9gVNIY7xphoDS7f5d4VKfaWsQXkXTqRA4AxZHikCdSdeeY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785514558; c=relaxed/simple;
	bh=cZH6oqtQShirhky8naVbd1Pfa94ReYCxgerLAHykuPY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D8Y4TdivJOodvhU92b9PZyJbzb0XWHycb7xCBp/3eTWomgZJr7Id4TR/3IckKmJ3oa5uBhp5HkAaaFwF7Y7VxWIMWrPrbnk8FbU47bo7ZKTR/WO4d7cZmUmLAJrMdp2xXrtOL8p2/RE12C/zqPVuWqOUtqgSVFcdjWFVx7gs76E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=D2I0ocdb; arc=fail smtp.client-ip=40.107.200.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="D2I0ocdb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PCC7aSFwRyUG4tovLXE9mVlSf2WCd5KAd41HfLsRLPSAa+MIQI8iY+hizY9gerDmKLhN6ihrzpJ8BfEtxfw2p+mBX5IUDdeLXx4CWhpu9sAsKCOJEEHtOzLGxMhNVb/cbe5roEWyGVZEsBst0PeIs4mHVKs+xgwuUrXDorpjIGuDFlK4KErY7dAGir8erM8I4wqcFw24cnEdxpkU0Yafdr2iYJpvjIguTfrpZ6DOT/n/0NQzHFE7zZRDpbzansHvCumVtAh7DOYMDb8cvxBjAWyWyaBoPJtsGnF/bs/ZHA6bShOiq1j4Leidk9PR5AIRNkfxapeAz/3mkw/kL3v7bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A6wD69vl41kPZMTvXarSKQlWDRj2THK4LvFFS+iGiNs=;
 b=qD9pFwOUVTKM+zJQWdBurNEOmB855sBSFkr+iVMLeP4FQJL/RXkzvzn2VA280RBADTv1EqBlrjog1n5Gu9jXjcV+UY3hWt7Z7bRLt3o0xUpm4bKZyTxF9oLjH3/f4O3byFe/tvQ4kKBEm0mejfDDFSUW5aLzBwy4kY8jQFub8aYFz0eJtKJjq4wWjV7bVwMc+faXhNEeY8z8XHJiOO6GHv00rft/EjLq22TF9MY6IUwIDVR8+mBqnCg2lMacGNIM5HM94MlJHT7C3zFpJYUFg4jR0ruRXeGK7aJXsSLksD1dKIx3CmXmUN0EtFbLsiNGgQbONma6j41gTfLUHpf1+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6wD69vl41kPZMTvXarSKQlWDRj2THK4LvFFS+iGiNs=;
 b=D2I0ocdb59eGfMA3GICH0FpwzmFRP8gj/2qE8c4VkNMcNFh2Sqg6TBV5G6cVOSnQwk5TAnVIw5t8wSAyjLY1PU8kN52QylvWsYOVLfSOTFp8/7p2PEwncSLApMVPS/Aj4vdHs13ee/qsBjYL8WTfg8uSfMPasD3dr1ihwHVIFWc=
Received: from CH0PR03CA0205.namprd03.prod.outlook.com (2603:10b6:610:e4::30)
 by BL1PR12MB5899.namprd12.prod.outlook.com (2603:10b6:208:397::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Fri, 31 Jul
 2026 16:15:42 +0000
Received: from CH1PEPF0000A346.namprd04.prod.outlook.com
 (2603:10b6:610:e4:cafe::6) by CH0PR03CA0205.outlook.office365.com
 (2603:10b6:610:e4::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.16 via Frontend Transport; Fri,
 31 Jul 2026 16:15:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000A346.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Fri, 31 Jul 2026 16:15:41 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 31 Jul
 2026 11:15:38 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>, <Mario.Limonciello@amd.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<muthusamy.ramalingam@amd.com>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v2 1/4] platform/x86/amd/hsmp: Add HSMP client support for Family 1Ah
Date: Fri, 31 Jul 2026 21:45:13 +0530
Message-ID: <20260731161516.2242993-2-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A346:EE_|BL1PR12MB5899:EE_
X-MS-Office365-Filtering-Correlation-Id: 27ec2d63-5f45-4952-1223-08deef1ef78b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|6133799003|10067099003|11063799006|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	K9hCPXFjJk42+w5rp7Nx6+U5KyGepJOVYW9iVaoHlgb/H3BNxQGalZcbMCYoOmvnEcWNKhGhDxzpqeet4u5UDT3QOFhgMWMoG8MxWKDurPoi66R63arX35UjdVTH+b1bkjqnsx/ospz/4yuKQd9R8E2Gwdj4Eo1VCOanavZpqrT5ZIW080tveDdOFO/sM1ZDEeEvbJpz5Cz8s+ILmLCMIV7wxLSafbJTl3uqcz3jg5tDKa698hbe4M6mkPSkcCuqugfqWmD0Jt6ts7JcFFckixfGBv/4BCAUBae5h9+0CqsC9wKuWvqNIuyZxJTd1JSVc4rgIOyY9c9/4AEREZ1an6+gHW1CpEcfr5dXYL1K4x2eCqAcWy6BAGLX9Vn1TZrTEKdghkGBnd1wwhtVxhz27oDlix8gl54fzv2raTYUKDvA0i6HBggiz0yqktX/I4CEIiMMPIGcagrK/xG90FS0b48NN1rEPB9BPTd7vU4CvWSV7gLEQvhHg0Z2bR476ny39tZ6TQQk8x5BFf7A9qH5C/Ei0bKO4pcwfn0b5qExdDV+hEukUO4uUvNeA/xRc7fTCy+GuUy+3mXuYAQV8r3TtllH/7dLmASDbMOUZ2j+vZAajjl5TayTzcX507uxiIQxpbaNkH28Fv6Gep1cAhqpKAIqAD5K99fa+VzOhEiqbFqme32zAFQ2tYyBWYOUDd0dNM2OXgracrqK0AmSlG+Gkw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(6133799003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HNiwGUijE52fHLVz8XlBaoo6eUFZx+xMDRuaPvwy52Xfw0zFsCY34wBb+JMpvMFLwBa7jIlaLDk4unQymMi/1ypdI1Cs3Sj31IQCVZzrQhgXtm9pmTKWTSfoW7ph+3LgzibiyH9KemEeZV87M6V+qWdq79eMBgdQvBH7GSkHml2f9TG3v0jJRNRe55lQrlB5M7/myqcGk7TPyuQlYhPAZzPEEJVZNZnnOEeUGiRyieE1X3s41CNBSQ0rQq2w4aew85GoKhr4voktVBUzQ7OhnY/Nj+eXVFr1kuB/l26oGsYDu5S+8PTn9lRwCtEbu15AMd/oROakS5NWbZWchUXRe7bxByvUx6RWZZLmESLscaKu4pRESHnvHu6SFYnf3cbwwmyVdU0naIv3QF4j9dCleEeKfTQhh7XXkeq2WMRyunyAKUJI4lwKNE3KSZ1PT2Nk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 16:15:41.3767
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27ec2d63-5f45-4952-1223-08deef1ef78b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A346.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5899

Enable the HSMP driver on the Family 1Ah client platforms, Models
80h-8Fh and E0h-E3h.

These parts speak the Ryzen Master SMC (RMSMC) message set rather than
the server message IDs, and they reach their mailbox over SMN rather
than through the MMIO window the server ACPI path uses: their ACPI
device carries no _CRS describing a window and no _DSD naming the
registers, so the client addresses are fixed in hsmp.h instead of being
discovered. Only the ACPI driver probes these models; the platform
driver keeps to the server parts it already supported. Add the client
message set and its descriptor table to the UAPI header.

With two descriptor tables, every lookup has to pick the one matching
the running platform. Describe the platform once rather than test it at
each lookup: struct hsmp_plat_desc holds the mailbox addresses, the
descriptor table and its size, and the IDs of the messages the driver
issues itself. hsmp_common_init() resolves it once, before the drivers
that depend on this module can probe, and the message plumbing reads
the bound and the message IDs from there. The server descriptor is also
the static initialiser, so that plumbing cannot reach a NULL
descriptor. static_assert() ties each table's length to its message-ID
enum so the two cannot drift apart.

Documentation/arch/x86/amd_hsmp.rst gains the client models. The
character device and ioctl interface are unchanged there; only the
accepted message IDs differ.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 Documentation/arch/x86/amd_hsmp.rst  |  10 +-
 arch/x86/include/uapi/asm/amd_hsmp.h | 289 +++++++++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/hsmp.c | 153 +++++++++++---
 drivers/platform/x86/amd/hsmp/hsmp.h |  71 +++++++
 drivers/platform/x86/amd/hsmp/plat.c |  19 +-
 5 files changed, 496 insertions(+), 46 deletions(-)

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
index eda336bfd3e9..44c2b33434b0 100644
--- a/arch/x86/include/uapi/asm/amd_hsmp.h
+++ b/arch/x86/include/uapi/asm/amd_hsmp.h
@@ -664,4 +664,293 @@ struct hsmp_telemetry_data {
 #define HSMP_IOCTL_GET_TELEMETRY_DATA \
 	_IOW(HSMP_BASE_IOCTL_NR, 1, struct hsmp_telemetry_data)
 
+/*
+ * Client HSMP messages supported on the Family 1Ah client platforms,
+ * Models 80h-8Fh and E0h-E3h.
+ * These map to Ryzen Master SMC (RMSMC) message IDs.
+ */
+enum hsmp_client_message_ids {
+	HSMP_CLIENT_TEST = 1,			/* 01h Test message */
+	HSMP_CLIENT_GET_SMU_VER,		/* 02h Get MP1 firmware version */
+	HSMP_CLIENT_GET_INTERFACE_VER,		/* 03h Get interface version */
+	HSMP_CLIENT_GET_METRICS_TABLE_VER,	/* 04h Get metrics table version */
+	HSMP_CLIENT_GET_METRICS_TABLE,		/* 05h Get metrics table */
+	HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR,/* 06h Get metrics table dram address */
+	HSMP_CLIENT_SET_CORE_PSM_MARGIN,	/* 07h Set core voltage margin */
+	HSMP_CLIENT_SET_ALL_CORE_PSM_MARGIN,	/* 08h Set voltage margin for all cores */
+	HSMP_CLIENT_SET_FAST_PPT_LIMIT,		/* 09h Set APU fast PPT limit */
+	HSMP_CLIENT_SET_VRM_VDD_CURRENT_LIMIT,	/* 0Ah Set VDDCR_VDD TDC */
+	HSMP_CLIENT_SET_VRM_VDD_MAX_CURRENT_LIMIT,/* 0Bh Set VDDCR_VDD EDC */
+	HSMP_CLIENT_SET_TJ_MAX,			/* 0Ch Set maximum junction temperature */
+	HSMP_CLIENT_SET_FIT_LIMIT_SCALAR,	/* 0Dh Set failures in time limit scalar */
+	HSMP_CLIENT_ENABLE_OVERCLOCKING,	/* 0Eh Enable overclocking */
+	HSMP_CLIENT_DISABLE_OVERCLOCKING,	/* 0Fh Disable overclocking */
+	HSMP_CLIENT_SET_OVERCLOCK_FREQ_ALL_CORES,/* 10h Set all core overclock frequency */
+	HSMP_CLIENT_SET_OVERCLOCK_FREQ_PER_CORE,/* 11h Set per core overclock frequency */
+	HSMP_CLIENT_SET_OVERCLOCK_VID,		/* 12h Set overclock VID */
+	HSMP_CLIENT_SET_FCLK_OVERCLOCK_ON_THE_FLY,/* 13h Set FCLK overclock on the fly */
+	HSMP_CLIENT_GET_CORE_PERF_ORDER,	/* 14h Get core performance order */
+	HSMP_CLIENT_SET_SUSTAINED_POWER_LIMIT,	/* 15h Set SOC sustained power limit */
+	HSMP_CLIENT_SET_SLOW_PPT_LIMIT,		/* 16h Set APU slow PPT limit */
+	HSMP_CLIENT_SET_VRM_GFX_MAX_CURRENT_LIMIT,/* 17h Set VDDCR_GFX EDC */
+	HSMP_CLIENT_SET_VRM_SOC_CURRENT_LIMIT,	/* 18h Set VDDCR_SOC TDC */
+	HSMP_CLIENT_SET_FAST_SPM_LIMIT,		/* 19h Set fast SPM limit */
+	HSMP_CLIENT_SET_SLOW_SPM_LIMIT,		/* 1Ah Set slow SPM limit */
+	HSMP_CLIENT_GET_CORE_PSM_MARGIN,	/* 1Bh Get core voltage margin */
+	HSMP_CLIENT_GET_GFX_PSM_MARGIN,		/* 1Ch Get graphics voltage margin */
+	HSMP_CLIENT_SPARE_0X1D,			/* 1Dh Reserved */
+	HSMP_CLIENT_SPARE_0X1E,			/* 1Eh Reserved */
+	HSMP_CLIENT_SPARE_0X1F,			/* 1Fh Reserved */
+	HSMP_CLIENT_SPARE_0X20,			/* 20h Reserved */
+	HSMP_CLIENT_SET_GFXCLK_OVERDRIVE_BY_FREQ_VID,/* 21h Set GfxClk overdrive by freq/VID */
+	HSMP_CLIENT_DISABLE_GFXCLK_OVERDRIVE,	/* 22h Disable GfxClk overdrive */
+	HSMP_CLIENT_SET_GFX_PSM_MARGIN,		/* 23h Set graphics voltage margin */
+	HSMP_CLIENT_SET_CCLK_FMAX_OFFSET,	/* 24h Set CCLK Fmax offset */
+	HSMP_CLIENT_SET_CORE_POWER_LIMIT_OFFSET,/* 25h Set core power limit offset */
+	HSMP_CLIENT_ADD_EXTRA_PSM_GUARDBAND,	/* 26h Add extra core PSM guardband */
+	HSMP_CLIENT_ADD_EXTRA_PSM_GUARDBAND_GFX,/* 27h Add extra graphics PSM guardband */
+	HSMP_CLIENT_SET_GFXCLK_FMAX,		/* 28h Set GfxClk Fmax */
+	HSMP_CLIENT_MSG_ID_MAX,
+};
+
+/*
+ * Client message descriptor table (Family 1Ah Models 80h-8Fh, E0h-E3h).
+ *
+ * User may use these comments as reference, please find the supported list
+ * of messages and message definition in the HSMP chapter of respective
+ * family/model PPR.
+ *
+ * Not supported messages would return -ENOMSG.
+ */
+static const struct hsmp_msg_desc hsmp_client_msg_desc_table[]
+				__attribute__((unused)) = {
+	/* RESERVED */
+	{0, 0, HSMP_RSVD},
+
+	/*
+	 * HSMP_CLIENT_TEST, num_args = 1, response_sz = 1
+	 * input:  args[0] = xx
+	 * output: args[0] = xx + 1
+	 */
+	{1, 1, HSMP_GET},
+
+	/*
+	 * HSMP_CLIENT_GET_SMU_VER, num_args = 0, response_sz = 1
+	 * output: args[0] = MP1 fw ver
+	 */
+	{0, 1, HSMP_GET},
+
+	/*
+	 * HSMP_CLIENT_GET_INTERFACE_VER, num_args = 0, response_sz = 1
+	 * output: args[0] = interface version
+	 */
+	{0, 1, HSMP_GET},
+
+	/*
+	 * HSMP_CLIENT_GET_METRICS_TABLE_VER, num_args = 0, response_sz = 1
+	 * output: args[0] = metrics table version
+	 */
+	{0, 1, HSMP_GET},
+
+	/*
+	 * HSMP_CLIENT_GET_METRICS_TABLE, num_args = 0, response_sz = 0
+	 * Success means firmware has written the metrics table to the DRAM
+	 * address reported by HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR.
+	 */
+	{0, 0, HSMP_GET},
+
+	/*
+	 * HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR, num_args = 0, response_sz = 3
+	 * output: args[0] = metrics table dram address[31:0]
+	 *         args[1] = metrics table dram address[63:32]
+	 *         args[2] = metrics table size in bytes
+	 */
+	{0, 3, HSMP_GET},
+
+	/*
+	 * HSMP_CLIENT_SET_CORE_PSM_MARGIN, num_args = 1, response_sz = 0
+	 * input: args[0] = ApicId[31:16] + voltage margin in mV[15:0]
+	 */
+	{1, 0, HSMP_SET},
+
+	/*
+	 * HSMP_CLIENT_SET_ALL_CORE_PSM_MARGIN, num_args = 1, response_sz = 0
+	 * input: args[0] = voltage margin in mV[15:0]
+	 */
+	{1, 0, HSMP_SET},
+
+	/*
+	 * HSMP_CLIENT_SET_FAST_PPT_LIMIT, num_args = 1, response_sz = 0
+	 * input: args[0] = fast PPT limit in mW
+	 */
+	{1, 0, HSMP_SET},
+
+	/*
+	 * HSMP_CLIENT_SET_VRM_VDD_CURRENT_LIMIT, num_args = 1, response_sz = 0
+	 * input: args[0] = VDDCR_VDD TDC in mA
+	 */
+	{1, 0, HSMP_SET},
+
+	/*
+	 * HSMP_CLIENT_SET_VRM_VDD_MAX_CURRENT_LIMIT, num_args = 1, response_sz = 0
+	 * input: args[0] = VDDCR_VDD EDC in mA
+	 */
+	{1, 0, HSMP_SET},
+
+	/*
+	 * HSMP_CLIENT_SET_TJ_MAX, num_args = 1, response_sz = 0
+	 * input: args[0] = maximum junction temperature in degrees C
+	 */
+	{1, 0, HSMP_SET},
+
+	/*
+	 * HSMP_CLIENT_SET_FIT_LIMIT_SCALAR, num_args = 1, response_sz = 0
+	 * input: args[0] = failures in time limit scalar (0 to 100)
+	 */
+	{1, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_ENABLE_OVERCLOCKING, num_args = 0, response_sz = 0 */
+	{0, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_DISABLE_OVERCLOCKING, num_args = 0, response_sz = 0 */
+	{0, 0, HSMP_SET},
+
+	/*
+	 * HSMP_CLIENT_SET_OVERCLOCK_FREQ_ALL_CORES, num_args = 1, response_sz = 0
+	 * input: args[0] = frequency in MHz[15:0]
+	 */
+	{1, 0, HSMP_SET},
+
+	/*
+	 * HSMP_CLIENT_SET_OVERCLOCK_FREQ_PER_CORE, num_args = 1, response_sz = 0
+	 * input: args[0] = ApicId[31:16] + frequency in MHz[15:0]
+	 */
+	{1, 0, HSMP_SET},
+
+	/*
+	 * HSMP_CLIENT_SET_OVERCLOCK_VID, num_args = 1, response_sz = 0
+	 * input: args[0] = voltage in mV[15:0]
+	 */
+	{1, 0, HSMP_SET},
+
+	/*
+	 * HSMP_CLIENT_SET_FCLK_OVERCLOCK_ON_THE_FLY, num_args = 1, response_sz = 0
+	 * input: args[0] = FCLK in MHz[15:0]
+	 */
+	{1, 0, HSMP_SET},
+
+	/*
+	 * HSMP_CLIENT_GET_CORE_PERF_ORDER, num_args = 1, response_sz = 1
+	 * input:  args[0] = ApicId[15:0]
+	 * output: args[0] = frequency in MHz[15:0]
+	 */
+	{1, 1, HSMP_GET},
+
+	/*
+	 * HSMP_CLIENT_SET_SUSTAINED_POWER_LIMIT, num_args = 1, response_sz = 0
+	 * input: args[0] = sustained power limit in mW
+	 */
+	{1, 0, HSMP_SET},
+
+	/*
+	 * HSMP_CLIENT_SET_SLOW_PPT_LIMIT, num_args = 1, response_sz = 0
+	 * input: args[0] = slow PPT limit in mW
+	 */
+	{1, 0, HSMP_SET},
+
+	/*
+	 * HSMP_CLIENT_SET_VRM_GFX_MAX_CURRENT_LIMIT, num_args = 1, response_sz = 0
+	 * input: args[0] = VDDCR_GFX EDC in mA
+	 */
+	{1, 0, HSMP_SET},
+
+	/*
+	 * HSMP_CLIENT_SET_VRM_SOC_CURRENT_LIMIT, num_args = 1, response_sz = 0
+	 * input: args[0] = VDDCR_SOC TDC in mA
+	 */
+	{1, 0, HSMP_SET},
+
+	/*
+	 * HSMP_CLIENT_SET_FAST_SPM_LIMIT, num_args = 1, response_sz = 0
+	 * input: args[0] = fast SPM limit in mW
+	 */
+	{1, 0, HSMP_SET},
+
+	/*
+	 * HSMP_CLIENT_SET_SLOW_SPM_LIMIT, num_args = 1, response_sz = 0
+	 * input: args[0] = slow SPM limit in mW
+	 */
+	{1, 0, HSMP_SET},
+
+	/*
+	 * HSMP_CLIENT_GET_CORE_PSM_MARGIN, num_args = 1, response_sz = 1
+	 * input:  args[0] = ApicId[15:0]
+	 * output: args[0] = voltage margin in mV[15:0]
+	 */
+	{1, 1, HSMP_GET},
+
+	/*
+	 * HSMP_CLIENT_GET_GFX_PSM_MARGIN, num_args = 0, response_sz = 1
+	 * output: args[0] = voltage margin in mV[15:0]
+	 */
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
+	/*
+	 * HSMP_CLIENT_SET_GFXCLK_OVERDRIVE_BY_FREQ_VID, num_args = 1, response_sz = 0
+	 * input: args[0] = frequency in MHz[31:16] + voltage in mV[15:0]
+	 */
+	{1, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_DISABLE_GFXCLK_OVERDRIVE, num_args = 0, response_sz = 0 */
+	{0, 0, HSMP_SET},
+
+	/*
+	 * HSMP_CLIENT_SET_GFX_PSM_MARGIN, num_args = 1, response_sz = 0
+	 * input: args[0] = voltage margin in mV[15:0]
+	 */
+	{1, 0, HSMP_SET},
+
+	/*
+	 * HSMP_CLIENT_SET_CCLK_FMAX_OFFSET, num_args = 1, response_sz = 0
+	 * input: args[0] = maximum frequency in MHz[15:0]
+	 */
+	{1, 0, HSMP_SET},
+
+	/*
+	 * HSMP_CLIENT_SET_CORE_POWER_LIMIT_OFFSET, num_args = 1, response_sz = 0
+	 * input: args[0] = core power limit in mW
+	 */
+	{1, 0, HSMP_SET},
+
+	/*
+	 * HSMP_CLIENT_ADD_EXTRA_PSM_GUARDBAND, num_args = 1, response_sz = 0
+	 * input: args[0] = voltage in mV[15:0]
+	 */
+	{1, 0, HSMP_SET},
+
+	/*
+	 * HSMP_CLIENT_ADD_EXTRA_PSM_GUARDBAND_GFX, num_args = 1, response_sz = 0
+	 * input: args[0] = voltage in mV[15:0]
+	 */
+	{1, 0, HSMP_SET},
+
+	/*
+	 * HSMP_CLIENT_SET_GFXCLK_FMAX, num_args = 1, response_sz = 0
+	 * input: args[0] = maximum frequency in MHz[15:0]
+	 */
+	{1, 0, HSMP_SET},
+};
+
 #endif /*_ASM_X86_AMD_HSMP_H_*/
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 5e123a4ecea9..5cb2c4399043 100644
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
@@ -45,7 +47,76 @@
  */
 #define CHECK_GET_BIT		BIT(31)
 
-static struct hsmp_plat_device hsmp_pdev;
+static const struct hsmp_mbaddr_info hsmp_mbinfo_server = {
+	.base_addr	= SMN_HSMP_BASE,
+	.msg_id_off	= SMN_HSMP_MSG_ID,
+	.msg_resp_off	= SMN_HSMP_MSG_RESP,
+	.msg_arg_off	= SMN_HSMP_MSG_DATA,
+};
+
+/* RM: Ryzen Master, the SMC interface these client addresses belong to */
+static const struct hsmp_mbaddr_info hsmp_mbinfo_client = {
+	.base_addr	= SMN_HSMP_BASE_RM,
+	.msg_id_off	= SMN_HSMP_MSG_ID_RM,
+	.msg_resp_off	= SMN_HSMP_MSG_RESP_RM,
+	.msg_arg_off	= SMN_HSMP_MSG_DATA_RM,
+};
+
+/*
+ * Each table is indexed by message ID and must therefore have one entry per
+ * ID its enum defines, including the reserved ID 0.  Tie the two together so
+ * that a message added to one without the other fails the build here rather
+ * than reading past the table at runtime.
+ */
+static_assert(ARRAY_SIZE(hsmp_msg_desc_table) == HSMP_MSG_ID_MAX);
+static_assert(ARRAY_SIZE(hsmp_client_msg_desc_table) == HSMP_CLIENT_MSG_ID_MAX);
+
+/*
+ * The descriptors carry only the message IDs the driver issues itself, which
+ * are also the only ones the two message sets have in common.  Messages named
+ * by userspace in an ioctl need no entry here, as that path already resolves
+ * the ID against the running platform's table.
+ */
+static const struct hsmp_plat_desc hsmp_desc_server = {
+	.mbinfo			= &hsmp_mbinfo_server,
+	.msg_desc		= hsmp_msg_desc_table,
+	.num_msgs		= HSMP_MSG_ID_MAX,
+	.test_msg		= HSMP_TEST,
+	.proto_ver_msg		= HSMP_GET_PROTO_VER,
+};
+
+/* The client drives a different mailbox with the Ryzen Master SMC message set */
+static const struct hsmp_plat_desc hsmp_desc_client = {
+	.mbinfo			= &hsmp_mbinfo_client,
+	.msg_desc		= hsmp_client_msg_desc_table,
+	.num_msgs		= HSMP_CLIENT_MSG_ID_MAX,
+	.test_msg		= HSMP_CLIENT_TEST,
+	.proto_ver_msg		= HSMP_CLIENT_GET_INTERFACE_VER,
+};
+
+static struct hsmp_plat_device hsmp_pdev = {
+	/* Overridden for the client in hsmp_common_init() */
+	.desc = &hsmp_desc_server,
+};
+
+/*
+ * Look up a message in the running platform's table.  Returns NULL for an ID
+ * the table does not describe, either because it is out of range or because
+ * the entry is reserved.  Both are reachable from the ioctl, so the caller
+ * decides whether a miss is a userspace error or a driver bug.
+ */
+static inline const struct hsmp_msg_desc *get_msg_desc(u32 msg_id)
+{
+	const struct hsmp_plat_desc *desc = hsmp_pdev.desc;
+
+	if (msg_id >= desc->num_msgs)
+		return NULL;
+
+	if (desc->msg_desc[msg_id].type == HSMP_RSVD)
+		return NULL;
+
+	return &desc->msg_desc[msg_id];
+}
 
 /*
  * Gates the AMD HSMP data plane against socket bring-up and teardown.
@@ -184,30 +255,29 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
 
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
@@ -316,7 +386,7 @@ int hsmp_test(u16 sock_ind, u32 value)
 	 * Test the hsmp port by performing TEST command. The test message
 	 * takes one argument and returns the value of that argument + 1.
 	 */
-	msg.msg_id	= HSMP_TEST;
+	msg.msg_id	= hsmp_pdev.desc->test_msg;
 	msg.num_args	= 1;
 	msg.response_sz	= 1;
 	msg.args[0]	= value;
@@ -338,12 +408,12 @@ int hsmp_test(u16 sock_ind, u32 value)
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
 
@@ -354,6 +424,7 @@ static long hsmp_ioctl_msg(struct file *fp, unsigned long arg)
 {
 	int __user *arguser = (int  __user *)arg;
 	struct hsmp_message msg = { 0 };
+	const struct hsmp_msg_desc *desc;
 	int ret;
 
 	if (copy_struct_from_user(&msg, sizeof(msg), arguser, sizeof(struct hsmp_message)))
@@ -361,23 +432,26 @@ static long hsmp_ioctl_msg(struct file *fp, unsigned long arg)
 
 	/*
 	 * Check msg_id is within the range of supported msg ids
-	 * i.e within the array bounds of hsmp_msg_desc_table
+	 * i.e within the array bounds of the platform's descriptor table
 	 */
-	if (msg.msg_id < HSMP_TEST || msg.msg_id >= HSMP_MSG_ID_MAX)
+	if (msg.msg_id < hsmp_pdev.desc->test_msg ||
+	    msg.msg_id >= hsmp_pdev.desc->num_msgs)
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
+	msg.msg_id = array_index_nospec(msg.msg_id, hsmp_pdev.desc->num_msgs);
+
+	/* Rejects the reserved IDs the table describes as such */
+	desc = get_msg_desc(msg.msg_id);
+	if (!desc)
+		return -ENOMSG;
 
 	switch (fp->f_mode & (FMODE_WRITE | FMODE_READ)) {
 	case FMODE_WRITE:
@@ -385,7 +459,7 @@ static long hsmp_ioctl_msg(struct file *fp, unsigned long arg)
 		 * Device is opened in O_WRONLY mode
 		 * Execute only set/configure commands
 		 */
-		if (is_get_msg(&msg))
+		if (is_get_msg(desc, &msg))
 			return -EPERM;
 		break;
 	case FMODE_READ:
@@ -393,7 +467,7 @@ static long hsmp_ioctl_msg(struct file *fp, unsigned long arg)
 		 * Device is opened in O_RDONLY mode
 		 * Execute only get/monitor commands
 		 */
-		if (!is_get_msg(&msg))
+		if (!is_get_msg(desc, &msg))
 			return -EPERM;
 		break;
 	case FMODE_READ | FMODE_WRITE:
@@ -410,7 +484,7 @@ static long hsmp_ioctl_msg(struct file *fp, unsigned long arg)
 	if (ret)
 		return ret;
 
-	if (hsmp_msg_desc_table[msg.msg_id].response_sz > 0) {
+	if (desc->response_sz > 0) {
 		/* Copy results back to user for get/monitor commands */
 		if (copy_to_user(arguser, &msg, sizeof(struct hsmp_message)))
 			return -EFAULT;
@@ -685,11 +759,16 @@ EXPORT_SYMBOL_NS_GPL(hsmp_get_tbl_dram_base, "AMD_HSMP");
 int hsmp_cache_proto_ver(u16 sock_ind)
 {
 	struct hsmp_message msg = { 0 };
+	const struct hsmp_msg_desc *desc;
 	int ret;
 
-	msg.msg_id	= HSMP_GET_PROTO_VER;
+	desc = get_msg_desc(hsmp_pdev.desc->proto_ver_msg);
+	if (WARN_ON(!desc))
+		return -ENOMSG;
+
+	msg.msg_id	= hsmp_pdev.desc->proto_ver_msg;
 	msg.sock_ind	= sock_ind;
-	msg.response_sz = hsmp_msg_desc_table[HSMP_GET_PROTO_VER].response_sz;
+	msg.response_sz	= desc->response_sz;
 
 	ret = hsmp_send_message_locked(&msg);
 	if (!ret)
@@ -739,6 +818,22 @@ struct hsmp_plat_device *get_hsmp_pdev(void)
 }
 EXPORT_SYMBOL_NS_GPL(get_hsmp_pdev, "AMD_HSMP");
 
+static int __init hsmp_common_init(void)
+{
+	/*
+	 * The CPU this selects on is fixed long before anything can call in
+	 * here, and this module initializes before the platform and ACPI
+	 * drivers that depend on it, so resolving the description once is
+	 * enough to have it in place for every mailbox access, including the
+	 * ones the probe paths make themselves.
+	 */
+	if (is_client_platform())
+		hsmp_pdev.desc = &hsmp_desc_client;
+
+	return 0;
+}
+module_init(hsmp_common_init);
+
 MODULE_DESCRIPTION("AMD HSMP Common driver");
 MODULE_VERSION(DRIVER_VERSION);
 MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index 8dbff16a87b1..3e7814f26635 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -10,6 +10,8 @@
 #ifndef HSMP_H
 #define HSMP_H
 
+#include <asm/amd/hsmp.h>
+
 #include <linux/compiler_types.h>
 #include <linux/device.h>
 #include <linux/hwmon.h>
@@ -17,6 +19,7 @@
 #include <linux/miscdevice.h>
 #include <linux/mutex.h>
 #include <linux/pci.h>
+#include <linux/processor.h>
 #include <linux/rwsem.h>
 #include <linux/semaphore.h>
 #include <linux/sysfs.h>
@@ -32,6 +35,49 @@
 
 #define DRIVER_VERSION		"2.6"
 
+/*
+ * To access a specific HSMP mailbox register, s/w writes the SMN address of the
+ * HSMP mailbox register into the SMN_INDEX register, and reads/writes the
+ * SMN_DATA reg.  Below are the SMN addresses of the HSMP mailbox registers in
+ * SMU address space, as consumed by the fixed mailbox descriptors in hsmp.c.
+ *
+ * The server set is used by the non-ACPI path only; the ACPI path discovers the
+ * equivalent values from _CRS/_DSD.  The _RM set is the client one, named for
+ * the Ryzen Master SMC (RMSMC) interface whose mailbox it addresses, and is
+ * used by the ACPI path alone: client parts probe through ACPI only, and their
+ * ACPI device exposes no _CRS/_DSD to discover the values from.  The two sets
+ * share a base and differ only in the register offsets behind it, but are kept
+ * separate so each stays tied to the platform it was documented for.
+ */
+#define SMN_HSMP_BASE		0x03B00000
+#define SMN_HSMP_MSG_ID		0x00010534
+#define SMN_HSMP_MSG_ID_F1A_M0H	0x00010934
+#define SMN_HSMP_MSG_RESP	0x00010980
+#define SMN_HSMP_MSG_DATA	0x000109E0
+
+/* _RM: Ryzen Master SMC, the client mailbox */
+#define SMN_HSMP_BASE_RM	0x03B00000
+#define SMN_HSMP_MSG_ID_RM	0x00010A8C
+#define SMN_HSMP_MSG_RESP_RM	0x00010A90
+#define SMN_HSMP_MSG_DATA_RM	0x00010A94
+
+static inline bool is_client_platform(void)
+{
+	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
+		return false;
+
+	if (boot_cpu_data.x86 != 0x1A)
+		return false;
+
+	switch (boot_cpu_data.x86_model) {
+	case 0x80 ... 0x8F:
+	case 0xE0 ... 0xE3:
+		return true;
+	default:
+		return false;
+	}
+}
+
 struct hsmp_mbaddr_info {
 	u32 base_addr;
 	u32 msg_id_off;
@@ -40,6 +86,30 @@ struct hsmp_mbaddr_info {
 	u32 size;
 };
 
+/**
+ * struct hsmp_plat_desc - Per-platform mailbox and message set description
+ * @mbinfo:		fixed SMN mailbox addresses.  The ACPI path uses these
+ *			only where firmware exposes no _CRS/_DSD to read them
+ *			from, i.e. on the client.
+ * @msg_desc:		message descriptor table, indexed by message ID.
+ * @num_msgs:		number of entries in @msg_desc, and so the exclusive
+ *			upper bound on a valid message ID.
+ * @test_msg:		no-op message used to probe the mailbox.  Also the
+ *			lowest valid message ID, as ID 0 is reserved.
+ * @proto_ver_msg:	returns the interface version.
+ *
+ * Resolved once from the running CPU and reached through hsmp_pdev->desc, so
+ * neither the message plumbing nor the probe paths have to re-derive which
+ * platform they are on.
+ */
+struct hsmp_plat_desc {
+	const struct hsmp_mbaddr_info	*mbinfo;
+	const struct hsmp_msg_desc	*msg_desc;
+	u32				num_msgs;
+	u32				test_msg;
+	u32				proto_ver_msg;
+};
+
 struct hsmp_socket {
 	struct bin_attribute hsmp_attr;
 	struct hsmp_mbaddr_info mbinfo;
@@ -59,6 +129,7 @@ struct hsmp_socket {
 struct hsmp_plat_device {
 	struct miscdevice mdev;
 	struct hsmp_socket *sock;
+	const struct hsmp_plat_desc *desc;
 	u32 proto_ver;
 	u16 num_sockets;
 };
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index e9b2b809c0f5..957deee86d74 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -29,17 +29,6 @@
 
 #define DRIVER_NAME		"amd_hsmp"
 
-/*
- * To access specific HSMP mailbox register, s/w writes the SMN address of HSMP mailbox
- * register into the SMN_INDEX register, and reads/writes the SMN_DATA reg.
- * Below are required SMN address for HSMP Mailbox register offsets in SMU address space
- */
-#define SMN_HSMP_BASE		0x3B00000
-#define SMN_HSMP_MSG_ID		0x0010534
-#define SMN_HSMP_MSG_ID_F1A_M0H	0x0010934
-#define SMN_HSMP_MSG_RESP	0x0010980
-#define SMN_HSMP_MSG_DATA	0x00109E0
-
 static struct hsmp_plat_device *hsmp_pdev;
 
 static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
@@ -157,20 +146,18 @@ static int init_platform_device(struct device *dev)
 		sock = &hsmp_pdev->sock[i];
 		sock->sock_ind			= i;
 		sock->dev			= dev;
-		sock->mbinfo.base_addr		= SMN_HSMP_BASE;
 		sock->amd_hsmp_rdwr		= amd_hsmp_pci_rdwr;
+		sock->mbinfo			= *hsmp_pdev->desc->mbinfo;
 
 		/*
 		 * This is a transitional change from non-ACPI to ACPI, only
 		 * family 0x1A, model 0x00 platform is supported for both ACPI and non-ACPI.
+		 * It is the one part whose message-id register sits at a
+		 * different offset on this path than the descriptor gives.
 		 */
 		if (is_f1a_m0h())
 			sock->mbinfo.msg_id_off	= SMN_HSMP_MSG_ID_F1A_M0H;
-		else
-			sock->mbinfo.msg_id_off	= SMN_HSMP_MSG_ID;
 
-		sock->mbinfo.msg_resp_off	= SMN_HSMP_MSG_RESP;
-		sock->mbinfo.msg_arg_off	= SMN_HSMP_MSG_DATA;
 		sema_init(&sock->hsmp_sem, 1);
 
 		/* Test the hsmp interface on each socket */
-- 
2.34.1


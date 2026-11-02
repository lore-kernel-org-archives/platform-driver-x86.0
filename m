Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793604033;
	b=nUY0hms+G/yZcZL4GrFmA8NDQgrfmR7T8Rr/PiRfozdTP131MuCng9wVU+4Vmc/Uo43C
	 hs1VrpoMvBHBPg8EZ0rBFZPNuYVQZD+s0YFbfyPIlpaFSfqmAg7Yi37ywIT8d2VJgASfH
	 ir3PfFYVQClEebXbR/gcjBGcBhwQF2xebIex2aoDVQAjXUB0sFf/RRkqVJA1PfzmNAVlN
	 i0/TAs7Bm0qTmlXvg1OXRtuOHDHdlO/TR+gqZUK3BrZyMCR6u1PvO9pgYeWnUy/zgDC8P
	 CgTgL8NyypvPWzMiS+P4DL6woh/ZtHLKQavo8nOSpPvb8DvcXoNfCehCOxiv8TwaxPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604033;
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
	bh=b/gk7IMwQTvsCafDUGqioy6pXnKkedFhbxoLRaHv5LY=;
	b=O7/bgl0QM85/2aRWSOBtOZ1XqeSjkjpCQTzv3LQzPpMGPhuWeyi9hqKtO8jDsLzaTFDb
	 2a2ffzFcfUU4ZeNtCrlc+5wqYS538q3Bs6X/lQAFth59BIUDQUmP5kHc/kstVSiseuYBG
	 XKztcp0BLSw3TKJ4/gCu+3tivaPDSTmvc+zP/VdX0E2gwTfkh+zYdbmFMu8w8AsTbmhrg
	 04KfBRZHb3AY7zNNoznh2zSg9Au5kHJjwRXDagi3xSvk8k5SZnOJb6Ub/ubajgTum0bgp
	 YgdRj0MccS9/xJD7GSW3WHVeQB9Jm4B5qd2vkTHbT4U0J2NWZwCZ5rPUT+7TPve/RVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=BmAJJSKL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.3
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011003.outbound.protection.outlook.com [52.101.62.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A888F606A326
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2026 07:20:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A888F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=BmAJJSKL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=REEJ0+E+y7KpAlcuxf3Rl23z0juZuzDSmlBviTMsxGW7Ez1hJdq0dSgle17FgQPN0CU36qLsvKWcjw1U77Qqip6uSo7q8ofgAO1QyP6nvw73CUH0M6yaf2kdckO5pR6NhQxTnRre0TkeDLwDaaiTdPdG5FFmQhceaAWr6CXlK5kGiLW78Obsr6SHh+fKj9GPuaFIYUYHIehfl80QGtezRIO0xkwmO4B5W6YRwF+6RxFZxe+kS1b/XUDc9lBmsFv6EDdoxqOLlYQUrszVzqH7eji6x3kHGvWYqoY87s9HjeRXOWrwu2/PQ/Y3StFIGna1865iGWCbQkqDO1CbQjyBuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/gk7IMwQTvsCafDUGqioy6pXnKkedFhbxoLRaHv5LY=;
 b=NSuL/8LbR4ofKlLgCwZXa4Hv6w9x4wM2puy3U1eeWq+H6Y9/o+W2i372OJgvscyagVIrgp4df2Y6CjP4OeHsSNTylJrMNt99K6uDH6QxYZ3Ft2bBqMaqj60nNuQYzZLScZdoLLGsqBa+eKUpE2t/jqaVzTK+QrKlwSnRvPi3j5YoT3PbsrOQlIFL20i81KUyjFRpFjarvXp6y2tFMuCviuKeJcXaeupHnZbkd2Efz1Zptyrk93KML/YCVFgCA3avCZOaQVQFcqSxibnJflCcZ1lMSVc4rIp6ksthlKcCWt5P6xSsNdp29nGwKhhqdZxwg3U8g5kecKOUhCluMl5OGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/gk7IMwQTvsCafDUGqioy6pXnKkedFhbxoLRaHv5LY=;
 b=BmAJJSKLzNOrqcjwkza1xDV2+S6MVHm3mErhNZMbA7QGRKJIJ0gWw7wJgKYFcYVj1ckLZSWkeP2ARBLC5WWrbQBPvCUHKSVRSosYnek9FYfMuPUA+9BEFYtDcqo/ZzB18FlxxMAGumoE5EEikvK2mOwHnsntgNmpxvs6f/DkKpA=
Received: from SJ0PR05CA0167.namprd05.prod.outlook.com (2603:10b6:a03:339::22)
 by SJ1PR12MB6193.namprd12.prod.outlook.com (2603:10b6:a03:459::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 07:20:23 +0000
Received: from SJ1PEPF000037A7.namprd04.prod.outlook.com
 (2603:10b6:a03:339:cafe::13) by SJ0PR05CA0167.outlook.office365.com
 (2603:10b6:a03:339::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Mon, 2
 Nov 2026 07:20:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037A7.mail.protection.outlook.com (10.167.244.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 07:20:23 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 2 Nov
 2026 01:20:20 -0600
From: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <Suma.Hegde@amd.com>,
	<NaveenKrishna.Chatradhi@amd.com>, Muthusamy Ramalingam
	<Muthusamy.Ramalingam@amd.com>
Subject: [PATCH 05/26] platform/x86/amd/hsmp: Print protocol_version as hexadecimal
Date: Mon, 2 Nov 2026 07:19:03 +0000
Message-ID: <4786ebe4d0e6c9cedad6a51eea3ae5222fd5ba6e.1793602633.git.Muthusamy.Ramalingam@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A7:EE_|SJ1PR12MB6193:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a115649-f4e5-402a-fb85-08df38b1c283
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|376014|36860700016|261021121427099003|261021123027099003|261022075727099003|261009223027099003|261026121527099003|11063799006|10067099003|56012099006|260925021911599003|260925022911599003|260925021311599003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	8Lz18ErtSu3ASmZesCvVCMQMv2vXZPP//4HfHGbk9TIbHTf23BxPvOlaGwFOoFG4UK2HqQ2kmpzyzzDITDKcPOD4LYusF9TEmpDishidugQ+JJMdOKtwNnrzCD6e+EecKBHKKwgz89UL7zxEregjxpIZSp7K0AgDo6QouQAqYC+88ylMpOvxtzS/PpwASrKhCoCEYiznDzZevxzP4AA8nkt3Y4rnybyxS3QFb40OaRINcwOGb3/Ivhz9T+xnDXvFA8jB3kfvo7JIwDMEWKatX4THpbeEifrSzJjMAWt518HFrKQM+jFcodxdGeOGSYndIiOmrkn9/NCkStMEUShgtHcq0AraZpkqBoTrjUOMq5+91BrLtbY+Z+MUwHpKs7XztKKA/q5NuooeFS6o1mTOPPi87uq22lo2CiQ1kjtStP7/pZfrw6SL/BTaQkF8hD8xv3Foi18+Zu9pNM7nqbFLdj2fm1/E801ljxCA0cw5UaIWJrGx43YcCku4703qXYjXdnmUopMlgKVKHvNLu19gO/8fI70U7KeORNe4U627pgKv628/ePB/s8Hei3J0kL8pQRJNZKTQQMs5GxhEUd/WcG6sFtA2PDBSuTBGtEDPz+kiyiEGTwjHZSgwLySwc2HxNVwBsNWxPftdDSfPrennCYH706T1K5pzKc548eNWR3Adow2WW2o40TT9oI+XwGMZ
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(376014)(36860700016)(261021121427099003)(261021123027099003)(261022075727099003)(261009223027099003)(261026121527099003)(11063799006)(10067099003)(56012099006)(260925021911599003)(260925022911599003)(260925021311599003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zTQCLXogNZQMC3QswJFIrQV0ffaJmkUk7Q1enOlHfhjAFpwcxkCrFLPUaeKBeV8zcBovTpaE8bgKfZvm0A4TsOx77I/Q3RyonLShtrVmFgp6MfQDywcqN/f4GGoXwmf0lW4zu5CNMlTfxNDrhSAYswTZTynZ8AknaRbWNDTzEJ20VvIA+yX8/d/2iViAiLhALLjAY5ESrlDv3ZjZxQwuTVnWDTgJM3Eu5RH/z0TgabEYeGdOSoOL6XFE/2YdQuVKHeOHBv5NyRhU8eUHpOJTw/jajJlKNCWTatLeYq8n+USOsnYjufKZ+pXtX6xbNiMJ4FUpgkYMOwmGp29FNNTN2MquM2rMJYVvZVao2CJu1hWzAMa+QNV/xHQ45nxse1UtKtfclQcF92sJ038Kl/hv7ix/7NJNBWirmaPwjeM1s9FTy5U/nGSIOHbLzuD5pTQg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 07:20:23.2406
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a115649-f4e5-402a-fb85-08df38b1c283
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6193

Switch the protocol_version sysfs file on both drivers to
hsmp_msg_resp32_hex_show so the HSMP interface version is reported as
eight hexadecimal digits, matching metric_version.

Introduce hsmp_msg_resp32_hex_show for that formatting.

Co-developed-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
---
 Documentation/arch/x86/amd_hsmp.rst   |  2 +-
 drivers/platform/x86/amd/hsmp/acpi.c  |  2 +-
 drivers/platform/x86/amd/hsmp/plat.c  | 16 ++++++++--------
 drivers/platform/x86/amd/hsmp/sysfs.c | 15 +++++++++++++++
 drivers/platform/x86/amd/hsmp/sysfs.h |  2 ++
 5 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index e14925896a3e9..44a7da87e5907 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -101,7 +101,7 @@ write-only when the platform enables only that direction of the message.
 * prochot_status: Reports 1 if the processor is at thermal threshold value,
   0 otherwise.
 * smu_fw_version: SMU firmware version.
-* protocol_version: HSMP interface version.
+* protocol_version: HSMP interface version, as eight hexadecimal digits.
 * ddr_max_bw: Theoretical maximum DDR bandwidth in GB/s.
 * ddr_utilised_bw: Current utilized DDR bandwidth in GB/s.
 * ddr_utilised_bw_perc: Percentage of current utilized DDR bandwidth.
diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index a74fb274ee652..6bbcc2f7e6a30 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -518,7 +518,7 @@ static const struct bin_attribute *hsmp_attr_list[] = {
 HSMP_DEV_ATTR(c0_residency, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444);
 HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444);
 HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444);
-HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444);
+HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_hex_show, 0444);
 HSMP_DEV_ATTR(cclk_freq_limit, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444);
 HSMP_DEV_ATTR(ddr_max_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_max_bw_show, 0444);
 HSMP_DEV_ATTR(ddr_utilised_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444);
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index 49a0c01f6dd1b..ba8274e5bfb4a 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -233,14 +233,14 @@ HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444, 5);
 HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444, 6);
 HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444, 7);
 
-HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444, 0);
-HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444, 1);
-HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444, 2);
-HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444, 3);
-HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444, 4);
-HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444, 5);
-HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444, 6);
-HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444, 7);
+HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_hex_show, 0444, 0);
+HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_hex_show, 0444, 1);
+HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_hex_show, 0444, 2);
+HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_hex_show, 0444, 3);
+HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_hex_show, 0444, 4);
+HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_hex_show, 0444, 5);
+HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_hex_show, 0444, 6);
+HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_hex_show, 0444, 7);
 
 HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444, 0);
 HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444, 1);
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.c b/drivers/platform/x86/amd/hsmp/sysfs.c
index f7c90680a4ff6..bc1b349468978 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.c
+++ b/drivers/platform/x86/amd/hsmp/sysfs.c
@@ -83,6 +83,21 @@ ssize_t hsmp_msg_resp32_show(struct device *dev, struct device_attribute *attr,
 	return sysfs_emit(buf, "%u\n", data);
 }
 
+/* Print a 32-bit response as 8 hex digits (protocol_version, metric_version). */
+ssize_t hsmp_msg_resp32_hex_show(struct device *dev, struct device_attribute *attr,
+				 char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(hsmp_sysfs_sock_ind(dev, hattr), hattr->msg_id, &data, 1);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "0x%08x\n", data);
+}
+
 ssize_t hsmp_ddr_max_bw_show(struct device *dev, struct device_attribute *attr,
 			     char *buf)
 {
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.h b/drivers/platform/x86/amd/hsmp/sysfs.h
index 9381498420f5a..aae932079ab70 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.h
+++ b/drivers/platform/x86/amd/hsmp/sysfs.h
@@ -54,6 +54,8 @@ static struct hsmp_sys_attr hattr_##_var = {				\
 
 ssize_t hsmp_msg_resp32_show(struct device *dev, struct device_attribute *attr,
 			     char *buf);
+ssize_t hsmp_msg_resp32_hex_show(struct device *dev, struct device_attribute *attr,
+				 char *buf);
 ssize_t hsmp_ddr_max_bw_show(struct device *dev, struct device_attribute *attr,
 			     char *buf);
 ssize_t hsmp_ddr_util_bw_show(struct device *dev, struct device_attribute *attr,
-- 
2.34.1


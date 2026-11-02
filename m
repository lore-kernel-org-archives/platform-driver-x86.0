Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.33
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793604016;
	b=FOsyZkMDFE14xtsDRDfgUylgWv6dRFBwl6kR5bCgcBPD4yr0sheGzx0KTuKMFGfI4Z/6
	 GLZAz4xl2S7Kd7emuVF3FK4NSt05G0bM+jFYEztL3cboYR85sru1BQdO3qKQqgITHz8JB
	 +mQZb/mCJqrfpuNWe/ZhkUxhxnH3Zj7p8CgjwhU+o0962hBNsvQrTbZBC3qTkPr9TJ8s/
	 EBO8L5ENHXbdCE7olFcZotE2no9h6C2EWPvnn4zQjZm8ihluXEW2zT2H1H6KUnoAkMbji
	 pFoQlds/wZkVwhtZP5oKPbllZyGPZyTCGl9XJ9MgiV/87+xBwl2GeZJkqvdqixfgOWA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604016;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
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
	bh=vRZlNJ4qmO/C4W6ROfj+o6IpXW9DtKI4sPOVgZHzeJs=;
	b=nURI8lwlujtvVBYrA5LYEmVaDiYZJyi0HdmoR+LycqiGPkk16HwyrdRBLYrT6f5Nhc+1
	 SK5nM2Fyh2tk1fwSw4W198fDCJ3VK82gHAi+acFrFzaApKqG/SfiapwjTVdMnudjFEiwm
	 559jz7ERCO8QStKw3chjjdz6B+NeW+kOKMSHb4tSFa2y8rjw/X4Dx56pUaiA9uJlBpZnQ
	 mhdh9GlflT8LYLGZZBz8CHmctZAsABkJMQiZEJd+4EPJMnvRWe58WaSjx4unmK+BMj+2O
	 xVi3kGGXRtNBndBMYuk6Fp0S1jxvBfydfuv+BPh4KwadleMBwIQwFo90x2StNhRy+fg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=EX3TLaaN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.33
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012033.outbound.protection.outlook.com [52.101.53.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3163A606A324
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2026 07:20:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3163A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=EX3TLaaN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nfm3bKuDjNt/an4MjrT8Gr4Cv8UAKMVv8+jagRbfT1NqZgfiojpb7dnOdF/MHPg3OdBCCRHiVcbkHCMOT+L1KFSVDV4Gh2yv5nXnatxiSs6udhOHLrgliPHvmcSEyreaN8uSnFaMedxuflhNnnoA0NQoFC65d16Es5EbqAX8cbJrE5XeJUtsHOryPJYsES+UEQEgF/4Jl4ATjr7qG3UtScKDQAZXITmsiqAtFOYji9ZE/wqj+84SMcDpv4QGav7DqknpNh5AfAnqO/a9KvT2Mj9o1AK+VdhnRWOF2gZN4yDM4TzS6JsRy15KxjujtM4tWnLrXPYxwDEm25fd8T16UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vRZlNJ4qmO/C4W6ROfj+o6IpXW9DtKI4sPOVgZHzeJs=;
 b=fcl9l0XtYZQKUryjkd/Uj190P2XV3NwKrgglcLCU8qhEU7rVtwu1yi9lIIFG1mtufnKDrqdF3NlxMp+6g2n0oiq0Q1SApTZP4TA7r0l+2HrJZHDuq6S24RBouiSaTy9G8DFBHFrw+Nqqz3qKze9af7k8Dul36b+xfP+OKS3yrLpY7A5acu/JdTEBLFDSn3evHbJPpItpLw9Nm/0JVRhkBcLDUw/0JeIgtwMgqVGOeZVGhIHP+zPEzIYX6KBsBNvLwVEyLGItDgq38mLfaLV4wrt5iLSCkWMVaSbFMLbQ01km6LlG0s5pDFG43kl14CzEwtEFL1DiVJB9iPKbScMQAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vRZlNJ4qmO/C4W6ROfj+o6IpXW9DtKI4sPOVgZHzeJs=;
 b=EX3TLaaNFJCUBvJKgZEPavf2uNiUkm0dZTy7wFA+nr63LrHL9VMWDNnkyKoUzjfXDNW6CkF2sM5lB1F+oBCGiqZbZ+0/5eKKaMy+vWYHNO/RXPTpFBzRD+6o7wYWetTu+9RoE2OXrKUMBu1TjJAuLOacZNRtMjkHx6vrtY/1rK0=
Received: from SJ0PR13CA0106.namprd13.prod.outlook.com (2603:10b6:a03:2c5::21)
 by SA0PR12MB4366.namprd12.prod.outlook.com (2603:10b6:806:72::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 07:20:12 +0000
Received: from SJ1PEPF000037A2.namprd04.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::7b) by SJ0PR13CA0106.outlook.office365.com
 (2603:10b6:a03:2c5::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Mon, 2
 Nov 2026 07:20:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037A2.mail.protection.outlook.com (10.167.244.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 07:20:12 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 2 Nov
 2026 01:20:10 -0600
From: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <Suma.Hegde@amd.com>,
	<NaveenKrishna.Chatradhi@amd.com>, Muthusamy Ramalingam
	<Muthusamy.Ramalingam@amd.com>
Subject: [PATCH 00/26] platform/x86/amd/hsmp: Extend socket and per-CPU sysfs
Date: Mon, 2 Nov 2026 07:18:58 +0000
Message-ID: <cover.1793602633.git.Muthusamy.Ramalingam@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A2:EE_|SA0PR12MB4366:EE_
X-MS-Office365-Filtering-Correlation-Id: fb06b981-1fab-48e6-9656-08df38b1bc32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|261021123027099003|261021121427099003|261022105027099003|261022075727099003|261009223027099003|261026121527099003|261026140227099003|261028144727099003|11063799006|10067099003|56012099006|18002099003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	3z6kpFsN/572Pj9/lzw2hSCtMZzIVu3442gpB9AzVGCUifnzQC1kAt8uXLN1EIlg5ulJjVF5jYgxi9zNuJclChGSSPGLd4ISHGroIfgQUb1K+9WODaPh1dfLBDD0SMD8AusN7235MCKd00SoQYMZzHtoX2UTQQtD8rs7tj5QR0vRr5IbIYO2Ns4c8XWkqj/5+r/0tjErz9+TKQGnmjP6gk6j1KmLKVx5Vks9wsOKbuhZPSOlLMYZSMATNFPYVAb/JfWZ+yn/nJ2I+olr1/b4JWLDtpej9gyPOQNXGgc57fpe5o9vFXsUm8TlhzW4pCgTdU1Tluks2JiYOFv3y151Q31bqbVCHN7X62BACoXuW/FRMS2X7QM2FZFh2IpxrcTHEuz3gumP5Xwj2slB/AhwLPbaGpW6TrJGZ1OYlRE9ZplICpGoDCDYoxS2oJKV7g2isDE0Yz8ibp+yKzH47rQk2r/sPYO45OOI2G5fHijX4qQG26mkonEMqukH9uSFB6+VU4uTSfUqqcJnNJsgMybUMpgc6Ies/A8hlxI4KrzUl2k7w3HCeRgPvM5PfUywewI1MiraoozNmbCpRUD6RMoMrKTFgeCWDb4M4SJjPWv1Je+g6qOQiUnMB1ogcj7GQBtxAy/p6Dvd7eSp11IqIyzzzMDlu2oIf3dFayXPmJ5dRLs=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261009223027099003)(261026121527099003)(261026140227099003)(261028144727099003)(11063799006)(10067099003)(56012099006)(18002099003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yy2T/1+i8FupVkvGkqeZOiKBPyDRPnOgm3549HDWTl8jEz8T5lR5HkcAbDIS9tzNinN2an29WncgCAgSSxzS8+HNe+X9sUIIgymkOT7FL8x6XJqdQqu7tIGw902ru2KbNoZvS6AE2myLkvSSl7HulJhQM9zrjkQu2gbYakKygCIUU/yQVxrUJWDlsA7Tn0pD6TkHQeUA3G0ag6kvAMHX3BrLKdXIrvc1H0PrR4b1M1M5Si7mBqAUItLQxgQ831xCiPcca86BZtUKTK8ES9edcqOLgrXRICCjUXezmpjA93gUyfycxUtGeM2+WgVDMKfnnJ+7wXfqNfK+/bitMYakErml39rub7J3FFOwpByylvK1suf07IzlqCFY8XE2yYmHg0vT7z8VUzuBiSpNt/s2WngArofmE6hr8ApzG1xWXNl4Gxscb21DD+2a5H8XBYnd
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 07:20:12.6400
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb06b981-1fab-48e6-9656-08df38b1bc32
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4366

This series extends the AMD HSMP sysfs interface on both the ACPI and
platform drivers. It starts with socket attribute naming cleanup and a
parser-friendly store error helper, then adds the remaining
message-backed socket and per-CPU attributes used on server platforms.

Later patches cover link/bandwidth, DIMM, SVI3, power-efficiency, and
per-CPU files. Attribute visibility follows the enabled-message bitmaps.
Probe-time discovery for optional DIMM/IO/xGMI hardware is quieted so
expected firmware misses do not flood dmesg.

The series ends with socket_temperature (HSMP_GET_TEMP_MONITOR).


Muthusamy Ramalingam (26):
  platform/x86/amd/hsmp: Drop _input from socket sysfs names
  platform/x86/amd/hsmp: Rename clk_fmax and clk_fmin sysfs files
  platform/x86/amd/hsmp: Add hsmp_err helper for parser-friendly store
    errors
  platform/x86/amd/hsmp: Treat socket_power_limit as firmware-clamped
  platform/x86/amd/hsmp: Print protocol_version as hexadecimal
  platform/x86/amd/hsmp: Add sdps_limit sysfs file
  platform/x86/amd/hsmp: Add df_pstate_range sysfs file
  platform/x86/amd/hsmp: Add xgmi_width sysfs file
  platform/x86/amd/hsmp: Add gmi3_link_width sysfs file
  platform/x86/amd/hsmp: Add pcie_link_rate sysfs file
  platform/x86/amd/hsmp: Add lclk DPM sysfs files
  platform/x86/amd/hsmp: Add io_bw and xgmi_bw sysfs files
  platform/x86/amd/hsmp: Add DIMM sideband sysfs files
  platform/x86/amd/hsmp: Add per-CPU floor limit sysfs files
  platform/x86/amd/hsmp: Add metric_version sysfs file
  platform/x86/amd/hsmp: Add enabled command sysfs files
  platform/x86/amd/hsmp: Add DIMM power and temperature sysfs files
  platform/x86/amd/hsmp: Add SVI3 temperature sysfs files
  platform/x86/amd/hsmp: Add cclk_floor_limit sysfs file
  platform/x86/amd/hsmp: Add xgmi_pstate_range sysfs file
  platform/x86/amd/hsmp: Quiet probe-time firmware status dmesg spam
  platform/x86/amd/hsmp: Add powereff_mode sysfs file
  platform/x86/amd/hsmp: Add svi_power sysfs file
  platform/x86/amd/hsmp: Add per-CPU ccd_power sysfs file
  platform/x86/amd/hsmp: Add per-CPU freq_limit sysfs file
  platform/x86/amd/hsmp: Add socket_temperature sysfs file

 Documentation/arch/x86/amd_hsmp.rst   |  116 +-
 arch/x86/include/asm/amd/hsmp.h       |    7 +
 arch/x86/include/uapi/asm/amd_hsmp.h  |   11 +-
 drivers/platform/x86/amd/hsmp/acpi.c  |  645 ++++++-
 drivers/platform/x86/amd/hsmp/hsmp.c  |  298 +++-
 drivers/platform/x86/amd/hsmp/hsmp.h  |   31 +
 drivers/platform/x86/amd/hsmp/plat.c  | 2346 +++++++++++++++++++++++--
 drivers/platform/x86/amd/hsmp/sysfs.c | 1858 +++++++++++++++++++-
 drivers/platform/x86/amd/hsmp/sysfs.h |  116 +-
 9 files changed, 5260 insertions(+), 168 deletions(-)

This series is rebased on top of https://lore.kernel.org/platform-driver-x86/20261014111430.23156-1-suma.hegde@amd.com/T/#t
-- 
2.34.1


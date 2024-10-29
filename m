Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2046.outbound.protection.outlook.com [40.107.220.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF056195B1A
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Oct 2024 15:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730217326; cv=fail; b=CFZNyn0fa8INMY3i4lWnuNu0BVdQkRy2ROPdsETDHKeinUWyN+3Y58EwF919AL0v586QDFtSOzneDiPFUSw0irNifYBoiRS0khi/6lD7+N2deaoBz91ECXIb320gz3xqJlG1B7GgRgMeEo3FSkqvYCwCwGTGq8brkKbU6FL4Y5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730217326; c=relaxed/simple;
	bh=CSBAXidFgMOCvEEUtdfATHeu2eGvy8A4XS0DZ1Hw4Io=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tak/vXRsmGkZBhfU7Y+KU4z2BcsQvqPiMfeAVDvUQ+gB+zgkoZIR5ZFy/GBw4txakqJQ9V7n0MefhhdePHxL1FZJFmyErdK2UR7Gcu6Kl7uXrPFX6vz50gQy3Z2AyWsAQF0KOOF59RaO3U+WspxzkV5LwpuiZGFv47JjT8RsPyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=fU+llRHB; arc=fail smtp.client-ip=40.107.220.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="fU+llRHB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i4fF9tSU9cZtUz0QBOAVl7CSjQUyP9GhHOrG2HG5AzS5UkVitGchFiFFlGc3ZtC6k7vSNIoxxKQHpGHWUMm6dMCkjGPWA6kUVg+qUwpdULUQ949NspSvuw22yncblq2AKgOjodc7pzw7zNqDha9q95qWJeEVJJlp1kcTz5rTtTnwZwZzP7pS4YZB2JtJcC1DzVojcIiJ9ljbAt5v6gLgMhVVIEgjVkAg7uNkQ11FIp5YPq1p52KmcNM9jUTHbSzO5gNvRZjBvh0e9wPQ4B0T0eQlPFZ1KgfoQfGw5vqr1UUSrNDqt0s7bfIyeN1K2OHvK/3tbYTNKdeiKy16ISx+2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F2VVgrnDR/J+lx+trSxoDgKMPvQ7821oEf1GiG/5vUQ=;
 b=oIaCY35SN7GBc4QNUJ0jx/vw25MELCrczjjbbeBiqQElrGdpo60T5hq0p0SvtLk1kvqDbFFkOxnoYKS0hNWM+MYQwEyw/md31JHnEzcsz6+KJstVgeOt3Yh1WyisrUMQAtAlEjFsnNEPNJ11TSXSC2lwUPwI0zXr0zc4roZ7jr/LcQ9yBRdlgcThw2rXx23LJQ6nPwYaye5WO464a6SlZOHBX8kM3pBB1QpkLa/ublDxUn5Z+lxJTw6YDMv89qpIJVoJXxOIxPq+NA1u03Id7kKMHle8wZFLjLi7dGQTwGi+5ApV7+I7PimdtoNsckrIw2iGExmy0KoNYQbn7o43Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F2VVgrnDR/J+lx+trSxoDgKMPvQ7821oEf1GiG/5vUQ=;
 b=fU+llRHB/V5fugGezTe2MMhiinLpHMYM/rNGylbuPb7Z9L/YOWgIvmsVYkN5CDx2NKSsRpkMey/Sbdpgxl2ypp6ASJ+PYp3+oYAzaSxMWsJFj+YubVuPNOKDL47K5oFi+fcKET/M52bP2k+RMuxGCp+JGdSvIATglbVScmthw7g=
Received: from BYAPR08CA0026.namprd08.prod.outlook.com (2603:10b6:a03:100::39)
 by SJ0PR12MB8616.namprd12.prod.outlook.com (2603:10b6:a03:485::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Tue, 29 Oct
 2024 15:55:21 +0000
Received: from MWH0EPF000989E8.namprd02.prod.outlook.com
 (2603:10b6:a03:100:cafe::7c) by BYAPR08CA0026.outlook.office365.com
 (2603:10b6:a03:100::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.17 via Frontend
 Transport; Tue, 29 Oct 2024 15:55:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E8.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Tue, 29 Oct 2024 15:55:21 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Oct
 2024 10:55:15 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 5/8] platform/x86/amd/pmc: Update IP information structure for newer SoCs
Date: Tue, 29 Oct 2024 21:24:37 +0530
Message-ID: <20241029155440.3499273-6-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029155440.3499273-1-Shyam-sundar.S-k@amd.com>
References: <20241029155440.3499273-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E8:EE_|SJ0PR12MB8616:EE_
X-MS-Office365-Filtering-Correlation-Id: 1173d928-291d-450d-05a1-08dcf8321837
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bxyaQklhSrp3u4CIVGIv0Kj9KwpxgKmcZa5m54kJMfaQfPZiHIQLdR5CJ95G?=
 =?us-ascii?Q?/smDYvfx3Fl+qo4M3OBw2DLS0H4qyqlk60GIoVFlliwICYFCelzglGhNXY2P?=
 =?us-ascii?Q?QNrwK6q6MbjmEDgAntF63puPb0IMK6hDMMH7cnUTri5hepXoB4+b3lwsIfqJ?=
 =?us-ascii?Q?21kmgzRUO/OkqG/Evy6PErGIIr6iKs8wNU9aJeuvVrnqBPK+BLQ/3ywKzbS3?=
 =?us-ascii?Q?YSU7r0R8TL4QpnOTYbQUgGjuOjRY+GVHFUOOCVCfZW0T/nGYh7KLr3EskzZN?=
 =?us-ascii?Q?4qy4yGyV6zpLm2UdXWXdSNgDs915u29k0ANGh/2VpC4WpOXVF8JBMF2F/lAg?=
 =?us-ascii?Q?XyCU+cUBgMASpM8qawFO/pWqj7Op13toZm97gVxONHQ6A+WTvKbvNi7fZIhE?=
 =?us-ascii?Q?YeLenD47QuLw9vv4/EgSzxifOfgrVwF9JGUOr86Dgfg5ud2YPibjih3AdA1t?=
 =?us-ascii?Q?3W7q4h0JucXI5Jqb2Evzq3sBw+EDcZ6L5JgBkKaWFQW6NagkTSxCznxD5+G7?=
 =?us-ascii?Q?b9ptR4w8gQV46OE6sI7ny0aZegahq+uyr126dm+137iNZLvqgtohgIVqKCX+?=
 =?us-ascii?Q?WHIT/1tDT90cfHeoUBxXA1DgLDVyTXRTy6CPL8MrQrSajLRQpooXUR4x+T2a?=
 =?us-ascii?Q?1RaZ4CnHnnOdcDj1dj6CBIqxirZXKQiheylFC6PSo8t14Vs54Uh2Uzd0pY0o?=
 =?us-ascii?Q?z/jfXW1vFhunjHhon2ncLJ42fe/1Pm6q3Pf1+3un7JNpsJG7/fFNHTtciXnH?=
 =?us-ascii?Q?7PP2cbszBfEvbnpMYcoOgL1UEoGZ9mFFfQfEccRC6GZ1iDvSHsZ09f0+Jl33?=
 =?us-ascii?Q?dYXM+xHZkEOqUG0ekRV5eTDeluAx6nJ/Odjgxnfc1cAZM+wE/ku7dw2tNP25?=
 =?us-ascii?Q?N64xtjrOzAJKm3t53i4gJpwxrUOuEMypHrrZTJ0wv3zkglwQKs6JfLTGqErp?=
 =?us-ascii?Q?cw3YwCOyTewOEidwvQtAZM7WczCpDauM/+Ks6D6oflNdDotUM22g/5gHkdVZ?=
 =?us-ascii?Q?g7x5YUMKu93bDW5jEuixSZ+jY/XFRau/kThkaIjBkslwF9+wy5Ug8l1ct020?=
 =?us-ascii?Q?ZhFoKrILrr9Ac/UyfzHcBmi/FgZjXD4w2e6ZFDpgUgdWIW3dBv/DoCGh3Mdz?=
 =?us-ascii?Q?vn2DYq8HLxphrDc2dSiWYeuyCh/CKqt7IsTGgP0cxWIkRBRIVnsPIkhNnNkV?=
 =?us-ascii?Q?BioXTpgfxEJvJt/dH1ObTeIQjtUN/j4VuQ/v4h4VjJXOFDh5x8wACZ7c6JoL?=
 =?us-ascii?Q?yg/ufSkx9uNHIpxWO4UDF+M02S7ED61ebBKCpYZhSp1o4jfpEzsdCEALz4sA?=
 =?us-ascii?Q?7PpZB/Namx9J9UvEqIsJqcXKUL5R21uThMHNPFDPdwT/QdXLDUqc+KeYCqig?=
 =?us-ascii?Q?rtFiD7lIq2J07KKTzQtlSLzytkdqsuEJ6N9EdF1ohkIg7kCAUw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 15:55:21.6361
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1173d928-291d-450d-05a1-08dcf8321837
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8616

The latest AMD processors include additional IP blocks that must be turned
off before transitioning to low power. PMFW provides an interface to
retrieve debug information from each IP block, which is useful for
diagnosing issues if the system fails to enter or exit low power states,
or for profiling which IP block takes more time. Add support for using
this information within the driver.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 42 ++++++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index f9900a03391a..0bf4065153da 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -95,6 +95,35 @@ struct amd_pmc_bit_map {
 	u32 bit_mask;
 };
 
+static const struct amd_pmc_bit_map soc15_ip_blk_v2[] = {
+	{"DISPLAY",     BIT(0)},
+	{"CPU",         BIT(1)},
+	{"GFX",         BIT(2)},
+	{"VDD",         BIT(3)},
+	{"VDD_CCX",     BIT(4)},
+	{"ACP",         BIT(5)},
+	{"VCN_0",       BIT(6)},
+	{"VCN_1",       BIT(7)},
+	{"ISP",         BIT(8)},
+	{"NBIO",        BIT(9)},
+	{"DF",          BIT(10)},
+	{"USB3_0",      BIT(11)},
+	{"USB3_1",      BIT(12)},
+	{"LAPIC",       BIT(13)},
+	{"USB3_2",      BIT(14)},
+	{"USB4_RT0",	BIT(15)},
+	{"USB4_RT1",	BIT(16)},
+	{"USB4_0",      BIT(17)},
+	{"USB4_1",      BIT(18)},
+	{"MPM",         BIT(19)},
+	{"JPEG_0",      BIT(20)},
+	{"JPEG_1",      BIT(21)},
+	{"IPU",         BIT(22)},
+	{"UMSCH",       BIT(23)},
+	{"VPE",         BIT(24)},
+	{}
+};
+
 static const struct amd_pmc_bit_map soc15_ip_blk[] = {
 	{"DISPLAY",	BIT(0)},
 	{"CPU",		BIT(1)},
@@ -170,7 +199,10 @@ static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
 		break;
 	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
 	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
-		dev->num_ips = 22;
+		if (boot_cpu_data.x86_model == 0x70)
+			dev->num_ips = 25;
+		else
+			dev->num_ips = 22;
 		dev->smu_msg = 0x938;
 		break;
 	}
@@ -338,9 +370,15 @@ static int smu_fw_info_show(struct seq_file *s, void *unused)
 
 	seq_puts(s, "\n=== Active time (in us) ===\n");
 	for (idx = 0 ; idx < dev->num_ips ; idx++) {
-		if (soc15_ip_blk[idx].bit_mask & dev->active_ips)
+		if (dev->cpu_id == PCI_DEVICE_ID_AMD_1AH_M20H_ROOT &&
+		    boot_cpu_data.x86_model == 0x70) {
+			if (soc15_ip_blk_v2[idx].bit_mask & dev->active_ips)
+				seq_printf(s, "%-8s : %lld\n", soc15_ip_blk_v2[idx].name,
+					   table.timecondition_notmet_lastcapture[idx]);
+		} else if (soc15_ip_blk[idx].bit_mask & dev->active_ips) {
 			seq_printf(s, "%-8s : %lld\n", soc15_ip_blk[idx].name,
 				   table.timecondition_notmet_lastcapture[idx]);
+		}
 	}
 
 	return 0;
-- 
2.34.1


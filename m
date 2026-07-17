Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011023.outbound.protection.outlook.com [52.101.57.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB2C3F8EA2;
	Fri, 17 Jul 2026 16:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784305387; cv=fail; b=ezFJRBSg4iFNk8Qv07k8HWuyX7+veukUTC0p2VHC+Zxc+D+R6poRH+IHfAF25OUBlJWIgTkyYkp6sCoJbpXlHzNZZhQJ5rYkEtrJrtU/ui9X/g50SfK5g7LYBzwsLz2PWieaCKkEpcIiQ1psgxmhHNBTjqoKYcllGfrKioRMiTA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784305387; c=relaxed/simple;
	bh=Ql2d3V39yLKZsvlPNajsX1+JWFYcSrO3RffUswZ55uY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dNobAxe2Ht4TxNhlwR/TjwJiemKt0iwerSOa3CMg6jZdfqQhCuPZo7IPI98AYaPL+BW448ZYgH9xIQW6a6Rixg43VH6nBjcuub/bVPhX4sQ35TN6RXW00UG/UVgYsNcMoP2CuWmPxkbAwo6K3a/Umk/xSDofXqGLBKdwK8tueQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WlPUg/AR; arc=fail smtp.client-ip=52.101.57.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WlPUg/AR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QlxiQcsN8MIL+e27mjgdLmjzY4K8SNF7xhrdqefpTnceyySYFNP+47kWsHW3quSEzUxadnp3rMVPdlkiWUpy43Jhzziuzb6xJ97+15WoJTaAYvHl5Hl1y96aVNAgbY43nXulUHyzhgXG8f9Cfl5BUdJ96VjSvv/MrjnyztYQ2yBqkEUAZuxTFgVzujkk0eb8SGVW2gGWMXIvscQJ1NuCuqOF7fCe+WDMEV4lCJr9gqgx7gM0vKFsduYMccbc9aBCi+j0ImyxY6N1INbP47yDPdjkHdAUgtqmTuibT48lbIiaKVOyI16ZWsYxKSTGV2BYbamjgtsoLwtSz9xmgfI7Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qrOOBXQod9g4/EfKv8a5bu+8QH6Lo6JN6dl3mm5jhdI=;
 b=x3kInZ6TNjQY/s/JgUCuFxT4kk0aJ0wEt6O8OyOua82UFdlNEQFbis5Xqon2S9msqJxwkVrRB9PXTMZTDgTpxujPXSDxfQTFoqL9R9LEC/NJ5jINcAjdt4EvDGzvKKxr+U42Ku13pqsanLSc1U6h09Nrp34fZrgJUnsWKUxucgDX1yCSBnmkcW5O5ndFSPdhwW7nGavae2PeRM4n94a0thE3NR6hHFVaABm7YYh5lnYkhu8G8LFhXyp5EOW0iET8u2wz98SR18qeuTqRshHVsXmdNdbCt3jkVnaeqekgSTG2Vg2Lw+nSn8qOKeOK9tPenbbFm9DY8ZO090ywLHPEbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qrOOBXQod9g4/EfKv8a5bu+8QH6Lo6JN6dl3mm5jhdI=;
 b=WlPUg/AR34ggxPM4zkX+z9XZOeeOdkeJcuXjJv0VOL78LDkH8EG3ppXTPGae17xUvSPbJVoksyZ4KzMfw/WHAL7Hb1dJ0iE8SzJEYAkFJdwvYAxat6IPshPSPs0izHX7pQoYfNTz6rsmr60Bw58ZdmxqxsWh46/GyoovNAzt3+c=
Received: from CH0PR07CA0006.namprd07.prod.outlook.com (2603:10b6:610:32::11)
 by MW4PR12MB7311.namprd12.prod.outlook.com (2603:10b6:303:227::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Fri, 17 Jul
 2026 16:22:59 +0000
Received: from DS3PEPF0000C380.namprd04.prod.outlook.com
 (2603:10b6:610:32:cafe::2a) by CH0PR07CA0006.outlook.office365.com
 (2603:10b6:610:32::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.13 via Frontend Transport; Fri,
 17 Jul 2026 16:22:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF0000C380.mail.protection.outlook.com (10.167.23.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Fri, 17 Jul 2026 16:22:57 +0000
Received: from ausmlimonci-lx1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 17 Jul
 2026 11:21:18 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Hans de Goede <hansg@kernel.org>, open list
	<linux-kernel@vger.kernel.org>, "open list:X86 PLATFORM DRIVERS"
	<platform-driver-x86@vger.kernel.org>, Mario Limonciello
	<mario.limonciello@amd.com>
Subject: [PATCH 4/4] platform/x86/amd/pmc: Validate S2D physical address before ioremap
Date: Fri, 17 Jul 2026 11:20:23 -0500
Message-ID: <20260717162023.956346-5-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717162023.956346-1-mario.limonciello@amd.com>
References: <20260717162023.956346-1-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C380:EE_|MW4PR12MB7311:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b6f134a-469e-43e1-d0d1-08dee41fa9eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|23010399003|36860700016|10067099003|22082099003|18002099003|6133799003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	kp40qmOwuGwvKE1VllYqhzUYwb+yXMGhPHwsfiTZxpkHJ28QJvtDwqUuERlBcVzZJyJVKUi5dgp0LVLBb5Wu7pldaysKpvCg849ja+ioafdv5gpbvtAbz7zyjd+3LkRG9yLsgK8nyTxzbTzPqPg/THdGaiDRUQaXZjuNXbQEXt6QkZX1iO7rF4+51RI3yQz/iYYtrYn1kvifQIJ92vnvGJULA2LxI+5LO1ay+8oWNyqjcmVqqUoakHzS9WR7W72GBNaBDofK3VmaU+h+FFmaFvrIQjN/CApxrpq4wQVPnQGXCNBVJkv0+nqGf1Ae+BMV3AB6/XRi+bimakSQ/wPqVfzYBgcbmtsJ83ewSMOFHw8yTfVF63NQrMMXdkFi7eqinSR4BjvznkF4pXTYtE1lIna220MQkIPzBQvZPXyh3Ei0nvdlEEiugFdNEP9+sHRcZibAf+Ku9spoaYwz+3xne0GlTCI0/egZKqWyw0kA3Rg94HmP92lzg2yf4jNif65Jqjqm0b0hKgk7l8ZYN4fIC1vt53/CXBm5YS4YqqJG/Q/CFkp64XTW6WYuoBp4E2xbw8jW5ArmbH5LdIwa+VTG9b0rG6ZZyuPQXwRr8Mr+1jp1Pjk0Y253PASlCnC4WXMM6+Vespekof49c0ZQFWJMho5YKhNtyqM69KzldWGbQ3N3CcFTKII9LyvCT/lu2XdrV2Yg/sA7y37R9dixdF4fzw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(10067099003)(22082099003)(18002099003)(6133799003)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4agAZvv4rhUULgqo+5G53yN8HZiZicw7syc0f6SOfwBDyPV1U3jYrT+fQxEUHD+NxuED+UOLeym6pHwaQW2shs/OVTjgc3siNq0r3JzpXYRN52teUHL7R8XhhgHI8TMT5ugkD7+k+45+a8S/msyiJu/nWDQGmaaBzaNH76lPZF1PtXCTSO/5icsc0HJD+yUWOJxeBcvksR1+Krz/lC9yLDZFmYc0lnEV6O0o48UYGGCA3G+QGhIIotYRc9n8AQ5iOXEe2M1dxj3xvvqCJMo24S1okf92e5OZ3RxrQrMJlzNSjgeQxb0HgnOmuqVv4sUcjscWRQ4eh13qc66TezifB/SUMufnP48auArrr9WMz8xfEA31pB06V3ShATdLhpz8vlCnkKiYWegYTFaejIewyl7RtlFByIusq9YsdH+RTSq/dxBAy/jgo9TR1qcSl/gM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 16:22:57.8306
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b6f134a-469e-43e1-d0d1-08dee41fa9eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C380.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7311

amd_stb_s2d_init() retrieves the S2D telemetry buffer's physical address
via two SMU commands (low and high 32 bits) but does not check their
return values.  On some platforms the SMU refuses these commands
(observed: "SMU cmd failed. err: 0xff") and the phys_addr_low/high
output parameters are left uninitialized at zero.

The driver then attempts devm_ioremap(dev, 0x0, 16 MB), which trips the
ioremap-on-RAM warning and fails:

  amd_pmc AMDI000B:00: SMU cmd failed. err: 0xff
  ioremap on RAM at 0x0000000000000000 - 0x0000000000ffffff
  WARNING: CPU: 13 PID: 4592 at arch/x86/mm/ioremap.c:216
   __ioremap_caller+0xfc/0x3b0
   devm_ioremap+0x5a/0xb0
   amd_stb_s2d_init+0x239/0x280 [amd_pmc]
  amd_pmc AMDI000B:00: STB initialization failed (-12), continuing...

Probe completes successfully but the kernel is tainted by the WARN.

Check both physical-address command return codes and reject a zero
address before attempting the ioremap.

Assisted-by: Claude:opus
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd/pmc/mp1_stb.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/mp1_stb.c b/drivers/platform/x86/amd/pmc/mp1_stb.c
index 6a048cb2605ec..a507444a945ae 100644
--- a/drivers/platform/x86/amd/pmc/mp1_stb.c
+++ b/drivers/platform/x86/amd/pmc/mp1_stb.c
@@ -320,10 +320,21 @@ int amd_stb_s2d_init(struct amd_pmc_dev *dev)
 		dev->dram_size = S2D_TELEMETRY_DRAMBYTES_MAX;
 
 	/* Get STB DRAM address */
-	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, dev->stb_arg.s2d_msg_id, true);
-	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, dev->stb_arg.s2d_msg_id, true);
+	ret = amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low,
+			       dev->stb_arg.s2d_msg_id, true);
+	if (ret)
+		goto out;
+	ret = amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi,
+			       dev->stb_arg.s2d_msg_id, true);
+	if (ret)
+		goto out;
 
 	stb_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
+	if (!stb_phys_addr) {
+		dev_err(dev->dev, "S2D phys addr query returned invalid address\n");
+		ret = -ENXIO;
+		goto out;
+	}
 
 	dev->stb_virt_addr = devm_ioremap(dev->dev, stb_phys_addr, dev->dram_size);
 	if (!dev->stb_virt_addr)
-- 
2.43.0


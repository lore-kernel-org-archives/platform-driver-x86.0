Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012013.outbound.protection.outlook.com [52.101.53.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5D5343D72
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 19:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779304341; cv=fail; b=nleASbOVzet++M0BFgKABbPgL3WslRyiU56eiUiUVw/5HXgLksjDIc/rdbz2GT1179W5PotvE/B9wCTrWylB6yLbNOqWPTfj827O1Jf+Ysg4lPUHmmjDZKk1iS2ZQie+o9IjSQAW0RZjZdijaULHjOJ9NMwlj/ETzuBpky8gEU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779304341; c=relaxed/simple;
	bh=8IV6lOSV0/J/xeL+BJeLMKjklEf0za188qzQKEr4yok=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ir0stHnV46A+eDhW4kNfCqwBELV5RS9elMOYofmZx3GnjUw0ebzb8KdvtTBtJ1bxYIZdYhi8kYz/CaUPjtbv5FWK/LqeHe8sh7yJsRKkm8XoUoPKPPWdxnZN3wZ8jsxKHDTL3uUVpymSRbkmEc2QDv9N+UD+dHq8SO/9HC/HwWE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Q8kkWvl2; arc=fail smtp.client-ip=52.101.53.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Q8kkWvl2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q/eLi5sp2E1hDRo0oImKHeWeMJLvWhoO2CIuejEzRDoECjc/RFWCD2o8CrDHloSDmMb+8N6sWPgqJ/Ga9YHkLu5k/30d8mVur8QnEMltCpzN2M4MrGKoJrWF2pNtZCEhPrPJ0JUZwA+q7W5uc9cBLmj5Uy7ehVBn/4S88Lbscb7TUQ+b1zjmyvRUUGw0n+AKTE2a2Bpzltc5rnJFNgLmB9NetEhXpE0i38Hy1nPeIT4M663hMBLEIq53jh05dqGAdxYy3TyFd9/P8DuaUeeaXXzwWUUlHfOrs8Q5yk7D8hkNOqrFEP/lh+B3PRVn0RNmjnI/6s2VRJloleKelfIKJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vahSaq8AsjnWl9XNwUissdCCzO8mzj4mTA6ZDHBj5EA=;
 b=eYLYe9CmkClNPLsDf3BCo7Wjaw3pt8CeBJAUpZvSJUEYeGnbHWNlPua5JIILpiUmEob6oL3gJ6E3Z5EhZZ8E/QEcyLbJrc9Tm/vwgmDJrFpTCtn9e7p+K1NPe76uGmL5rVP3OErdrWprZoEYI5E2ATRGZP9N9szF52Y8h/W1TRMdWFfWehNBIVVucT5sz67lDQKPzCW2rnpX6SLQOnQSh+wASFmem9Inn2xK8yh2z1L/XKOogEZtADHNQsE32gXAyclL606MpSdu9bPBI3cOXIza62Bj5ly/nPw5AbDulpmKNKj+gqjm38LWadtZXafTFoIFrRG+xfxR9s/5VlPOqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vahSaq8AsjnWl9XNwUissdCCzO8mzj4mTA6ZDHBj5EA=;
 b=Q8kkWvl2HjqJXuDb3HON7tMkMpbsUmBBZJcUeTBvy2qPBeenXSubZu7oJIYK3ZE2Wo7KvOxDn8pkrRysqmSRJcQTTf3zQrZC30gQ+eMcC1qzASyuounIErkFXONea/PKjfcZbJicw9KKfB6BX8pcRPsUXqV8AmwwEooqVxRYjvE=
Received: from CH2PR16CA0023.namprd16.prod.outlook.com (2603:10b6:610:50::33)
 by PH8PR12MB7181.namprd12.prod.outlook.com (2603:10b6:510:22a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.20; Wed, 20 May
 2026 19:12:15 +0000
Received: from CH1PEPF0000AD7A.namprd04.prod.outlook.com
 (2603:10b6:610:50:cafe::49) by CH2PR16CA0023.outlook.office365.com
 (2603:10b6:610:50::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 19:12:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD7A.mail.protection.outlook.com (10.167.244.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 19:12:15 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 20 May
 2026 14:12:12 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 1/5] platform/x86/amd/pmc: Add ACPI ID AMDI000C for AMD 1Ah Family SoC
Date: Thu, 21 May 2026 00:41:45 +0530
Message-ID: <20260520191149.773196-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260520191149.773196-1-Shyam-sundar.S-k@amd.com>
References: <20260520191149.773196-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7A:EE_|PH8PR12MB7181:EE_
X-MS-Office365-Filtering-Correlation-Id: e300627c-5f40-4249-db0e-08deb6a3b419
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|11063799006|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	s2HcolvcBqQu2TJp160H+x5fd3tfSeg9OZVXkzZN0xLhPArem4MCZaWFtcmhQxmA5d56GHVTvGfrNDnng0qwWrZiv5mTiBcPC2q9nHQk44VrxjiFdVqcM3ZlUz8tBXisjBuyiOfaY55vIf7S7lZOV0PsRRvGgBeR4lK7/r4MO17aix8AzyectwYLiuPacw17V5VQ7SJG2GIfJW2gnALAOq0doxRCHm9W4owYD3fOydO5Zb5ACnyIQkJ+a4gdgoWN8IOYE4RA80sAjfp8jI/NGhLWcDBLTDk4vxKXTyIZpgymmh3tKR+ZkW++Kh/U3gzFf84Z38bQga/UZGgFk4SOANqRBWQlnTgvQOhlzrl90teVWNiUaZNZT0DEQEtz+o00i8J6hyw0E99O05KNGALYcyydZUe5OvVjS0y0tvuJErYttR4Be5D6a82iz+BDN2eYqU1W62+asFJh4+2e9WlIITRIRNMOxNQcF/R5A/lmtPzY0y8tN/lyPWGRrUSwOtvKYxJYR7HxkNk+vOAs0kNAMXJPNBMd+QsDUMnzvuPXe2L3+IjIgCw3kRytGlL7wA7klb57cyQKMtajBGdjSiiW//qoObOGx52sgXrreV6odZTbG/c3MXEuaUr0luvQt2vaaAqFPa3MK7DnyONgCa5RdncxJyXPMixKKGqJFHJ4GnCR78VG8xLdbJa/TpfvSDKWcoQY1DY6OBOeSMGJuyUu1zskHTc2UvYnnKNWaem7npo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(11063799006)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	y7gqy+FssLxXH7naWncVsdoLxEtK7IU8O//CMN3Hq3Q4WLSm+xvH7rI0noWG07vRTZrEqlafkQKcvm8miyUARYlEymJPph4EbDxlUqEZWFw5LULSIIHuLxGn4tsbxyf2FRhksM53n8Hh14Q70IH2G3bmAphf/NQKIatyaOcHeWKsj+UL4BNjK9EvvPsKMtFuNQYmEb8ENPIjwokTnrc5ExplPU313oJ+1AF0z96mJF0IuBlPBK++voUlht7IVvVQ5hO8cUQW7Fk083kGK4/OOsDEkAXXgS4WBaZ1xi5QLFfhDXIAyq5e8Y6gCaUFwO7ZPqwcvbZC+p5l3sfx+EhRLXopqhWG1/Z8XwLUQFfXV+BVACa7AuyRn8T/OWt1OODHJmeq69T88ghE4nfQ98abqWY7pXkof18SKu3kF3xiiV5YzZclJaJSkc3B1JXRBoqV
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 19:12:15.0141
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e300627c-5f40-4249-db0e-08deb6a3b419
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7181

Add support for the AMD 1Ah Family 80h SoC by adding the ACPI ID
AMDI000C and PCI Device ID 0x115b to the amd-pmc driver.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 2 ++
 drivers/platform/x86/amd/pmc/pmc.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index cae3fcafd4d7..7200f19088fe 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -722,6 +722,7 @@ static const struct pci_device_id pmc_pci_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_VG) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_1AH_M20H_ROOT) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_1AH_M60H_ROOT) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_1AH_M80H_ROOT) },
 	{ }
 };
 
@@ -825,6 +826,7 @@ static const struct acpi_device_id amd_pmc_acpi_ids[] = {
 	{"AMDI0009", 0},
 	{"AMDI000A", 0},
 	{"AMDI000B", 0},
+	{"AMDI000C", 0},
 	{"AMD0004", 0},
 	{"AMD0005", 0},
 	{ }
diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
index fe3f53eb5955..969b62162470 100644
--- a/drivers/platform/x86/amd/pmc/pmc.h
+++ b/drivers/platform/x86/amd/pmc/pmc.h
@@ -165,6 +165,7 @@ void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
 #define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT 0x1507
 #define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT 0x1122
 #define PCI_DEVICE_ID_AMD_MP2_STB	0x172c
+#define PCI_DEVICE_ID_AMD_1AH_M80H_ROOT	0x115b
 
 int amd_stb_s2d_init(struct amd_pmc_dev *dev);
 int amd_stb_read(struct amd_pmc_dev *dev, u32 *buf);
-- 
2.34.1


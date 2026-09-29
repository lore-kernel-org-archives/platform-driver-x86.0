Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010004.outbound.protection.outlook.com [52.101.46.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4763D47DA
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 15:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790697234; cv=fail; b=ntazDkNTToWD0hmGPJ6C2pSsG08QQnPvx8H2Puhj2tRqFXrgFVjY3EvuH8avyJQL1yKPg/KvI0KCIKb5AU6tnvdqfTuT8fsSFGxEsangF4nvGa1nXlWEz/C8zj2FusGOZOrEKWZtSq9W85+dzdy4CmczaxMgwGAkHOqRBzDjJDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790697234; c=relaxed/simple;
	bh=XaxmRUaBhvfO+myPXXsZEc5TRPRUdAlhiGdtvX/Af0o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LLlWtYr6gaNmAhF8aAih7vQgD/e1J3WEkL9p9vBEVDDEDTpEA54Sw38KzPsfSX/i/9Ah4xzQDCW82JS7+xtLfbAaX6WaEHMylSmHXE3NdTHWRUgE04CjDbjuhpJKkPAb07HcpcfBO09OXA9wPAO2ORCPb1nAidTTQUMLjNsJSX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5QyBqWTt; arc=fail smtp.client-ip=52.101.46.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5QyBqWTt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AUOIPAdLkzn0K2qiNrUIbkkfKlLJIMk8vbsY7SVqmq29M0wnM+nDHqj4Or+dQ9AR26RA6AA+WTqzdm7JUUAzk8j9l/kZ1KJMutjDVcplTOM3h7VEb7+zmL75y9ZTAeWY3/b4nz5z/fOd4W6uo/ZlcxhdJxNg2hSGEnRjgOi1BQVboObN1yisLXtzYKWQVgY66ggCptlgQmaByJBr1wDmJmNc+Lfq4URwBUSfcaHy4MbpJdrA8Wvf4GVYfho7mVqoEkCbSLBgg+cZomiFQ0lL5mf5UGGPX8cJtuVAbx2qq7Hh1S4RyTwHoNFIjUKyH4x1G5N5Nud15zespclwaccxHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7pMwbRshQ91XL4qd59iE72HN09MNkBDkvEDPDs/FCQQ=;
 b=m7lqBmvdCUffWaf7M9WgKi8UFRTMpWTtIiCdkooGic1WZXBpDn0BCzoMgPWfBbPyDYw8IpOgouF3BpS10oNjXltdvDm69+468gC5DsKnKpbAVc4k0ScxY4zaMha7ciK22PzNRCACFmWTDwTGT4hzg8WZ5a8Tf21izRGIVYFhskqQyHZAiMNCmG3ReN1eRrgCDQcGjhDutWVOigcKBUwNoXNq2W9VTfjS8gkdCkVrxVwU12meFi9Rpak+EECAMcV3/xGqBbENgtoXIAwadcOQTztMHJAfvsQQ5Sw+0Nxnq3X4Y7aYoXDEb7bmey/ddoCXXCBFYt6Bu03VoJDvqRzCKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7pMwbRshQ91XL4qd59iE72HN09MNkBDkvEDPDs/FCQQ=;
 b=5QyBqWTtFu1BsRswjsKzI9zvyr7O0jdHvhNg9YAxUKAnPIIsBocSrbq3QjJk/jWzll9LKtd8YqPyHTCTlFcvIKnY5SBlOitaj09ivrcpAqnFkQGIZSgOGXPAPlQWAD1tfhX+Inyskx78hMfElJiUN1SPDxCcQ82rKImnlVrZ0VY=
Received: from BN0PR10CA0020.namprd10.prod.outlook.com (2603:10b6:408:143::11)
 by PH0PR12MB7815.namprd12.prod.outlook.com (2603:10b6:510:28a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 15:53:47 +0000
Received: from BN7PEPF000000A4.namprd05.prod.outlook.com
 (2603:10b6:408:143:cafe::99) by BN0PR10CA0020.outlook.office365.com
 (2603:10b6:408:143::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Tue,
 29 Sep 2026 15:53:46 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN7PEPF000000A4.mail.protection.outlook.com (10.167.245.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 15:53:46 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 29 Sep
 2026 10:53:44 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH] platform/x86/amd/pmc: Add PMC driver support for AMD 1Ah Family DCh SoC
Date: Tue, 29 Sep 2026 21:23:17 +0530
Message-ID: <20260929155317.1710272-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A4:EE_|PH0PR12MB7815:EE_
X-MS-Office365-Filtering-Correlation-Id: a63502fa-c2f9-4e20-769b-08df1e41d8aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|23010399003|36860700016|18002099003|6133799003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	kfSleMMi0jafZ2e6olybbze3OXXhbA9oaCfq5v8PT1838t+nkIpdvjq2q4+kPkBeKQ2t4Ge0PeWnF26NOsmhYpzJAfJ41fTmG/lrj57g3g4n6gAJXW/ye3p9WkVoNgX/k2cPuFJKjlOahXkuuPSN2+cFi3BwfJEku069hE01JYUdkWR1iuVE+/jWgewfh484p9M2dBY8YbD3uSQLEXPvWlNI5KQiUzulTcaCvvuQcuTxuLpatKqAhJKjyCtPNXSuZz17NzC8+gCJK4pf2dWIJ/m2LUY0oHCADv2BE6hBVo926bcO7pbf4nz45oQVHS0xlOE8ubLLAhdIT8r1JzaasOBWk10uptfMDxOxV1ezhJuX8mdtCXCAThAjJsTFgDxyPZ/4TlDZLUauRJSS+irciiRDCaU66pZQudV1ZpOOO/SKYvfLC4/mS8htIxjKP6HMgJmV2i57KMkNuaLvtfCqimGBqPseT6CflxiZWcvi7XcB7nORVpP8412ncm6AKX6+QhYG7u5igbliI2WSeMU03/0jW9Fu2kAVa3QxUNS1/uzOmYf4so7Ucz8cn7+5tmkft1lczGFtv5P98xeokmBy1xqTUmpSY0XOVLqV9TqDgrsN04AvFfRYZcjkMN1b9gyU53gBABvkDEe5Dnfwxnhl7I53od5fPUQUpVnxnpSc6q9eNsaNf8Tca8xzu2Mc7ZlmcbsiPprqYx6lTrkC92hPrw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(18002099003)(6133799003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	33IKF0TVhf7ecUZf6vST45BLOF/CyvSOu7Bk2Jsz76o9av4HDDuKRCNuiIcFgmXOeWHUXdUOD2bNfTK3NyQf1XBOrW+lXl0/iiezoA/7ug9mY4KdGXSO1vtjhTcQ9lsZsTeLqItMvNlBNInu/RR5JaIyU99HHTGQyOznIfgu4aY/8TORSauIg/EvBMDlPXSkIjV/M36tKnAWsl2PeB0jLBHQF45DvsvzlQm9znGjPt1oJg/FQOmzpbdfevo1sW5yfwbCwnAkw+2Xc+Hti8vQgicEeXNjefL0c0Z7vLEJY9OTcn/5W8BnG+A6T1N6whzYI/Rp5apBvaJnkGlm5cAodgd8qh1o55/IwXTuQzqdqhKNrKfwzh4Qwi7z3nL7LQL2b19mnn4daibGItffNMjXb7HfD4RFVgNN4/AHEVyPp6evTFXolhUW65edmhpV5NFg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 15:53:46.6227
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a63502fa-c2f9-4e20-769b-08df1e41d8aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7815

Add the PCI root complex device ID (0x1b20) for AMD Family 1Ah model DCh
to the PMC driver. This new model shares the same PMC configuration as
the existing Family 1Ah model 80h, so reuse amd_1ah_m80_cpu_info for the
device data.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 1 +
 drivers/platform/x86/amd/pmc/pmc.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index e384b56d6755..7ccc2caa0f2c 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -199,6 +199,7 @@ static const struct pci_device_id pmc_pci_ids[] = {
 	{ PCI_DEVICE_DATA(AMD, 1AH_M20H_ROOT, NULL) },
 	{ PCI_DEVICE_DATA(AMD, 1AH_M60H_ROOT, NULL) },
 	{ PCI_DEVICE_DATA(AMD, 1AH_M80H_ROOT, &amd_1ah_m80_cpu_info) },
+	{ PCI_DEVICE_DATA(AMD, 1AH_MDCH_ROOT, &amd_1ah_m80_cpu_info) },
 	{ }
 };
 
diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
index 6973a639d7e3..4633abf2cca1 100644
--- a/drivers/platform/x86/amd/pmc/pmc.h
+++ b/drivers/platform/x86/amd/pmc/pmc.h
@@ -194,6 +194,7 @@ void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
 #define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT		0x1507
 #define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT		0x1122
 #define PCI_DEVICE_ID_AMD_1AH_M80H_ROOT		0x115b
+#define PCI_DEVICE_ID_AMD_1AH_MDCH_ROOT		0x1b20
 #define PCI_DEVICE_ID_AMD_MP2_STB		0x172c
 
 int amd_stb_s2d_init(struct amd_pmc_dev *dev);
-- 
2.34.1


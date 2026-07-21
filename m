Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012017.outbound.protection.outlook.com [40.107.200.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEB246DFFD;
	Tue, 21 Jul 2026 18:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784657901; cv=fail; b=f9yg7xTwl8El+mn0TLVXdIunpjKsnhzUZtQx9orzif7K7k7eVUwjeEapGBoAQNuvfESZDIaqMkqIp0BHRVM6I1lgn9qkAk4VH2Rnidv7wxKc1vpJ8gr4hxMPr7lg5eYQZAK2rXLN3E7uRwbcD75O1QMsQxsbYhIkDH8p4SiJRWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784657901; c=relaxed/simple;
	bh=sd9bLmUH6pu4zQpbTm0vasXHPzIj3cL9/yHrSo3Rj5M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mAZl1s5rOScu76yCTUYEVPakHxyMgjRfYw2cQQwIKzXd91iUBDj/5JhGBI7Jxc0zFwcbi0RCtKWfOlF/rE3WJKQNi7yfKFqDOIqj3Q6Q6bB4yG4vXpDiTMv5IEhQ8FYfCJSmplsWMalEC1PLGd+b0jbnox5lD/LypyoCGek8NEo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PI3bXBdr; arc=fail smtp.client-ip=40.107.200.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="PI3bXBdr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=liK+tsDtnA9RBEGe3D8T01QTytCEPVvCvlgZWKrqKcLQFjPpmMfMmK+qCf8P+MdRCw/KMphSRLjs/5FsUW+zXLHkFfuTMhqTeOdWQHbO+Vfx97mEmD3WMyqY7bjYdTw22jNLE7XpCS6bdJvAYGmMJMKRTiwyCESO7o9+ouBign7LtH5PN3u7yfZSzki6t1giD6zvu8SFe1x2xdiRuwGt2B99S6rFvk7nUH9yDqyupWL5dopTMdGDrHVeFj0G2RGgtgQXxYTwU0/NsyQQrKTE8Rk8mUJJdRnZGHBw+thZxpUEsdjNinpCTDiyE3LtlD6x+XObNfu6sGRX4NgOeYrTcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LoRbboKruU5jV7hDJ23Ht72OMQDuq851jPtBBXhdEWM=;
 b=sW4CXZyPE0soXle88NmoMtVId/ZQh09KvI0Lq9AH76sV561eTFaPEiJo6zdpet0iTAN5zQYEIX3L6Q00/NJrlt/6FAWqutIjYx24ZSNx+APeIW4SGJ7vrpo++Gj4LEDQ8DBQnLTqoogEJJLSQT06M5PNuNiFxieI7SO8G2NOpYBm11La/67b0rGhAnr3vUU9A/zNuxgKnVaIu+iG15WYEfa/YVNX5fOrecTwc4RSYxOfxxi4hhoey4LZgR2DF7xfIxmjaCDCqsY2WwysyyRCgY41MapsnsT92Eht0y3a1QWGo4xDLcazfEO9wi7LZSnQ9xhmRPxnzxTNza74569ZXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LoRbboKruU5jV7hDJ23Ht72OMQDuq851jPtBBXhdEWM=;
 b=PI3bXBdrP6N5f6yvO6fXAteFuqGQd3JvNL0JqPj0/mUa8I0dDYtl22Kie3UI8IJVqkKJrSJMwgTtn8KT5LEBnixz4i8kmSl4ZOkyYDB8MYd/7MOxD8K0fmIw7GUXx4LfaVov+ApVDOnvhJaiX72OyOHRDZvuhURzaTK4OVxKpXI=
Received: from SJ0PR03CA0272.namprd03.prod.outlook.com (2603:10b6:a03:39e::7)
 by SJ0PR12MB8165.namprd12.prod.outlook.com (2603:10b6:a03:4e4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 18:18:16 +0000
Received: from MWH0EPF000C6189.namprd02.prod.outlook.com
 (2603:10b6:a03:39e:cafe::5b) by SJ0PR03CA0272.outlook.office365.com
 (2603:10b6:a03:39e::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 18:18:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C6189.mail.protection.outlook.com (10.167.249.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 18:18:15 +0000
Received: from aus0006770c4n-lx01.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.41; Tue, 21 Jul 2026 13:18:06 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Hans de Goede <hansg@kernel.org>, open list
	<linux-kernel@vger.kernel.org>, "open list:X86 PLATFORM DRIVERS"
	<platform-driver-x86@vger.kernel.org>, Mario Limonciello
	<mario.limonciello@amd.com>
Subject: [PATCH v2 4/6] platform/x86/amd/pmc: Only expose stb_read after telemetry buffer is mapped
Date: Tue, 21 Jul 2026 13:17:54 -0500
Message-ID: <20260721181756.143084-5-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721181756.143084-1-mario.limonciello@amd.com>
References: <20260721181756.143084-1-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6189:EE_|SJ0PR12MB8165:EE_
X-MS-Office365-Filtering-Correlation-Id: bc8256ff-d5c1-49b3-b79e-08dee7546edc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|23010399003|82310400026|56012099006|11063799006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	mJpQznGQJqf6lgwHHGlB4v+NoNyvsutjkSyCTUcT74bU9+irL1V9pUBfmzlylOesc9z6zwt+PysMGrj0EJ6/JLEBJjFH2KCF8/pFzanRK+HE4W5kLVckjl1EnV3P+A3PutpcpEfsPzxv8JmzVwHaDMfq1UNON4SHbHN3wXZKkcfpNHLqjA7KyO8XT5l5e9hwbP6Dbv20r5LcXMG1PDK88kAXZyeE+0JBuiNGWZwfwjy0x6F39FVkIE/xHFFT5ojQzfUOVau/Pc5bNqo5i1Lpqi7MvOMUZn1wGg/YMMtOUUkvixcMQkXcIzXVaINZCRcipKF/OFNZ7fCP1sqQ+l2VyjCESdYlW7JTSNIuF8MqGUpb/icPjqzY56e85htFWV3QC6k+dLFUbXwT7BkPhlhciKeO4UWD2TUYpRifg8eTQTUory7INU8VGE1s9yLsqt0EvVp1fC9eHvswkvMj/3qSG5SVDBOF9P+fvvQarFl2yH/pcvAAgnkX4mGjUC96aHKguRTqg6ABV1o/wDYu7otNj/4O0lRFIhPn2DKKJgKYW7CRLOh2QoPTok2Th2m1SJfx1XdY9yBj96DPaKzGQDYA+/tWNllxNZuraUAfsoEYBxHet+X3Ajl9p6cQvmhkp2WiGPCIDbEFfKtpoZoRA87rlCYXs/doFIIZ5wa0aV/txjhibipTBWD7CvnSN8TFPlHvC5NfEYIYiIBoZugBx1DGwg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(23010399003)(82310400026)(56012099006)(11063799006)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	X6AAnEGqcQ/rdKAhI0/sOgWiE9Cs6r/AB6F0BqNObAu7AQaE8OYGzgD8TIhGBWlOYVrKzXyvFkvS5dJ3XGnQ74t3jEDcEABhgq1ho8KZqmciL6hDGY6YMEnOotEIxiHWqGkwEwKEbX0+pP+fN9fmaRb6ZNwHuzys4/RbKXhDWt80KhgNLAngSQBJRWPkYFgfqpkbTiMgttfDaZF7nUhZWE7Boggq9inF6fhzvS47LNiyqeozEY8OvdnUjn9+PHB+T0shOp86Rw/BnKU2Fok+Z/JDBiGrHTtfx/vFSUPP5Sx5KUfENXAf8KOXk/rHgjxLIFtJq4XWHJnPNoS/b6I9cZ3cJm9dvS9kbAy7tN2PEK7KjBsgcIOuuELjnJYu9zVCdQknggqiUV7CCGyXhQZQo54no8FFIy1QqeGvaPDffOUWpEnmv/ygjQ51RmSCaAHC
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 18:18:15.5072
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc8256ff-d5c1-49b3-b79e-08dee7546edc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6189.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8165

amd_stb_s2d_init() creates the v2 "stb_read" debugfs node before mapping
the telemetry buffer into dev->stb_virt_addr, leaving a window during probe
where a read faults on a NULL dev->stb_virt_addr in
amd_stb_debugfs_open_v2()/amd_stb_handle_efr().

This becomes trivial to hit once a failed STB init no longer aborts probe
(next patch), which leaves the node registered with a NULL buffer.  Create
it only after dev->stb_virt_addr is mapped.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd/pmc/mp1_stb.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/mp1_stb.c b/drivers/platform/x86/amd/pmc/mp1_stb.c
index 1ec0e599df7f3..8a33e75b71c34 100644
--- a/drivers/platform/x86/amd/pmc/mp1_stb.c
+++ b/drivers/platform/x86/amd/pmc/mp1_stb.c
@@ -299,10 +299,7 @@ int amd_stb_s2d_init(struct amd_pmc_dev *dev)
 	if (!enable_stb)
 		return 0;
 
-	if (amd_is_stb_supported(dev)) {
-		debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
-				    &amd_stb_debugfs_fops_v2);
-	} else {
+	if (!amd_is_stb_supported(dev)) {
 		debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
 				    &amd_stb_debugfs_fops);
 		return 0;
@@ -342,8 +339,18 @@ int amd_stb_s2d_init(struct amd_pmc_dev *dev)
 	}
 
 	dev->stb_virt_addr = devm_ioremap(dev->dev, stb_phys_addr, dev->dram_size);
-	if (!dev->stb_virt_addr)
+	if (!dev->stb_virt_addr) {
 		ret = -ENOMEM;
+		goto out;
+	}
+
+	/*
+	 * Only expose stb_read once the buffer is mapped; otherwise a read
+	 * faults on a NULL dev->stb_virt_addr, now that a failed STB init no
+	 * longer aborts probe.
+	 */
+	debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
+			    &amd_stb_debugfs_fops_v2);
 
 out:
 	/* Restore the default message port for subsequent SMU operations */
-- 
2.43.0


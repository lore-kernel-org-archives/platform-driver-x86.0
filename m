Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012056.outbound.protection.outlook.com [40.107.200.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C814307B8;
	Fri, 10 Jul 2026 14:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783694836; cv=fail; b=e5uVjjmmLBZeK0nFR5L7A+iAJ/BRWGeDkc3CkoTuNl4eIwOYczGQMsEfXr41B40ELKuDlDxw3GQYBv6jFgxLV6eDU0sAJgbWHrOviBgdW0vsu5gWM/a+DuRW3NO4fe2HEDtkfoK5NF8CEB4vajVIm6L/El9xVivTuasI/2YxESw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783694836; c=relaxed/simple;
	bh=9KWKZzZGuWBWH/h+cSYBAWf9dJ/sAcuRy03LTHEJMqk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p1chtLlPS03pL8/Hq/5g95M30vi5Bv9yj6SjA1hzRzg28UrF8hJoanjqcF+ffIMeL+4UCkzR7TN7Hct/FVkFCZN/GCJinEwd3D2H4Tyv7Z17q4sqRkvVPpODo45VAiswhcXEvIZI8ZKLcsc7jwG4vqZ4yGIXdY73yuUgbW5bnJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=VnXunbkC; arc=fail smtp.client-ip=40.107.200.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="VnXunbkC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iGryEeKymxsknyEfNw/Br2r7O81I4pY3lKUPZzCweGlYBBWvC35ewRFTPSesnISj40JXNnP2Sm9Bh8wlVWGdkVh1cshOqB8gYEuBaTmYqoAv5hRJAnKn8SNpxvBPPOXtyr8ZsCZzyAHAqagl+XoDHzZzpMk3TEwbmp2AE4xOLf/RSpSKV3dniDm82xNOx6NVgkLrs86u+8AP2kXV5t3DmFB9AkubQI7xUvTso/onnB7LwLmxVTJfNxea8x10vzkOYJjtAiKRJHrJhCEo4XN+vh4g4O1XdupVDEvkFbuqpu+P/cqdyTUbrUVPN6mMYRMPrY/EUa0j/c26QWmK1l/NXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FyWGPWrrB9mFsyaDZ9ijrgy5YkVtj1mSwJzz5noEpz4=;
 b=cJwjLwYHjU/GZX5z4y0QUfLrAdq+SAMcMv9g/Xb+d2DQ4QM7OeeV6wq4k9VNLIFnJoXg4t59hlWf4H56GYcejqIeEpC9sM4DMum2s8AwPaieC2gd89DtfPTPHbg78KPxZtKO1pMKUpmq73s83BJPx97p91v1N6DYi79/mdW6aOGQfmsanEqM6kjXBPGuUaBuOS//fRKjRlG2wRm6R1ehVndMpPSa/tyowfU57g9tJAhzbhdIj9Byt3R+Lu4n4L/IAJrusYmlZA4djWD6lf0CX3bBBHody9AHzbxhgxJ67aiv10nV1A+QdeEM0bQrDtjvgBaueFLZ9JgOhiiNAPdX4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FyWGPWrrB9mFsyaDZ9ijrgy5YkVtj1mSwJzz5noEpz4=;
 b=VnXunbkCqOtjQXL9O6Arbp1ug9lNgaGEGDfS5gm4gzfjnLMKEW565e9cGPoRrfhNVlZ39NMlOdguPfD3NO19BnKn/gUoEYvd9lt/mdM4C+gFE/nxrQPaJ1mk0fmZusWY1q7O9r0pn2PBCxHvLDVpTlfdv36LlxW9YyDdU3269mA=
Received: from BN0PR02CA0009.namprd02.prod.outlook.com (2603:10b6:408:e4::14)
 by SJ2PR12MB8182.namprd12.prod.outlook.com (2603:10b6:a03:4fd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.18; Fri, 10 Jul
 2026 14:47:08 +0000
Received: from BL6PEPF0001AB71.namprd02.prod.outlook.com
 (2603:10b6:408:e4:cafe::58) by BN0PR02CA0009.outlook.office365.com
 (2603:10b6:408:e4::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.13 via Frontend Transport; Fri,
 10 Jul 2026 14:47:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB71.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 14:47:08 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 10 Jul
 2026 09:46:57 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<muthusamy.ramalingam@amd.com>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v5 4/6] platform/x86/amd/hsmp: Clear mdev.this_device on deregister
Date: Fri, 10 Jul 2026 20:16:31 +0530
Message-ID: <20260710144633.879018-5-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260710144633.879018-1-muralidhara.mk@amd.com>
References: <20260710144633.879018-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB71:EE_|SJ2PR12MB8182:EE_
X-MS-Office365-Filtering-Correlation-Id: 44f96e21-f912-45ff-675e-08dede921dd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|82310400026|1800799024|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	37oW5Geg1gclqxL2CRI49JlvRMLwN0yExP6VV897gAU2OEHm98oapPIg2Bw0Nkcn5Ntr4CVxz1tNW8xBXe/wvFS0B8J3h5fk7C07QgDefrE7pV0E5x3LxzC5N0JZ5jMN8pPjmZvxwTPRQNNJZ+Ck/ZHdJMsbuuxf3dMLlZt3gs0UuB8+IqDA2qU2p/hHy+B9SeWzwEHWm7IFO7zc4xUDwmfFiZKiCDakz1qUSCZPPdpD5MYEgHdciZqr2ln39S1w0KcD8PTBNt64kpCC1cvhaoy+Ttz9xx8AQeeKxm2IbsT95KbtaCYTFx15+iHoaM42hmyIxsHUcIMgjLK6ITfGj4IKgl0QwBWxlCmiTur9Kuw7ik7noMOvAiED9jo7FR886gCCkxZ/Af10cIZAWgsS7S7vqZ12MAS5yhfkOrHBS1tAERz3rK3c+jslc7z8XuM4MA+EyPLVSXhTQ53P7g5fjGzje7BGODaUdjcM79sec3Vg3sgx6jDt4KvJAfMDKqlOAB13/nKMgOcn8pC5LvbzPCsUmdrP3vJfI9lxGbWeyHTqdGkegbwMoEob/yCPLVT8ga0qiG+tNlX8Evn8Teg9wkRNWA5EUW0S/MYEvja0UoHZj5MczdQ48GEhByfpSTdxNlfiROlBrcdIgDqx2imtwp9raDLZ1Ju/7oTlE+9zd5ck72soBFfQ8oUdQQGRM7to/skEgaw4k/Mheu+UBAhnog==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wxbGDcaRTyJbs4OgVu4Zxe8dJ5bCDnbjaqhrHAubMiNpyiZ5WJB+K3EUeV4Umqq2as05gfmdUC12DGFECPQB4m20vO9XizGcL8u+lKolWBWReVzTeWyYDMF50SctPezTUKcQaMiZerxUctw2glXe67o+MQrMzG6hLBhFe6QDLbKUotCxZCcMKBvmn0xkOuECrtdb1Ul1H7UwEC0/8YJbbH4WxK/bpDAKuf62k4PqXUoR6dZ8mS9dO7V2ALDvGaujKoDWQhvh+h0oAg5GeqaaBPrccT+b5U/i1t1uCGJY432IASjfSYnlGOuYmYxEd3iGwmPnUC6hLQZy8bMZ/gBukiQ5uISCBuTAqULY5L1GkaLWW0vW1BMJaap7TqEBFQPhdkZI/K2rqykQ1LU9JsxPhNkLFoAeqcnCJxwqIbU9kMtkPg5YSrI4evqG5wIBWFZR
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 14:47:08.0135
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44f96e21-f912-45ff-675e-08dede921dd9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB71.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8182

misc_deregister() destroys the device but leaves miscdevice.this_device
pointing at the freed struct device. Clear it so any later check of
this_device, and a subsequent re-register, does not observe a stale
pointer. An upcoming change uses this_device to track whether /dev/hsmp is
registered across the shared ACPI sockets and relies on it being NULL after
deregister.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/hsmp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index fd36c8f142c0..584fd9b1d31f 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -539,6 +539,7 @@ EXPORT_SYMBOL_NS_GPL(hsmp_misc_register, "AMD_HSMP");
 void hsmp_misc_deregister(void)
 {
 	misc_deregister(&hsmp_pdev.mdev);
+	hsmp_pdev.mdev.this_device = NULL;
 }
 EXPORT_SYMBOL_NS_GPL(hsmp_misc_deregister, "AMD_HSMP");
 
-- 
2.34.1


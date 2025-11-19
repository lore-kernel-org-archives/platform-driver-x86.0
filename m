Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013055.outbound.protection.outlook.com [40.93.196.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13ECD296BD3
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Nov 2025 08:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763542733; cv=fail; b=Hro4his7EBjv5Ilp1QlZ7Wcs8/lxqXNgPuwUyWtQFaQ7+2/E/HfQeYBiHQ2DA6zGeZeoohn9gt+Uh7xj9uijoFmfjL0H3h9aRG6xaBaWQvd5J2CtauyDP4k4WqaZ/k3BCnOgt+1e0gmavEm/ZBs6V/kk7IQPbyhDZ5/czLEISFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763542733; c=relaxed/simple;
	bh=BI0O6wImf702lBSF0nnMnRHZXoNqj52gSI1YIRLHckw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sGFzg/utH1tmyYxGdr67Gqg1LKC6ySZYGtk+g9wZ9o4uwT0gzU3ok9iJYqHQU/YSaZL0PfD8vxAK1MuqlwTxBreZ4yMKF8rROvwfToN35fVN9nvic8hPZ3VLPFvvG5p9tnT2A0b+suZ3Sf61keK4VuBM1iVaTAFsWKMVGwCQsBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pXJ43Ir1; arc=fail smtp.client-ip=40.93.196.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pXJ43Ir1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FW3deqmOgS0CKExcW2v9vZOXs7VOcqL0HFfXvyjObJIj/hOcrF3t79wayGBsjQAjUrxAInWqiGSSXQ/bXwb59MJ1IbT0uzHvRRLdfW+Hf3wGXNlOp5rdy0Avx2Rt32PLAIkwtBjq7jgD1Mr94w3mK3qrA3p9g9UUdOeAXobvyagelnGoH/axfyxJ8VE0YGJZ2X4AszEGxCa27YCpjd92xp2ScK1tgIozgiQ8XC2h3Tuu1W5co+GZGH5se35MtcR6EOaVw9/nEAvPtKv1dA5TLNYyBY5y+xYiJUos+dq6Kzfo+rOIMbeAawb5HwvfxDLi6giTJyoXj6gjPr1BTv7+JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1oggNf9c7nrrtuqjW8+tgVGI7EklCZgWoMvVsboCXug=;
 b=Kra4L6LN+/uJD5PiLZiEUVKCDO/QcFbuJRMEzANjqtsONMqly7SBW9Vq8NTCYsqSonJwtUtDAFNxxPg6PXc71I6wQzANqRmpPaEyT+nY/vC6lB/thGqgL1v6ZFYTVf6sawgXb+lruZ9teD9wEsraXyLyBukMl/kN0Xlbod0EsQC0KTtAB5wFkBqiWfxYe27vZ56iersRpJwaPOF4iSaX9GAhCEzF1Z1ol52+Nuf3kDHYHxxkC2K9MQrYiILFMs5ultgie8W3DKHqltxrl4r4973cghOKFUNXKLwVN8nB3LyTaU0CF027y6WKVKET9RlqTULuDdrKkcv2c52o76qY4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1oggNf9c7nrrtuqjW8+tgVGI7EklCZgWoMvVsboCXug=;
 b=pXJ43Ir1/Lgn7tQl8oKftNVZlPUd/wlsEbPq1rzGneolRJ2yBXCq+bFoxa9CzgDqNBDXRFxhgnG5Zn5YRIeWWaFz99VpRASwwaGBJr/W+VRXghBcicm1Ax09FIkVGrN5dG8Xp1tru0umFabItMQdidZkVZcD2IhYxsKW7vDd2CY=
Received: from BL6PEPF0001641D.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:12) by DM4PR12MB7646.namprd12.prod.outlook.com
 (2603:10b6:8:106::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 08:58:46 +0000
Received: from MN1PEPF0000ECDA.namprd02.prod.outlook.com
 (2a01:111:f403:f902::3) by BL6PEPF0001641D.outlook.office365.com
 (2603:1036:903:4::a) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 08:58:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECDA.mail.protection.outlook.com (10.167.242.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 19 Nov 2025 08:58:46 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 19 Nov
 2025 00:58:43 -0800
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 2/3] platform/x86/amd/pmf: Use devm_mutex_init() for mutex initialization
Date: Wed, 19 Nov 2025 14:28:12 +0530
Message-ID: <20251119085813.546813-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251119085813.546813-1-Shyam-sundar.S-k@amd.com>
References: <20251119085813.546813-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDA:EE_|DM4PR12MB7646:EE_
X-MS-Office365-Filtering-Correlation-Id: e1e69fb7-25c0-4424-1f57-08de2749d948
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KJBx2dSDsr99RKZ/Isj64cJxskcFT93oAXqO3b1I8QOzRN7UbcuZS6ik/CFU?=
 =?us-ascii?Q?ef+okkkfM/aiNGghjhdGYjL3+BN5My/lvn1s1tM4khAGsBpLIMHnJZV2jDMn?=
 =?us-ascii?Q?u5Oopm2qc5c/oS4pIuBJ38mP3FoiKqu8DKBDf/dpNH8thPH8yQRRDrb+uozQ?=
 =?us-ascii?Q?lWVgZjAi7OPFhtbLygss9Z7kXCXSQdPbVtEGC0NspMrBdvVr9TX4nTJ1+jlJ?=
 =?us-ascii?Q?z/cJnq+KJ7LMvwOXJXaXCAqX2Tqk+RwX4mE909n/8E/BoOvYUUc3wHxbo/yr?=
 =?us-ascii?Q?4vrusYbPNhh4Yl7xErMu6DMcH5J7aCbgEBg/Wk62ldOEiUCybisNrisprKgI?=
 =?us-ascii?Q?RmUjbIvEJD2ajU/721kcWgFFd86UhMacA09S7Y1XZH9/uv/ICMJwN8inreUK?=
 =?us-ascii?Q?56XVGUIsxQecX++HeiGX1jpbdZaikTtDv+2l/7GubX/GJ/t2yHltfIlcD55X?=
 =?us-ascii?Q?qwA7K4UlaiVKsnx770hm/50/l5K0Tz/eiBSNPVBzSsH0Vj3dP3ZPPwnJRwt4?=
 =?us-ascii?Q?rrpNa4lJv8mOrDlX4eUUfZOVD3wo5VoucOlax3etbVaPR/m/wWIcMCMsGC3W?=
 =?us-ascii?Q?Lg/RZYqH8f3MwQbrF4JnzT/GiekfCDYuicrk9+B45bTRb9vjhvy3VApRb+AP?=
 =?us-ascii?Q?C5zr8YU6zEXQ6L0QHKO+GTC28EQOjPOSc0XrauelZ8+KanwRFeScSYdzEMq0?=
 =?us-ascii?Q?jstB7aER2Fv+N3HF4MhHj6veuQmvmM1tenS9/jgJrr4HgcE9SCctrk2qlwnE?=
 =?us-ascii?Q?ewK6Nsmq+Rv6fyus3poBdyF2PMvowT5k43gvd6gTgKqXZMywh8Ixz8vyAMsL?=
 =?us-ascii?Q?g6NoGPRQU42R2rkBv56Yfj7QpheB55PYzSkyHgQM+5sVxQBXS5ryQDd45HhO?=
 =?us-ascii?Q?YVZ0Dk+4XmtL5LZkA5ke9hJAuCiFKSUi5GXQ83tNzMUfjr4QLQlmUHKjF/1D?=
 =?us-ascii?Q?vZgvi5bOtaGgfwdwQlLZ5eMOHP0Vhf656rF7HtRfNCmFu5T2wXvTjd5n0gtt?=
 =?us-ascii?Q?+7/hbQUBvO0hUDwZXQcC+p9tZMFhwPj/SEaP7YDDWZDYggFamgb3Jf7YqOgW?=
 =?us-ascii?Q?hwvVPD7As5jMWzGL64m4KrpF8TVYX65MxHEzxEDyxkcjoh578EewvTp80Dw2?=
 =?us-ascii?Q?r6AsY7IIkyd5OikOiDOeNZk/IHYgvY5XaibZgKavLj0GHM3Ol1ZTlcVDb1XL?=
 =?us-ascii?Q?Y/aLe8etTJqw949g1bQf05WlaKzyrwaOeCQtBW+VMWY24BPKCFUi+blkm519?=
 =?us-ascii?Q?6c2ouJABKZClzHYMQ39+kd3SfB/AdloraBf8NK4ALVTfsXIuezqsFXrnLzXn?=
 =?us-ascii?Q?QqG/q8NLOHxoRT60xnP4xccP4EjqQ4uzWVoedBoIL5GGK2pE2EK5EQUjt9TT?=
 =?us-ascii?Q?FYoOtuXLhpbzDMUHzzGRi5mALanENT0b4LTqYDPCxUm3Vj09r10Xp/rRRtYl?=
 =?us-ascii?Q?HERTJsqt9kOkiWYNfXUrpwVqLRc6PQ8VRZ3ZCG0mpIo8B1mMkHQdyI5rWVJi?=
 =?us-ascii?Q?GbxvNtI7n6r7QcBTX+1Gxz/K+mT0+NZ32CuHgr46gEJ5oTEh3xOiVOrApV3+?=
 =?us-ascii?Q?SYeHikrd2FcakSLYK+Y=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 08:58:46.4227
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1e69fb7-25c0-4424-1f57-08de2749d948
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECDA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7646

Replace mutex_init() with the devm_mutex_init(), to ensure proper mutex
cleanup during probe failure and driver removal.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v4:
 - New patch spinned off from v3

 drivers/platform/x86/amd/pmf/core.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index bc544a4a5266..2ec4cb92e34f 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -465,9 +465,17 @@ static int amd_pmf_probe(struct platform_device *pdev)
 	if (!dev->regbase)
 		return -ENOMEM;
 
-	mutex_init(&dev->lock);
-	mutex_init(&dev->update_mutex);
-	mutex_init(&dev->cb_mutex);
+	err = devm_mutex_init(dev->dev, &dev->lock);
+	if (err)
+		return err;
+
+	err = devm_mutex_init(dev->dev, &dev->update_mutex);
+	if (err)
+		return err;
+
+	err = devm_mutex_init(dev->dev, &dev->cb_mutex);
+	if (err)
+		return err;
 
 	apmf_acpi_init(dev);
 	platform_set_drvdata(pdev, dev);
@@ -491,9 +499,6 @@ static void amd_pmf_remove(struct platform_device *pdev)
 		amd_pmf_notify_sbios_heartbeat_event_v2(dev, ON_UNLOAD);
 	apmf_acpi_deinit(dev);
 	amd_pmf_dbgfs_unregister(dev);
-	mutex_destroy(&dev->lock);
-	mutex_destroy(&dev->update_mutex);
-	mutex_destroy(&dev->cb_mutex);
 }
 
 static const struct attribute_group *amd_pmf_driver_groups[] = {
-- 
2.34.1


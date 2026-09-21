Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010043.outbound.protection.outlook.com [40.93.198.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE574E36D2;
	Mon, 21 Sep 2026 17:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790010273; cv=fail; b=Ox0IPozuSN1XqitAEmNs17jyZfvlR4V7VkAArp3V3o8adeNVuGlPZiHEfKg/ZD76sRvk/NvanYKGwkTGlV5OMuO+lVoWTY7fMLjLjGJCZBy0aWBrqrOyRW1Do6GpfZqRKynRshvxMxF354p7IVfgJAfxwb/4BfjUXJsMfBgArHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790010273; c=relaxed/simple;
	bh=yAAMxBL9bsBuJXOElc7+abhpFf88Gp+Nr6OUJOfp0q0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SsWNra0+hD9zyKh3h0O/fCt/twpeMiipu5D1Iru1eWYfdBPSCwuyTqAdM5mknMGh56w4lT4zRn3bqUvxCkoE/uZuhpGEeoTU51x9KPiy/4d/crSHghGfdkcmdQ0TOpe0YSRHya70gIZPGnePYA7LtPIGNq7ZVIyEwYNrj/lHH2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=afyY9MIV; arc=fail smtp.client-ip=40.93.198.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="afyY9MIV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=npZrdxggqx99gFO1KqDbMMyLMLW5TlUIYy8Ng37xIt3rMmggNZNeVvrgidgwxIVT9AtgWacdCisWfR3hCBr326pHUNYVbiyDq3PA4NtWOmAEDKDw4lcQEdIJz3rEyMLbbDTuIcQ2xW5eanSF6ismva0RQUyCc+GXzS6mAsvDJ0AWeNwiok0Dql+39qUfb2D9nTQjsuonc82xAyu+Ysgf7Wbn9SCuRkmPFuBP7akkr3Ojl20bZEw4jzOXnksLK0Y8mUw8wN3qy7V8+CfGexbKkjkcSCFm4T7f33ahANUqPUnMHa3r7bf6fstgxc7I/9Bi81a9rQ3WD673wP7Ef44UOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tgGIzoeOK+dOH51m/c8vT3Lt2ALRGvxcue9XFiJAnik=;
 b=T2vdHH9geFcTRrUpxG1WQXEqbMhlW2a7q8NX5QBGFHIaOAy6avmRMO8YAg8//MZDOG9MWZj0Sd7SxU3+TQSM1i6qHVaClAuNMFcQZk//0+gzxW7Wnoz3mP8QbbT4XDuQ03rYrGKkqoaLX1qBpjcWlLfCX9I63YZMnD/+1ijiE6vaOz7PbZiHJyLUrEJMFS7YUrxyqchpT8kjWPKx/QRC8hC9oxaI9AYK0kwFbQiCQW2ty8tvQM3utri8CRn7f2U1dJlRrjYGPH17tGVTLeaZ0fWKDC3gmtNZehqDOjvowyWrk7zVqnN0r1+eYStv1T2JvTMAj/ubEmGfI/WttpmFWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tgGIzoeOK+dOH51m/c8vT3Lt2ALRGvxcue9XFiJAnik=;
 b=afyY9MIV9U1VK9UryzjaDIEJQTTdZOIZCzZldHqL9nMkTpBbBN+3wY3qjg2zxMnX82eIhyrYyuTgLpLJH/ug2pq1fQ/5bnC5IWCtsBW5W3el+GpyXRGgXIlxPVF4GPvdvY2fWmGztziYFdoTjVmuq39n6F4KD8+8SgHuuArAiNk=
Received: from PH2PEPF00003849.namprd17.prod.outlook.com (2603:10b6:518:1::66)
 by PH7PR12MB6562.namprd12.prod.outlook.com (2603:10b6:510:212::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 17:04:29 +0000
Received: from SA2PEPF00003AE4.namprd02.prod.outlook.com
 (2a01:111:f403:f90f::5) by PH2PEPF00003849.outlook.office365.com
 (2603:1036:903:48::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Mon,
 21 Sep 2026 17:04:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003AE4.mail.protection.outlook.com (10.167.248.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 17:04:28 +0000
Received: from dogwood-dvt-marlim.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 21 Sep 2026 12:04:26 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: Hans de Goede <hansg@kernel.org>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>
CC: "open list:AMD HETERO CORE HARDWARE FEEDBACK DRIVER"
	<platform-driver-x86@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>, Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 3/3] platform/x86/amd: hfi: Rely on ACPI enumeration instead of a dummy device
Date: Mon, 21 Sep 2026 12:04:11 -0500
Message-ID: <20260921170411.1149960-4-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921170411.1149960-1-mario.limonciello@amd.com>
References: <20260921170411.1149960-1-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE4:EE_|PH7PR12MB6562:EE_
X-MS-Office365-Filtering-Correlation-Id: e1b37aa5-15b3-4d00-df7d-08df180265a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|82310400026|376014|3023799007|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ZOlqEolz73UfJOjN47OzLKNqTpn6Dd8COv3cJCPol4R6CTFWN1rr0xXDDxAicysMrbs8Gl9fdRMm9MKv6ZcxXq7DL8lwuBTFh8bFyr4IryYOMRnR7z9b3nkWkKfxOhbgkTzYslEgmVthT+pLzFkSWxqYxPR8DOVgXVs2E/7yfgmUnpLulbKiRnwwKh+BGNIWnnUNSGKzAFa2i42qxmukDH4mSfqBrRv5pfj3x5FbZsJl/1UZyjwG/pKwpY31/mg124164Jci94jfiql8mqNV8EZC1MbPGudhz103eaxg5HOJAojxhZU6ITRB34FtrPt+IeCIDU/iY+w8hapSvrKsu9smBByHJ1dB3hHjeEGiGMqNfMGr/UADkyybdPBBvCYJVb36F506nswaZ5rVHjU7WcgkrNBe7RsKCpLeAIn4rTRREgNU34GK0bpvdpY68Evf4uvAVrvYWSBMgpFYK+CA3aIeu1+WCjmgEQH84Y8cp45N7gWw9cV6cDK/IR//rKQiRovW8erG+xSifQvXgITLQUhzh86q3KFfIEp5gt3DYFOTv3a6+33H/UblJJTzrw9fXwmP1TByegxMUYogrGCbxuDKCF0uTTf9JG+ytgYQCl5V73felNVD5VuelxhloySeELnfL4UmnFmiD0wvXAFT5+L+Y1iEJAdiPyOIVN3V6e1tWVFRBguv39gTAxo5MuGJ7tI00D8VWot83bCkweJDzQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(376014)(3023799007)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QsMc36ODo57INowZAQxEgRM2Ijju0iLEV6F+xKXtBjVQH1lZDKDb1MfXtjEqRnKdO+VA0CVBQFbgpigIp2/mW4mHGrdxr7kp9aMHQ1CJSicr6SDL8GlbataoAMZJB2E0TC+lE6e4BHhMqZ1Km/0TX2vZ5pFzqNWyzllvyNYjeoBVE6ZQONkQ/2QUzUgcjnhwhvhI2CNpJMvSM843LgX0pYVELCHEVZNEEU4TOlkGFLotG9udGH2Iff8kVuP/EPTWCHF0LKzgsocwOaIFjNAlbsnX7o9SCWyWru9y3x0k4ONnFMxgbMHp7G+okyjlducRG5ET333wG0ajkS/cvEVP+b9JDVhT28dSZlVgdA23Qa6VG5AMbxE55efs1bSzUtfKpqrIrAj0cBSQQO42dkwft2aAxFgWaJdEHcv4fFp31k+AZVqIetykNlEBkIvNSJSV
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 17:04:28.3581
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1b37aa5-15b3-4d00-df7d-08df180265a4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6562

amd_hfi_init() manually registers a platform device with
platform_device_register_simple() before registering the driver.  This
device has no ACPI companion, so when amd_hfi_probe() runs for it the
acpi_match_device() check fails and probe returns -ENODEV.

The driver already advertises an ACPI match table, so the ACPI subsystem
enumerates the real AMDI0104 device and binds it to the driver.  The
manually created device therefore serves no purpose: it never binds and
lingers as an unbound platform device, wasting memory and cluttering the
device tree.

Drop the manual platform_device_register_simple() and the device that
tracked it, and rely solely on ACPI enumeration.  The CPU feature gating
in amd_hfi_init() is retained so the driver is only registered on
supported hardware.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd/hfi/hfi.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/platform/x86/amd/hfi/hfi.c b/drivers/platform/x86/amd/hfi/hfi.c
index 6d1d3b6c28a97..a923345dd1cf6 100644
--- a/drivers/platform/x86/amd/hfi/hfi.c
+++ b/drivers/platform/x86/amd/hfi/hfi.c
@@ -39,8 +39,6 @@
 
 #define AMD_HETERO_CPUID_27	0x80000027
 
-static struct platform_device *device;
-
 /**
  * struct amd_shmem_info - Shared memory table for AMD HFI
  *
@@ -540,12 +538,6 @@ static int __init amd_hfi_init(void)
 	    !cpu_feature_enabled(X86_FEATURE_AMD_WORKLOAD_CLASS))
 		return -ENODEV;
 
-	device = platform_device_register_simple(AMD_HFI_DRIVER, -1, NULL, 0);
-	if (IS_ERR(device)) {
-		pr_err("unable to register HFI platform device\n");
-		return PTR_ERR(device);
-	}
-
 	ret = platform_driver_register(&amd_hfi_driver);
 	if (ret)
 		pr_err("failed to register HFI driver\n");
@@ -556,7 +548,6 @@ static int __init amd_hfi_init(void)
 static __exit void amd_hfi_exit(void)
 {
 	platform_driver_unregister(&amd_hfi_driver);
-	platform_device_unregister(device);
 }
 module_init(amd_hfi_init);
 module_exit(amd_hfi_exit);
-- 
2.55.0


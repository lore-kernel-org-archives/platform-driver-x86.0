Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2057.outbound.protection.outlook.com [40.107.243.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8119710957
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 Aug 2025 11:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754566952; cv=fail; b=CE++Wazgw9jtHJnwUXYMkNGdycE6cOx15s1JSner5qiaF/N1Bd8HLHeYPu7bpYWN7Mz7lR71f3Ij8+PYODPPsAB6QRqB8SEP4zPhfcExCK8p3gRGbWYCUBgATQ5YlWKg9mx4NcAF6LLiSepgBbdUvfNZVlyD20D9HJWR036GFzA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754566952; c=relaxed/simple;
	bh=9Nu6PQLf8WQqWVRlpWz2OgGeFD9T77SO2XVspoWObYI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dKOzhjlueZozYDG8fEhc1BVMuj6YjesZ8KhdMbmwQg5TSYEolZ6yxLWB2hT+T8c1KfL5AtvBDpFFwo5I7HQ3mJXyzSOVWYypVxevrC/zp1f/gGA1IXgAT0jS2gU0MSSN+0gYiN6k/wPuYaqFMXHVIy2Jkg+qU/VUpBm6m5HuwNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=umJxAkjd; arc=fail smtp.client-ip=40.107.243.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="umJxAkjd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IAfPRFH+5u49gcVheWMTp1J36TUbxGiIqEpm5r+t9YkcmZ+oC0KVlclTRU1kx2IF3DUoRLHRuBIwNkFJ2wLvVu8PgULaL2d9J1VSBMdjDemZ/VhYrkGU7gQZVCXf944cIzekN2o+rFTX/ERSEb56iYxPRoCZmVj10VWjSRdMBwXzsb2+AJFIRJpZMpODuLFDWG1IklyfyCDHD9uQ9YZCL6mhonH4QhUspOO5gn2No4vBk/s/4yHjYxDkUwXIOC4BFZTOeJzgvFxK+IABlWkcvnmtRiUejG1Y54H17jUSqMKRpW9wZnTVfMmcVyUQn4f6k1mbn6b9EowiMCwN3W/FrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cz+McfAi9VzT91V+D+EJJBMw6FRZZJYwxZsgOgfEKOs=;
 b=wcAz2vwhZiq8opiaz2Jq5bR1cIkv3KK7ppatIS8owHSYo4rZpdMNWMy8+3P6LmRv7jYEYw39160Zpkmx90EtmOYg1/nqO94rBHotYL7ti/qBLcX74kZJB7QmG3hVZrPmAFvILFVflb/kajvTIKz42GlLmDv/PrO9eDCB/dgakT6SIr+kyI8z+XgaAdgt6NailI2DAGyfydMieyMaY995+4TLoex++SxXorhwSyvE7/Hy6wF7/S3zLYhRMBj1lhAwQyxVRsJn2ck/7dQBLgm32WDc28u2JdVOaVbfju6yKGKluxQ3/gYwbDz3X1xcBiw8eYV2vk4ti9HWqQc+5gF9nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cz+McfAi9VzT91V+D+EJJBMw6FRZZJYwxZsgOgfEKOs=;
 b=umJxAkjdq4n3Ki90b6ZNlAMEzOGb+M2FsCsDVlQ2PWcZzvzZgPQoTkm6ZTxlI92U8ZWvF9BuPvhVgEWu7CifnMtL9tpgPEyZwrorPCqsrx3opoYdnA/e80XlbMTc4Q3HvtL8Yn1zBxsJeb7DNOBJDE9Obgs7uvTOcoc3apKFGTA=
Received: from BLAP220CA0029.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::34)
 by CH1PR12MB9575.namprd12.prod.outlook.com (2603:10b6:610:2ad::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Thu, 7 Aug
 2025 11:42:27 +0000
Received: from BL02EPF00021F6C.namprd02.prod.outlook.com
 (2603:10b6:208:32c:cafe::c6) by BLAP220CA0029.outlook.office365.com
 (2603:10b6:208:32c::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.17 via Frontend Transport; Thu,
 7 Aug 2025 11:42:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00021F6C.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Thu, 7 Aug 2025 11:42:20 +0000
Received: from trento15c5.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Aug
 2025 06:42:18 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>
Subject: [PATCH] platform/x86/amd/hsmp: Replace dev_err() with dev_info() for non-fatal errors
Date: Thu, 7 Aug 2025 11:42:03 +0000
Message-ID: <20250807114203.982860-1-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6C:EE_|CH1PR12MB9575:EE_
X-MS-Office365-Filtering-Correlation-Id: b11eda9e-6793-4a9d-25cf-08ddd5a7780b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EnaFYL36k08cqGR8eaD/wPoej6VQgSjD6OwX8DpVc/qVqp2y99VCKVeiyJnR?=
 =?us-ascii?Q?THyFylo0e3GfPcM3oaLAoU9Y9unfuCHJLdrnMIF80fbyo2k6UEjYIGJ1GELD?=
 =?us-ascii?Q?gfNXCiijCXqsn1ftDtZ1bMnu5W1nR04zEpTCG1kV+b9JTH+NX5ZzQZUkR1uR?=
 =?us-ascii?Q?bfPZv2W1/ujnPD2QDO9dWii0aoGjnjyVPAR62TtaJH6IB3GZVspOVjRu2ivT?=
 =?us-ascii?Q?Als9JiMpNmImCKHFwlkzl8WOUpdlZLG9I/u21mDHx5YmVp/AhPwO46220z6r?=
 =?us-ascii?Q?4Kvc7dXLqlRBE5t+Xa/tz1XqAe0Bda1N+S3e4dFMbMwdaPleUJkrmi09NtmG?=
 =?us-ascii?Q?6QTq+yvv7WDYgLIa31mszpr3BC5uEiUdRDO6RtKkLto0vxx9g5D0ql6E+4h8?=
 =?us-ascii?Q?5oFCs0X1P4GfvW1AMS1Q/gdLJle6kKZydxQzEC3l0+gLKGjtUVOr5+PojRw1?=
 =?us-ascii?Q?1o3++rOaRtPqv1hdXWZYH+9ANWwBQy3ZDCoWXjSGTHClW3G6O0nHBmdQ90gK?=
 =?us-ascii?Q?0VWFmaUb0KBoTykuJO5S321+yc2Hg9WQ+TyTOAbB2tWL/xubB9oe59pJfnHP?=
 =?us-ascii?Q?ENm+gzxH8T5Bk7jpFuUFO2Duc/SLmFavy9sohPtKxhp7czjbhc9qL17DrlMg?=
 =?us-ascii?Q?IhWy7Q2pzz0vEZx+1wV8QAfA+xVD3qgWIDXNhXG0rSWy5iZRHNUh30KPAVcj?=
 =?us-ascii?Q?fiYMHBtejCSs41gP5Kud6gIwcVr+qa/Ge7f4gOPs21aDal6cRqyHqJFREsy5?=
 =?us-ascii?Q?E56D/6QVL4PO2/6qQHjdaAPj6N70qA/HeDx2AmIUrhl8KBHCJdtV8A65mtN8?=
 =?us-ascii?Q?WOlaHzrn5qTFoIYRtgPH3obd033ZHul7Iy8txSx1jAPimCZRabzD3g+Zr06h?=
 =?us-ascii?Q?l6wF991jEpagEGYG4SbsHzI3xA2T5PALaT+VBFBUJAzkGkPAJYr2lOzrEG5O?=
 =?us-ascii?Q?BxfU66jw+SYnZ9NvXIKMw1YcGUS2neFx9TypncpuM1ys1TW+2N08uhKgbBTr?=
 =?us-ascii?Q?WCQ+JpB8nUlSfMaih+OKZf9E4QhspQKN2+r0Liw4D1avH2JaCxilf4RYC/a7?=
 =?us-ascii?Q?A+c4ETPDMxXtisw1phqdMu5upqorfaoITG8rT3beHRo4bY7l6GXPW4w0pHO9?=
 =?us-ascii?Q?+5MQgAeyMAor1wBfle+yfs3/w4UWUd/F6RWaTLcgbiBhL0b5rQrHy6q00B/P?=
 =?us-ascii?Q?eonwYL2N4wmYpiYIyQRZ4aIBfSZij7a9dhaDGAMnkKrk/Ffd9V1OJ9ar1j7z?=
 =?us-ascii?Q?Acp59lwIocP55ztYSjO5v9MDJJEfyImb28ttqdw9VocEHGHEPnmO1EY/Wkfo?=
 =?us-ascii?Q?BDihhqmr6uxH3hVcdHOzsCpY0X0A7+sL6Pl5BJgQ9X+olbtoZ1eXfpK3UVMf?=
 =?us-ascii?Q?d4+sFVH5zAhJOjJYCSX53PTj+ztU0FUNma4uHnXpMBfIAJjWuEujwG928N/0?=
 =?us-ascii?Q?DXCoeF+G8Zf1CpHLB6BcbKBKmHVABtYHNb8SV5V4afq+32z7HLQFxIZlbPMv?=
 =?us-ascii?Q?iE8jtkZTskf0/d4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 11:42:20.6285
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b11eda9e-6793-4a9d-25cf-08ddd5a7780b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9575

Failure in metric table initialization and hwmon registration are
non-fatal errors. Hence replace them with dev_info().

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
---
This patch is rebased on below patches
https://lore.kernel.org/platform-driver-x86/20250807100637.952729-1-suma.hegde@amd.com/T/#u
https://lore.kernel.org/platform-driver-x86/56b5e58b-7e02-b091-9d23-2cea4c484c20@linux.intel.com/T/#t

 drivers/platform/x86/amd/hsmp/acpi.c | 4 ++--
 drivers/platform/x86/amd/hsmp/plat.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 19f0ca7958b6..52bf3ad31b8d 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -495,12 +495,12 @@ static int init_acpi(struct device *dev)
 	if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6) {
 		ret = hsmp_get_tbl_dram_base(sock_ind);
 		if (ret)
-			dev_err(dev, "Failed to init metric table\n");
+			dev_info(dev, "Failed to init metric table\n");
 	}
 
 	ret = hsmp_create_sensor(dev, sock_ind);
 	if (ret)
-		dev_err(dev, "Failed to register HSMP sensors with hwmon\n");
+		dev_info(dev, "Failed to register HSMP sensors with hwmon\n");
 
 	dev_set_drvdata(dev, &hsmp_pdev->sock[sock_ind]);
 
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index f8aa844d33e4..9304d4a71e3c 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -189,13 +189,13 @@ static int init_platform_device(struct device *dev)
 		if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6) {
 			ret = hsmp_get_tbl_dram_base(i);
 			if (ret)
-				dev_err(dev, "Failed to init metric table\n");
+				dev_info(dev, "Failed to init metric table\n");
 		}
 
 		/* Register with hwmon interface for reporting power */
 		ret = hsmp_create_sensor(dev, i);
 		if (ret)
-			dev_err(dev, "Failed to register HSMP sensors with hwmon\n");
+			dev_info(dev, "Failed to register HSMP sensors with hwmon\n");
 	}
 
 	return 0;
-- 
2.25.1


Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2040.outbound.protection.outlook.com [40.107.96.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121AC246335
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Feb 2025 12:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739882374; cv=fail; b=PUQbAgSSZ7Ggugab4+58eeYdDrqoJU5NwSgvMhaxNSkmOnKahypmp1lQrwhfHnVEjt0Up37cha0vHDCIiuJRrou/JHSfv0rLiFWHZCEnV3g4DTp2bNSqJP5A/7YFAH8M3hmMu8VtVJpp2AK2gwKwCSdRYCMBmtGlVwQAAGbfO5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739882374; c=relaxed/simple;
	bh=IJetPe2cpAro0k9wRUArCIS15S/RDPU2M+t+rXdzuR4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WKIU608NxLDzm87fx0c9NQ1Rq64UlrrzvIafsyrwZ4sXWJ+aF8lZ6t1+Q/7HYF73uN88TiJuRgYjHN2AwgaNuYXFJ8ajYaHNnWlYjvi7Mb/2ufClXxdThXNl/GQj0sBGKLn6+mND3bm0l1wWws+NzWKnxoExH1SUmcWXIo8LKww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Y+9VAbhJ; arc=fail smtp.client-ip=40.107.96.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Y+9VAbhJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kOEriuVn/hEthlLnnrnBjWY8AMn6o48AM8m0s1Dgn1GCqGeE7qlAHQjWiBDzNB0AQQeYpuNep5REsdpv6XvN/9pelf79bGfevIXEG2Vg8j4rA0bZiBtetlWrSosLbtkmd8Qcfju6KIYnWENHfdslhOVlibVftQFLuHI7Bhl+xTdJ8UAIFdtWDHZWDvQAyQT5blZEu0ZK4SGs2irf6qdcJH0fxHQLZLlqDsGo17qFz5qnW8S+MbCal+Fpz56T5JqnTil5P0S4yjaC1YIOQOixqDs7XQjWFFyUkIN0+YwdA+BJhEs89q7Gbod3lzn7nZF4O+3RgUN4dh8sMPcTrgWCCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ClH7dEYGIF6mpKJYel8wXT//s/Eg9FXJUJFGqdgyLDA=;
 b=BR4E26LllMMTKYL78RwTxK5YQ2GsJPOWRWORY6etL/ve/te6nfaNHzbTMQe2rbG2JCf+JV8HdUKRe8RUqy6QVfFlDf3KS1vPj8aUuhA54a+GO9uIu2cb2QUqXrAFrBpvf5KmeGZ/T2/rtEwGEK5jxA0ao3osLTH83PxSz7Lg4911Kg1A5LxI8V6I8REiu8SSC/SdMdZsnnqc/u1ljnHvqqMdRy0LYvCQl4dKxtSRKClYS5ooLiibgUVTmnEcDKsemXjQk3TG8EyXkeHt5c5GTzgJpYjKaYMfSsRQxkCYLCwLN427Y1bARGmekrwM0J1No4HhGenX41gyyPDgfzdguw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ClH7dEYGIF6mpKJYel8wXT//s/Eg9FXJUJFGqdgyLDA=;
 b=Y+9VAbhJfkbLu75AxvV2r+eBl/V/CGj3eQIZHQZ4mUA2p3RVbvrFFqIHlMq/IGV4bzZVi4gD+oh9Dgge657Iw03b0/yZc1StHdpf8zd9Ve233HZklXbZFHcvR97lUYO/QUjm/To4JBGswCU4azKMSgJgS6426egzUZYwgft/w7M=
Received: from PH8PR15CA0002.namprd15.prod.outlook.com (2603:10b6:510:2d2::29)
 by DM4PR12MB8498.namprd12.prod.outlook.com (2603:10b6:8:183::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 12:39:29 +0000
Received: from CY4PEPF0000E9D6.namprd05.prod.outlook.com
 (2603:10b6:510:2d2:cafe::e1) by PH8PR15CA0002.outlook.office365.com
 (2603:10b6:510:2d2::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.19 via Frontend Transport; Tue,
 18 Feb 2025 12:39:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Tue, 18 Feb 2025 12:39:28 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 18 Feb
 2025 06:39:26 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [PATCH 1/3] platform/x86/amd/hsmp: Use one DRIVER_VERSION
Date: Tue, 18 Feb 2025 12:39:03 +0000
Message-ID: <20250218123905.51984-2-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250218123905.51984-1-suma.hegde@amd.com>
References: <20250218123905.51984-1-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D6:EE_|DM4PR12MB8498:EE_
X-MS-Office365-Filtering-Correlation-Id: 723c7ac2-f00e-4e46-f7b4-08dd50194923
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?u9r82EXb6dlPFt//x4/8yw9H4AYg99lG5xcjHbeSevGusFzD02ikD3EEOww2?=
 =?us-ascii?Q?Cy3ivdwt0+u0vQOGNoNQCFID9LgQxbN2g8irmXTIZCV+lfMcSyx48AIHRJRN?=
 =?us-ascii?Q?wDJJ0tRpPXTlYVu4Hg0ZAQGkR26VvGybqCvUJnMoJqDTrzWtdU2/KPdgcDHS?=
 =?us-ascii?Q?b4kgpj3UWn6MWMkVLOXHvlfBJgAKxe6Cwu9tzn23OUbVh9YKOrdgA5g8yu9J?=
 =?us-ascii?Q?s8mz4/ormQeBUsDHfaz3BMyXSzNHLihLXV7EEuMi2gkRooQXktMVcjHYErCe?=
 =?us-ascii?Q?FqFJWhM1yWTWszFvfz6VnQJXx9GhDTyd+VXRbSjD88PiVD5EqoNa1KFkoqp5?=
 =?us-ascii?Q?O0GzdrKx1vRUBn/2aZSJKSvenkF/Ou1dsgkP3i7HdpgYoS59tng50bQhVQBM?=
 =?us-ascii?Q?XtvE1PjUrF4Y5yRGeHQv+oC+srTozEdFU7Ss1grPpW+2hsOQSZKAZM/M3qVe?=
 =?us-ascii?Q?NbIYI0esjhdD7hNwz6CvuSzzTfXvkJz1yoX7k75Y8fhSifdzSdPCoovH86zN?=
 =?us-ascii?Q?gk0GECacPYXYrQXz4F+VSWrtM4mmwrP/0jwAJBeOxWt/bBEoo0yp23/Doj/+?=
 =?us-ascii?Q?PzRrADn9Gp4Dptl/II+yS6VnbXeV4YxLlI/l9kb0s4L48PUJeqazD26jMBOy?=
 =?us-ascii?Q?9IwQuO2Q1fmHVl0JhLAl5jJIcRKCe7gLjgPLzqw9qrd2e6wE0YaPuKmKmzSV?=
 =?us-ascii?Q?t6ZT8JOZeP7Ia5oo7CwJA1UiNv6p6LzQI6U8ppPacJ/Zhs5lMvaNeR0tSod2?=
 =?us-ascii?Q?m+wRiMtgyJMLBj/t+ZA8gm8YF8ZdJM2lsxOmzqXO3dK5kgqUPbPmBjJyMrDS?=
 =?us-ascii?Q?4Kr8PccMZfTpL0XZBDxUPv473dnj5A2YjN63PrDZIrEFMPilvT6N272bVAHF?=
 =?us-ascii?Q?HRejntpsML6Ry8kRiNdbvqsMU3bvV+XEXv2N/IxOSn6JY4WEKHq48MjK/GAc?=
 =?us-ascii?Q?qTgUukhJPX0lIvZnHfk7ZZWWDS103zFrHaFICRUAXwU9elVep7BnYPrNwkKw?=
 =?us-ascii?Q?6YklcP3LLLqsor6rgMsDZ7p7PACxDGyn6RyndW4hqEkWgEfdn1ZEHVqjlINs?=
 =?us-ascii?Q?uTsrp9SjwjVKB3sPVXzD2OABo+h5oLI9ni+WADW0eD47KLCGhJ+syGPdilJ7?=
 =?us-ascii?Q?+Qlqi0agzkfBwuxkwVVtVD4qQIGZdBRlUDAePkNRAT/uQr2UvyH2lZIN3yHl?=
 =?us-ascii?Q?6P1YDU9xBAo/tjBRpqti8wF4qy2tnRiFawy1PQwCGcaqBDAVWX8+EkKeB3WN?=
 =?us-ascii?Q?2oKvCMeQUp9fRHhViqTEADtLKCxc3PxQqQxqI/R2U3zj9/RhYwUQtVs5agLB?=
 =?us-ascii?Q?Ifg1VYHfe4WvZpW5mdTZ++hB/NFT/l4Kk8IfjyyPDb9ZuWCuL/eHau4rSilh?=
 =?us-ascii?Q?0YqZPN1r/0Ics4xcQ/nV5NB4gM/dOTk7gT+gGczPbEO2OrEozlDi0CJaWAC9?=
 =?us-ascii?Q?l5/b5xosanPnF7f4IIiV/vUsH4XnvMA7TLOfC3p0gVpx8Z7Q35n/tyVbX338?=
 =?us-ascii?Q?xbezgExKo/az4Y0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 12:39:28.6414
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 723c7ac2-f00e-4e46-f7b4-08dd50194923
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8498

Use one DRIVER_VERSION for plat, hsmp and acpi modules. This simplifies
userspace applications to support features based on available driver
version.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>

---
 drivers/platform/x86/amd/hsmp/acpi.c | 1 -
 drivers/platform/x86/amd/hsmp/hsmp.c | 2 --
 drivers/platform/x86/amd/hsmp/hsmp.h | 2 ++
 drivers/platform/x86/amd/hsmp/plat.c | 1 -
 4 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 444b43be35a2..0c54c91b5f1a 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -27,7 +27,6 @@
 #include "hsmp.h"
 
 #define DRIVER_NAME		"amd_hsmp"
-#define DRIVER_VERSION		"2.3"
 #define ACPI_HSMP_DEVICE_HID	"AMDI0097"
 
 /* These are the strings specified in ACPI table */
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 03164e30b3a5..8c05e1415820 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -33,8 +33,6 @@
 #define HSMP_WR			true
 #define HSMP_RD			false
 
-#define DRIVER_VERSION		"2.4"
-
 /*
  * When same message numbers are used for both GET and SET operation,
  * bit:31 indicates whether its SET or GET operation.
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index e852f0a947e4..3dee0bb684c7 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -26,6 +26,8 @@
 #define HSMP_CDEV_NAME		"hsmp_cdev"
 #define HSMP_DEVNODE_NAME	"hsmp"
 
+#define DRIVER_VERSION		"2.4"
+
 struct hsmp_mbaddr_info {
 	u32 base_addr;
 	u32 msg_id_off;
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index 02ca85762b68..63034408985c 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -21,7 +21,6 @@
 #include "hsmp.h"
 
 #define DRIVER_NAME		"amd_hsmp"
-#define DRIVER_VERSION		"2.3"
 
 /*
  * To access specific HSMP mailbox register, s/w writes the SMN address of HSMP mailbox
-- 
2.25.1


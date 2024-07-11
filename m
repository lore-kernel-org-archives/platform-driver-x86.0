Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2077.outbound.protection.outlook.com [40.107.237.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022BF148830
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jul 2024 07:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720683242; cv=fail; b=dLk00Uwl8WuibsjpMRaaqBm0pN+M2wxxISmZooXjwytFSGZbpotb7TD0SPNKxDDhE+ZhaATKe5/lPGzOrbFIRgrAFIsYhTd4UGngTpKGMXfYbW3mjV7mV21Ab4DITn0RZGlTh3UvyhSFHdKZZA4VcklKx80zF9uBknkaAiCZROc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720683242; c=relaxed/simple;
	bh=hl87yso/B0Pe9vsuoIVIym/XoqZVp3QXk6QZFNfgkUM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XuTAfFpMCufwS63j+KfsNpMB/nqyMOQqD+yC31t9Erem0DQ94qfG7UPmd2dARnswSVEhmXpvFIv9u7qBMPnCABbscVSRSVOwzlx6nXLQ8LDfGYOCobnuVdJqtyNOu7ShIaD3HEgLhtdUwzl+QrPE+pIeHh3cgiIE76bCgcTXVSg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=YZggqBto; arc=fail smtp.client-ip=40.107.237.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YZggqBto"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VaxUmqOyMUfIgYY1IkVd2jQo2r5lShNbvzWYwUS8bw7I1NuNjHivR6JTizYKZ+yR21o9De663ve6Vp9qn+U7qUEkIg+UvyYBeRRWi4675MVoCFPuZszlG8QVERTsO49wL7tUyLA1Hqkil23PsO4QZl85P7HzhgT1571ZkH+xQMMo6vRacXx4UE5xq4qeJi+fyc3DX4nbabxwZX5fMxAEAyb23zZQ8cauagm2ybt6xL5dMaB8LTNzc86Ao9j+CCOdYzn8wJ22xrNv22P5VnUCM1JXABjSHA+Ztgln2VxblbX6N3NY20THCRMd3C15NC2xf9gWk3ZBlZy8vC8eYjc4oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CuGKF59NQYtZ6BRB4R4lTiqD6qSSRyUE4OjCukAOYhI=;
 b=jg8nEDJ4rVBjQaB8Df/+iKDet3zXzal/OOdxEF7QTxXEndOhATi6It+F+7sPTixzAcETBDop4gXWohoYpEiEq7uq12rq8b+t3F5/+he6+lpHui+m7HlfH2gcM/endzLIzIFCAi6mKAeSTvqpU/4LCqVjC5S/gN0YTqAXQqObnWcmlUreZX4ZtrxOVWhzfWxtz3ddVshbXbSIXlw+96oINLs1j2ZP0ft4kWzndDzb6qJGimQrx1Eu1fHuNWaJOMxR1SxVBs5v1rURogbdXw6cM5jeVPCkpJCfmKwfv5jraNr7uCrQgnmPDWs11rEHmGozw/9WZXMpagVNEpR0qBPw3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CuGKF59NQYtZ6BRB4R4lTiqD6qSSRyUE4OjCukAOYhI=;
 b=YZggqBtoLFfb11NZO9AGrvU9dCN1iYuW1xs/3TgBhcCWzvDiRJZld+W/gRiB9OZ/3iROMepz+jjy6Y27x416MDn0dDS6XnnN7w3PBMJ+CwuLbJYLen7FjEqOqqOr/9nh1Pp6KYsiHTPcuc9r111rGc19v+Xdme0tOMeR8pDYUdE=
Received: from BLAPR03CA0150.namprd03.prod.outlook.com (2603:10b6:208:32e::35)
 by PH7PR12MB7162.namprd12.prod.outlook.com (2603:10b6:510:201::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Thu, 11 Jul
 2024 07:33:58 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:208:32e:cafe::19) by BLAPR03CA0150.outlook.office365.com
 (2603:10b6:208:32e::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Thu, 11 Jul 2024 07:33:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Thu, 11 Jul 2024 07:33:57 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 11 Jul
 2024 02:33:54 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v2 11/11] platform/x86/amd/hsmp: Fix potential spectre issue
Date: Thu, 11 Jul 2024 07:33:14 +0000
Message-ID: <20240711073314.2704871-11-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240711073314.2704871-1-suma.hegde@amd.com>
References: <20240711073314.2704871-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|PH7PR12MB7162:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b7e8210-d83b-4fff-c64e-08dca17bd350
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oduiqurnbpfnhFJwTocHeY0VKTIj+wRl2WZ8RSmZhtJag3Co7QHUe4n/aLjn?=
 =?us-ascii?Q?b3YquYXp9CO8Yz3ikyakdssbJ8fZmTIEmgvOMJkK5kE7vBYPup3Dii/9C4fV?=
 =?us-ascii?Q?vbUXSmcy7yp1hDhuCxHyWgBXcCrw/hu3MMxRgr27PiYY9hqtfdoHPIM/qZSR?=
 =?us-ascii?Q?YHa47Ij4hJ+ghwYbypgYENsJK/7eS1ZLKIY5O7i7ALb9LDqmCS4yLLa9o10C?=
 =?us-ascii?Q?PO1KdRXIbVk5eJkJj2ZcqALISxq+KEs+TuOjwVUT7zhGaTghxA0FfldZ6/o3?=
 =?us-ascii?Q?LhXe3ihQiaLAdcaL9CWgdvatt61MVNHzen/MqjgqkylOXhfNVG241dWGNemG?=
 =?us-ascii?Q?H7+EfqC8kHQj0wm7HP3W+0PoyQGPtyRpkJ5SvLAdfsxOEG4WFG8sDd7giVhQ?=
 =?us-ascii?Q?lpz7qFokrLhyDgeG1JHjC1Q9IyJqlM6rfXgLA/ir4K3QpIaCE37BBGAx4Q/c?=
 =?us-ascii?Q?6GEQmfa21VSNh5tx1xShLhmDkClCkaeZzKL61DqY6+9xWrtZMBUTSvv4J2XP?=
 =?us-ascii?Q?QJaOB22wCVy6MWETFxnZazx9WE2oF6zSIK82PdBqHGp+jXIzmpLqTnYU29iI?=
 =?us-ascii?Q?XvMss4p9gny4RXmD89UWXW/AsWo57aQsiU5aeIiqHakhIJWqL9ni3OLj3snf?=
 =?us-ascii?Q?BTnB/4x/UGJl6d91zoO2EIcC7izEkVO+OKkDNMuyOjuu1ty59q3mc2mA5cZM?=
 =?us-ascii?Q?T+ayFDu3w2eMTyp30r+6IQTFTU9tZuQd+HB260DoYAEpdlGKrZ8leBwEoW84?=
 =?us-ascii?Q?nYaYV3LqP0dIOI8UhjnfzXfMHO3ZzyEeBjYOqGhtvQ2077HLj+UfDCwx9YSl?=
 =?us-ascii?Q?PI9GMXTjCqDaSpJRREsinRTZX6XGbf9C8FETXb3hdxwTJEI8Kd75hmylXkIe?=
 =?us-ascii?Q?M+rkgFc8dCaOo8epFqWOdzDsI7B1z1iEU+VdUDNl+yZl2A4mvQ860X8+aK05?=
 =?us-ascii?Q?QA06AuMB6UV4zjH4+Wz5LcXruaY9I6S42WoTvaVk7w8qHhD3M/Zj98dhFw4O?=
 =?us-ascii?Q?JJIu/S7V1ut7+xiV/rIyLe2d72dxW5J05glJh8zesYthWd5dE1ENz1op3NHI?=
 =?us-ascii?Q?18L969vwYkBGBrYd+KwZl3kJQpfPsm2/qtsZscjBA4sPol6NLiSkB7vbPejs?=
 =?us-ascii?Q?18L/oTum1b840lOBJW0n22j1mjaOjx7NRITR0lWcK/lQS+VLbujQyFammbi7?=
 =?us-ascii?Q?q1k+NzRlmkDAFXt5d4HUKZ7+zfGHTkEyulK+FtVDRJzgKCP1ayopRSGS9cjc?=
 =?us-ascii?Q?aa7g9wYfdNOvKByEFtrBK04QWKGKle7DC9MkEpLO/GeR64egXyChwTV3D/Ag?=
 =?us-ascii?Q?cc5YV6OIbNkB4HP2OEgmRH7Udp4twnkPBC7S/YZN/oRnL9ylS3qvrUVGsm6N?=
 =?us-ascii?Q?R/kgyzzLCZEN7I2r+esqCyAKZ0bEXuVxm9Az/+DHEE+Y9RI6rQ80Zsoq2mij?=
 =?us-ascii?Q?EOBumg1BDuaUjN246taB1nsq/B3wfYpj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 07:33:57.6072
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b7e8210-d83b-4fff-c64e-08dca17bd350
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7162

Fix below warning caused by smatch by using array_index_nospec()
to clamp the index within the range.
"warn: potential spectre issue 'plat_dev.sock' [r] (local cap)"

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v1:
Change plat_dev to hsmp_pdev

 drivers/platform/x86/amd/hsmp/acpi.c | 3 +++
 drivers/platform/x86/amd/hsmp/plat.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 4b1470ca8675..cc859c9fe2dd 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -19,6 +19,7 @@
 #include <linux/dev_printk.h>
 #include <linux/ioport.h>
 #include <linux/kstrtox.h>
+#include <linux/nospec.h>
 #include <linux/platform_device.h>
 #include <linux/uuid.h>
 
@@ -275,6 +276,8 @@ static int init_acpi(struct device *dev)
 	if (sock_ind >= hsmp_pdev.num_sockets)
 		return -EINVAL;
 
+	sock_ind = array_index_nospec(sock_ind, hsmp_pdev.num_sockets);
+
 	ret = hsmp_parse_acpi_table(dev, sock_ind);
 	if (ret) {
 		dev_err(dev, "Failed to parse ACPI table\n");
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index 33868346b5a0..00dc7a0d358d 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -17,6 +17,7 @@
 #include <linux/device.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/nospec.h>
 #include <linux/platform_device.h>
 
 #define DRIVER_NAME		"amd_hsmp"
@@ -77,6 +78,8 @@ static ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
 	if (sock_ind >= hsmp_pdev.num_sockets)
 		return -EINVAL;
 
+	sock_ind = array_index_nospec(sock_ind, hsmp_pdev.num_sockets);
+
 	sock = &hsmp_pdev.sock[sock_ind];
 	if (!sock)
 		return -EINVAL;
-- 
2.25.1


Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2059.outbound.protection.outlook.com [40.107.243.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B715429ACDD
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Jun 2025 10:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750845774; cv=fail; b=HGzo3uy5YnXAxz8esou4rER1MykThXlWR3+BHvfyC62skM0FfRbd85k1XbDmKSOxv0CCSybnVVBOUI7AL+fsHO1EYjIVCLwjFbs3HcpEtfL7LfzuZCpE1eHZf/GXL/68rBU63XSfvq+xtXbUwR7amQHGN3R2lA/LRcguBMh6Llk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750845774; c=relaxed/simple;
	bh=oArSzKBuFyV7DU8N8pUqgRKZe/CxfYDSX0MUjwHguI4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VheV2CXN4MqUXeZ1hvf14Ws57NwvHN97X+N70Jpsrja0GePKeODuvnXvJU0zesCXMy/Pt2eml4nHDkdSP/0f+uQ7Q5Z9DqlpvdTct+XYOVYOoibMy1MmYsBvODdNzipg3x2y942rsVDZIytUjHyh/cfjSQU8xBKQ1lnM+V8hFho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zx8CtzEI; arc=fail smtp.client-ip=40.107.243.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zx8CtzEI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uw7h9El8P3sXz56xaty7v+3J738ZMnRUrQHE+RpNwHCZAuIrq8eaYdYtWk45IieNQrHXucBR+oGdOVjA+lYS6sKv7nBUt/FWf/p76cPdN0Il8K7qW3Pls6qS3PTtwdUbXq7/9HXpuc49kjAc7lbGBPfniMETj1OnF6HTbicnRJQ7nDB8ptwy8MAEDuZijQ508PiF1LpMa/dBQ8VCmyiNfIJE6xFNO+Xbhq4her9V5MTorpWAb8/rAlELGlplEdtZ9woWyNJpNxUGs7MMN9TY6p9y57F3a0cFi37jXR3BvLlj1Xprk5fgiLEQh/PJjvVpLM0Khu4nR+JPTSovupQMGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xDEaj04onUvF/KUFOYjJEgiS1i4o7it4sRsSK5fAcV4=;
 b=NK2mM2bbQ9c+p4RN+Bb8+WBekp4jelelO7NtGZRQ7K9c2AJtrlWQZvDoZqJE4vojMeMjgYOsXW4/iIaOd3jT4w6AGST4Owcx1mAC4dllfdYdhBEHQ5Ic8ZdBnrFTJD8Sej5a4h0vBdJlsWQlEZA07hV+15GFe1ZyeBgxUgibqgVt0+H1bQIHnl/uo40Lkwb1DdDYhkBVn/KHn0DHeH4N1TkEsa8EFB9qi8TYcpHBz0cQuz42Y9tOUvaYG/+srbT6LZWEqNqF2TWcNfi6ZIdL5Xro8iAWa7zhlos8IbxTwF5NnTkZQOqoDvtAEL0BKo99csG0vvDr3bYi5C3ndK3drw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDEaj04onUvF/KUFOYjJEgiS1i4o7it4sRsSK5fAcV4=;
 b=zx8CtzEIjvevQ5Wn5eKzWkwonkrpkDJy9BXxqzF059/1pgcat2LjWyW8sgM4JAVoztYHxzD3E30JDhrdIsKkNWskTThyeZiC4p5fCvJk94NEGCmdmqQXBb9jfTe7Th/SHm08eRtdN/wGkWmLPKTPccLMEksgVhhOiW0uLKG9REk=
Received: from BN9PR03CA0501.namprd03.prod.outlook.com (2603:10b6:408:130::26)
 by MW4PR12MB6973.namprd12.prod.outlook.com (2603:10b6:303:20a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Wed, 25 Jun
 2025 10:02:47 +0000
Received: from BN3PEPF0000B370.namprd21.prod.outlook.com
 (2603:10b6:408:130:cafe::57) by BN9PR03CA0501.outlook.office365.com
 (2603:10b6:408:130::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.29 via Frontend Transport; Wed,
 25 Jun 2025 10:02:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B370.mail.protection.outlook.com (10.167.243.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.1 via Frontend Transport; Wed, 25 Jun 2025 10:02:46 +0000
Received: from trento15c5.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 25 Jun
 2025 05:02:44 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [PATCH] platform/x86/amd/hsmp: Use guard mutex to synchronize probe
Date: Wed, 25 Jun 2025 10:02:16 +0000
Message-ID: <20250625100216.1462594-1-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B370:EE_|MW4PR12MB6973:EE_
X-MS-Office365-Filtering-Correlation-Id: 4124b939-3f60-4ad5-4e3f-08ddb3cf6f7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SEtPXdpuc3Ge6EtQGuPbodiTHNIn8p9RAzuTp9ISIXiUFTe3+5SkwowiRSBG?=
 =?us-ascii?Q?UsJQBuVZD6gax34QHbY65h4fyJDykoCupvM+lbIPUP69YwLCZSdC4n+oy9vi?=
 =?us-ascii?Q?Q1s5qJXDx77Q2fLUek8WI/M050R2qCpya5S8/ZVfT1QkXv51ogV4O/NrPm6i?=
 =?us-ascii?Q?3vGUxldhE8na0z9Luh3mP9b9C4M8FT1wgysyHuZKY67mMA1Hv0eAqlKZcL1v?=
 =?us-ascii?Q?Ii2NK2OJxpHad244k2RWC67FakgIhJ64zaSObfb7czCIrWjyGLKvEGRFcGz2?=
 =?us-ascii?Q?g5p+EdalFatcRwCKPJbnsXAcdZldUj/7S1+zyqFME/XzTUozplNoIllDp7wX?=
 =?us-ascii?Q?lN8Ux2TKWxU4iJQpOT/xnz/ktRYGSgS3kr4D1yfxlGXB2xeyiyQoLyAkDSuu?=
 =?us-ascii?Q?gc8XhRxrsds2r8B+BtC4xwGCr6AFeHzMFmGh2jvCRfoW1H/UjVaqOMDFy2az?=
 =?us-ascii?Q?VV1VF5DfchYOm2YKJ1ja2duShbqldeIPz1FuEX/pT55IdNTEvacaxw03hDq8?=
 =?us-ascii?Q?0/r1z+O7TADJ3aAkHpYkX0rGAmNtktCavvy7c6AgDJaToJlnz/McTRx6VI5V?=
 =?us-ascii?Q?zkUWgwp0NzyjIKlp7XsagDApaC5oLeNEWV5R9htZlO1Gl/S3aHCFLGoA6Fxy?=
 =?us-ascii?Q?g8MnwwmPeNpnUopsf/yruBcmwNpkrXPifCcbOdd8tCA9F06/AOa3BYrpy/YS?=
 =?us-ascii?Q?UAAQmgeP0jdaL1H32isxq/QV8aDkzZe00cA+vOWF3sZuVVBBSIaOm8AyLbc2?=
 =?us-ascii?Q?FvnZ/rg9Ju/NuXogoL/ytTdhM1Q8YzEffIEI9Pedv3BPkCEmCfKMmg9R34LF?=
 =?us-ascii?Q?ATd+lkEM0l7RTBksT2h+3gbizh4S9Nyeg8ZhKFsBODt7Gvs8fpm1vnYetsaZ?=
 =?us-ascii?Q?5yJxJsqmC+ZZxkkcj+ZcJOpsaZGleFJi0ZfHtRmFfoL8kPJR3xxI5XpDSWLT?=
 =?us-ascii?Q?ofCexkH5QUpoLbudDV5QnioelExCsQpsUrwPUKIMcYEFiGT3V9krexshBzm7?=
 =?us-ascii?Q?R0lwSoAGUsm7UhHVmcKRjIC+LCjFL2GCrFCCweayhWAk43Tca/xxNPCrMcU4?=
 =?us-ascii?Q?RnuxcGY2oPXPZiP7OgmZxJ+ho2Ez+31hM3Sfu2vfQ7in4Tb5Q9ppAIOi+qdA?=
 =?us-ascii?Q?7dkhxeIkKjZS4VhdeC0R6+b2DWaVTvDkyYp3EcfgZ0ugED9vpFqq5edQz3Ph?=
 =?us-ascii?Q?A7WkjlHuEAs6V/tB0QH3fqkSQCC2v6tPxN8hycn/2s4ALINW3vj5vtfnEwxS?=
 =?us-ascii?Q?vxG9iX26XlZCjUlARMnVfCgdxiHmwzHH1yQ6/moFU+UeQrRBhYXqg2tA7QOk?=
 =?us-ascii?Q?FI+eutGMsRAa1qYuh3CYPuU/aWyZPqSgx0G4MtxUgxyVp8SuYYQExrwPTFE7?=
 =?us-ascii?Q?zWzVAIaQOWLNvWVUVK3tfA2FxyC1w0zdheTGjx5j+M+vtqsuVWiYjFzB1ibn?=
 =?us-ascii?Q?uQRmtc/cPgG642Y3K+dIKAVg6nqLg8AqUwFuco+6pV+V3EsRoNrbCTkRgZoV?=
 =?us-ascii?Q?YLYf60SGV3u8RtxTjPuqGDTpxa8vIzk3G1kJ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 10:02:46.6270
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4124b939-3f60-4ad5-4e3f-08ddb3cf6f7f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B370.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6973

When async probing is used, 2 hsmp_acpi_probe() calls can race and
make a mess of things. So, add guard mutex to synchronize them.

Suggested-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
 drivers/platform/x86/amd/hsmp/acpi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 2f1faa82d13e..ab2b65f16d1d 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -15,11 +15,13 @@
 #include <linux/array_size.h>
 #include <linux/bits.h>
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/dev_printk.h>
 #include <linux/ioport.h>
 #include <linux/kstrtox.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/sysfs.h>
 #include <linux/uuid.h>
@@ -44,6 +46,8 @@ struct hsmp_sys_attr {
 	u32 msg_id;
 };
 
+static DEFINE_MUTEX(hsmp_lock);
+
 static int amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
 			      u32 *value, bool write)
 {
@@ -585,6 +589,8 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
 	if (!hsmp_pdev)
 		return -ENOMEM;
 
+	guard(mutex)(&hsmp_lock);
+
 	if (!hsmp_pdev->is_probed) {
 		hsmp_pdev->num_sockets = amd_num_nodes();
 		if (hsmp_pdev->num_sockets == 0 || hsmp_pdev->num_sockets > MAX_AMD_NUM_NODES)
-- 
2.25.1


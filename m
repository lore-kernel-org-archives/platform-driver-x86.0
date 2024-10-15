Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2064.outbound.protection.outlook.com [40.107.237.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EDB1E7C1F
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Oct 2024 10:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728988264; cv=fail; b=OKOayt3qkBlVJIzTrK5bVOKz2avayhynJMp0xa8ozJLbD1PZ9dFsGe0tTn4AjDk0R2/lePlllUqgfNIzQDDvFgMK5vxUyo3NmgufpYtKJ/aOFLh8O7ZHr8ea0nQ+Erw0w9raiseOXFEEbBAckoqa7gZnJ88cQv9s8pNuI92lSRs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728988264; c=relaxed/simple;
	bh=Jjn4areCX8F2LOI89S9CncZSowVC4ROcfEVG2DgGkpg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IlvoK3/eWTCe49mOxRGPyYXxD3OnX026TVPAtGHblDdUKPtjQnrKzat2VXH2QaRi4At7onyAcJe+8ZcQeboZ2FQRgsvlSDRbprUH6Us1zK56sC1fb7cDRtUDHUYfetFQMHbCpMOb8nwxEmofAnjgbuzQyKGdWl84qfU1k5Ir41g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zyHwIAsN; arc=fail smtp.client-ip=40.107.237.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zyHwIAsN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cAXYp3mf7fHremrGwrvzYe2RxIPOXnGe7SyINTVvtD6Uj1LCBGO6jTkpEhJw4IjWay5ivoSTIVai94R0Eo1poMp7dUUptt+nKUdvhFr/r/8AqtapZkHmrtQU1p7Tj5f+YhgPV5CM1PqEZSyPydNMFFb0JI8PQZMWo/8k305/UjDLMU5WHQLJ7JfV1/49CZCl6R6JZ/KWUkWcqFPR1kTlI3m5gUc2o+shPcbtuGHJBp/7nc1uavco0UQC8Yz8Ld/Sf4t2APpQVsqp63E60cr2TND35jHNHP/66wtgbafnPX1E8fyouzt94wC5rcO1/QS9Reu6J30eA07IEx2oIRMEqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kh/9ZrDeR5vTciBa+zkWd+l8hp7wM7FrrrKdpdt+rXQ=;
 b=YYMIBdJQC+2l/z2353hzQmAh5ZQj0Y1V4pBmSf76ZTzztuG+EoxSzdS/rE0T/Nq7aSS3yJeKTnkM2m4owrxrqqLSXOwYhpTEV/m9zSl3SWcXS6r32wyz0e+EP1KnNMbdv4pdQprqHEmWaKFzuNFiJMujS+CdM5CejjMiZY/BCHJ1kHB20q1/Jv7BREaQdQf/u7wrCaxImIrbpHo8hmSmRmgnCF9DKI7CmOLcLAZNQp8bAWIEDJuo2HJeYrCJV/CRGxu8ZhneeRFdwrqLnfYAUyijMcR/FsvUF2sK982OFba/cAZ2uhqU6Yol5e9q0n0G0/ArmyeuAnN96EsRexVEtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kh/9ZrDeR5vTciBa+zkWd+l8hp7wM7FrrrKdpdt+rXQ=;
 b=zyHwIAsNXfTrcSkY5JN5yr9sY5rha5rPivJHI5tUz4bz5TiyezzbxU9Cti6nL3QaBEBpdKva6tB4nbf1QA5lBci9s2ybGMHBFfeswdJH6AFhi5WHSFET13idSdaKHMEb5VE+a0aDGFufxkryQhzKpEhWYMobSEVamcMbEob+8+4=
Received: from SA1P222CA0109.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c5::26)
 by IA1PR12MB6410.namprd12.prod.outlook.com (2603:10b6:208:38a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Tue, 15 Oct
 2024 10:30:59 +0000
Received: from SN1PEPF0002636B.namprd02.prod.outlook.com
 (2603:10b6:806:3c5:cafe::db) by SA1P222CA0109.outlook.office365.com
 (2603:10b6:806:3c5::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27 via Frontend
 Transport; Tue, 15 Oct 2024 10:30:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636B.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8069.17 via Frontend Transport; Tue, 15 Oct 2024 10:30:59 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Oct
 2024 05:30:56 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 4/5] platform/x86/amd/pmf: Switch to platform_get_resource() and devm_ioremap_resource()
Date: Tue, 15 Oct 2024 16:00:20 +0530
Message-ID: <20241015103021.1843019-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015103021.1843019-1-Shyam-sundar.S-k@amd.com>
References: <20241015103021.1843019-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636B:EE_|IA1PR12MB6410:EE_
X-MS-Office365-Filtering-Correlation-Id: 23ff06f7-3430-4d8c-488a-08dced0475c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?h0/2N3DZT9o6GuroZyE4xibOANzHqIrjEGtZlyW8vgCYIa6Jb/KxHGi6exLk?=
 =?us-ascii?Q?MTYBBuyZZQmQWZRlibdtsY2Wld6n+t9oOMEImGHZ5XwLCMVMzhPCK8XRowBg?=
 =?us-ascii?Q?w22utTqvPq3ydnyuEbEHI/GxEVc6c5W8n2FKga7GZVXkMSKE5Y8jQ9Ehf/bu?=
 =?us-ascii?Q?klql3/yhKHyEBUd1urBnnpLv/n0WY9RaiEGW2GuCyW0Ca56rYBuLw3DiQGMn?=
 =?us-ascii?Q?DTd3cqf73pm64w9rwAocRMnVkbchOQHWAgjrscutke3H6W56Ufhzb+GAFL+F?=
 =?us-ascii?Q?LWZPHoy8Al+EhbhcdJ9i+1MZA7Numc5+Hs71kJVzcs/6bua3WPb/oWRAR/2t?=
 =?us-ascii?Q?OhVQY+xTAWG/vHBtnEH9hGaAXjJwskbqEQ8wE4vNpGTO5Nq6h7g3JuZ/3nHr?=
 =?us-ascii?Q?D8pmNMa1bHRTbv800NIhgYffrHHWe8YFcwgWr76/xAlB3FZLMbCgj5S3Sy2J?=
 =?us-ascii?Q?mdukL1yODvOVoE4IoNuOHgv83GwwQuyB12F8U5rakEistBCVAV/li7cXd9xz?=
 =?us-ascii?Q?sVQUxF3eb7T2958gW72Kve2Ou3rwqySgWNF/Wj1DmyKuVu84dFVKlJ/pUftw?=
 =?us-ascii?Q?UzlxwibP71+KXJaFewZ4LqPN6ZYOstlBDTYWqVUN5PLbbt2SgwtX0/ax1How?=
 =?us-ascii?Q?89w3kCExVqksj4LbzZWIAKm/FtvnBvKBMxsww3ie45aLQi2af5552daonXMx?=
 =?us-ascii?Q?m14Z+phnXLK5CkhL4aTg1Wm6wz1ImawwKAm5Xk+7Y4mB8ldhuXTqOgLjqn8G?=
 =?us-ascii?Q?BZOI8/Fd+v0Jf2ApJFQElTSawAqLvIeOlaH4Bui3f+79n1oWS6qDBumgB+q7?=
 =?us-ascii?Q?EgBIpyByp/IKWIAqkJCrtcFVnLeq8HOuGCRBWzth4eo3LAeBqQWTgulYCucg?=
 =?us-ascii?Q?gtV74sqkwk+RohowTykwdAnbr6RE6oaKR7QT3cf1xP54NeOoUxY6Atcmmc6X?=
 =?us-ascii?Q?N6oIo9E0kc5ZFK8ke6hAxJfwAkk973K0/uzQGfhxhPH8UzZ0PfyAYADtyZ7N?=
 =?us-ascii?Q?0WQYIXOPdgdc4p6Wr5cdVcNiH7grpkZPaPwMiNi0UvAHnScUcmpM8K13KrkZ?=
 =?us-ascii?Q?MpDl27JhvwdXCiteLnfz6EPVlmWkufNfNvAZGNLgoyRWR3trVKWIwcEnYTR0?=
 =?us-ascii?Q?VtLNGnGowNfRB91U21XaXGcOU3436LpYjNcc4oJdX+XrKtHl9T3TC9BycZkL?=
 =?us-ascii?Q?gdN2GzmZLNu9e66WKgfLG85oTRv+GnKBrAEE/85exEBFo3cvWXnwV98Qx/RQ?=
 =?us-ascii?Q?kBZ2y/JqnOFEtHEGM2+K/W/1sfn4/h3qPMQZ8MwEK8y7Olw0bYcXorMKbCFP?=
 =?us-ascii?Q?HozVhfikEtAt8UhSmC4G81/dNF09om8Jz05h5GuIwhZC5fa7CaO5zUQOIDtI?=
 =?us-ascii?Q?t9QNF0+3lEFlEBQvZiSpik5Z/NvV?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 10:30:59.0764
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23ff06f7-3430-4d8c-488a-08dced0475c9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6410

Use platform_get_resource() to fetch the memory resource instead of
acpi_walk_resources() and devm_ioremap_resource() for mapping the
resources.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/Kconfig  |  1 +
 drivers/platform/x86/amd/pmf/acpi.c   | 37 ++++++++-------------------
 drivers/platform/x86/amd/pmf/pmf.h    |  6 +++--
 drivers/platform/x86/amd/pmf/tee-if.c |  8 +++---
 4 files changed, 20 insertions(+), 32 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
index f4fa8bd8bda8..99d67cdbd91e 100644
--- a/drivers/platform/x86/amd/pmf/Kconfig
+++ b/drivers/platform/x86/amd/pmf/Kconfig
@@ -11,6 +11,7 @@ config AMD_PMF
 	select ACPI_PLATFORM_PROFILE
 	depends on TEE && AMDTEE
 	depends on AMD_SFH_HID
+	depends on HAS_IOMEM
 	help
 	  This driver provides support for the AMD Platform Management Framework.
 	  The goal is to enhance end user experience by making AMD PCs smarter,
diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index d5b496433d69..2d871ff74fa7 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -433,37 +433,22 @@ int apmf_install_handler(struct amd_pmf_dev *pmf_dev)
 	return 0;
 }
 
-static acpi_status apmf_walk_resources(struct acpi_resource *res, void *data)
+int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev)
 {
-	struct amd_pmf_dev *dev = data;
+	struct platform_device *pdev = to_platform_device(pmf_dev->dev);
 
-	switch (res->type) {
-	case ACPI_RESOURCE_TYPE_ADDRESS64:
-		dev->policy_addr = res->data.address64.address.minimum;
-		dev->policy_sz = res->data.address64.address.address_length;
-		break;
-	case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
-		dev->policy_addr = res->data.fixed_memory32.address;
-		dev->policy_sz = res->data.fixed_memory32.address_length;
-		break;
-	}
-
-	if (!dev->policy_addr || dev->policy_sz > POLICY_BUF_MAX_SZ || dev->policy_sz == 0) {
-		pr_err("Incorrect Policy params, possibly a SBIOS bug\n");
-		return AE_ERROR;
+	pmf_dev->res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!pmf_dev->res) {
+		dev_err(pmf_dev->dev, "Failed to get I/O memory resource\n");
+		return -EINVAL;
 	}
 
-	return AE_OK;
-}
+	pmf_dev->policy_addr = pmf_dev->res->start;
+	pmf_dev->policy_sz = pmf_dev->res->end - pmf_dev->res->start;
 
-int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev)
-{
-	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
-	acpi_status status;
-
-	status = acpi_walk_resources(ahandle, METHOD_NAME__CRS, apmf_walk_resources, pmf_dev);
-	if (ACPI_FAILURE(status)) {
-		dev_dbg(pmf_dev->dev, "acpi_walk_resources failed :%d\n", status);
+	if (!pmf_dev->policy_addr || pmf_dev->policy_sz > POLICY_BUF_MAX_SZ ||
+	    pmf_dev->policy_sz == 0) {
+		dev_err(pmf_dev->dev, "Incorrect policy params, possibly a SBIOS bug\n");
 		return -EINVAL;
 	}
 
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 8ce8816da9c1..a79808fda1d8 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -13,6 +13,7 @@
 
 #include <linux/acpi.h>
 #include <linux/input.h>
+#include <linux/platform_device.h>
 #include <linux/platform_profile.h>
 
 #define POLICY_BUF_MAX_SZ		0x4b000
@@ -355,19 +356,20 @@ struct amd_pmf_dev {
 	/* Smart PC solution builder */
 	struct dentry *esbin;
 	unsigned char *policy_buf;
-	u32 policy_sz;
+	resource_size_t policy_sz;
 	struct tee_context *tee_ctx;
 	struct tee_shm *fw_shm_pool;
 	u32 session_id;
 	void *shbuf;
 	struct delayed_work pb_work;
 	struct pmf_action_table *prev_data;
-	u64 policy_addr;
+	resource_size_t policy_addr;
 	void __iomem *policy_base;
 	bool smart_pc_enabled;
 	u16 pmf_if_version;
 	struct input_dev *pmf_idev;
 	size_t mtable_size;
+	struct resource *res;
 };
 
 struct apmf_sps_prop_granular_v2 {
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 19c27b6e4666..555b8d6314e0 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -257,7 +257,7 @@ static int amd_pmf_invoke_cmd_init(struct amd_pmf_dev *dev)
 		return -ENODEV;
 	}
 
-	dev_dbg(dev->dev, "Policy Binary size: %u bytes\n", dev->policy_sz);
+	dev_dbg(dev->dev, "Policy Binary size: %llu bytes\n", dev->policy_sz);
 	memset(dev->shbuf, 0, dev->policy_sz);
 	ta_sm = dev->shbuf;
 	in = &ta_sm->pmf_input.init_table;
@@ -512,9 +512,9 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 	if (ret)
 		goto error;
 
-	dev->policy_base = devm_ioremap(dev->dev, dev->policy_addr, dev->policy_sz);
-	if (!dev->policy_base) {
-		ret = -ENOMEM;
+	dev->policy_base = devm_ioremap_resource(dev->dev, dev->res);
+	if (IS_ERR(dev->policy_base)) {
+		ret = PTR_ERR(dev->policy_base);
 		goto error;
 	}
 
-- 
2.34.1


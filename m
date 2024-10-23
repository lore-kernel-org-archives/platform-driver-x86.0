Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32262149011
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Oct 2024 06:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729665204; cv=fail; b=hriVTVZWAwQI8yEJkIFH7K/Bkxr7sI8+Udbtz60EWUAsqwy84XzJ2p0QXeG8uzX4Od6ve2gQBQUYoKr1EgCJGgzNAi3UlFyPk+JEBDXShh2keccLaRo19av7kpwsCZU8YnWPbHqp6RQ2aZSclaLF02QqxDOqKEnEr1pb8WnThSg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729665204; c=relaxed/simple;
	bh=KM9BTuTS4/2mkMoQTwhyQ4wHvryAAYtHAnlUoJB3HUw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tDi2RZjQEIkIkzAq8oUx7+vUehS6TwtGv49Pz9qugyDvK7vWQglb0cH4aGCHXsL/6nArSZ0bgiKKNbRavHsCHauJ9KHWs2ZZ5davUIm09P5qoWl6VvOx9ThUoIOyi3Z/qTYMxodU89NFIouIi1CwuoUMFUIRr9YBpRKwZqe9xok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EHiKDQfi; arc=fail smtp.client-ip=40.107.92.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EHiKDQfi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CQGYgWT++DvAfekTri+RU+Cc7QF+GOmZKAOQ35lu1tEVaaxUkW+vjzUMhK+IN5Pz1ZucWtm1zdDNdJF2JgDZWlWdLJRV2okZELJgl6/6T6QpzEmrGzlGeLpSrJ5nX6xu+SX/pMWpx4EJsAsHcdWB5WnHYOZMZOJlfDCpSdi5H/XaMmL7yjajb+bKqS7IIr7dwTsKnYb7wQ53yRu2xj73DF65dEgN0b9OqmkpnyI9tXE04LGwu6GT9JYuwAzW8egUp7JKlgVB7aGK5AuWLz02tQiCqdzZ+daAaVgRL/zxJv2XtNJMAaELb2xXAg6ty0xzxhe1TGIyBRbL8+epOyPvyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yn1UR4+34F0TB+qxzP5CKjW9DdlKPuFJWp8cqH9DHjg=;
 b=DkxRbu6jkwWNSGI65vpaB7yaQp7D7HGhI0k8jaqgcZikRpFkjS6Vc15bjkoKSaFSqQu8xHPI1tTxONvBNz0Vjv+NMGk+RjVTFl85MjCJhu0FBaJIq4DYUkKXSM956IjAXoOYQsg364cPKvJgNLcD3Iz1f/yPDrKejubdwfUyLH2dZAHXvqHIY9ktxdW2fsxv+YbijUZGujyf752XNy47UDfq1ed43tzbJoFEbacsKE4rSXYjheQILuMTGBR12OQeTD2DlNqVlwb26q6o/OVNJjDzfMy5mrvL+8IlH2ZYWzKPtnggLF8IbwSTli+oOzEvXiNdaPgfMUVX/ovJtITWJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yn1UR4+34F0TB+qxzP5CKjW9DdlKPuFJWp8cqH9DHjg=;
 b=EHiKDQfiC1ilXPgfBigSb/kohQyxCoiuZ7mjOdJcFDqgBRVZc/M8d/mvBhMNadgr3Yh46QLlDy2T3wiUYMNmCf+ixHVcvgel/f4d46BumuUE4dplC5IyBL/CEewDj5JwLr5NlXoVlqwB7PeKvlz8u5EioBbVl+LKu0V7B4X6+Hs=
Received: from PH7P220CA0137.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:327::22)
 by SA3PR12MB7950.namprd12.prod.outlook.com (2603:10b6:806:31c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Wed, 23 Oct
 2024 06:33:18 +0000
Received: from CY4PEPF0000E9D6.namprd05.prod.outlook.com
 (2603:10b6:510:327:cafe::41) by PH7P220CA0137.outlook.office365.com
 (2603:10b6:510:327::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16 via Frontend
 Transport; Wed, 23 Oct 2024 06:33:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Wed, 23 Oct 2024 06:33:17 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Oct
 2024 01:33:15 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 4/5] platform/x86/amd/pmf: Switch to platform_get_resource() and devm_ioremap_resource()
Date: Wed, 23 Oct 2024 12:02:44 +0530
Message-ID: <20241023063245.1404420-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241023063245.1404420-1-Shyam-sundar.S-k@amd.com>
References: <20241023063245.1404420-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D6:EE_|SA3PR12MB7950:EE_
X-MS-Office365-Filtering-Correlation-Id: 60e14484-e456-4cf7-44db-08dcf32c94c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yHvPSnmxxcMx7YBFRBv4a0FVnTI7lxJ3G+Nh+soJ/TErSAI+Vs5UhXTqTsBj?=
 =?us-ascii?Q?BxJdXZPFn7xtEjvz3G6gjgAeV3hvgXkfhdd6E/PyBnYGVzG/3QnQKN1YdLTY?=
 =?us-ascii?Q?1V6Qr6vYmvx7MyUM1H4t+FfQi8JA+NSiFgib75OUu/Jk62RBZVQdnUd8EgSa?=
 =?us-ascii?Q?S5m05ekgmR6TbxPva/ptlyQw7yKyPwaNiou1iuQwyGAn8DGQj93v9fvEo8Ox?=
 =?us-ascii?Q?Gkv60QvojLk39pwcFNc+JefZ3p2rO6qM4ZxrUEDdErn62dH4tVUfflZ36WbV?=
 =?us-ascii?Q?vAD9XPfnS9/zQaGAPN5W7efrm6Od2ihhKeTSS6Mf/zODl7foFgpw4H+ytOr6?=
 =?us-ascii?Q?71wOl21U3NJ65wLYxs9F5T+5WF8vgZVAioSapjSTlzO1gEO+j0vPAzfexZSL?=
 =?us-ascii?Q?m9Oh/RP+CreTn2m3BVX8RTd/rCAOjtU4k19QGMDQMR2GevgD4NIwdrT4mh6k?=
 =?us-ascii?Q?LY0TCJRzzEfQiGUqLWCiaHLJ6mmrnXFSF6Rhwk8AnZS3/y1AaSQRa5rC/1nD?=
 =?us-ascii?Q?oz9LySCyJmFQHDvlPJ53FHld3DcSH3qGIuH16XZn5yBatiJvPtd9u+EUjXoo?=
 =?us-ascii?Q?UK43rKYtcIzaYutFdGmmxTkCl+iMVj4Gt6wqpfSUxmfTvmWnFHzg0O/rTx2J?=
 =?us-ascii?Q?IY9kvx/uoCHEsxXwvFR6CrNaGZ7fWlZf/83AsaqDPIQ7QvPmrZKRJzM2T18i?=
 =?us-ascii?Q?IbW/nqv4QZZ4iLPr7fGs0KEQE0rZw8MQdsXU0EPkuJVqxET4wS14a0DCO3wk?=
 =?us-ascii?Q?fxF4sSK1jA2Q4aIf9O/FbcS2xCeb9qwLix1F5p+ml5aOsYnn5KHm/1ZfTAui?=
 =?us-ascii?Q?OBiWda+fC12grVAGm5g7Vsjt3807qJN2IbGDe+HuUBDI28XxyqO/lRgwggKN?=
 =?us-ascii?Q?ZPNLKg/ky46t7JgFKlueZbOBKn60wIAx3LO8iVn5EtQXs2dReNaEFlqIodLR?=
 =?us-ascii?Q?lbYPNdxfocp6J2i16O48v2EQQ8GSHO84bmDlnCujHstMZoIZ/uyct48cyMw9?=
 =?us-ascii?Q?V5Uq+GYaPqojnAKmld/P1e8s05MyOMnzmSjtsdEH2301Qn6dMybiWSNtyOsw?=
 =?us-ascii?Q?Y4fGFhsIg3Oo17RmIPXY+P0yrVc1hq5NXVhhcwRTXAQaFLDuGlNBGK53qpnQ?=
 =?us-ascii?Q?vGHrNbkgVDbV1reCYgBZSjwFiJ1nT4V9AqdF3PzjMSn8RT5x7wIl1qdaQkZx?=
 =?us-ascii?Q?DhgYJ2z50OtDU+plkEJulwODe3SpuUWgt3A2/hz+/s2vVKeHM/R7YZzPQnYu?=
 =?us-ascii?Q?4eSn3kHT+Vj+819O2XLqx+I4oPiA66iWYm66fP/07zj1iwSJ7KEHlGaDkoEF?=
 =?us-ascii?Q?AtbucLKsibV0UEoFIKRtF1zRJ4Yk7P4kRgqk/EmbwpO0lD5cQSxRqTS/8NgW?=
 =?us-ascii?Q?j6nwwagdG5KOFAblSg4zbFmWHXh282fqQMZJDI319wGG+VQwOw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 06:33:17.7934
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60e14484-e456-4cf7-44db-08dcf32c94c7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7950

Use platform_get_resource() to fetch the memory resource instead of
acpi_walk_resources() and devm_ioremap_resource() for mapping the
resources.

PS: We cannot use resource_size() here because it adds an extra byte to round
off the size. In the case of PMF ResourceTemplate(), this rounding is
already handled within the _CRS. Using resource_size() would increase the
resource size by 1, causing a mismatch with the length field and leading
to issues. Therefore, simply use end-start of the ACPI resource to obtain
the actual length.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/Kconfig  |  1 +
 drivers/platform/x86/amd/pmf/acpi.c   | 46 +++++++++++----------------
 drivers/platform/x86/amd/pmf/pmf.h    |  6 ++--
 drivers/platform/x86/amd/pmf/tee-if.c |  8 ++---
 4 files changed, 28 insertions(+), 33 deletions(-)

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
index d5b496433d69..62f984fe40c6 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -433,37 +433,29 @@ int apmf_install_handler(struct amd_pmf_dev *pmf_dev)
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
-
-int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev)
-{
-	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
-	acpi_status status;
-
-	status = acpi_walk_resources(ahandle, METHOD_NAME__CRS, apmf_walk_resources, pmf_dev);
-	if (ACPI_FAILURE(status)) {
-		dev_dbg(pmf_dev->dev, "acpi_walk_resources failed :%d\n", status);
+	pmf_dev->policy_addr = pmf_dev->res->start;
+	/*
+	 * We cannot use resource_size() here because it adds an extra byte to round off the size.
+	 * In the case of PMF ResourceTemplate(), this rounding is already handled within the _CRS.
+	 * Using resource_size() would increase the resource size by 1, causing a mismatch with the
+	 * length field and leading to issues. Therefore, simply use end-start of the ACPI resource
+	 * to obtain the actual length.
+	 */
+	pmf_dev->policy_sz = pmf_dev->res->end - pmf_dev->res->start;
+
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


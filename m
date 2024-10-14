Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2048.outbound.protection.outlook.com [40.107.94.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C09A12CD96
	for <platform-driver-x86@vger.kernel.org>; Mon, 14 Oct 2024 04:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728881923; cv=fail; b=LAjehxS9O+XxeRD00lAEn+hYY+8iUlomFwLYxOMagjjZsx5Aq6Y1iAQXhgD9JN/yEjEVJxPqNFYwbRfaN9G0fbLprA2Ch8BPb5V4Npm8N8eLEEUHTg8T9TYVl0z60HBfCI+Ffa7CKTk4TPnxnEToNxLrbpHSJ+SRgv5IATClszA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728881923; c=relaxed/simple;
	bh=XmHY1RmgVhQGe80sacis1KZIanzQvOIyneY3VLkN9aA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UDaLpjtiuY44vwoHODQXxrI/MYS1O6FSjZeS8wobI5+8TGOsp8vMrnFKpqGmCmf0KnY9ioRYaa8FVvL7iOT6aJVD7gtHqry2Xj1AP76rqdCQaoIJQJJ94TW2PVblFAWM5qJPBr1KAIbYeNGbjEZ6heis8tx5z03rvqoKkoaM2SI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Bio4Y1u3; arc=fail smtp.client-ip=40.107.94.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Bio4Y1u3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L47p9bbkLYy0PDCpUjVdw1Arq9Wr25/ATzzwJGladtg5srKLyOwnVr1BUHnA7iXcWtXPeoFSlzgFu9tUnpx361YJReN+ozFMuHSd3guhZShxsP3zM9kJ8sSYTyb/qJX5LPyu2iasLsGB6zCNEnxsN33b2M9apMUAI65veMNhFav/CYrO7iMTOXZQtJLE6b5DcF/zfLugtz4Haoh8bAbGSg7CMbroBmHWA+7JPoozoh4xf6YAoUJHHC1A9osvbGR/Dk2dDPC+nJ4/+DdEDH/tLwbU/6qOwClfX1N2JDvd4PATsJlEwEfPeb6e1ny+428p73DhrmQbvdJFGxtmH7UvVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xx2LV4H55sra7R0mOBSgG89pQL5MStokV5igoBJ3mLA=;
 b=ku/XontKLIB+QH1Tte3I7gY227JTE9aHop4lfjEk7ftVXRMnY2wdXm+jjjwWEboxU+yFAmD7DMZwiC5YU2P5shGqJrcFbwx7ZqqHa+sN03qM5ZdEz/t0Dg87I6Dt0ebwL8kLzULRbCqBkTFLB8jjqKBwm9HpAtC8dCyn7+Og54Y+1pImJB7WcA1TOzjGk5xFVf0NgRLAkvfWIkAA0nJkYXWZE+MV6I4NYetuZjDTlSTXgKRtYvS9S88z0UAVeVtoxc++zR5S3jo+ZK8kpR5l+qwRePZZkYEnFATQstxRQZQc9Zhg8bdknDZ9FZ9n1VratzxUDb03VJGO2OPM2Eniug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xx2LV4H55sra7R0mOBSgG89pQL5MStokV5igoBJ3mLA=;
 b=Bio4Y1u36ZZcDdf9bdvdOKa3gvSMdgA4BcMFkA8YaCs1suqISEoRAYB76neAtz9Cy7EQ3ShQJgJbi34RgGP9/QrDhMTA7eGnJ6uTjFnO8SZHdaZt/gCewkLP5cmEU2lJhdK0nmd0+MncuPS2/tMR51+RYpObaD6WenEjhhIOBAk=
Received: from CH2PR14CA0032.namprd14.prod.outlook.com (2603:10b6:610:56::12)
 by IA0PR12MB7603.namprd12.prod.outlook.com (2603:10b6:208:439::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 04:58:37 +0000
Received: from CH2PEPF0000009E.namprd02.prod.outlook.com
 (2603:10b6:610:56:cafe::ed) by CH2PR14CA0032.outlook.office365.com
 (2603:10b6:610:56::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26 via Frontend
 Transport; Mon, 14 Oct 2024 04:58:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000009E.mail.protection.outlook.com (10.167.244.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Mon, 14 Oct 2024 04:58:36 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 13 Oct
 2024 23:58:34 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 4/5] platform/x86/amd/pmf: Switch to platform_get_resource() and devm_ioremap_resource()
Date: Mon, 14 Oct 2024 10:27:58 +0530
Message-ID: <20241014045759.1517226-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241014045759.1517226-1-Shyam-sundar.S-k@amd.com>
References: <20241014045759.1517226-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009E:EE_|IA0PR12MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: 6124191f-ec35-4fec-0acb-08dcec0cdce9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yyAF+agYw3ee5lvNTaxzB/YT9MMM3Jsl5TiX9om3YVmYWaUEYZkGtxivhdQ/?=
 =?us-ascii?Q?F8muk+hkNx+DomKzbg0ck4Ah4JS4jbbxvCfAOEbeeC4YwMvxZ2kl6YSsarIp?=
 =?us-ascii?Q?YbnAVygYFqX6cFp5vZcGAYv5OV+Uq8GWyf4MCuNEMsyLB+aP+SuuGoQD94CM?=
 =?us-ascii?Q?pzPY3AtH1Di+8NkZSJl67QmBCvICHq5LNUCvke/INA8SJiqHQPPd6mOndN4a?=
 =?us-ascii?Q?lGpX1sH2HMi9KC/QdW3KGlEVc8dXRsKVlPw65nBDJNxfzP5xBBFeHV23jWJr?=
 =?us-ascii?Q?LnIbJ9M+PK9l0OSlYdTRgwx1k4w3etsnc0m4tVuMNlA6UCAiD68W0XDidSUt?=
 =?us-ascii?Q?g5W8Z8KPn8xBShtirheNy94lXuHAPMe2VVWCCXckrvbzRvVZL5u8wFTJ4U8G?=
 =?us-ascii?Q?Px3u4evqLIRy+SEl6a4WZnkcOo0s1FJhrhYUyZdxRhk6WZB09XLgSMrMjvID?=
 =?us-ascii?Q?7TuUFvkc5x0jOiarw4bmV65zryVVjUjfndQtAEuHwgV4nai892IimPtBqSl/?=
 =?us-ascii?Q?mxQw5uMTx+26srVAlQuatIdChzdnSoV7+8rufQFIutN1rm+4ghyteKrsftU1?=
 =?us-ascii?Q?lZXk/amwnk7DW3BzNfzpuF4OALYcJScghh75YRsHVWOsb7ZaFr5CJJejWDx8?=
 =?us-ascii?Q?OKhU93d704HMeG9JTccpdEeOGbstcd8qpDuMi3ol4X8U1kx6CAYPfevIEoJD?=
 =?us-ascii?Q?ZpWKu5XM86ubFXCF2n2Q6F/tHgCDLKGr8JICy4KFsvycltQ/R6iNPgP4SFxJ?=
 =?us-ascii?Q?Z5L1JvcxJLya+rrIGPSzE95VJ9X/K4pvzjJLJnlsPfJFQgb+Augr4o/JMrC7?=
 =?us-ascii?Q?lln2ODdawq3bRxxNgsYqEMVPyZumuGue3ohANDznxeZlhTNfPtQi1A/Gvu+s?=
 =?us-ascii?Q?BPfXss8MLJazg3JZ1WyJPy1CglGbPafFqzR8a8jCfigZ4K1YkSArkXe1cLA1?=
 =?us-ascii?Q?6NhRweTQ19hg+Bbo4ytQLZi//l7ni5QWhh9nMBzMXzF7M3AXh6cMt16wum/b?=
 =?us-ascii?Q?r56MmGk34gPv8CgiiadKErVZiOXXvGsT2kOQ/iQyDbe6+P/IQlEY4ZL0YlRq?=
 =?us-ascii?Q?eO80XMBCpIvQPKpBrgvipR2ai8Mq1mSizlWgoaiuaT/3kV5rvYLGhs5apTnh?=
 =?us-ascii?Q?jl8NTaBRfed/uAD9LPWp7n3BTMAnAl614+m7AA0E2kPnrycghgM6cWf2/4FR?=
 =?us-ascii?Q?W5m/A4birTO+n8rYxwZ5dGtgW6uZYOezUUt/b4HjoiTXeZrhmLaI/QaG8b2z?=
 =?us-ascii?Q?agGMFp6wxCZe6qs2xHG1M5cSv4rsGlKWNju2jqkRNTFBUTxzcUbIm2FKXM+w?=
 =?us-ascii?Q?d1+zYqnRFMi1X9U43vuVvW3RexQdFYA8Rpeiza9dXSW6lZI+0gEGFwxnOZ7w?=
 =?us-ascii?Q?JmSZys2eM4ftK0vzrMxNzev9oLrP?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 04:58:36.8853
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6124191f-ec35-4fec-0acb-08dcec0cdce9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7603

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
index d5b496433d69..40f1c0e9ec6d 100644
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
+	pmf_dev->res =  platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!pmf_dev->res) {
+		dev_err(pmf_dev->dev, "Failed to get I/O memory resource\n");
+		return -EINVAL;
 	}
 
-	return AE_OK;
-}
+	pmf_dev->policy_addr = pmf_dev->res->start;
+	pmf_dev->policy_sz = resource_size(pmf_dev->res) - 1;
 
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
index 19c27b6e4666..544c5ce08ff0 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -257,7 +257,7 @@ static int amd_pmf_invoke_cmd_init(struct amd_pmf_dev *dev)
 		return -ENODEV;
 	}
 
-	dev_dbg(dev->dev, "Policy Binary size: %u bytes\n", dev->policy_sz);
+	dev_dbg(dev->dev, "Policy Binary size: %lld bytes\n", dev->policy_sz);
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


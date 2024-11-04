Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2047.outbound.protection.outlook.com [40.107.223.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A5318BC37
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 Nov 2024 06:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730700217; cv=fail; b=FdMnP8QOihEqDMBHS+cYrIIP2QRsRaL4s0fnrbi63gzTm73+ejSimrE9kc9z4mWhyKNZlpaAoEwFC9CCWnhbv7Q8Q0doHZ04ClA8zEfBLC0eCclxNa4QYifLdch1fIfIjeg+y7ehBCoEj/ivpnN0hsLKyAiCtheLWiJNM+N0lyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730700217; c=relaxed/simple;
	bh=NR29/IG6QBvj02wGoouOS813XAfvp6Rh3yz4AWsvT9U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c9rAN8pXlPa4aTp7nxxaWwBEDwLHMV/H4Axj0gHbhu59ltPNoMWlz8e8HOT0/FyWXLAS1xFlWOf4qqdYKZiM8oTLel3L2Do2GbdBZI4xkzRSBfUIWkTaILLOA1aLi/bdQZos9weX/mt0K8ewvO0UjI0BQ5U28auIP/s5v7hJgkc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4XLJQeOp; arc=fail smtp.client-ip=40.107.223.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4XLJQeOp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=niOSL3S02i1cCAqQAIugaAMpxM+FXpdPeIJKeqGsK6dWrKpaMPnlScs+btSns4iKU2DeBYeMYI69BVWcJHbEZ4S+53EQk4/5Fc1nNX1MPuh9ccCVEH0LB8j1KhKb/8MuDRTAMKF7ORUviPrAWoymHjWkeTlWOd78+JtDJ+hhRQpbXb9s5cBC9zAhYE4RAAWH6QMtPQWkMCCGbAK0qX86Y8yM3vhigO3dDK7D+pGQ4QY+zdNKX54TXI5vbII8YaN0HyOB/vI4Eq8P55XAGqljxFaRTrCVELZ2LpFl0a+x8gKXpBaJ6usVrmttJxcnIsvJ0zJqjj42xByRDFXGlnUqsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=etZKmHpqXImONfNDoclQ/8XpABVb7Afu+DJ4/jSVCko=;
 b=wVyae9Y2HHJL7ZMPcUjB3oqLNyq7kmKe61XtRmOBBydzM+oYGjoOatMkCnv5mN+YTX/4UBrUiXiWdCGdjufXRPvmsh/Twaw616tRawhOtwbG092n4ThlwbuE/2gczk96HR2uZqV3bvE7R1aqPeRznpTlF5YabRzbDtLFr15XV2KNcvwo0zLb66+dFD/Lqwd8h7zCSxi7ddZF1ZJPFaGCnEEyP6t8Ztjurovj1XIGxw9YFB5L3X8dU4A8+wfCtdC7O9roT9qaNPUJkwZbg/gJVbqgu7+2prYYVPFIWtrEVUtQo1ENqR73zqj0wV+EGPYeaWIw4527GF4PR63YhPA2Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=etZKmHpqXImONfNDoclQ/8XpABVb7Afu+DJ4/jSVCko=;
 b=4XLJQeOpE1zXAU6M0pwErxjsPIWztP3DBmpH6OzqPJ+yB5+Ez4Kt2IQwQMoJT/XVeYQpOb9Swi8xvl5pewG6w+uk7ReYtmntHYiOULF8T4SdhFcqWR/dqGQqHwqsjr7UvicoiZkU126xcyLZd/dE2cMlce9u5jjymIiZd9jrWKI=
Received: from BYAPR02CA0057.namprd02.prod.outlook.com (2603:10b6:a03:54::34)
 by DS0PR12MB9421.namprd12.prod.outlook.com (2603:10b6:8:1a1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 06:03:32 +0000
Received: from CO1PEPF000044F7.namprd21.prod.outlook.com
 (2603:10b6:a03:54:cafe::d0) by BYAPR02CA0057.outlook.office365.com
 (2603:10b6:a03:54::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30 via Frontend
 Transport; Mon, 4 Nov 2024 06:03:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.0 via Frontend Transport; Mon, 4 Nov 2024 06:03:31 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 4 Nov
 2024 00:03:29 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 3/3] platform/x86/amd/pmf: Switch to platform_get_resource() and devm_ioremap_resource()
Date: Mon, 4 Nov 2024 11:18:29 +0530
Message-ID: <20241104054829.620858-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241104054829.620858-1-Shyam-sundar.S-k@amd.com>
References: <20241104054829.620858-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F7:EE_|DS0PR12MB9421:EE_
X-MS-Office365-Filtering-Correlation-Id: b115e0a7-4146-4336-cdfb-08dcfc96690f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BEBQDmlEwi7VIrqp6dTW4vSYeHm04tbqMsFX8p6iBOXHsiHn7dukVmllcI2c?=
 =?us-ascii?Q?8U3l1Houdj+C3x5e8poUrmYWitbOvi/XkkmHMZYWLu66RYtAug+SNM9xbA6Q?=
 =?us-ascii?Q?KkfTbzGUObRn7TeGscIsQ4yItbGN1Ubazlqq5TVVJuhmj0G8weZO5jUfy/uJ?=
 =?us-ascii?Q?SCSu6GLMDyKX5eAmlmzFVU5Js6fUD4NfRrgJHhFEpQ/IeoUKnpoFvhaN80LC?=
 =?us-ascii?Q?OOXub6dy55o0Xx8gemqjy8tlW4r6Y25QZ4hFoBeR+0yF//MAryCrT92Ej8il?=
 =?us-ascii?Q?wzOIOKbPDlKB9rB8C3cZD7ax4d7e8fZY9GfUGoi6dEPgOs/7972QAWDSvxeT?=
 =?us-ascii?Q?rXV7nNcCv6O3ehUJ3Jb6chB1WwqiUkqDNl3tcalhDUXl/83q5Ej1lXR0AIKy?=
 =?us-ascii?Q?xyIeMOhwUhmBNHemh7GvjGLEy13aSr9PhwsJygdw9Ej8tLxeSeTGfxCfu/88?=
 =?us-ascii?Q?VXxC6DmOhNhJ9r2h/oT3O1eL4/V53Vg8BPr0+K+2rOuiPSRL9hZJzUux1jnB?=
 =?us-ascii?Q?EWyfg3JjjjlqlAbkOTBjFgbAs+minLfh0KJv1E+CPyguAx0VMqTaZG4vKk3H?=
 =?us-ascii?Q?khAKk+oMMTOLwG7ueFLvxJ1l5f6ZsdYN9mDJs4xeRRRqxc0eqk3fxmJB7Ukl?=
 =?us-ascii?Q?O04bRMqC0b9gGz4Et8N0KCoP/6PGDjOGBRz5N580uSmV6qjvf4CeirUeyxFb?=
 =?us-ascii?Q?Et8fppfXjtEFs5Qq+TRa4wQG9QXUVd9WknmqdHHL+0rT75uiw13BWER9b6rd?=
 =?us-ascii?Q?Hfhuzqp0p0nOGeP1Np+W2mRmjJSWae2wGCppgvuo5ZJUX22gUNSyiYQpzkoh?=
 =?us-ascii?Q?lXZ+yPC8gIpd/cQ7F7Q/wkYXqp/uWXn3leQN2BZ80IFi496D5bCg+7vsRvFo?=
 =?us-ascii?Q?X1BhKE5/iznaTM54jbtUbsi9w3H1JxS9KZv6GoM7Y3vh+MT0IZ3dWb9Dh+bw?=
 =?us-ascii?Q?6rGABjHTbP80ABnwES+6sk5g8OSAEKXH51HblYnmjSMY0v8XIFEvcXMljGrQ?=
 =?us-ascii?Q?x4mJyiocLN4r4ZqBl93YV8jJHPIHMWHA5iY7F2YutlYrtT4XI49x9GIXJ44G?=
 =?us-ascii?Q?dVIx2feELvUq2ywPfPsg76ZOv7ztxu45HtxhwHMBzUNK/C2QcAMb4LjyX9YP?=
 =?us-ascii?Q?KOrbhSlqR+t0lSSLWnkiGDz2io/IuLGPQtwc2SKsroN2n8GAvS1xbtysErwq?=
 =?us-ascii?Q?M6P6FEU7eDH2OLV7eLC6FQ14PcKoG3In7uPKZou1Ud3dMPg7rP5618ezjRE4?=
 =?us-ascii?Q?YKhVYkwHr7MGSMnojzVhy8/pCyB+6V6ipiM09mMp0RymHTA4npTTawU3ygDX?=
 =?us-ascii?Q?3AuJIOPTcZ1EBIDhm/1CSgb+nazh5kVRJG7KVurkiwS6SFWHNwlCeU0hksFU?=
 =?us-ascii?Q?e+q/2IqtpPoykRnZ6H+NrO72DbTPDRXjZxweQVvhNwq/DCyg1g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 06:03:31.5986
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b115e0a7-4146-4336-cdfb-08dcfc96690f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9421

Use platform_get_resource() to fetch the memory resource instead of
acpi_walk_resources() and devm_ioremap_resource() for mapping the
resources.

PS: We cannot use resource_size() here because it adds an extra byte to
round off the size. In the case of PMF ResourceTemplate(), this rounding
is already handled within the _CRS. Using resource_size() would increase
the resource size by 1, causing a mismatch with the length field and
leading to issues. Therefore, simply use end-start of the ACPI resource to
obtain the actual length.

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
index d5b496433d69..1b9c7acf0ddf 100644
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
+		dev_dbg(pmf_dev->dev, "Failed to get I/O memory resource\n");
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


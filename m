Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010002.outbound.protection.outlook.com [40.93.198.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2735E1F7580
	for <platform-driver-x86@vger.kernel.org>; Fri, 19 Sep 2025 05:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758261298; cv=fail; b=eX8jA7CWdkOtPZYx6T2cylxC6dQTPE7HKfPujoCITZPdLDpaZB1ksDKsfOefHfQrMjvR4pxEQSV8yvshXosGlFX/2H2rGsQNLCRNMWh8SaXy1LIn15WZWa/n/X342DvGbHLDqcdA410C1PSK2pAfUmo+CVvGVRlhl2zfrSjS1CI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758261298; c=relaxed/simple;
	bh=MmVnLGDCURG2rnbo/MTpjyqDacnDHfp6db3KadQqIrQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bEnSzSeRRuP6aLb7T4vVAynoJHbN0kYNzRlUnU1cOm1NVeGeFBeJWMYQozAKCyHUiFIr4xLKC+vyxdKYiSbdISPzdGABug4SX34L/pvlFwekEMLHqnFra2LmPR0vFoSexL8iMPjX9xX89g4w0nlXY2lExXegbkiT6t4uQ5a8Ym0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gyffq3f8; arc=fail smtp.client-ip=40.93.198.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gyffq3f8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tEfKk5FbARtMljsATr0Fxan7BCwrT1oUuVCNXLTWT99PpxLmLrFTadeMHuSAJPLmvDol2p1W8pY6iw9pA1/lXMlszOP5+mi834GWW6aFUvqBzBnQE+lv2RKYAO/KpVOcVpgUepODEHDhIINUTC7mPtXJ16f+5Dz4i9bDQZelN1RbkS8JUQ18tGh/yjt+pvJFh0ey7JKv5HCrE5PUJpNmZU8Xe7drmAB/uzjfmUt4G6BAUPoyJj5TJjxqhNPjJguMqzVXCyIoRiwUSE6Bu9q4JodsYJgVpKp6calhjhg7S7TVO8N9YIBXF9PUcIuLUgL3tSz/npqr1yavu73UOEo4Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZluiPhHI7z89CL2/n1Ok34zJX69+g3vByGHRV53pQ4Q=;
 b=apJXDo9U0CMETrbGSxkmxCXnEzwU4XsnHl0d+6qKCPe3M0yhnz2vxbgjYEsRgEXCyT7VY+OjyUu0/lhbSwmEeK9mi7XXyBouqTQp21ib81jj3fQ5JAzeXLkUOTcu5o4MQwxn0Q7zx7U8bk+T002Ftp+G6u5YlUPS0w6zw92/DVxwTlalrb/j2hDdqsM/1C/PGGppRknxEd4ng8PAnONOQb5C+VBRWK4XK7Fibv/WOiGL4H4rcolYTGRSvH/emDoZOI1vBeLtLb+/0HUycaK4jHjALhrF/CW9z3zj5DjqRFKTG69VY2ZNB4vIqaQPNjkoFpCmznTARc2w0eOSElncpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZluiPhHI7z89CL2/n1Ok34zJX69+g3vByGHRV53pQ4Q=;
 b=gyffq3f8nBhbowQQiyjxKyv7cbRWBJQ8XMnJnEsuN77wvNtq/F8WRXmZhsKzF84Yqj1v4I+9XR9rZJx+5e/Mlr3iiYZLo1rBXXWL1H/t4PceGB7jARvogVTtHJkjThXZopktPXqYvYxkmEkIUoAv8YZitM4ybQr9Rv+7p614+Y0=
Received: from MN2PR01CA0003.prod.exchangelabs.com (2603:10b6:208:10c::16) by
 SA5PPF9D25F0C6D.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8d9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Fri, 19 Sep
 2025 05:54:52 +0000
Received: from BN2PEPF000044A6.namprd04.prod.outlook.com
 (2603:10b6:208:10c:cafe::87) by MN2PR01CA0003.outlook.office365.com
 (2603:10b6:208:10c::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.14 via Frontend Transport; Fri,
 19 Sep 2025 05:55:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000044A6.mail.protection.outlook.com (10.167.243.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Fri, 19 Sep 2025 05:54:51 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Sep
 2025 22:54:49 -0700
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 2/2] platform/x86/amd/pmf: Introduce new interface to export NPU metrics
Date: Fri, 19 Sep 2025 11:24:25 +0530
Message-ID: <20250919055425.3055817-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250919055425.3055817-1-Shyam-sundar.S-k@amd.com>
References: <20250919055425.3055817-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A6:EE_|SA5PPF9D25F0C6D:EE_
X-MS-Office365-Filtering-Correlation-Id: f20b5857-fa8e-4cef-2b31-08ddf7410d04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1k7C1yO/m8euWvR6/ZYAycBD225PAMGLhqmF+wPpvLSDsrllalIcIiFavRj3?=
 =?us-ascii?Q?rWjUV7ApHlz/ERNk/tdtvyv75HxA1XsyhH0Vf94JAyWuGAxZMAoy0mdVW+Ff?=
 =?us-ascii?Q?syzcHX89B+RFjLEVtezL95RIG0Bn20mZOu7gRqctMPAicSLV1+mxphdf4WI6?=
 =?us-ascii?Q?rRUQLG2cUkGnj5ixhe6r2Td2dMXhJ98LPQcnudz9QfunWc2SErI4Pj4a1HPD?=
 =?us-ascii?Q?Zu9uuo9CjgIu383A0fpqLJMqYBeJWBwdoy5MTgJ1JmptCiNOYTxgXeCOXc1T?=
 =?us-ascii?Q?/bnIKYM6ahcjjoyy2W0mcKm9HaKEr1kznQSuYhDUASZf7LQWgwKGOdqIgAQ1?=
 =?us-ascii?Q?wskMLdjovf/1h5jlINoqtYt6wKyeiTcEIrjl0L3n+dIkEli/5Uq6eRFLvkBI?=
 =?us-ascii?Q?LKHhrM1hSBk1PlS00ebUEX1tmAvGB5LBSRzzkK0Wu7brDyJDM2Y89ogfnQeA?=
 =?us-ascii?Q?NnMBtZB5MrlMfld99D7fvhmA85EGoTrcVRSItt9tt6TFxDibZZ3XYvexz0Q8?=
 =?us-ascii?Q?Ic7NhVI8fsBRv0iukzHK+jcp7JLxC5wg8CvruWL24zDzZ1k4qMdQV5WjxMjV?=
 =?us-ascii?Q?0qw1TIcIEYQeAZMsqGUpa+YVlzBlzNbHX1X/FMvCPnMesL22E+NseFVOyih3?=
 =?us-ascii?Q?JJHr0j6Xq3QC7vUh3uy1KaKsFhM8VxzoTIIKT/kZZ/ZfHy+uy5KJL1PTqXeI?=
 =?us-ascii?Q?bXYKyrecvrH0KsjrzfpQHcnH+DKnRArwl2uaQUuOHpk3sx2LVDxP5mlwxAJn?=
 =?us-ascii?Q?CDp9AHJZSxkEi7TpXmVMeLDEtHtv9qJGo0wGGH8zbAzkt5s3t7tJ+yq/8q/U?=
 =?us-ascii?Q?i8EI3VzPp3cfGoRsw4j+ylSAZVvFSiD35xqRjoNcKOolglQgvwkbctBPOKKU?=
 =?us-ascii?Q?OT571Ni2gS/Nr/uez8n/fNXzfpwe6beb6AuxbCrWBF0c+y/ro2BLOSqk20sp?=
 =?us-ascii?Q?uIGiq7zucZhxyCng5sZ/wJGc0xu8mdEH6UwD3RvNn42P+N0udN7YYllhlZJZ?=
 =?us-ascii?Q?XsWYVvpglZb1/AneAfAg7TBXMSc8kQpl1KKvzxYLNNtR0ALxWjIibTiPSno0?=
 =?us-ascii?Q?dsr1UDtGYpa2vMjnY2FfplNskWBF303tW6Fu1yBMc2zlDLeOXW1CKhwF5OBJ?=
 =?us-ascii?Q?f76+g/kknqkbZa9z4u/vgCjSqw/jASxhSm1KEtjEf3CKGTYXenkAPUdDz7aV?=
 =?us-ascii?Q?gMvcCoFVXHxWoR2YKkhB0OQhwiAgETAuKwOcrKPwlMJ3iq23hFetnxdsVQO6?=
 =?us-ascii?Q?QsGAnwJUukgr9HLe9euK4mIbD/Q6d68t75bYpD2E2TosAs8x0zUZ95k+ndbG?=
 =?us-ascii?Q?vgjKy4MdDxl2ce2H289C6+csCddobZmo8BciyTxqG0utnCnzfV4dkzh8d5GE?=
 =?us-ascii?Q?9xK8RK+q/sBOaAj4RhhmBQeq15JB2dMt6A7SF6U/06P/u0QEMBPHugegNnyg?=
 =?us-ascii?Q?LPLGukCg6fwyaWz+I0PTzI11kyVpDXvRgjrAqhZZJ0TeC7ZvqtlbVGe1ue98?=
 =?us-ascii?Q?nlusbdW4cX0pWlkYnVk0JaI1ihgv2F0U3i+s?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 05:54:51.9357
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f20b5857-fa8e-4cef-2b31-08ddf7410d04
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF9D25F0C6D

The PMF driver retrieves NPU metrics data from the PMFW. This commit
introduces a new interface to make NPU metrics accessible to other
drivers like AMDXDNA driver, which can access and utilize this
information as needed.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
Hi Ilpo, this can be applied on origin/review-ilpo-next with git tip commit
"8236b4667aca"

 drivers/platform/x86/amd/pmf/core.c | 60 +++++++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h  |  1 +
 include/linux/amd-pmf-io.h          | 21 ++++++++++
 3 files changed, 82 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index ef988605c4da..75529047377c 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -8,6 +8,7 @@
  * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
  */
 
+#include <linux/amd-pmf-io.h>
 #include <linux/debugfs.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
@@ -53,6 +54,8 @@ static bool force_load;
 module_param(force_load, bool, 0444);
 MODULE_PARM_DESC(force_load, "Force load this driver on supported older platforms (experimental)");
 
+static struct device *pmf;
+
 static int amd_pmf_pwr_src_notify_call(struct notifier_block *nb, unsigned long event, void *data)
 {
 	struct amd_pmf_dev *pmf = container_of(nb, struct amd_pmf_dev, pwr_src_notifier);
@@ -314,6 +317,61 @@ int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
 	return 0;
 }
 
+static int is_npu_metrics_supported(struct amd_pmf_dev *pdev)
+{
+	switch (pdev->cpu_id) {
+	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
+	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int amd_pmf_get_smu_metrics(struct amd_pmf_dev *dev, struct amd_pmf_npu_metrics *data)
+{
+	int ret, i;
+
+	if (is_npu_metrics_supported(dev))
+		return -EINVAL;
+
+	ret = amd_pmf_set_dram_addr(dev, true);
+	if (ret)
+		return ret;
+
+	memset(dev->buf, 0, dev->mtable_size);
+
+	/* Send SMU command to get NPU metrics */
+	ret = amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
+	if (ret) {
+		dev_err(dev->dev, "SMU command failed to get NPU metrics: %d\n", ret);
+		return ret;
+	}
+
+	memcpy(&dev->m_table_v2, dev->buf, dev->mtable_size);
+
+	data->npuclk_freq = dev->m_table_v2.npuclk_freq;
+	for (i = 0; i < ARRAY_SIZE(data->npu_busy); i++)
+		data->npu_busy[i] = dev->m_table_v2.npu_busy[i];
+	data->npu_power = dev->m_table_v2.npu_power;
+	data->mpnpuclk_freq = dev->m_table_v2.mpnpuclk_freq;
+	data->npu_reads = dev->m_table_v2.npu_reads;
+	data->npu_writes = dev->m_table_v2.npu_writes;
+
+	return 0;
+}
+
+int amd_pmf_get_npu_data(struct amd_pmf_npu_metrics *info)
+{
+	struct amd_pmf_dev *pdev = dev_get_drvdata(pmf);
+
+	if (!pdev || !info)
+		return -EINVAL;
+
+	return amd_pmf_get_smu_metrics(pdev, info);
+}
+EXPORT_SYMBOL_GPL(amd_pmf_get_npu_data);
+
 static int amd_pmf_suspend_handler(struct device *dev)
 {
 	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
@@ -431,6 +489,8 @@ static int amd_pmf_probe(struct platform_device *pdev)
 
 	dev->dev = &pdev->dev;
 
+	pmf = dev->dev;
+
 	rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
 	if (!rdev || !pci_match_id(pmf_pci_ids, rdev)) {
 		pci_dev_put(rdev);
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 6ea5380f3b23..622404e71136 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -12,6 +12,7 @@
 #define PMF_H
 
 #include <linux/acpi.h>
+#include <linux/amd-pmf-io.h>
 #include <linux/input.h>
 #include <linux/platform_device.h>
 #include <linux/platform_profile.h>
diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
index 6fa510f419c0..55198d2875cc 100644
--- a/include/linux/amd-pmf-io.h
+++ b/include/linux/amd-pmf-io.h
@@ -61,5 +61,26 @@ enum laptop_placement {
 	LP_UNDEFINED,
 };
 
+/**
+ * struct amd_pmf_npu_metrics: Get NPU metrics data from PMF driver
+ * @npuclk_freq: NPU clock frequency [MHz]
+ * @npu_busy: NPU busy % [0-100]
+ * @npu_power: NPU power [mW]
+ * @mpnpuclk_freq: MPNPU [MHz]
+ * @npu_reads: NPU read bandwidth [MB/sec]
+ * @npu_writes: NPU write bandwidth [MB/sec]
+ */
+struct amd_pmf_npu_metrics {
+	u16 npuclk_freq;
+	u16 npu_busy[8];
+	u16 npu_power;
+	u16 mpnpuclk_freq;
+	u16 npu_reads;
+	u16 npu_writes;
+};
+
 int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum sfh_message_type op);
+
+/* AMD PMF and NPU interface */
+int amd_pmf_get_npu_data(struct amd_pmf_npu_metrics *info);
 #endif
-- 
2.34.1


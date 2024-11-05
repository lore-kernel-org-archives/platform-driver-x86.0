Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2062.outbound.protection.outlook.com [40.107.92.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA7315C144
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 Nov 2024 17:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730828274; cv=fail; b=aNfgMMBIJkBRCQmwiUumbTXyLj2YOSr2056buVVVAnhmAfMkF5X3riHg0fEEt0xb9dTyEefR+xddZrjpcVCLw3/CLO24j75MhGaxl61AFRZr+jeyk/tOiXTFdU22s6dN18+S2RUFpC0RcaT2UV8eW3LFW0q/qrOsSOZm8MlCy1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730828274; c=relaxed/simple;
	bh=RsOvApohFRA1xblK9AAt15CCJpyRiBU7J8SNtlRsxNk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XzAmyhkdwmFLIy3xD2oJI80XPbQ5FFe7w+CozIgxW79J8slKB6NwJ0eulziFV+iFnbC8ZZedsOxcH8dbtpRRTfcGaDGSy6gXF0LcGlkM7C6wUZ4/6wJSWnMeMuUY1lhJTY6foJQ3KQUKovNLrJ7bkGav52kTt9fQcGbrfqevViA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KtneK0Ue; arc=fail smtp.client-ip=40.107.92.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KtneK0Ue"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hrCe7xESh1CBEOSPDcUkTau+pG2TNF499HfWQttZ2tylA1fQbD9J/D5n14P9XV2R9BdEp9uOjdFvLLvu9zmmgHw59bFRZoNvW5f1NyvukwYcJR+RrztZMBZfdNNS50trwEdOt/jHyP8DVCPIniqx1sEj6XdeceV+2UcUB6XhJzs6dsmjxtbha+p6yigHMyiwtVhubiJFnPR1NBd+U4TBwyZS77D/oOsLT4u0DksdNw0yPQE+LXnEoNNhsVSPw5L2fbpafUSyXxvA6rduV7oflz4upgX3PerHZcppVhFQZ96G716DJuArZbZPnaxXcHhIN49LLP4HTcW3FJf1AzjUQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LwEGQlp+6xk4VciNh00DfIfHUu52NvWR6NOW5hbWsTU=;
 b=C0EChhdLMv1+4nx/rvwxAjZhugYfmaAdvjR2NS8rLh5dJkYoyWm/d6bk18B198DA37kuDodzi4AcessvPntSHakzcF1xHZ/Bjcf5z4E4IFOnFVzrKmiuDiSvyDKgodZ2Qzn1S+1dSQwqyZ93KcjT1ZZaziXTTqMdpJH2fbJdpfSMJfset+KEBeqk/0hNphFq5LXSVaXst756wfLoJQB2KWecnHwwnHZc1peWWU6bguIKw1wmRVaPWool2ru2Ntoq5i6OhFppKH93fZ4mGmA9Zm+q6eFj3zZYAjgWJwamlsUI87rGCRyfXDaPWrbvwCQ8et3QYWGlwbrDtb+FZ6juAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LwEGQlp+6xk4VciNh00DfIfHUu52NvWR6NOW5hbWsTU=;
 b=KtneK0Ueyv6njR8NGvqoHCIoDI3Gc4Y6TLc5Y+pMSs3d1yqjaOVfMSCnSXjW1UHKBWZc6QlWd0xJfA/c2zu3iOGW+NaLhu9JR2RXXCgC5AoZpZ22IKXOWymzH+hjhZsKYlUiAh71w2vxIiLjkO/fCJUIwnHGoYNiRhxjtIZjXvc=
Received: from SJ0PR03CA0344.namprd03.prod.outlook.com (2603:10b6:a03:39c::19)
 by MW4PR12MB6950.namprd12.prod.outlook.com (2603:10b6:303:207::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Tue, 5 Nov
 2024 17:37:47 +0000
Received: from SJ1PEPF00002311.namprd03.prod.outlook.com
 (2603:10b6:a03:39c:cafe::98) by SJ0PR03CA0344.outlook.office365.com
 (2603:10b6:a03:39c::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31 via Frontend
 Transport; Tue, 5 Nov 2024 17:37:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002311.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Tue, 5 Nov 2024 17:37:47 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 5 Nov
 2024 11:37:44 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 02/13] platform/x86/amd/pmc: Relocate STB Debugfs to a New File
Date: Tue, 5 Nov 2024 23:06:26 +0530
Message-ID: <20241105173637.733589-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241105173637.733589-1-Shyam-sundar.S-k@amd.com>
References: <20241105173637.733589-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002311:EE_|MW4PR12MB6950:EE_
X-MS-Office365-Filtering-Correlation-Id: 629f9609-c05c-4bc3-d99c-08dcfdc0904d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?n5xFlvl1A6g10uZaSAJa7c0WWmZwnsW1wGy2oR5S/ZkbkKwZgwzqK0s8onYk?=
 =?us-ascii?Q?waqs3oYjSA8x1lsDKhTMbTdVHu2ZYE2TEnmjZWYE4kSQVFJdVnn/zoGkpOI2?=
 =?us-ascii?Q?ieqQpsHZ2TjRLNSIGCX64Zy38gV3oCfY9Oj+3hyAxqEZRU2Ux0isCkc4AA4I?=
 =?us-ascii?Q?FTL1FOrewj354KGndrWqPMXdPR40cMEk8zBF1gi3MfwMZUEeimpG9olMiGIM?=
 =?us-ascii?Q?ybIZCm32exOtgRV/eJSuYmlkAL7LnUMPGT4+Am6vzAR9nGsGsqqHdnRhCB//?=
 =?us-ascii?Q?g3NvejZasYKEPdfP6yG9yxmhQ3+Acp0TC3BR5I6vr1aKtyXbLTwZq4AOZgIM?=
 =?us-ascii?Q?H+Vy7JXB9GOk7l0Hqfc309WeAiBFkk5svg3erAEoWCxOqbmSmkIuPd9KUWpe?=
 =?us-ascii?Q?yAWit9/qPVjd1897lKqos+Fpv93RJnIjDPM2IXcpopZu29rPpGcHHpGEbTIP?=
 =?us-ascii?Q?d89qi+Kmzd+TcDhYoyWA33hgLLtRb5vKfk5fbCba6U/FMqN4IqgwAiHRouCZ?=
 =?us-ascii?Q?YTC/+wDGTzIfdbch48KmBsU336DDY1X21+xWNkEdZjG0KGzqui/WydNVCr5h?=
 =?us-ascii?Q?gqq/+uUiRchF68a/xJmYD/lx6edq7R2ZYLTkGTohXtD54XTTtH48RfQL+HdW?=
 =?us-ascii?Q?0HAGlh++gutI2e7pPsck/gsMgR/bNDP8DsxX1fjdyxX7NvZmkZsGM2+BZmxE?=
 =?us-ascii?Q?wkLhbveZ/unfyHV78XkY//ruyt2fT8x/dShzKvxklS5tUnhIViWvdpY5xMiT?=
 =?us-ascii?Q?ev4M9tB+pS94a2AwqES5hpcrcXxVvCswyvOMDKz9sgE4bkv5uWhkgUDnZfp5?=
 =?us-ascii?Q?ms98UXC8WYQazCOzW5tj2Wj+NsTzMbfCT70sC2KWWmka4hfrazk2gg2k8hPG?=
 =?us-ascii?Q?y9O6RPvrnXq1x5OxAcSeeuK/YSlF4OzlUvj/G4buGShtGXhizUlOz16Tsrep?=
 =?us-ascii?Q?AeqXLIz/Bi3PfovFFvuNiEeL2dLWocBjv7q4ogznmrX81QaUHviQVcyhcUug?=
 =?us-ascii?Q?alHysSKXnlCy1uwZZyKcaARcMtFC29AVmHw17wxISmfSoSGmJCkHfUsdamnX?=
 =?us-ascii?Q?+0jyKZzSOt3GJiUJvRacH8VGvzf7y1p5dCehQYB9z7sHamHR9+buZjir5H4U?=
 =?us-ascii?Q?YwiSbuj9IPSlgl5C2E8PHolcol4qqw949JsmG0TKdjp8svvPZVKVpXsmq/UR?=
 =?us-ascii?Q?Bx0/C19tjKLlsrfNttBn340MjfGVHbzo6J56Zgyq/mJev11E6/Om7ZAIKNFo?=
 =?us-ascii?Q?pSFh8cOsvTYtWC6NZkORXNcO2jFa9vTRLOq+VfyIBUXT0zdMWxpOPx2q19ZZ?=
 =?us-ascii?Q?wXW3iqNQmhyGaxmYIhQLJjGggMORwIFk+TRUbvtCZ4QTHWjtGDrZHOGrEGZJ?=
 =?us-ascii?Q?oTdJlwyv4fUak5ZmaGSpse+ZT5BKXySPyIycUiPVK/6fbZlU4g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 17:37:47.4774
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 629f9609-c05c-4bc3-d99c-08dcfdc0904d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002311.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6950

With the core functionalities of STB now transferred from `pmc.c` to the
new `mp1_stb.c`, the creation of debugfs should also be moved to this new
file.

This change has been logically separated from the previous patch to avoid
circular dependencies.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/mp1_stb.c | 206 +++++++++++++++++++++++++
 drivers/platform/x86/amd/pmc/pmc.c     | 203 +-----------------------
 drivers/platform/x86/amd/pmc/pmc.h     |  14 --
 3 files changed, 209 insertions(+), 214 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/mp1_stb.c b/drivers/platform/x86/amd/pmc/mp1_stb.c
index 8221def898a5..6552617bd9c7 100644
--- a/drivers/platform/x86/amd/pmc/mp1_stb.c
+++ b/drivers/platform/x86/amd/pmc/mp1_stb.c
@@ -20,9 +20,37 @@
 
 /* STB Spill to DRAM Parameters */
 #define S2D_TELEMETRY_DRAMBYTES_MAX	0x1000000
+#define S2D_TELEMETRY_BYTES_MAX		0x100000U
+#define S2D_RSVD_RAM_SPACE		0x100000
 
 /* STB Registers */
 #define AMD_PMC_STB_PMI_0		0x03E30600
+#define AMD_PMC_STB_DUMMY_PC	0xC6000007
+
+/* STB Spill to DRAM Message Definition */
+#define STB_FORCE_FLUSH_DATA		0xCF
+#define FIFO_SIZE		4096
+
+static bool enable_stb;
+module_param(enable_stb, bool, 0644);
+MODULE_PARM_DESC(enable_stb, "Enable the STB debug mechanism");
+
+static bool dump_custom_stb;
+module_param(dump_custom_stb, bool, 0644);
+MODULE_PARM_DESC(dump_custom_stb, "Enable to dump full STB buffer");
+
+enum s2d_arg {
+	S2D_TELEMETRY_SIZE = 0x01,
+	S2D_PHYS_ADDR_LOW,
+	S2D_PHYS_ADDR_HIGH,
+	S2D_NUM_SAMPLES,
+	S2D_DRAM_SIZE,
+};
+
+struct amd_pmc_stb_v2_data {
+	size_t size;
+	u8 data[] __counted_by(size);
+};
 
 int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data)
 {
@@ -52,6 +80,174 @@ int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf)
 	return 0;
 }
 
+static int amd_pmc_stb_debugfs_open(struct inode *inode, struct file *filp)
+{
+	struct amd_pmc_dev *dev = filp->f_inode->i_private;
+	u32 size = FIFO_SIZE * sizeof(u32);
+	u32 *buf;
+	int rc;
+
+	buf = kzalloc(size, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	rc = amd_pmc_read_stb(dev, buf);
+	if (rc) {
+		kfree(buf);
+		return rc;
+	}
+
+	filp->private_data = buf;
+	return rc;
+}
+
+static ssize_t amd_pmc_stb_debugfs_read(struct file *filp, char __user *buf, size_t size,
+					loff_t *pos)
+{
+	if (!filp->private_data)
+		return -EINVAL;
+
+	return simple_read_from_buffer(buf, size, pos, filp->private_data,
+				       FIFO_SIZE * sizeof(u32));
+}
+
+static int amd_pmc_stb_debugfs_release(struct inode *inode, struct file *filp)
+{
+	kfree(filp->private_data);
+	return 0;
+}
+
+static const struct file_operations amd_pmc_stb_debugfs_fops = {
+	.owner = THIS_MODULE,
+	.open = amd_pmc_stb_debugfs_open,
+	.read = amd_pmc_stb_debugfs_read,
+	.release = amd_pmc_stb_debugfs_release,
+};
+
+/* Enhanced STB Firmware Reporting Mechanism */
+static int amd_pmc_stb_handle_efr(struct file *filp)
+{
+	struct amd_pmc_dev *dev = filp->f_inode->i_private;
+	struct amd_pmc_stb_v2_data *stb_data_arr;
+	u32 fsize;
+
+	fsize = dev->dram_size - S2D_RSVD_RAM_SPACE;
+	stb_data_arr = kmalloc(struct_size(stb_data_arr, data, fsize), GFP_KERNEL);
+	if (!stb_data_arr)
+		return -ENOMEM;
+
+	stb_data_arr->size = fsize;
+	memcpy_fromio(stb_data_arr->data, dev->stb_virt_addr, fsize);
+	filp->private_data = stb_data_arr;
+
+	return 0;
+}
+
+static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
+{
+	struct amd_pmc_dev *dev = filp->f_inode->i_private;
+	u32 fsize, num_samples, val, stb_rdptr_offset = 0;
+	struct amd_pmc_stb_v2_data *stb_data_arr;
+	int ret;
+
+	/* Write dummy postcode while reading the STB buffer */
+	ret = amd_pmc_write_stb(dev, AMD_PMC_STB_DUMMY_PC);
+	if (ret)
+		dev_err(dev->dev, "error writing to STB: %d\n", ret);
+
+	/* Spill to DRAM num_samples uses separate SMU message port */
+	dev->msg_port = 1;
+
+	ret = amd_pmc_send_cmd(dev, 0, &val, STB_FORCE_FLUSH_DATA, 1);
+	if (ret)
+		dev_dbg_once(dev->dev, "S2D force flush not supported: %d\n", ret);
+
+	/*
+	 * We have a custom stb size and the PMFW is supposed to give
+	 * the enhanced dram size. Note that we land here only for the
+	 * platforms that support enhanced dram size reporting.
+	 */
+	if (dump_custom_stb)
+		return amd_pmc_stb_handle_efr(filp);
+
+	/* Get the num_samples to calculate the last push location */
+	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->s2d_msg_id, true);
+	/* Clear msg_port for other SMU operation */
+	dev->msg_port = 0;
+	if (ret) {
+		dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n", ret);
+		return ret;
+	}
+
+	fsize = min(num_samples, S2D_TELEMETRY_BYTES_MAX);
+	stb_data_arr = kmalloc(struct_size(stb_data_arr, data, fsize), GFP_KERNEL);
+	if (!stb_data_arr)
+		return -ENOMEM;
+
+	stb_data_arr->size = fsize;
+
+	/*
+	 * Start capturing data from the last push location.
+	 * This is for general cases, where the stb limits
+	 * are meant for standard usage.
+	 */
+	if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
+		/* First read oldest data starting 1 behind last write till end of ringbuffer */
+		stb_rdptr_offset = num_samples % S2D_TELEMETRY_BYTES_MAX;
+		fsize = S2D_TELEMETRY_BYTES_MAX - stb_rdptr_offset;
+
+		memcpy_fromio(stb_data_arr->data, dev->stb_virt_addr + stb_rdptr_offset, fsize);
+		/* Second copy the newer samples from offset 0 - last write */
+		memcpy_fromio(stb_data_arr->data + fsize, dev->stb_virt_addr, stb_rdptr_offset);
+	} else {
+		memcpy_fromio(stb_data_arr->data, dev->stb_virt_addr, fsize);
+	}
+
+	filp->private_data = stb_data_arr;
+
+	return 0;
+}
+
+static ssize_t amd_pmc_stb_debugfs_read_v2(struct file *filp, char __user *buf, size_t size,
+					   loff_t *pos)
+{
+	struct amd_pmc_stb_v2_data *data = filp->private_data;
+
+	return simple_read_from_buffer(buf, size, pos, data->data, data->size);
+}
+
+static int amd_pmc_stb_debugfs_release_v2(struct inode *inode, struct file *filp)
+{
+	kfree(filp->private_data);
+	return 0;
+}
+
+static const struct file_operations amd_pmc_stb_debugfs_fops_v2 = {
+	.owner = THIS_MODULE,
+	.open = amd_pmc_stb_debugfs_open_v2,
+	.read = amd_pmc_stb_debugfs_read_v2,
+	.release = amd_pmc_stb_debugfs_release_v2,
+};
+
+static bool amd_pmc_is_stb_supported(struct amd_pmc_dev *dev)
+{
+	switch (dev->cpu_id) {
+	case AMD_CPU_ID_YC:
+	case AMD_CPU_ID_CB:
+		dev->s2d_msg_id = 0xBE;
+		return true;
+	case AMD_CPU_ID_PS:
+		dev->s2d_msg_id = 0x85;
+		return true;
+	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
+	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
+		dev->s2d_msg_id = 0xDE;
+		return true;
+	default:
+		return false;
+	}
+}
+
 int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
 {
 	u32 phys_addr_low, phys_addr_hi;
@@ -59,6 +255,16 @@ int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
 	u32 size = 0;
 	int ret;
 
+	if (!enable_stb)
+		return 0;
+
+	if (amd_pmc_is_stb_supported(dev))
+		debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
+				    &amd_pmc_stb_debugfs_fops_v2);
+	else
+		debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
+				    &amd_pmc_stb_debugfs_fops);
+
 	/* Spill to DRAM feature uses separate SMU message port */
 	dev->msg_port = 1;
 
diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index e70a56d85ac5..58fdf044fd36 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -43,19 +43,12 @@
 #define AMD_PMC_STB_S2IDLE_PREPARE	0xC6000001
 #define AMD_PMC_STB_S2IDLE_RESTORE	0xC6000002
 #define AMD_PMC_STB_S2IDLE_CHECK	0xC6000003
-#define AMD_PMC_STB_DUMMY_PC		0xC6000007
 
 /* STB S2D(Spill to DRAM) has different message port offset */
 #define AMD_S2D_REGISTER_MESSAGE	0xA20
 #define AMD_S2D_REGISTER_RESPONSE	0xA80
 #define AMD_S2D_REGISTER_ARGUMENT	0xA88
 
-/* STB Spill to DRAM Parameters */
-#define S2D_RSVD_RAM_SPACE		0x100000
-
-/* STB Spill to DRAM Message Definition */
-#define STB_FORCE_FLUSH_DATA		0xCF
-
 /* Base address of SMU for mapping physical address to virtual address */
 #define AMD_PMC_MAPPING_SIZE		0x01000
 #define AMD_PMC_BASE_ADDR_OFFSET	0x10000
@@ -101,11 +94,6 @@ enum amd_pmc_def {
 	MSG_OS_HINT_RN,
 };
 
-struct amd_pmc_stb_v2_data {
-	size_t size;
-	u8 data[] __counted_by(size);
-};
-
 struct amd_pmc_bit_map {
 	const char *name;
 	u32 bit_mask;
@@ -137,18 +125,10 @@ static const struct amd_pmc_bit_map soc15_ip_blk[] = {
 	{}
 };
 
-static bool enable_stb;
-module_param(enable_stb, bool, 0644);
-MODULE_PARM_DESC(enable_stb, "Enable the STB debug mechanism");
-
 static bool disable_workarounds;
 module_param(disable_workarounds, bool, 0644);
 MODULE_PARM_DESC(disable_workarounds, "Disable workarounds for platform bugs");
 
-static bool dump_custom_stb;
-module_param(dump_custom_stb, bool, 0644);
-MODULE_PARM_DESC(dump_custom_stb, "Enable to dump full STB buffer");
-
 static struct amd_pmc_dev pmc;
 
 static inline u32 amd_pmc_reg_read(struct amd_pmc_dev *dev, int reg_offset)
@@ -178,155 +158,6 @@ struct smu_metrics {
 	u64 timecondition_notmet_totaltime[32];
 } __packed;
 
-static int amd_pmc_stb_debugfs_open(struct inode *inode, struct file *filp)
-{
-	struct amd_pmc_dev *dev = filp->f_inode->i_private;
-	u32 size = FIFO_SIZE * sizeof(u32);
-	u32 *buf;
-	int rc;
-
-	buf = kzalloc(size, GFP_KERNEL);
-	if (!buf)
-		return -ENOMEM;
-
-	rc = amd_pmc_read_stb(dev, buf);
-	if (rc) {
-		kfree(buf);
-		return rc;
-	}
-
-	filp->private_data = buf;
-	return rc;
-}
-
-static ssize_t amd_pmc_stb_debugfs_read(struct file *filp, char __user *buf, size_t size,
-					loff_t *pos)
-{
-	if (!filp->private_data)
-		return -EINVAL;
-
-	return simple_read_from_buffer(buf, size, pos, filp->private_data,
-				       FIFO_SIZE * sizeof(u32));
-}
-
-static int amd_pmc_stb_debugfs_release(struct inode *inode, struct file *filp)
-{
-	kfree(filp->private_data);
-	return 0;
-}
-
-static const struct file_operations amd_pmc_stb_debugfs_fops = {
-	.owner = THIS_MODULE,
-	.open = amd_pmc_stb_debugfs_open,
-	.read = amd_pmc_stb_debugfs_read,
-	.release = amd_pmc_stb_debugfs_release,
-};
-
-/* Enhanced STB Firmware Reporting Mechanism */
-static int amd_pmc_stb_handle_efr(struct file *filp)
-{
-	struct amd_pmc_dev *dev = filp->f_inode->i_private;
-	struct amd_pmc_stb_v2_data *stb_data_arr;
-	u32 fsize;
-
-	fsize = dev->dram_size - S2D_RSVD_RAM_SPACE;
-	stb_data_arr = kmalloc(struct_size(stb_data_arr, data, fsize), GFP_KERNEL);
-	if (!stb_data_arr)
-		return -ENOMEM;
-
-	stb_data_arr->size = fsize;
-	memcpy_fromio(stb_data_arr->data, dev->stb_virt_addr, fsize);
-	filp->private_data = stb_data_arr;
-
-	return 0;
-}
-
-static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
-{
-	struct amd_pmc_dev *dev = filp->f_inode->i_private;
-	u32 fsize, num_samples, val, stb_rdptr_offset = 0;
-	struct amd_pmc_stb_v2_data *stb_data_arr;
-	int ret;
-
-	/* Write dummy postcode while reading the STB buffer */
-	ret = amd_pmc_write_stb(dev, AMD_PMC_STB_DUMMY_PC);
-	if (ret)
-		dev_err(dev->dev, "error writing to STB: %d\n", ret);
-
-	/* Spill to DRAM num_samples uses separate SMU message port */
-	dev->msg_port = 1;
-
-	ret = amd_pmc_send_cmd(dev, 0, &val, STB_FORCE_FLUSH_DATA, 1);
-	if (ret)
-		dev_dbg_once(dev->dev, "S2D force flush not supported: %d\n", ret);
-
-	/*
-	 * We have a custom stb size and the PMFW is supposed to give
-	 * the enhanced dram size. Note that we land here only for the
-	 * platforms that support enhanced dram size reporting.
-	 */
-	if (dump_custom_stb)
-		return amd_pmc_stb_handle_efr(filp);
-
-	/* Get the num_samples to calculate the last push location */
-	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->s2d_msg_id, true);
-	/* Clear msg_port for other SMU operation */
-	dev->msg_port = 0;
-	if (ret) {
-		dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n", ret);
-		return ret;
-	}
-
-	fsize = min(num_samples, S2D_TELEMETRY_BYTES_MAX);
-	stb_data_arr = kmalloc(struct_size(stb_data_arr, data, fsize), GFP_KERNEL);
-	if (!stb_data_arr)
-		return -ENOMEM;
-
-	stb_data_arr->size = fsize;
-
-	/*
-	 * Start capturing data from the last push location.
-	 * This is for general cases, where the stb limits
-	 * are meant for standard usage.
-	 */
-	if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
-		/* First read oldest data starting 1 behind last write till end of ringbuffer */
-		stb_rdptr_offset = num_samples % S2D_TELEMETRY_BYTES_MAX;
-		fsize = S2D_TELEMETRY_BYTES_MAX - stb_rdptr_offset;
-
-		memcpy_fromio(stb_data_arr->data, dev->stb_virt_addr + stb_rdptr_offset, fsize);
-		/* Second copy the newer samples from offset 0 - last write */
-		memcpy_fromio(stb_data_arr->data + fsize, dev->stb_virt_addr, stb_rdptr_offset);
-	} else {
-		memcpy_fromio(stb_data_arr->data, dev->stb_virt_addr, fsize);
-	}
-
-	filp->private_data = stb_data_arr;
-
-	return 0;
-}
-
-static ssize_t amd_pmc_stb_debugfs_read_v2(struct file *filp, char __user *buf, size_t size,
-					   loff_t *pos)
-{
-	struct amd_pmc_stb_v2_data *data = filp->private_data;
-
-	return simple_read_from_buffer(buf, size, pos, data->data, data->size);
-}
-
-static int amd_pmc_stb_debugfs_release_v2(struct inode *inode, struct file *filp)
-{
-	kfree(filp->private_data);
-	return 0;
-}
-
-static const struct file_operations amd_pmc_stb_debugfs_fops_v2 = {
-	.owner = THIS_MODULE,
-	.open = amd_pmc_stb_debugfs_open_v2,
-	.read = amd_pmc_stb_debugfs_read_v2,
-	.release = amd_pmc_stb_debugfs_release_v2,
-};
-
 static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
 {
 	switch (dev->cpu_id) {
@@ -335,18 +166,15 @@ static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
 	case AMD_CPU_ID_YC:
 	case AMD_CPU_ID_CB:
 		dev->num_ips = 12;
-		dev->s2d_msg_id = 0xBE;
 		dev->smu_msg = 0x538;
 		break;
 	case AMD_CPU_ID_PS:
 		dev->num_ips = 21;
-		dev->s2d_msg_id = 0x85;
 		dev->smu_msg = 0x538;
 		break;
 	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
 	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
 		dev->num_ips = 22;
-		dev->s2d_msg_id = 0xDE;
 		dev->smu_msg = 0x938;
 		break;
 	}
@@ -610,20 +438,6 @@ static void amd_pmc_dbgfs_unregister(struct amd_pmc_dev *dev)
 	debugfs_remove_recursive(dev->dbgfs_dir);
 }
 
-static bool amd_pmc_is_stb_supported(struct amd_pmc_dev *dev)
-{
-	switch (dev->cpu_id) {
-	case AMD_CPU_ID_YC:
-	case AMD_CPU_ID_CB:
-	case AMD_CPU_ID_PS:
-	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
-	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
-		return true;
-	default:
-		return false;
-	}
-}
-
 static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
 {
 	dev->dbgfs_dir = debugfs_create_dir("amd_pmc", NULL);
@@ -633,15 +447,6 @@ static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
 			    &s0ix_stats_fops);
 	debugfs_create_file("amd_pmc_idlemask", 0644, dev->dbgfs_dir, dev,
 			    &amd_pmc_idlemask_fops);
-	/* Enable STB only when the module_param is set */
-	if (enable_stb) {
-		if (amd_pmc_is_stb_supported(dev))
-			debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
-					    &amd_pmc_stb_debugfs_fops_v2);
-		else
-			debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
-					    &amd_pmc_stb_debugfs_fops);
-	}
 }
 
 static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
@@ -1017,11 +822,9 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	/* Get num of IP blocks within the SoC */
 	amd_pmc_get_ip_info(dev);
 
-	if (enable_stb && amd_pmc_is_stb_supported(dev)) {
-		err = amd_pmc_s2d_init(dev);
-		if (err)
-			goto err_pci_dev_put;
-	}
+	err = amd_pmc_s2d_init(dev);
+	if (err)
+		goto err_pci_dev_put;
 
 	platform_set_drvdata(pdev, dev);
 	if (IS_ENABLED(CONFIG_SUSPEND)) {
diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
index ffc9eaf8a522..8f939ab32510 100644
--- a/drivers/platform/x86/amd/pmc/pmc.h
+++ b/drivers/platform/x86/amd/pmc/pmc.h
@@ -14,14 +14,6 @@
 #include <linux/types.h>
 #include <linux/mutex.h>
 
-enum s2d_arg {
-	S2D_TELEMETRY_SIZE = 0x01,
-	S2D_PHYS_ADDR_LOW,
-	S2D_PHYS_ADDR_HIGH,
-	S2D_NUM_SAMPLES,
-	S2D_DRAM_SIZE,
-};
-
 struct amd_mp2_dev {
 	void __iomem *mmio;
 	void __iomem *vslbase;
@@ -78,12 +70,6 @@ void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
 #define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT 0x1122
 #define PCI_DEVICE_ID_AMD_MP2_STB	0x172c
 
-/* STB Spill to DRAM Parameters */
-#define S2D_TELEMETRY_BYTES_MAX		0x100000U
-
-/* STB Spill to DRAM Message Definition */
-#define FIFO_SIZE		4096
-
 int amd_pmc_s2d_init(struct amd_pmc_dev *dev);
 int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf);
 int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data);
-- 
2.34.1


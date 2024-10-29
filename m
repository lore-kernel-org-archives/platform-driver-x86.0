Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2041.outbound.protection.outlook.com [40.107.220.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB30194C6E
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Oct 2024 15:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730217320; cv=fail; b=cdoSbT8PYBJ6Vu5BlBSXe1T+aGsnMtViUX7XIgSKdvyJWONaP9UzyDoJl3DGYZo0HWZ0fgQJSXt8y1Ri55wW29uOTxQjs+9ml1IogIW0f4lxhypMMmvPPR2hzGZOvkGI5xIYO+1fgn1X+ygOpmoivBYmYxOqLNGKbn30B+TXC8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730217320; c=relaxed/simple;
	bh=YOTaSyS62y2PNyuPVHhgJAPG0dYYDPg0Gmjw6w+Qi+U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TRXyA1kcLk2jr9rUufIXERHHkycNOSUA2QMeSuXUYGLVEVb5eJUQA1OyN8xMmezgyudu4wJTNaWq4avGJ9kCgSL+UCtjSSlSPyWT/pMp4CrM7JQNBDikYyM3UKucploGUD3PDgUYhMfb6GfvSEgR9O45yetTrLGO/O8xvyfClXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3MD6X448; arc=fail smtp.client-ip=40.107.220.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3MD6X448"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DsetqQXDYdLGskC3HwfjgB2u+VBCaJkDMlG241vq648eu+FxUYHX+LflQhipjMFur3NZD0skPJQfxDt+6xYuqKysQKj2dGKeU5+ORKctxUsVyKOC/CnDIHtT9TezT5JyWPkb+JaosQFU+WJ20raJgpGGPaX7Pp9egbYkO2edWPavK76UGmSMgZNl15uJnu+QabOKH86kVflz+izvzAoH0ayQmlk/QOMZJxb/gy5pHdUAJmiZp0bRLXiFHVRnfmsVBSlXyHLJOrIgZGq1AO6CnHL/Kn6JaUOOsnnk0QPw/GyZVqqhpMdlTAjfN9rBOYUCYB/XKF6rQ/lzSUSu84WOCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L7pe28tDkNsrLwdBY0hNDL6zl8H4fBfj77d3WRhFc4U=;
 b=DOSZ5RwPYqbEpzlEhP2bgLg+7vKbxtIhgYfE7NupvJPJe/Wg0nK20yAejxRFwAHI0hvqBhwIcfpnJXRjKqzED8KHtwtf0xR5hLX1zjDNfCC99dOlsviWsX9+y+rSxYx+ysZx37cy0Sjw8kDoHAayogshAXomz/N5ehB5xjI5C/wtvcoEE8gtzoLvsfeDShFG8vSqRaLspH0E4pXhjkE5ObH0oFAlZvSZkCAo4PXctUlvdxAVXDYPI7RfNzgSbA9QOA2BX6NHPVSUoCmy/pQ2i5wJJZs5FvwMyRm8ZJm+vlaeMlVLW8B/8EFO/MbiE4Mt6wGnw1SKwhvC7rxkQONolw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L7pe28tDkNsrLwdBY0hNDL6zl8H4fBfj77d3WRhFc4U=;
 b=3MD6X4481P+EAO1mmy8sk6B9wR4RFSMY4+JCBSp8zdO5542t0nElz61XJNZRXELnSunTZDMQ7XGD7YrZI/5tFQ43FW03uhnF5EF12EHndBi6aI7tHgpwkLnjJikq/s65URpNd09fUZd5G/ixx4sOHnvh7yHpuBlZbQjkSc0NFDY=
Received: from CY5PR15CA0160.namprd15.prod.outlook.com (2603:10b6:930:67::28)
 by SA1PR12MB6896.namprd12.prod.outlook.com (2603:10b6:806:24f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Tue, 29 Oct
 2024 15:55:15 +0000
Received: from CY4PEPF0000EE3F.namprd03.prod.outlook.com
 (2603:10b6:930:67:cafe::ba) by CY5PR15CA0160.outlook.office365.com
 (2603:10b6:930:67::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.17 via Frontend
 Transport; Tue, 29 Oct 2024 15:55:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3F.mail.protection.outlook.com (10.167.242.17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Tue, 29 Oct 2024 15:55:14 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Oct
 2024 10:55:09 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>
Subject: [PATCH v2 2/8] platform/x86/amd/pmc: Update function names to align with new STB file
Date: Tue, 29 Oct 2024 21:24:34 +0530
Message-ID: <20241029155440.3499273-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029155440.3499273-1-Shyam-sundar.S-k@amd.com>
References: <20241029155440.3499273-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3F:EE_|SA1PR12MB6896:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c11ecd1-7e9c-44de-26c6-08dcf8321441
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d84p1XU3BPNYyFjQwsl5Ez+guvlbg7KSUZK3SOwaFT64aRWB3qB3zRsdH79C?=
 =?us-ascii?Q?UlFM8VRyc3TT5UkFyGCOOWY91ctS24LaoiEyYvbMMfsvOUHml0mQCxWFGlIy?=
 =?us-ascii?Q?BZcgyKJcDcTihRyjdRC2eIPWvyYV7Q1Ifmn4QNGC3heviamsWC6FMoi9nhl/?=
 =?us-ascii?Q?YFHpSwmofEzlECLf36oJcHwSkmLStpB1Q6hk9LbEUgu8eDfYOVG/kDkTP3zB?=
 =?us-ascii?Q?rfxKyrdVBpm/pOa/sLSDNiF9dBjQux7/ZTdDgl74taKEC9GsLJ8/LCBUOCPX?=
 =?us-ascii?Q?dF2RVeJdfS4Hs/Bobro/YWT34IJKbiyw6J3wJYyIkdbXNFs4NzMdnn0Js+68?=
 =?us-ascii?Q?9qzVDvsy9mTWRrc56zBfhrEuZbUtQrn1sP5znad7W5+ErUFaIzr/dtkjAno2?=
 =?us-ascii?Q?8PJCDE+AbtawyHJUHWTpvZjqo4q26FaEBfOxAX40ypLNpzR9yZ7euVukPSIe?=
 =?us-ascii?Q?zI51IZsRDXYL1G3GyqJFiyC2sjgQXAcw2+XLZcFll/mawaMa45D/ZSW4hGfX?=
 =?us-ascii?Q?/QJyesTyzUa6nxJ7xhg8zyzibgc8YEmjBWyWueaKjqF/f9+sXdUbcx0qT1KV?=
 =?us-ascii?Q?z9EXcxeSxwlGXeDFAzRb4dVWq0wrDZ5/BUCor4acSQA7TM8jRFpE9ShwDGv9?=
 =?us-ascii?Q?mxzoa+efF7eyiYD2PduBblY0crOeYtQZzustmGIVcwDrQVUMBgldN2NJzcO+?=
 =?us-ascii?Q?7HFOG1Doez3nyeAEDQG0PH/NqYsTAXJVlWoWTrTREwed2AJKgrPqinvV1JmA?=
 =?us-ascii?Q?cNt2gTo56Bs8RIQkAqB+j083nX8hFjZZO0S/GfeHkFTcBH3ofUGFgkePGVJu?=
 =?us-ascii?Q?e9xd7jF0B4SM6rU5ukdjF3joQKogiw3SB0/8Ju2cAGM7Ap2awvuIFEzyv/Cp?=
 =?us-ascii?Q?753lOo9Zo7X93Lb4Lg4Sk0mldux9BUygkBEBdNvpBcH43LykY/ujNbXk4b+T?=
 =?us-ascii?Q?1vQjMt15Kv+1rx52TrlTpvJx3Yav7qcHbw+exv/92hko4CJGk5mJtPVp021V?=
 =?us-ascii?Q?gBHEvqXMwXN4cYODsQPO3iLOGRVVMaXregp5cvs6VUKaw3wKHZGNJ1uwFY32?=
 =?us-ascii?Q?OYllCeL+wK+qMC1KxOn+bhl/LFQxgRA8EVGczelgRX7Dhn6n52f6yGbd0GUb?=
 =?us-ascii?Q?wGvOAnho226d/tUCSOg26P0uRPMoA0aKebB/CX1Bo6rZrB6f5GJSG/0Zdf2b?=
 =?us-ascii?Q?vWYOsinuk2xid97nDjTSJSjUvRNmy0tjvh2BZIVJMJ9DUz67sSVgGWShZAB/?=
 =?us-ascii?Q?KZLdN5S/d978hefi0gNo+RK5rE0QXzqYNt2CnBjhwCOGdCvSzrvRRiNsNn4J?=
 =?us-ascii?Q?AHHUt5Jj3ZEdohwQifR1QCBdBBQIex+j4Yt+dM32RTlgWS898x0NN1pA2lY9?=
 =?us-ascii?Q?kHLXojLM9DVNvVcRRXqiniToV/lxwvBg3XGPJrWS8hw2Rgg18Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 15:55:14.9760
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c11ecd1-7e9c-44de-26c6-08dcf8321441
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6896

With STB now in a separate file, update the function names to match the
correct naming schema by removing the _pmc_ prefix where needed.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/mp1_stb.c | 61 +++++++++++++-------------
 drivers/platform/x86/amd/pmc/pmc.c     |  8 ++--
 drivers/platform/x86/amd/pmc/pmc.h     |  4 +-
 3 files changed, 36 insertions(+), 37 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/mp1_stb.c b/drivers/platform/x86/amd/pmc/mp1_stb.c
index 9a34dd94982c..5efec020ecac 100644
--- a/drivers/platform/x86/amd/pmc/mp1_stb.c
+++ b/drivers/platform/x86/amd/pmc/mp1_stb.c
@@ -47,12 +47,12 @@ enum s2d_arg {
 	S2D_DRAM_SIZE,
 };
 
-struct amd_pmc_stb_v2_data {
+struct amd_stb_v2_data {
 	size_t size;
 	u8 data[] __counted_by(size);
 };
 
-int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data)
+int amd_write_stb(struct amd_pmc_dev *dev, u32 data)
 {
 	int err;
 
@@ -65,7 +65,7 @@ int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data)
 	return 0;
 }
 
-static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf)
+static int amd_read_stb(struct amd_pmc_dev *dev, u32 *buf)
 {
 	int i, err;
 
@@ -81,7 +81,7 @@ static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf)
 	return 0;
 }
 
-static int amd_pmc_stb_debugfs_open(struct inode *inode, struct file *filp)
+static int amd_stb_debugfs_open(struct inode *inode, struct file *filp)
 {
 	struct amd_pmc_dev *dev = filp->f_inode->i_private;
 	u32 size = FIFO_SIZE * sizeof(u32);
@@ -92,7 +92,7 @@ static int amd_pmc_stb_debugfs_open(struct inode *inode, struct file *filp)
 	if (!buf)
 		return -ENOMEM;
 
-	rc = amd_pmc_read_stb(dev, buf);
+	rc = amd_read_stb(dev, buf);
 	if (rc) {
 		kfree(buf);
 		return rc;
@@ -102,8 +102,7 @@ static int amd_pmc_stb_debugfs_open(struct inode *inode, struct file *filp)
 	return rc;
 }
 
-static ssize_t amd_pmc_stb_debugfs_read(struct file *filp, char __user *buf, size_t size,
-					loff_t *pos)
+static ssize_t amd_stb_debugfs_read(struct file *filp, char __user *buf, size_t size, loff_t *pos)
 {
 	if (!filp->private_data)
 		return -EINVAL;
@@ -112,24 +111,24 @@ static ssize_t amd_pmc_stb_debugfs_read(struct file *filp, char __user *buf, siz
 				       FIFO_SIZE * sizeof(u32));
 }
 
-static int amd_pmc_stb_debugfs_release(struct inode *inode, struct file *filp)
+static int amd_stb_debugfs_release(struct inode *inode, struct file *filp)
 {
 	kfree(filp->private_data);
 	return 0;
 }
 
-static const struct file_operations amd_pmc_stb_debugfs_fops = {
+static const struct file_operations amd_stb_debugfs_fops = {
 	.owner = THIS_MODULE,
-	.open = amd_pmc_stb_debugfs_open,
-	.read = amd_pmc_stb_debugfs_read,
-	.release = amd_pmc_stb_debugfs_release,
+	.open = amd_stb_debugfs_open,
+	.read = amd_stb_debugfs_read,
+	.release = amd_stb_debugfs_release,
 };
 
 /* Enhanced STB Firmware Reporting Mechanism */
-static int amd_pmc_stb_handle_efr(struct file *filp)
+static int amd_stb_handle_efr(struct file *filp)
 {
 	struct amd_pmc_dev *dev = filp->f_inode->i_private;
-	struct amd_pmc_stb_v2_data *stb_data_arr;
+	struct amd_stb_v2_data *stb_data_arr;
 	u32 fsize;
 
 	fsize = dev->dram_size - S2D_RSVD_RAM_SPACE;
@@ -144,15 +143,15 @@ static int amd_pmc_stb_handle_efr(struct file *filp)
 	return 0;
 }
 
-static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
+static int amd_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 {
 	struct amd_pmc_dev *dev = filp->f_inode->i_private;
 	u32 fsize, num_samples, val, stb_rdptr_offset = 0;
-	struct amd_pmc_stb_v2_data *stb_data_arr;
+	struct amd_stb_v2_data *stb_data_arr;
 	int ret;
 
 	/* Write dummy postcode while reading the STB buffer */
-	ret = amd_pmc_write_stb(dev, AMD_PMC_STB_DUMMY_PC);
+	ret = amd_write_stb(dev, AMD_PMC_STB_DUMMY_PC);
 	if (ret)
 		dev_err(dev->dev, "error writing to STB: %d\n", ret);
 
@@ -169,7 +168,7 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 	 * platforms that support enhanced dram size reporting.
 	 */
 	if (dump_custom_stb)
-		return amd_pmc_stb_handle_efr(filp);
+		return amd_stb_handle_efr(filp);
 
 	/* Get the num_samples to calculate the last push location */
 	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->s2d_msg_id, true);
@@ -209,28 +208,28 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 	return 0;
 }
 
-static ssize_t amd_pmc_stb_debugfs_read_v2(struct file *filp, char __user *buf, size_t size,
-					   loff_t *pos)
+static ssize_t amd_stb_debugfs_read_v2(struct file *filp, char __user *buf, size_t size,
+				       loff_t *pos)
 {
-	struct amd_pmc_stb_v2_data *data = filp->private_data;
+	struct amd_stb_v2_data *data = filp->private_data;
 
 	return simple_read_from_buffer(buf, size, pos, data->data, data->size);
 }
 
-static int amd_pmc_stb_debugfs_release_v2(struct inode *inode, struct file *filp)
+static int amd_stb_debugfs_release_v2(struct inode *inode, struct file *filp)
 {
 	kfree(filp->private_data);
 	return 0;
 }
 
-static const struct file_operations amd_pmc_stb_debugfs_fops_v2 = {
+static const struct file_operations amd_stb_debugfs_fops_v2 = {
 	.owner = THIS_MODULE,
-	.open = amd_pmc_stb_debugfs_open_v2,
-	.read = amd_pmc_stb_debugfs_read_v2,
-	.release = amd_pmc_stb_debugfs_release_v2,
+	.open = amd_stb_debugfs_open_v2,
+	.read = amd_stb_debugfs_read_v2,
+	.release = amd_stb_debugfs_release_v2,
 };
 
-static bool amd_pmc_is_stb_supported(struct amd_pmc_dev *dev)
+static bool amd_is_stb_supported(struct amd_pmc_dev *dev)
 {
 	switch (dev->cpu_id) {
 	case AMD_CPU_ID_YC:
@@ -249,7 +248,7 @@ static bool amd_pmc_is_stb_supported(struct amd_pmc_dev *dev)
 	}
 }
 
-int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
+int amd_s2d_init(struct amd_pmc_dev *dev)
 {
 	u32 phys_addr_low, phys_addr_hi;
 	u64 stb_phys_addr;
@@ -259,12 +258,12 @@ int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
 	if (!enable_stb)
 		return 0;
 
-	if (amd_pmc_is_stb_supported(dev))
+	if (amd_is_stb_supported(dev))
 		debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
-				    &amd_pmc_stb_debugfs_fops_v2);
+				    &amd_stb_debugfs_fops_v2);
 	else
 		debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
-				    &amd_pmc_stb_debugfs_fops);
+				    &amd_stb_debugfs_fops);
 
 	/* Spill to DRAM feature uses separate SMU message port */
 	dev->msg_port = 1;
diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index a977ff1e52b5..8e7c87505327 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -667,7 +667,7 @@ static void amd_pmc_s2idle_prepare(void)
 		return;
 	}
 
-	rc = amd_pmc_write_stb(pdev, AMD_PMC_STB_S2IDLE_PREPARE);
+	rc = amd_write_stb(pdev, AMD_PMC_STB_S2IDLE_PREPARE);
 	if (rc)
 		dev_err(pdev->dev, "error writing to STB: %d\n", rc);
 }
@@ -686,7 +686,7 @@ static void amd_pmc_s2idle_check(void)
 	/* Dump the IdleMask before we add to the STB */
 	amd_pmc_idlemask_read(pdev, pdev->dev, NULL);
 
-	rc = amd_pmc_write_stb(pdev, AMD_PMC_STB_S2IDLE_CHECK);
+	rc = amd_write_stb(pdev, AMD_PMC_STB_S2IDLE_CHECK);
 	if (rc)
 		dev_err(pdev->dev, "error writing to STB: %d\n", rc);
 }
@@ -713,7 +713,7 @@ static void amd_pmc_s2idle_restore(void)
 	/* Let SMU know that we are looking for stats */
 	amd_pmc_dump_data(pdev);
 
-	rc = amd_pmc_write_stb(pdev, AMD_PMC_STB_S2IDLE_RESTORE);
+	rc = amd_write_stb(pdev, AMD_PMC_STB_S2IDLE_RESTORE);
 	if (rc)
 		dev_err(pdev->dev, "error writing to STB: %d\n", rc);
 
@@ -828,7 +828,7 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	}
 
 	amd_pmc_dbgfs_register(dev);
-	err = amd_pmc_s2d_init(dev);
+	err = amd_s2d_init(dev);
 	if (err)
 		goto err_pci_dev_put;
 
diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
index 07fcb13a4136..7e7f9170124c 100644
--- a/drivers/platform/x86/amd/pmc/pmc.h
+++ b/drivers/platform/x86/amd/pmc/pmc.h
@@ -75,8 +75,8 @@ void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
 #define AMD_S2D_REGISTER_RESPONSE	0xA80
 #define AMD_S2D_REGISTER_ARGUMENT	0xA88
 
-int amd_pmc_s2d_init(struct amd_pmc_dev *dev);
-int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data);
+int amd_s2d_init(struct amd_pmc_dev *dev);
+int amd_write_stb(struct amd_pmc_dev *dev, u32 data);
 int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret);
 
 #endif /* PMC_H */
-- 
2.34.1


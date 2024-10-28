Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2063.outbound.protection.outlook.com [40.107.237.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF4616C684
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Oct 2024 07:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730099116; cv=fail; b=LxQ/2/cOE2TgXWBHDZOeeASBierhtBKJhO7m5/psDyKfwO9yB9GN5EOQ1UM1YA13gAjf/vPOSRaS07mlRz5l0YxkOFvb4BDTcvJBWw2ou1m4b+sX5hbs4oc1hVEqZjjf1vkzSh/cBS2mEyKPLshKCGHnNeH188PxcaaloJFbyI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730099116; c=relaxed/simple;
	bh=3Dq2YdLouN7R/wW8GlPTlxC+WLVrDJvTltPxwwKUJbM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hPpGcB26brChzYlbSOcWrGLmTZysKORvfwNJbopxq0jC8jkWg0+TnDcHbzO8my/wW48TfzIqxHknPC/2qoxJdw+kpRTVuV7YZAJElISPBgjwRyIrFtehRejb14bQLchaGO1qA2GBD9kZEPpGUBRKwOO7jN1mDT7M2km+cZYsVQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=K5Fr4i4N; arc=fail smtp.client-ip=40.107.237.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="K5Fr4i4N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cUw+I3t4yh/zfk9t6sMKJtecaQo7o7vIIWXvuXdZUGk6CWkmJ0HrrGKW2xIEqjQJPTRJ3qufsFotx9s/agCIJoDwy129QdZtnjSJ1iKqtdajDqkH9KcMdTkTB0JZQeGb3BbHzjGXCF1fz988QPVCRkj2oJdFEgUm2ZHSXz49q2dD7YvjZhRq3fci+39bhCOA/JjmBGScYmdXQD2m7c2BWKU31zQsBlPSTFfKsH9AuAvpWNXta9SKffFCX+mnMJO75tMUYkLwBw//AlGXbrSePV8Qdu39aqIU/0LRcOZH16Da2JvtXMoHcnFwcdjOpczm8UAbfdPZKEIbsewYn20omQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JTBV++Fg6ajMCxcHx2JhQ+ZdXlihJAEHacoGovkwTf4=;
 b=tQ9vqyzxLHeQTqNLx7OqMoxGVxDsrEx090aXgKJlqhvDtFzg+G6vxwA36+8GMn9upXox2mu4+ejdcjeGVpXxf9/941SrxLLUtY3LlKLx2ZuTtuIIfBPZxHRgbVglfDP1OuFJmhi1t0YoFvjf76D6Wxh5G7ZQD0+Kv0Ju40nwzcaThMF3c5doWeyn5lsiStvlumuydsw4dzmmZ9u0bMt3CP/NlcjyH7uxZn7IO5Ck6d5REhoLnN9+qgqsaQ4Rj+QTW8NtqXPRJqHKFFDPnK28hR/m7azyDn5SLy8TvRCqwyVD9MelF88CiiZAzaXz+kIzhYeBf8WMO5Eir62Dnn5x9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JTBV++Fg6ajMCxcHx2JhQ+ZdXlihJAEHacoGovkwTf4=;
 b=K5Fr4i4N98KbKE1FN/4hp+s7HGBO8QS10d+GKmSFjqAr83dFodgPjBStHw6L3DaCRO4sL9Lbvjmx1MKHlnDnlKHGy1LZ2ldcHEA/+IIu/eXm11OrVvZ+H9OLKRGzk9w6qRTx+ffPO7gMwV61LRGsTHcJXr5ykkZGoqEuHYuYuj0=
Received: from MW4P223CA0020.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::25)
 by LV8PR12MB9208.namprd12.prod.outlook.com (2603:10b6:408:182::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Mon, 28 Oct
 2024 07:05:07 +0000
Received: from CO1PEPF000075EF.namprd03.prod.outlook.com
 (2603:10b6:303:80:cafe::1a) by MW4P223CA0020.outlook.office365.com
 (2603:10b6:303:80::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.26 via Frontend
 Transport; Mon, 28 Oct 2024 07:05:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075EF.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Mon, 28 Oct 2024 07:05:07 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Oct
 2024 02:05:04 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 2/8] platform/x86/amd/pmc: Update function names to align with new STB file
Date: Mon, 28 Oct 2024 12:34:32 +0530
Message-ID: <20241028070438.1548737-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241028070438.1548737-1-Shyam-sundar.S-k@amd.com>
References: <20241028070438.1548737-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EF:EE_|LV8PR12MB9208:EE_
X-MS-Office365-Filtering-Correlation-Id: ce73bcdf-efb2-43e8-c25e-08dcf71edadd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5yWALSgnR70TC+dVXD4BouKi2T+73gru+PyCg2/FZEtN0NfmdictN7nN/esv?=
 =?us-ascii?Q?n6gD7OKmeW1TgR9UhPkxaZekYjsVYQM8O/Vps03RTzTXJ79OhFxAYnncvbKJ?=
 =?us-ascii?Q?lxovbegbtyFxPSxYIRXBOsa7uPxmjoaZ2yDcxjkZd/yWX8aXDHA7tVllbd3j?=
 =?us-ascii?Q?AVPN3iVKlvgQUXiPbxJhBtSyQdRQ9YxkeKPYk1ttsFh5US2tKkgzqpCLg6P0?=
 =?us-ascii?Q?T0SQWGvA7VlLv04LAN5IEGupd2y63j0HcXlfcjHWCdHwoC4m2h/OgERLQoYK?=
 =?us-ascii?Q?0JXzD/uQyhggzGghPQSk/JIT/fPh/CVhECU3BZFrvWeJnIfPU78x8DkSFEgO?=
 =?us-ascii?Q?U2DDPvQP/cNhUMDrtT/Ejfp48vMvyFdqRnQUq86hTsRj6s5OSUCrZ9fBJExQ?=
 =?us-ascii?Q?A5GaFz+ivYCck6ssbovMIe6VfkzLbvCf9X7PkPjpBqs946DqtChq7RQ9pDK6?=
 =?us-ascii?Q?jiSzYk/zDe5lPkV+r3/3oeWX15MttjN06WsogThiADXDi7m5s4lgqesXYuk7?=
 =?us-ascii?Q?I1eqqvkH/P+eTe5ZhF+4t6RSKPbIh+F7Bry+MSpsqw5HPy4shAiFarERzqr4?=
 =?us-ascii?Q?zg7zQVO781B/AHYhC9GWfEGpOC1JT3Ge8NMWlgME8KAT1HdPRhTGrexnryaH?=
 =?us-ascii?Q?LrJGfZXOj+fRQ3Z2QPM9r6qPwoad0I70qHzrG9508b72HqRDYIKkL8KcevQV?=
 =?us-ascii?Q?OlZZpoCCz0/kFxwwnWLGTCSQGasdtlaulZliyJcwTOY2F5G0np2wejWtqKx3?=
 =?us-ascii?Q?CdfvIPXz+Drs+J1myyAAfuLclbqFtZB/5CfgpWGd22AR/JNKDiF7BCLxMCNQ?=
 =?us-ascii?Q?Ivc1tThhopbR8YWe0APDLQQTwsWZMmoYib6rbAZZZvHiVC52ZUDLX7WFD3wQ?=
 =?us-ascii?Q?Zcr4nT/XuA5nJwcvA80y+Z6eZe/cH0tdv8lBIa+Xm8FTPsLzw0Mh9qsHCII9?=
 =?us-ascii?Q?+GNUmrx1Az+U+BMbUTKsV/nNXfMgjOTvwSs/00RZuuNcLdcb0+pPb1KGa3S0?=
 =?us-ascii?Q?5CuFIFIuhJhyHgFXcGz9sRTGbvCzebzgZS5c5j67g6YNFZzqfYjf9iefSt/R?=
 =?us-ascii?Q?XmBzDoqOenprJ0g9I/jjia+H/M64/zzU7/R/oAf2adt/6nrZtoeq0GUMhig5?=
 =?us-ascii?Q?zCsrhukwBfVq1RDCzQhTzc8cFReD0Ysnp9o2eMNx267SKZAKBBxawn2Drfjv?=
 =?us-ascii?Q?JarjkniDacgrsxNskr6plk+FuO1MzDNYu6y2ev8Bv5lZlp3nRBLP4cotCMe2?=
 =?us-ascii?Q?uwI9VxApjhmtAjZ7YEy/KJQgAdcKbJ4ZZO7IOnXdIruUuMyJ8usLMHBJaS0X?=
 =?us-ascii?Q?Wk/Oa9g1bQku0lhAbpt6q3jr40u0OyLCI0TLjivsuM0x5N/bXdkj1raFne+I?=
 =?us-ascii?Q?HFSFGuh0GX0VwsEiY4DSRye+BhoARyD7Rs75MF2mohM6e7lM1Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 07:05:07.1251
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce73bcdf-efb2-43e8-c25e-08dcf71edadd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075EF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9208

With STB now in a separate file, update the function names to match the
correct naming schema by removing the _pmc_ prefix where needed.

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


Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2086.outbound.protection.outlook.com [40.107.243.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8782196D9D
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 Nov 2024 07:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730964466; cv=fail; b=QjMtQZO3ryUSErM8odeUD57vONaafcepEbjOiUBgE0rh0x98b9Z6PGvZHKlyIoY3D7p8bZvd5B+xPrznBvZwsKHCQWvVL7max2eyJzvMAY0SNyOrd35j7pTeGGP+gM2Yi+HgVBpug6xR6yJipgTYvrR7dspY6j7Edw5vhALkXqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730964466; c=relaxed/simple;
	bh=5mLaW8LB+pSaQ6oeo/KkCfZpRjKmIIKWuN4UOVmQHsk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cR2+pN+Y8hxM3FL5CAEfYFE7qv+rdn4fhR5XdMQnke6fwLKtZmBSEoygGYVNxPH4aLo+46kbxpb63wkMls45zzgb+vKJLmublNgKZ68DIOkIVYxm9rXki3ykNcHkIphmgYms0HPMNwLU9uuhforohiZn0Ky8le+NadbV5bcin1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=38nwqva9; arc=fail smtp.client-ip=40.107.243.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="38nwqva9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zE89i5vqi+PwFbhsmR3O73yWJ9vPmV3k1H7pKU4XUAVylP5hR+lZCJDuDXycvOO3zjITBkFf/nBtZv8Wivk3x+DfjEvIVaguIN8/ZFEh591BVCUpXByZ85MwRfZT03cp92RqF1iJS69sfDWvsW24C0W9kvusXKD9LAIkcJEViFRgtOXKJFrS69IHC3iQm8LZjys27pKVvx8YiCNAc+pZNok6mzyLX8ktqctDCgzJCo7Vq3yYh19EChV1iY3aPqMYvvsacYhZNqco+ObGy+QAOYeBWtBpKzuEJpp+Gr8svSKMjce1ixe3W/7WCLfOqYlNJDVYCk0lW/spBWZehzTwJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jzYZZp2PuY7Q/QQBTiphlUU1N0aAtLylUqALyE7O8Io=;
 b=QgTDuyiwnG0toWWAX4HsuXmmToiI/RehUJ/6P7IsryrnH1tfR0mFDWcEcnlcgFuJtddI/4UUGx8735lkfIWFMmQafqN8CqRlmiJzfLfUg4blu+5WJRpSpMqgeYOpap6SwScR5C/01E7cSliuEZwH7BoFdTMmToGXA/5fgrcZ+8RvZJywjWqjEXKl9IfEuBUNB/YoAxinEEuWvKHHbst41Q3NimCOe9QBqdyZWjTz8Y5y8uw2JpNKU9TAygaNrqK5YkdkGHPiGarWijEty9XSPwAHeBo8JjdNjGxoSCQgkuo6/M2S23YPRNRD22KBzxoVdHYeTdOUm9b5MJZi3jxflg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jzYZZp2PuY7Q/QQBTiphlUU1N0aAtLylUqALyE7O8Io=;
 b=38nwqva9En2d4ovSr/zF+bHqF3noZ8MU+9c9QTmgiEoltL6pLcGVzPzsYlaEpRI+0ENbMkA+HY4JaPAtwsV4KF1KLtKJ3W2t7dFcQNXopah4mPOUNlfpMZOMBnmy75yb4AXCFZLYTJBk4nPKWsY7uaygxjVmnSoL3YJMPgWMd3c=
Received: from PH0PR07CA0023.namprd07.prod.outlook.com (2603:10b6:510:5::28)
 by PH7PR12MB9074.namprd12.prod.outlook.com (2603:10b6:510:2f4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Thu, 7 Nov
 2024 07:27:39 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2603:10b6:510:5:cafe::9) by PH0PR07CA0023.outlook.office365.com
 (2603:10b6:510:5::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19 via Frontend
 Transport; Thu, 7 Nov 2024 07:27:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Thu, 7 Nov 2024 07:27:39 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Nov
 2024 01:27:37 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>
Subject: [PATCH v4 04/11] platform/x86/amd/pmc: Update function names to align with new STB file
Date: Thu, 7 Nov 2024 12:57:07 +0530
Message-ID: <20241107072714.943423-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241107072714.943423-1-Shyam-sundar.S-k@amd.com>
References: <20241107072714.943423-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|PH7PR12MB9074:EE_
X-MS-Office365-Filtering-Correlation-Id: 051cd0bd-5a71-4ade-e247-08dcfefda8f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HkvJN88Bm9TPqMlAw4gFQ0SOz2ga8AtF0yOWOtObq5BncvcqHslW9Y5OoTlo?=
 =?us-ascii?Q?Ws+v7t5rSivamb+VGjCL6kJGwF1lW5vmZhzXOxFezxnq8lP2EVCRY7monc9m?=
 =?us-ascii?Q?q0LkcY6iaFh/89BA9N6ejTctXaNOku+F24tBTFRWmPo/hE4nPBM9BjAf2H6f?=
 =?us-ascii?Q?zFvK6Yti8zFGwZZLuFhkMKH8ojMmXyhKVAuLZLCO1VnZ5gCwZHW3kYvCadxd?=
 =?us-ascii?Q?S3dPJSo0x41RGaDxiJbpyddt73Drfys3Bdhxz/iIRbmqyKZYb+TzIhD0qNMS?=
 =?us-ascii?Q?U+df0PPAlzXp1xYIv15GZuQaHyZhjfcH/YtiJp+u981bRFciXcetPWQgfXWX?=
 =?us-ascii?Q?Dj/W5QKJQsmJe37VAULbFqfdnjcyiMAvMBPsfAvRLfNhmFxW26bK09iMGga+?=
 =?us-ascii?Q?SAfnWfL2jWJuKmlG9eLI7atpocKBkKKwIYg7jkTRgsxQthkWNV9TrOfSa+lW?=
 =?us-ascii?Q?m7tnuAddHbmDNOlo+LZMmEcV5YxsZmZyMfgmeP+9h7F95amnQ8bSQfTjJ41B?=
 =?us-ascii?Q?WAL0sDPQw38sdM06TYKYeKth4U8wr5FWJNz0C3bfaG6KWuSIqw0h7GEvnWmA?=
 =?us-ascii?Q?T2lUiC6QAEUmo/BktzdFC4BJ4oKb1pMDIPVWow5JfBLDdDUljLEi8gUo2G/R?=
 =?us-ascii?Q?sCoHb+ruAjtIZmSAlqsE9fbuK0l2f/125TrwK8YQwE2wtJoA6C1rzFtAlida?=
 =?us-ascii?Q?gsgxMVgCZUa0Q4oq0EsvvK/YE89xllOXVQ2ESmm/z5vVTsk/MpZKJehI/jhD?=
 =?us-ascii?Q?o8jdab6ImdJ44bZyjWMKPcooGaBhlzngj3vIerdtQkMxOAg915lqqnKgicqC?=
 =?us-ascii?Q?ielzB7OygURl5wPFUz69IstsQNVkNlVdgaq3+zruwk1aRAxDBDNraLNHfbkZ?=
 =?us-ascii?Q?rcCWQ2t8QBKcYQk+kiaiJ9xPTh9qkSqX9j6Z3NMAB8mFxz1pqG7WnnNXg7SA?=
 =?us-ascii?Q?KOysDDQF7gVYIg/M3XeZKTkas5TgC5gvb7RQiCHDsqClrsCx5l3ZFWeVy6s9?=
 =?us-ascii?Q?ESJlfadWif1Nqn5R2ygf+Z6g+a5vGz07iKrp0vku4vb4id9Kw44DR/sr7pjf?=
 =?us-ascii?Q?vfI+3VaVgpKT9jihEbWoLJGPudDzJJCrBkHmWqyoa3e7VnXmoKSFkUbBAaht?=
 =?us-ascii?Q?JxZpQw33+1sRpCsxX3D0+xQNVVQJMhgPlLxZK4/nN/08RtKrvkTVFEhHis+P?=
 =?us-ascii?Q?rGxPuAPv380ds6dtV6wwvHg3qxfTaV3UCr9NHDhGs6iIS5Yh+WFPyLWz0GfU?=
 =?us-ascii?Q?BTMrHbZX7HH5AysT3WuY1RD7/+qmMu6V0R9UkHdxsLGrbvZ6hJg2K5KOisa/?=
 =?us-ascii?Q?U8gxW7Z/aX7knZtdMinpJ9HHxDPCLya6xUiTAZNzu4b7gqbi1ZM26N1FSb9y?=
 =?us-ascii?Q?8LwHUllUjw/Sf7MY5OihzHJIGD2XeJla8V0D6sXdybtmhd4mtg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 07:27:39.3657
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 051cd0bd-5a71-4ade-e247-08dcfefda8f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9074

With STB now in a separate file, update the function names to match the
correct naming schema by removing the _pmc_ prefix where needed.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/mp1_stb.c | 71 +++++++++++++-------------
 drivers/platform/x86/amd/pmc/pmc.c     |  8 +--
 drivers/platform/x86/amd/pmc/pmc.h     |  6 +--
 3 files changed, 42 insertions(+), 43 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/mp1_stb.c b/drivers/platform/x86/amd/pmc/mp1_stb.c
index 29e0241190e4..5c03ac92558f 100644
--- a/drivers/platform/x86/amd/pmc/mp1_stb.c
+++ b/drivers/platform/x86/amd/pmc/mp1_stb.c
@@ -24,7 +24,7 @@
 #define S2D_RSVD_RAM_SPACE		0x100000
 
 /* STB Registers */
-#define AMD_PMC_STB_PMI_0		0x03E30600
+#define AMD_STB_PMI_0			0x03E30600
 #define AMD_PMC_STB_DUMMY_PC	0xC6000007
 
 /* STB Spill to DRAM Message Definition */
@@ -47,32 +47,32 @@ enum s2d_arg {
 	S2D_DRAM_SIZE,
 };
 
-struct amd_pmc_stb_v2_data {
+struct amd_stb_v2_data {
 	size_t size;
 	u8 data[] __counted_by(size);
 };
 
-int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data)
+int amd_stb_write(struct amd_pmc_dev *dev, u32 data)
 {
 	int err;
 
-	err = amd_smn_write(0, AMD_PMC_STB_PMI_0, data);
+	err = amd_smn_write(0, AMD_STB_PMI_0, data);
 	if (err) {
-		dev_err(dev->dev, "failed to write data in stb: 0x%X\n", AMD_PMC_STB_PMI_0);
+		dev_err(dev->dev, "failed to write data in stb: 0x%X\n", AMD_STB_PMI_0);
 		return pcibios_err_to_errno(err);
 	}
 
 	return 0;
 }
 
-int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf)
+int amd_stb_read(struct amd_pmc_dev *dev, u32 *buf)
 {
 	int i, err;
 
 	for (i = 0; i < FIFO_SIZE; i++) {
-		err = amd_smn_read(0, AMD_PMC_STB_PMI_0, buf++);
+		err = amd_smn_read(0, AMD_STB_PMI_0, buf++);
 		if (err) {
-			dev_err(dev->dev, "error reading data from stb: 0x%X\n", AMD_PMC_STB_PMI_0);
+			dev_err(dev->dev, "error reading data from stb: 0x%X\n", AMD_STB_PMI_0);
 			return pcibios_err_to_errno(err);
 		}
 	}
@@ -80,7 +80,7 @@ int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf)
 	return 0;
 }
 
-static int amd_pmc_stb_debugfs_open(struct inode *inode, struct file *filp)
+static int amd_stb_debugfs_open(struct inode *inode, struct file *filp)
 {
 	struct amd_pmc_dev *dev = filp->f_inode->i_private;
 	u32 size = FIFO_SIZE * sizeof(u32);
@@ -91,7 +91,7 @@ static int amd_pmc_stb_debugfs_open(struct inode *inode, struct file *filp)
 	if (!buf)
 		return -ENOMEM;
 
-	rc = amd_pmc_read_stb(dev, buf);
+	rc = amd_stb_read(dev, buf);
 	if (rc) {
 		kfree(buf);
 		return rc;
@@ -101,8 +101,7 @@ static int amd_pmc_stb_debugfs_open(struct inode *inode, struct file *filp)
 	return rc;
 }
 
-static ssize_t amd_pmc_stb_debugfs_read(struct file *filp, char __user *buf, size_t size,
-					loff_t *pos)
+static ssize_t amd_stb_debugfs_read(struct file *filp, char __user *buf, size_t size, loff_t *pos)
 {
 	if (!filp->private_data)
 		return -EINVAL;
@@ -111,24 +110,24 @@ static ssize_t amd_pmc_stb_debugfs_read(struct file *filp, char __user *buf, siz
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
@@ -143,15 +142,15 @@ static int amd_pmc_stb_handle_efr(struct file *filp)
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
+	ret = amd_stb_write(dev, AMD_PMC_STB_DUMMY_PC);
 	if (ret)
 		dev_err(dev->dev, "error writing to STB: %d\n", ret);
 
@@ -168,7 +167,7 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 	 * platforms that support enhanced dram size reporting.
 	 */
 	if (dump_custom_stb)
-		return amd_pmc_stb_handle_efr(filp);
+		return amd_stb_handle_efr(filp);
 
 	/* Get the num_samples to calculate the last push location */
 	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->s2d_msg_id, true);
@@ -208,28 +207,28 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
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
@@ -248,7 +247,7 @@ static bool amd_pmc_is_stb_supported(struct amd_pmc_dev *dev)
 	}
 }
 
-int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
+int amd_stb_s2d_init(struct amd_pmc_dev *dev)
 {
 	u32 phys_addr_low, phys_addr_hi;
 	u64 stb_phys_addr;
@@ -258,12 +257,12 @@ int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
 	if (!enable_stb)
 		return 0;
 
-	if (amd_pmc_is_stb_supported(dev)) {
+	if (amd_is_stb_supported(dev)) {
 		debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
-				    &amd_pmc_stb_debugfs_fops_v2);
+				    &amd_stb_debugfs_fops_v2);
 	} else {
 		debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
-				    &amd_pmc_stb_debugfs_fops);
+				    &amd_stb_debugfs_fops);
 		return 0;
 	}
 
diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 6ebb9123ba00..7726a05091a5 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -671,7 +671,7 @@ static void amd_pmc_s2idle_prepare(void)
 		return;
 	}
 
-	rc = amd_pmc_write_stb(pdev, AMD_PMC_STB_S2IDLE_PREPARE);
+	rc = amd_stb_write(pdev, AMD_PMC_STB_S2IDLE_PREPARE);
 	if (rc)
 		dev_err(pdev->dev, "error writing to STB: %d\n", rc);
 }
@@ -690,7 +690,7 @@ static void amd_pmc_s2idle_check(void)
 	/* Dump the IdleMask before we add to the STB */
 	amd_pmc_idlemask_read(pdev, pdev->dev, NULL);
 
-	rc = amd_pmc_write_stb(pdev, AMD_PMC_STB_S2IDLE_CHECK);
+	rc = amd_stb_write(pdev, AMD_PMC_STB_S2IDLE_CHECK);
 	if (rc)
 		dev_err(pdev->dev, "error writing to STB: %d\n", rc);
 }
@@ -717,7 +717,7 @@ static void amd_pmc_s2idle_restore(void)
 	/* Let SMU know that we are looking for stats */
 	amd_pmc_dump_data(pdev);
 
-	rc = amd_pmc_write_stb(pdev, AMD_PMC_STB_S2IDLE_RESTORE);
+	rc = amd_stb_write(pdev, AMD_PMC_STB_S2IDLE_RESTORE);
 	if (rc)
 		dev_err(pdev->dev, "error writing to STB: %d\n", rc);
 
@@ -832,7 +832,7 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	}
 
 	amd_pmc_dbgfs_register(dev);
-	err = amd_pmc_s2d_init(dev);
+	err = amd_stb_s2d_init(dev);
 	if (err)
 		goto err_pci_dev_put;
 
diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
index 8f939ab32510..188284feca72 100644
--- a/drivers/platform/x86/amd/pmc/pmc.h
+++ b/drivers/platform/x86/amd/pmc/pmc.h
@@ -70,9 +70,9 @@ void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
 #define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT 0x1122
 #define PCI_DEVICE_ID_AMD_MP2_STB	0x172c
 
-int amd_pmc_s2d_init(struct amd_pmc_dev *dev);
-int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf);
-int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data);
+int amd_stb_s2d_init(struct amd_pmc_dev *dev);
+int amd_stb_read(struct amd_pmc_dev *dev, u32 *buf);
+int amd_stb_write(struct amd_pmc_dev *dev, u32 data);
 int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret);
 
 #endif /* PMC_H */
-- 
2.34.1


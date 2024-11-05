Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3501915C144
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 Nov 2024 17:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730828285; cv=fail; b=HchdRZszQcDVw4mMq5b/V0h+BnAeEhdP6/oDgXQTZLXF2R68JFe9Dm0Tgryut1xE02NYCKy78BN8Bm6PVfel+3rJfQKkmSK+joIQbkDf+KF855atq0CSuI2c4zDUiFFY6zV8ti+dxGM1UR+K47+Pbu6/GOOiWusNwhyTJzhwoWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730828285; c=relaxed/simple;
	bh=5mLaW8LB+pSaQ6oeo/KkCfZpRjKmIIKWuN4UOVmQHsk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q0St2xLb9tnBEaClXeS31OmomTlZnR8tpfmuH78IjzzRRFJEDjYSVCUxiUbyJ5UjRpDifdJQsw95wbNEYuKbM0xCKVYFG77AqSvWDJnIDFfCgwUoDc/W9J3wlcfs+4ppK3o5y5/Z/rrmy/bT03biuj81LRafsCQShSmi03p1iiY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EEWUZTiY; arc=fail smtp.client-ip=40.107.223.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EEWUZTiY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mo7TbZgSfPml9MgiqkntfbUdQ1s9OI08GUnPMd4hpZurxvVrwp9k+o4ZZD6e887VOx/TbX6EJp9F98SvyT3+mAe6VUS8dkja+MbcmF67LgwuRxNmttaLc7Dn2cM0odNYPmdy+R6CQcI7fUUWHq28MO/UQh2RdUpQLYMHlqGbA2A9oSmPmquTuw16FiG5sNpLOozAJaQf87e6UU4mMBps6PjnEngVGjURZeY5AoTfKtSkpX4FofEvEFJNL/uK/XjUDYox2FeGXimxBjA2EPLUvKRMX/9MNS+VtYgEcuSbRKET/FvwxKdfQbgY9DcmYhOtcuKOEvt2sW7igtTGH4LHGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jzYZZp2PuY7Q/QQBTiphlUU1N0aAtLylUqALyE7O8Io=;
 b=NopL2TYB+tiDnol0hqHw0Y97BhiQQyTrGMtg9SuEH81DZ16EBAw3JOlfxnwAQd3SAEd6LMDqKlFlrdYBQB1a/ch6nmLc4KhXjHQVHzb8XKj5KzfS9xYV4J2yBQ95X+PCyTI9+DEjBSzH9bSoBi4ZS4cBV0bPMprRkfi4UZuNCaR79YB2+FRi4UWBX1gSLSiu0RPSd7lHk74F+2vxIk/Byu5UqoYTG6E0Ts3PfY/RNWtKUpmrXMFVOBYyRZn8drJ/sZhDi+A3++n/KtDJjOaVUdcrhKRfnaWa/KMMcOD0Ow2Tgu+L1kha/FT2KAKW6tvzHku3gn9pynbWLCAfJKvW5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jzYZZp2PuY7Q/QQBTiphlUU1N0aAtLylUqALyE7O8Io=;
 b=EEWUZTiYGQ5FTMXnZunVQfldmN0IET/2hTIThlBwlpLOLAoJANF06fOUW9RHLkbaGsmywFh8AdT7/JwFltoY0VoQ4LnRoaWFsKhQPn3fd3EO7uj+NcUa9Tbk8uluFdj1eZIjTup/Ds4fKuZgeC40uhISfNA90N9qBCiNlo5GlMM=
Received: from BY5PR16CA0012.namprd16.prod.outlook.com (2603:10b6:a03:1a0::25)
 by IA1PR12MB6353.namprd12.prod.outlook.com (2603:10b6:208:3e3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 17:37:54 +0000
Received: from SJ1PEPF00002315.namprd03.prod.outlook.com
 (2603:10b6:a03:1a0:cafe::84) by BY5PR16CA0012.outlook.office365.com
 (2603:10b6:a03:1a0::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.29 via Frontend
 Transport; Tue, 5 Nov 2024 17:37:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002315.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Tue, 5 Nov 2024 17:37:53 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 5 Nov
 2024 11:37:51 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>
Subject: [PATCH v3 05/13] platform/x86/amd/pmc: Update function names to align with new STB file
Date: Tue, 5 Nov 2024 23:06:29 +0530
Message-ID: <20241105173637.733589-6-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002315:EE_|IA1PR12MB6353:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ca96629-290b-4a6b-7014-08dcfdc09409
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AC5YPZGdm3TJPpWW2eX3EO/KBYYQCSx1T78cZ4RKX8zMRUdFN+T2mscSkUhs?=
 =?us-ascii?Q?1lYpm5mNqRfSjSKGO28P5d5LyR+PDWl9LK0apf6A+i/93AVtMAHVA3u58MeH?=
 =?us-ascii?Q?CM9c3BQFCSvtyNxK+1AWfkDMM4LJ5YzwxeoZ3C/cBEuwYZ/fnNN7jChwtBkm?=
 =?us-ascii?Q?RYg5uTd8NH3+pCPTkYCczHleLb0xthGlOAmt4XhSm2rS6W3QF6KjnmTZBmur?=
 =?us-ascii?Q?d/Lz8/BU5HAYNleWTemE3XRQq7oyilPiMbJB0XPuX3wGjxDy6cRIPXRsXHya?=
 =?us-ascii?Q?stHBWROISdTEmrD7ZaNetJpggIaXVVJqysIiIAOwLih5iE4Vih8S6hwQMMED?=
 =?us-ascii?Q?b9UVQJvtqLQzKSzSC/b+f8kAx3AckDrDGnWbw2j+YVN8DItvVUWMpCWsDxtH?=
 =?us-ascii?Q?BnodJ3JtuQJg45/8IaVojHvKNAZ2k4l8Dg9eb5YkGiHv7X7uSkmhZ4K3nbVz?=
 =?us-ascii?Q?X+mMxVffbtmCJEoyhfsMKg8YD1tA2+A+ywJvKShjHaGvaiJ2QMKRLWZofsC7?=
 =?us-ascii?Q?qOguNYPrVEK01ucraJKp8IWMpl0lN/nWGdk5Uwlq+gB686zulWxVfQXgnY10?=
 =?us-ascii?Q?7Qy3ZchBGE1UgB30sSeQa9Mhc95n2SpyN3yIB3Gq51U+nqcXg9YxiqJ2LHdF?=
 =?us-ascii?Q?+IxLuz2VguW9UGEqPiJO8mdQ22+XXJpqBqBYHRSmzUZugaXnmAUaSoKCUPIR?=
 =?us-ascii?Q?01iQsoHzSPoW8Q/40eh16y6bdBm0Lyf/tfXndzP1jJ5idJhOcpBOoI7W4/mE?=
 =?us-ascii?Q?aKDJPii5TubG0mnMdi7B5RsBSLHD2utVm+bUkXlZOtIoAL+9SF1PPy/+oVXi?=
 =?us-ascii?Q?K6J6Pf5+Jt1D9Ls4SYdHsAP6159InZkVuWNsmvLrAk/YRhXC851oF1P6D5Ks?=
 =?us-ascii?Q?0UPqGzE4E2O6Vo6pLp+EjsyqtXdIbu/eS7kKZ3fRJwjtqkuxb/GOveojA2CD?=
 =?us-ascii?Q?eioioaq9KkHGT9ZQUBzAe99FbUcf2W9EGWetyMqNs5dLVvgBgnRKOXxBnB8V?=
 =?us-ascii?Q?y6wBNQcC+5kBMJDMLA3nF/lyeUmBnbT+XTSGUDQvxvcWZ8rkiMwm3t0nbI3W?=
 =?us-ascii?Q?UQWH6LeFxKPve/pbYH+GGNZrM6gJ03vnjsuT4afLa/L1zK/dTI95FcZISMDV?=
 =?us-ascii?Q?WkyvqBpoDygy0LQV3mH/078PtxbiJsbl5joHpKJTS6XLbX3LCqhKhap2dkVF?=
 =?us-ascii?Q?VBC035JnRrHzLo48544vWNyVrkdGlJPMwgGR5c6A4Cp7++mu3F7Cjg0koX7u?=
 =?us-ascii?Q?vrYNMCDJLq+kqrZAxmY1UmXczppAX7ii0auWcNSG+lbJ1HIq6IYQoAy6jvo+?=
 =?us-ascii?Q?FqxRoKN8g+33nFTW0b5EonAMoBGuFpquSBISc+HECPWWmGmWF0FK2LLW45d0?=
 =?us-ascii?Q?WYvS3uZjZ22dMniXQZP9SCyGer9qf5wvNcedxfbVQMGtwXeppA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 17:37:53.7399
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ca96629-290b-4a6b-7014-08dcfdc09409
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002315.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6353

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


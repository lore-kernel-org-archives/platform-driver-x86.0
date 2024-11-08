Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2042.outbound.protection.outlook.com [40.107.223.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387611D12E5
	for <platform-driver-x86@vger.kernel.org>; Fri,  8 Nov 2024 07:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731049743; cv=fail; b=p81rlHBB8EEab0XLCpXs4hNDg8M+7RJjqmE7MurM2V40gFs71o+D3abhI/fHZDaw4Tv0IT3xg+arEJH6+Vv2NNjeibyOi3FYaTm0vX36zMkmlMHdJ4LBkxjAn5QD84hOt5qEAUj01/hbdD+tyiLyq6e+Bt9oCx4Gr3KU5nymcUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731049743; c=relaxed/simple;
	bh=5mLaW8LB+pSaQ6oeo/KkCfZpRjKmIIKWuN4UOVmQHsk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=St6UDxrX7GeNjXhmdH/1lg08mvgp9H3nebBJK8BPJO97HUcL3sUfWWp7poTKdg0pYIDKl+DDXiGmtorgGkfdX4CzpmbOdRCmpZYJTwJKJMz5l+AnxtMKIc7PALBUxHA0AvgHGzkAiC03ALAkzIXle4FEirDviyt+JUg1UJ5aDgY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AmlwcyzI; arc=fail smtp.client-ip=40.107.223.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AmlwcyzI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jkVhDw/aRaDy2IZfh3RdldGuCgk2XKxDpEU4h+J8FZoWmzx0KdomXXF7bHJBlxZ3hbdVfBB7AG+6skyvsk2RAWE00eTtZrDBF1R3pnaxDse8gXhhQwGXXRQg6ixlv8ZAoQYvlcNP7b3xYGhIhVvROOuULbdyBHIkx/SS7lnr3sKmSmgNaGiQpNeWMoiZRDTXyIUxH07B6UwxfIMJBuqdm2zVutnEwcGipztlxwod7DSQHnq3BfaThC/VLGLxTBrjnruDpopCEZaIQLHY7WLUdCBsXRwGBhWlkcJZy1W0PcIp2eh1PnEhmhnKKgd/+4tqcpFJEatr4m5MSWy1wXMS8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jzYZZp2PuY7Q/QQBTiphlUU1N0aAtLylUqALyE7O8Io=;
 b=s8vSksAZHNa0zouIUBNXu1ID/1k0YiaeN92Cuw0rxUrSMvnLoPjrIwI3iOnSbUFcMW0gWK8cS3rbKu8fAl0b0XY3HyHcIlXARARgvscx2+k7/bImcRag+fglSk1kIhOpIFo5YH6xZFJiu56phFX+UzWtFJiVLtEOyVbQ3g85f68qWBeauh7NzJqvW1zX5sv+xqG0NuH/tksuGs9ef4qj0m7Aps4PYcVv0RPBMLkQugCC4CwLDLCT/VdnmpxO7YKVuDYuFzghyfplcdBERxJJEm2lNmi4rBzl8Vh03cl82ifpeXmtmeNW1MinAIN5JXyrNTPYW/f2lrHVxefZhrfCpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jzYZZp2PuY7Q/QQBTiphlUU1N0aAtLylUqALyE7O8Io=;
 b=AmlwcyzIoe4JskWq2gAktA6X5ys/uY9ge9LR8wejUkAmBRZOKbYs/sZmmxwktxepyjh3EQLGnxDB3j+rYv8IEsfyLMeFL0ESktfAMXPWzeKJZdMQ9q7Hm00jKeRaiSuBA8edTuEOOAOPrXapmhCSTiFJDoSyGGqeTDBLHP3Viq0=
Received: from CH5PR05CA0021.namprd05.prod.outlook.com (2603:10b6:610:1f0::18)
 by SA1PR12MB7269.namprd12.prod.outlook.com (2603:10b6:806:2be::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Fri, 8 Nov
 2024 07:08:55 +0000
Received: from CH3PEPF0000000A.namprd04.prod.outlook.com
 (2603:10b6:610:1f0:cafe::70) by CH5PR05CA0021.outlook.office365.com
 (2603:10b6:610:1f0::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.10 via Frontend
 Transport; Fri, 8 Nov 2024 07:08:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF0000000A.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Fri, 8 Nov 2024 07:08:55 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Nov
 2024 01:08:52 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>
Subject: [PATCH v5 03/10] platform/x86/amd/pmc: Update function names to align with new STB file
Date: Fri, 8 Nov 2024 12:38:15 +0530
Message-ID: <20241108070822.3912689-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241108070822.3912689-1-Shyam-sundar.S-k@amd.com>
References: <20241108070822.3912689-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000A:EE_|SA1PR12MB7269:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e083582-2048-4bf9-884e-08dcffc43552
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jLGK4G9GB/byHveIZU+yW2UX3uQYbbnGw4YlKXHyEt/Wr3g0eUAZKsC9WouY?=
 =?us-ascii?Q?qoY2BxeMvW7A6AqXuF4F9BEqNUdGRzym2c7kcA55hp5cjtcQTajFdsH/+tKb?=
 =?us-ascii?Q?iyW8Pn1PFVFVJgNi3zkxMNW/DwAx7SrT4nYRhDhg7yJLB+KYp63bLSRoQgqq?=
 =?us-ascii?Q?dhKa1czZ4abqfMW/d8S74EPx3awImkoR+2xFdk7Sx1LxfcaHrgHh/qPZpdWd?=
 =?us-ascii?Q?V1z0XBmvdZKguazBHaNr6cNlzx2cAveGzK+2HEi1pa43kuRefsL+En3CtPHD?=
 =?us-ascii?Q?fQ3n05z02mHL9ZqIvBnOnjZV9F+o/dqv7113tSOOJMjTM+lDB5SaJJGhgjPT?=
 =?us-ascii?Q?jlPXy5gTwHjYiJV+Ec6V9OTiE2jsi/sjwUrKeiUyllOo3//A9EV77m9SpgvP?=
 =?us-ascii?Q?KwLzokrXv/rDsOUzm1lvM+aOc6irBBl8zwhmKofqP78jcTAhZGxZP3V8YL0O?=
 =?us-ascii?Q?P/6hdygpKghH4hbHiGgzK6pf9pIgXCtkqEASdDUHxp1mCBfhFhnwfHdqPMLM?=
 =?us-ascii?Q?WeBanH6r6uvOzmmdpA+BxjTDvlloWtPI7+gPS5kZaxTOsPo+A9uebRlWMLqw?=
 =?us-ascii?Q?BYRYCkbGS6HsD6FQCWn4VC4NWWkW6G3tsaXVoHuM2zlugLLu49Izr3XgPkkb?=
 =?us-ascii?Q?1M3OFTEbp0nQVZuviQPuSuxYAZ+vkWboJvEHk6jm3TTe9xbBC7fYBVgQxk1+?=
 =?us-ascii?Q?eYcEEWXESbQ84LUPZOnmWWlQMmEpHPQsrAOZQIQ3L6Odj1NBQUKCwdUonDvP?=
 =?us-ascii?Q?EnKDYe6lrShUppce0jL4GbJA+jFPq9JN6rJnQBBzs5C34h9AlVF3naD2AnNC?=
 =?us-ascii?Q?oWPosPJ6t3BsV8hWcf1FrPlPaJ5c5baO+SjCpKNFV6JEonGD27mV5OyBSl1S?=
 =?us-ascii?Q?lzH6lf+fmKjEhydXL3MgAhxDyq42lU7XTKKvYxsh8IXUTreCQQHQM4uonxNW?=
 =?us-ascii?Q?fqdGFNiOywxvFS22/GHjifYZYEYeZMnv8PnrlxT9oK0Mb0gWRJoVgyBZPDnE?=
 =?us-ascii?Q?/mJ70F89HcS8wR6u1spSEdM2ThSFOceiYRDKYuUB0aX6nQyELHVnldMlC0F2?=
 =?us-ascii?Q?M/fmunCPc0Nz1uwd2Z0iG2ngIM/bqh+xSRY/N59rNkaceG6wLMLrRIT5W2MT?=
 =?us-ascii?Q?TVI1NhgD7v9MJSe5SbYtXfYQwRy4wPpkUClzmQu3jyRtBpGEopRAMHwk/+sy?=
 =?us-ascii?Q?gXfuwzJfBZO9a5a7Q+NvSFOQd4C+fIbOyqMvt43bwP4iCExSwvA1thUHKAVS?=
 =?us-ascii?Q?D+ld9PxHpNd2tajiWX1M93Qq+TEXSNmNr7Ws9p8A0MNMVWLPzj2EylYFj1Sq?=
 =?us-ascii?Q?I2Gb9VPw3UwqPZ3JKWwYzceSS4+tQvLWJLARQ9nbgwF+NxK+r44zlgffyJHw?=
 =?us-ascii?Q?U1dmMWA/6XBNL16NuW50VXNIFG6OkRGjAm4PG9KHLT+RInp6Fg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 07:08:55.2104
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e083582-2048-4bf9-884e-08dcffc43552
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7269

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


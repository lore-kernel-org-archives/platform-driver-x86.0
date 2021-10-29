Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E8B8C433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri, 29 Oct 2021 17:24:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 02DA061056
	for <platform-driver-x86@archiver.kernel.org>; Fri, 29 Oct 2021 17:24:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbhJ2R1K (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 29 Oct 2021 13:27:10 -0400
Received: from mail-bn8nam08on2085.outbound.protection.outlook.com ([40.107.100.85]:43329
        "EHLO NAM04-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230189AbhJ2R1H (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 29 Oct 2021 13:27:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J8VYZO8n3oRG9IbpaKar3LGUaNOYU7Xl00PwpF3Sgh96CJUXVch3/6ssq1ilVONJdfXkhc8k1f7uk+vGE9yT48f+7mQjned9HXNc7ZbJ/FS2YZjWUTGUceNw1j4gW6x7b9jpJEmaObunw1GNSHXO153otCGyh/+RT3O1Zgg1L7rCTYFYtMhJpPH6G45ukH/gEzZb+swHKc4T/oax+n6Zfo6Wi19ekVL2X5mteHVxEysNyv8B+3AkF2n1IXRB0HoLb4APMl2Ozk3F13vDCNHVnqEo8wDGrLOlPIjynysBgGYHauctHUouE+UXPE/uzHm6HiKdq5DWDK41FphhkJtZdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=laIUuNQj43A8JohPzC06Gi2dNhiBuTG+2pST+Z6zsZ4=;
 b=VHWbvvSP47JNYpo+i5Nd2Uu3pzODvjx0EhgojBnNbbVD1iP7xhFYHYzKPPkBeFxhyZR98gHqgY0eMSBAZKQSw5g63DX/mN7aw0jzaF/HTchmzHSkgHm0wolJ2xKpQ/yYeFvRjeN+H2CkwWBikmO2WDW4DFV4brCqiyXMQSFIvWwh9TauH+yhKJA5/AmXxlh1qHyJELgc1awYHZoMTvelock4KhZ9TCzbbUxTtmjE3wOeydCTL1F0iJOWe7fsGojaEQKyTTmIP9HReYTXrsQoCkX5zB2iuNMpdwbHFn4vj1hkobn4Ee8OGPHu2M06/6F4EP52KKC9cYcaEWzCGoj2LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=laIUuNQj43A8JohPzC06Gi2dNhiBuTG+2pST+Z6zsZ4=;
 b=iLqyRATWFIiNVzUvgMjoLl3tqjnPOFM9h6/7xnU7A1qoBwvrOaKx8eeoBEwyKnichE7yJgUl9L6/x4cScNnKnIX09u4b2aoL6edEkGr5XVOsWQSNpRBovOgkqZ3nkudcv2lsLqJky3YMIQ2WjrJfPcPblg0lWc6LHpr2GiiLXNg=
Received: from MWHPR12CA0034.namprd12.prod.outlook.com (2603:10b6:301:2::20)
 by CH2PR12MB4197.namprd12.prod.outlook.com (2603:10b6:610:ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Fri, 29 Oct
 2021 17:24:35 +0000
Received: from CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:2:cafe::18) by MWHPR12CA0034.outlook.office365.com
 (2603:10b6:301:2::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Fri, 29 Oct 2021 17:24:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT059.mail.protection.outlook.com (10.13.174.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4649.14 via Frontend Transport; Fri, 29 Oct 2021 17:24:35 +0000
Received: from Celadon-CZN.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Fri, 29 Oct
 2021 12:24:32 -0500
From:   Sanket Goswami <Sanket.Goswami@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <hdegoede@redhat.com>,
        <mgross@linux.intel.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Sanket Goswami <Sanket.Goswami@amd.com>
Subject: [PATCH v5 3/3] platform/x86: amd-pmc: Add support for AMD Smart Trace Buffer
Date:   Fri, 29 Oct 2021 22:53:04 +0530
Message-ID: <20211029172304.2998-4-Sanket.Goswami@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029172304.2998-1-Sanket.Goswami@amd.com>
References: <20211029172304.2998-1-Sanket.Goswami@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a136dc6-ab61-4135-763c-08d99b00fa81
X-MS-TrafficTypeDiagnostic: CH2PR12MB4197:
X-Microsoft-Antispam-PRVS: <CH2PR12MB41970AEA3759DD747AE096D29C879@CH2PR12MB4197.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kd1lro8aoBQyS3DBzT1x5EFjGuNIOJwcLm7TYUKyXOpJANPFVEz140Sv/vOmC7lIMfFQ5nbxgLAPgm/HdHWNmDucPbdTZ0u+tHG4htne3Tm5V+NCkeNyJZKuSU0qa2ERIyErrjSdQts+NXMsia9+Fs2mYWSHaWsu0EV+tz9+ZdfIQ+mE7odt1JH+zxa4avdxkNuKRfmv4XRTMj6HT5dwXc9gadadk48+HA7cbntvQdZCRfyE1CAnRQqXUEKrhC3CuRmsupXRPwmY6rn20kVMRIVig/XWl3yuz7b6zs+2rqmrFfI/rIAajE7TaCXOCkFYE5ruBKcepIeHTl9aiIzZz2twX4sxOnynMSnUrIrjycFSS7P5UuNAfpdgzoptXoZskUQjpmnqHTIgEWeAoqn77hsq+EJzk/uL+Nh7WToRPun9L+bAsKiOqIfuD8tkLQmy8dXy/TDSmG2QMycooFM9BnBtTEuZrBOqf43zbDnbPDo4lOo9xtrbk2Thqt37iUVZ/76bCtrwThKRnd6KozJZpcNLmiQ+sUYj5SoESc//iL3F/FQy5qHw8aRwMUkjkxVsDze0UvDEOU7Ug954Od5iUuCeJacwcSLROyT4VPn2xG2KJSB24eFbJ/JPb+ohFBLVyRj4r+qMc483E8mNi6IDldop0BKdvKy1R5NZGDYQJBmRSh86FWgzv2UFx500lt2o1ICD5RczjChpnTgN5P9WORyzjfhZ7Ay5aEXE2Xjmhtc=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(2616005)(186003)(26005)(508600001)(36860700001)(7696005)(36756003)(70586007)(83380400001)(16526019)(336012)(356005)(70206006)(81166007)(426003)(316002)(8676002)(8936002)(4326008)(86362001)(82310400003)(5660300002)(110136005)(54906003)(47076005)(1076003)(2906002)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2021 17:24:35.3070
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a136dc6-ab61-4135-763c-08d99b00fa81
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4197
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

STB (Smart Trace Buffer), is a debug trace buffer which is used to help
isolate failures by analyzing the last feature that a system was running
before hitting a failure. This nonintrusive way is always running in the
background and trace is stored into the SoC.

This patch provides mechanism to access the STB buffer using the read
and write routines.

Co-developed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
---
Changes in v5:
- Use kfree() only once in .open as suggested by Hans.

Changes in v4:
- Use kzalloc() for memory allocation.

Changes in v3:
- Use sizeof(u32) with multiplier as suggested by Mark Gross.

Changes in v2:
- Create amd_pmc_stb_debugfs_fops structure to get STB data.
- Address review comments from Hans.

 drivers/platform/x86/amd-pmc.c | 127 +++++++++++++++++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index ea099f7759f2..a39354ea96c4 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -35,6 +35,12 @@
 #define AMD_PMC_SCRATCH_REG_CZN		0x94
 #define AMD_PMC_SCRATCH_REG_YC		0xD14
 
+/* STB Registers */
+#define AMD_PMC_STB_INDEX_ADDRESS	0xF8
+#define AMD_PMC_STB_INDEX_DATA		0xFC
+#define AMD_PMC_STB_PMI_0		0x03E30600
+#define AMD_PMC_STB_PREDEF		0xC6000001
+
 /* Base address of SMU for mapping physical address to virtual address */
 #define AMD_PMC_SMU_INDEX_ADDRESS	0xB8
 #define AMD_PMC_SMU_INDEX_DATA		0xBC
@@ -82,6 +88,7 @@
 #define SOC_SUBSYSTEM_IP_MAX	12
 #define DELAY_MIN_US		2000
 #define DELAY_MAX_US		3000
+#define FIFO_SIZE		4096
 enum amd_pmc_def {
 	MSG_TEST = 0x01,
 	MSG_OS_HINT_PCO,
@@ -128,8 +135,14 @@ struct amd_pmc_dev {
 #endif /* CONFIG_DEBUG_FS */
 };
 
+static bool enable_stb;
+module_param(enable_stb, bool, 0644);
+MODULE_PARM_DESC(enable_stb, "Enable the STB debug mechanism");
+
 static struct amd_pmc_dev pmc;
 static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret);
+static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data);
+static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf);
 
 static inline u32 amd_pmc_reg_read(struct amd_pmc_dev *dev, int reg_offset)
 {
@@ -176,6 +189,50 @@ static int amd_pmc_get_smu_version(struct amd_pmc_dev *dev)
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
+const struct file_operations amd_pmc_stb_debugfs_fops = {
+	.owner = THIS_MODULE,
+	.open = amd_pmc_stb_debugfs_open,
+	.read = amd_pmc_stb_debugfs_read,
+	.release = amd_pmc_stb_debugfs_release,
+};
+
 static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct device *dev,
 				 struct seq_file *s)
 {
@@ -289,6 +346,10 @@ static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
 			    &s0ix_stats_fops);
 	debugfs_create_file("amd_pmc_idlemask", 0644, dev->dbgfs_dir, dev,
 			    &amd_pmc_idlemask_fops);
+	/* Enable STB only when the module_param is set */
+	if (enable_stb)
+		debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
+				    &amd_pmc_stb_debugfs_fops);
 }
 #else
 static inline void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
@@ -485,6 +546,9 @@ static int __maybe_unused amd_pmc_suspend(struct device *dev)
 	if (rc)
 		dev_err(pdev->dev, "suspend failed\n");
 
+	if (enable_stb)
+		amd_pmc_write_stb(pdev, AMD_PMC_STB_PREDEF);
+
 	return rc;
 }
 
@@ -505,6 +569,10 @@ static int __maybe_unused amd_pmc_resume(struct device *dev)
 	/* Dump the IdleMask to see the blockers */
 	amd_pmc_idlemask_read(pdev, dev, NULL);
 
+	/* Write data incremented by 1 to distinguish in stb_read */
+	if (enable_stb)
+		amd_pmc_write_stb(pdev, AMD_PMC_STB_PREDEF + 1);
+
 	return 0;
 }
 
@@ -521,6 +589,65 @@ static const struct pci_device_id pmc_pci_ids[] = {
 	{ }
 };
 
+static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data)
+{
+	int err;
+
+	err = pci_write_config_dword(dev->rdev, AMD_PMC_STB_INDEX_ADDRESS, AMD_PMC_STB_PMI_0);
+	if (err) {
+		dev_err(dev->dev, "failed to write addr in stb: 0x%X\n",
+			AMD_PMC_STB_INDEX_ADDRESS);
+		err = pcibios_err_to_errno(err);
+		goto err_pci_dev_put;
+	}
+
+	err = pci_write_config_dword(dev->rdev, AMD_PMC_STB_INDEX_DATA, data);
+	if (err) {
+		dev_err(dev->dev, "failed to write data in stb: 0x%X\n",
+			AMD_PMC_STB_INDEX_DATA);
+		err = pcibios_err_to_errno(err);
+		goto err_pci_dev_put;
+	}
+
+	return 0;
+
+err_pci_dev_put:
+	pci_dev_put(dev->rdev);
+	return err;
+}
+
+static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf)
+{
+	int i, err;
+	u32 value;
+
+	err = pci_write_config_dword(dev->rdev, AMD_PMC_STB_INDEX_ADDRESS, AMD_PMC_STB_PMI_0);
+	if (err) {
+		dev_err(dev->dev, "error writing addr to stb: 0x%X\n",
+			AMD_PMC_STB_INDEX_ADDRESS);
+		err = pcibios_err_to_errno(err);
+		goto err_pci_dev_put;
+	}
+
+	for (i = 0; i < FIFO_SIZE; i++) {
+		err = pci_read_config_dword(dev->rdev, AMD_PMC_STB_INDEX_DATA, &value);
+		if (err) {
+			dev_err(dev->dev, "error reading data from stb: 0x%X\n",
+				AMD_PMC_STB_INDEX_DATA);
+			err = pcibios_err_to_errno(err);
+			goto err_pci_dev_put;
+		}
+
+		*buf++ = value;
+	}
+
+	return 0;
+
+err_pci_dev_put:
+	pci_dev_put(dev->rdev);
+	return err;
+}
+
 static int amd_pmc_probe(struct platform_device *pdev)
 {
 	struct amd_pmc_dev *dev = &pmc;
-- 
2.25.1


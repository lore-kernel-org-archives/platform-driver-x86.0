Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAA7BC433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Oct 2021 18:42:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B772760174
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Oct 2021 18:42:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238374AbhJZSof (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Oct 2021 14:44:35 -0400
Received: from mail-dm6nam11on2058.outbound.protection.outlook.com ([40.107.223.58]:28001
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238368AbhJZSoe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Oct 2021 14:44:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xw0rt35C80yR4U9w1pXhFGjOlQnPt4L3TyJIr2nR//A2DhJ6sv38w7lcqWzdlqYxZvE5Tu07QO6lk0AxPSsqHGzTVqjqftXzh7gpuv9dzlovrYeJrfklhV3aJovFW9P4zgngnkTlJHiUdFclCDe78TwpJRa4uCq29qNn5V98bx5fBMe/seJJaiWy+DoMVbQIV6DRKi+FExewSqLu9uosHgk52HbelMGnRtgGaTAb09Sifqi4T2tAFXgyeEhABaJaOMPnuLsztt4sHMeu7KKGhjKXPhrHPilNiz3rAaaXNbS37Ohx1HgHP/vyztdjWT3Ro+5ArRfoh3FSOfDozu41fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sxVa7r8MIPjXlwxbx4LBC7trcKTJy8491J4Ej+5YGDE=;
 b=b7gR6/8DKnBhRiGUUXvUAfoL+s2eutiEAeBahGD8c4W/rBie1QfGl1myNYMJ8Av3gewQuhIPYlgnCB/4tJjW4FExE5CPIGSMsxSE+RmyPbW35AR7VaLwlb/rIyOru+PHrLQWkVZgjB6I6kvHVcaIu0Ui/STnyqPsntT6f5dxn6nZ4NIlKkBSPXVu1Gky6/Lv7Z9jytN0EUeDtKb6W94JfFFjt6qqFR3kl5Q1G78NxHPkgIYivIJCFGAGe4l0mES9uwZ1lHkKkqvUhw1BrmRdJFj8vUDJxGvOAziv9N0icDEn1ab/1yfUY9t6tJItI/sGJ6N/ovOE1egu61bhqjA3tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxVa7r8MIPjXlwxbx4LBC7trcKTJy8491J4Ej+5YGDE=;
 b=p+hNREnbLWnv7GV5Vu/Lxf0UrVN3jLUkJDIwOdlBl5ayPx+1zrhoiKV2pChZlSjCAys76Dpqz7lBfGO8q9uiwCebf5wMT0H2CkQS3mbLvXRaX8XkL3bzEqqHqo0kdQenIMsev+G8H7HddKogPxnmCrVPWa+7BH+S48B7oSRDvRY=
Received: from DM6PR03CA0035.namprd03.prod.outlook.com (2603:10b6:5:40::48) by
 MN2PR12MB4502.namprd12.prod.outlook.com (2603:10b6:208:263::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Tue, 26 Oct
 2021 18:42:07 +0000
Received: from DM6NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:40:cafe::e7) by DM6PR03CA0035.outlook.office365.com
 (2603:10b6:5:40::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.22 via Frontend
 Transport; Tue, 26 Oct 2021 18:42:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT028.mail.protection.outlook.com (10.13.173.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4628.16 via Frontend Transport; Tue, 26 Oct 2021 18:42:06 +0000
Received: from Celadon-CZN.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 26 Oct
 2021 13:42:03 -0500
From:   Sanket Goswami <Sanket.Goswami@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <hdegoede@redhat.com>,
        <mgross@linux.intel.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Sanket Goswami <Sanket.Goswami@amd.com>
Subject: [PATCH v4 3/3] platform/x86: amd-pmc: Add support for AMD Smart Trace Buffer
Date:   Wed, 27 Oct 2021 00:10:45 +0530
Message-ID: <20211026184045.2201-4-Sanket.Goswami@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026184045.2201-1-Sanket.Goswami@amd.com>
References: <20211026184045.2201-1-Sanket.Goswami@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec62294d-edaa-405a-78cb-08d998b04f92
X-MS-TrafficTypeDiagnostic: MN2PR12MB4502:
X-Microsoft-Antispam-PRVS: <MN2PR12MB45020D5989B6A9728201EB5F9C849@MN2PR12MB4502.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iH5mj63jdqLQiP6Amn44eeLAhemMWJjIQ6OfN9xDQX5TF0ANhIfk75WdznExkvQkIvFJqYz/d8E7+WnP9pY8U9MddcgC3j7fTiiQKUDxm8PSXEc55+1hYILfJmUm3SWsYZUwKE5zOGivJXP4YCKrYdBw40AIVRV7ZArzoRhAtbFEYDZrgn6MpJSBZwDxhBhL14bAnT2dOkV7mRZ1E08XTy7O6ScQfbxYvRgtWe1TdWzNEGgBz3yuHHAeWv8hENThsUHbC3yBuHevdqEWsQeqcg5E6yJlNrZwKKJf/bqfo0jhyNVy1nhr0lBLnSobnxN33VgIO59zAe3xa2V37ehv8SFFKWjfFnA4I/0zJADbW2vyuaSX7o6GAjC4+S2f4uf5FvEgrOBhFFszWTVo2IwV3PfJQtfV/KrbN8mGYkv4Ky3Mw3Q3l+bhJDQdfHr3nt+YzK5ULeJZM2TGDW1O7TKlauhZvyQ+t920s6xvnmZOSN26W1PgCDqEof7KsxHxY+oD87O+lyjYBUpgUBR0a3dwXT/IeZUUszAkttJZk5JZ7W6W8L3zXKvMBigpIDX70SDHGa23x251d2xY9DUAg5gMvCEd5/FcfZgvtatNeQj7svpqhn41qHBh8DhDS39C+6Glq/qMwGkWVpCF0fO4pHdOWqJVychWot4/SyyZ4gT83HPbw2oksd0A6aw5b7zrY/A6rAE+/TVAgYmgZ/8QnYo7/yRlMhsACHMVCvrfi4AZvXA=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(16526019)(81166007)(356005)(316002)(26005)(336012)(7696005)(186003)(8936002)(36756003)(54906003)(8676002)(110136005)(1076003)(83380400001)(82310400003)(70586007)(86362001)(4326008)(508600001)(2616005)(6666004)(70206006)(426003)(47076005)(5660300002)(2906002)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 18:42:06.5411
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec62294d-edaa-405a-78cb-08d998b04f92
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4502
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
Changes in v4:
- Use kzalloc() for memory allocation.

Changes in v3:
- Address review comments from Mark Gross.

Changes in v2:
- Create amd_pmc_stb_debugfs_fops structure to get STB data.
- Address review comments from Hans.

 drivers/platform/x86/amd-pmc.c | 122 +++++++++++++++++++++++++++++++++
 1 file changed, 122 insertions(+)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index 50cb65e38d11..e55c48f675e1 100644
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
@@ -176,6 +189,53 @@ static int amd_pmc_get_smu_version(struct amd_pmc_dev *dev)
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
+	if (rc)
+		goto out;
+
+	filp->private_data = buf;
+
+out:
+	kfree(buf);
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
+	filp->private_data = NULL;
+
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
@@ -289,6 +349,10 @@ static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
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
@@ -488,6 +552,9 @@ static int __maybe_unused amd_pmc_suspend(struct device *dev)
 	if (rc)
 		dev_err(pdev->dev, "suspend failed\n");
 
+	if (enable_stb)
+		amd_pmc_write_stb(pdev, AMD_PMC_STB_PREDEF);
+
 	return rc;
 }
 
@@ -508,6 +575,10 @@ static int __maybe_unused amd_pmc_resume(struct device *dev)
 	/* Dump the IdleMask to see the blockers */
 	amd_pmc_idlemask_read(pdev, dev, NULL);
 
+	/* Write data incremented by 1 to distinguish in stb_read */
+	if (enable_stb)
+		amd_pmc_write_stb(pdev, AMD_PMC_STB_PREDEF + 1);
+
 	return 0;
 }
 
@@ -524,6 +595,57 @@ static const struct pci_device_id pmc_pci_ids[] = {
 	{ }
 };
 
+static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data)
+{
+	int rc;
+
+	rc = pci_write_config_dword(dev->rdev, AMD_PMC_STB_INDEX_ADDRESS, AMD_PMC_STB_PMI_0);
+	if (rc) {
+		dev_err(dev->dev, "failed to write addr in stb: 0x%X\n",
+			AMD_PMC_STB_INDEX_ADDRESS);
+		pci_dev_put(dev->rdev);
+		return pcibios_err_to_errno(rc);
+	}
+
+	rc = pci_write_config_dword(dev->rdev, AMD_PMC_STB_INDEX_DATA, data);
+	if (rc) {
+		dev_err(dev->dev, "failed to write data in stb: 0x%X\n",
+			AMD_PMC_STB_INDEX_DATA);
+		pci_dev_put(dev->rdev);
+		return pcibios_err_to_errno(rc);
+	}
+
+	return 0;
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
+		pci_dev_put(dev->rdev);
+		return pcibios_err_to_errno(err);
+	}
+
+	for (i = 0; i < FIFO_SIZE; i++) {
+		err = pci_read_config_dword(dev->rdev, AMD_PMC_STB_INDEX_DATA, &value);
+		if (err) {
+			dev_err(dev->dev, "error reading data from stb: 0x%X\n",
+				AMD_PMC_STB_INDEX_DATA);
+			pci_dev_put(dev->rdev);
+			return pcibios_err_to_errno(err);
+		}
+
+		*buf++ = value;
+	}
+
+	return 0;
+}
+
 static int amd_pmc_probe(struct platform_device *pdev)
 {
 	struct amd_pmc_dev *dev = &pmc;
-- 
2.25.1


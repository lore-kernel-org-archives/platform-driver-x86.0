Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8272C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 30 Nov 2021 11:24:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239026AbhK3L2B (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 30 Nov 2021 06:28:01 -0500
Received: from mail-mw2nam10on2061.outbound.protection.outlook.com ([40.107.94.61]:26784
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238891AbhK3L2A (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 30 Nov 2021 06:28:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hS6uGlxcu3yCQFpKgxB480wsfOO5+ZsX5Aawe6RKazPgPYAC1A6hgScBFF/dsnhOipMXAraxRcOsYfWiWCbmfwgJGTGn2iT/z3AEnmoRt1LIExr4eMhVMssZs47W1M8S2TSrvrKpQIpGciJ6kL1fAcCWBZe3OCakHpOqt1CRiIhu/SFK5ZZp3xvI95mNr1jXqT/EVWeF9VEO7WFfx3fsUwi3BC3MEC13t7ZW0zpxvmPTpUN8ZyVzL+E0JDVwvFPa+a//8i4Z+0JfS0UA/1I7YSi5i705E5eLfN4zK2Luyxycs1z4zP3Ks48GpKRhX3s6jG/7VdRz6O9+cPJkJzDSWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kh2UaavZF0cm5aa63WhVj3uCLRoFizB3D3rnjnjoYP0=;
 b=Lg5Mcr5ZV+cbwP45XTAnLiXaTBVUr0MfKQqvy7XVAywSHIvPeo65e8dUBqZOqa7on1ZEaPownNWyaNz4PxNvw+8ibXKcdOWnGilBac/K9VqdgEuciDUXfHQBcgYbHm0KnQrSpLrttPp5i/DV0EAy7PzEhAGHgQBVow0DPwbHpbdLGfylRms3U1D1rvXEBFBRKh8piSPoSGn/TzH8oiDmMmVBQwgkua0MkmfZO7v6+jqZEx76VIIaaf/Pe0v6BYSw1L0gWrG/MaW0+u/bjVFMzNeCHSQYytF2rXOCMOW3YLVLZE09rnyu4iXs9s824Yn0v8iueADNnaJbDryztE0Ehg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kh2UaavZF0cm5aa63WhVj3uCLRoFizB3D3rnjnjoYP0=;
 b=qjxPKmcnrV9udmwUaWb6xL64zicccmcNOO8N0DUf51hk4Ymask9ot7Bg6MvUij2pSCjHmN66LsK9saAZWWtb1F6qzqtT42Ve4Ok7LNBdxL1aoDJ9YsuTVUUpwRM4i+X7kir+DYc1vD5k3ACHqp2OV1nxs51aWgy/h7uSLv0JBxY=
Received: from BN9PR03CA0430.namprd03.prod.outlook.com (2603:10b6:408:113::15)
 by DM6PR12MB3580.namprd12.prod.outlook.com (2603:10b6:5:11e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Tue, 30 Nov
 2021 11:24:39 +0000
Received: from BN8NAM11FT006.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:113:cafe::65) by BN9PR03CA0430.outlook.office365.com
 (2603:10b6:408:113::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.24 via Frontend
 Transport; Tue, 30 Nov 2021 11:24:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT006.mail.protection.outlook.com (10.13.177.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4734.22 via Frontend Transport; Tue, 30 Nov 2021 11:24:39 +0000
Received: from Celadon-CZN.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 30 Nov
 2021 05:24:37 -0600
From:   Sanket Goswami <Sanket.Goswami@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <hdegoede@redhat.com>,
        <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>,
        Sanket Goswami <Sanket.Goswami@amd.com>
Subject: [PATCH v6 2/2] platform/x86: amd-pmc: Add support for AMD Smart Trace Buffer
Date:   Tue, 30 Nov 2021 16:53:18 +0530
Message-ID: <20211130112318.92850-3-Sanket.Goswami@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211130112318.92850-1-Sanket.Goswami@amd.com>
References: <20211130112318.92850-1-Sanket.Goswami@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2df8a961-31fa-40c9-f3ac-08d9b3f3ff8b
X-MS-TrafficTypeDiagnostic: DM6PR12MB3580:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3580F38807595BE67138FB1F9C679@DM6PR12MB3580.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vgFLTWX4jjQvv7H/oko5CmBTxDm4WzFvpRdOXnTz2YvzthrEkekm+CA2jOW5ZhSDrKoBd4NNl5KYRyYXyX/ZQuJykDLCaW2OIFkUujsWQOzulAZ32TPB1zE3l++qR3UQHsqRX6MW8FyxTa3unv753F8J0Dn8/Kn8mwsEEm4ihiStoCpQBJTEOXQmTDw2sgvHe3n1oCAvxzL+eiiBL6IKXkCnAn3WewAxiextNZ9N7zyJ+bNcMVkQV4yfDunzSj8G6pTGiQse4K9XGq/J/Qrq8sA9vQGiOz4N/zfac4pnEMwoJY+EYJWlFcRncGbBot17lJO4u2EfQPVbJQ8ovXwS/BFDv8JdRe2HM4vd+IRKWHVNSYl+r+uPALGiiURFD71vba6tLtdMpxaVnoBDDwdV/PsZAUjGlYh9drSPB26TLYF/YCejqFtEyNi47k8jOFyYpivv7mODW6SXQAHzCsiIB2eAmNBV9jIPL+rvp8+8A/qit584B1lHIMuIL/5fwfLwaMeVMge06jW+/CYl3P0m+VBhFPPs1u3iOnmzExC74msXwtxK7ag15gFdPNSu8LWTvo5ZyRJEbe/QgSgioRGy1oxE7yYgS3WXNfAs4/Fj3BcMc9+pEP5S3WvAK33QBMwZo/onpr5WBoOnt6Vb/+CYqqpGSm4jT5qMcEuvwRZfLX2LDMfXRV4jJkJLt7CpHPk8HYIvVomErq/84BCKSIGdd/lkhdTo12vffKJ/S7VIK5nBaxSEQWQNa8Skple4djbEWFqB3iTEu3i+GPFXDPx4RIrOhdIQCE24YnkjswYoOrE=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700001)(16526019)(186003)(2616005)(5660300002)(336012)(36756003)(2906002)(86362001)(356005)(40460700001)(47076005)(426003)(83380400001)(8676002)(81166007)(70586007)(7696005)(508600001)(36860700001)(1076003)(6666004)(26005)(70206006)(54906003)(8936002)(316002)(110136005)(4326008)(82310400004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 11:24:39.4982
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2df8a961-31fa-40c9-f3ac-08d9b3f3ff8b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT006.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3580
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

STB (Smart Trace Buffer), is a debug trace buffer that isolates the
failures by analyzing the last running feature of a system. This
non-intrusive way always runs in the background and stores the trace
into the SoC.

This patch enables the STB feature by passing module param
"enable_stb=1" while loading the driver and provides mechanism to
access the STB buffer using the read and write routines.

Co-developed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
---
Changes in v6:
- Capture the read data directly into buf in amd_pmc_read_stb().

Changes in v5:
- Use kfree() only once in .open as suggested by Hans.

Changes in v4:
- Use kzalloc() for memory allocation.

Changes in v3:
- Use sizeof(u32) with multiplier as suggested by Mark Gross.

Changes in v2:
- Create amd_pmc_stb_debugfs_fops structure to get STB data.
- Address review comments from Hans.

 drivers/platform/x86/amd-pmc.c | 132 +++++++++++++++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index b3b8a5daa02e..581cfd702082 100644
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
@@ -485,6 +546,13 @@ static int __maybe_unused amd_pmc_suspend(struct device *dev)
 	if (rc)
 		dev_err(pdev->dev, "suspend failed\n");
 
+	if (enable_stb)
+		rc = amd_pmc_write_stb(pdev, AMD_PMC_STB_PREDEF);
+	if (rc)	{
+		dev_err(pdev->dev, "error writing to STB\n");
+		return rc;
+	}
+
 	return rc;
 }
 
@@ -505,6 +573,14 @@ static int __maybe_unused amd_pmc_resume(struct device *dev)
 	/* Dump the IdleMask to see the blockers */
 	amd_pmc_idlemask_read(pdev, dev, NULL);
 
+	/* Write data incremented by 1 to distinguish in stb_read */
+	if (enable_stb)
+		rc = amd_pmc_write_stb(pdev, AMD_PMC_STB_PREDEF + 1);
+	if (rc)	{
+		dev_err(pdev->dev, "error writing to STB\n");
+		return rc;
+	}
+
 	return 0;
 }
 
@@ -521,6 +597,62 @@ static const struct pci_device_id pmc_pci_ids[] = {
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
+		err = pci_read_config_dword(dev->rdev, AMD_PMC_STB_INDEX_DATA, buf++);
+		if (err) {
+			dev_err(dev->dev, "error reading data from stb: 0x%X\n",
+				AMD_PMC_STB_INDEX_DATA);
+			err = pcibios_err_to_errno(err);
+			goto err_pci_dev_put;
+		}
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


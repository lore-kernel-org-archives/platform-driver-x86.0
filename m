Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32FB6C433F5
	for <platform-driver-x86@archiver.kernel.org>; Fri, 22 Oct 2021 17:29:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0962160FF2
	for <platform-driver-x86@archiver.kernel.org>; Fri, 22 Oct 2021 17:29:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233648AbhJVRcM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 22 Oct 2021 13:32:12 -0400
Received: from mail-co1nam11on2082.outbound.protection.outlook.com ([40.107.220.82]:23355
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233582AbhJVRcM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 22 Oct 2021 13:32:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kpJpLgjpYhCiDUS5HPf0DYA/1X31XzLK/RuSbsVxZVclTgH989o/TbeZwxkinWkjOALZzfkBIgsWucE5Z1j9eaXiEoOiukUMWS06/yjhq4eacQIgjvLlJ57OaCMwG48QtMsbP1VZSj5fD6qSablw1XurkXuR0M0IgOgUCuNctr61zHYWtpjhDe/d3TOLmv5EL6Vpis/GkTscH4S3aVJaEKlchkmNY+piQM2Z5SJn2urpWKDhJEkskoJJOM1mq9wJsVG4NZnNyZqPGQeulqA+XNYnNioaa7oUGR1VGHmtqp/lz1aLnrfJV8PWx+bsg0pp4xlSC5awvOadoNVSeCLZAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ym1X+FmyECfloOqN4zFWIn31RsgxwS4N14EZzEE4ZRE=;
 b=m0yuKrYXZmIsfGt4T7h7tMmGm2QlWhBBMMkqYnE/zMGJ17+8UcpeVZZYrQo0dtGJUvQnE3RlpHA/w/m6hENGnVMT4aWd8Y00m82LmGzwG6by6UVdHXyYhLnZHONXrU10zaWblIeJA4TQGELD+o+3100w5rOPWDDAufakYcaiCdOnJSbj3LODsaQUvuFidacTn88NW/7ZYC0eBar4sisA/4WvDsRkllxtVBxIpTWfoENWJpgwVCEPvrjbFFg6Osk6uikE2JENLuYNB593RPrpcKoJ+Y2p4vMJ3iluIa5PIxy38VMa235K4+F57mWIGoxTJB4S2uD4vmPPkpAsSEO0rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ym1X+FmyECfloOqN4zFWIn31RsgxwS4N14EZzEE4ZRE=;
 b=NoRZOpMW8MvKl3GV6y2MvrwFlpH6JMk7diPbWGjhBJuEFe8vKBxmWN0rnQrP4g45dSkkpqZjky8bwiHBKTnH3YNsJuplt9g8WbTylpM8R2XfmsFc0FL4p4EoH+88cewAX3x+4apPdeLdKfO300hKTAWZnnHI5l0QzN3bvwPpo/M=
Received: from BN9PR03CA0718.namprd03.prod.outlook.com (2603:10b6:408:ef::33)
 by BN6PR1201MB2530.namprd12.prod.outlook.com (2603:10b6:404:b0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Fri, 22 Oct
 2021 17:29:52 +0000
Received: from BN8NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ef:cafe::14) by BN9PR03CA0718.outlook.office365.com
 (2603:10b6:408:ef::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Fri, 22 Oct 2021 17:29:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT068.mail.protection.outlook.com (10.13.177.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4628.16 via Frontend Transport; Fri, 22 Oct 2021 17:29:52 +0000
Received: from amd-Mandolin-PCO.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Fri, 22 Oct
 2021 12:29:49 -0500
From:   Sanket Goswami <Sanket.Goswami@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <hdegoede@redhat.com>,
        <mgross@linux.intel.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Sanket Goswami <Sanket.Goswami@amd.com>
Subject: [PATCH v3 3/3] platform/x86: amd-pmc: Add support for AMD Smart Trace Buffer
Date:   Fri, 22 Oct 2021 22:58:45 +0530
Message-ID: <20211022172845.2608-4-Sanket.Goswami@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211022172845.2608-1-Sanket.Goswami@amd.com>
References: <20211022172845.2608-1-Sanket.Goswami@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97c48052-1496-493e-729a-08d995818e4e
X-MS-TrafficTypeDiagnostic: BN6PR1201MB2530:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB25304754604AEBBA08FA93729C809@BN6PR1201MB2530.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H1IFAeLIeAB7IwhmAdDPAcZDrdIjTtyN8EPNdi5DpWi6purswWO6FIzSwNfr6geYtri0+c48lGjTzJuEDBILjsp29FpKQ4+KI3c3XzqiEQQJfpkDdgYm0GADNG9jgyI+Vl6eYf+43LsOT2nnnbIfrnZVYI5fKTSGMTnbKO4BIeAVf+Cahm13e9X8gAbhLlmSuMdoqQoTUjxlCWS1TdCcy98rIkGjwzifhDCNEKx5nURStNKEEqXxtBwiD2k9/6qBL4Pycx5FQ7TFmj63EZdTwN/jdEDJ8lCa9flI6G+vzWziqZhnFHLi4n3g67dUaugVx+oOSwqBg625HYJockyRWb1/6wpHSm9GysEaH9OzSw29e7abr6gQuW+aLXPovLnMTCggMgckfdzwLeJ9EzIWetrFa8d8wj6qW0we69yriRgbFPCuJjnyVIBke0eEnS54h9jBIANI9LJE1CeVf19gtwZUNSVvzkaKR9dxA89AE3MQEaVNeJR+UIr9wPEV6sf6e4QnrH9UJO9m5YYcDwdUrsRm5KNtRuQdhz0cXVzbPIhbKe8+SC3RjAAkgSHmi+A4pO/75R8DZ5GOkai9F4gSDlPtLbYFpqALGLyqM3x3HwZ9bgI/y9SPpmgSt4Vs42uLlYhm8I5hfthltX36BqtGBevXkTqHrqW1FLNy0cYOxhX3jB4/BP3KTGsmwdmaoaF+KQHu5fXH2LrFhALBuJMUfdo/jScAhJYoNDB/y5WWBl8=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(8936002)(8676002)(5660300002)(47076005)(2906002)(426003)(336012)(16526019)(1076003)(316002)(82310400003)(186003)(81166007)(26005)(2616005)(110136005)(4326008)(36860700001)(70206006)(54906003)(70586007)(7696005)(83380400001)(6666004)(508600001)(356005)(36756003)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2021 17:29:52.0021
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97c48052-1496-493e-729a-08d995818e4e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB2530
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
Changes in v3:
- Address review comments from Mark Gross.

Changes in v2:
- Create amd_pmc_stb_debugfs_fops structure to get STB data.
- Address review comments from Hans.

 drivers/platform/x86/amd-pmc.c | 120 +++++++++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index 50cb65e38d11..665d57ff222d 100644
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
@@ -176,6 +189,51 @@ static int amd_pmc_get_smu_version(struct amd_pmc_dev *dev)
 	return 0;
 }
 
+static int amd_pmc_stb_debugfs_open(struct inode *inode, struct file *filp)
+{
+	struct amd_pmc_dev *dev = filp->f_inode->i_private;
+	u32 *buf;
+	int rc;
+
+	buf = devm_kmalloc(dev->dev, FIFO_SIZE * sizeof(u32), GFP_KERNEL);
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
@@ -289,6 +347,10 @@ static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
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
@@ -488,6 +550,9 @@ static int __maybe_unused amd_pmc_suspend(struct device *dev)
 	if (rc)
 		dev_err(pdev->dev, "suspend failed\n");
 
+	if (enable_stb)
+		amd_pmc_write_stb(pdev, AMD_PMC_STB_PREDEF);
+
 	return rc;
 }
 
@@ -508,6 +573,10 @@ static int __maybe_unused amd_pmc_resume(struct device *dev)
 	/* Dump the IdleMask to see the blockers */
 	amd_pmc_idlemask_read(pdev, dev, NULL);
 
+	/* Write data incremented by 1 to distinguish in stb_read */
+	if (enable_stb)
+		amd_pmc_write_stb(pdev, AMD_PMC_STB_PREDEF + 1);
+
 	return 0;
 }
 
@@ -524,6 +593,57 @@ static const struct pci_device_id pmc_pci_ids[] = {
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


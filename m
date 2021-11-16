Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1119C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 16 Nov 2021 07:42:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8277C619EC
	for <platform-driver-x86@archiver.kernel.org>; Tue, 16 Nov 2021 07:42:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231328AbhKPHpA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 16 Nov 2021 02:45:00 -0500
Received: from mail-mw2nam10on2046.outbound.protection.outlook.com ([40.107.94.46]:49536
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230424AbhKPHof (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 16 Nov 2021 02:44:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TX8J2+ObhEYBpk7i3+RvvYgYeNNS5CFywLzWrXCkpCbRhBod9xUqUyM7v/BsSVLO9waRHouFXJugs0OsoLFwP7TTKbdHD8Q9Z2OEEcGydxv76YSgtTNuYV6emfLzzAs1v3z86rtcnDIaGHDMY8ZjuelPk/+4hVCBICa4K7mk5ETqgWuEEq+G/u6eAkWR2V2nVAb10a6O4kkwIHMRejTcw0z9n+TwP2Wa7kXP+RPqYJaIwQum+qPVjCJHraBMoyiyyN84GKfP2nlAfs1ArBdZFwMYFhlKm/SxFxxxAmQHr5vytzU6Buq9wau49VQEft+JLjoc18qCiuUbjHqteqFqgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m37T6yxMLEyrQ9M3uo1K91SSsu6++mdC5xg1EvC8xk8=;
 b=n6iZJNtW50bZnXB2buUdM6aBAHOJV9ESWgixjD0kZDkCOybqBkwoZde2wcAptEAEHAaAZ1RYSKT2eihCdt+SDb6IByyP6nx61RfHH/yHCX3qJX4K/VkwOjk6s5TwtxsBji+zddmbKlsqXjDbqhUe4b+/WGI9hZKcSPd/7cgrtwgvgsTu9FMbE6+j72K1WwhsqdIoNhSloAZmfhkEYnxyG2MkjIYRe/k0I2FqpADqqTBLRkOdQBmeeZwdMICfVfJWjy8W6Rb8Y064y0uNMo8Tpu7nzJAEM1NVJsTkovuMnsBp5taWltcHA7CJmSEG3jiBXLf+oL7ISKUAVkWL3QvRAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m37T6yxMLEyrQ9M3uo1K91SSsu6++mdC5xg1EvC8xk8=;
 b=p8i/CsWkjov8Q77xNJugmgsbcxUTbuGVwzBCmMX5fazwZWP7ACoXMFcsFYg2GwgrIlT2sE6pRFINhqJaj25k+ftoMk6bKdOUmfleC+Vp2i2XS92PNIIcmmOSffVweq/XfXSPFkM7pQjt9qLkLIS9oheRWZd4ucLXsXBINVQZvuU=
Received: from DM6PR11CA0007.namprd11.prod.outlook.com (2603:10b6:5:190::20)
 by BY5PR12MB4885.namprd12.prod.outlook.com (2603:10b6:a03:1de::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Tue, 16 Nov
 2021 07:41:37 +0000
Received: from DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:190:cafe::ec) by DM6PR11CA0007.outlook.office365.com
 (2603:10b6:5:190::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Tue, 16 Nov 2021 07:41:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT016.mail.protection.outlook.com (10.13.173.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.15 via Frontend Transport; Tue, 16 Nov 2021 07:41:37 +0000
Received: from Mayan-RMB.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 16 Nov
 2021 01:41:34 -0600
From:   Sanket Goswami <Sanket.Goswami@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <hdegoede@redhat.com>,
        <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>,
        Sanket Goswami <Sanket.Goswami@amd.com>
Subject: [PATCH 2/2] platform/x86: amd-pmc: Add support for AMD Spill to DRAM STB feature
Date:   Tue, 16 Nov 2021 13:10:00 +0530
Message-ID: <20211116074000.28626-3-Sanket.Goswami@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116074000.28626-1-Sanket.Goswami@amd.com>
References: <20211116074000.28626-1-Sanket.Goswami@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e2b4918-614b-4823-5b22-08d9a8d48538
X-MS-TrafficTypeDiagnostic: BY5PR12MB4885:
X-Microsoft-Antispam-PRVS: <BY5PR12MB4885106D63B53CF9B99E9F179C999@BY5PR12MB4885.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3Gz7GmTFwITWEGMdOhGH8hrLdmXe4f7ZSl/7Gm9QjCDI4YooNUJv+u7rQFmQtH5TrmEXWLfsPRoI6YyoZXfcc+ywtNple2r19VEyxHROKJGek8Th6og6ER3jaJjjb3p5Um8P5oD0E+quudB2+ZaQ4dChOkxKDkRSNIZOikyZ7bSKG2bXsZV8tBl7KNFRO2IF6KjDPh0TSYbuKDwMBww587UcdtGRZLqfcuLwJOc5N5C4CAV0GilrSZ/oO2O3IMNM3E7AvmEB8Op7jUoAn1T4IS7YHx167iAVODEjyVZHcyfNl1yqRPAb4C2UYNgHC5Gr3HIpq79xEK6zjKmL4uWoOWlKi5znr/Qtcav/iNpOH5Lkb7J8CJLKABJa/1/ElPpY2PstKLdrM+XODWj7Yj+PEuMtKoJBSQa4fnn498+lzOsMR6IOMzeVXkzHEialJMo5nAs0t547SAQshh4u8v8mswE1JznxRmmSxjOZBgZ/eHilDkC9xbhQEukJxcIGtitclL/fy8O65AKCTMobAlN9Nxhu2W/jXszX69YTV/eIluvsHtUgJ0I5J0N6R5GPqZGHKhi1w6OweCBBxbUrvLLF0DjMRg2RAZxxV5LolLf6uWeCQQjrEJQXrVScf5jeCDu1wchg2w8qxGOXLZA4nQqnIOrWvESaQDGP1xS75eqyuQapq+C9nSc0TBzSfWn6k8LI8IRoRNSZKOGY3spKPhPCD/X/CdOBSekN4SLQYXI8HL0=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(70586007)(2616005)(336012)(110136005)(8676002)(86362001)(5660300002)(2906002)(1076003)(8936002)(16526019)(36756003)(186003)(6666004)(54906003)(426003)(47076005)(26005)(508600001)(4326008)(82310400003)(316002)(81166007)(356005)(83380400001)(70206006)(7696005)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 07:41:37.0162
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e2b4918-614b-4823-5b22-08d9a8d48538
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4885
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Spill to DRAM functionality is a feature that allows STB (Smart Trace
Buffer) to spill data from SRAM into DRAM on some future AMD ASICs. The
size allocated for STB is more than the earlier SoC's which helps to
collect more tracing and telemetry data.

Co-developed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
---
 drivers/platform/x86/amd-pmc.c | 128 ++++++++++++++++++++++++++++-----
 1 file changed, 112 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index 5769d009033a..5973e2d23827 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -40,10 +40,16 @@
 #define AMD_PMC_STB_INDEX_DATA		0xFC
 #define AMD_PMC_STB_PMI_0		0x03E30600
 #define AMD_PMC_STB_PREDEF		0xC6000001
+#define AMD_STB_REGISTER_MESSAGE	0xA20
+#define AMD_STB_REGISTER_RESPONSE	0xA80
+#define AMD_STB_REGISTER_ARGUMENT	0xA88
 
 /* STB message port and Parameters */
 #define PMC_MSG_PORT_PEP		0
 #define PMC_MSG_PORT_STB		1
+#define STB_SPILL_TO_DRAM		0xBE
+#define STB_TELEMETRY_BYTES_MAX		0x100000
+#define STB_TELEMETRY_DRAMBYTES_MAX	0x1000000
 
 /* Base address of SMU for mapping physical address to virtual address */
 #define AMD_PMC_SMU_INDEX_ADDRESS	0xB8
@@ -99,6 +105,13 @@ enum amd_pmc_def {
 	MSG_OS_HINT_RN,
 };
 
+enum stb_arg {
+	FIX_SIZE = 0x01,
+	STB_ADDR_LOW,
+	STB_ADDR_HIGH,
+	STB_SAMPLES,
+};
+
 struct amd_pmc_bit_map {
 	const char *name;
 	u32 bit_mask;
@@ -123,6 +136,7 @@ static const struct amd_pmc_bit_map soc15_ip_blk[] = {
 struct amd_pmc_dev {
 	void __iomem *regbase;
 	void __iomem *smu_virt_addr;
+	void __iomem *stb_virt_addr;
 	void __iomem *fch_virt_addr;
 	u32 base_addr;
 	u32 cpu_id;
@@ -238,6 +252,61 @@ const struct file_operations amd_pmc_stb_debugfs_fops = {
 	.release = amd_pmc_stb_debugfs_release,
 };
 
+static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
+{
+	struct amd_pmc_dev *dev = filp->f_inode->i_private;
+	u32 *buf, phys_addr_low, phys_addr_hi, size, samples;
+	u64 stb_phys_addr;
+
+	amd_pmc_send_cmd(dev, FIX_SIZE, &size, STB_SPILL_TO_DRAM, 1, PMC_MSG_PORT_STB);
+	if (size != STB_TELEMETRY_BYTES_MAX)
+		return -EIO;
+
+	/* Get STB DRAM address */
+	amd_pmc_send_cmd(dev, STB_ADDR_LOW, &phys_addr_low, STB_SPILL_TO_DRAM, 1, PMC_MSG_PORT_STB);
+	amd_pmc_send_cmd(dev, STB_ADDR_HIGH, &phys_addr_hi, STB_SPILL_TO_DRAM, 1, PMC_MSG_PORT_STB);
+	/* Get the number of samples present in the STB buffer */
+	amd_pmc_send_cmd(dev, STB_SAMPLES, &samples, STB_SPILL_TO_DRAM, 1, PMC_MSG_PORT_STB);
+	stb_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
+
+	dev->stb_virt_addr = devm_ioremap(dev->dev, stb_phys_addr, STB_TELEMETRY_DRAMBYTES_MAX);
+	if (!dev->stb_virt_addr)
+		return -ENOMEM;
+
+	buf = kzalloc(STB_TELEMETRY_BYTES_MAX, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	memcpy_fromio(buf, dev->stb_virt_addr, STB_TELEMETRY_BYTES_MAX);
+
+	filp->private_data = buf;
+
+	return 0;
+}
+
+static ssize_t amd_pmc_stb_debugfs_read_v2(struct file *filp, char __user *buf, size_t size,
+					   loff_t *pos)
+{
+	if (!filp->private_data)
+		return -EINVAL;
+
+	return simple_read_from_buffer(buf, size, pos, filp->private_data,
+					STB_TELEMETRY_BYTES_MAX);
+}
+
+static int amd_pmc_stb_debugfs_release_v2(struct inode *inode, struct file *filp)
+{
+	kfree(filp->private_data);
+	return 0;
+}
+
+const struct file_operations amd_pmc_stb_debugfs_fops_v2 = {
+	.owner = THIS_MODULE,
+	.open = amd_pmc_stb_debugfs_open_v2,
+	.read = amd_pmc_stb_debugfs_read_v2,
+	.release = amd_pmc_stb_debugfs_release_v2,
+};
+
 static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct device *dev,
 				 struct seq_file *s)
 {
@@ -352,9 +421,15 @@ static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
 	debugfs_create_file("amd_pmc_idlemask", 0644, dev->dbgfs_dir, dev,
 			    &amd_pmc_idlemask_fops);
 	/* Enable STB only when the module_param is set */
-	if (enable_stb)
-		debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
-				    &amd_pmc_stb_debugfs_fops);
+	if (enable_stb) {
+		if (dev->cpu_id == AMD_CPU_ID_YC) {
+			debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
+					    &amd_pmc_stb_debugfs_fops_v2);
+		} else {
+			debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
+					    &amd_pmc_stb_debugfs_fops);
+		}
+	}
 }
 #else
 static inline void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
@@ -393,17 +468,27 @@ static int amd_pmc_setup_smu_logging(struct amd_pmc_dev *dev)
 	return 0;
 }
 
-static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
+static void amd_pmc_dump_registers(struct amd_pmc_dev *dev, u8 msg_port_stb)
 {
-	u32 value;
+	u32 value, message, argument, response;
+
+	if (msg_port_stb) {
+		message = AMD_STB_REGISTER_MESSAGE;
+		argument = AMD_STB_REGISTER_ARGUMENT;
+		response = AMD_STB_REGISTER_RESPONSE;
+	} else {
+		message = AMD_PMC_REGISTER_MESSAGE;
+		argument = AMD_PMC_REGISTER_ARGUMENT;
+		response = AMD_PMC_REGISTER_RESPONSE;
+	}
 
-	value = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_RESPONSE);
+	value = amd_pmc_reg_read(dev, response);
 	dev_dbg(dev->dev, "AMD_PMC_REGISTER_RESPONSE:%x\n", value);
 
-	value = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_ARGUMENT);
+	value = amd_pmc_reg_read(dev, argument);
 	dev_dbg(dev->dev, "AMD_PMC_REGISTER_ARGUMENT:%x\n", value);
 
-	value = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_MESSAGE);
+	value = amd_pmc_reg_read(dev, message);
 	dev_dbg(dev->dev, "AMD_PMC_REGISTER_MESSAGE:%x\n", value);
 }
 
@@ -411,11 +496,22 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg,
 			    u8 msg_port_stb)
 {
 	int rc;
-	u32 val;
+	u32 val, message, argument, response;
 
 	mutex_lock(&dev->lock);
+
+	if (msg_port_stb) {
+		message = AMD_STB_REGISTER_MESSAGE;
+		argument = AMD_STB_REGISTER_ARGUMENT;
+		response = AMD_STB_REGISTER_RESPONSE;
+	} else {
+		message = AMD_PMC_REGISTER_MESSAGE;
+		argument = AMD_PMC_REGISTER_ARGUMENT;
+		response = AMD_PMC_REGISTER_RESPONSE;
+	}
+
 	/* Wait until we get a valid response */
-	rc = readx_poll_timeout(ioread32, dev->regbase + AMD_PMC_REGISTER_RESPONSE,
+	rc = readx_poll_timeout(ioread32, dev->regbase + response,
 				val, val != 0, PMC_MSG_DELAY_MIN_US,
 				PMC_MSG_DELAY_MIN_US * RESPONSE_REGISTER_LOOP_MAX);
 	if (rc) {
@@ -424,16 +520,16 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg,
 	}
 
 	/* Write zero to response register */
-	amd_pmc_reg_write(dev, AMD_PMC_REGISTER_RESPONSE, 0);
+	amd_pmc_reg_write(dev, response, 0);
 
 	/* Write argument into response register */
-	amd_pmc_reg_write(dev, AMD_PMC_REGISTER_ARGUMENT, arg);
+	amd_pmc_reg_write(dev, argument, arg);
 
 	/* Write message ID to message ID register */
-	amd_pmc_reg_write(dev, AMD_PMC_REGISTER_MESSAGE, msg);
+	amd_pmc_reg_write(dev, message, msg);
 
 	/* Wait until we get a valid response */
-	rc = readx_poll_timeout(ioread32, dev->regbase + AMD_PMC_REGISTER_RESPONSE,
+	rc = readx_poll_timeout(ioread32, dev->regbase + response,
 				val, val != 0, PMC_MSG_DELAY_MIN_US,
 				PMC_MSG_DELAY_MIN_US * RESPONSE_REGISTER_LOOP_MAX);
 	if (rc) {
@@ -446,7 +542,7 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg,
 		if (ret) {
 			/* PMFW may take longer time to return back the data */
 			usleep_range(DELAY_MIN_US, 10 * DELAY_MAX_US);
-			*data = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_ARGUMENT);
+			*data = amd_pmc_reg_read(dev, argument);
 		}
 		break;
 	case AMD_PMC_RESULT_CMD_REJECT_BUSY:
@@ -467,7 +563,7 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg,
 
 out_unlock:
 	mutex_unlock(&dev->lock);
-	amd_pmc_dump_registers(dev);
+	amd_pmc_dump_registers(dev, msg_port_stb);
 	return rc;
 }
 
-- 
2.25.1


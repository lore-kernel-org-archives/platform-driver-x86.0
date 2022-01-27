Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6F44C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 27 Jan 2022 10:10:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232014AbiA0KKH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 27 Jan 2022 05:10:07 -0500
Received: from mail-bn8nam11on2082.outbound.protection.outlook.com ([40.107.236.82]:57889
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233255AbiA0KKG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 27 Jan 2022 05:10:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OHUGYRsb8hcT8ytpDLAQ740KPV/RkA9VKuXuU//xkPe6BSJ/qnoxQg7+daa0Gi44FR9U9cp2Ygnk28PIr9UrbYRkVEAPqqyldR5imAFL4HReA6FTINAvmOwZI9xBY93xck4CWTiWo0VAcgcJBHjym45gT3EMRjkGAZPwQaGveIVULhZb49HxDAFGXini0sCJL79c4sEMcd35oXX/vduOv8zwAfEhuAZGAYjMoskOF34l55fwuFFvtU/WSNcJCz7+Rhxd+tOFVZeESVsr4ZHJ6N9QIG6G2dGuTn3sa6X+r+ln+GrxPPCiV/r1OuXJHMdgCoetDdZPLnN91kEeJe1l3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4qWXUPdWktNA8UBhMwj+bUq9AaIXojguoQtcs/9kPLc=;
 b=S8/eDZoD/Mhky/va8Xd5LcrWn9PA2ZDcwHMsdEbYdc1YrztMXxLae1KImQOexXM5QISxaNhtyVMELWFryttAuubfHo1XbLiwK2WvH+5GImqLxb1AULUNsuhyeqSxeTeij/BSlavbhWD2st4ba4a531oLNO951xRxvY6zA1Iw+qJiC5MULJj2MSnRMqkufglBBLXJxRVgr50jnJstEb73X/xHFq5neWusm5qfEAO7TRH66g2g4mg+pShQ64XroHTyXq5OEtLajbzIeP9j1/hY8voOpcmgDrODr4/1PtxKAkcCCFn8WlCW2pbj5uaEmDwOBwP3NK1oKJDfCionicuK5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4qWXUPdWktNA8UBhMwj+bUq9AaIXojguoQtcs/9kPLc=;
 b=UVfWolW8hJeEgUqSBpbztMY1vt+yWt8+9kkdK489n8JRhEn0SQLDgVYDsouQREotOGzHiDXKBFxBfrDVDt4GSycZE3EtyHvI2z7IDu/qoJFOCoCCdVQRBrqdLrt/roK7keUV9dwbGrxeIlBEhjqCsW+s+5rgruDPVxUUoJKOR/8=
Received: from BN6PR13CA0059.namprd13.prod.outlook.com (2603:10b6:404:11::21)
 by MN2PR12MB4240.namprd12.prod.outlook.com (2603:10b6:208:1d3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Thu, 27 Jan
 2022 10:10:02 +0000
Received: from BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:11:cafe::b) by BN6PR13CA0059.outlook.office365.com
 (2603:10b6:404:11::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.5 via Frontend
 Transport; Thu, 27 Jan 2022 10:10:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT046.mail.protection.outlook.com (10.13.177.127) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 10:10:01 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 27 Jan
 2022 04:09:59 -0600
From:   Sanket Goswami <Sanket.Goswami@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <hdegoede@redhat.com>,
        <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>,
        Sanket Goswami <Sanket.Goswami@amd.com>
Subject: [PATCH] platform/x86: amd-pmc: Add support for AMD Spill to DRAM STB feature
Date:   Thu, 27 Jan 2022 15:39:13 +0530
Message-ID: <20220127100913.2819051-1-Sanket.Goswami@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7abbb4ec-2317-4827-1eba-08d9e17d2ea7
X-MS-TrafficTypeDiagnostic: MN2PR12MB4240:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4240577FDFE038C225FA678C9C219@MN2PR12MB4240.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OFZ8YOCk50udozygYMNQ+mz54RorYrKVY+S7kcnZlc2O3qQ/3LAHCRfWyXgFOSL03EWV7jFwbofPHBYBjny/HEZDkX7urmUj0ZTqnui8jGSyD6u96bomPcuWgmWSEbGsGlVr+5JNZTiXSkqXyIaGPbRf5G9AViNYalLkUdSkIoATqvjqX2Yd488O2eOaLbV/eb7SUe6oa43pFpeXnFBbsPAiCYpu5fVtX6OdVWcIav2BxGlpXY2ouX6KIvlWnBiOxm1diWgOSe3LRi0506/p/QZimXmt+XurrWW/qkk0QM4WODrB14dFhHPlnW1xzxfnxFpXgGN9M652D/9SS81PYjfZ/XdhihcLMkW7Xwk1S6D5TR2UjCoBQSMur3jCmGa5qsElyt+jDac3+fWnOu37ax8UEq0T2WsPXq8DvtPVYQHtBYf9GStpH1soe/dA01/LBOeimJJCzo97s83T3btOl6a3+hqPS3X+pKIte9nhIQ0TOpmlQGHT8ivdfYTwidwjf3xxeZCFJ8vOB1SBLkNEz0J4kQrBn+LKrJeVyJz4NZDmnWbBs7Y53NXWLWkVOIcG2DWTFVpiR+2xzSobenoqKvxzsqvucOm2owwXCDzQJAz2CZLBrB9oGdRGNW5OUnUJBMjdg94IOhbC8rjqs0R2gHHMzUS6IwpyMqqNBSYsmc28R+O4QN9y26Oem817oIyoEWQ53TRAUMWkMww2WR3gofhe/zJQ/dC+Z5rKADFSQpclt96AQYJNk/7DXRBC7rv0CgYxccA/G6TFgADF7ktFEm+oVNJIM+6B3+AuPdH5JZQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700004)(70586007)(86362001)(2616005)(81166007)(8936002)(336012)(36756003)(356005)(54906003)(508600001)(426003)(316002)(1076003)(40460700003)(47076005)(7696005)(110136005)(6666004)(2906002)(5660300002)(36860700001)(4326008)(16526019)(82310400004)(26005)(83380400001)(186003)(70206006)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 10:10:01.8720
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7abbb4ec-2317-4827-1eba-08d9e17d2ea7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4240
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
 drivers/platform/x86/amd-pmc.c | 132 +++++++++++++++++++++++++++++----
 1 file changed, 118 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index 4c72ba68b315..3040f50627c6 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -41,6 +41,16 @@
 #define AMD_PMC_STB_PMI_0		0x03E30600
 #define AMD_PMC_STB_PREDEF		0xC6000001
 
+/* STB S2D(Spill to DRAM) has different message port offset */
+#define STB_SPILL_TO_DRAM		0xBE
+#define AMD_S2D_REGISTER_MESSAGE	0xA20
+#define AMD_S2D_REGISTER_RESPONSE	0xA80
+#define AMD_S2D_REGISTER_ARGUMENT	0xA88
+
+/* STB Spill to DRAM Parameters */
+#define S2D_TELEMETRY_BYTES_MAX		0x100000
+#define S2D_TELEMETRY_DRAMBYTES_MAX	0x1000000
+
 /* Base address of SMU for mapping physical address to virtual address */
 #define AMD_PMC_SMU_INDEX_ADDRESS	0xB8
 #define AMD_PMC_SMU_INDEX_DATA		0xBC
@@ -95,6 +105,13 @@ enum amd_pmc_def {
 	MSG_OS_HINT_RN,
 };
 
+enum s2d_arg {
+	S2D_TELEMETRY_SIZE = 0x01,
+	S2D_PHYS_ADDR_LOW,
+	S2D_PHYS_ADDR_HIGH,
+	S2D_NUM_SAMPLES,
+};
+
 struct amd_pmc_bit_map {
 	const char *name;
 	u32 bit_mask;
@@ -119,7 +136,9 @@ static const struct amd_pmc_bit_map soc15_ip_blk[] = {
 struct amd_pmc_dev {
 	void __iomem *regbase;
 	void __iomem *smu_virt_addr;
+	void __iomem *stb_virt_addr;
 	void __iomem *fch_virt_addr;
+	bool msg_port;
 	u32 base_addr;
 	u32 cpu_id;
 	u32 active_ips;
@@ -236,6 +255,65 @@ static const struct file_operations amd_pmc_stb_debugfs_fops = {
 	.release = amd_pmc_stb_debugfs_release,
 };
 
+static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
+{
+	struct amd_pmc_dev *dev = filp->f_inode->i_private;
+	u32 *buf, phys_addr_low, phys_addr_hi, size, samples;
+	u64 stb_phys_addr;
+
+	/* Spill to DRAM feature uses separate SMU message port */
+	dev->msg_port = 1;
+
+	amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size, STB_SPILL_TO_DRAM, 1);
+	if (size != S2D_TELEMETRY_BYTES_MAX)
+		return -EIO;
+
+	/* Get STB DRAM address */
+	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, STB_SPILL_TO_DRAM, 1);
+	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, STB_SPILL_TO_DRAM, 1);
+
+	/* Get the number of samples present in the STB buffer */
+	amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &samples, STB_SPILL_TO_DRAM, 1);
+	stb_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
+
+	dev->stb_virt_addr = devm_ioremap(dev->dev, stb_phys_addr, S2D_TELEMETRY_DRAMBYTES_MAX);
+	if (!dev->stb_virt_addr)
+		return -ENOMEM;
+
+	buf = kzalloc(S2D_TELEMETRY_BYTES_MAX, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	memcpy_fromio(buf, dev->stb_virt_addr, S2D_TELEMETRY_BYTES_MAX);
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
+					S2D_TELEMETRY_BYTES_MAX);
+}
+
+static int amd_pmc_stb_debugfs_release_v2(struct inode *inode, struct file *filp)
+{
+	kfree(filp->private_data);
+	return 0;
+}
+
+static const struct file_operations amd_pmc_stb_debugfs_fops_v2 = {
+	.owner = THIS_MODULE,
+	.open = amd_pmc_stb_debugfs_open_v2,
+	.read = amd_pmc_stb_debugfs_read_v2,
+	.release = amd_pmc_stb_debugfs_release_v2,
+};
+
 static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct device *dev,
 				 struct seq_file *s)
 {
@@ -350,9 +428,14 @@ static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
 	debugfs_create_file("amd_pmc_idlemask", 0644, dev->dbgfs_dir, dev,
 			    &amd_pmc_idlemask_fops);
 	/* Enable STB only when the module_param is set */
-	if (enable_stb)
-		debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
-				    &amd_pmc_stb_debugfs_fops);
+	if (enable_stb) {
+		if (dev->cpu_id == AMD_CPU_ID_YC)
+			debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
+					    &amd_pmc_stb_debugfs_fops_v2);
+		else
+			debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
+					    &amd_pmc_stb_debugfs_fops);
+	}
 }
 #else
 static inline void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
@@ -392,26 +475,47 @@ static int amd_pmc_setup_smu_logging(struct amd_pmc_dev *dev)
 
 static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
 {
-	u32 value;
+	u32 value, message, argument, response;
+
+	if (dev->msg_port) {
+		message = AMD_S2D_REGISTER_MESSAGE;
+		argument = AMD_S2D_REGISTER_ARGUMENT;
+		response = AMD_S2D_REGISTER_RESPONSE;
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
 
 static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret)
 {
 	int rc;
-	u32 val;
+	u32 val, message, argument, response;
 
 	mutex_lock(&dev->lock);
+
+	if (dev->msg_port) {
+		message = AMD_S2D_REGISTER_MESSAGE;
+		argument = AMD_S2D_REGISTER_ARGUMENT;
+		response = AMD_S2D_REGISTER_RESPONSE;
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
@@ -420,16 +524,16 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg,
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
@@ -442,7 +546,7 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg,
 		if (ret) {
 			/* PMFW may take longer time to return back the data */
 			usleep_range(DELAY_MIN_US, 10 * DELAY_MAX_US);
-			*data = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_ARGUMENT);
+			*data = amd_pmc_reg_read(dev, argument);
 		}
 		break;
 	case AMD_PMC_RESULT_CMD_REJECT_BUSY:
-- 
2.25.1


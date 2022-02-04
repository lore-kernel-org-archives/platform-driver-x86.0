Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A18AC433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri,  4 Feb 2022 12:26:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358622AbiBDM0G (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 4 Feb 2022 07:26:06 -0500
Received: from mail-dm6nam10on2040.outbound.protection.outlook.com ([40.107.93.40]:38139
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230494AbiBDM0G (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 4 Feb 2022 07:26:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YOdjDRvEHYXD0CR+ceu5foF4qGcicjQfLBWZCApRWY/MWe8G+kNg1cRfY6x/vUaRJODGOc3vINjVGDKa6yX/A0775dyNfXDs/jk+8jAoG4iiUCpBPK44Ixv/xwJEJWJNgT+DW7r1OO8vZfTT861DcegkaCg5NRznsmhEmUrA/bXROhQawBkknCfKzlVP2iKn7oz4VNpukZC7IZxjvBWkgJooudImTsgNTwgH9BJEOST5F+vZcmKcikSVikmrvE7eNqhTVzbt5PpWbspJsk9uzCuM+BPGOd+edLe5JldN522v7L5CSqQRj4JI+6MqiFHLR6dyG0S91nj6lx0EnzpBwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=shJ08XTsTLwWsSevngb5hXW8gUOzrHxtIa3ZA5Ttj/o=;
 b=lAWg9FxzTBhyzsxvNhCClqElsmTGfwyq3/97l9UWKP5odUFVLbwpgSplU9pOE2ko0sCLzN13eNjU87wA0YrGVxjqD9c98UBbfBGjwHBA/AFaJqSknHJlgypgUnEUqerM8UwBjYedJbtYExDbLV8dz8ui22rfcYbtPSPYdasJzsB4WE1QQvLV/N86UTABJ7Cyj4WzyO60EZ/cJohxv6QbUvln20c8c/QgdGCwg70gIJ8G1bZoqtlDRmAsdO3ORUGmdjt8LloC21dhIgbrC4+B70S9TMS9kZgUF0az91IsAQlNl8tMtrTpbxVbgf1IFJvh5rsY63UDvbKQcfH6dX3usA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=shJ08XTsTLwWsSevngb5hXW8gUOzrHxtIa3ZA5Ttj/o=;
 b=X20SLu7bdKMYbV5wWDIGH9CaRICLtzSwvJLW/vUjBZA+CnHQeHi2whnj1kT6+S9wRD37URCzW7gX4NpbDTOKKrVm1khRuv9GCN3Kh5hbpBova9I3t6QDi3QnUgPJG1ZckbgJej9+0HsXKyNhkmu8BbfyPwTqKAiB3WVxosc+IC8=
Received: from MW4P221CA0016.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::21)
 by SN1PR12MB2367.namprd12.prod.outlook.com (2603:10b6:802:26::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Fri, 4 Feb
 2022 12:26:02 +0000
Received: from CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8b:cafe::ba) by MW4P221CA0016.outlook.office365.com
 (2603:10b6:303:8b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Fri, 4 Feb 2022 12:26:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT038.mail.protection.outlook.com (10.13.174.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Fri, 4 Feb 2022 12:26:00 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 4 Feb
 2022 06:25:57 -0600
From:   Sanket Goswami <Sanket.Goswami@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <hdegoede@redhat.com>,
        <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>,
        Sanket Goswami <Sanket.Goswami@amd.com>
Subject: [PATCH v2] platform/x86: amd-pmc: Add support for AMD Spill to DRAM STB feature
Date:   Fri, 4 Feb 2022 17:55:27 +0530
Message-ID: <20220204122527.3873552-1-Sanket.Goswami@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75addc79-0ed4-49ff-dbb0-08d9e7d98164
X-MS-TrafficTypeDiagnostic: SN1PR12MB2367:EE_
X-Microsoft-Antispam-PRVS: <SN1PR12MB236736897CE73A81A14EB41A9C299@SN1PR12MB2367.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wYnjuMC1X1a0hjpyj6CMSCUZVmuLao301iGjpNUQchsYpP1OfQIJ2jP0W7lyv+qbsH8g+qeKt+rKAw69sM+9h5HPp8y+WPQ9eMq8iJqPboAVRvUrAAkIUqfeNAbyxT7EL8IckvnDFW3DZceY+tZTN+ENzWbbN9/j0V4Fr5glQx9pjQxOiDp5R1LD7k6N7iqKJmSORxO1D9aDCUPqP2XgFQvL8njzQHF67jUHvxVUAQTLqXqRgxaZX7kCIC/9y4XlRVSC+rGewxjcxvnYATbKy4UPiYu+b+kcjBIAl+QMNlQ1hf6oTTfmpUdACxBPCAe2VQFckZatB0X+pwCFRaV27mvLt8Ca9/N2o8ot5QjydQ9kjDM4aOsE9V2wbzdYVqK73Yj3/zSue5JEBmsi3s7nVV3+kBwnDZw5YBjRgTNArZLJkYNNd/mgO6eNcEUY2JKlCZ1/+arQPUsKbz91Qo5J7Y64ffK8K6tqenFb1FdvJKX4E8/JY3UmTuVsDRKSZu7CRCr5uVuzYX0J/KkQWV+CfiRMtStx6MlO8RMe9vRhNSPh5z2Fc/bJWeeb8N4CPglNNqpw4lFqaUGIxOnvF9wv0sqG7OqGFFjlSB7lvk6/EnC3fDXi14X5cB27gUUw6QZOoSMFIwQDIDxROUpVKN31LzNO8VAVmmC0RYYKMrEEQcOYw4T6H3JuSHvcS8+9APKQFyRL+NKZNX8xuL6ANa/AB4VK5V4V7xiZznIuX6y1wRcFa7Z8cfjFaYW9Bgv7S62X5cw5rzseF7UPL+6r5AmZTw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(5660300002)(4326008)(8676002)(8936002)(6666004)(70586007)(70206006)(82310400004)(7696005)(47076005)(40460700003)(86362001)(426003)(336012)(2616005)(36860700001)(16526019)(2906002)(1076003)(26005)(186003)(356005)(508600001)(316002)(54906003)(36756003)(110136005)(81166007)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 12:26:00.6926
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75addc79-0ed4-49ff-dbb0-08d9e7d98164
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2367
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
Changes in v2:
- Create separate routine amd_pmc_s2d_init() and move the S2D initialization logic there.
- Handle the msg_port flag accordingly so that OS_HINT goes to PMC message port.

 drivers/platform/x86/amd-pmc.c | 144 +++++++++++++++++++++++++++++----
 1 file changed, 130 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index 4c72ba68b315..69fdbb0d9f45 100644
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
@@ -95,6 +105,12 @@ enum amd_pmc_def {
 	MSG_OS_HINT_RN,
 };
 
+enum s2d_arg {
+	S2D_TELEMETRY_SIZE = 0x01,
+	S2D_PHYS_ADDR_LOW,
+	S2D_PHYS_ADDR_HIGH,
+};
+
 struct amd_pmc_bit_map {
 	const char *name;
 	u32 bit_mask;
@@ -119,7 +135,9 @@ static const struct amd_pmc_bit_map soc15_ip_blk[] = {
 struct amd_pmc_dev {
 	void __iomem *regbase;
 	void __iomem *smu_virt_addr;
+	void __iomem *stb_virt_addr;
 	void __iomem *fch_virt_addr;
+	bool msg_port;
 	u32 base_addr;
 	u32 cpu_id;
 	u32 active_ips;
@@ -236,6 +254,44 @@ static const struct file_operations amd_pmc_stb_debugfs_fops = {
 	.release = amd_pmc_stb_debugfs_release,
 };
 
+static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
+{
+	struct amd_pmc_dev *dev = filp->f_inode->i_private;
+	u32 *buf;
+
+	buf = kzalloc(S2D_TELEMETRY_BYTES_MAX, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	memcpy_fromio(buf, dev->stb_virt_addr, S2D_TELEMETRY_BYTES_MAX);
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
@@ -350,9 +406,14 @@ static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
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
@@ -392,26 +453,47 @@ static int amd_pmc_setup_smu_logging(struct amd_pmc_dev *dev)
 
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
@@ -420,16 +502,16 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg,
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
@@ -442,7 +524,7 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg,
 		if (ret) {
 			/* PMFW may take longer time to return back the data */
 			usleep_range(DELAY_MIN_US, 10 * DELAY_MAX_US);
-			*data = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_ARGUMENT);
+			*data = amd_pmc_reg_read(dev, argument);
 		}
 		break;
 	case AMD_PMC_RESULT_CMD_REJECT_BUSY:
@@ -601,6 +683,34 @@ static const struct pci_device_id pmc_pci_ids[] = {
 	{ }
 };
 
+static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
+{
+	u32 size, phys_addr_low, phys_addr_hi;
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
+	stb_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
+
+	/* Clear msg_port for other SMU operation */
+	dev->msg_port = 0;
+
+	dev->stb_virt_addr = devm_ioremap(dev->dev, stb_phys_addr, S2D_TELEMETRY_DRAMBYTES_MAX);
+	if (!dev->stb_virt_addr)
+		return -ENOMEM;
+
+	return 0;
+}
+
 static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data)
 {
 	int err;
@@ -719,6 +829,12 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	if (err)
 		dev_err(dev->dev, "SMU debugging info not supported on this platform\n");
 
+	if (enable_stb && dev->cpu_id == AMD_CPU_ID_YC) {
+		err = amd_pmc_s2d_init(dev);
+		if (err)
+			return err;
+	}
+
 	amd_pmc_get_smu_version(dev);
 	platform_set_drvdata(pdev, dev);
 	amd_pmc_dbgfs_register(dev);
-- 
2.25.1


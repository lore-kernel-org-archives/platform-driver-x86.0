Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09A63C48BC2
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Jun 2021 20:02:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5D9161166
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Jun 2021 20:02:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230101AbhFWUEt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 23 Jun 2021 16:04:49 -0400
Received: from mail-bn8nam11on2047.outbound.protection.outlook.com ([40.107.236.47]:10496
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230103AbhFWUEt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Jun 2021 16:04:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ltgZxP+2FC36G2ELsGxQ3lvxhStQAgw46sxSf7YSCIaJ3bERfYqdEvh87yzilbc7ZNP2uUMeZEvskHJlT6+Ol5rhva3ycHcNfVRiE6jBQUSaOxCGnT0FZ/havK3ZWXxt53UVv3TKQDFHAhnE8nenq3pGLkuMx7IkfUcwlG5UTqfhLu9lNwgfvDy+i+QNPnXi80NGL7MOdmsrgU0JTIvL3HPmKRmDhZSpi91vAItKas9bHnaQeuuXezg3fxGDcM85WXxu89/Fcm9WsF++j965PhoVMbHtGK0xO1bugbIoWwkgPuK2Zj1xoYJTex+XsCC2mCc5/Wt0RRCtU11zfrCHKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p6Mv21n1kHS0vOghK8WOKO/s0bM1TtxH57ov8+pre/Y=;
 b=LaMmXh5IMqJEU+p8HdEE69h+Cz+9GwV1DbqToiNoaeRV6H9xZk8aL3E2/miFMHx3p2eqDK/qlCK8ku5BxWrgHLHu9kai/F8PrsLiz2Pa9xYynzSPFTW3m5Fj61ZNqsbBEmXytaCxM0ulacXD4Y9radEKBG8OAD+a8tUuXJkD1GYind1b7VTAAn1rU2IE0OhIIwo6zf7vgOOGdbniiND0uHbvFjbBTsmNvQGqu+pgQ2Ie3s017Q8ZMe6rp77UUNIjL+NUVClkMHor8eMM9QgLvE1WBZw+cr9ax2Zh6ore2z6ZZHFITtQWzr/cgzCW9H/wMk6aX2N7Lr+7EJH1OM79Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p6Mv21n1kHS0vOghK8WOKO/s0bM1TtxH57ov8+pre/Y=;
 b=JiwJcjh8VxQoXplkGglRmP3eztP0WDdp5Q/aq8xO3/oOLnH/su+T7EjOYCWSymqPog1JZO9+H9YUVuLIisYsM49u/JWElXF/iOvfMFE2M64/GKAMiL+4rdAbjk6yn9uuWOGUodU9ZjPwFYmLgEz42z5o4/In+pZHh72VEXAmIhw=
Received: from DM6PR03CA0017.namprd03.prod.outlook.com (2603:10b6:5:40::30) by
 MW2PR12MB2556.namprd12.prod.outlook.com (2603:10b6:907:a::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.19; Wed, 23 Jun 2021 20:02:28 +0000
Received: from DM6NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:40:cafe::a4) by DM6PR03CA0017.outlook.office365.com
 (2603:10b6:5:40::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Wed, 23 Jun 2021 20:02:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT037.mail.protection.outlook.com (10.13.172.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4264.18 via Frontend Transport; Wed, 23 Jun 2021 20:02:28 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 23 Jun
 2021 15:02:26 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <mgross@linux.intel.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 5/7] platform/x86: amd-pmc: Add support for logging s0ix counters
Date:   Thu, 24 Jun 2021 01:31:47 +0530
Message-ID: <20210623200149.2518885-6-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210623200149.2518885-1-Shyam-sundar.S-k@amd.com>
References: <20210623200149.2518885-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d07d459-0f09-4196-504d-08d93681d41f
X-MS-TrafficTypeDiagnostic: MW2PR12MB2556:
X-Microsoft-Antispam-PRVS: <MW2PR12MB2556CA3FC1BC252BD096F6A99A089@MW2PR12MB2556.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ruNbNozdkibrjfNhXyuWmWDsOlLxm6/muNqCr4E3Dqs8xBALlZKOqIXglDKO2z1uXyB4lAOk82Jh/JPsH8LeNAsXABnwvlX8DqjA9p0otGeslgzEg6vOO4LjPyrmJnc69pu+cK4mK2183DHAmuRF6U84Dw+CkyysN88mjAXSuEczbrzboS4FgM5zgAAACPuU/STVThda3gMOOb+5IPO+U4/kMI9yP6m9scr771DqkUDQy8bnweggpqlIr9g9dYkqVLjBxO2Ty6UeZTP4t7E4xdtGU9Gqo5uXTYqQofQx2qNZhgMPv5UebmHqsPOhizB2N6BxUHm0nGrNPOCh+LnGa7LAG0X0w5sdTXDkUtBr3NuTrTRZ1wesE/1rKkRXkyzKEcP3C/vbExggoIsntKgcyxKEJry1ptE7WRdMvhOJ2qLICLVQDVksG18P3SmUz400twL51YwbGR46llwpu3uxBH7GpzP5nSI7O3W1DzxfZznI+Q0+VLkXfu1AI9aq7YIK86DqO4797m9aUMUIhqdoglStoYMJmkFEIlZ6ue3v55srKgdOzbBagsUIizXV5CbCoqWQpmGp7fRptc2IxvboLocjmOhKnT0iFUQWB2Q+rjKmebUCIbqMMkY6yQvKRTNr8yd2jSmNCceGHrFkGeYpFYmsHJqojpjeaGX74kzlmT+GqS1uDmXw/m1riJYs6GPyngyK0I3Lrc6nsAabY59l7Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(46966006)(36840700001)(8676002)(426003)(82310400003)(8936002)(47076005)(478600001)(26005)(4326008)(36756003)(83380400001)(81166007)(16526019)(82740400003)(356005)(186003)(70206006)(70586007)(2906002)(86362001)(110136005)(54906003)(7696005)(1076003)(336012)(36860700001)(2616005)(6666004)(5660300002)(316002)(32563001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2021 20:02:28.6149
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d07d459-0f09-4196-504d-08d93681d41f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2556
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Even the FCH SSC registers provides certain level of information
about the s0ix entry and exit times which comes handy when the SMU
fails to report the statistics via the mailbox communication.

This information is captured via a new debugfs file "s0ix_stats".
A non-zero entry in this counters would mean that the system entered
the s0ix state.

If s0ix entry time and exit time don't change during suspend to idle,
the silicon has not entered the deepest state.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
v2: no change

 drivers/platform/x86/amd-pmc.c | 46 ++++++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index bb067324644d..174f067f0756 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -46,6 +46,15 @@
 #define AMD_PMC_RESULT_CMD_UNKNOWN           0xFE
 #define AMD_PMC_RESULT_FAILED                0xFF
 
+/* FCH SSC Registers */
+#define FCH_S0I3_ENTRY_TIME_L_OFFSET	0x30
+#define FCH_S0I3_ENTRY_TIME_H_OFFSET	0x34
+#define FCH_S0I3_EXIT_TIME_L_OFFSET	0x38
+#define FCH_S0I3_EXIT_TIME_H_OFFSET	0x3C
+#define FCH_SSC_MAPPING_SIZE		0x800
+#define FCH_BASE_PHY_ADDR_LOW		0xFED81100
+#define FCH_BASE_PHY_ADDR_HIGH		0x00000000
+
 /* SMU Message Definations */
 #define SMU_MSG_GETSMUVERSION		0x02
 #define SMU_MSG_LOG_GETDRAM_ADDR_HI	0x04
@@ -96,6 +105,7 @@ static const struct amd_pmc_bit_map soc15_ip_blk[] = {
 struct amd_pmc_dev {
 	void __iomem *regbase;
 	void __iomem *smu_virt_addr;
+	void __iomem *fch_virt_addr;
 	u32 base_addr;
 	u32 cpu_id;
 	u32 active_ips;
@@ -140,7 +150,6 @@ static int smu_fw_info_show(struct seq_file *s, void *unused)
 {
 	struct amd_pmc_dev *dev = s->private;
 	struct smu_metrics table;
-	u32 value;
 	int idx;
 
 	if (dev->cpu_id == AMD_CPU_ID_PCO)
@@ -166,6 +175,29 @@ static int smu_fw_info_show(struct seq_file *s, void *unused)
 }
 DEFINE_SHOW_ATTRIBUTE(smu_fw_info);
 
+static int s0ix_stats_show(struct seq_file *s, void *unused)
+{
+	struct amd_pmc_dev *dev = s->private;
+	u64 entry_time, exit_time, residency;
+
+	entry_time = ioread32(dev->fch_virt_addr + FCH_S0I3_ENTRY_TIME_H_OFFSET);
+	entry_time = entry_time << 32 | ioread32(dev->fch_virt_addr + FCH_S0I3_ENTRY_TIME_L_OFFSET);
+
+	exit_time = ioread32(dev->fch_virt_addr + FCH_S0I3_EXIT_TIME_H_OFFSET);
+	exit_time = exit_time << 32 | ioread32(dev->fch_virt_addr + FCH_S0I3_EXIT_TIME_L_OFFSET);
+
+	/* It's in 48MHz. We need to convert it to unit of 100ns */
+	residency = (exit_time - entry_time) * 10 / 48;
+
+	seq_puts(s, "=== S0ix statistics ===\n");
+	seq_printf(s, "S0ix Entry Time: %lld\n", entry_time);
+	seq_printf(s, "S0ix Exit Time: %lld\n", exit_time);
+	seq_printf(s, "Residency Time: %lld\n", residency);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(s0ix_stats);
+
 static void amd_pmc_dbgfs_unregister(struct amd_pmc_dev *dev)
 {
 	debugfs_remove_recursive(dev->dbgfs_dir);
@@ -176,6 +208,8 @@ static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
 	dev->dbgfs_dir = debugfs_create_dir("amd_pmc", NULL);
 	debugfs_create_file("smu_fw_info", 0644, dev->dbgfs_dir, dev,
 			    &smu_fw_info_fops);
+	debugfs_create_file("s0ix_stats", 0644, dev->dbgfs_dir, dev,
+			    &s0ix_stats_fops);
 }
 #else
 static inline void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
@@ -332,7 +366,7 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	struct amd_pmc_dev *dev = &pmc;
 	struct pci_dev *rdev;
 	u32 base_addr_lo, base_addr_hi;
-	u64 base_addr;
+	u64 base_addr, fch_phys_addr;
 	int err;
 	u32 val;
 
@@ -382,6 +416,14 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	if (!dev->regbase)
 		return -ENOMEM;
 
+	/* Use FCH registers to get the S0ix stats */
+	base_addr_lo = FCH_BASE_PHY_ADDR_LOW;
+	base_addr_hi = FCH_BASE_PHY_ADDR_HIGH;
+	fch_phys_addr = ((u64)base_addr_hi << 32 | base_addr_lo);
+	dev->fch_virt_addr = devm_ioremap(dev->dev, fch_phys_addr, FCH_SSC_MAPPING_SIZE);
+	if (!dev->fch_virt_addr)
+		return -ENOMEM;
+
 	/* Use SMU to get the s0i3 debug stats */
 	err = amd_pmc_setup_smu_logging(dev);
 	if (err)
-- 
2.25.1


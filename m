Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D96BC2B9F4
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 11:05:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 394FB61879
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 11:05:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232769AbhF1LH4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Jun 2021 07:07:56 -0400
Received: from mail-dm3nam07on2089.outbound.protection.outlook.com ([40.107.95.89]:60128
        "EHLO NAM02-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232617AbhF1LHz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Jun 2021 07:07:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KK3gK4bppi3KYcmWhpkRnVl5J4lsN4fbkQLGJylKiu35x05+9UyxQb6VIr9jBoEwi+4RadZi7fspE3NQfDJ4Qh9/9eZQgi6zSr9VizORgJR4/nXgKg/JfzfWkiRee7woKXuB48WAKwf24vGSMG2hKygS1LJCgVv+rtBkp1c/YXjysUmndI4Knqp6BLchOvVR/qzj0r1/zMYjVqytbqaz4azNTny7GUDtEzoCwl5hfDI7EeJQDqynnfLp0lilb/nFCflICT6m5T8KEYC0krdKIr94Bhljk3FfaB5JExy4YvMt46Q1QtW7x+K3Vrx031fmid1wANw2Z2supJtrt5wv4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QM0iEmZxU55RBVWfdivXMTGp3jxEc7d55HQ7V7Ctkcs=;
 b=hZM1FNjlgxB7K2hl/5cllHfsEgDF0tb5/Xt1ILTS0fBuGQprbpAzMsnlXWXy2cg9AxTM7b5shkk+YDdY6FtDynQDFEEchk9u3dmxw4eIqLg3Fq7GKK3UXrwLbdHtujRB1lhJIyCKsuc0Z5KCw8K7xamF/eZRmmAfXy/k4OFJmb3W+Axbp+PemK6E7z6pg8g4xLn1lUIz+bqFukeTw+D9CVj8m9FjUYPho53tIZyWzLWPhw7iURqZuXcIkUvF+/DJcFJ1IIxwPE8+G/yfZ+35/h2BoBRyoAOUVgJufLmLPBCfMYPoSqJMxYCCT48FhQ7iaO1Z9ma8OCvp+488pLBUHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QM0iEmZxU55RBVWfdivXMTGp3jxEc7d55HQ7V7Ctkcs=;
 b=b0vuo/2Ma+DwHf2KWKTHqe7aUUw6wiaHJvkPSCUjeEsmgT9w4Y1mg+I+xG+mEHpF0jmNoBi23aUcu9TPa5rluIHUDb94SJ9NG5ggZUKAmCTdZ9W1Zahs+HXV1Z0oLbS4uBv/i3Mb3GHj8cr5wnTzGlaCskdC5VyPnu/Zg6wn6xM=
Received: from MWHPR20CA0018.namprd20.prod.outlook.com (2603:10b6:300:13d::28)
 by CY4PR12MB1336.namprd12.prod.outlook.com (2603:10b6:903:40::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Mon, 28 Jun
 2021 11:05:28 +0000
Received: from CO1NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:13d:cafe::32) by MWHPR20CA0018.outlook.office365.com
 (2603:10b6:300:13d::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Mon, 28 Jun 2021 11:05:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT060.mail.protection.outlook.com (10.13.175.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4264.18 via Frontend Transport; Mon, 28 Jun 2021 11:05:28 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 28 Jun
 2021 06:05:25 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <mgross@linux.intel.com>,
        <rrangel@chromium.org>
CC:     <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 5/7] amd-pmc: Add support for logging s0ix counters
Date:   Mon, 28 Jun 2021 16:34:49 +0530
Message-ID: <20210628110451.4047142-6-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210628110451.4047142-1-Shyam-sundar.S-k@amd.com>
References: <20210628110451.4047142-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 583c2bf3-f17c-4614-37c7-08d93a24a360
X-MS-TrafficTypeDiagnostic: CY4PR12MB1336:
X-Microsoft-Antispam-PRVS: <CY4PR12MB133616BB1F47F1E4C5CFA0429A039@CY4PR12MB1336.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8v40hC+q4/TODPxtg1+i2EkUjeOBuoN1hb/rny1oLNI3oQSn+ZQBkPLuzxta2KIBleDOwZ2erMtZU/MkxmCw29punufedWSyiLR0LAxXJeIREVdK83tFiW42Zb2Pylu5RrHoDVjsT9deAJoF6nIzO96iPjB98AAbqXJvHWP8JVv6sOAMmklDANchM+cxJrQONFJwB+fDXzrWvUh/17xfYoHs6uFcUSFbSTjunDIX+I30G+MXNse4xcwIQ3rnlTvWSeDS/txud9tuo37UHX8ZGjMmNl+29ITSa0oaGMT0QnFpDQLt9LDPnR4pFo+aoTupPyhjfwFMfy99Sq5uDTMLZ8M1Glq6nR9cgkKa/9yT+LcNDMd/uq2bm/+T9W/cEJ1Q/seOphRNrqCdO+U0rfWTe6e4YKgIZ2tU8Hii81qwrB+folDyVO72T38VVqMNTqNZqUfQ64XhFfhDrI2wJjQgs5VT/LRpK846z7kA8e+yLYMqQFob33woiqktpmbr0fHPIM7qUK/Fvu4Vl9pr0gwFCV8NC4uLIPGf0yCWoMcn3q2mX5ismFBgZRRUyj3a0wIujzJd1uhDW0eR3Hbw7Y3Tbil3DbHRczUZi/HPHHKcSBnDnuDz16vWyGDKP9C7XQQSwvFOqeptU1Ol7Babyo9vzQ0pxhZm4THxhWcwK4waolgbl1lZLEU5EPesgCH+Y2Tvk5nDhr8Cesr45kjNgk6OvfgmBVaRfPgOxhyKtpNfwJqZ63DIMjUDFBF/QrHW58IBk2BZAnCad4cAc3ncErelwQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(46966006)(36840700001)(82310400003)(7696005)(1076003)(8676002)(16526019)(81166007)(8936002)(356005)(36860700001)(2616005)(110136005)(478600001)(186003)(336012)(4326008)(6666004)(86362001)(36756003)(47076005)(5660300002)(2906002)(316002)(70586007)(82740400003)(54906003)(83380400001)(70206006)(426003)(26005)(32563001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 11:05:28.2182
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 583c2bf3-f17c-4614-37c7-08d93a24a360
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1336
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

 drivers/platform/x86/amd-pmc.c | 45 +++++++++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index baa5cc3e386b..31f6b847f200 100644
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
@@ -166,6 +176,29 @@ static int smu_fw_info_show(struct seq_file *s, void *unused)
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
+	/* It's in 48MHz. We need to convert it */
+	residency = (exit_time - entry_time) / 48;
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
@@ -176,6 +209,8 @@ static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
 	dev->dbgfs_dir = debugfs_create_dir("amd_pmc", NULL);
 	debugfs_create_file("smu_fw_info", 0644, dev->dbgfs_dir, dev,
 			    &smu_fw_info_fops);
+	debugfs_create_file("s0ix_stats", 0644, dev->dbgfs_dir, dev,
+			    &s0ix_stats_fops);
 }
 #else
 static inline void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
@@ -344,7 +379,7 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	struct amd_pmc_dev *dev = &pmc;
 	struct pci_dev *rdev;
 	u32 base_addr_lo, base_addr_hi;
-	u64 base_addr;
+	u64 base_addr, fch_phys_addr;
 	int err;
 	u32 val;
 
@@ -396,6 +431,14 @@ static int amd_pmc_probe(struct platform_device *pdev)
 
 	mutex_init(&dev->lock);
 
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


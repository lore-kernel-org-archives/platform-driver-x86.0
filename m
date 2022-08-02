Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98BD7C00140
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Aug 2022 11:28:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236934AbiHBL2K (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 2 Aug 2022 07:28:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233914AbiHBL2H (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Aug 2022 07:28:07 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2046.outbound.protection.outlook.com [40.107.92.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80112357DE
        for <platform-driver-x86@vger.kernel.org>; Tue,  2 Aug 2022 04:28:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mb6424LF8WF7U4sH8xU5GAA5esuKlk2h1p2JvHTd9plO66wN9VBXunI2PsDtAO9F7b2CUTawUe/FqoHb9HHlp7/H6D+2sHyZwM4P8L5JVG3CUf/bI3IWXSfnkD446v+YQ8fELq466dWDIFOi+bgo4K/F8sratoN8KvgIlC5KbfKdiXZPbbmW2rGxrEIiOmFIAtUfplzINsVwa1FEebSVTlw3Hhb2ABZsloy/8LmEJPm3vLCyUuAMDC/OtOKgydcslTlnu54vw1x9yBuknQFTBe8XvuAGJqmM7e9bmsSraV2/hYuafOISBY1w3q9dgUdy70GpkAW8ggpf8cvUPL4ZxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=smfUw0/1ajgXZd5jk6ml3rNLNmGLHg0cS4pFFjw35pw=;
 b=SNIl2Yi34N32oW/eo2iJBy7eP+4ov64TgkCdG+CTcEu+IBXQJsXh+4GVQ33Duhn6PA9RJpV0WpZ6YHAQkiaEcnXlXjZlyyUvcFFdhY0a6MoBCP0omGXksulNB1TUOEHp0R5BQWpmtneiTTXpNU/AY9NZTAPRSG2bRajXG9ODUPecxxUq0/saYf1aHlCIFT2odkXt/786Cbe642VadFecpyhiEDt55eH5FrnlTH58zaE+ovde0K74QNtwgW1peKce70Zt8f8ZBb/T6bXlpCNJp2NzACsKG4IpO2pXY/5WWb0z+/QJUXNniHnl+sEqnWD4fPxWWduy/yqe6ctqHPnR8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smfUw0/1ajgXZd5jk6ml3rNLNmGLHg0cS4pFFjw35pw=;
 b=rzLyRfP5UQvXTzNOJcR7kEQnd4uRIm7U2yJCMHgUhBCVkzIK+0NEG+am8WqI+oUx/Iqcjpr3Ehc8aZazKuCOLSJgPrPTTviPwAmzk5w1JXUVvyHJTDTfqhBkIs3mg3mP4TniF7NDOF7i7qFKap4chVeHAkaLcfk6bodTLwP5/rE=
Received: from MW4P221CA0009.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::14)
 by MW3PR12MB4475.namprd12.prod.outlook.com (2603:10b6:303:55::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 2 Aug
 2022 11:27:56 +0000
Received: from CO1NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8b:cafe::c3) by MW4P221CA0009.outlook.office365.com
 (2603:10b6:303:8b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25 via Frontend
 Transport; Tue, 2 Aug 2022 11:27:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT053.mail.protection.outlook.com (10.13.175.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Tue, 2 Aug 2022 11:27:55 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 2 Aug
 2022 06:27:53 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 10/11] platform/x86/amd/pmf: Force load driver on older supported platforms
Date:   Tue, 2 Aug 2022 16:55:44 +0530
Message-ID: <20220802112545.2118632-11-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220802112545.2118632-1-Shyam-sundar.S-k@amd.com>
References: <20220802112545.2118632-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee56002b-1131-4f3c-a480-08da747a0be4
X-MS-TrafficTypeDiagnostic: MW3PR12MB4475:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0Zqi7JIKsMBGyGPg2JInI3E13tWSVbLuK3pVyitAX/mwSsZvmPmd6w2a0Jt84IysjX12h63s+u80s6xtNvoqByOpv97vACbNOltAU8itQM2cno9Ae3OQ7QIoj5JYgz/fxViySNa/IQBdHtkZA4NgpSye50LC2mPwhCv4k7BLnGtC0QRG/HuL2NLH82OLcskEytb4BUjGFo5Cyuw1/qcs4Gp+jexhV2KLGaqyz0cJ3xLVCqj/vN8jLLpJ3YbdGVIis+xPIvs8rTckoEVc6lxEarv60dgAZ6XT1uGLUfUY8RKjLzdjQM/8NiL3t6D6+QJjZtfUKRLq/vAnj+Hx/oZQkNBov5BtbFF3h61BSTMXYVutdb199d5T5b/TQwX1PeGfnJ9PvQ2zhtvfH1+0RUp0f0FF9/fq4OqBaUHJY4Y8Lj9A+JcMQ5/VoDCaho2zTVtuQYjznxr0M17T8p/7Byg+fKgJMtJx68r4uz6jg8XT/Bx2qHUBd0/bR1L7HmcFCfG/I6pKMtl0zAHettyBtIDl7RzwZCYYm5/1WCvuZJBEhdA6XNA47lX/s+uai9x2BC8EUuEqZ0fiNb5p9P1PM/Strdi2KsYuvJIlBVeRC2XBUUJn3ghWnP8OvZy6k0b50imAsjbbR7wxwl8CQupdIyEXwGkd1ZyuoBjc8Z5it8Sl2nPRWY64Fk1AFG++EwtggQLqZNtBCeSW0vskGd792cV2fh55Opc9VGAEW3HfEph6FYqjCXJM2YLymSSxwkzehkWmWYmRKnn9A60W76tjc3HXILtL7H6PyXYJrqq3Iiw8cCmEJtx0trG4heBflPZnFe1LJ1Gbv2rDKh9Pp0piQAmkjg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(346002)(396003)(136003)(46966006)(40470700004)(36840700001)(1076003)(82310400005)(2616005)(83380400001)(40460700003)(16526019)(186003)(82740400003)(478600001)(36860700001)(47076005)(426003)(336012)(2906002)(40480700001)(5660300002)(8936002)(26005)(7696005)(86362001)(6666004)(41300700001)(8676002)(4326008)(70586007)(70206006)(81166007)(356005)(36756003)(316002)(110136005)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 11:27:55.8993
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee56002b-1131-4f3c-a480-08da747a0be4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4475
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Some of the older platforms with _HID "AMDI0100" PMF driver can be force
loaded by interested users but only for experimental purposes.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 4467d682cd11..dbca5d7c6311 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -39,6 +39,7 @@
 #define AMD_PMF_RESULT_FAILED                0xFF
 
 /* List of supported CPU ids */
+#define AMD_CPU_ID_RMB			0x14b5
 #define AMD_CPU_ID_PS			0x14e8
 
 #define PMF_MSG_DELAY_MIN_US		50
@@ -52,6 +53,11 @@ static int metrics_table_loop_ms = 1000;
 module_param(metrics_table_loop_ms, int, 0644);
 MODULE_PARM_DESC(metrics_table_loop_ms, " Metrics Table sample size time (default = 1000ms) ");
 
+/* Force load on supported older platforms */
+static bool force_load;
+module_param(force_load, bool, 0444);
+MODULE_PARM_DESC(force_load, " Force load this driver on supported older platforms (experimental) ");
+
 static int current_power_limits_show(struct seq_file *seq, void *unused)
 {
 	struct amd_pmf_dev *dev = seq->private;
@@ -208,6 +214,7 @@ int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32
 }
 
 static const struct pci_device_id pmf_pci_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RMB) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_PS) },
 	{ }
 };
@@ -265,6 +272,7 @@ static void amd_pmf_deinit_features(struct amd_pmf_dev *dev)
 }
 
 static const struct acpi_device_id amd_pmf_acpi_ids[] = {
+	{"AMDI0100", 0x100},
 	{"AMDI0102", 0},
 	{ }
 };
@@ -272,6 +280,7 @@ MODULE_DEVICE_TABLE(acpi, amd_pmf_acpi_ids);
 
 static int amd_pmf_probe(struct platform_device *pdev)
 {
+	const struct acpi_device_id *id;
 	struct amd_pmf_dev *dev;
 	struct pci_dev *rdev;
 	u32 base_addr_lo;
@@ -280,6 +289,13 @@ static int amd_pmf_probe(struct platform_device *pdev)
 	u32 val;
 	int err;
 
+	id = acpi_match_device(amd_pmf_acpi_ids, &pdev->dev);
+	if (!id)
+		return -ENODEV;
+
+	if (id->driver_data == 0x100 && !force_load)
+		return -ENODEV;
+
 	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
 	if (!dev)
 		return -ENOMEM;
-- 
2.25.1


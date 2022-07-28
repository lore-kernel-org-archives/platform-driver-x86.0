Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04DF3C19F2B
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Jul 2022 18:21:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231881AbiG1SVW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Jul 2022 14:21:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231688AbiG1SVU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Jul 2022 14:21:20 -0400
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2048.outbound.protection.outlook.com [40.107.100.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 332A75A8B3
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Jul 2022 11:21:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AXWCl/xPReBXYzdUgWminnnn18Wv2sHgRu7dWPyfL+nOaoTVebo5VBC/J7COLvk8eTygrFi/VZvbv7CyAv06yZcg+MRg+31R1qOYv8V8O8yXd5Vm3lapwCEpDTr55mwEacPeNtDIXPQD++IyfyWVgXHk818icY83sAWrhWD2+Mzws+Hq71ZBB2f9wx6VbWH4jqb9oZmKbXMX/h4OuFtBIhVl9NqFheYe6UGyknUfv24I9BcRF6blC26mFBmn8tjCzl0TXx7Ig+bSTxUu0uCgHeDAIi/R6DYzNdbe6IAx9qIXEkOt5Qb520j7ot1LcMFxEN6vveFQDNt9nU53+XgjdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hCt/J5GKr7u1Km835f7DXDv7cNLImwXJmZxCJLvnd/k=;
 b=Utl8m7b6YxtoTE6cyT2CZ42D7xixTLm7RsB9+HfZifb2dOwSY/r9OlGct04OiEhs+jNjMSpV8F/98QCRgzXK+f59aNPJ2ryFtqWlHioh9zMznyDDQLOUZOyn2ZzxK8+qlvYkROnIG4Ai982+j0My6IrYQ1/ei8z6WSjNR6MKW5q8G/xgpVPBOLxxnH+xu6k1X/7f7euH5vjHNJkSSPQtuzJ4BBz4gAXPGvUSg+lq3wVMh6jJNNOqZEdhDfcRenglAH8xE+19m/rWt50zIVCMTaN+sEcJpB8qCLrBjKn4zrFuOxjXAFvlNy8UH5gHof5nMgvNmJy5wuxDno+V8CndDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hCt/J5GKr7u1Km835f7DXDv7cNLImwXJmZxCJLvnd/k=;
 b=1J01lH55XiCGrrAwNiCSDBqqXi3+VAQIGqYkIe7KGTxGldbU16aFs4nadDWJHaCWQKg/IiwZFa0eR9DCrJ6Mkb4aHYfRfd2CVjCseQolJDfob7wnQtId17fg2G+w+KMK1G/C5UDhW4l9mNhfiseENAygFxuvF2TptNZm+LhhYsg=
Received: from BN9P222CA0018.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::23)
 by SJ1PR12MB6122.namprd12.prod.outlook.com (2603:10b6:a03:45b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Thu, 28 Jul
 2022 18:21:17 +0000
Received: from BN8NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10c:cafe::67) by BN9P222CA0018.outlook.office365.com
 (2603:10b6:408:10c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.7 via Frontend
 Transport; Thu, 28 Jul 2022 18:21:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT068.mail.protection.outlook.com (10.13.177.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Thu, 28 Jul 2022 18:21:16 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 28 Jul
 2022 13:21:12 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 RESEND 10/11] platform/x86/amd/pmf: Force load driver on older supported platforms
Date:   Thu, 28 Jul 2022 23:50:27 +0530
Message-ID: <20220728182028.2082096-11-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220728182028.2082096-1-Shyam-sundar.S-k@amd.com>
References: <20220728182028.2082096-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2475729-ebc2-47ef-93e0-08da70c5f606
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6122:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tIKaWnpkH3dWdi9/ltw9Ku/uRoZOyPs2LC0bAuFV2rhaeusZI6OO8dFwaqHGgLzESTjpf35YaRF9LYpDfbVxFcqZbH33RQUUWHPXoHnveQJX8V5QSNaU/NhG1gOxJNcuMnZfluuC4jIrWZtH586q8125MQ+nq9wTpgN7nZ+fGUadomIHMeGZJulZ3UktoVal7xi7FdmZS48EqnEDQiyZsotiZtPueViMLEkB5w1yMZSDmWIVPG9Aixw3GZ5eyiibimRs6RVbPcv691MDj/kdynsn1RvgVtFnZ+OdrKTypQv47Y8jMnaOpt4rAUhe/Wotr3RRmo9CK7KR4g82fwHe17WWaH1UTrPAcwxaOTTUm0cs0oOqwSGrIXbj6NqSt59JjWFlFAoSsPI925ZQ5n2fj646hSjISdlOR7qu+HC2HtU8foeh15vkzkt7bja3hBIILvBtKpy46BjCxiRykKwj8WKB89/KLIeUSSlwsEIzysPeCj1GtRiwjzFAvf72KMKRYIR5k9kiZPyszPtupooCMrWZjUG4cXWAGMGfPAUsV8xF7VM8ms5baKso2DgLBmhFSZAFTg1L5+sRQSxp5opeDMZmwT5RUW0pWopdMHQOGC5DzWgJqeDI11RUsZJIN1Ycnuq80nVpNGsuR0ZbUB8VbcV0RW+7OGhlKFmWDqcsPEHNNzWeA1+tNV3ZA++G+DZrFinwV0y5sK2Kjcjw0/R4iN7bkJdTB0JQochDAXkWB5sSnwfwueX0PMUWztj1lVYKYVNH1IJ/glo9kOnLRUaVZpIo6kplvFFaoo45nuhVdAbLgIM27HFQhbcs70GrUDkpDXi6t2vbn/04dVFmlUtRTQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(396003)(136003)(346002)(36840700001)(46966006)(40470700004)(4326008)(336012)(40460700003)(70206006)(82310400005)(70586007)(2616005)(8676002)(110136005)(5660300002)(316002)(54906003)(8936002)(40480700001)(36756003)(86362001)(2906002)(186003)(47076005)(426003)(83380400001)(16526019)(41300700001)(36860700001)(478600001)(82740400003)(356005)(26005)(6666004)(7696005)(1076003)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 18:21:16.4059
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2475729-ebc2-47ef-93e0-08da70c5f606
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6122
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
index bfae779ccc23..c0e3780ae3d1 100644
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
@@ -237,6 +243,7 @@ int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32
 }
 
 static const struct pci_device_id pmf_pci_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RMB) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_PS) },
 	{ }
 };
@@ -294,6 +301,7 @@ static void amd_pmf_deinit_features(struct amd_pmf_dev *dev)
 }
 
 static const struct acpi_device_id amd_pmf_acpi_ids[] = {
+	{"AMDI0100", 0x100},
 	{"AMDI0102", 0},
 	{ }
 };
@@ -301,6 +309,7 @@ MODULE_DEVICE_TABLE(acpi, amd_pmf_acpi_ids);
 
 static int amd_pmf_probe(struct platform_device *pdev)
 {
+	const struct acpi_device_id *id;
 	struct amd_pmf_dev *dev;
 	struct pci_dev *rdev;
 	u32 base_addr_lo;
@@ -309,6 +318,13 @@ static int amd_pmf_probe(struct platform_device *pdev)
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


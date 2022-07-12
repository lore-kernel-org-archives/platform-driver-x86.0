Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49286C43334
	for <platform-driver-x86@archiver.kernel.org>; Tue, 12 Jul 2022 15:06:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233959AbiGLPGB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 12 Jul 2022 11:06:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233966AbiGLPFd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 12 Jul 2022 11:05:33 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06E9EC25A3
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Jul 2022 08:00:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b9v/GGQYvMO/7YfAkCnhb3Jk+vaKNZUpTmnKiLs06oEH1QzoPFz8WrUel0AhiU97ez8Otio7mnkvJLOsaFn+UCSL6apfVaFMOoLtNwMY+IvxG+jP24jgsI8COR3nV9Js5THAurottuhZpHvpqWmUwcEanSAZeOD91llsWXKffibDu0a1qqYj5w3FTeF7xP3L8czvwYZ3rZq+PiuzZoqQF+5rbiVrstzXqiYgo+bKNWMMJI4Cri7EdSxmsxsdVgEM/+LxMItZ+H21afkWQwOE7Ba7pktxAsiQfC3KzJjUTo0RvxUAIrRRtDXsM0EyfW6uWZFjQjtvPetFCc1uaF4ZlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dsDhos2PMKEgu5ZvkCD0TxXJB2Vb8I9tRFzBw+bxQmE=;
 b=VCe3epoeZ/IpcR17Ht+rLsbsLxrlcXscCE+VOgq1UlNeoE+JTU9hvwW8E1eDQz4uI9Yw2JxaXMvXueyGIjqKMU3hgzSqy+B63OnFCJ3I5sg1yEogCcnY+Qm7IE+Ha9Rj9MJ8rHlfOCffPxjAyDglTPmvsFzgfyKH0I8Hctpd3Z0/klwkxO2mJ0EA7DF7YYdJoikQfskJyanItslS8vN8udQLe6JIY/C1lduK+Dre+znd/CC8DTJ9fBmXBAKXd9fpMBuCauA8Rwt5dwdnmo3udNJuRlp1sVYmU4illtfsSMTQEguQXErsNVXssJtDI7YOSWInKF0+wly35eoqkAGPLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dsDhos2PMKEgu5ZvkCD0TxXJB2Vb8I9tRFzBw+bxQmE=;
 b=MAXAuux3bipmF3YSsBG/OCC4LNHQMeR5/kUVT94n96QGsf8UoOYMPYv0Y8FVEYiakxl1W79MZPep4tZJay73U39/kuDD3asuTpxOkG4piRe+UUAdP1YheFBqbtpUbJJXPzlZG/lvyk1sEbIvaOzHyH8+C6fp8HmWOM8op68Wdm4=
Received: from BN9PR03CA0621.namprd03.prod.outlook.com (2603:10b6:408:106::26)
 by BN8PR12MB3635.namprd12.prod.outlook.com (2603:10b6:408:46::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Tue, 12 Jul
 2022 15:00:14 +0000
Received: from BN8NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:106:cafe::d2) by BN9PR03CA0621.outlook.office365.com
 (2603:10b6:408:106::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20 via Frontend
 Transport; Tue, 12 Jul 2022 15:00:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT009.mail.protection.outlook.com (10.13.176.65) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Tue, 12 Jul 2022 15:00:14 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 12 Jul
 2022 09:59:55 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v1 14/15] platform/x86/amd/pmf: Force load driver on older supported platforms
Date:   Tue, 12 Jul 2022 20:28:46 +0530
Message-ID: <20220712145847.3438544-15-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220712145847.3438544-1-Shyam-sundar.S-k@amd.com>
References: <20220712145847.3438544-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 141a80e4-a6b1-4d1a-fec2-08da641739e4
X-MS-TrafficTypeDiagnostic: BN8PR12MB3635:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JgB4k+fQ9a+ywoX48sc1LtcyHc2LW2vJ8/v9CztLVMAQ/vpGqR7unWC82MsdsiFoHhLxXH62sY0CG2HP6fzL2lrx0WruPUbTv2HcIYKipQxck/R/gFhew7wEePRQkMxzGAxmEu8g5c5gL6RAtRkVYMl/nnntfnCwedupTWZj4dRe2VQPuS23KiAF52qUOao7yqW69omHmtPQEoNJGgX+CG2L8KXDcbXFDd6tIbsDsK2shPnZo5s6x4QjwDGYqFqFEqO3AAI7jRgkBtU4LvY2mx7v+iBudTMv2OozQTPk9poTWJSmCUT/OoR9P1EiOoXDvDLZu6Gz5W2scJhjXP/hRWmod9H+yl8LboTWQK/VqrZQvuR3h/QgIhdXifAklYrMutMQp5I4tcqKIQivA/nNiHqAmrIR73b88IRXl8keLjHW5if3fhCUUb6rm09sGalbfjSK0BJKgE4z6iuBG45jTEDVVwmBA3pgxI9D9GM1G4yotQtHkHRaNmN0a6CZx9SAuwe+REa3+ep1MqFzjL+mYbdqrdtRv7JjOjJiRdIoZebDmnLEQ0huzzY6U2/5r1FuSPL8F5AbulpVNcV/QvooVzlYkbJiGIgVougcpXIVPVRgIbgMNLsH+KtW5CdY/hVA2WLs0iBjVZqWSnf1+sDAh/E0zgTBT+PHf4SLLYmz+O9JVXbRBVcN7jtEE1UsQIEZMQJTa9RQ343d5MPEm4JvmxyeiHJEOZSmO4TDmtBa7geDHFjZCuru/RdmQL19PoD3uF4kCUkJu9Ajc+XEwrBX4RBDr6NgFJpkY5rfOkRfF7aJt/mqZvWshpB6NEl/T04YuhdPQVI/lileXbtcpR9hDJ5zd752pgwslkj7tQZWgUM=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(396003)(39860400002)(346002)(36840700001)(46966006)(40470700004)(110136005)(2906002)(336012)(426003)(316002)(16526019)(47076005)(1076003)(54906003)(82310400005)(186003)(86362001)(40480700001)(40460700003)(36756003)(5660300002)(70206006)(81166007)(356005)(8936002)(4326008)(36860700001)(70586007)(8676002)(7696005)(26005)(41300700001)(6666004)(2616005)(83380400001)(82740400003)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 15:00:14.3899
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 141a80e4-a6b1-4d1a-fec2-08da641739e4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3635
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Some of the older platforms with _HID "AMDI0100" PMF driver can be force
loaded by interested users but only for experimental purposes.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 2a3dacfb2005..ef50d67f6013 100644
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
 #ifdef CONFIG_DEBUG_FS
 static int current_power_limits_show(struct seq_file *seq, void *unused)
 {
@@ -240,6 +246,7 @@ int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32
 }
 
 static const struct pci_device_id pmf_pci_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RMB) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_PS) },
 	{ }
 };
@@ -313,6 +320,7 @@ static void amd_pmf_deinit_features(struct amd_pmf_dev *dev)
 }
 
 static const struct acpi_device_id amd_pmf_acpi_ids[] = {
+	{"AMDI0100", 0x100},
 	{"AMDI0102", 0},
 	{ }
 };
@@ -320,6 +328,7 @@ MODULE_DEVICE_TABLE(acpi, amd_pmf_acpi_ids);
 
 static int amd_pmf_probe(struct platform_device *pdev)
 {
+	const struct acpi_device_id *id;
 	struct amd_pmf_dev *dev;
 	struct pci_dev *rdev;
 	u32 base_addr_lo;
@@ -328,6 +337,13 @@ static int amd_pmf_probe(struct platform_device *pdev)
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


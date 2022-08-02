Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA4D4C19F2C
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Aug 2022 15:13:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234193AbiHBPNp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 2 Aug 2022 11:13:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234624AbiHBPNn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Aug 2022 11:13:43 -0400
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2068.outbound.protection.outlook.com [40.107.100.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 481BB17581
        for <platform-driver-x86@vger.kernel.org>; Tue,  2 Aug 2022 08:13:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HtFS7hM7YP66CLlp3G6WZAp2b9UdAMrQkKXchAVLTZr/0Khgkz3pT1zbsYyjV3nd1JNq7WfEqxEQJM1XL+fX3RmlNECtao0xb0J3taGdfXnOk0tgeX3f0YjuIgeT1wfcKzrOKEr1w9COVpRi6/ZkbZ1/+9fmpNVg+CsBTbGBnsTW16wJM4zfEosZsF3Bu41FEFGTYZCoRPZw+zqRx8tlId11lEu6YMMPQYTppx7dq9vex6m7frxqodyrlGBmhrgs6+QDY9xW2aKw5sJtanMpkQoRdwQTQSgKIphnDpUJX0Vl7/mqmWY7V1uXf1yfsv9Mu0gwtiPo5WlNJN6bDo45cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LTOPTtcTtLwYERkeUC8c+spsPlj86ria9DxLk1EUKGg=;
 b=aq6FB5CsmfTBiw9DPZ6I3PNIbYd3D01iYLZSf+6frDDqRUrDhCTejkyjEqS5Ks237ZeDqWikSrDTflfhSAdst+bDg6xmRBlzrzwqdfKXjFy0AC1sCv7xrDgDiY9QCXcv8a58IHuKuzeV8ZseA74P/LcjStyQCnF5ONHFRvap14lCOwPDgVB9YGss5k5lKNPOWu12lSBL+n+6CGlDxerZiWM9ERr4IJts9pLwAin6u53Do9N8eymIBhN31P4S/NHVtNt9nZF/o+wuMETJc1+2KVY3K6kXzYXbO/BAvt/XdUaAz0lBvjIIG6zJgaP9oVydwE0XWFg4XGJ7yjzyy83P5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LTOPTtcTtLwYERkeUC8c+spsPlj86ria9DxLk1EUKGg=;
 b=Oa8wKcIEMMv0cAXr8kHp0Kl82arMZipxdx64m7N8TM59ayXdcq7cgiE2nr2uHmDDrf0F5JO7PiqDZkzj79TcDD4BCFtjjhkys6ZpCp5tQjYAtd7trwmHDdah1u9QQfuTGvMH8OKPnhDB4LHgZARYfPEwIN2XRPaGVMKpsxBjcOU=
Received: from BN8PR07CA0011.namprd07.prod.outlook.com (2603:10b6:408:ac::24)
 by MW4PR12MB6801.namprd12.prod.outlook.com (2603:10b6:303:1e8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Tue, 2 Aug
 2022 15:13:40 +0000
Received: from BN8NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ac:cafe::6d) by BN8PR07CA0011.outlook.office365.com
 (2603:10b6:408:ac::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.15 via Frontend
 Transport; Tue, 2 Aug 2022 15:13:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT026.mail.protection.outlook.com (10.13.177.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Tue, 2 Aug 2022 15:13:39 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 2 Aug
 2022 10:13:36 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 04/11] platform/x86/amd/pmf: Add debugfs information
Date:   Tue, 2 Aug 2022 20:41:42 +0530
Message-ID: <20220802151149.2123699-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220802151149.2123699-1-Shyam-sundar.S-k@amd.com>
References: <20220802151149.2123699-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b038b122-f473-496b-bc8e-08da74999440
X-MS-TrafficTypeDiagnostic: MW4PR12MB6801:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y8jAwxq9atjkxx2x9lBZ69v8UXBC7A34v88RfEgUEOfuuPQLrPcDFhrfsPG09GVbs4SEJ0kc3DvSMbhCb4HAeFharXDFTzh70ez6KR0Snn5J8mRtEgkY1CWgciTtMqrwtZO9qg0fVxwZqgDUuroxBCBR4OCMBG10zGWfov9TIT8NWL7V5qWiUImBkrkdg1JTUxRTdRCkCwBj5phHQd7xx/SiRGV+pyd9jlWzV6WV1LZEBPI4fQ4ZcO+WhdHLb9nvy/AuYNDNN0pGHPIojp7oxz004wbS/TADn3UZ/R4Zx83pGj0WeQg4QazqpbR7eXEyJog/PzmLavACDXyJR2exaczI9DkEl+s6IQYZyesODEG/UARIC5mAvrri2H+OOjaui2InZ6L8HC7fsHPMYNd1xxRsEOlBj2XFI/C7hrSFZNou4o0/TeXX6aYONuCXuivOscJJEVGyBC6Bnte5Iacla+4g4xGl6O5+xUud0cQz68vIOyyjlhl+opHaLSsBmd34G/a9Zkz86AnMj0lmsiM4oV9tNoItA8RyUBJtE2c/z6wWwkiwSOvNykOpY2QEdSh7Xn19gnJMVMg/Eygft4MCi6TL4AkZ52vBuw+RPtt0y2uNo5LQ7w4tMcb0DOGFFDYKsuS6pOyhthyXCkR8BLC7WSaifm/Z/8zNFbdGkU7Hdfzwya8Mk8sFx6tGLn739uzjFKcTQzhvyuHEr+SrrYV9rwrBVdl04uF5VykV6l+/wqNrVNCRhLPuAUVwtYojPTP4Np49lBbbpAIDptZhxgpzyxJx9k2OMgrnrH3Ze+krH9s1JURNlwuT4V1tpc/qCcCI3b/kU8cf8o2bhfp6HZG8Tg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(39860400002)(376002)(396003)(40470700004)(46966006)(36840700001)(26005)(356005)(16526019)(186003)(86362001)(478600001)(1076003)(2616005)(7696005)(8936002)(82310400005)(40460700003)(81166007)(336012)(426003)(47076005)(2906002)(41300700001)(6666004)(82740400003)(83380400001)(5660300002)(110136005)(36860700001)(36756003)(40480700001)(316002)(8676002)(54906003)(70586007)(70206006)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 15:13:39.1810
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b038b122-f473-496b-bc8e-08da74999440
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6801
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add debugfs support to the PMF driver so that using this interface the
live counters from the PMFW can be queried to see if the power parameters
are getting set properly when a certain power mode change happens.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c | 36 +++++++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h  |  1 +
 2 files changed, 37 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index a70ab6c9608a..032d9dc5e09f 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -8,6 +8,7 @@
  * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
  */
 
+#include <linux/debugfs.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/pci.h>
@@ -46,6 +47,39 @@
 #define DELAY_MIN_US	2000
 #define DELAY_MAX_US	3000
 
+static int current_power_limits_show(struct seq_file *seq, void *unused)
+{
+	struct amd_pmf_dev *dev = seq->private;
+	struct amd_pmf_static_slider_granular table;
+	int mode, src = 0;
+
+	mode = amd_pmf_get_pprof_modes(dev);
+	src = amd_pmf_get_power_source();
+	amd_pmf_update_slider(dev, SLIDER_OP_GET, mode, &table);
+	seq_printf(seq, "spl:%u fppt:%u sppt:%u sppt_apu_only:%u stt_min:%u stt[APU]:%u stt[HS2]: %u\n",
+		   table.prop[src][mode].spl,
+		   table.prop[src][mode].fppt,
+		   table.prop[src][mode].sppt,
+		   table.prop[src][mode].sppt_apu_only,
+		   table.prop[src][mode].stt_min,
+		   table.prop[src][mode].stt_skin_temp[STT_TEMP_APU],
+		   table.prop[src][mode].stt_skin_temp[STT_TEMP_HS2]);
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(current_power_limits);
+
+static void amd_pmf_dbgfs_unregister(struct amd_pmf_dev *dev)
+{
+	debugfs_remove_recursive(dev->dbgfs_dir);
+}
+
+static void amd_pmf_dbgfs_register(struct amd_pmf_dev *dev)
+{
+	dev->dbgfs_dir = debugfs_create_dir("amd_pmf", NULL);
+	debugfs_create_file("current_power_limits", 0644, dev->dbgfs_dir, dev,
+			    &current_power_limits_fops);
+}
+
 int amd_pmf_get_power_source(void)
 {
 	if (power_supply_is_system_supplied() > 0)
@@ -231,6 +265,7 @@ static int amd_pmf_probe(struct platform_device *pdev)
 	apmf_acpi_init(dev);
 	platform_set_drvdata(pdev, dev);
 	amd_pmf_init_features(dev);
+	amd_pmf_dbgfs_register(dev);
 
 	mutex_init(&dev->lock);
 	dev_info(dev->dev, "registered PMF device successfully\n");
@@ -244,6 +279,7 @@ static int amd_pmf_remove(struct platform_device *pdev)
 
 	mutex_destroy(&dev->lock);
 	amd_pmf_deinit_features(dev);
+	amd_pmf_dbgfs_unregister(dev);
 	kfree(dev->buf);
 	return 0;
 }
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 5c867dac7d44..e13542359403 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -90,6 +90,7 @@ struct amd_pmf_dev {
 	u32 supported_func;
 	enum platform_profile_option current_profile;
 	struct platform_profile_handler pprof;
+	struct dentry *dbgfs_dir;
 };
 
 struct apmf_sps_prop_granular {
-- 
2.25.1


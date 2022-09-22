Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E17BCC6FA86
	for <platform-driver-x86@archiver.kernel.org>; Thu, 22 Sep 2022 13:12:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230512AbiIVNMy (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 22 Sep 2022 09:12:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229803AbiIVNMr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 22 Sep 2022 09:12:47 -0400
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2044.outbound.protection.outlook.com [40.107.102.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 511F6EC56F
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Sep 2022 06:12:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B17sLPiu4NRtKHmpdk6bDVK5rjeR2V0lw2bHOq4JBQCSQq2thnbgHtdDnKz4NnpulDzo2Qm9NmdJKfpVX+AXowFSTx2ebEy6qwI8Kc1U4TFS3NasLQxdIb+CkHASnC2takqb5XZuETPVKPpD9oNFZxl8W8ChbfHdevZr03tINRulxfxGX4xdiDVMDxysV7Y7mbh2qtKCVYYbhnlw1kfvmJnp944Kho5Ha1J33ti9yiQdZkOewBYk2FyECAUtoee9w2DGUf9PSi+jxrQd308ifQA9tY8V3MUMc58J6UVYducutupK2NKYrPVy2T/qlAtJklM/fkaxLNpYadFpC0jBSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5zBICi51G8rXIhBSunKmUKjzxQnl/re5Lkq5ARK+VXg=;
 b=KrtcsXXbzja7F5w9bqN2FpVW47KBhrxdwc48sOrWbuADBnWMOXzco4sGl6PAZvNf3ojXbzmhdGPN6tuLYRWJoi3uW4JpEyNnmJ3o4ph67hxYhd/J5mjTpV1UNi/cMMroI6LSzd8it2tnj6n1BzHknHWwXCss9rTdkdOKUXjd/zQSGm1e3GFonEnF+vfpfTH6q3l3xDAbzdd/EcGW7jB2gHZVOhrRi3omGsXNpdiNXvWn2CzrEl66/0guor2f7QEP0JyJ2JyUBxnJlowGWmKoH1S4U6O1LNzty981QGm5pyIdvBxBVcdFnjudCo3RQCkBXP9W46dS1nfpkQ56fVmcew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5zBICi51G8rXIhBSunKmUKjzxQnl/re5Lkq5ARK+VXg=;
 b=b3+4Fy/7f0/mk1PRB5AEcYPQrUKHynVDJjPxv6qDTHwWAaConYxqEtKEeMzZI6F0/XH4M2xTzBvYrfiyD4I6qVm2U6MNqtY30mJ99jeYOi+C6XqFweUJg6R+EYBNy+e/uSGYL0zVGogMqxB+mTfOcDOA5O1BNQBHHclS3lhem4s=
Received: from DM6PR08CA0009.namprd08.prod.outlook.com (2603:10b6:5:80::22) by
 MW4PR12MB6729.namprd12.prod.outlook.com (2603:10b6:303:1ed::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.14; Thu, 22 Sep
 2022 13:12:40 +0000
Received: from DM6NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:80:cafe::7d) by DM6PR08CA0009.outlook.office365.com
 (2603:10b6:5:80::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21 via Frontend
 Transport; Thu, 22 Sep 2022 13:12:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT048.mail.protection.outlook.com (10.13.173.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Thu, 22 Sep 2022 13:12:39 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 22 Sep
 2022 08:12:37 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>,
        <mario.limonciello@amd.com>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        <bnocera@redhat.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 2/3] platform/x86/amd/pmf: Add sysfs to toggle CnQF
Date:   Thu, 22 Sep 2022 18:42:01 +0530
Message-ID: <20220922131202.56529-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922131202.56529-1-Shyam-sundar.S-k@amd.com>
References: <20220922131202.56529-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT048:EE_|MW4PR12MB6729:EE_
X-MS-Office365-Filtering-Correlation-Id: f2c442d8-9759-4338-74ea-08da9c9c206a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 30Swv5HUrZp+yEHAzI13CblH87Urk4b97T4e2RFGpmP5ncosagVo7W26I3iERahR4Lbg+AHDdJ445wD+jw30/YXhqnpu6QcrZOfpseoDbXskp+1aCQ+iTERG9/3534uxgG/NV5jY0yxHHAJWFYAzlvyY4Z8sXEE504lmOUbXLMlr3n9NlidH3EAvJlvCgiC6sWhM0rrNUkw3PE4DMiJPYIvL0tRbZYBeV2+4OwnnM88w8Lb4RB/w96Y8fq0+zZk7MQpSX/xARpBd5kWmYsI+BzXS0NRFOELh2scKnROMJiUaAOw34BTS57QlGOO2PO48f6wg+ZhAtbXwm9+EfEtxOIfUyIPoquiy1aswQ7SIsj7MtczZgXqdCALLmuYaCWoxNsYXBiHYjEY1MpChPmBIRnQ1CJEs6IT8wMQOxbxRUpQL+Xw/dVMs+1PsZ9Rwm3Zp2R6k0tEAGqPJRmTOzIAiDVNZhO66PDychk8dDiIJYarqjZpr66p1i0Vy20tAYLwnJPiLdtDQVIB7R25eWj3vwVLY9MwdDhDqQVC5bXmyflleRh1+FNWvR3ntI97o8Iz2HMhvZQ8NsZsadMriKh2YaTkkzqFSbogXB5yG5OxkNxtdI+2IpEqbNWvt2luIOg/qb3tBQm/m1bpS9yL21RHcnRNyfl9Pc76o1iH8VStAW8lyRFttw+GMJwSZWhoY+wheLrvYKaj0o9nBAa1N0lcE40yM8fi9kMmhdicnACuMr2P9SlN9IjiwzOt62N1djZSeoSHGB5WMN9Agpb1tHbmR3VlmlxBIeHrnagPFSUuxVuIQ87DjDDFCtRRSU32Ze5OP
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(396003)(39860400002)(346002)(451199015)(46966006)(40470700004)(36840700001)(356005)(81166007)(86362001)(36860700001)(47076005)(186003)(70206006)(1076003)(16526019)(70586007)(83380400001)(336012)(426003)(82740400003)(7696005)(2906002)(6666004)(26005)(478600001)(110136005)(54906003)(2616005)(41300700001)(316002)(4326008)(6636002)(8676002)(8936002)(40460700003)(5660300002)(82310400005)(36756003)(40480700001)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 13:12:39.8087
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2c442d8-9759-4338-74ea-08da9c9c206a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6729
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Whether to turn CnQF on/off by default upon driver load would be decided
by a BIOS flag. Add a sysfs node to provide a way to the user whether to
use static slider or CnQF .

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/cnqf.c | 60 +++++++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/core.c |  6 +++
 drivers/platform/x86/amd/pmf/pmf.h  |  1 +
 3 files changed, 67 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/cnqf.c b/drivers/platform/x86/amd/pmf/cnqf.c
index ab002b15f59c..398c8955d718 100644
--- a/drivers/platform/x86/amd/pmf/cnqf.c
+++ b/drivers/platform/x86/amd/pmf/cnqf.c
@@ -301,6 +301,66 @@ static int amd_pmf_load_defaults_cnqf(struct amd_pmf_dev *dev)
 	return 0;
 }
 
+static ssize_t cnqf_enable_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t count)
+{
+	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
+	int mode, result, src;
+	bool input;
+
+	mode = amd_pmf_get_pprof_modes(pdev);
+	if (mode < 0)
+		return mode;
+
+	result = kstrtobool(buf, &input);
+	if (result)
+		return result;
+
+	src = amd_pmf_cnqf_get_power_source(pdev);
+	pdev->cnqf_enabled = input;
+
+	if (pdev->cnqf_enabled && pdev->current_profile == PLATFORM_PROFILE_BALANCED) {
+		amd_pmf_set_cnqf(pdev, src, config_store.current_mode, NULL);
+	} else {
+		if (is_apmf_func_supported(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR))
+			amd_pmf_update_slider(pdev, SLIDER_OP_SET, mode, NULL);
+	}
+
+	dev_dbg(pdev->dev, "Received CnQF %s\n", input ? "on" : "off");
+	return count;
+}
+
+static ssize_t cnqf_enable_show(struct device *dev,
+				struct device_attribute *attr,
+				char *buf)
+{
+	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%s\n", pdev->cnqf_enabled ? "on" : "off");
+}
+
+static DEVICE_ATTR_RW(cnqf_enable);
+
+static umode_t cnqf_feature_is_visible(struct kobject *kobj,
+				       struct attribute *attr, int n)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
+
+	return pdev->cnqf_supported ? attr->mode : 0;
+}
+
+static struct attribute *cnqf_feature_attrs[] = {
+	&dev_attr_cnqf_enable.attr,
+	NULL
+};
+
+const struct attribute_group cnqf_feature_attribute_group = {
+	.is_visible = cnqf_feature_is_visible,
+	.attrs = cnqf_feature_attrs,
+};
+
 void amd_pmf_deinit_cnqf(struct amd_pmf_dev *dev)
 {
 	cancel_delayed_work_sync(&dev->work_buffer);
diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 99be1e6d57d3..44fe30726b62 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -391,10 +391,16 @@ static int amd_pmf_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct attribute_group *amd_pmf_driver_groups[] = {
+	&cnqf_feature_attribute_group,
+	NULL,
+};
+
 static struct platform_driver amd_pmf_driver = {
 	.driver = {
 		.name = "amd-pmf",
 		.acpi_match_table = amd_pmf_acpi_ids,
+		.dev_groups = amd_pmf_driver_groups,
 	},
 	.probe = amd_pmf_probe,
 	.remove = amd_pmf_remove,
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 24dd6fbff24c..097f3f5d33a3 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -422,5 +422,6 @@ int apmf_get_dyn_slider_def_dc(struct amd_pmf_dev *pdev, struct apmf_dyn_slider_
 int amd_pmf_init_cnqf(struct amd_pmf_dev *dev);
 void amd_pmf_deinit_cnqf(struct amd_pmf_dev *dev);
 int amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_lapsed_ms);
+extern const struct attribute_group cnqf_feature_attribute_group;
 
 #endif /* PMF_H */
-- 
2.25.1


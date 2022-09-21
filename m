Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5A7DC32771
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Sep 2022 10:26:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229971AbiIUKZ7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 21 Sep 2022 06:25:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229821AbiIUKZp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Sep 2022 06:25:45 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B3648A1D2
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Sep 2022 03:25:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wq7ZGkUGk26re7eDWDEm55KTjgigq/pdsR2+7dOPaiFm1Snb8fcO5/7NSjDHjM/sG5y7dOZwTXlqFg6PtGY+LND35YV47oFHsd4aqz/lXqF0x4yhpQ9YrImntrMGjZBvsZX0KgyKRJx8CuR1Ima+j3lYKZ4wm+Ls7ZU6pMVDi2OJCt7htwDvctCMFN5nfZP3EDgrJ++HmTXEB+kljwwpdp1Z0SZhdYK/ZbCxcI9Qd1n/McOZXuZMKpawFD1LSlPMzw2uj9NVcRhc4GhrxWYpfJZx83tsIvtJTadZZqRSNwXRWdDzYYprVS7WqG/ScevvsH3CEQ63OHmEl8khlhelmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nh+NQtk+gDHCuKxEMya67FELogBy2NUNaSKb7+eT1aE=;
 b=FvNDXK+YX3I1m+Edg6sHIbA7j62QfRHrq1odRqet5MS/ayLHN1S0mSuny9a666FfD1f4t8ec1tlSD1QmSj10ZeWwxIqqIrK0wycP7Jtz2GhdaFTvaqZddqhaOpEFPOC55btt3PdGM2bVxBJvHzt8/x1gSDHKNVkfa5zNAfoOiGsBOqJGjxCexNaODarlPYq/3x7Bv3B7vvS8UsbZg4mz+pwOyI/rD9jUOp+xnew98yS76H/VBYcksqbNzsAp9gSP0eD6KpYg+x36l7EH4e26FC7pteSUyx+WuVRq+LdcPn3/crWketoGkCUsqFjw0RhxDfg5uxEj67wiWds0/QyS1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nh+NQtk+gDHCuKxEMya67FELogBy2NUNaSKb7+eT1aE=;
 b=TXCDhRdMUMNt1TMX8LR48JkMoo7oiDVWl1mxMEId/1KIjal95JINuUWVySq1h8Dqm3FT+GSY5vUmW4xLfl3PAwrjwewBSj3JlWHkT+7gs8wlSWvLmc7cQEp6bgTy4/X20/ueAomN7wAgR++Mrg0P/fVspIjgRJMA2c2gCr8cDs4=
Received: from BN9PR03CA0642.namprd03.prod.outlook.com (2603:10b6:408:13b::17)
 by SA0PR12MB4591.namprd12.prod.outlook.com (2603:10b6:806:9d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.17; Wed, 21 Sep
 2022 10:25:38 +0000
Received: from BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13b:cafe::43) by BN9PR03CA0642.outlook.office365.com
 (2603:10b6:408:13b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.17 via Frontend
 Transport; Wed, 21 Sep 2022 10:25:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT067.mail.protection.outlook.com (10.13.177.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Wed, 21 Sep 2022 10:25:37 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 21 Sep
 2022 05:25:35 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>,
        <mario.limonciello@amd.com>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        <bnocera@redhat.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 2/3] platform/x86/amd/pmf: Add sysfs to toggle CnQF
Date:   Wed, 21 Sep 2022 15:54:54 +0530
Message-ID: <20220921102455.1792336-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220921102455.1792336-1-Shyam-sundar.S-k@amd.com>
References: <20220921102455.1792336-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT067:EE_|SA0PR12MB4591:EE_
X-MS-Office365-Filtering-Correlation-Id: a71246e0-a26c-4c19-7592-08da9bbba077
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9baa229jF9licKG3x+biXLJDaxRDAtQtl2KbXobMH6j6OLPUOpPUBY0a9YGo5zRIh24x/2r74724kVlAi6y/w7SrOj1BhVqez0QBidy5HCeLXFnMZQOVTOiToJkz3Nluvry41GNSZcJ71t+ntYnniTKGNt9MAGQ/xjHf3QfytnwrGm4hKuJgumu9ScJneyANVtezS/r4NxH2fQ5xagNG2UE8iFW5XjgogoY5o/xLApYEiz00CTPDW0BJGuYv4btXB36EJEcs9YnSAlRbCTzah3byaHuuG63/i9vt6To/kbKXxFTT5FyI2I4JyJdDsIyUNKkRCXSSz3E9EhLH2yuUat7k5lIqVWt5bar9kcge3xdeggjbdjZeyXvfqlW8Li8mrEY+ToIBiUs3WXnSauy0Ju45NTJ2Ko2c7xXq33H1pqgKv6YeAPLilVTNSrddH/O+/d6Umz6IS6Bh/A5cni8arT79TpbDXqM42IUH+BGj+D3YXRlEdy4fS1eKFhOFeHpZQ8eEu5GZZPG+NuoPA/7AwmiTt4V1N5zzeg+hSbZ3+jvz7OGh8iS5xAmU6ZrY5FOEJspT2/IJot77M3JT/7huZeB8EOiy/ppbXM+/Wbg/lW8n2E+4eo2iKJ62wbSnysOmaW50ofcTItqp6pDnH770Q7enPHHytLPJq2d/wBt2/TzUvD6OSbveAp3B3H1SEzSqmyLY2RyWNwnCluz9hrChugfDGJhoTe1+oAesMnnluYJeAGlfIdS9BUzyvmAg9EwzXYBW2YYN6vLCobctMHbHydoEPxpbw6NRcHjvHHFLv3xXDxyT7HCxEs2+zYyXi9E6
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(396003)(376002)(136003)(451199015)(40470700004)(36840700001)(46966006)(16526019)(336012)(5660300002)(186003)(2906002)(2616005)(1076003)(40480700001)(36756003)(82310400005)(356005)(82740400003)(81166007)(47076005)(83380400001)(36860700001)(426003)(86362001)(54906003)(110136005)(6636002)(316002)(40460700003)(478600001)(41300700001)(6666004)(8676002)(4326008)(26005)(70206006)(70586007)(7696005)(8936002)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 10:25:37.9094
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a71246e0-a26c-4c19-7592-08da9bbba077
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4591
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Whether to turn CnQF on/off by default upon driver load would be decided
by a BIOS flag. Add a sysfs node to provide a way to the user whether to
use static slider or CnQF .

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/cnqf.c | 62 +++++++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/core.c |  6 +++
 drivers/platform/x86/amd/pmf/pmf.h  |  1 +
 3 files changed, 69 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/cnqf.c b/drivers/platform/x86/amd/pmf/cnqf.c
index fa994800692a..34021bb22064 100644
--- a/drivers/platform/x86/amd/pmf/cnqf.c
+++ b/drivers/platform/x86/amd/pmf/cnqf.c
@@ -298,6 +298,68 @@ static int amd_pmf_load_defaults_cnqf(struct amd_pmf_dev *dev)
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
+	src = amd_pmf_get_power_source();
+	pdev->cnqf_enabled = input;
+
+	if (pdev->cnqf_enabled && pdev->current_profile == PLATFORM_PROFILE_BALANCED) {
+		amd_pmf_set_cnqf(pdev, src, config_store.current_mode, NULL);
+	} else {
+		if (is_apmf_func_supported(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR)) {
+			amd_pmf_init_sps(pdev);
+			amd_pmf_update_slider(pdev, SLIDER_OP_SET, mode, NULL);
+		}
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


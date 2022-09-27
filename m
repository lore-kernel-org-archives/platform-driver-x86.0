Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0450C6FA83
	for <platform-driver-x86@archiver.kernel.org>; Tue, 27 Sep 2022 13:56:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232147AbiI0N4n (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 27 Sep 2022 09:56:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231906AbiI0N4l (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 27 Sep 2022 09:56:41 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2076.outbound.protection.outlook.com [40.107.244.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B52F13942B
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Sep 2022 06:56:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aVpF9lD5ibfVUWVY4H5d1HrezjolSWnAH4TwMtqIEAATrAMjQvbv038UFEDTFY31tRr/Ropwg1Ncrk57EAvhP3agrOnWKLrPFn8VlmJ5q+imLKtYe4enCWmKJAc4vHbtKiwjurRpd/FWH3Y2Go9KqFUrUxIizrHC10mBRtVdGYlQUiC64Elkdcj+Rd3YJhQuRlFXCVkaHs1DMAqdOFSBrQ9fN1tQ/fYYiDPPF+NJf/94/xj9edK+ljtJQJO3shHdUjsaOe2PgXhKAS9k0BPP8cexO+BoKtrnPbcT+A9x1t9ZNIB2V7fExF4AHgTBUIYJajpDW0rn91PbIbrm3IH/WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ozY/egBsu3+3rSH5FN0VMfSSy2ctcoE6FHUjGURi4Ns=;
 b=bbpwObPP6r6W8CcrEA1CS388z34xBu92n3wkUNHhqAy1khtDJVIVh0mqS1IPI2+RaoquCI+sOZDtB8AR5X1KHRMg/OH3NZBR3WLJynYtOCPDRGLsxZUKDf7Z3Fftyh044jjoeKfP/yoyEzsl28Po9p6UlFQjn3CI5arQrK1eT/SwFApbD15SVyMOP8gs4FPhjtBoYYHM662fmIhsbs9x+duCQlaiTIyvDjQn9ky+QpUJrVzDdGiKoeDl312v2tiXaC16XFqHxKajgHcssTSyLBUfyo5ZbrtogXgYzTa4w4C5iSFM7+qE4oAUS/QqlXVvieLT85DgNcQdB96NbY1eIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ozY/egBsu3+3rSH5FN0VMfSSy2ctcoE6FHUjGURi4Ns=;
 b=Wof/WuJiHqvmK/sGtxFgomRml1JKHyuaKYTmewaB2RKqw8dQO/bntOupe4nQ+pcBidgwKx0sguNp4cYGyXdo/nw5TJeDiigc/OdWNYN/qCeTn7iXZX1eHBfZ4z+XUimY5EXlAQB9sZ9U2go0cU+LLGHuBSeQ3bxsGm1aTz/UufQ=
Received: from MW4PR04CA0135.namprd04.prod.outlook.com (2603:10b6:303:84::20)
 by BL1PR12MB5363.namprd12.prod.outlook.com (2603:10b6:208:317::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.15; Tue, 27 Sep
 2022 13:56:37 +0000
Received: from CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:84:cafe::18) by MW4PR04CA0135.outlook.office365.com
 (2603:10b6:303:84::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26 via Frontend
 Transport; Tue, 27 Sep 2022 13:56:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT005.mail.protection.outlook.com (10.13.174.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Tue, 27 Sep 2022 13:56:37 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 27 Sep
 2022 08:56:33 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>,
        <mario.limonciello@amd.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        <Dell.Client.Kernel@dell.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH] platform/x86/intel/wmi: thunderbolt: use dev_groups callback
Date:   Tue, 27 Sep 2022 19:26:12 +0530
Message-ID: <20220927135612.1602491-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT005:EE_|BL1PR12MB5363:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fa4159c-21b2-4a32-e634-08daa090186d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wo54125/ybCxH20yojpi1Fvn1D9BVgXdjT+shtqV8/iGlLj4ycqwPjVI9uGWNH53S3N8NLZwxxSfb2OBotxHJyM7gvESqNb4esg8+yWtPLP8ojG9oWqCrQZdt+z52asoRXlWGblDy8QPxP7DymxpsAES8rBsTAfJOgeUI7OCruiK7bx3tU8SQ+UX8XIMcQJIKG4RiMxSQJ4gJFP9sfWLp8D/gzWM+tkiAxRK7Z5QJ21sHyvfl8y3M3bOUOIEPYfxNZTsOxsb29qI1dAFwquL8o4JNIRGIvoJLEr8V+jJlP8qxd/SjQ2X8IL19HRYK/tSSvvGFtA3k9oxp9obyRV8KTpG5hiLlPGCK02dcxr3hf7/Lx78GVXkw1vEbS0EK91/n7idD/MbQcrkYkUz/VzH66i/ILOQ7xQGtMr3HDCrKs4jRz5vyE3tt87JEzTkWpZrqBHktBoB8M9uJhHYPLI+qSWx8OdDDRfvb6Nh1JsKNCRYkkuA8ahs2Hj8sXpIr/Woaah24ZqsiqkTsqYQ8HMbLA/kXTw6+/LH2KH/tbfGdMbP3tGoPprrZlrzNInaBfBGl2vJHhnOXCk2klyOIXIo7PXHX0Pxohkm46OJ7Jxpcoy1ztjYaFqzyWKyHRyB2i7lIrRcEQ5IBH2LLMqwqfn2zEQiTl6es3slpwfoCt5iLWHRSsqI8nzYOiREjjK5ykiIKRcmC4Dxx1x3l7hWqDZ4P6K8yj3KTqDvpNY84FmBrxZAEPH+ozJYjhbbcoqgFej86O8dHpMGpiFLXE+Irvd1ERO4TlcdVnQtc8EarjOSOnBigNVGwkOf6ZdueNq+fMN+g8b5/kSpGtYHLgYioQo7KQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(346002)(396003)(376002)(451199015)(46966006)(40470700004)(36840700001)(2616005)(26005)(478600001)(36756003)(2906002)(6636002)(316002)(8936002)(54906003)(110136005)(86362001)(4326008)(8676002)(41300700001)(70586007)(6666004)(7696005)(70206006)(82740400003)(82310400005)(5660300002)(356005)(40460700003)(81166007)(36860700001)(426003)(47076005)(40480700001)(1076003)(186003)(16526019)(336012)(83380400001)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 13:56:37.0218
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa4159c-21b2-4a32-e634-08daa090186d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5363
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

use .dev_groups callback instead of manual sysfs registration.
Remove .probe and .remove callbacks as they become dummy after
using .dev_groups.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/intel/wmi/thunderbolt.c | 24 ++------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/drivers/platform/x86/intel/wmi/thunderbolt.c b/drivers/platform/x86/intel/wmi/thunderbolt.c
index 4ae87060d18b..fc333ff82d1e 100644
--- a/drivers/platform/x86/intel/wmi/thunderbolt.c
+++ b/drivers/platform/x86/intel/wmi/thunderbolt.c
@@ -51,26 +51,7 @@ static struct attribute *tbt_attrs[] = {
 	&dev_attr_force_power.attr,
 	NULL
 };
-
-static const struct attribute_group tbt_attribute_group = {
-	.attrs = tbt_attrs,
-};
-
-static int intel_wmi_thunderbolt_probe(struct wmi_device *wdev,
-				       const void *context)
-{
-	int ret;
-
-	ret = sysfs_create_group(&wdev->dev.kobj, &tbt_attribute_group);
-	kobject_uevent(&wdev->dev.kobj, KOBJ_CHANGE);
-	return ret;
-}
-
-static void intel_wmi_thunderbolt_remove(struct wmi_device *wdev)
-{
-	sysfs_remove_group(&wdev->dev.kobj, &tbt_attribute_group);
-	kobject_uevent(&wdev->dev.kobj, KOBJ_CHANGE);
-}
+ATTRIBUTE_GROUPS(tbt);
 
 static const struct wmi_device_id intel_wmi_thunderbolt_id_table[] = {
 	{ .guid_string = INTEL_WMI_THUNDERBOLT_GUID },
@@ -80,9 +61,8 @@ static const struct wmi_device_id intel_wmi_thunderbolt_id_table[] = {
 static struct wmi_driver intel_wmi_thunderbolt_driver = {
 	.driver = {
 		.name = "intel-wmi-thunderbolt",
+		.dev_groups = tbt_groups,
 	},
-	.probe = intel_wmi_thunderbolt_probe,
-	.remove = intel_wmi_thunderbolt_remove,
 	.id_table = intel_wmi_thunderbolt_id_table,
 };
 
-- 
2.25.1


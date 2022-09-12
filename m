Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D027EECAAD5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 12 Sep 2022 09:12:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbiILJMy (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 12 Sep 2022 05:12:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbiILJMx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Sep 2022 05:12:53 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB2431B7A8
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Sep 2022 02:12:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XulPa9xK02A98xwWu7m6mTjctHwgIJY4Z2RoaiY2kzFYwJRzSVfm2iuVbbOb9JWddNSroRsS62diH8t0L0nf4tXvTeT3THGKgzpdVF+CgjvELgfUb/uKfHQJCKajDxfIR0IBnmRXaimv34JgSOlxHBQK+YrOmMx1zMrt48w9RCn1HFs1LFzFf8/aSyDvRva6Wohl5sWSmWAV5+azsgi3X8rH8q1qB9u3TU4RPVzqQP+crFgJADxt8nYbwjK7ZEx4JE8ezuwimrMnWpGJiDjBT5ovN+En+++mB6SRW0Bta3eVolsyD4o60Vjhh5qHYvxdBUUkBpmKd8No5lOafmVJgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MazUswK4Ldcbh3hI/a2thRaSXUj8h6q8QzEgFnTn5TE=;
 b=jUk7nxUqhoqvbradNRS97q9lwBa5fS8W+Nb6yA/stI1dM66lIkcfop0EHmMv7AaP/NhNstTtoLfzCSzkTZPqFbQYHgtCcfTvwnJUXSnzf9DAekMMpqKiwk5AcyuBrBPHJb6LLsNv6jcqlQfDGdbWGCaylBRM/kVVSghCBrcZMnp7Y/nYxmD7x+d4LQwc9cvW7Nb8fuR7UnJtoNjVLxiJOCskukGW7X38Dcb0HfnJ+yjj0A+SweOoKXa+g3N4XxaftjGb/NHk6pGuDiSWdZ7GWXDvFSvBQiQeiLAA1rBvG3LJ9kH19WRZAQoxnns7vowJKvb5n24EB9WFlgxVMYkXjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MazUswK4Ldcbh3hI/a2thRaSXUj8h6q8QzEgFnTn5TE=;
 b=blzAQ2GsAq2i2Lvu+56N6xR5M6wxxV3TgkOGwCCLodkVccPGIwtjYC2Jp63ldfgUHa7lFEr0l0m1gM5EFeiLZSq4tNO9B0lZ51h5iBoyanBwlLkW2PFNvDAQB5QhJSSXaf5z9WYR83OFA5fh9B2Iym6uXjCn9rId6uis82IyFRs=
Received: from BN9PR03CA0933.namprd03.prod.outlook.com (2603:10b6:408:108::8)
 by BL3PR12MB6619.namprd12.prod.outlook.com (2603:10b6:208:38e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Mon, 12 Sep
 2022 09:12:49 +0000
Received: from BN8NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:108:cafe::74) by BN9PR03CA0933.outlook.office365.com
 (2603:10b6:408:108::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22 via Frontend
 Transport; Mon, 12 Sep 2022 09:12:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT060.mail.protection.outlook.com (10.13.177.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Mon, 12 Sep 2022 09:12:49 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 12 Sep
 2022 04:12:37 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        <bnocera@redhat.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 2/4] platform/x86/amd/pmf: Add sysfs to toggle CnQF
Date:   Mon, 12 Sep 2022 14:36:39 +0530
Message-ID: <20220912090641.111658-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220912090641.111658-1-Shyam-sundar.S-k@amd.com>
References: <20220912090641.111658-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT060:EE_|BL3PR12MB6619:EE_
X-MS-Office365-Filtering-Correlation-Id: 605fb27a-e9be-4992-a418-08da949ef711
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tE2aCVMXXNpIl0Tr8WsX+opikvZ+7nJE0cRY7rmDqsYmH68KTCMFv0AkDIZImdFX6SL47WwDJPqWZBx3ibvJ5DJ+kd++AsKTzUq3ERNZmFEP8LVXi9XviIR3Eyi0cUDrq5AzipAPC/NZDR5bUL7kVAR3HHHjhUeHIyeUlYKrWwkvAwyrrY/Qw4/OHIZ4R7XClc/aHJbcWH89VztP1+CVIelj/1hM8MPbgZ3CmVPMa3n5yXnoURFORQmwpbfG0NU7yrw+KIOEXsN8eimx5o323FrYTeoqzIReBCxgnvjUnqT0+D34sUKHxqq8cUtWlCj9F1wFFnWSwheQ7XiRHtLUmQ66osNkvEj43y5gg3a5wlOtEYj6MYJ0GCwwWNGaE4moqBGXvPCkW41cGcMj2D92HP9fOR4bK8i0g1rbgcnrCZElDunL4p7ss1vZ/RxLbE+OA0eLB73ngvuYSZCDV/GzS34rs4mMsvlKPUCYP2KTW5FrkrGO2x9K6kiDm0QfQQ8R5I7Rd0l1XxKvv+s3cBlvXl+ETC0Y27wblPJwvGobdsII90yOaS/rfwvMuuLASngBUJDArbAmV/viTHVALXAz2xtzY/JkF2cxuWphy341i5iURwB2vTQ4101q3hkfW0GlFS7gcW5rHCGpUUV6qOzTx46+bcwqFE0L3hNbPBGr2SSfmAKmeKgcG2diyAh7SkEwS0lU/UruhET4tb67XMNowShkUJJCN6fXoD4ZRG5h4jKvKZ+qa4i+7TTCh2F92BHGhUVvOtk/+hkxNzsJVsvY1H9P6gyscidfEZ5WOIZsrZ0=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(39860400002)(376002)(396003)(46966006)(40470700004)(36840700001)(82310400005)(54906003)(110136005)(36860700001)(86362001)(83380400001)(316002)(336012)(356005)(426003)(16526019)(186003)(2616005)(478600001)(1076003)(82740400003)(81166007)(5660300002)(47076005)(26005)(2906002)(40480700001)(40460700003)(8936002)(41300700001)(8676002)(70206006)(4326008)(70586007)(7696005)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 09:12:49.6593
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 605fb27a-e9be-4992-a418-08da949ef711
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6619
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Whether to turn CnQF on/off by default upon driver load would be decided
by a BIOS flag. Add a sysfs node to provide a way to the user whether to
use static slider or CnQF .

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/cnqf.c | 57 +++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/cnqf.c b/drivers/platform/x86/amd/pmf/cnqf.c
index aebcef778a0b..8d0c1eff1659 100644
--- a/drivers/platform/x86/amd/pmf/cnqf.c
+++ b/drivers/platform/x86/amd/pmf/cnqf.c
@@ -294,9 +294,64 @@ void amd_pmf_load_defaults_cnqf(struct amd_pmf_dev *dev)
 		config_store.trans_prio[i] = i;
 }
 
+static ssize_t feat_store(struct device *dev,
+			  struct device_attribute *attr,
+			  const char *buf, size_t count)
+{
+	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
+	int mode = amd_pmf_get_pprof_modes(pdev);
+	int result, src;
+	bool input;
+
+	result = kstrtobool(buf, &input);
+	if (result)
+		return result;
+
+	src = amd_pmf_get_power_source();
+	pdev->cnqf_enabled = input;
+
+	if (mode < 0)
+		return mode;
+
+	if (pdev->cnqf_enabled) {
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
+static ssize_t feat_show(struct device *dev,
+			 struct device_attribute *attr,
+			 char *buf)
+{
+	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%s\n", pdev->cnqf_enabled ? "on" : "off");
+}
+
+static DEVICE_ATTR_RW(feat);
+
+static struct attribute *cnqf_feature_attrs[] = {
+	&dev_attr_feat.attr,
+	NULL
+};
+
+static const struct attribute_group cnqf_feature_attribute_group = {
+	.attrs = cnqf_feature_attrs,
+	.name = "cnqf"
+};
+
 void amd_pmf_deinit_cnqf(struct amd_pmf_dev *dev)
 {
 	cancel_delayed_work_sync(&dev->work_buffer);
+	sysfs_remove_group(&dev->dev->kobj, &cnqf_feature_attribute_group);
+	kobject_uevent(&dev->dev->kobj, KOBJ_CHANGE);
 }
 
 void amd_pmf_init_cnqf(struct amd_pmf_dev *dev)
@@ -316,4 +371,6 @@ void amd_pmf_init_cnqf(struct amd_pmf_dev *dev)
 	/* update the thermal for CnQF */
 	src = amd_pmf_get_power_source();
 	amd_pmf_set_cnqf(dev, src, config_store.current_mode, NULL);
+	ret = sysfs_create_group(&dev->dev->kobj, &cnqf_feature_attribute_group);
+	kobject_uevent(&dev->dev->kobj, KOBJ_CHANGE);
 }
-- 
2.25.1


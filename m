Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 545DFC32792
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 Aug 2022 13:31:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242135AbiHWNbv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 23 Aug 2022 09:31:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242672AbiHWNao (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 Aug 2022 09:30:44 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2041.outbound.protection.outlook.com [40.107.243.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C63F014E13C
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Aug 2022 03:31:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L4RWFRQ/P9Kck029vNo6nbKaGNMGhAWe6zHw+s3P80z8nrF8Wa99CysecYE1Zd0aI0SymRjRsORLReNMDQVzbG5ys4famt0WxQIT7HrzOqnOBig+KQbKVm1muIp/yZGaYyXJIN1AHr8OATQALFPCmm8j8v45ViYTeEwE7wD4CgVG9I7H1TXODj3WDVO75zs21FcaZRhis+bS4ZhSIj0YGZjkrqMEBoqthPNJfPLAGlViKvD1SkD/sXGpPAXbxFNwNZIgKLwBb18z1rTn+GElDnR23Af3UH5t1oV1nwPzHSae/vHWhbPzhjwlrmTJvTMNsir7XmuewnONF3mfl8yEvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zHlS23n24mUhQg0DzLIRpEJugJldZErPM4tqWQyfn7E=;
 b=PLbpQSeJY6JKk4+t+JUcjLb1wEWvEdm4EoIgnBl6y7bTjmRMaAZ0NyumsCkTNcekxhajDYZRIv1dGvhEsHgcycgRC93cHj99thl7/e12qPXbZMP9RYq0bghC2gJEvinmzwLEVKnE6sKyFZyFQA8R2kFeuMZ2a9tWCnllNYZNx2E4yyB7b0bZLL73xo3OCU4YAKzPc1NhpzOt3S4P+le03qEI6B1kg/+1APi3asygW1vp9FiOXZ2GRDLRGpq4YvHSWsfq39HLTwnTP7RvfwpBOgQYaM9JSEjLTVUc+XDYHUlRoVYpKGwN88AWIKtMqILPl/cPsLO4AAnujgSAdz+Rvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zHlS23n24mUhQg0DzLIRpEJugJldZErPM4tqWQyfn7E=;
 b=N1SLXO4s9X/rc3J0Zd92DfqgwBlpU9L1nuGUDEPc7pHlk6EmRDskGlvNRCnTdHO0aNal0Bd7qHFjl76WSRUoY44B2wEWrbgr12pj51CTtnTuRLlMOYPqRfoYyGC0/SY0WcHQaEqNYhZnPPvwmTfSzqCUSR9KGVwFncMKprHXzFI=
Received: from DS7PR03CA0090.namprd03.prod.outlook.com (2603:10b6:5:3bb::35)
 by BL1PR12MB5062.namprd12.prod.outlook.com (2603:10b6:208:313::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Tue, 23 Aug
 2022 10:29:45 +0000
Received: from DM6NAM11FT092.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3bb:cafe::28) by DS7PR03CA0090.outlook.office365.com
 (2603:10b6:5:3bb::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.20 via Frontend
 Transport; Tue, 23 Aug 2022 10:29:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT092.mail.protection.outlook.com (10.13.173.44) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5546.7 via Frontend Transport; Tue, 23 Aug 2022 10:29:45 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 23 Aug
 2022 05:29:43 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 2/4] platform/x86/amd/pmf: Add sysfs to toggle CnQF
Date:   Tue, 23 Aug 2022 15:59:11 +0530
Message-ID: <20220823102913.4181217-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220823102913.4181217-1-Shyam-sundar.S-k@amd.com>
References: <20220823102913.4181217-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35900f47-e9e2-4f5e-a203-08da84f26618
X-MS-TrafficTypeDiagnostic: BL1PR12MB5062:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LfmRN0WJDxhdLqxS0xwyys9GAclhUrkPqh0kIG1n0SY8pr9joom10TeUASqD4DuSRX68CGtj/GOSESt4WaSsS9NFDQ9Z0M1Sa9xGkvc8/zlReTa3dSoSOm5JAExMpBdZuJa+ETXJcY4SptCQIXl8eq+dVKetps6mdmkGQecRp90xdVtHE1bNZ5kBr0Ia8hThquM/FUAEfwPhnSgbcSfo7E2Wm8Cx0O1n//yKNifIEZDAjJpgRw6S9Sf86eAjjBRNTX9f4J5fBbfWxJI1v07ZIUQA1wt9hbqmNRPEFQ8t6cLOiDVkildRjZ6oG6hVk1yd3QqpHG262sIhdZt+ovWE/vTyvZk61ffKxmTPpV0f3jhElTQPI0xAecKKwlT+9doPmcGza8tNCy65EzA2y+xGJWftNVYucYwskD4J82ApUfrN+TZjmbGPo/akVWg8pUZMMZ6AbdYh0hWIRMR12+lmtc5j3W9XEPY+jm33SMuDE/YwzFdBY7dRA1HxbcRWIfxoYGy5w5B4Q9wEtwxuy8/dtp/pZshIOdlYRZmHdJ59XDY4vVZHg4RepBUUNqP3E2L3qFWyKrYNyWndCljZNXenwFha7DqGh9+ldLGxu8L1guwCqHwJpzf8beY1+F65Y4q5A4ihYbwtHxLYc5uZHE0OVuVLMZlIf8b9g31txYDjzI1v5LCgt3xjHiVAnKQc821YO3Fxy1i691C+QrSV6Zzlsg45ITE7NlVSzmHhTUVce0fLmuP7Pfdv5bYd+POFi6KFvm2zwGA88WcosMh38j1PBTY0JfQ8/XZWF2CUUEGklvk=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(396003)(346002)(136003)(40470700004)(46966006)(36840700001)(426003)(47076005)(16526019)(2616005)(336012)(1076003)(186003)(86362001)(82740400003)(356005)(81166007)(40460700003)(83380400001)(36860700001)(8936002)(5660300002)(4326008)(8676002)(70206006)(70586007)(40480700001)(36756003)(82310400005)(2906002)(478600001)(7696005)(41300700001)(6666004)(110136005)(54906003)(316002)(26005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 10:29:45.5251
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35900f47-e9e2-4f5e-a203-08da84f26618
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT092.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5062
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Whether to turn CnQF on/off by default upon driver load would be decided
by a BIOS flag. Add a sysfs node to provide a way to the user whether to
use static slider or CnQF .

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/cnqf.c | 60 +++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/cnqf.c b/drivers/platform/x86/amd/pmf/cnqf.c
index b8abe0f4447a..1a8ea6eb6c2f 100644
--- a/drivers/platform/x86/amd/pmf/cnqf.c
+++ b/drivers/platform/x86/amd/pmf/cnqf.c
@@ -282,9 +282,67 @@ void amd_pmf_load_defaults_cnqf(struct amd_pmf_dev *dev)
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
+		if (is_apmf_func_supported(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR))
+			amd_pmf_deinit_sps(pdev);
+
+		amd_pmf_handle_cnqf(pdev, src, config_store.current_mode, NULL);
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
@@ -311,4 +369,6 @@ void amd_pmf_init_cnqf(struct amd_pmf_dev *dev)
 	/* update the thermal for CnQF */
 	src = amd_pmf_get_power_source();
 	amd_pmf_handle_cnqf(dev, src, config_store.current_mode, NULL);
+	ret = sysfs_create_group(&dev->dev->kobj, &cnqf_feature_attribute_group);
+	kobject_uevent(&dev->dev->kobj, KOBJ_CHANGE);
 }
-- 
2.25.1


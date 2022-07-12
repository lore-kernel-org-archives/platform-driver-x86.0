Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 306C1C43334
	for <platform-driver-x86@archiver.kernel.org>; Tue, 12 Jul 2022 15:04:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233098AbiGLPER (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 12 Jul 2022 11:04:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233905AbiGLPDF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 12 Jul 2022 11:03:05 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2052.outbound.protection.outlook.com [40.107.223.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ECE2C164C
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Jul 2022 08:00:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iH3l2xYOe+zI8rOpvn1JX9Rhj4tg6vk5ydXfuHpR9wx3l3EbbYdOmU0Vt6UnK0D9JYIFT9ILnOx7c5jf4HHrtoHdj2oj39cbnNdJA8m9Mrn6GvahnFKtGGa5j7ZGSdKK85TliM2oTKuJpBwqtvbQszcFRd1Dc4GmmlKmY3nKmcjvWuQNUols8yp0PSSJ9VgCqWR7gO3bISb13bzZBZAr4WnQVM3eZEpo4ApyzrlJPCZJHCy7VMNW4jJUlRT28ywx3L0/RCePVMnKZq6ufF3vekOc0NZ7zsYpuv2GGmvuY3OFWI19sUKQpXFOQUO05yWi66SqK0b9BezbP8LYuiRzUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sq5UcZ0V9f/Ug+AH/PffreM0cnu2SjxGs/p67ztoarI=;
 b=NE1Z8Gm1ykd6JTQatf8lhtqIKHCDfkAmwH0xP6VOsQND9csBMdXDriUnPdKXkHGslAUQxRdXw7LJ51cGdT8AfxmsyLQjhgKrmvafCq53am1qxMzQQpe0hjlPS6SEKKmXpSTc0KApN/hGfNyMpgo1CO/kzPLFdoMrPQveQb3peobZrA0odeNj2pE/oTo5p7VTNVbJcjA9jILszwgUUlH5cyFFXHtNxYpghdSl/N0hUS3dwPCZ7gOdcZfk22qVoPIBvEPT1FiJL7GnZwhJPACHL4agBcg8Sipc66F0E74uB2a+BF3I1Jrpu9oSB7ESgHgBRpdkRrx1xw6sihlcniuswA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sq5UcZ0V9f/Ug+AH/PffreM0cnu2SjxGs/p67ztoarI=;
 b=JYaBIqvouF055lYgkEv5NVMKciHg2ImtA82YBfA+w9DTVnetouZfM6HhyKEEZ027IdHtEYRP90jymn91Q6Pw1LLpo5TGAwsSj1VDPe/JUFe2+/b7fzZbvF/oCyf3KjXEzJXKQJfYK2ZJ4B1gAEL++Y/XmUBsBBahwwQlPVsGIj8=
Received: from BN0PR04CA0040.namprd04.prod.outlook.com (2603:10b6:408:e8::15)
 by MN2PR12MB4437.namprd12.prod.outlook.com (2603:10b6:208:26f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Tue, 12 Jul
 2022 14:59:50 +0000
Received: from BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::65) by BN0PR04CA0040.outlook.office365.com
 (2603:10b6:408:e8::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.17 via Frontend
 Transport; Tue, 12 Jul 2022 14:59:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT032.mail.protection.outlook.com (10.13.177.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Tue, 12 Jul 2022 14:59:49 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 12 Jul
 2022 09:59:47 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v1 10/15] platform/x86/amd/pmf: Add sysfs to toggle CnQF
Date:   Tue, 12 Jul 2022 20:28:42 +0530
Message-ID: <20220712145847.3438544-11-Shyam-sundar.S-k@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: d1204096-2653-4df1-5925-08da64172b5b
X-MS-TrafficTypeDiagnostic: MN2PR12MB4437:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6BkgZBYdo5lxqTjZ+MKhWN58CbMFGW7By/XK2b+SRJpORqzvRmZfHv08F5bROQpZorNpcV8u59iMhDHWScxAgabMpDHMNdj87RNZ6j5ZhN7aTaaLJexF/Kj1TZ2Og+fyvMGKd/wIKT0pQYSlPgMX8nojiv1JebFE6htUv2g6+p4VxLzKmG36R1AmiCHUJEsBqRmAZosrDOoE/nsvZ/38P766SM8NptuXbXRWohVtWf6Jx0ya1PazzEgrCJqN+MnPRJAAZM6RoePMO82sqnzRIT6k27353ek+UsaSyXf96feL9l/spJI4yXOwNzPYtyPt/HMe4q9hWyWyu5iet46YP1sKKjy2MxfkYjuEBf1CdIP4sOzX0Dvul8uvYiV+SJ4YsKRl9gVaWWtj1iUKKHZ8aMxZljRUG5hnyQQfwxoP80ipRnglgMzbOuEUg2E+Xr5Au/DKBqMjcu6u7md/eRsX41gi9nmHraliiHXv129oFuPeiLyzuPsXQDFN1HQF/Kc4jMJZt8NWeJI47NpRqyt1F1Ra0/Rbok60cqkRU/TZtClhzVKq9Hmf6bDg08wr1uHfThOXUibnAk/mwmkNrvUbx8QP0g649QjaSxczQxBzgy6b1mj9r4MpLezDG98rXE/hvkq+MfZT5wMXBlJfOrAUk0Dqk3+XNcXKWQJMytgCIZqGStQCG9A9mhETeezj2m0T4KcqM5iQtzCi6Oc8f2J5PN0kUscERSbyIt+x0Mk1hjFhGO9KZ6NeFNqAMq9X/SM2eEgqjnIREhZWG7UGu1Wv6QqJVNLQZwINxsjqBxiiIgbffDiKsRF17vDAhChOywAZ6YKgsXEYI7NlWc5tBIPV5vP+MiDAz2dR6nPLf4Jn0SI=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(136003)(376002)(396003)(46966006)(36840700001)(40470700004)(8676002)(5660300002)(70206006)(16526019)(4326008)(70586007)(54906003)(82310400005)(40460700003)(336012)(186003)(110136005)(47076005)(426003)(8936002)(2616005)(36756003)(86362001)(478600001)(356005)(2906002)(7696005)(41300700001)(26005)(6666004)(82740400003)(1076003)(40480700001)(81166007)(316002)(36860700001)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 14:59:49.9997
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1204096-2653-4df1-5925-08da64172b5b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4437
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Whether to turn CnQF on/off by default upon driver load would be decided
by a BIOS flag. Add a sysfs node to provide a way to the user whether to
use static slider or CnQF .

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/cnqf.c | 52 +++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/cnqf.c b/drivers/platform/x86/amd/pmf/cnqf.c
index 8c6756faab25..2b03ae1ad37f 100644
--- a/drivers/platform/x86/amd/pmf/cnqf.c
+++ b/drivers/platform/x86/amd/pmf/cnqf.c
@@ -302,9 +302,59 @@ void amd_pmf_load_defaults_cnqf(struct amd_pmf_dev *dev)
 		config_store.trans_prio[i] = i;
 }
 
+static ssize_t feat_store(struct device *dev,
+				  struct device_attribute *attr,
+				  const char *buf, size_t count)
+{
+	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
+	int result, src;
+	bool enabled;
+	u8 mode;
+
+	result = kstrtobool(buf, &enabled);
+	if (result)
+		return result;
+
+	src = amd_pmf_get_power_source();
+	pdev->cnqf_feat = enabled;
+	if (pdev->cnqf_feat) {
+		amd_pmf_handle_cnqf(pdev, SLIDER_OP_SET, src, config_store.current_mode, NULL);
+	} else {
+		pdev->cnqf_running = false;
+		mode = amd_pmf_get_pprof_modes(pdev);
+		amd_pmf_update_slider(pdev, SLIDER_OP_SET, mode, NULL);
+	}
+
+	dev_dbg(pdev->dev, "Received CnQF %s\n", enabled ? "on" : "off");
+	return count;
+}
+
+static ssize_t feat_show(struct device *dev,
+				 struct device_attribute *attr,
+				 char *buf)
+{
+	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%s\n", pdev->cnqf_feat ? "on" : "off");
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
@@ -324,4 +374,6 @@ void amd_pmf_init_cnqf(struct amd_pmf_dev *dev)
 	/* update the thermal for CnQF */
 	src = amd_pmf_get_power_source();
 	amd_pmf_handle_cnqf(dev, SLIDER_OP_SET, src, config_store.current_mode, NULL);
+	ret = sysfs_create_group(&dev->dev->kobj, &cnqf_feature_attribute_group);
+	kobject_uevent(&dev->dev->kobj, KOBJ_CHANGE);
 }
-- 
2.25.1


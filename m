Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B400C04A68
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Jul 2022 18:21:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231745AbiG1SVJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Jul 2022 14:21:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230171AbiG1SVI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Jul 2022 14:21:08 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2044.outbound.protection.outlook.com [40.107.237.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD6C21C10C
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Jul 2022 11:21:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fZNeu+IyNa+OG7sK4Qdc+1LihlKlfB5mEhhUanP5cgje2QKrCMVx8AaUTK68P+ULCNjZBwo4ypi4aOWMSRyvydpgNdgAy+yIbcfE10nzJkHXAoat/eLXcR6KCpPuCHLwe9ye/a6UkPt6nXDZvWnhJCpqaybyCKPVThvSI53WxQQFnSBiEK9RpicZxSVG+8cXAM/mVCHA/iizvdJ77ZRxJLYr+KELvdrHV1xqy6nv7iJwiCbIkVH8EUKGxCzqYX7Hgtabgl7trFs4U9dBsg1KOQyj7qUK3UrSiOjxE2ea9PN/85Nvh9pbdS3j1diVJ4ZNMHhJf/sUsUimS4NpWGxV+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJuXSxuWgCXS+0PG5gSTHwqiuERkiwH0U/Ghu81Su6A=;
 b=kxyaMxABpnIdM7dXxiidFbHARqytms9NHnLuwxp0HqDjteXcXyoU7SV1q0IRcWY6Kp5f7nFXno87TFzEqS+vyl/FUqaDZLzLcC2sLZYPxfHf8PPoKUxiZBBaFWIfKduzLvDGpTqbV1WJlCKpQsBzxmaBDR2heTIWqKbdwt6wKOAGk8g4PWGP93vhfCWSFExWLIH2aXBDhtu/rbqAi5PCBU9m5Ew35sL874Qt6g80KtX1k5DZ11PCynOb+9RLTxtsAs9BJUt3X6k+ovZegQ96qEv7FmISo3fF669ilwbSK+9ziSZwR3cSYXwjZv6vp+BQRvMkXA1cNwtP/bx7gJwj5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJuXSxuWgCXS+0PG5gSTHwqiuERkiwH0U/Ghu81Su6A=;
 b=Vyq4nkDb2BkQySXNiXr5oAGV+gi79gD9B+ic/lmSTUtZD/4X7AIgZdXV8NGa6K+inuQcT5T2fJCSNw9OmB1sC/PkEf0Wj2F9oJTbl4ZCmJIzNqSzHB6cvEDql1xZSKeo7T7yITuys425pGLNCKJBSjCE/gkmz4pg15CmaLPmtlE=
Received: from BN9PR03CA0186.namprd03.prod.outlook.com (2603:10b6:408:f9::11)
 by BN7PR12MB2785.namprd12.prod.outlook.com (2603:10b6:408:2d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Thu, 28 Jul
 2022 18:21:04 +0000
Received: from BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f9:cafe::27) by BN9PR03CA0186.outlook.office365.com
 (2603:10b6:408:f9::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18 via Frontend
 Transport; Thu, 28 Jul 2022 18:21:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT046.mail.protection.outlook.com (10.13.177.127) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Thu, 28 Jul 2022 18:21:04 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 28 Jul
 2022 13:21:01 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 RESEND 05/11] platform/x86/amd/pmf: Add heartbeat signal support
Date:   Thu, 28 Jul 2022 23:50:22 +0530
Message-ID: <20220728182028.2082096-6-Shyam-sundar.S-k@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 53e83d9d-7e7b-496d-c050-08da70c5eebf
X-MS-TrafficTypeDiagnostic: BN7PR12MB2785:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OQMuAz4vdKsy28rzEdVHOkoMGEJff/3OuynFIFDhRh7/HLrTUYkpBoRdhEH15IK4Xf4WWSPnsLYJJrZDhXRBVA3/fUwzBQV5RSxXLzCvqMS2/pRV5jGf6vmzVch9V3G1RiUnE0X781G9oyoPfbqNcaoL3KlSsoTMNzB5+b3PhBzR989UDqbvrhbYx2ER091O78wKgB8XROxXDAisxOQkIFNgJGxyeev4zyGlhdvQfQbjMmFGaMMjwsMHLgbBvUyxA+tgi1f1j9Jb3Xy6hNyQbjHPNIWFniBjjZ4hP0YtX+QSXAQZGrHX5YEJc75dnH8esSac65s+Zp6Wn3aSBR+o+L6e8EDFodyNwWitvPHYHY3YZehre6WE7BFYRyQU0Q9aemA6OHqjPg+tse2qmrA6ZG/nqpVlEdir3ZYnb4o47bhdryv64lL3L50jtU8MywjRAlknDek+CQCDvTr+0fpRotztBITQWgAUvlwGMmDO4Tvp0L6AaAepbVoPM4jBvXXLWJJ+OqwOjni6wJB4GxUmT0EbWBCQRPyjkKXBkH84yT87jOWE12N5n/8c+ZINVVq34RXG0yTSnBl2kqjytMiS/pu+MyAUGl4vVBUp+cJe3iNhrAVTD8YYZrW5NfyL6EZt9pi/9v+gZJxn5mg6EVqcPRF3d/QMV4clFNEPBmiXpDWGN4gl5Q9wEfrBhIBqzaotO+4PzfJd1YnpC+ZthsqsjhxZ39NZIX7rM/EiMnjdg2hhIPqogPAi5712lWjOV+cLMW3+vrn+P7xpFp4boqsDr3gtdqSVWg7B5frr9VW6PGaCZYknlBlmG57xQ37KMaoGZ1ihR0Z+j0cZooWTqVPL4Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(346002)(39860400002)(136003)(40470700004)(46966006)(36840700001)(1076003)(41300700001)(426003)(336012)(47076005)(478600001)(26005)(7696005)(2616005)(16526019)(6666004)(36860700001)(186003)(82740400003)(81166007)(83380400001)(356005)(2906002)(5660300002)(110136005)(4326008)(70586007)(70206006)(8936002)(8676002)(36756003)(40480700001)(82310400005)(54906003)(86362001)(316002)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 18:21:04.1977
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53e83d9d-7e7b-496d-c050-08da70c5eebf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2785
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

PMF driver can send periodic heartbeat signals to OEM BIOS. When BIOS does
not receive the signal after a period of time, it can infer that AMDPMF
has hung or failed to load.

In this situation, BIOS can fallback to legacy operations. OEM can modify
the time interval of the signal or completely disable signals through
ACPI Method.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/acpi.c | 42 +++++++++++++++++++++++++++--
 drivers/platform/x86/amd/pmf/core.c |  1 +
 drivers/platform/x86/amd/pmf/pmf.h  | 10 +++++++
 3 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 41abd8680d8d..58e4893edea2 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -114,6 +114,26 @@ int apmf_get_static_slider_granular(struct apmf_if *apmf_if,
 									data, sizeof(*data));
 }
 
+static void apmf_sbios_heartbeat_notify(struct work_struct *work)
+{
+	struct amd_pmf_dev *dev = container_of(work, struct amd_pmf_dev, heart_beat.work);
+	struct apmf_notification_cfg *n = &dev->apmf_if->notify_cfg;
+	union acpi_object *info;
+	int err = 0;
+
+	dev_dbg(dev->dev, "Sending heartbeat to SBIOS\n");
+	info = apmf_if_call(dev->apmf_if, APMF_FUNC_SBIOS_HEARTBEAT, NULL);
+	if (!info) {
+		err = -EIO;
+		goto out;
+	}
+
+	schedule_delayed_work(&dev->heart_beat, msecs_to_jiffies(n->hb_interval * 1000));
+
+out:
+	kfree(info);
+}
+
 static int apmf_if_verify_interface(struct amd_pmf_dev *pdev, struct apmf_if *apmf_if)
 {
 	struct apmf_verify_interface output;
@@ -134,6 +154,7 @@ static int apmf_if_verify_interface(struct amd_pmf_dev *pdev, struct apmf_if *ap
 
 static int apmf_get_system_params(struct apmf_if *apmf_if)
 {
+	struct apmf_notification_cfg *n = &apmf_if->notify_cfg;
 	struct apmf_system_params params;
 	int err;
 
@@ -144,17 +165,26 @@ static int apmf_get_system_params(struct apmf_if *apmf_if)
 			return err;
 	}
 
-	pr_debug("PMF: system params mask:0x%x flags:0x%x cmd_code:0x%x\n",
+	pr_debug("PMF: system params mask:0x%x flags:0x%x cmd_code:0x%x heartbeat:%d\n",
 		 params.valid_mask,
 		 params.flags,
-		 params.command_code);
+		 params.command_code,
+		 params.heartbeat_int);
 	params.flags = params.flags & params.valid_mask;
+	n->hb_interval = params.heartbeat_int;
 
 	return 0;
 }
 
+void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev)
+{
+	if (pmf_dev->apmf_if->func.sbios_heartbeat)
+		cancel_delayed_work_sync(&pmf_dev->heart_beat);
+}
+
 int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
 {
+	struct apmf_notification_cfg *n;
 	acpi_handle apmf_if_handle;
 	struct apmf_if *apmf_if;
 	acpi_status status;
@@ -177,6 +207,7 @@ int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
 		goto out;
 	}
 	pmf_dev->apmf_if = apmf_if;
+	n = &apmf_if->notify_cfg;
 
 	ret = apmf_get_system_params(apmf_if);
 	if (ret) {
@@ -185,6 +216,13 @@ int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
 		goto out;
 	}
 
+	if (n->hb_interval) {
+		apmf_if->func.sbios_heartbeat = true;
+		/* send heartbeats only if the interval is not zero */
+		INIT_DELAYED_WORK(&pmf_dev->heart_beat, apmf_sbios_heartbeat_notify);
+		schedule_delayed_work(&pmf_dev->heart_beat, 0);
+	}
+
 out:
 	return ret;
 }
diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 4ce69864879a..6c1c5a89fe71 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -279,6 +279,7 @@ static int amd_pmf_remove(struct platform_device *pdev)
 
 	mutex_destroy(&dev->lock);
 	amd_pmf_deinit_features(dev);
+	apmf_acpi_deinit(dev);
 	amd_pmf_dbgfs_unregister(dev);
 	kfree(dev->buf);
 	return 0;
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index de8dbd5e04e8..f546062a10a7 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -17,6 +17,7 @@
 /* APMF Functions */
 #define APMF_FUNC_VERIFY_INTERFACE			0
 #define APMF_FUNC_GET_SYS_PARAMS			1
+#define APMF_FUNC_SBIOS_HEARTBEAT			4
 #define APMF_FUNC_STATIC_SLIDER_GRANULAR       9
 
 /* Message Definitions */
@@ -43,12 +44,18 @@
 /* AMD PMF BIOS interfaces */
 struct apmf_if_functions {
 	bool system_params;
+	bool sbios_heartbeat;
 	bool static_slider_granular;
 };
 
+struct apmf_notification_cfg {
+	int hb_interval; /* SBIOS heartbeat interval */
+};
+
 struct apmf_if {
 	acpi_handle handle;
 	struct apmf_if_functions func;
+	struct apmf_notification_cfg notify_cfg;
 };
 
 struct apmf_verify_interface {
@@ -63,6 +70,7 @@ struct apmf_system_params {
 	u32 valid_mask;
 	u32 flags;
 	u8 command_code;
+	u32 heartbeat_int;
 } __packed;
 
 enum amd_stt_skin_temp {
@@ -99,6 +107,7 @@ struct amd_pmf_dev {
 	struct apmf_if *apmf_if;
 	enum platform_profile_option current_profile;
 	struct platform_profile_handler pprof;
+	struct delayed_work heart_beat;
 	struct mutex lock; /* protects the PMF interface */
 	struct dentry *dbgfs_dir;
 };
@@ -126,6 +135,7 @@ struct amd_pmf_static_slider_granular {
 
 /* Core Layer */
 int apmf_acpi_init(struct amd_pmf_dev *pmf_dev);
+void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev);
 int is_apmf_func_supported(unsigned long index);
 int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32 *data);
 int amd_pmf_get_power_source(void);
-- 
2.25.1


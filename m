Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6719FC04A68
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Jul 2022 17:42:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231161AbiG1Rmz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Jul 2022 13:42:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231771AbiG1Rmy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Jul 2022 13:42:54 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2053.outbound.protection.outlook.com [40.107.94.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A33E747B1
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Jul 2022 10:42:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f1j1DVoVrpljBJM9VfseE/qqA2AjcF21U7yYJxnL3MkmMRWS3jmNqtj3BiGd48VleKYmi0uuGL3qfgxEQoNWbjPJ5fymRVN4yoxsuNdGibco6N1WmDkZfhjXif7/SeTupCdprv3Q29f9nPi+zB/jw3pp5kH2BYZa3G8MGQScG2nOREeiLGMwCN4mkZQ2eSBY9WsuZZVLGQ1g8UfV8yeI8/BTLII2fWkDXSxSxdjSNxtGHCUI154od93AjQu5OaA/7F8+uhVSB3Sa8aQcKS3DiWLEVkRFXe4rDxq9n46HOWoWwWTeLUqPFInPeNKLE7go73zx2gKmAyvqgU96ce6xdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJuXSxuWgCXS+0PG5gSTHwqiuERkiwH0U/Ghu81Su6A=;
 b=AzdpGRS/9hYRc4GH8F3oWZUgJWEVOC9oz0pn+6ruwdmBMmocXw+6Ic835O0J/TTW0J8QiidyWyS1O/4WDQXo2UT8+vn6Ka8sc+BZLxb12vCURvbJi7kiqaPJ75kfCcVpFCsxAvNN8ynaQU2Zxju4kMPbV1wd+Xv+y5+ETcSDGsSWpWA1uIDpYmIZfFv06ICO4JuIT2bcZad7a5oQZHG5+a3GND+xxXW3C657yudY2DuCRsrwwoUolIq3l5+kzcrORrLtzdvHuZwGVJdnL4OyhQaAN8b3HUMKjFFuChvN99aK56U498yb2CuoUUuuaoQTCLKILA6SM2HPdqfjKsQVJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJuXSxuWgCXS+0PG5gSTHwqiuERkiwH0U/Ghu81Su6A=;
 b=GcEdmHrgQYjbOMYIcqUAVsK7nP2V7gdZvczurrmZJiZkwJV8Q7eo7HR4bRH9vRh5jO0Hs3XWIfE0hkngM9b7d8ShyWEfe5GFGXBO6BBCm3v92cu/2skkC4zUfY4jujtJXYzLHrUiFeXkwIlJ63KymD2iCXE4DmMOmuEDd800rcM=
Received: from MW4PR04CA0255.namprd04.prod.outlook.com (2603:10b6:303:88::20)
 by CY4PR12MB1254.namprd12.prod.outlook.com (2603:10b6:903:41::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.20; Thu, 28 Jul
 2022 17:42:51 +0000
Received: from CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:88:cafe::2) by MW4PR04CA0255.outlook.office365.com
 (2603:10b6:303:88::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24 via Frontend
 Transport; Thu, 28 Jul 2022 17:42:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT027.mail.protection.outlook.com (10.13.174.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Thu, 28 Jul 2022 17:42:50 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 28 Jul
 2022 12:42:47 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 05/11] platform/x86/amd/pmf: Add heartbeat signal support
Date:   Thu, 28 Jul 2022 23:12:02 +0530
Message-ID: <20220728174208.2081453-6-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220728174208.2081453-1-Shyam-sundar.S-k@amd.com>
References: <20220728174208.2081453-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a239487-f2a6-4778-6ae4-08da70c097bc
X-MS-TrafficTypeDiagnostic: CY4PR12MB1254:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Clf9orpLG1n49MuhVWAk5q8F63GrNI1oPRrkNdgD5JX5U8r+BHLRq5FZlvQivRpx1iclCjAlBjFMszWwnGGUGyH9Q8AzhX0rMA5Q11MkUkWOgIIrugs5GrP5IPZqcRf8m+EkNgtNLc2Q9633kz7dbz8Ij6Pv27HLlpLr3Y/rt4JR+OBeiSfbAJvstAC5Fg3VPnAAKuAd9CNTTq+WKBz+1vU46s2N7oTmNHatjtpAitaCcZ1Vb9tpRwplxTR8gG8iMFnLro8UpyTGZJptBrzvKz+By12fuJUg4e+6kcB0iDewed848OWXXLYM42YdrIrLPOxkKJI8pDz3p0AMRHEUsz4jMIEomO4hR9XSb1H0fwZv626miHWUaLTbE0WXRTfrocThPORvP9U5oYz7i/8XYCwn/yretOMfSdOC6fF7Sgudd38Hxzegb0x7SZj33gXzjj5HcD33dBlYiqJNgA+ImDM6YQ5xr/MgrCjkvMtz4Q4ZcifBFdu5sXz150H/WMJkpbeIMg6dJYJHY43nuyUja8Izea90GIhKU6VTlZ8LBEUw6DIGPN1X1GlzqgeSy5vdh3w6hhOJzaO0zUh4hoTTU5HXQcT6UoqQqQA2ncGLmn29e1ivLbl24yGTKqnikByhYDp0Sw2rkXKgOjcF8BTUrG5T4Tuo26AOpxH+KH6mTskXWumjH2hoEvZm9H/YUfpZFXw9M1slIcNJwLXI5x8soTwnmWPgvVwpN3U4c+Yz/uFlChLRJuGpXP1ewUFKQx+/uZLrVmB5widWaAZOePDxO3NmUyIolIKNfJlCyktzSIJanxHbxMG9fJ8BLE1YPFLknTbfJqZ+ONuBS6KeqU2KHA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(346002)(396003)(39860400002)(40470700004)(46966006)(36840700001)(2616005)(8676002)(40480700001)(4326008)(36860700001)(70586007)(356005)(5660300002)(8936002)(36756003)(82740400003)(81166007)(2906002)(70206006)(336012)(7696005)(6666004)(26005)(478600001)(16526019)(41300700001)(86362001)(1076003)(110136005)(82310400005)(186003)(426003)(83380400001)(54906003)(40460700003)(47076005)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 17:42:50.6211
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a239487-f2a6-4778-6ae4-08da70c097bc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1254
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


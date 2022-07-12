Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BA6CCCA47C
	for <platform-driver-x86@archiver.kernel.org>; Tue, 12 Jul 2022 15:04:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233823AbiGLPES (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 12 Jul 2022 11:04:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233906AbiGLPDF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 12 Jul 2022 11:03:05 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2075.outbound.protection.outlook.com [40.107.92.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EDB9C164D
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Jul 2022 08:00:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EqDJWuv7iC7IJB65nP9rmmVSDcdrVBVlM4YSobFcuPm98oY/wg1xMxtgBGduHnUO/NkD4/bH7BhwgvpJP+mc9JBIGhLvkl+cL1OTY4s1GDidBVN8ZY2+z7k/ORyawgct1DJIj9mUWkzZ9KoQ2NSNAAtJyyO/cddi0zCZ6/6promRnGCrAd4xoL8HjlIJI53azEdE/V1jCIN1SenVfiqKlaDJrPFprtCaTA2NAox75ZQxenORleEfZ+JeQq8wzI/yXdKr7HP+T0N/5vWUpstL27fVtY3qVkYa9EpoLE8QOz10zv1KXERjQhEFhsx03giJZPf5agunFvEnR8zX0QxFqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T66EDmRU+C+eGaTf1Yx4OKpPYx5qzwKoytGcXqyEkP0=;
 b=VCLBwhhPyMof7Ix4wi8zOZxetrP4kbuE40NA9Jx8khqFPalmuC93smcGT/Du438Ls7WPwnuw2U00tqLCwKnEAPrqD0ZjIvLTEapE37mGJVonBpeQWHvN/614SSIykai53AmDB235CboYf1GkQ4eRz0Y3Z/7jUy4+k2/GHUVScKnxcfLOmxG7mR1xyyZNlrWdpgh4Om+wr78rdJ3nZ4EHMymI6qbQYFaUIk2ysv/g2/M4yI04+6pOFwKJewARUCo7vO5OtoQLnuqIq6QqlboDghNlYHIWcOMTUZG69fWlNsl/5N5sfDriJWg3buBRYh5R/0QS53ArFxflWNWT2GGknw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T66EDmRU+C+eGaTf1Yx4OKpPYx5qzwKoytGcXqyEkP0=;
 b=3nDAMvzYwewjVP/uM18IRijjWg4cbespZiLG6BRzecKHuqe6YN5RRl+46F6t+8gV9db6pxek93XoAhUlkyOMLrG3hK1DRRIsyOI9qHTEEYR8/YTVdagzAzoJt/RQRpSLbE08iUvF7VI+EiRfdz4XMlx5SgMVflO+xguIQoK21vM=
Received: from BN8PR04CA0041.namprd04.prod.outlook.com (2603:10b6:408:d4::15)
 by MN2PR12MB3229.namprd12.prod.outlook.com (2603:10b6:208:102::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Tue, 12 Jul
 2022 14:59:42 +0000
Received: from BN8NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:d4:cafe::a8) by BN8PR04CA0041.outlook.office365.com
 (2603:10b6:408:d4::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.17 via Frontend
 Transport; Tue, 12 Jul 2022 14:59:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT041.mail.protection.outlook.com (10.13.177.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Tue, 12 Jul 2022 14:59:42 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 12 Jul
 2022 09:59:39 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v1 06/15] platform/x86/amd/pmf: Add heartbeat signal support
Date:   Tue, 12 Jul 2022 20:28:38 +0530
Message-ID: <20220712145847.3438544-7-Shyam-sundar.S-k@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: be3092d7-903a-4039-6460-08da6417269b
X-MS-TrafficTypeDiagnostic: MN2PR12MB3229:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EsTPpQl0dB03GI2CmzzKjmM9qycvr5GILUGKAv90eOjwjws0CGEPabfhzfhUZF/5BI+lkWzs9ElKapvS/VTpBJCF9Jwzdp2uk0fydJD3rkW8w6CuSNQQ27ideV8CnZGzDHqUtBYb2M09BRt5EQtsdmAehJ0Ftrdju9IjDP0H9WhxLCPquB5R+cFjsj8HGO1Ct2crn9LgdNXX5haVGcqA/MocUCMgr++NA0jVZpFgO0DScv3GHU7HZ4Wipb0o6nb2DYs4XBbXZE/AoUkkHrKm41KZXXsR7ky7BX1O2li5jWz77Gz67cdlWlqIb1Dl3Rwc+HTYfgvapWV9+ZTaOBhmifybpwj2UqVvSSr+kjk2Z9b4tkGuvJPKnE/rGSuYorJ/KhY19qzx1xBhxefQLC2y+5gR3r+4uq4hfhVmv87SbRmXPiZeaziOPsj6qfisTu9o73/juGUXlV8qSUca5a6zt3mmGaLSn6gJ1zM87K8EpaZpK3lGyxiBz6twHU35lu/QPDeIg98Dwvokmn3wnGq63+5FWDMONTbhjVzKwzJgCqqBU1YdSkZqs8I7qbfcrMxIXgkdVIsqhtKyePIrTzj08pUTp/sYwuuAjQZ1apkFeCq1sKXZcfqqdK7J4gQ3LJ5YDkW3OMsP3oFDbxp+rYnl5X9KqjIHGM+NlVFfSbRa0mw39LWWgcS6P9XjvPKFRrjIanXkzC2ghzBDDnwjWhZptPx0s8TZwVPBvq/ZxfrK8C6LP0hkAbJleP4/x2GLtSOpV7jNiqdI57AInQcpcKSxE9+m/eDCDSFkPYkpiR0Ztv1EcD26LP8/uj5zQc8V4oGWUqPOSscVDLmpIE/UR2S/5tKQ8NJcqniXrm+0WlZgEss=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(39860400002)(136003)(396003)(36840700001)(46966006)(40470700004)(47076005)(83380400001)(2906002)(426003)(336012)(40460700003)(36860700001)(82310400005)(36756003)(16526019)(40480700001)(186003)(4326008)(1076003)(5660300002)(8936002)(478600001)(86362001)(54906003)(70206006)(26005)(8676002)(70586007)(316002)(7696005)(81166007)(2616005)(110136005)(356005)(82740400003)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 14:59:42.0464
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be3092d7-903a-4039-6460-08da6417269b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT041.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3229
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

PMF driver can send periodic heartbeat signals to OEM BIOS. When BIOS does
not receive the signal after a period of time, it can infer that AMDPMF
has hung or failed to load.

In this situation, BIOS can fallback to legacy operations. OEM can modify
the time interval of the signal or completely disable signals through
ACPI Method.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/acpi.c | 42 +++++++++++++++++++++++++++--
 drivers/platform/x86/amd/pmf/core.c |  1 +
 drivers/platform/x86/amd/pmf/pmf.h  | 10 +++++++
 3 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index fd5ab7a116f0..60ffc9ba4adc 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -97,6 +97,7 @@ int is_apmf_func_supported(unsigned long index)
 
 static int apmf_get_system_params(struct apmf_if *ampf_if)
 {
+	struct apmf_notification_cfg *n = &ampf_if->notify_cfg;
 	struct apmf_system_params params;
 	union acpi_object *info;
 	size_t size;
@@ -120,11 +121,13 @@ static int apmf_get_system_params(struct apmf_if *ampf_if)
 	memset(&params, 0, sizeof(params));
 	memcpy(&params, info->buffer.pointer, size);
 
-	pr_debug("PMF: system params mask:0x%x flags:0x%x cmd_code:0x%x\n",
+	pr_debug("PMF: system params mask:0x%x flags:0x%x cmd_code:0x%x heartbeat:%d\n",
 		 params.valid_mask,
 		 params.flags,
-		 params.command_code);
+		 params.command_code,
+		 params.heartbeat_int);
 	params.flags = params.flags & params.valid_mask;
+	n->hb_interval = params.heartbeat_int;
 
 out:
 	kfree(info);
@@ -159,6 +162,26 @@ int apmf_get_static_slider_granular(struct apmf_if *ampf_if,
 	return err;
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
 static acpi_handle apmf_if_probe_handle(void)
 {
 	acpi_handle handle = NULL;
@@ -179,8 +202,15 @@ static acpi_handle apmf_if_probe_handle(void)
 	return handle;
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
 	int ret;
@@ -202,6 +232,7 @@ int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
 		goto out;
 	}
 	pmf_dev->apmf_if = apmf_if;
+	n = &apmf_if->notify_cfg;
 
 	if (apmf_if->func.system_params) {
 		ret = apmf_get_system_params(apmf_if);
@@ -212,6 +243,13 @@ int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
 		}
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
index 3d2af6a8e5e4..ff26928e6a49 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -289,6 +289,7 @@ static int amd_pmf_remove(struct platform_device *pdev)
 
 	mutex_destroy(&dev->lock);
 	amd_pmf_deinit_features(dev);
+	apmf_acpi_deinit(dev);
 	amd_pmf_dbgfs_unregister(dev);
 	kfree(dev->buf);
 	return 0;
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 77021ef4bfde..504e1ae79706 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -17,6 +17,7 @@
 /* APMF Functions */
 #define APMF_FUNC_VERIFY_INTERFACE			0
 #define APMF_FUNC_GET_SYS_PARAMS			1
+#define APMF_FUNC_SBIOS_HEARTBEAT			4
 #define APMF_FUNC_STATIC_SLIDER_GRANULAR	9
 
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
@@ -101,6 +109,7 @@ struct amd_pmf_dev {
 	struct apmf_if *apmf_if;
 	enum platform_profile_option current_profile;
 	struct platform_profile_handler pprof;
+	struct delayed_work heart_beat;
 	struct mutex lock; /* protects the PMF interface */
 #if IS_ENABLED(CONFIG_DEBUG_FS)
 	struct dentry *dbgfs_dir;
@@ -130,6 +139,7 @@ struct amd_pmf_static_slider_granular {
 
 /* Core Layer */
 int apmf_acpi_init(struct amd_pmf_dev *pmf_dev);
+void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev);
 int is_apmf_func_supported(unsigned long index);
 int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32 *data);
 int amd_pmf_get_power_source(void);
-- 
2.25.1


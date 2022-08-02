Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F1C3C00140
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Aug 2022 15:13:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234638AbiHBPNx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 2 Aug 2022 11:13:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234624AbiHBPNw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Aug 2022 11:13:52 -0400
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2081.outbound.protection.outlook.com [40.107.101.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADF4F17E12
        for <platform-driver-x86@vger.kernel.org>; Tue,  2 Aug 2022 08:13:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GoxSCeo92Jm+1HML7fuSxThtmtSmVCUIhKWGC7sgyR8TSnc3DsYqUGq7MHdFH0Sn7uXVkvf383sN7OzEz6oXc/rke2Sce7aQ67HQaFzP3oWOuV+CuteZWadqSc8aBPUpktzn8MmJYk8SwrIBg7xcceWKUM3FEMtaGWFegTDz9pOXb0hF51U/7cZSdzZSOCwMrU/0ZzBo8oQuj0Vsdj+8dp/A5hcjRD/nhNxkG2sg0xyt+aFYScYer8Cj7vHBfbojHbuC5zbEDLFINhmnJ+bvO3pq4UJRnhoIDSrO6hGvPzcpMosWROS9Rpg8m/xeT11xoUwVPRx60ddQCnWDbXTkEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=limAfm3k9EK/VDKG3jPPmZHdQDT1QJootq+Z84wxrSk=;
 b=j8Sq8U9WMzU7av0biBX+0895sXwwObdyqvZlt5IlYatCO8iN+vlYiR1qX9loXEYEzSkW3zKyEQd2Ui7KFgVnuJKqxJ9GH+DOhLdBB0/rfhYBC4JvTmRm0dmYu4PTAC0qI9ZGi18sMtRKNuGabNJ/qhUTJt7ar172XFYoxlXdvO867r4tWayZRiBlCQH6hY0x84yGzzgv5x7wnFnOlZMBtpU6qLsRUg8EU1inzUfjCAJ0m79tjPwqkBfruzL0SUxWjsux+x/+exwRvQ9NAklntj3o05NXhabc9ADiNKnbOOE15IrE3oRH+x6X+x+aj+G6+6ErdRgCAxfILFHoa3c0+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=limAfm3k9EK/VDKG3jPPmZHdQDT1QJootq+Z84wxrSk=;
 b=Ns98Axp+rSH0bI9FJWY+qnXGQsY8ea09fDhn5aRnC26uVyMoyKAZNi4iNiUbRu/+q8+U03wfmx8Uigd6dTxj+rsle2kskc4ya+NM4s+393fA3+NJL5vE5cEL1T+9nc4/Q1+w0O8PfWKY+DyPip62oHk6jvdvQ/lzecol6XlFFWU=
Received: from BN9PR03CA0844.namprd03.prod.outlook.com (2603:10b6:408:13d::9)
 by MW5PR12MB5681.namprd12.prod.outlook.com (2603:10b6:303:19e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Tue, 2 Aug
 2022 15:13:49 +0000
Received: from BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13d:cafe::1c) by BN9PR03CA0844.outlook.office365.com
 (2603:10b6:408:13d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.15 via Frontend
 Transport; Tue, 2 Aug 2022 15:13:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT034.mail.protection.outlook.com (10.13.176.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Tue, 2 Aug 2022 15:13:48 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 2 Aug
 2022 10:13:38 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 05/11] platform/x86/amd/pmf: Add heartbeat signal support
Date:   Tue, 2 Aug 2022 20:41:43 +0530
Message-ID: <20220802151149.2123699-6-Shyam-sundar.S-k@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0e100184-e6cf-4a27-5650-08da749999cf
X-MS-TrafficTypeDiagnostic: MW5PR12MB5681:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o+fwk2GSqg1sDjqHUmE3KFM7XQKQUIJVmVw55JHUYRXUexvlBsAOTIi7tUkoX7EEfzuodMso38JzBbBT8OaGOCng4IrtDovMicEZ/LHep9wX87PmhiC/peGrmozkawMBtxmrc9MWYLzHeokyMkj5Ao+mVFMAoR9v+BEcUFA8fWtWLbwm8HkPDMcyjZehG4X+YEv/YoxG+PA+WzH2g4RZOejY4c81AFx/wfd55tJDHJeVdRt15BboN95chN6Fz5ukym5AqfwniZ0jrPGu/mcqch1v0TiXKaDp78QXhaorzkJgrzx5Ao63CiQkaSZvx/ykCiawFxdQNjnClOtMTDKwjkYbK/Lyyk/lmHkQdrojoN/lpF4XnFwtznr0jrMX/HjgVm9oZp64SyGY2SDri6+1FCJA+py5uO6ZQY/wGoeSDsfCdNZOqRo1xMNbYLveh6dcbApjB+2vyBSkLN9zkfC2FCiBGUrdVgMY54LbiuERCa4RYRm/vYBNGD7MTjLV+en0obMwGDNgjqm8YyQYilBqiofLsEfNt4oAMt8T39JurK+oMWdDZZOMEoTJYdyQWSkDFXUz4DCGHUdKGLuyw1MCHL8KL2wGWSy0+c4RgOQXPhtYFXqICi/UxjgtRizYqgh9arj6cbUDY4//K1qFN6kEVDCQVpe/Ju1MG8cF9pfqVr8P8sggbn4TU2bfzhrtITzQhkNso8liJOG5dUrGgWkt2flRHwmwmUhs7j1CLth6G1WgF8cMK272JKGhTYqv40W8rxgpYBxnf4xlaOTtxry/5vyiYwoaBh/zSYf+mL7A39S70ck2kmfoThxFSDi9rQ+1g87eV91dAr0uMIXpKFQo4A==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(136003)(376002)(346002)(40470700004)(36840700001)(46966006)(6666004)(7696005)(41300700001)(26005)(40480700001)(316002)(478600001)(54906003)(110136005)(86362001)(82310400005)(356005)(82740400003)(40460700003)(81166007)(336012)(426003)(1076003)(2616005)(16526019)(186003)(47076005)(36860700001)(83380400001)(36756003)(2906002)(8936002)(70206006)(5660300002)(8676002)(70586007)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 15:13:48.4885
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e100184-e6cf-4a27-5650-08da749999cf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5681
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
 drivers/platform/x86/amd/pmf/acpi.c | 34 +++++++++++++++++++++++++++--
 drivers/platform/x86/amd/pmf/core.c |  1 +
 drivers/platform/x86/amd/pmf/pmf.h  |  5 +++++
 3 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 5997ab724f3a..6af0e23257ea 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -103,6 +103,22 @@ int apmf_get_static_slider_granular(struct amd_pmf_dev *pdev,
 									 data, sizeof(*data));
 }
 
+static void apmf_sbios_heartbeat_notify(struct work_struct *work)
+{
+	struct amd_pmf_dev *dev = container_of(work, struct amd_pmf_dev, heart_beat.work);
+	union acpi_object *info;
+
+	dev_dbg(dev->dev, "Sending heartbeat to SBIOS\n");
+	info = apmf_if_call(dev, APMF_FUNC_SBIOS_HEARTBEAT, NULL);
+	if (!info)
+		goto out;
+
+	schedule_delayed_work(&dev->heart_beat, msecs_to_jiffies(dev->hb_interval * 1000));
+
+out:
+	kfree(info);
+}
+
 static int apmf_if_verify_interface(struct amd_pmf_dev *pdev)
 {
 	struct apmf_verify_interface output;
@@ -131,15 +147,23 @@ static int apmf_get_system_params(struct amd_pmf_dev *dev)
 	if (err)
 		return err;
 
-	dev_dbg(dev->dev, "system params mask:0x%x flags:0x%x cmd_code:0x%x\n",
+	dev_dbg(dev->dev, "system params mask:0x%x flags:0x%x cmd_code:0x%x heartbeat:%d\n",
 		params.valid_mask,
 		params.flags,
-		params.command_code);
+		params.command_code,
+		params.heartbeat_int);
 	params.flags = params.flags & params.valid_mask;
+	dev->hb_interval = params.heartbeat_int;
 
 	return 0;
 }
 
+void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev)
+{
+	if (pmf_dev->hb_interval)
+		cancel_delayed_work_sync(&pmf_dev->heart_beat);
+}
+
 int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
 {
 	int ret;
@@ -156,6 +180,12 @@ int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
 		goto out;
 	}
 
+	if (pmf_dev->hb_interval) {
+		/* send heartbeats only if the interval is not zero */
+		INIT_DELAYED_WORK(&pmf_dev->heart_beat, apmf_sbios_heartbeat_notify);
+		schedule_delayed_work(&pmf_dev->heart_beat, 0);
+	}
+
 out:
 	return ret;
 }
diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 032d9dc5e09f..87a1f9b27d2c 100644
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
index e13542359403..5b85a7fe0f38 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -17,6 +17,7 @@
 /* APMF Functions */
 #define APMF_FUNC_VERIFY_INTERFACE			0
 #define APMF_FUNC_GET_SYS_PARAMS			1
+#define APMF_FUNC_SBIOS_HEARTBEAT			4
 #define APMF_FUNC_STATIC_SLIDER_GRANULAR       9
 
 /* Message Definitions */
@@ -53,6 +54,7 @@ struct apmf_system_params {
 	u32 valid_mask;
 	u32 flags;
 	u8 command_code;
+	u32 heartbeat_int;
 } __packed;
 
 enum amd_stt_skin_temp {
@@ -91,6 +93,8 @@ struct amd_pmf_dev {
 	enum platform_profile_option current_profile;
 	struct platform_profile_handler pprof;
 	struct dentry *dbgfs_dir;
+	int hb_interval; /* SBIOS heartbeat interval */
+	struct delayed_work heart_beat;
 };
 
 struct apmf_sps_prop_granular {
@@ -116,6 +120,7 @@ struct amd_pmf_static_slider_granular {
 
 /* Core Layer */
 int apmf_acpi_init(struct amd_pmf_dev *pmf_dev);
+void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev);
 int is_apmf_func_supported(struct amd_pmf_dev *pdev, unsigned long index);
 int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32 *data);
 int amd_pmf_get_power_source(void);
-- 
2.25.1


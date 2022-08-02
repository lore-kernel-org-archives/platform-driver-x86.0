Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DE28C19F2C
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Aug 2022 11:28:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236922AbiHBL2G (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 2 Aug 2022 07:28:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236924AbiHBL2A (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Aug 2022 07:28:00 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1anam02on2076.outbound.protection.outlook.com [40.107.96.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1BDF43E67
        for <platform-driver-x86@vger.kernel.org>; Tue,  2 Aug 2022 04:27:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h3NwvFgfYpu5XqWW1F71bu7/S40XGUfeu5L12jFlJjw5MckI8AKpqDs8589cChCrpvM97LNWq5ibK7cDbJ2ZcQMj/Pi6Td6l0WAWpPTFqCt0f/MlR2joXUvuGGDZc7jj1Q7NAjsu8qupo6WDquIgXfovg0ANki+yR2VIj8ShB2WtbCSl9K15un/lPzkjDAxm/uC+SEJzUCOR/1aBuW0GXUzusNg13wCFvmgQr+JUHVDLB0XLlcEPj5UQQw8J2FDZEnqPJdUo/CSl7tsUGuUjihY3TIf2MV5qEcNOgqgpkQZDoXenIggOYlsWWmR4Ogf4A0/0yRsEBze8rEgnQiluyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vQmIMYwgo11SY7/0rKHh5VuW3ZNJwe/2zsPBDKGmLUg=;
 b=CsAH0Qh2uadHu8jIw22PzmOvnSn9glbJ7ilqY5ehdrknNA+4XiOIaN/1tEyZ7/HW9z/qyXloA1Y+qKWhLjZs/+4T9XLjA4+Ls/CWPlNccEdO7DzwxfwGBPN1qaPsw8kKUQUdZTXZdbdg4UJ3tO9v55OttaDHXCjINcPQvwxvE1lMryigXkHcARuEnd7w8GmE7OgIKtLPhuQIogd3hKZU6jW+Y7XnisAHntCwLRJAoiRYulSzQ9G1GF4UoiCSu9XIUxML9dZIXItE8/kDFhsAUH1Y0eMqv4Sd9JUENt57eL0UdrpJieCkDHlUJlmCmJx3JC3IjxqH1gU/bjp74P9B8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQmIMYwgo11SY7/0rKHh5VuW3ZNJwe/2zsPBDKGmLUg=;
 b=bmCFjCDvwU0mKUbpM7fQpj9beIV41tqXk4cxtFzxZugDPSUnHRSCOMIxv+tHUC0n78IINtWkhlbgg5vxs3b3LPdkXju9roUYlmGW/vwx62VKRfC2+P9jXNuswt9wXX5ULGtN1FIg89pH2ey/f8bQMB0V2drUTur/ZJ5gA9++Aeg=
Received: from MW4PR03CA0208.namprd03.prod.outlook.com (2603:10b6:303:b8::33)
 by CY4PR12MB1846.namprd12.prod.outlook.com (2603:10b6:903:11b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.14; Tue, 2 Aug
 2022 11:27:50 +0000
Received: from CO1NAM11FT007.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b8:cafe::f1) by MW4PR03CA0208.outlook.office365.com
 (2603:10b6:303:b8::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16 via Frontend
 Transport; Tue, 2 Aug 2022 11:27:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT007.mail.protection.outlook.com (10.13.174.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Tue, 2 Aug 2022 11:27:33 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 2 Aug
 2022 06:27:25 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 05/11] platform/x86/amd/pmf: Add heartbeat signal support
Date:   Tue, 2 Aug 2022 16:55:39 +0530
Message-ID: <20220802112545.2118632-6-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220802112545.2118632-1-Shyam-sundar.S-k@amd.com>
References: <20220802112545.2118632-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 042cc1f2-dbc7-4fbf-b441-08da747a0853
X-MS-TrafficTypeDiagnostic: CY4PR12MB1846:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0qCb1MN3L1hWiuh91l+N4zhjacfoHtvWKIcproQAxV9YsXvkgp5fcNzoVuax8YJi0xmfPfj+tzHejLMzQhBjinhttvzgaCs7oXONx5Tt7n3IVuNq7sOukSkMdAJrF+UqceVxpXGmrEEkLaqUin2x5ZLh5N7HK8zzPUfBi8S7ckXGAJAalvPeClhYt7tAXN9GhP5vI8WqMKuIREhMmE4pa88wmViXRz5oD/zelcvehgPZx/0P5xt3uC0v2OyRJAyLshrIFbp2z8YdMCGR2KaZBcQm3jIh78KxveMEdagVC1zph5+jyOj8bFM1ICaRXztBt63uE4tS1yEVJXMuaxtqY7MvnxR/wXcVmHN7dEfZw1ePl57rLrcrALkUoo9VaBkPT32YfS00x6LLRbF6uEt0WV+pOntJZ0xijNUQagLyqjWkWUjawjG7p2eDedlutrbnrJzIn3y7X8XAkj0nIQdtGlfj3g09qbwfFhqkL22mm0YmmIGAIWNFT6pLhBhgVMvDWg/2kgpU2BwxMAJdMGOhvmf4HKv+AY2jwd8ns+CdxIjrx43e5PqYXL6crsWl8JmswW/Vjf0O6WouwgDoKEWJNITP6EbsYf5sb57L/RzfgcG+TE3AjiQfJRQFgD0cSr6tVlpaE17sMGo7zolwGWiX8ecpAGwA1pYdo+0KTNl+9kFLrxmAzDXBZX4K1tu+zfxbQxposnx9CagLaem3j+qLYQzxVcBswNKXfpf/2yZBIQR+sfzPjQTNefQlcFhuYS48bjlM9uXI38tSG7gc5Lcef+GUrpHeM4wQxiL3iW0KUyhoOlj2PoggkYrpUxaU9vLbY7fw3eHmaJYCj32fUJbkZw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(396003)(346002)(136003)(46966006)(36840700001)(40470700004)(40480700001)(47076005)(2906002)(8676002)(356005)(81166007)(5660300002)(70586007)(4326008)(70206006)(86362001)(36860700001)(82310400005)(82740400003)(26005)(316002)(478600001)(8936002)(40460700003)(41300700001)(7696005)(36756003)(6666004)(54906003)(110136005)(186003)(1076003)(16526019)(426003)(2616005)(336012)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 11:27:33.1207
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 042cc1f2-dbc7-4fbf-b441-08da747a0853
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT007.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1846
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
 drivers/platform/x86/amd/pmf/acpi.c | 37 +++++++++++++++++++++++++++--
 drivers/platform/x86/amd/pmf/core.c |  1 +
 drivers/platform/x86/amd/pmf/pmf.h  |  5 ++++
 3 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 717ee81a5f73..c3f87265eeae 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -105,6 +105,25 @@ int apmf_get_static_slider_granular(struct amd_pmf_dev *pdev,
 									 data, sizeof(*data));
 }
 
+static void apmf_sbios_heartbeat_notify(struct work_struct *work)
+{
+	struct amd_pmf_dev *dev = container_of(work, struct amd_pmf_dev, heart_beat.work);
+	union acpi_object *info;
+	int err = 0;
+
+	dev_dbg(dev->dev, "Sending heartbeat to SBIOS\n");
+	info = apmf_if_call(dev, APMF_FUNC_SBIOS_HEARTBEAT, NULL);
+	if (!info) {
+		err = -EIO;
+		goto out;
+	}
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
@@ -133,15 +152,23 @@ static int apmf_get_system_params(struct amd_pmf_dev *dev)
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
@@ -158,6 +185,12 @@ int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
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


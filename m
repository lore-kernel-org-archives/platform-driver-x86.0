Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BC33C4338F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Aug 2021 22:09:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 427DC611C8
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Aug 2021 22:09:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231792AbhHXWKB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 24 Aug 2021 18:10:01 -0400
Received: from mail-dm6nam11on2070.outbound.protection.outlook.com ([40.107.223.70]:23009
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230374AbhHXWJ5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 24 Aug 2021 18:09:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TgQbAt/XfdIIURmp9p+EDee4r09YDG0idGN5v/OzB5WTQniyMEuYbPXtNHUYCwb1IlTK85XlnG5pIViAfagQLamA6KPYS+4NuZ0/LW+smp1vEfownsL8cYfksZgWsyyxTA9dNzJtXC8PpNS3VjGdnf4Rdcid0vKitQR6wuu2ZOtpXamSScChqRoI7/Kur8LVb7nyeXWUVfwBDK4nD0yHOkoJSMNHfaRZBG28YPlwkVeYYG9lV4ufxw4lc8fa5sfF/VE5Pg9w9rYBRE5UeMfYFt1yglhndpLMTPrihpMQweOsUSS28AHpo/gBuQK+ZL3jB3cxPcjD0WbRINqYpoPfpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JrD7Hbk8T3ClnfQizRLbo6AjXQ/F/D/cGi5DcatEZBk=;
 b=fymt7inAgzQTpceU+kaXXypPr9+eHYka6iAf47QmRaaVKfkO/RnT/Rpci3iLn8gRtW1AydORABssvffvtbATRe83rHfiCqJtprKAXGAfQsNVqmnkmH9Lsxb4RNLSDMOOVemCHXcwXY3gZzfkBwteufplvLqhvaSOb80fu6hOvY5RGFIXj12cLkyG7z9ZvINXUHbFWmxpvjVlv7GB3ci70b7zaOvX/WiJisKw+DrDrpsrAbQ6tEBpSjZP6MgjBNVl0WSofxO8h5bTuAkAjjwIs64YcurUAdECRYrY5GeqrMNzwjRSM2cJLWAGWo4vRTwdty94mDeW6a1ulQiisdKwhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JrD7Hbk8T3ClnfQizRLbo6AjXQ/F/D/cGi5DcatEZBk=;
 b=no+gzLIU6d8KynH6IYkk6wF7TbiskfUpPiWzRnbn3SLmXyhhyzKmpspFnLmK3Ik+Mt+RPMdMuCqxzW/nwX4uMDkn0lBJgFXNRxVwWMKgSHzKtgU+3Y6jUwqn5twkC0vj+FdOOwFspXAnRkeFZrriZkU7xb8UQc5xgw35+jWOVb3eRU1HXYniRDiniCYfAWGstRfeYR/IG2wIslEiFgTUz13xEce8pr3B0na0TfRQaxXNR84/5zpnuJFq9KyCFwS/2pXh2r4t1QMcAvihO5PRo8Wr1vCpbaLgXP7ehkGXJOpVp9Ms4fcMtm0NtjK0TPqrlu2Cw+Kw2eLabvSa7NKteg==
Received: from DM5PR15CA0028.namprd15.prod.outlook.com (2603:10b6:4:4b::14) by
 MN2PR12MB3151.namprd12.prod.outlook.com (2603:10b6:208:d1::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19; Tue, 24 Aug 2021 22:09:10 +0000
Received: from DM6NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:4b:cafe::44) by DM5PR15CA0028.outlook.office365.com
 (2603:10b6:4:4b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Tue, 24 Aug 2021 22:09:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 DM6NAM11FT021.mail.protection.outlook.com (10.13.173.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 22:09:10 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 24 Aug
 2021 15:09:09 -0700
Received: from dude.nvidia.com (172.20.187.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 24 Aug
 2021 22:09:07 +0000
From:   Daniel Dadap <ddadap@nvidia.com>
To:     <platform-driver-x86@vger.kernel.org>, <hdegoede@redhat.com>,
        <mario.limonciello@outlook.com>, <pobrn@protonmail.org>
CC:     <andy@infradead.org>, <dvhart@infradead.org>,
        Daniel Dadap <ddadap@nvidia.com>,
        Aaron Plattner <aplattner@nvidia.com>
Subject: [PATCH v3] platform/x86: Add driver for ACPI WMAA EC-based backlight control
Date:   Tue, 24 Aug 2021 17:04:38 -0500
Message-ID: <20210824220437.14175-1-ddadap@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <877ae34b-dcbb-a0a4-7d76-d9d78d12fd00@redhat.com>
References: <877ae34b-dcbb-a0a4-7d76-d9d78d12fd00@redhat.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a19f472a-f9ef-47ec-c51b-08d9674bcc97
X-MS-TrafficTypeDiagnostic: MN2PR12MB3151:
X-Microsoft-Antispam-PRVS: <MN2PR12MB315113066A32C24BF737BA0BBCC59@MN2PR12MB3151.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:321;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r2S/onJ6w17MZ0vAU0gNbyZhSKkvPRvDuSUvODuCJDtxJWs780nsJXVVaSzcOfGZlcX47XSJr9hKNf+xWc3HB1Ivz+NTBwRUDFDw+52VJuZgne4cd/cipJ2R5OItIr4jAgpQcQ83icr8qe4lGDosZZeVgkTrM7JvBB32YsEdLgGXj24i2wwSSjk8r2UbTb3k3zAsp/7xC/+Xed1ADMzwnpIslEfxm79w+I+lsGizU04/k0pEdiWMJB3dmsDyy3ef1q7g68F9wioYm7KHcr0Kk1+Or7EXpamVTlXEt4+GzmIQsbNk+20cEonB+fO8gOivLvmOQjLYiMD0b1Za28t+k6+sWf2vWoNfjJdaBM/SM/KW8mHeq2/aG/IMYeizUcXaEtuIarrnCebA/fIDPlww4znel/Q0UYXVZwN5jBKsrkmUKPyHeHULf+l7ETh0WTUIcfLtDa6KtZbeEhsJhjHBJc6tQK9akc7R8HovrI4QdHtSJp9+i3r/6SVpe3tPa2MUGjyD4krdGKmd7SuAfsmaYu9kt+VunKjmEhpzEfCfu7jPss2yOzER2EiNku3wqL8znqLLwkauuWY40aU2IbaCdCRW0XV9+gRtdZ27LUEXLSGSYp2xvWAKznMnXonOQPGhQ5P+QeFoGVzCM92A6NP8Ks59vwpcRY5iqPTJ5IpeS3Q77dKiONBbrvQ2CLPVqI50
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(396003)(376002)(136003)(36840700001)(83380400001)(2616005)(36860700001)(2906002)(45080400002)(26005)(16526019)(66574015)(478600001)(36756003)(32650700002)(1076003)(336012)(70586007)(426003)(186003)(7696005)(82310400003)(316002)(5660300002)(356005)(4326008)(8936002)(54906003)(7636003)(6666004)(70206006)(107886003)(82740400003)(8676002)(110136005)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 22:09:10.0913
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a19f472a-f9ef-47ec-c51b-08d9674bcc97
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3151
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

A number of upcoming notebook computer designs drive the internal
display panel's backlight PWM through the Embedded Controller (EC).
This EC-based backlight control can be plumbed through to an ACPI
"WMAA" method interface, which in turn can be wrapped by WMI with
the GUID handle 603E9613-EF25-4338-A3D0-C46177516DB7.

Add a new driver, aliased to the WMAA WMI GUID, to expose a sysfs
backlight class driver to control backlight levels on systems with
EC-driven backlights.

Signed-off-by: Aaron Plattner <aplattner@nvidia.com>
Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
---

v2: Convert to WMI subsystem driver, suggested by Mario Limonciello
    <mario.limonciello@outlook.com>; various cleanups suggested by
    Barnabás Pőcze <pobrn@protonmail.com>
v3: Address assorted style nits raised by Andy Shevchenko
    <andy.shevchenko@gmail.com> in response to a related patch; remove
    additional behavior change to WMI subsystem from patch series as
    recommended by Hans de Goede <hdegoede@redhat.com>

 MAINTAINERS                               |   6 +
 drivers/platform/x86/Kconfig              |  10 ++
 drivers/platform/x86/Makefile             |   1 +
 drivers/platform/x86/wmaa-backlight-wmi.c | 184 ++++++++++++++++++++++
 4 files changed, 201 insertions(+)
 create mode 100644 drivers/platform/x86/wmaa-backlight-wmi.c

diff --git a/MAINTAINERS b/MAINTAINERS
index bbaecde94aa0..fd7362a86c6d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20008,6 +20008,12 @@ L:	linux-wireless@vger.kernel.org
 S:	Odd fixes
 F:	drivers/net/wireless/wl3501*
 
+WMAA BACKLIGHT DRIVER
+M:	Daniel Dadap <ddadap@nvidia.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Supported
+F:	drivers/platform/x86/wmaa-backlight-wmi.c
+
 WOLFSON MICROELECTRONICS DRIVERS
 L:	patches@opensource.cirrus.com
 S:	Supported
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index d12db6c316ea..e54449c16d03 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -113,6 +113,16 @@ config PEAQ_WMI
 	help
 	 Say Y here if you want to support WMI-based hotkeys on PEAQ 2-in-1s.
 
+config WMAA_BACKLIGHT_WMI
+	tristate "ACPI WMAA Backlight Driver"
+	depends on ACPI_WMI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  This driver provides a sysfs backlight interface for notebook
+	  systems which expose the WMAA ACPI method and an associated WMI
+	  wrapper to drive LCD backlight levels through the system's
+	  Embedded Controller.
+
 config XIAOMI_WMI
 	tristate "Xiaomi WMI key driver"
 	depends on ACPI_WMI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 7ee369aab10d..109c1714237d 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_INTEL_WMI_SBL_FW_UPDATE)	+= intel-wmi-sbl-fw-update.o
 obj-$(CONFIG_INTEL_WMI_THUNDERBOLT)	+= intel-wmi-thunderbolt.o
 obj-$(CONFIG_MXM_WMI)			+= mxm-wmi.o
 obj-$(CONFIG_PEAQ_WMI)			+= peaq-wmi.o
+obj-$(CONFIG_WMAA_BACKLIGHT_WMI)	+= wmaa-backlight-wmi.o
 obj-$(CONFIG_XIAOMI_WMI)		+= xiaomi-wmi.o
 obj-$(CONFIG_GIGABYTE_WMI)		+= gigabyte-wmi.o
 
diff --git a/drivers/platform/x86/wmaa-backlight-wmi.c b/drivers/platform/x86/wmaa-backlight-wmi.c
new file mode 100644
index 000000000000..b607d3f88fc2
--- /dev/null
+++ b/drivers/platform/x86/wmaa-backlight-wmi.c
@@ -0,0 +1,184 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2020, NVIDIA CORPORATION.  All rights reserved.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/acpi.h>
+#include <linux/backlight.h>
+#include <linux/module.h>
+#include <linux/wmi.h>
+
+#define WMAA_WMI_GUID "603E9613-EF25-4338-A3D0-C46177516DB7"
+
+struct wmi_wmaa_priv {
+	struct backlight_device *backlight;
+};
+
+enum wmaa_method {
+	WMAA_BRIGHTNESS_LEVEL = 1,
+	WMAA_BRIGHTNESS_SOURCE = 2,
+};
+
+enum wmaa_get_or_set {
+	WMAA_GET = 0,
+	WMAA_SET = 1,
+	WMAA_GET_MAX = 2, // for WMAA_BRIGHTNESS_LEVEL only
+};
+
+enum wmaa_source {
+	WMAA_SOURCE_CLEAR = 0,
+	WMAA_SOURCE_GPU = 1,
+	WMAA_SOURCE_EC = 2,
+	WMAA_SOURCE_AUX = 3,
+	WMAA_SOURCE_COUNT
+};
+
+struct wmaa_args {
+	u32 set;
+	u32 val;
+	u32 ret;
+	u32 ignored[3];
+};
+
+static const struct wmi_device_id wmaa_backlight_wmi_id_table[] = {
+	{ .guid_string = WMAA_WMI_GUID },
+	{ },
+};
+
+static struct wmi_device *wdev;
+
+static int wmi_call_wmaa(enum wmaa_method method, enum wmaa_get_or_set set, u32 *val)
+{
+	struct wmaa_args args = {
+		.set = set,
+		.val = 0,
+		.ret = 0,
+	};
+	struct acpi_buffer buf = { (acpi_size)sizeof(args), &args };
+	acpi_status status;
+
+	if (set == WMAA_SET)
+		args.val = *val;
+
+	status = wmidev_evaluate_method(wdev, 0, method, &buf, &buf);
+	if (ACPI_FAILURE(status)) {
+		pr_err("ACPI WMAA failed with %s\n", acpi_format_exception(status));
+		return -EIO;
+	}
+
+	if (set != WMAA_SET)
+		*val = args.ret;
+
+	return 0;
+}
+
+static int wmaa_get_brightness(u32 *level)
+{
+	return wmi_call_wmaa(WMAA_BRIGHTNESS_LEVEL, WMAA_GET, level);
+}
+
+static int wmaa_set_brightness(u32 level)
+{
+	return wmi_call_wmaa(WMAA_BRIGHTNESS_LEVEL, WMAA_SET, &level);
+}
+
+static int wmaa_backlight_update_status(struct backlight_device *bd)
+{
+	return wmaa_set_brightness(bd->props.brightness);
+}
+
+static int wmaa_backlight_get_brightness(struct backlight_device *bd)
+{
+	u32 level;
+	int ret;
+
+	ret = wmaa_get_brightness(&level);
+
+	WARN_ON(ret != 0);
+	return ret == 0 ? level : 0;
+}
+
+static const struct backlight_ops wmaa_backlight_ops = {
+	.update_status = wmaa_backlight_update_status,
+	.get_brightness = wmaa_backlight_get_brightness,
+};
+
+static int wmaa_get_max_brightness(u32 *level)
+{
+	return wmi_call_wmaa(WMAA_BRIGHTNESS_LEVEL, WMAA_GET_MAX, level);
+}
+
+static int wmaa_get_brightness_source(u32 *source)
+{
+	return wmi_call_wmaa(WMAA_BRIGHTNESS_SOURCE, WMAA_GET, source);
+}
+
+static int wmaa_backlight_wmi_probe(struct wmi_device *w, const void *ctx)
+{
+	struct backlight_properties props = {0};
+	struct wmi_wmaa_priv *priv;
+	u32 source;
+	int ret;
+
+	priv = devm_kmalloc(&w->dev, sizeof(*priv), GFP_KERNEL);
+	if(!priv)
+		return -ENOMEM;
+
+	wdev = w;
+
+	ret = wmaa_get_brightness_source(&source);
+	if (ret)
+		goto done;
+
+	if (source != WMAA_SOURCE_EC) {
+		ret = -ENODEV;
+		goto done;
+	}
+
+	// Register a backlight handler
+	props.type = BACKLIGHT_PLATFORM;
+	ret = wmaa_get_max_brightness(&props.max_brightness);
+	if (ret)
+		goto done;
+
+	ret = wmaa_get_brightness(&props.brightness);
+	if (ret)
+		goto done;
+
+	priv->backlight = backlight_device_register("wmaa_backlight",
+		NULL, NULL, &wmaa_backlight_ops, &props);
+	if (IS_ERR(priv->backlight))
+		return PTR_ERR(priv->backlight);
+
+	dev_set_drvdata(&w->dev, priv);
+
+done:
+	return ret;
+}
+
+static void wmaa_backlight_wmi_remove(struct wmi_device *wdev)
+{
+	struct wmi_wmaa_priv *priv = dev_get_drvdata(&wdev->dev);
+
+	backlight_device_unregister(priv->backlight);
+}
+
+static struct wmi_driver wmaa_backlight_wmi_driver = {
+	.driver = {
+		.name = "wmaa-backlight",
+	},
+	.probe = wmaa_backlight_wmi_probe,
+	.remove = wmaa_backlight_wmi_remove,
+	.id_table = wmaa_backlight_wmi_id_table,
+};
+
+module_wmi_driver(wmaa_backlight_wmi_driver);
+
+MODULE_AUTHOR("Aaron Plattner <aplattner@nvidia.com>");
+MODULE_AUTHOR("Daniel Dadap <ddadap@nvidia.com>");
+MODULE_DESCRIPTION("WMAA Backlight WMI driver");
+MODULE_LICENSE("GPL v2");
+
+MODULE_ALIAS("wmi:"WMAA_WMI_GUID);
-- 
2.20.1


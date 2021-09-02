Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB61CC433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Sep 2021 21:47:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A516B610A0
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Sep 2021 21:47:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347467AbhIBVss (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Sep 2021 17:48:48 -0400
Received: from mail-bn8nam11on2053.outbound.protection.outlook.com ([40.107.236.53]:2529
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1347352AbhIBVss (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Sep 2021 17:48:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mLQ5IzVpnZzP6PMrFHqqoQmA2hACh4E+dFoaqf9QNbY1Y5a7gLkY2bPO0BlIqh4Fsd3D+MbvIgf66JyyPfQJcMx9FPt4BqPThre3AUebp9vSspyVR5f437dltaEeihiWL8TS2+2ixTcojIoqe9kxzREaCAscKmTgq6rgauqH6iryT84oR/7N291+0xLl9axu/YTa+Ve2ZpomBRppqxBUvDnTa6M9C0DrjddV83kizg9+Lywy+UXo3y+/iECs19mrlnZebpNBZCuMDNmvnFF5yrHlkUx//S5unWkSp/o7pZYxTHZGQxUXCoWbGpDuPmmIdyEPJbTq9ApymMpYT1OMkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=N0l8rZh4KkaYrfPb4CWf/9w+icQ/+sQiio3BSusaGo4=;
 b=fMfLoBHinAaVWTM7lHi2uOPoeuVOo1fM+pwnvHcBKrm/f6g/TxxUirxfr/xix+KH+Yu7aka6ExVyIw9HmLjhSJjZCXlKHAp2yW5XtPK/AByoa0AFAM28xa5mgpxkFn4cp6eUmjEAmYYL1f1ZN7YYNQK/YfgruDacytxKQ1XGkheh7T2O7WcPsPMi/ZN3nBc+V8cACn/rmCjcTFoFDvHYq2OA2LufH4Ss5zcF76p6xMOp4di2fO7i+nqNzjBJyEdzKTTWr5OiVpcbGnE44ja+eM8NdZwvoVYAlDs1UddtpSGIh+wAGzFqxEhtG7k490Q9p7Ym7LLxiBdfVFHEMS1hfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N0l8rZh4KkaYrfPb4CWf/9w+icQ/+sQiio3BSusaGo4=;
 b=lP4ArjzLuvGyWqzKR5Ft9ULXTK/R8Bmdxkzckfx/xICQAnGiCEwHG9kznz12Ksj8P3PujHaPGTp/W3NZ6M0IoTJ1DY/YhCOBI55O8S2CtCBqZr4tbSgollZxQrIfWWs78+YnUWrOGsJ9l9mjaI4vyMWdvKxhvqIsVZIOoEc4u3fRX/WGVSvYBtdbjpGQLubEMvf++CyCnx8BXJxj8TAK+47xwB6jBNpV7dSgPntsMZnHRpG7okeoHuHCYS6jHQwqxbuPbeNjo/WLg0DhIvqf0wvhA8P45pQBMe424QzTXzq73eS/1YwoGD2s4GfTTdyiKn7WZ9A236BvgqKSHHLXlw==
Received: from DM6PR03CA0063.namprd03.prod.outlook.com (2603:10b6:5:100::40)
 by BY5PR12MB3699.namprd12.prod.outlook.com (2603:10b6:a03:195::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Thu, 2 Sep
 2021 21:47:47 +0000
Received: from DM6NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:100:cafe::1) by DM6PR03CA0063.outlook.office365.com
 (2603:10b6:5:100::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Thu, 2 Sep 2021 21:47:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT030.mail.protection.outlook.com (10.13.172.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 21:47:46 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 2 Sep
 2021 21:47:32 +0000
Received: from dude.nvidia.com (172.20.187.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 2 Sep 2021
 21:47:31 +0000
From:   Daniel Dadap <ddadap@nvidia.com>
To:     <platform-driver-x86@vger.kernel.org>
CC:     <mario.limonciello@outlook.com>, <pobrn@protonmail.com>,
        <andy.shevchenko@gmail.com>, <hdegoede@redhat.com>,
        <aplattner@nvidia.com>, Daniel Dadap <ddadap@nvidia.com>,
        =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v5] platform/x86: Add driver for ACPI WMAA EC-based backlight control
Date:   Thu, 2 Sep 2021 16:47:18 -0500
Message-ID: <20210902214718.13628-1-ddadap@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <f4802d28-3674-bbc3-0377-52d3d03af4fe@redhat.com>
References: <f4802d28-3674-bbc3-0377-52d3d03af4fe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80706fd6-5264-4ffa-363a-08d96e5b4d43
X-MS-TrafficTypeDiagnostic: BY5PR12MB3699:
X-Microsoft-Antispam-PRVS: <BY5PR12MB3699DAD8D011340FDD8A4FB7BCCE9@BY5PR12MB3699.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:357;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Am1DvY+ZkuqtIFn8o0yDMA1342rNhbJptfck/DowDVN8z2zOIobFneYXRKwSmJEQvr6RDfhn6A7F46QtFXey5aAixht/gY898h89iK51VrVZIs8n8RoWbjzObK9QwUsaqHWLgm+SxgsqItuZzi2FGTKwqUQigvlytkAeicMzZxBBXp+4i/IN4/5SdiXLf6xyZcMDUzwko0x6eKAd3gsCSes8iGKdathJ32ow/CH0CZo8v8ZaqRyHCLctX83QQYL+V2Z8Q5is8iSLWv4VHlAVyZXUKtoDS/vsHH8CE/zNrsV/MiRDJkomuzhEg+VfFAjTcKlgiTB+pqOIYXZR1IdTBKVioQ9G8UUNYEKcVzk+1KnOO/3dg/9CzzPfHp8V9fg4aCtI1QmE2MiaVmnxvoYBV+8RO2aT8jJ2A53M57MY9xjENTueO55LAlBPTrWL6KN8JcOUpYViGX1Jv2GWfCKfp0diySIWbgatND8faoDGc9/PBF86vsYVWfkKGcwn4pBGyVoYFBHY0mjJ7LuP8UFxi5Hds55rfCMHX12Zjb1eCuzCfSdEyO4fb2p6l+v3/A8vb9MSAAg5XQkdtJF6VHfaI0H947grI+LBltTJA2iYLmrR40TQi+y54S+shCLr3QdpR8ksq6vJa+JEd7Ibcs21sx8jUksS3gA1yT1b2EAmMUFnZTGAjKoM+DRjFx0IeGMj
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(396003)(346002)(39860400002)(136003)(376002)(36840700001)(83380400001)(36906005)(1076003)(186003)(8676002)(7696005)(316002)(426003)(2906002)(336012)(16526019)(70206006)(2616005)(6916009)(86362001)(7636003)(36860700001)(5660300002)(6666004)(70586007)(4326008)(356005)(8936002)(26005)(478600001)(45080400002)(54906003)(82740400003)(82310400003)(32650700002)(36756003)(66574015);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 21:47:46.5836
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80706fd6-5264-4ffa-363a-08d96e5b4d43
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3699
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

Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
Reviewed-By: Thomas Weißschuh <linux@weissschuh.net>
---

v2: Convert to WMI subsystem driver, suggested by Mario Limonciello
    <mario.limonciello@outlook.com>; various cleanups suggested by
    Barnabás Pőcze <pobrn@protonmail.com>
v3: Address assorted style nits raised by Andy Shevchenko
    <andy.shevchenko@gmail.com> in response to a related patch; remove
    additional behavior change to WMI subsystem from patch series as
    recommended by Hans de Goede <hdegoede@redhat.com> 
v4: Use MODULE_DEVICE_TABLE() (Thomas Weißschuh <thomas@t-8ch.de>)
    Fix scope of internal driver state; various style fixes (Barnabás
    Pőcze, Andy Shevchenko)
    Use devm_backlight_device_register() (Barnabás Pőcze)
    Add kerneldoc comments for enums and structs (Andy Shevchenko)
v5: Remove Aaron Plattner as author, as suggested by Aaron Plattner
    <aplattner@nvidia.com>
    Register as BACKLIGHT_FIRMWARE rather than BACKLIGHT_PLATFORM;
    Return negative errno if .get_brightness() fails (Thomas Weißschuh)
    Assorted style improvements (Andy Shevchenko, Thomas Weißschuh)
 MAINTAINERS                               |   6 +
 drivers/platform/x86/Kconfig              |  16 ++
 drivers/platform/x86/Makefile             |   1 +
 drivers/platform/x86/wmaa-backlight-wmi.c | 194 ++++++++++++++++++++++
 4 files changed, 217 insertions(+)
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
index d12db6c316ea..0df908ef8d7c 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -113,6 +113,22 @@ config PEAQ_WMI
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
+	  Embedded Controller (EC).
+
+	  Say Y or M here if you want to control the backlight on a notebook
+	  system with an EC-driven backlight using the ACPI WMAA method.
+
+	  If you choose to compile this driver as a module the module will be
+	  called wmaa-backlight-wmi.
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
index 000000000000..fa3f41302299
--- /dev/null
+++ b/drivers/platform/x86/wmaa-backlight-wmi.c
@@ -0,0 +1,194 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2020, NVIDIA CORPORATION.  All rights reserved.
+ */
+
+#include <linux/acpi.h>
+#include <linux/backlight.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/wmi.h>
+
+/**
+ * enum wmaa_method - WMI method IDs for ACPI WMAA
+ * @WMAA_METHOD_LEVEL:  Get or set the brightness level,
+ *                      or get the maximum brightness level.
+ * @WMAA_METHOD_SOURCE: Get the source for backlight control.
+ */
+enum wmaa_method {
+	WMAA_METHOD_LEVEL = 1,
+	WMAA_METHOD_SOURCE = 2,
+	WMAA_METHOD_MAX
+};
+
+/**
+ * enum wmaa_mode - Operation mode for ACPI WMAA method
+ * @WMAA_MODE_GET:           Get the current brightness level or source.
+ * @WMAA_MODE_SET:           Set the brightness level.
+ * @WMAA_MODE_GET_MAX_LEVEL: Get the maximum brightness level. This is only
+ *                           valid when the WMI method is %WMAA_METHOD_LEVEL.
+ */
+enum wmaa_mode {
+	WMAA_MODE_GET = 0,
+	WMAA_MODE_SET = 1,
+	WMAA_MODE_GET_MAX_LEVEL = 2,
+	WMAA_MODE_MAX
+};
+
+/**
+ * enum wmaa_source - Backlight brightness control source identification
+ * @WMAA_SOURCE_GPU:   Backlight brightness is controlled by the GPU.
+ * @WMAA_SOURCE_EC:    Backlight brightness is controlled by the system's
+ *                     Embedded Controller (EC).
+ * @WMAA_SOURCE_AUX:   Backlight brightness is controlled over the DisplayPort
+ *                     AUX channel.
+ */
+enum wmaa_source {
+	WMAA_SOURCE_GPU = 1,
+	WMAA_SOURCE_EC = 2,
+	WMAA_SOURCE_AUX = 3,
+	WMAA_SOURCE_MAX
+};
+
+/**
+ * struct wmaa_args - arguments for the ACPI WMAA method
+ * @mode:    Pass in an &enum wmaa_mode value to select between getting or
+ *           setting a value.
+ * @val:     In parameter for value to set when operating in %WMAA_MODE_SET
+ *           mode. Not used in %WMAA_MODE_GET or %WMAA_MODE_GET_MAX_LEVEL mode.
+ * @ret:     Out parameter returning retrieved value when operating in
+ *           %WMAA_MODE_GET or %WMAA_MODE_GET_MAX_LEVEL mode. Not used in
+ *           %WMAA_MODE_SET mode.
+ * @ignored: Padding; not used. The ACPI method expects a 24 byte params struct.
+ *
+ * This is the parameters structure for the ACPI WMAA method as wrapped by WMI.
+ * The value passed in to @val or returned by @ret will be a brightness value
+ * when the WMI method ID is %WMAA_METHOD_LEVEL, or an &enum wmaa_source value
+ * when the WMI method ID is %WMAA_METHOD_SOURCE.
+ */
+struct wmaa_args {
+	u32 mode;
+	u32 val;
+	u32 ret;
+	u32 ignored[3];
+};
+
+static int wmi_call_wmaa(struct wmi_device *w, enum wmaa_method id, enum wmaa_mode mode, u32 *val)
+{
+	struct wmaa_args args = {
+		.mode = mode,
+		.val = 0,
+		.ret = 0,
+	};
+	struct acpi_buffer buf = { (acpi_size)sizeof(args), &args };
+	acpi_status status;
+
+	if (id < WMAA_METHOD_LEVEL || id >= WMAA_METHOD_MAX ||
+	    mode < WMAA_MODE_GET || mode >= WMAA_MODE_MAX)
+		return -EINVAL;
+
+	if (mode == WMAA_MODE_SET)
+		args.val = *val;
+
+	status = wmidev_evaluate_method(w, 0, id, &buf, &buf);
+	if (ACPI_FAILURE(status)) {
+		dev_err(&w->dev, "ACPI WMAA failed: %s\n",
+			acpi_format_exception(status));
+		return -EIO;
+	}
+
+	if (mode != WMAA_MODE_SET)
+		*val = args.ret;
+
+	return 0;
+}
+
+static int wmaa_backlight_update_status(struct backlight_device *bd)
+{
+	struct wmi_device *wdev = bl_get_data(bd);
+
+	return wmi_call_wmaa(wdev, WMAA_METHOD_LEVEL, WMAA_MODE_SET,
+			     &bd->props.brightness);
+}
+
+static int wmaa_backlight_get_brightness(struct backlight_device *bd)
+{
+	struct wmi_device *wdev = bl_get_data(bd);
+	u32 level;
+	int ret;
+
+	ret = wmi_call_wmaa(wdev, WMAA_METHOD_LEVEL, WMAA_MODE_GET, &level);
+	if (ret > 0)
+		return -EINVAL;
+	else if (ret < 0)
+		return ret;
+
+	return level;
+}
+
+static const struct backlight_ops wmaa_backlight_ops = {
+	.update_status = wmaa_backlight_update_status,
+	.get_brightness = wmaa_backlight_get_brightness,
+};
+
+static int wmaa_backlight_wmi_probe(struct wmi_device *wdev, const void *ctx)
+{
+	struct backlight_properties props = {};
+	struct backlight_device *bdev;
+	u32 source;
+	int ret;
+
+	ret = wmi_call_wmaa(wdev, WMAA_METHOD_SOURCE, WMAA_MODE_GET, &source);
+	if (ret)
+		return ret;
+
+	/*
+	 * This driver is only to be used when brightness control is handled
+	 * by the EC; otherwise, the GPU driver(s) should control brightness.
+	 */
+	if (source != WMAA_SOURCE_EC)
+		return -ENODEV;
+
+	/*
+	 * Identify this backlight device as a firmware device so that it can
+	 * be prioritized over any exposed GPU-driven raw device(s).
+	 */
+	props.type = BACKLIGHT_FIRMWARE;
+
+	ret = wmi_call_wmaa(wdev, WMAA_METHOD_LEVEL, WMAA_MODE_GET_MAX_LEVEL,
+			    &props.max_brightness);
+	if (ret)
+		return ret;
+
+	ret = wmi_call_wmaa(wdev, WMAA_METHOD_LEVEL, WMAA_MODE_GET,
+			    &props.brightness);
+	if (ret)
+		return ret;
+
+	bdev = devm_backlight_device_register(&wdev->dev, "wmaa_backlight",
+					      &wdev->dev, wdev,
+					      &wmaa_backlight_ops, &props);
+	return PTR_ERR_OR_ZERO(bdev);
+}
+
+#define WMAA_WMI_GUID "603E9613-EF25-4338-A3D0-C46177516DB7"
+
+static const struct wmi_device_id wmaa_backlight_wmi_id_table[] = {
+	{ .guid_string = WMAA_WMI_GUID },
+	{ }
+};
+MODULE_DEVICE_TABLE(wmi, wmaa_backlight_wmi_id_table);
+
+static struct wmi_driver wmaa_backlight_wmi_driver = {
+	.driver = {
+		.name = "wmaa-backlight",
+	},
+	.probe = wmaa_backlight_wmi_probe,
+	.id_table = wmaa_backlight_wmi_id_table,
+};
+module_wmi_driver(wmaa_backlight_wmi_driver);
+
+MODULE_AUTHOR("Daniel Dadap <ddadap@nvidia.com>");
+MODULE_DESCRIPTION("WMAA Backlight WMI driver");
+MODULE_LICENSE("GPL");
-- 
2.20.1


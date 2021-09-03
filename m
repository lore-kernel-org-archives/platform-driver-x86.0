Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6E44C433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri,  3 Sep 2021 00:42:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE8F360FD7
	for <platform-driver-x86@archiver.kernel.org>; Fri,  3 Sep 2021 00:42:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234595AbhICAnO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Sep 2021 20:43:14 -0400
Received: from mail-bn8nam11on2087.outbound.protection.outlook.com ([40.107.236.87]:51937
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234566AbhICAnN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Sep 2021 20:43:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CewtaiauNosIUi0PTq8lYArgGoUAX0Ab+w7QlDQ10pFVF+CV3GkjmB1ygBA8kQaM/wSsYBCGj49KTv0oFAFDupm6Ir9za1Hp2Z6X5HcSZCFhaMMqoVSCSudB13uD7OhyYVHOflT8q8EGpMApOg/xPE26m8VbGmA4isxQv5H2AaL5iusA5mNd2cREDZKMPjGByubCAHtpKrYJyGnZhypqKN2UVHoALrvn0LsZuZ1UySPNgTEmdaokENO1w6FJoDOqSWLWKCfUcRxVaRXSln8CGati2+DmN4L7EI5JHC12GP60PxItrgGQodnwQh836LawufK6r3JO9iLEVVj1GUfV9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=UDCsuzwvKE19mVeIm7tSigNt331We6crCqnE6AQAm9I=;
 b=Ydtc95xfUZLHuY6kbxk73/7E8aFfK8LUdXIPG2D/gY57fX5A9flJVIwQiuOGXBiXRaURwGiVvDyJGljWgEQA+Oko1BEf4UiF7r2Kmyj6TV5q5GVu7t7tfB1wScuJMNNMYjJ240UXDmccLafz/b6aQp/uYEES/u4gn/pCFLu6ZTdVsZGomE6Vl1HppuidevwpafeWE9VygL74m3MeGpQ69S2T4Zey72dlg3ZTl8+36ZxHCcVYTKtNeI5IOlbEsPC1V3uhT5WqLiR657o5dADydvw0Ade6/8zkvbw5ceOD8Vs/Qk5wFjFSZeG5fbS2NEu2FOUx8ww1uNyiTDIABXTWtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UDCsuzwvKE19mVeIm7tSigNt331We6crCqnE6AQAm9I=;
 b=Bzv0lg+zgVztHCn7NVZLw53L/nr5WPFq/C//nuhexYIdTS+vhEt5iGbiuPlbVbGIC0qv4K4Z1xDidzbzvWuXkevTvrf/k5u3SZRH+NkjjPtXUwvDiDJ1OOnEF3mLVkfL2Ayqf4m+rY8ul5QXKZjy9whsMD5QEMt7BrkTmkG6AiPpiE1featQcWE7fWw8nhkbuFM8pk6Vd0yXydR+98ii6pDrAgnkZbB5zJQekxQb34t6yTOBlMKMkLgwJruZnWx+0tTYp0V3Ndw/57kt9mZO+1yQvFRU087qX+UHj4+ZYpb0VN59DRF8KPbruFrs1AfFpe3xlmuvjGk/dVSaOvgHMw==
Received: from DS7PR03CA0296.namprd03.prod.outlook.com (2603:10b6:5:3ad::31)
 by MWHPR12MB1455.namprd12.prod.outlook.com (2603:10b6:301:10::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Fri, 3 Sep
 2021 00:42:12 +0000
Received: from DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ad:cafe::62) by DS7PR03CA0296.outlook.office365.com
 (2603:10b6:5:3ad::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20 via Frontend
 Transport; Fri, 3 Sep 2021 00:42:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT068.mail.protection.outlook.com (10.13.173.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4478.19 via Frontend Transport; Fri, 3 Sep 2021 00:42:11 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 3 Sep
 2021 00:42:11 +0000
Received: from dude.nvidia.com (172.20.187.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 3 Sep 2021
 00:42:10 +0000
From:   Daniel Dadap <ddadap@nvidia.com>
To:     <platform-driver-x86@vger.kernel.org>
CC:     <mario.limonciello@outlook.com>, <pobrn@protonmail.com>,
        <andy.shevchenko@gmail.com>, <hdegoede@redhat.com>,
        <aplattner@nvidia.com>, Daniel Dadap <ddadap@nvidia.com>,
        =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v6] platform/x86: Add driver for ACPI WMAA EC-based backlight control
Date:   Thu, 2 Sep 2021 19:38:39 -0500
Message-ID: <20210903003838.15797-1-ddadap@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <e63904b7-105b-4401-bd40-82854b7d42d1@t-8ch.de>
References: <e63904b7-105b-4401-bd40-82854b7d42d1@t-8ch.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c176e5f4-e42f-4da6-f0eb-08d96e73ab25
X-MS-TrafficTypeDiagnostic: MWHPR12MB1455:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1455545F597D943D2EF1C82BBCCF9@MWHPR12MB1455.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:357;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rE8TwMSfr9J6Xor7KsgzbbNoFiJWEDNdyzXyklb8qufdDmA/huIeAlblyQvexWorynIsnNa5MoyptSYsyOjiW4eKwhpex2UQkMA6bIqH/U0PEGZovep/7ctr86N0Al8PVbqvdDkvOfJBK+Fkiwgbg70xU/lo1K5SzZsamqDwwCOKNQJhgKOt2f/egAPD3KOaJ+TCuKS0w/gKsUsseI1BZ9ZdrS1qXNpMP84ubmlxcdSoKLW8fdKVzFYnB2o/YbdXyaX6wBPIKuK2RgGGyfuWb7It7deH8zVnuDpQCY2gpy+ao5MIj7uh7bEqHpBccI7vF9aJKgXk7k7nL+f9bWE8mZ17Ivvko9g0oonCkyGzO5qttAI1JjgAVE+/NISHQ3hkf2eCQTNJKrpyqbG4qpQN4kXR7LKuEtylfnteaPW4n5loHCCdOD4XzuxaFR28QbNu3j6FgKVpR37gDioWSU7B/KGXPsqRai64IfKFzulG7PMiGRAKZYfbdeDh9ysbCiTKLPOPEONtGGiABsS2hg/fCMudoZZN3pL3XT46rRWpTRhozoVA6FAxrrXcEJG9yUEBiJp1Nh1uL72ci7AXEq/tHBlKz5KUPOvvJTYYMSRBo+LUSocvEaJj+YScPAZ+vhV87+ZbUZfS/Vmxtn/a+8mFb9SbIaL8GYqSNeBKZaYupILHogkVXzHqlUUAfhNtEOki
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(136003)(396003)(36840700001)(426003)(7636003)(5660300002)(54906003)(70206006)(336012)(316002)(36906005)(7696005)(36756003)(36860700001)(83380400001)(478600001)(2616005)(82740400003)(30864003)(8936002)(66574015)(70586007)(45080400002)(186003)(82310400003)(26005)(8676002)(16526019)(2906002)(1076003)(4326008)(6666004)(356005)(86362001)(6916009)(32650700002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2021 00:42:11.9931
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c176e5f4-e42f-4da6-f0eb-08d96e73ab25
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1455
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
v6: Make behavior of callers of wmi_call_wmaa() more consistent;
    simplify potentially confusing description in Kconfig help text
    (Thomas Weißschuh)

 MAINTAINERS                               |   6 +
 drivers/platform/x86/Kconfig              |  16 ++
 drivers/platform/x86/Makefile             |   1 +
 drivers/platform/x86/wmaa-backlight-wmi.c | 205 ++++++++++++++++++++++
 4 files changed, 228 insertions(+)
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
index d12db6c316ea..00f021eda25c 100644
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
+	  wrapper to drive LCD backlight levels through the Embedded Controller
+	  (EC).
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
index 000000000000..f5c4f8337c2c
--- /dev/null
+++ b/drivers/platform/x86/wmaa-backlight-wmi.c
@@ -0,0 +1,205 @@
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
+/**
+ * wmi_call_wmaa() - helper function for calling ACPI WMAA via its WMI wrapper
+ * @w:    Pointer to the struct wmi_device identified by %WMAA_WMI_GUID
+ * @id:   The method ID for the ACPI WMAA method (e.g. %WMAA_METHOD_LEVEL or
+ *        %WMAA_METHOD_SOURCE)
+ * @mode: The operation to perform on the ACPI WMAA method (e.g. %WMAA_MODE_SET
+ *        or %WMAA_MODE_GET)
+ * @val:  Pointer to a value passed in by the caller when @mode is
+ *        %WMAA_MODE_SET, or a value passed out to the caller when @mode is
+ *        %WMAA_MODE_GET or %WMAA_MODE_GET_MAX_LEVEL.
+ *
+ * Returns 0 on success, or a negative error number on failure.
+ */
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
+	if (ret < 0)
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


Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE81C432BE
	for <platform-driver-x86@archiver.kernel.org>; Tue, 31 Aug 2021 23:27:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 17B1360F92
	for <platform-driver-x86@archiver.kernel.org>; Tue, 31 Aug 2021 23:27:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240843AbhHaX2m (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 31 Aug 2021 19:28:42 -0400
Received: from mail-dm6nam12on2056.outbound.protection.outlook.com ([40.107.243.56]:53569
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234343AbhHaX2l (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 31 Aug 2021 19:28:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c/V3eGJJeMejgAGoM1XDu3xXAxi9r4j6FQqjvUdTLtZpr8eBRl45OINwglh+4Ugww2rzal2kKO5cN0WHrU0rZev8JXEBdhiRBCYoApb2kRF9mXtARseVwwJM0BJXFmY4byZqBgN4QKFK+gm2QlCc5ieb9roiagM6NazdizHj8s1pf3YBDak9ATW/50HaJ4k3W48qxR8QtavpFejgXIQ30MI1+a87KtOsxeTbh8KdFuTWtEFFiYSom6umAus3bCRtwF2nllCniGbkcd4puUFzgs7dx9rcGP9M3MgOfv1EV+2ktR6TrZ4uUkRZUJd9LaJzAJysGfrcCSbqzn6MPWw6lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jiou1HDfWzNaKjv74ZtOHjuf1NJSMM+cv0agMl0EkSg=;
 b=jnTkntkTOz5QmDRO6AJ7Zx6UJbmSxitKDX+hlxUAvRvEQNY/EbNvDZ2Jkuzff3cuRESVNoA7SvKwUzPzwTTd7s/xvdVYVn/uzmQhmBw9b1di1PK9S1MCYcYcmmu/DEveOI0kWFdr9YcoVTc8LvB6Fm7RWNGS+dvdaAqZNu91HAE3BHLuv9pv4clezfOS1Vmo1GGvjmKifZ78D0wvAdA7XXxyFFycL4MFV7YVXk4m5LStFRF/6sjOv2OWuj2bXifxtSNBGs4wZX9fx51URaXgPYLhw60bsevvh7diqtI3KAnu3jk9SxmVpt1P57VCOV+gNPlA1tqQoOz26pX9Xet5Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jiou1HDfWzNaKjv74ZtOHjuf1NJSMM+cv0agMl0EkSg=;
 b=eBLSgWQ+oDBzTYG1xYu8PhXpjNJyp8pNSn0s2O4NICdjtO6/lM4GOunlvOgNAuPn21b0kcjp8KFemntJVA7cuqfhNbriohkguHDoNxMJYNJGKyHGUODkbDumTbmhrg+ibjR8uzS/nC3YMZo95LALEtkz+8RKbIemwggqjaBtEsvFyAQ+PV77c5sDagtBZvw50ZCiUG7C0FekntUyGKhyNwed7CFoC+HDV42x6v2+0lgMYJWTUZotPx0ECwnvyRIaJ/wUn1y4aI7NMcyzlMg753RWNC9IHndoc+owvAzLuuATchZdz5P0I6Zah1NCnIJFob4GOVyw2LRxEVwHpfUH0Q==
Received: from BN6PR1101CA0019.namprd11.prod.outlook.com
 (2603:10b6:405:4a::29) by MWHPR12MB1438.namprd12.prod.outlook.com
 (2603:10b6:300:14::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Tue, 31 Aug
 2021 23:27:44 +0000
Received: from BN8NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:4a:cafe::eb) by BN6PR1101CA0019.outlook.office365.com
 (2603:10b6:405:4a::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Tue, 31 Aug 2021 23:27:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 BN8NAM11FT068.mail.protection.outlook.com (10.13.177.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4457.17 via Frontend Transport; Tue, 31 Aug 2021 23:27:43 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 31 Aug
 2021 23:27:42 +0000
Received: from dude.nvidia.com (172.20.187.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 31 Aug
 2021 23:27:41 +0000
From:   Daniel Dadap <ddadap@nvidia.com>
To:     <platform-driver-x86@vger.kernel.org>
CC:     <andy.shevchenko@gmail.com>, <hdegoede@redhat.com>,
        <mario.limonciello@outlook.com>, <pobrn@protonmail.com>,
        <dvhart@infradead.org>, <thomas@t-8ch.de>,
        Daniel Dadap <ddadap@nvidia.com>,
        Aaron Plattner <aplattner@nvidia.com>
Subject: [PATCH v4] platform/x86: Add driver for ACPI WMAA EC-based backlight control
Date:   Tue, 31 Aug 2021 17:49:07 -0500
Message-ID: <20210831224906.1072-1-ddadap@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <70b81e33-c769-4cb8-0bae-5ee10a209389@nvidia.com>
References: <70b81e33-c769-4cb8-0bae-5ee10a209389@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56837968-ee12-4248-2e37-08d96cd6ef09
X-MS-TrafficTypeDiagnostic: MWHPR12MB1438:
X-Microsoft-Antispam-PRVS: <MWHPR12MB143848DAE5E5248B7B90EDFFBCCC9@MWHPR12MB1438.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:238;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c1Jw0iIZq9plxfbNv1/0dg23UyCW4DSaZkOMnvBDDJo3a5/BPXxKeqOpuOsvIQL+YrNA1EiIFF2oFGkgyqJMed77i8Ma54YmNH1D53GVhGGAADqCqnad/cjMVxn5rFuX8KgYUWVM/7DDSsKwKPMhe/7y1y8+NUS14n4DIa507TkI3XVZLYca26W/HlG4U8drk89R6yVb0wMVaA1zNnccch9Kwh4JkHrqT+AoNleZLdUPG60VYl0uMLSFNCdObbjFsVs1I8lJfMhjR0aL2tqTILjqqC4sJ4xkyBTVT26UBcdMh3bQRoWhLOTXspofwMXIdftDyMncLnFfhjoRbDW7lJ70AlK5EhT231J8pz6AAZkooEUgoQklyuwAee5jKY7xSUHlc3SiliQtyf4WHHKSpfq1TZNDOwlhnWrnVMMGeacZz+LU3oOcV71ZZ8F9LWHO28aflgUjz38Wf919J1iL2o2eVnus8ia6luQOBuiMb0ovG6/5srYtA2fDs/Lj0bGNYlfEdQm6i0uS9zKCagPAdIwzJjdLVF8AnjWGt7N3tXpXXIVMh02820Nq9OtGH7wonfxQyfB2i26JCC0ozkloYph49voyrehoNdMJTPXeoQ+oDFgKpb3gNj/tdl3015EhUokLcsVfQ0hm9wGum5lLHbpNVvavuFstqSbHlipy0pOG9kBG2X9TlxKMcMLClRTR
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid02.nvidia.com;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(396003)(136003)(36840700001)(186003)(70586007)(7696005)(16526019)(45080400002)(36756003)(1076003)(6916009)(336012)(2906002)(4326008)(83380400001)(316002)(107886003)(8936002)(54906003)(32650700002)(7636003)(426003)(86362001)(6666004)(36906005)(478600001)(26005)(356005)(36860700001)(70206006)(8676002)(5660300002)(82740400003)(66574015)(82310400003)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 23:27:43.6584
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56837968-ee12-4248-2e37-08d96cd6ef09
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1438
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
v4: Use MODULE_DEVICE_TABLE() (Thomas Weißschuh <thomas@t-8ch.de>)
    Fix scope of internal driver state; various style fixes (Barnabás
    Pőcze, Andy Shevchenko)
    Use devm_backlight_device_register() (Barnabás Pőcze)
    Add kerneldoc comments for enums and structs (Andy Shevchenko)

 MAINTAINERS                               |   6 +
 drivers/platform/x86/Kconfig              |  16 ++
 drivers/platform/x86/Makefile             |   1 +
 drivers/platform/x86/wmaa-backlight-wmi.c | 185 ++++++++++++++++++++++
 4 files changed, 208 insertions(+)
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
index 000000000000..cb1a973803b1
--- /dev/null
+++ b/drivers/platform/x86/wmaa-backlight-wmi.c
@@ -0,0 +1,185 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2020, NVIDIA CORPORATION.  All rights reserved.
+ */
+
+#include <linux/backlight.h>
+#include <linux/module.h>
+#include <linux/wmi.h>
+
+/**
+ * enum wmaa_method - WMI method IDs for ACPI WMAA
+ *
+ * @WMAA_LEVEL:  Get or set the brightness level,
+ *               or get the maximum brightness level.
+ * @WMAA_SOURCE: Get the source for backlight control.
+ */
+enum wmaa_method {
+	WMAA_LEVEL = 1,
+	WMAA_SOURCE = 2,
+};
+
+/**
+ * enum wmaa_get_or_set - Operation mode for ACPI WMAA method
+ *
+ * @WMAA_GET:     Get the current brightness level or backlight source.
+ * @WMAA_SET:     Set the brightness level.
+ * @WMAA_GET_MAX: Get the maximum brightness level. This is only valid when the
+ *                WMI method is %WMAA_LEVEL.
+ */
+enum wmaa_get_or_set {
+	WMAA_GET = 0,
+	WMAA_SET = 1,
+	WMAA_GET_MAX = 2
+};
+
+/**
+ * enum wmaa_source - Backlight brightness control source identification
+ *
+ * @WMAA_SOURCE_GPU:   Backlight brightness is controlled by the GPU.
+ * @WMAA_SOURCE_EC:    Backlight brightness is controlled by the system's
+ *                     Embedded Controller (EC).
+ * @WMAA_SOURCE_AUX:   Backlight brightness is controlled over the DisplayPort
+ *                     AUX channel.
+ */
+enum wmaa_source {
+	WMAA_SOURCE_GPU = 1,
+	WMAA_SOURCE_EC = 2,
+	WMAA_SOURCE_AUX = 3
+};
+
+/**
+ * struct wmaa_args - arguments for the ACPI WMAA method
+ *
+ * @set:     Pass in an &enum wmaa_get_or_set value to select between getting or
+ *           setting a value.
+ * @val:     In parameter for value to set when operating in %WMAA_SET mode. Not
+ *           used in %WMAA_GET or %WMAA_GET_MAX mode.
+ * @ret:     Out parameter returning retrieved value when operating in %WMAA_GET
+ *           or %WMAA_GET_MAX mode. Not used in %WMAA_SET mode.
+ * @ignored: Padding; not used. The ACPI method expects a 24 byte params struct.
+ *
+ * This is the parameters structure for the ACPI WMAA method as wrapped by WMI.
+ * The value passed in to @val or returned by @ret will be a brightness value
+ * when the WMI method ID is %WMAA_LEVEL, or an &enum wmaa_source value when
+ * the WMI method ID is %WMAA_SOURCE.
+ */
+struct wmaa_args {
+	u32 set;
+	u32 val;
+	u32 ret;
+	u32 ignored[3];
+};
+
+static int wmi_call_wmaa(struct wmi_device *w, enum wmaa_method method, enum wmaa_get_or_set set, u32 *val)
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
+	status = wmidev_evaluate_method(w, 0, method, &buf, &buf);
+	if (ACPI_FAILURE(status)) {
+		dev_err(&w->dev, "ACPI WMAA failed with %s\n",
+			acpi_format_exception(status));
+		return -EIO;
+	}
+
+	if (set != WMAA_SET)
+		*val = args.ret;
+
+	return 0;
+}
+
+static int wmaa_backlight_update_status(struct backlight_device *bd)
+{
+	struct wmi_device *wdev = bl_get_data(bd);
+
+	return wmi_call_wmaa(wdev, WMAA_LEVEL, WMAA_SET, &bd->props.brightness);
+}
+
+static int wmaa_backlight_get_brightness(struct backlight_device *bd)
+{
+	struct wmi_device *wdev = bl_get_data(bd);
+	u32 level = 0;
+	int ret;
+
+	ret = wmi_call_wmaa(wdev, WMAA_LEVEL, WMAA_GET, &level);
+
+	if (ret)
+		dev_err(&bd->dev, "ACPI WMAA failed to get backlight level.\n");
+
+	return level;
+}
+
+static const struct backlight_ops wmaa_backlight_ops = {
+	.update_status = wmaa_backlight_update_status,
+	.get_brightness = wmaa_backlight_get_brightness
+};
+
+static int wmaa_backlight_wmi_probe(struct wmi_device *w, const void *ctx)
+{
+	struct backlight_properties props = {};
+	struct backlight_device *backlight;
+	u32 source;
+	int ret;
+
+	ret = wmi_call_wmaa(w, WMAA_SOURCE, WMAA_GET, &source);
+	if (ret)
+		return ret;
+
+	if (source != WMAA_SOURCE_EC) {
+		/* This driver is only to be used when brightness control is
+		 * handled by the EC; otherwise, the GPU driver(s) should handle
+		 * brightness control. */
+		return -ENODEV;
+	}
+
+	/* Identify this backlight device as a platform device so that it can
+	 * be prioritized over any exposed GPU-driven raw device(s). */
+	props.type = BACKLIGHT_PLATFORM;
+
+	ret = wmi_call_wmaa(w, WMAA_LEVEL, WMAA_GET_MAX, &props.max_brightness);
+	if (ret)
+		return ret;
+
+	ret = wmi_call_wmaa(w, WMAA_LEVEL, WMAA_GET, &props.brightness);
+	if (ret)
+		return ret;
+
+	backlight = devm_backlight_device_register(
+		&w->dev, "wmaa_backlight",
+		&w->dev, w, &wmaa_backlight_ops, &props);
+	if (IS_ERR(backlight))
+		return PTR_ERR(backlight);
+
+	return 0;
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
+		.name = "wmaa-backlight"
+	},
+	.probe = wmaa_backlight_wmi_probe,
+	.id_table = wmaa_backlight_wmi_id_table
+};
+module_wmi_driver(wmaa_backlight_wmi_driver);
+
+MODULE_AUTHOR("Aaron Plattner <aplattner@nvidia.com>");
+MODULE_AUTHOR("Daniel Dadap <ddadap@nvidia.com>");
+MODULE_DESCRIPTION("WMAA Backlight WMI driver");
+MODULE_LICENSE("GPL v2");
-- 
2.20.1


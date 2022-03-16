Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3535BC433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Mar 2022 01:25:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347579AbiCPB1C (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Mar 2022 21:27:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240434AbiCPB1B (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Mar 2022 21:27:01 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2078.outbound.protection.outlook.com [40.107.244.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9CD02BB25
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Mar 2022 18:25:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ge7/sL8lpn+xVQyRMVZxJTVcDheKQ8awB0WwzJmDGs+wdU51ZAzY6OxHg0UgiGRzEF/tgImtu+lDhDVBainaRjTNQtDeo9zz6uyJ1TBNlVj7fWdEzJxyD+wI7ut0lYbhskCbmkuxUdivbO2ceOKTOTYq4xHDQ+I0EnSCRNlOq90W6pNUx2lBgS1tJdY5cggHt22Mo9pRkbqHsHwyJ/S42XNIyr67DIIFbx9PnF3RWwNQRY2LCW8jrDhluhsAEUbhMC4K+Lk6u9WJ7EcuLb+jq4ZXN6OgEYzNZe4rpxLQpioVUs5Lcn7jjvtkJa+LW960lnl2sC86FUwc5C5tjP063g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nXeaClkRbYnADiyALlBpqZV8LeEAHCb7F7AJyRIB8f8=;
 b=jfx3z7IVhKXduzz6FokWRO81n74MfgB7Mujjyh7XcMi9mBj7zvwWQX09oWX5WH+UdMkSQpNUGr7fpcaVwAGcx/fAZze83mRYq41SLkWSVnDYzlbAHF1PHRgfN7nLT/QzWNoFfUxkUCjggyNgtrNJ1peYlKYZMK3DyB2UkXoURES38yCH3MVjUWcCdOP4Gh+sUN60H9KVu18SBVWr0IC3ANRewp4APH1aQ7Dq+9V5UjD4Mt1JLR3DGgAxSHGlPEfv+iWHE0GNxLuu6jGL5Bc/cEpX/0m1ufvnvVOUl6WhlfVRoPqXpWO8BiK4hb9ZsUZPq+6paQWZlKaD2jTdgSchJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=nvidia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nXeaClkRbYnADiyALlBpqZV8LeEAHCb7F7AJyRIB8f8=;
 b=ii6KlKH8Kj5IYT+JgQ/0it4uaxF2i5I0yfHyOLsxNg4XfiC0E8cvHDQaPx1h0vuVXiiPzmwKIiwMwCk1Twc7GZSlpGa/RNRGQZ0660pkR2+qt+3zpxbGTN7gD4bt578eqpn77IlbDJbIfU6VdzpGe+/Cgy2236tnE1ig2/52uy3Th7SyO8+ZwyzAd+k7CX7kXXFSMInnvyiVDs4IZ2fcg0YlJetZpTjKgkHw1wfgvwyPJq3Km9M1i97Q48fXwk9TGLzKVZjUDKF+c97KBFldwwtFqeKGGy32iQEn7V+iGbNlA0ypvpUNxb59dLQUMZ82nyFuF64nu6JoOm5vT34wYQ==
Received: from DM6PR07CA0107.namprd07.prod.outlook.com (2603:10b6:5:330::21)
 by BL0PR12MB5011.namprd12.prod.outlook.com (2603:10b6:208:1c9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Wed, 16 Mar
 2022 01:25:46 +0000
Received: from DM6NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:330:cafe::44) by DM6PR07CA0107.outlook.office365.com
 (2603:10b6:5:330::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26 via Frontend
 Transport; Wed, 16 Mar 2022 01:25:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.234) by
 DM6NAM11FT065.mail.protection.outlook.com (10.13.172.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5081.14 via Frontend Transport; Wed, 16 Mar 2022 01:25:45 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Wed, 16 Mar
 2022 01:25:45 +0000
Received: from lenny.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 15 Mar
 2022 18:25:44 -0700
From:   Daniel Dadap <ddadap@nvidia.com>
To:     <platform-driver-x86@vger.kernel.org>
CC:     Daniel Dadap <ddadap@nvidia.com>,
        Alexandru Dinu <alex.dinu07@gmail.com>
Subject: [PATCH] nvidia-wmi-ec-backlight: Add workarounds for confused firmware
Date:   Tue, 15 Mar 2022 20:25:16 -0500
Message-ID: <20220316012516.2233984-1-ddadap@nvidia.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb8be34f-39b8-450a-9cbf-08da06ebe559
X-MS-TrafficTypeDiagnostic: BL0PR12MB5011:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB5011A636AAC7C9DB16406122BC119@BL0PR12MB5011.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IjqQNa/xyEPQm50dwQIBZcQPrvGA2fgHhYRRouJj+77rYNjs7vhfbmGoQcXgXGeb1OF6sVoyWR21yaHWW+4IUFQBU/TxlfYz+i74i1JTBRDACJycgF1xcJYvhU8vKCJ70L+C7Ve0KjzANy+MKEkW6q7L5Qlz78KRGYgGemcneXa/pzBd9YMS7ZVM8cEsgaLU71DR5SmR/y7Ql0Gm+iKIGplMqXkHm4m5vqUpRDZMTh2xACwZLDiWc60RXusAUjjhLE9QbWWScH74QVddSFp+u1595tV3ad9sfcLHazojnDU7mcqmJZsP8DQLGJxABOz/V3CeXqPTkm4eyFYT0hwlIOy0Zw8tm0iztSrXeeSmRUM9rHa6a+VMPPu1qLg5QWD7d+z6uvTJ4OPtu3smbPYqAMNkG7rZIyGsCZoVJzjtk9M09Ig3Roa0Nl//gM5D7EUrypGH2P9+PBV4hXdnUdFzmOdHj3szFHmSujKVBe/lp9/MrC7rEmRJkX2zNAI1thP9n7fbZmo3fzPYngJBHZsfE/OVsvs9YbZZgaEJhSNE4VpNK+UsjqSLwJOGqxL0PWI0Z6I+Gn71WXVkxI750OcepmkaeieJQnuk+XfDOOZEJS/FORzqOsfddmiWF85o1Nn1nkUx5FUOvSQJANyAYBjezyxdSA9mItRrRCPTecTWTTeDKZQ2uMe7oml+L392Ah+4O/s6SB8j3SHQvGfA0l5d7g==
X-Forefront-Antispam-Report: CIP:12.22.5.234;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(40460700003)(356005)(81166007)(508600001)(6916009)(86362001)(54906003)(316002)(2616005)(1076003)(336012)(426003)(82310400004)(26005)(6666004)(7696005)(16526019)(186003)(83380400001)(8936002)(30864003)(5660300002)(8676002)(4326008)(2906002)(70206006)(70586007)(47076005)(36860700001)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2022 01:25:45.9720
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb8be34f-39b8-450a-9cbf-08da06ebe559
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.234];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5011
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Some notebook systems with EC-driven backlight control appear to have a
firmware bug which causes the system to use GPU-driven backlight control
upon a fresh boot, but then switches to EC-driven backlight control
after completing a suspend/resume cycle. All the while, the firmware
reports that the backlight is under EC control, regardless of what is
actually controlling the backlight brightness.

This leads to the following behavior:

* nvidia-wmi-ec-backlight gets probed on a fresh boot, due to the
  WMI-wrapped ACPI method erroneously reporting EC control.
* nvidia-wmi-ec-backlight does not work until after a suspend/resume
  cycle, due to the backlight control actually being GPU-driven.
* GPU drivers also register their own backlight handlers: in the case
  of the notebook system where this behavior has been observed, both
  amdgpu and the NVIDIA proprietary driver register backlight handlers.
* The GPU which has backlight control upon a fresh boot (amdgpu in the
  case observed so far) can successfully control the backlight through
  its backlight driver's sysfs interface, but stops working after the
  first suspend/resume cycle.
* nvidia-wmi-ec-backlight is unable to control the backlight upon a
  fresh boot, but begins to work after the first suspend/resume cycle.
* The GPU which does not have backlight control (NVIDIA in this case)
  is not able to control the backlight at any point while the system
  is in operation. On similar hybrid systems with an EC-controlled
  backlight, and AMD/NVIDIA iGPU/dGPU, the NVIDIA proprietary driver
  does not register its backlight handler. It has not been determined
  whether the non-functional handler registered by the NVIDIA driver
  is due to another firmware bug, or a bug in the NVIDIA driver.

Since nvidia-wmi-ec-backlight registers as a BACKLIGHT_FIRMWARE type
device, it takes precedence over the BACKLIGHT_RAW devices registered
by the GPU drivers. This in turn leads to backlight control appearing
to be non-functional until after completing a suspend/resume cycle.
However, it is still possible to control the backlight through direct
interaction with the working GPU driver's backlight sysfs interface.

These systems also appear to have a second firmware bug which resets
the EC's brightness level to 100% on resume, but leaves the state in
the kernel at the pre-suspend level. This causes attempts to save
and restore the backlight level across the suspend/resume cycle to
fail, due to the level appearing not to change even though it did.

In order to work around these issue, add quirk tables to detect
systems that are known to show these behaviors. So far, there is
only one known system that requires these workarounds, and both
issues are present on that system, but the quirks are tracked in
separate tables to make it easier to add them to other systems which
may exhibit one of the bugs, but not the other. The original systems
that this driver was tested on during development do not exhibit
either of these quirks.

If a system with the "GPU driver has backlight control" quirk is
detected, nvidia-wmi-ec-backlight will grab a reference to the working
(when freshly booted) GPU backlight handler and relays any backlight
brightness level change requests directed at the EC to also be applied
to the GPU backlight interface. This leads to redundant updates
directed at the GPU backlight driver after a suspend/resume cycle, but
it does allow the EC backlight control to work when the system is
freshly booted.

If a system with the "backlight level reset to full on resume" quirk
is detected, nvidia-wmi-ec-backlight will register a PM notifier to
reset the backlight to the previous level upon resume.

These workarounds are also plumbed through to kernel module parameters,
to make it easier for users who suspect they may be affected by one or
both of these bugs to test whether these workarounds are effective on
their systems as well.

Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
Tested-by: Alexandru Dinu <alex.dinu07@gmail.com>
---
 .../platform/x86/nvidia-wmi-ec-backlight.c    | 181 +++++++++++++++++-
 1 file changed, 179 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/nvidia-wmi-ec-backlight.c b/drivers/platform/x86/nvidia-wmi-ec-backlight.c
index 61e37194df70..ccb3b506c12c 100644
--- a/drivers/platform/x86/nvidia-wmi-ec-backlight.c
+++ b/drivers/platform/x86/nvidia-wmi-ec-backlight.c
@@ -3,8 +3,11 @@
  * Copyright (c) 2020, NVIDIA CORPORATION.  All rights reserved.
  */
 
+#define pr_fmt(f) "%s: " f "\n", KBUILD_MODNAME
+
 #include <linux/acpi.h>
 #include <linux/backlight.h>
+#include <linux/dmi.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/types.h>
@@ -75,6 +78,69 @@ struct wmi_brightness_args {
 	u32 ignored[3];
 };
 
+/**
+ * struct nvidia_wmi_ec_backlight_priv - driver private data
+ * @bl_dev:       the associated backlight device
+ * @proxy_target: backlight device which receives relayed brightness changes
+ * @notifier:     notifier block for resume callback
+ */
+struct nvidia_wmi_ec_backlight_priv {
+	struct backlight_device *bl_dev;
+	struct backlight_device *proxy_target;
+	struct notifier_block nb;
+};
+
+static char *backlight_proxy_target;
+module_param(backlight_proxy_target, charp, 0);
+MODULE_PARM_DESC(backlight_proxy_target, "Relay brightness change requests to the named backlight driver, on systems which erroneously report EC backlight control.");
+
+static int max_reprobe_attempts = 128;
+module_param(max_reprobe_attempts, int, 0);
+MODULE_PARM_DESC(max_reprobe_attempts, "Limit of reprobe attempts when relaying brightness change requests.");
+
+static bool restore_level_on_resume;
+module_param(restore_level_on_resume, bool, 0);
+MODULE_PARM_DESC(restore_level_on_resume, "Restore the backlight level when resuming from suspend, on systems which reset the EC's backlight level on resume.");
+
+static int assign_relay_quirk(const struct dmi_system_id *id)
+{
+	backlight_proxy_target = id->driver_data;
+	return true;
+}
+
+#define PROXY_QUIRK_ENTRY(vendor, product, quirk_data) { \
+	.callback = assign_relay_quirk,                  \
+	.matches = {                                     \
+		DMI_MATCH(DMI_SYS_VENDOR, vendor),       \
+		DMI_MATCH(DMI_PRODUCT_VERSION, product)  \
+	},                                               \
+	.driver_data = quirk_data                        \
+}
+
+static const struct dmi_system_id proxy_quirk_table[] = {
+	PROXY_QUIRK_ENTRY("LENOVO", "Legion S7 15ACH6", "amdgpu_bl1"),
+	{ }
+};
+
+static int assign_restore_quirk(const struct dmi_system_id *id)
+{
+	restore_level_on_resume = true;
+	return true;
+}
+
+#define RESTORE_QUIRK_ENTRY(vendor, product) {           \
+	.callback = assign_restore_quirk,                \
+	.matches = {                                     \
+		DMI_MATCH(DMI_SYS_VENDOR, vendor),       \
+		DMI_MATCH(DMI_PRODUCT_VERSION, product), \
+	}                                                \
+}
+
+static const struct dmi_system_id restore_quirk_table[] = {
+	RESTORE_QUIRK_ENTRY("LENOVO", "Legion S7 15ACH6"),
+	{ }
+};
+
 /**
  * wmi_brightness_notify() - helper function for calling WMI-wrapped ACPI method
  * @w:    Pointer to the struct wmi_device identified by %WMI_BRIGHTNESS_GUID
@@ -119,9 +185,30 @@ static int wmi_brightness_notify(struct wmi_device *w, enum wmi_brightness_metho
 	return 0;
 }
 
+static int scale_backlight_level(struct backlight_device *a,
+				 struct backlight_device *b)
+{
+	/* because floating point math in the kernel is annoying */
+	const int scaling_factor = 65536;
+	int level = a->props.brightness;
+	int relative_level = level * scaling_factor / a->props.max_brightness;
+
+	return relative_level * b->props.max_brightness / scaling_factor;
+}
+
 static int nvidia_wmi_ec_backlight_update_status(struct backlight_device *bd)
 {
 	struct wmi_device *wdev = bl_get_data(bd);
+	struct nvidia_wmi_ec_backlight_priv *priv = dev_get_drvdata(&wdev->dev);
+	struct backlight_device *proxy_target = priv->proxy_target;
+
+	if (proxy_target) {
+		int level = scale_backlight_level(bd, proxy_target);
+
+		if (backlight_device_set_brightness(proxy_target, level))
+			pr_warn("Failed to relay backlight update to \"%s\"",
+				backlight_proxy_target);
+	}
 
 	return wmi_brightness_notify(wdev, WMI_BRIGHTNESS_METHOD_LEVEL,
 	                             WMI_BRIGHTNESS_MODE_SET,
@@ -147,13 +234,65 @@ static const struct backlight_ops nvidia_wmi_ec_backlight_ops = {
 	.get_brightness = nvidia_wmi_ec_backlight_get_brightness,
 };
 
+static int nvidia_wmi_ec_backlight_pm_notifier(struct notifier_block *nb, unsigned long event, void *d)
+{
+
+	/*
+	 * On some systems, the EC backlight level gets reset to 100% when
+	 * resuming from suspend, but the backlight device state still reflects
+	 * the pre-suspend value. Refresh the existing state to sync the EC's
+	 * state back up with the kernel's.
+	 */
+	if (event == PM_POST_SUSPEND) {
+		struct nvidia_wmi_ec_backlight_priv *p;
+
+		p = container_of(nb, struct nvidia_wmi_ec_backlight_priv, nb);
+		return backlight_update_status(p->bl_dev);
+	}
+
+	return 0;
+}
+
 static int nvidia_wmi_ec_backlight_probe(struct wmi_device *wdev, const void *ctx)
 {
+	struct backlight_device *bdev, *target = NULL;
+	struct nvidia_wmi_ec_backlight_priv *priv;
 	struct backlight_properties props = {};
-	struct backlight_device *bdev;
 	u32 source;
 	int ret;
 
+	/*
+	 * Check quirks tables to see if this system needs any of the firmware
+	 * bug workarounds.
+	 */
+
+	/* User-set quirks from the module parameters take precedence */
+	if (!backlight_proxy_target)
+		dmi_check_system(proxy_quirk_table);
+
+	dmi_check_system(restore_quirk_table);
+
+	if (backlight_proxy_target && backlight_proxy_target[0]) {
+		static int num_reprobe_attempts;
+
+		target = backlight_device_get_by_name(backlight_proxy_target);
+
+		if (!target) {
+			/*
+			 * The target backlight device might not be ready;
+			 * try again and disable backlight proxying if it
+			 * fails too many times.
+			 */
+			if (num_reprobe_attempts < max_reprobe_attempts) {
+				num_reprobe_attempts++;
+				return -EPROBE_DEFER;
+			}
+
+			pr_warn("Unable to acquire %s after %d attempts. Disabling backlight proxy.",
+				backlight_proxy_target, max_reprobe_attempts);
+		}
+	}
+
 	ret = wmi_brightness_notify(wdev, WMI_BRIGHTNESS_METHOD_SOURCE,
 	                           WMI_BRIGHTNESS_MODE_GET, &source);
 	if (ret)
@@ -188,7 +327,44 @@ static int nvidia_wmi_ec_backlight_probe(struct wmi_device *wdev, const void *ct
 					      &wdev->dev, wdev,
 					      &nvidia_wmi_ec_backlight_ops,
 					      &props);
-	return PTR_ERR_OR_ZERO(bdev);
+
+	if (IS_ERR(bdev))
+		return PTR_ERR(bdev);
+
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	priv->bl_dev = bdev;
+
+	dev_set_drvdata(&wdev->dev, priv);
+
+	if (target) {
+		int level = scale_backlight_level(target, bdev);
+
+		if (backlight_device_set_brightness(bdev, level))
+			pr_warn("Unable to import initial brightness level from %s.",
+				backlight_proxy_target);
+		priv->proxy_target = target;
+	}
+
+	if (restore_level_on_resume) {
+		priv->nb.notifier_call = nvidia_wmi_ec_backlight_pm_notifier;
+		register_pm_notifier(&priv->nb);
+	}
+
+	return 0;
+}
+
+static void nvidia_wmi_ec_backlight_remove(struct wmi_device *wdev)
+{
+	struct nvidia_wmi_ec_backlight_priv *priv = dev_get_drvdata(&wdev->dev);
+	struct backlight_device *proxy_target = priv->proxy_target;
+
+	if (proxy_target)
+		put_device(&proxy_target->dev);
+
+	if (priv->nb.notifier_call)
+		unregister_pm_notifier(&priv->nb);
+
+	kfree(priv);
 }
 
 #define WMI_BRIGHTNESS_GUID "603E9613-EF25-4338-A3D0-C46177516DB7"
@@ -204,6 +380,7 @@ static struct wmi_driver nvidia_wmi_ec_backlight_driver = {
 		.name = "nvidia-wmi-ec-backlight",
 	},
 	.probe = nvidia_wmi_ec_backlight_probe,
+	.remove = nvidia_wmi_ec_backlight_remove,
 	.id_table = nvidia_wmi_ec_backlight_id_table,
 };
 module_wmi_driver(nvidia_wmi_ec_backlight_driver);
-- 
2.27.0


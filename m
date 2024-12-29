Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B081A08AF;
	Sun, 29 Dec 2024 19:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735501661; cv=none; b=pgN1w5gsUbYhPzDVHMyzhzhZk5xC3DghiE5HeWZonT8Qsylz7GNhiwxR+84iUtssZDW2RO0k15CnSQ3AKAHBDs00qn9qq7H/SEv/YbDRq1GMtdNaXgy/CFJOdDBcJ6cWWPD6wKwWBk63e2lG2Oq6URN261stj58BvkpbOvniGFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735501661; c=relaxed/simple;
	bh=DLcTKz77W30ZjKF71DnuOFU2QW5kz6PStnwA9H/YpmA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CP/3ofM0rR3HMR9YSIXuRsg0ErtuxgxAWo8tAcR87bvkNTIc6krdrrMcOVTY6zUnyBEf5O7E9AzACVDhk0YxeUhezdimndhx/6k8IWt5Tl9GY27d5OdNNez3z6xbxR9CkkFHXSD4yQ//45W0c1PQt3E2VyHXoyFQYmhUDkVg1Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SLtuprbq; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SLtuprbq"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-518c46cc6e4so2821981e0c.3;
        Sun, 29 Dec 2024 11:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735501657; x=1736106457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+ptfvtKNTcyQfqpaTCzsQphD8kZIyqID9rX1g95AwQ=;
        b=SLtuprbqe/5F+tWVIEW4DgublreWG0ffcK0b+Vqkwu1z1xelSmOytHwpiHypxbeeuZ
         1PZhePj7Q5Aejyi01tWNZVF/nFtQ6kKqKE/PWjY/O/P0QzTDWaldBK6LmEpW1CEjj3+a
         MReiV0w2CaW4VzA2bYjyY1/ApDuJ/S4+qm+36pHtPb5UP19mak2ziNvjjTYkozvioksh
         bt4Lik9vaHJnPDps1tjlEAAXXFXWq8vQ8IpCIzQr60Q7hW2lkEYZg1ro7Op4FVZO6Ujr
         IhpE3XAF04xR7eI0TyAaR3YfJXtWjAVmlFEH35MIoSxeytUiCjtjML4hxqeT0/FwXeoE
         Eq/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735501657; x=1736106457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J+ptfvtKNTcyQfqpaTCzsQphD8kZIyqID9rX1g95AwQ=;
        b=UXQXQciBTupYMp60brYb/aWEH+pzl/fcArc1E/x35a58O9sUoiWc0R9A3EyeS+cs86
         ZyDz1m/O1771PMeeHvMK1DpDN3l9wOHeuHLEzoN8NKkgIrlBll1fcclOKCizi7AtvEhp
         P9UEGrAqgWjyMHkiJb028x48H8hjnBI6t5n87Kjbi87o9RbDyuA+VgOxQQFL9SPNkgp4
         Pu4PRRyxC/E77GbVNfd95jpeNw89IC2VlkCg/TdzJwPzQFtvN0BLEt7EeVwcxVPNsnyS
         6/i5dqBqvK4oT459Nn0dpMOVyegApAoknlNUI/iJxlX5EUMVhBCyIFyqWTln3P1q7bpX
         miuQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6iprQq8yagCo7PsOPlSORPq9/I+4Wi29gCO1Z0sT6cdMbVi0xFLRhcgA2XCBYCI2yK/BfT5+oE6Kt8io=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2atexje+AIN7zTHEV+bfHQsS/GOdLXPYDs0CFBHkWyJf4H01S
	1LmFxhVxXY8R83BYOBdkLY9Iko4sg4cO8LCHdSlormm6nkrceDbipVMfaw==
X-Gm-Gg: ASbGncubBoaf3SqSUfUGk0Q5ZQrDnSpB1CE1HyGP+GS3kpmm36UKDz+VTrUOU/Al140
	TH0RrygBU3Ql0+yfvBsaDl/IENYqtvj/pirRZnu2nsSy1SUrcN/ftG1dJkSST3+pS+2rAwgJWpL
	GOLNl9d2+Oz8x085bzqMO5IhJxi4ztCcWbq4NGsPzPL3U1oY7DjmYgygEWjtqfLj76a671wJBWl
	h9kN0Z0pgfGLii3IK+XuwEeLCIYE4LQ2Z+UkSdVbUub/BDaF2eVBYk93xw//PNr
X-Google-Smtp-Source: AGHT+IGm784i9xnNTrRHBcOLfrhaOevBvSpxHd95JedLyxrc7BX7v66vFmquk2VYGIPmAuIaYGFfzg==
X-Received: by 2002:a05:6102:6e88:b0:4b2:cc92:169d with SMTP id ada2fe7eead31-4b2cc921785mr20287549137.4.1735501656495;
        Sun, 29 Dec 2024 11:47:36 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bf98ce0fsm3753555137.3.2024.12.29.11.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 11:47:35 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: Dell.Client.Kernel@dell.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	mario.limonciello@amd.com,
	w_armin@gmx.de,
	Kurt Borja <kuurtb@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>
Subject: [PATCH v2 17/20] platform-x86: Split the alienware-wmi driver
Date: Sun, 29 Dec 2024 14:45:04 -0500
Message-ID: <20241229194506.8268-19-kuurtb@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241229194506.8268-2-kuurtb@gmail.com>
References: <20241229194506.8268-2-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split alienware-wmi WMI drivers into different files. This is done
seamlessly by copying and pasting, however some blocks are reordered.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/Makefile            |   2 +
 .../platform/x86/dell/alienware-wmi-base.c    | 849 +-----------------
 .../platform/x86/dell/alienware-wmi-legacy.c  |  98 ++
 .../platform/x86/dell/alienware-wmi-wmax.c    | 775 ++++++++++++++++
 4 files changed, 876 insertions(+), 848 deletions(-)
 create mode 100644 drivers/platform/x86/dell/alienware-wmi-legacy.c
 create mode 100644 drivers/platform/x86/dell/alienware-wmi-wmax.c

diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x86/dell/Makefile
index f8aec8502c2f..03ba459f3d31 100644
--- a/drivers/platform/x86/dell/Makefile
+++ b/drivers/platform/x86/dell/Makefile
@@ -6,6 +6,8 @@
 
 obj-$(CONFIG_ALIENWARE_WMI)		+= alienware-wmi.o
 alienware-wmi-objs			:= alienware-wmi-base.o
+alienware-wmi-y				+= alienware-wmi-legacy.o
+alienware-wmi-y				+= alienware-wmi-wmax.o
 obj-$(CONFIG_DCDBAS)			+= dcdbas.o
 obj-$(CONFIG_DELL_LAPTOP)		+= dell-laptop.o
 obj-$(CONFIG_DELL_RBTN)			+= dell-rbtn.o
diff --git a/drivers/platform/x86/dell/alienware-wmi-base.c b/drivers/platform/x86/dell/alienware-wmi-base.c
index a268193ad2a1..fd73c3881dc0 100644
--- a/drivers/platform/x86/dell/alienware-wmi-base.c
+++ b/drivers/platform/x86/dell/alienware-wmi-base.c
@@ -8,96 +8,21 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/acpi.h>
-#include <linux/bitfield.h>
-#include <linux/bits.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/platform_profile.h>
 #include <linux/dmi.h>
 #include <linux/leds.h>
-#include <linux/wmi.h>
 #include "alienware-wmi.h"
 
-#define WMAX_METHOD_HDMI_SOURCE		0x1
-#define WMAX_METHOD_HDMI_STATUS		0x2
-#define WMAX_METHOD_BRIGHTNESS		0x3
-#define WMAX_METHOD_ZONE_CONTROL	0x4
-#define WMAX_METHOD_HDMI_CABLE		0x5
-#define WMAX_METHOD_AMPLIFIER_CABLE	0x6
-#define WMAX_METHOD_DEEP_SLEEP_CONTROL	0x0B
-#define WMAX_METHOD_DEEP_SLEEP_STATUS	0x0C
-#define WMAX_METHOD_THERMAL_INFORMATION	0x14
-#define WMAX_METHOD_THERMAL_CONTROL	0x15
-#define WMAX_METHOD_GAME_SHIFT_STATUS	0x25
-
-#define WMAX_THERMAL_MODE_GMODE		0xAB
-
-#define WMAX_FAILURE_CODE		0xFFFFFFFF
-
 MODULE_AUTHOR("Mario Limonciello <mario.limonciello@outlook.com>");
 MODULE_DESCRIPTION("Alienware special feature control");
 MODULE_LICENSE("GPL");
 
-static bool force_platform_profile;
-module_param_unsafe(force_platform_profile, bool, 0);
-MODULE_PARM_DESC(force_platform_profile, "Forces auto-detecting thermal profiles without checking if WMI thermal backend is available");
-
-static bool force_gmode;
-module_param_unsafe(force_gmode, bool, 0);
-MODULE_PARM_DESC(force_gmode, "Forces G-Mode when performance profile is selected");
-
 enum INTERFACE_FLAGS {
 	LEGACY,
 	WMAX,
 };
 
-enum WMAX_THERMAL_INFORMATION_OPERATIONS {
-	WMAX_OPERATION_SYS_DESCRIPTION		= 0x02,
-	WMAX_OPERATION_LIST_IDS			= 0x03,
-	WMAX_OPERATION_CURRENT_PROFILE		= 0x0B,
-};
-
-enum WMAX_THERMAL_CONTROL_OPERATIONS {
-	WMAX_OPERATION_ACTIVATE_PROFILE		= 0x01,
-};
-
-enum WMAX_GAME_SHIFT_STATUS_OPERATIONS {
-	WMAX_OPERATION_TOGGLE_GAME_SHIFT	= 0x01,
-	WMAX_OPERATION_GET_GAME_SHIFT_STATUS	= 0x02,
-};
-
-enum WMAX_THERMAL_TABLES {
-	WMAX_THERMAL_TABLE_BASIC		= 0x90,
-	WMAX_THERMAL_TABLE_USTT			= 0xA0,
-};
-
-enum wmax_thermal_mode {
-	THERMAL_MODE_USTT_BALANCED,
-	THERMAL_MODE_USTT_BALANCED_PERFORMANCE,
-	THERMAL_MODE_USTT_COOL,
-	THERMAL_MODE_USTT_QUIET,
-	THERMAL_MODE_USTT_PERFORMANCE,
-	THERMAL_MODE_USTT_LOW_POWER,
-	THERMAL_MODE_BASIC_QUIET,
-	THERMAL_MODE_BASIC_BALANCED,
-	THERMAL_MODE_BASIC_BALANCED_PERFORMANCE,
-	THERMAL_MODE_BASIC_PERFORMANCE,
-	THERMAL_MODE_LAST,
-};
-
-static const enum platform_profile_option wmax_mode_to_platform_profile[THERMAL_MODE_LAST] = {
-	[THERMAL_MODE_USTT_BALANCED]			= PLATFORM_PROFILE_BALANCED,
-	[THERMAL_MODE_USTT_BALANCED_PERFORMANCE]	= PLATFORM_PROFILE_BALANCED_PERFORMANCE,
-	[THERMAL_MODE_USTT_COOL]			= PLATFORM_PROFILE_COOL,
-	[THERMAL_MODE_USTT_QUIET]			= PLATFORM_PROFILE_QUIET,
-	[THERMAL_MODE_USTT_PERFORMANCE]			= PLATFORM_PROFILE_PERFORMANCE,
-	[THERMAL_MODE_USTT_LOW_POWER]			= PLATFORM_PROFILE_LOW_POWER,
-	[THERMAL_MODE_BASIC_QUIET]			= PLATFORM_PROFILE_QUIET,
-	[THERMAL_MODE_BASIC_BALANCED]			= PLATFORM_PROFILE_BALANCED,
-	[THERMAL_MODE_BASIC_BALANCED_PERFORMANCE]	= PLATFORM_PROFILE_BALANCED_PERFORMANCE,
-	[THERMAL_MODE_BASIC_PERFORMANCE]		= PLATFORM_PROFILE_PERFORMANCE,
-};
-
 static struct alienfx_quirks *quirks;
 
 static struct alienfx_quirks quirk_inspiron5675 = {
@@ -222,138 +147,7 @@ static const struct dmi_system_id alienware_quirks[] __initconst = {
 	{}
 };
 
-struct wmax_brightness_args {
-	u32 led_mask;
-	u32 percentage;
-};
-
-struct wmax_basic_args {
-	u8 arg;
-};
-
-struct legacy_led_args {
-	struct color_platform colors;
-	u8 brightness;
-	u8 state;
-} __packed;
-
-struct wmax_led_args {
-	u32 led_mask;
-	struct color_platform colors;
-	u8 state;
-} __packed;
-
-struct wmax_u32_args {
-	u8 operation;
-	u8 arg1;
-	u8 arg2;
-	u8 arg3;
-};
-
-struct awcc_priv {
-	struct wmi_device *wdev;
-	struct platform_profile_handler pp_handler;
-	enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROFILE_LAST];
-};
-
-static u8 interface;
-
-struct awcc_quirks {
-	bool gmode;
-};
-
-static struct awcc_quirks g_series_features = {
-	.gmode = true,
-};
-
-static struct awcc_quirks x_series_features = {
-	.gmode = false,
-};
-
-static const struct dmi_system_id awcc_dmi_table[] __initconst = {
-	{
-		.ident = "Alienware m17 R5",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m17 R5 AMD"),
-		},
-		.driver_data = &x_series_features,
-	},
-	{
-		.ident = "Alienware m18 R2",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m18 R2"),
-		},
-		.driver_data = &x_series_features,
-	},
-	{
-		.ident = "Alienware x15 R1",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x15 R1"),
-		},
-		.driver_data = &x_series_features,
-	},
-	{
-		.ident = "Alienware x17 R2",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x17 R2"),
-		},
-		.driver_data = &x_series_features,
-	},
-	{
-		.ident = "Dell Inc. G15 5510",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5510"),
-		},
-		.driver_data = &g_series_features,
-	},
-	{
-		.ident = "Dell Inc. G15 5511",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5511"),
-		},
-		.driver_data = &g_series_features,
-	},
-	{
-		.ident = "Dell Inc. G15 5515",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5515"),
-		},
-		.driver_data = &g_series_features,
-	},
-	{
-		.ident = "Dell Inc. G3 3500",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3500"),
-		},
-		.driver_data = &g_series_features,
-	},
-	{
-		.ident = "Dell Inc. G3 3590",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3590"),
-		},
-		.driver_data = &g_series_features,
-	},
-	{
-		.ident = "Dell Inc. G5 5500",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "G5 5500"),
-		},
-		.driver_data = &g_series_features,
-	},
-};
-
-struct awcc_quirks *awcc;
+u8 interface;
 
 int alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
 			  void *in_args, size_t in_size, u32 *out_data)
@@ -586,458 +380,6 @@ static enum led_brightness global_led_get(struct led_classdev *led_cdev)
 	return priv->global_brightness;
 }
 
-/*
- *	The HDMI mux sysfs node indicates the status of the HDMI input mux.
- *	It can toggle between standard system GPU output and HDMI input.
- */
-static ssize_t cable_show(struct device *dev, struct device_attribute *attr,
-			  char *buf)
-{
-	struct alienfx_platdata *pdata = dev_get_platdata(dev);
-	struct wmax_basic_args in_args = {
-		.arg = 0,
-	};
-	u32 out_data;
-	int ret;
-
-	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_HDMI_CABLE,
-				    &in_args, sizeof(in_args), &out_data);
-
-	if (!ret) {
-		if (out_data == 0)
-			return sysfs_emit(buf, "[unconnected] connected unknown\n");
-		else if (out_data == 1)
-			return sysfs_emit(buf, "unconnected [connected] unknown\n");
-	}
-
-	pr_err("alienware-wmi: unknown HDMI cable status: %d\n", ret);
-	return sysfs_emit(buf, "unconnected connected [unknown]\n");
-}
-
-static ssize_t source_show(struct device *dev, struct device_attribute *attr,
-			   char *buf)
-{
-	struct alienfx_platdata *pdata = dev_get_platdata(dev);
-	struct wmax_basic_args in_args = {
-		.arg = 0,
-	};
-	u32 out_data;
-	int ret;
-
-	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_HDMI_STATUS,
-				    &in_args, sizeof(in_args), &out_data);
-
-	if (!ret) {
-		if (out_data == 1)
-			return sysfs_emit(buf, "[input] gpu unknown\n");
-		else if (out_data == 2)
-			return sysfs_emit(buf, "input [gpu] unknown\n");
-	}
-
-	pr_err("alienware-wmi: unknown HDMI source status: %u\n", ret);
-	return sysfs_emit(buf, "input gpu [unknown]\n");
-}
-
-static ssize_t source_store(struct device *dev, struct device_attribute *attr,
-			    const char *buf, size_t count)
-{
-	struct alienfx_platdata *pdata = dev_get_platdata(dev);
-	struct wmax_basic_args args;
-	int ret;
-
-	if (strcmp(buf, "gpu\n") == 0)
-		args.arg = 1;
-	else if (strcmp(buf, "input\n") == 0)
-		args.arg = 2;
-	else
-		args.arg = 3;
-	pr_debug("alienware-wmi: setting hdmi to %d : %s", args.arg, buf);
-
-	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_HDMI_SOURCE, &args,
-				    sizeof(args), NULL);
-
-	if (ret < 0)
-		pr_err("alienware-wmi: HDMI toggle failed: results: %u\n", ret);
-
-	return count;
-}
-
-static DEVICE_ATTR_RO(cable);
-static DEVICE_ATTR_RW(source);
-
-static bool hdmi_group_visible(struct kobject *kobj)
-{
-	struct alienfx_priv *priv = dev_get_drvdata(kobj_to_dev(kobj));
-
-	return priv->quirks->hdmi_mux;
-}
-DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(hdmi);
-
-static struct attribute *hdmi_attrs[] = {
-	&dev_attr_cable.attr,
-	&dev_attr_source.attr,
-	NULL,
-};
-
-static const struct attribute_group hdmi_attribute_group = {
-	.name = "hdmi",
-	.is_visible = SYSFS_GROUP_VISIBLE(hdmi),
-	.attrs = hdmi_attrs,
-};
-
-/*
- * Alienware GFX amplifier support
- * - Currently supports reading cable status
- * - Leaving expansion room to possibly support dock/undock events later
- */
-static ssize_t status_show(struct device *dev, struct device_attribute *attr,
-			   char *buf)
-{
-	struct alienfx_platdata *pdata = dev_get_platdata(dev);
-	struct wmax_basic_args in_args = {
-		.arg = 0,
-	};
-	u32 out_data;
-	int ret;
-
-	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_AMPLIFIER_CABLE,
-				    &in_args, sizeof(in_args), &out_data);
-
-	if (!ret) {
-		if (out_data == 0)
-			return sysfs_emit(buf, "[unconnected] connected unknown\n");
-		else if (out_data == 1)
-			return sysfs_emit(buf, "unconnected [connected] unknown\n");
-	}
-
-	pr_err("alienware-wmi: unknown amplifier cable status: %d\n", ret);
-	return sysfs_emit(buf, "unconnected connected [unknown]\n");
-}
-
-static DEVICE_ATTR_RO(status);
-
-static bool amplifier_group_visible(struct kobject *kobj)
-{
-	struct alienfx_priv *priv = dev_get_drvdata(kobj_to_dev(kobj));
-
-	return priv->quirks->amplifier;
-}
-DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(amplifier);
-
-static struct attribute *amplifier_attrs[] = {
-	&dev_attr_status.attr,
-	NULL,
-};
-
-static const struct attribute_group amplifier_attribute_group = {
-	.name = "amplifier",
-	.is_visible = SYSFS_GROUP_VISIBLE(amplifier),
-	.attrs = amplifier_attrs,
-};
-
-/*
- * Deep Sleep Control support
- * - Modifies BIOS setting for deep sleep control allowing extra wakeup events
- */
-static ssize_t deepsleep_show(struct device *dev, struct device_attribute *attr,
-			      char *buf)
-{
-	struct alienfx_platdata *pdata = dev_get_platdata(dev);
-	struct wmax_basic_args in_args = {
-		.arg = 0,
-	};
-	u32 out_data;
-	int ret;
-
-	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_DEEP_SLEEP_STATUS,
-				    &in_args, sizeof(in_args), &out_data);
-
-	if (!ret) {
-		if (out_data == 0)
-			return sysfs_emit(buf, "[disabled] s5 s5_s4\n");
-		else if (out_data == 1)
-			return sysfs_emit(buf, "disabled [s5] s5_s4\n");
-		else if (out_data == 2)
-			return sysfs_emit(buf, "disabled s5 [s5_s4]\n");
-	}
-
-	pr_err("alienware-wmi: unknown deep sleep status: %d\n", ret);
-	return sysfs_emit(buf, "disabled s5 s5_s4 [unknown]\n");
-}
-
-static ssize_t deepsleep_store(struct device *dev, struct device_attribute *attr,
-			       const char *buf, size_t count)
-{
-	struct alienfx_platdata *pdata = dev_get_platdata(dev);
-	struct wmax_basic_args args;
-	int ret;
-
-	if (strcmp(buf, "disabled\n") == 0)
-		args.arg = 0;
-	else if (strcmp(buf, "s5\n") == 0)
-		args.arg = 1;
-	else
-		args.arg = 2;
-	pr_debug("alienware-wmi: setting deep sleep to %d : %s", args.arg, buf);
-
-	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_DEEP_SLEEP_CONTROL,
-				    &args, sizeof(args), NULL);
-
-	if (!ret)
-		pr_err("alienware-wmi: deep sleep control failed: results: %u\n", ret);
-
-	return count;
-}
-
-static DEVICE_ATTR_RW(deepsleep);
-
-static bool deepsleep_group_visible(struct kobject *kobj)
-{
-	struct alienfx_priv *priv = dev_get_drvdata(kobj_to_dev(kobj));
-
-	return priv->quirks->deepslp;
-}
-DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(deepsleep);
-
-static struct attribute *deepsleep_attrs[] = {
-	&dev_attr_deepsleep.attr,
-	NULL,
-};
-
-static const struct attribute_group deepsleep_attribute_group = {
-	.name = "deepsleep",
-	.is_visible = SYSFS_GROUP_VISIBLE(deepsleep),
-	.attrs = deepsleep_attrs,
-};
-
-/*
- * Thermal Profile control
- *  - Provides thermal profile control through the Platform Profile API
- */
-#define WMAX_THERMAL_TABLE_MASK		GENMASK(7, 4)
-#define WMAX_THERMAL_MODE_MASK		GENMASK(3, 0)
-#define WMAX_SENSOR_ID_MASK		BIT(8)
-
-static bool is_wmax_thermal_code(u32 code)
-{
-	if (code & WMAX_SENSOR_ID_MASK)
-		return false;
-
-	if ((code & WMAX_THERMAL_MODE_MASK) >= THERMAL_MODE_LAST)
-		return false;
-
-	if ((code & WMAX_THERMAL_TABLE_MASK) == WMAX_THERMAL_TABLE_BASIC &&
-	    (code & WMAX_THERMAL_MODE_MASK) >= THERMAL_MODE_BASIC_QUIET)
-		return true;
-
-	if ((code & WMAX_THERMAL_TABLE_MASK) == WMAX_THERMAL_TABLE_USTT &&
-	    (code & WMAX_THERMAL_MODE_MASK) <= THERMAL_MODE_USTT_LOW_POWER)
-		return true;
-
-	return false;
-}
-
-static int wmax_thermal_information(struct wmi_device *wdev, u8 operation,
-				    u8 arg, u32 *out_data)
-{
-	struct wmax_u32_args in_args = {
-		.operation = operation,
-		.arg1 = arg,
-		.arg2 = 0,
-		.arg3 = 0,
-	};
-	int ret;
-
-	ret = alienware_wmi_command(wdev, WMAX_METHOD_THERMAL_INFORMATION,
-				    &in_args, sizeof(in_args), out_data);
-	if (ret < 0)
-		return ret;
-
-	if (*out_data == WMAX_FAILURE_CODE)
-		return -EBADRQC;
-
-	return 0;
-}
-
-static int wmax_thermal_control(struct wmi_device *wdev, u8 profile)
-{
-	struct wmax_u32_args in_args = {
-		.operation = WMAX_OPERATION_ACTIVATE_PROFILE,
-		.arg1 = profile,
-		.arg2 = 0,
-		.arg3 = 0,
-	};
-	u32 out_data;
-	int ret;
-
-	ret = alienware_wmi_command(wdev, WMAX_METHOD_THERMAL_CONTROL,
-				    &in_args, sizeof(in_args), &out_data);
-	if (ret)
-		return ret;
-
-	if (out_data == WMAX_FAILURE_CODE)
-		return -EBADRQC;
-
-	return 0;
-}
-
-static int wmax_game_shift_status(struct wmi_device *wdev, u8 operation,
-				  u32 *out_data)
-{
-	struct wmax_u32_args in_args = {
-		.operation = operation,
-		.arg1 = 0,
-		.arg2 = 0,
-		.arg3 = 0,
-	};
-	int ret;
-
-	ret = alienware_wmi_command(wdev, WMAX_METHOD_GAME_SHIFT_STATUS,
-				    &in_args, sizeof(in_args), out_data);
-
-	if (ret < 0)
-		return ret;
-
-	if (*out_data == WMAX_FAILURE_CODE)
-		return -EOPNOTSUPP;
-
-	return 0;
-}
-
-static int thermal_profile_get(struct platform_profile_handler *pprof,
-			       enum platform_profile_option *profile)
-{
-	struct awcc_priv *priv = container_of(pprof, struct awcc_priv, pp_handler);
-	u32 out_data;
-	int ret;
-
-	ret = wmax_thermal_information(priv->wdev, WMAX_OPERATION_CURRENT_PROFILE,
-				       0, &out_data);
-
-	if (ret < 0)
-		return ret;
-
-	if (out_data == WMAX_THERMAL_MODE_GMODE) {
-		*profile = PLATFORM_PROFILE_PERFORMANCE;
-		return 0;
-	}
-
-	if (!is_wmax_thermal_code(out_data))
-		return -ENODATA;
-
-	out_data &= WMAX_THERMAL_MODE_MASK;
-	*profile = wmax_mode_to_platform_profile[out_data];
-
-	return 0;
-}
-
-static int thermal_profile_set(struct platform_profile_handler *pprof,
-			       enum platform_profile_option profile)
-{
-	struct awcc_priv *priv = container_of(pprof, struct awcc_priv, pp_handler);
-
-	if (awcc->gmode) {
-		u32 gmode_status;
-		int ret;
-
-		ret = wmax_game_shift_status(priv->wdev,
-					     WMAX_OPERATION_GET_GAME_SHIFT_STATUS,
-					     &gmode_status);
-
-		if (ret < 0)
-			return ret;
-
-		if ((profile == PLATFORM_PROFILE_PERFORMANCE && !gmode_status) ||
-		    (profile != PLATFORM_PROFILE_PERFORMANCE && gmode_status)) {
-			ret = wmax_game_shift_status(priv->wdev,
-						     WMAX_OPERATION_TOGGLE_GAME_SHIFT,
-						     &gmode_status);
-
-			if (ret < 0)
-				return ret;
-		}
-	}
-
-	return wmax_thermal_control(priv->wdev,
-				    priv->supported_thermal_profiles[profile]);
-}
-
-static int create_thermal_profile(struct wmi_device *wdev)
-{
-	struct awcc_priv *priv = dev_get_drvdata(&wdev->dev);
-	enum platform_profile_option profile;
-	enum wmax_thermal_mode mode;
-	u8 sys_desc[4];
-	u32 first_mode;
-	u32 out_data;
-	int ret;
-
-	ret = wmax_thermal_information(wdev, WMAX_OPERATION_SYS_DESCRIPTION,
-				       0, (u32 *) &sys_desc);
-	if (ret < 0)
-		return ret;
-
-	first_mode = sys_desc[0] + sys_desc[1];
-
-	for (u32 i = 0; i < sys_desc[3]; i++) {
-		ret = wmax_thermal_information(wdev, WMAX_OPERATION_LIST_IDS,
-					       i + first_mode, &out_data);
-
-		if (ret == -EIO)
-			return ret;
-
-		if (ret == -EBADRQC)
-			break;
-
-		if (!is_wmax_thermal_code(out_data))
-			continue;
-
-		mode = out_data & WMAX_THERMAL_MODE_MASK;
-		profile = wmax_mode_to_platform_profile[mode];
-		priv->supported_thermal_profiles[profile] = out_data;
-
-		set_bit(profile, priv->pp_handler.choices);
-	}
-
-	if (bitmap_empty(priv->pp_handler.choices, PLATFORM_PROFILE_LAST))
-		return -ENODEV;
-
-	if (awcc->gmode) {
-		priv->supported_thermal_profiles[PLATFORM_PROFILE_PERFORMANCE] =
-			WMAX_THERMAL_MODE_GMODE;
-
-		set_bit(PLATFORM_PROFILE_PERFORMANCE, priv->pp_handler.choices);
-	}
-
-	priv->pp_handler.profile_get = thermal_profile_get;
-	priv->pp_handler.profile_set = thermal_profile_set;
-	priv->pp_handler.name = "alienware-wmi";
-	priv->pp_handler.dev = &wdev->dev;
-
-	return platform_profile_register(&priv->pp_handler);
-}
-
-static int alienware_awcc_setup(struct wmi_device *wdev)
-{
-	struct awcc_priv *priv;
-
-	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-
-	dev_set_drvdata(&wdev->dev, priv);
-	priv->wdev = wdev;
-
-	return create_thermal_profile(wdev);
-}
-
-static void alienware_awcc_exit(struct wmi_device *wdev)
-{
-	struct awcc_priv *priv = dev_get_drvdata(&wdev->dev);
-
-	platform_profile_remove(&priv->pp_handler);
-}
-
 /*
  * Platform Driver
  */
@@ -1073,13 +415,6 @@ static const struct attribute_group *alienfx_groups[] = {
 	NULL
 };
 
-static const struct attribute_group *wmax_alienfx_groups[] = {
-	&hdmi_attribute_group,
-	&amplifier_attribute_group,
-	&deepsleep_attribute_group,
-	NULL
-};
-
 static struct platform_driver platform_driver = {
 	.driver = {
 		.name = "alienware-wmi",
@@ -1120,188 +455,6 @@ void alienware_alienfx_exit(struct wmi_device *wdev)
 	platform_driver_unregister(&platform_driver);
 }
 
-/*
- * Legacy WMI driver
- */
-static int legacy_wmi_update_led(struct alienfx_priv *priv,
-				 struct wmi_device *wdev, u8 location)
-{
-	struct legacy_led_args legacy_args = {
-		.colors = priv->colors[location],
-		.brightness = priv->global_brightness,
-		.state = 0,
-	};
-	struct acpi_buffer input;
-	acpi_status status;
-
-	if (legacy_args.state != LEGACY_RUNNING) {
-		legacy_args.state = priv->lighting_control_state;
-
-		input.length = sizeof(legacy_args);
-		input.pointer = &legacy_args;
-
-		status = wmi_evaluate_method(LEGACY_POWER_CONTROL_GUID, 0,
-					     location + 1, &input, NULL);
-		if (ACPI_FAILURE(status))
-			return -EIO;
-
-		return 0;
-	}
-
-	return alienware_wmi_command(wdev, location + 1, &legacy_args,
-				     sizeof(legacy_args), NULL);
-}
-
-static int legacy_wmi_update_brightness(struct alienfx_priv *priv,
-					struct wmi_device *wdev, u8 brightness)
-{
-	return legacy_wmi_update_led(priv, wdev, 0);
-}
-
-static int legacy_wmi_probe(struct wmi_device *wdev, const void *context)
-{
-	struct alienfx_platdata pdata = {
-		.wdev = wdev,
-		.ops = {
-			.upd_led = legacy_wmi_update_led,
-			.upd_brightness = legacy_wmi_update_brightness,
-		},
-	};
-
-	return alienware_alienfx_setup(&pdata);
-}
-
-static void legacy_wmi_remove(struct wmi_device *wdev)
-{
-	alienware_alienfx_exit(wdev);
-}
-
-static struct wmi_device_id alienware_legacy_device_id_table[] = {
-	{ LEGACY_CONTROL_GUID, NULL },
-	{ },
-};
-MODULE_DEVICE_TABLE(wmi, alienware_legacy_device_id_table);
-
-static struct wmi_driver alienware_legacy_wmi_driver = {
-	.driver = {
-		.name = "alienware-wmi-alienfx",
-		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
-	},
-	.id_table = alienware_legacy_device_id_table,
-	.probe = legacy_wmi_probe,
-	.remove = legacy_wmi_remove,
-};
-
-int __init alienware_legacy_wmi_init(void)
-{
-	return wmi_driver_register(&alienware_legacy_wmi_driver);
-}
-
-void __exit alienware_legacy_wmi_exit(void)
-{
-	wmi_driver_unregister(&alienware_legacy_wmi_driver);
-}
-
-/*
- * WMAX WMI driver
- */
-static int wmax_wmi_update_led(struct alienfx_priv *priv,
-			       struct wmi_device *wdev, u8 location)
-{
-	struct wmax_led_args in_args = {
-		.led_mask = 1 << location,
-		.colors = priv->colors[location],
-		.state = priv->lighting_control_state,
-	};
-
-	return alienware_wmi_command(wdev, WMAX_METHOD_ZONE_CONTROL, &in_args,
-				     sizeof(in_args), NULL);
-}
-
-static int wmax_wmi_update_brightness(struct alienfx_priv *priv,
-				      struct wmi_device *wdev, u8 brightness)
-{
-	struct wmax_brightness_args in_args = {
-		.led_mask = 0xFF,
-		.percentage = brightness,
-	};
-
-	return alienware_wmi_command(wdev, WMAX_METHOD_BRIGHTNESS, &in_args,
-				     sizeof(in_args), NULL);
-}
-
-static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
-{
-	struct alienfx_platdata pdata = {
-		.wdev = wdev,
-		.ops = {
-			.upd_led = wmax_wmi_update_led,
-			.upd_brightness = wmax_wmi_update_brightness,
-		},
-	};
-	struct platform_device *pdev;
-	int ret;
-
-	if (awcc) {
-		ret = alienware_awcc_setup(wdev);
-	} else {
-		ret = alienware_alienfx_setup(&pdata);
-		if (ret < 0)
-			return ret;
-
-		pdev = dev_get_drvdata(&wdev->dev);
-		ret = device_add_groups(&pdev->dev, wmax_alienfx_groups);
-	}
-
-	return ret;
-}
-
-static void wmax_wmi_remove(struct wmi_device *wdev)
-{
-	if (awcc)
-		alienware_awcc_exit(wdev);
-	else
-		alienware_alienfx_exit(wdev);
-}
-
-static struct wmi_device_id alienware_wmax_device_id_table[] = {
-	{ WMAX_CONTROL_GUID, NULL },
-	{ },
-};
-MODULE_DEVICE_TABLE(wmi, alienware_wmax_device_id_table);
-
-static struct wmi_driver alienware_wmax_wmi_driver = {
-	.driver = {
-		.name = "alienware-wmi-wmax",
-		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
-	},
-	.id_table = alienware_wmax_device_id_table,
-	.probe = wmax_wmi_probe,
-	.remove = wmax_wmi_remove,
-};
-
-int __init alienware_wmax_wmi_init(void)
-{
-	const struct dmi_system_id *id;
-
-	id = dmi_first_match(awcc_dmi_table);
-	if (id)
-		awcc = id->driver_data;
-
-	if (force_platform_profile)
-		awcc = &x_series_features;
-
-	if (force_gmode)
-		awcc = &g_series_features;
-
-	return wmi_driver_register(&alienware_wmax_wmi_driver);
-}
-
-void __exit alienware_wmax_wmi_exit(void)
-{
-	wmi_driver_unregister(&alienware_wmax_wmi_driver);
-}
-
 static int __init alienware_wmi_init(void)
 {
 	int ret;
diff --git a/drivers/platform/x86/dell/alienware-wmi-legacy.c b/drivers/platform/x86/dell/alienware-wmi-legacy.c
new file mode 100644
index 000000000000..b53a931f97b5
--- /dev/null
+++ b/drivers/platform/x86/dell/alienware-wmi-legacy.c
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Alienware LEGACY WMI device driver
+ *
+ * Copyright (C) 2024 Kurt Borja <kuurtb@gmail.com>
+ */
+
+#include <linux/wmi.h>
+#include "alienware-wmi.h"
+
+struct legacy_led_args {
+	struct color_platform colors;
+	u8 brightness;
+	u8 state;
+} __packed;
+
+
+/*
+ * Legacy WMI driver
+ */
+static int legacy_wmi_update_led(struct alienfx_priv *priv,
+				 struct wmi_device *wdev, u8 location)
+{
+	struct legacy_led_args legacy_args = {
+		.colors = priv->colors[location],
+		.brightness = priv->global_brightness,
+		.state = 0,
+	};
+	struct acpi_buffer input;
+	acpi_status status;
+
+	if (legacy_args.state != LEGACY_RUNNING) {
+		legacy_args.state = priv->lighting_control_state;
+
+		input.length = sizeof(legacy_args);
+		input.pointer = &legacy_args;
+
+		status = wmi_evaluate_method(LEGACY_POWER_CONTROL_GUID, 0,
+					     location + 1, &input, NULL);
+		if (ACPI_FAILURE(status))
+			return -EIO;
+
+		return 0;
+	}
+
+	return alienware_wmi_command(wdev, location + 1, &legacy_args,
+				     sizeof(legacy_args), NULL);
+}
+
+static int legacy_wmi_update_brightness(struct alienfx_priv *priv,
+					struct wmi_device *wdev, u8 brightness)
+{
+	return legacy_wmi_update_led(priv, wdev, 0);
+}
+
+static int legacy_wmi_probe(struct wmi_device *wdev, const void *context)
+{
+	struct alienfx_platdata pdata = {
+		.wdev = wdev,
+		.ops = {
+			.upd_led = legacy_wmi_update_led,
+			.upd_brightness = legacy_wmi_update_brightness,
+		},
+	};
+
+	return alienware_alienfx_setup(&pdata);
+}
+
+static void legacy_wmi_remove(struct wmi_device *wdev)
+{
+	alienware_alienfx_exit(wdev);
+}
+
+static struct wmi_device_id alienware_legacy_device_id_table[] = {
+	{ LEGACY_CONTROL_GUID, NULL },
+	{ },
+};
+MODULE_DEVICE_TABLE(wmi, alienware_legacy_device_id_table);
+
+static struct wmi_driver alienware_legacy_wmi_driver = {
+	.driver = {
+		.name = "alienware-wmi-alienfx",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.id_table = alienware_legacy_device_id_table,
+	.probe = legacy_wmi_probe,
+	.remove = legacy_wmi_remove,
+};
+
+int __init alienware_legacy_wmi_init(void)
+{
+	return wmi_driver_register(&alienware_legacy_wmi_driver);
+}
+
+void __exit alienware_legacy_wmi_exit(void)
+{
+	wmi_driver_unregister(&alienware_legacy_wmi_driver);
+}
diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/x86/dell/alienware-wmi-wmax.c
new file mode 100644
index 000000000000..597be9e6d19c
--- /dev/null
+++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
@@ -0,0 +1,775 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Alienware WMAX WMI device driver
+ *
+ * Copyright (C) 2024 Kurt Borja <kuurtb@gmail.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/dmi.h>
+#include <linux/moduleparam.h>
+#include <linux/platform_profile.h>
+#include <linux/wmi.h>
+#include "alienware-wmi.h"
+
+#define WMAX_METHOD_HDMI_SOURCE			0x1
+#define WMAX_METHOD_HDMI_STATUS			0x2
+#define WMAX_METHOD_HDMI_CABLE			0x5
+#define WMAX_METHOD_AMPLIFIER_CABLE		0x6
+#define WMAX_METHOD_DEEP_SLEEP_CONTROL		0x0B
+#define WMAX_METHOD_DEEP_SLEEP_STATUS		0x0C
+#define WMAX_METHOD_BRIGHTNESS			0x3
+#define WMAX_METHOD_ZONE_CONTROL		0x4
+#define WMAX_METHOD_THERMAL_INFORMATION		0x14
+#define WMAX_METHOD_THERMAL_CONTROL		0x15
+#define WMAX_METHOD_GAME_SHIFT_STATUS		0x25
+
+#define WMAX_THERMAL_MODE_GMODE			0xAB
+
+#define WMAX_FAILURE_CODE			0xFFFFFFFF
+#define WMAX_THERMAL_TABLE_MASK			GENMASK(7, 4)
+#define WMAX_THERMAL_MODE_MASK			GENMASK(3, 0)
+#define WMAX_SENSOR_ID_MASK			BIT(8)
+
+static bool force_platform_profile;
+module_param_unsafe(force_platform_profile, bool, 0);
+MODULE_PARM_DESC(force_platform_profile, "Forces auto-detecting thermal profiles without checking if WMI thermal backend is available");
+
+static bool force_gmode;
+module_param_unsafe(force_gmode, bool, 0);
+MODULE_PARM_DESC(force_gmode, "Forces G-Mode when performance profile is selected");
+
+struct awcc_quirks {
+	bool gmode;
+};
+
+static struct awcc_quirks g_series_features = {
+	.gmode = true,
+};
+
+static struct awcc_quirks x_series_features = {
+	.gmode = false,
+};
+
+static const struct dmi_system_id awcc_dmi_table[] __initconst = {
+	{
+		.ident = "Alienware m17 R5",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m17 R5 AMD"),
+		},
+		.driver_data = &x_series_features,
+	},
+	{
+		.ident = "Alienware m18 R2",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m18 R2"),
+		},
+		.driver_data = &x_series_features,
+	},
+	{
+		.ident = "Alienware x15 R1",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x15 R1"),
+		},
+		.driver_data = &x_series_features,
+	},
+	{
+		.ident = "Alienware x17 R2",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x17 R2"),
+		},
+		.driver_data = &x_series_features,
+	},
+	{
+		.ident = "Dell Inc. G15 5510",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5510"),
+		},
+		.driver_data = &g_series_features,
+	},
+	{
+		.ident = "Dell Inc. G15 5511",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5511"),
+		},
+		.driver_data = &g_series_features,
+	},
+	{
+		.ident = "Dell Inc. G15 5515",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5515"),
+		},
+		.driver_data = &g_series_features,
+	},
+	{
+		.ident = "Dell Inc. G3 3500",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3500"),
+		},
+		.driver_data = &g_series_features,
+	},
+	{
+		.ident = "Dell Inc. G3 3590",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3590"),
+		},
+		.driver_data = &g_series_features,
+	},
+	{
+		.ident = "Dell Inc. G5 5500",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "G5 5500"),
+		},
+		.driver_data = &g_series_features,
+	},
+};
+
+enum WMAX_THERMAL_INFORMATION_OPERATIONS {
+	WMAX_OPERATION_SYS_DESCRIPTION		= 0x02,
+	WMAX_OPERATION_LIST_IDS			= 0x03,
+	WMAX_OPERATION_CURRENT_PROFILE		= 0x0B,
+};
+
+enum WMAX_THERMAL_CONTROL_OPERATIONS {
+	WMAX_OPERATION_ACTIVATE_PROFILE		= 0x01,
+};
+
+enum WMAX_GAME_SHIFT_STATUS_OPERATIONS {
+	WMAX_OPERATION_TOGGLE_GAME_SHIFT	= 0x01,
+	WMAX_OPERATION_GET_GAME_SHIFT_STATUS	= 0x02,
+};
+
+enum WMAX_THERMAL_TABLES {
+	WMAX_THERMAL_TABLE_BASIC		= 0x90,
+	WMAX_THERMAL_TABLE_USTT			= 0xA0,
+};
+
+enum wmax_thermal_mode {
+	THERMAL_MODE_USTT_BALANCED,
+	THERMAL_MODE_USTT_BALANCED_PERFORMANCE,
+	THERMAL_MODE_USTT_COOL,
+	THERMAL_MODE_USTT_QUIET,
+	THERMAL_MODE_USTT_PERFORMANCE,
+	THERMAL_MODE_USTT_LOW_POWER,
+	THERMAL_MODE_BASIC_QUIET,
+	THERMAL_MODE_BASIC_BALANCED,
+	THERMAL_MODE_BASIC_BALANCED_PERFORMANCE,
+	THERMAL_MODE_BASIC_PERFORMANCE,
+	THERMAL_MODE_LAST,
+};
+
+struct wmax_led_args {
+	u32 led_mask;
+	struct color_platform colors;
+	u8 state;
+} __packed;
+
+struct wmax_brightness_args {
+	u32 led_mask;
+	u32 percentage;
+};
+
+struct wmax_basic_args {
+	u8 arg;
+};
+
+struct wmax_u32_args {
+	u8 operation;
+	u8 arg1;
+	u8 arg2;
+	u8 arg3;
+};
+
+struct awcc_priv {
+	struct wmi_device *wdev;
+	struct platform_profile_handler pp_handler;
+	enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROFILE_LAST];
+};
+
+static const enum platform_profile_option wmax_mode_to_platform_profile[THERMAL_MODE_LAST] = {
+	[THERMAL_MODE_USTT_BALANCED]			= PLATFORM_PROFILE_BALANCED,
+	[THERMAL_MODE_USTT_BALANCED_PERFORMANCE]	= PLATFORM_PROFILE_BALANCED_PERFORMANCE,
+	[THERMAL_MODE_USTT_COOL]			= PLATFORM_PROFILE_COOL,
+	[THERMAL_MODE_USTT_QUIET]			= PLATFORM_PROFILE_QUIET,
+	[THERMAL_MODE_USTT_PERFORMANCE]			= PLATFORM_PROFILE_PERFORMANCE,
+	[THERMAL_MODE_USTT_LOW_POWER]			= PLATFORM_PROFILE_LOW_POWER,
+	[THERMAL_MODE_BASIC_QUIET]			= PLATFORM_PROFILE_QUIET,
+	[THERMAL_MODE_BASIC_BALANCED]			= PLATFORM_PROFILE_BALANCED,
+	[THERMAL_MODE_BASIC_BALANCED_PERFORMANCE]	= PLATFORM_PROFILE_BALANCED_PERFORMANCE,
+	[THERMAL_MODE_BASIC_PERFORMANCE]		= PLATFORM_PROFILE_PERFORMANCE,
+};
+
+struct awcc_quirks *awcc;
+
+/*
+ *	The HDMI mux sysfs node indicates the status of the HDMI input mux.
+ *	It can toggle between standard system GPU output and HDMI input.
+ */
+static ssize_t cable_show(struct device *dev, struct device_attribute *attr,
+			  char *buf)
+{
+	struct alienfx_platdata *pdata = dev_get_platdata(dev);
+	struct wmax_basic_args in_args = {
+		.arg = 0,
+	};
+	u32 out_data;
+	int ret;
+
+	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_HDMI_CABLE,
+				    &in_args, sizeof(in_args), &out_data);
+
+	if (!ret) {
+		if (out_data == 0)
+			return sysfs_emit(buf, "[unconnected] connected unknown\n");
+		else if (out_data == 1)
+			return sysfs_emit(buf, "unconnected [connected] unknown\n");
+	}
+
+	pr_err("alienware-wmi: unknown HDMI cable status: %d\n", ret);
+	return sysfs_emit(buf, "unconnected connected [unknown]\n");
+}
+
+static ssize_t source_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
+{
+	struct alienfx_platdata *pdata = dev_get_platdata(dev);
+	struct wmax_basic_args in_args = {
+		.arg = 0,
+	};
+	u32 out_data;
+	int ret;
+
+	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_HDMI_STATUS,
+				    &in_args, sizeof(in_args), &out_data);
+
+	if (!ret) {
+		if (out_data == 1)
+			return sysfs_emit(buf, "[input] gpu unknown\n");
+		else if (out_data == 2)
+			return sysfs_emit(buf, "input [gpu] unknown\n");
+	}
+
+	pr_err("alienware-wmi: unknown HDMI source status: %u\n", ret);
+	return sysfs_emit(buf, "input gpu [unknown]\n");
+}
+
+static ssize_t source_store(struct device *dev, struct device_attribute *attr,
+			    const char *buf, size_t count)
+{
+	struct alienfx_platdata *pdata = dev_get_platdata(dev);
+	struct wmax_basic_args args;
+	int ret;
+
+	if (strcmp(buf, "gpu\n") == 0)
+		args.arg = 1;
+	else if (strcmp(buf, "input\n") == 0)
+		args.arg = 2;
+	else
+		args.arg = 3;
+	pr_debug("alienware-wmi: setting hdmi to %d : %s", args.arg, buf);
+
+	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_HDMI_SOURCE, &args,
+				    sizeof(args), NULL);
+
+	if (ret < 0)
+		pr_err("alienware-wmi: HDMI toggle failed: results: %u\n", ret);
+
+	return count;
+}
+
+static DEVICE_ATTR_RO(cable);
+static DEVICE_ATTR_RW(source);
+
+static bool hdmi_group_visible(struct kobject *kobj)
+{
+	struct alienfx_priv *priv = dev_get_drvdata(kobj_to_dev(kobj));
+
+	return priv->quirks->hdmi_mux;
+}
+DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(hdmi);
+
+static struct attribute *hdmi_attrs[] = {
+	&dev_attr_cable.attr,
+	&dev_attr_source.attr,
+	NULL,
+};
+
+static const struct attribute_group hdmi_attribute_group = {
+	.name = "hdmi",
+	.is_visible = SYSFS_GROUP_VISIBLE(hdmi),
+	.attrs = hdmi_attrs,
+};
+
+/*
+ * Alienware GFX amplifier support
+ * - Currently supports reading cable status
+ * - Leaving expansion room to possibly support dock/undock events later
+ */
+static ssize_t status_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
+{
+	struct alienfx_platdata *pdata = dev_get_platdata(dev);
+	struct wmax_basic_args in_args = {
+		.arg = 0,
+	};
+	u32 out_data;
+	int ret;
+
+	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_AMPLIFIER_CABLE,
+				    &in_args, sizeof(in_args), &out_data);
+
+	if (!ret) {
+		if (out_data == 0)
+			return sysfs_emit(buf, "[unconnected] connected unknown\n");
+		else if (out_data == 1)
+			return sysfs_emit(buf, "unconnected [connected] unknown\n");
+	}
+
+	pr_err("alienware-wmi: unknown amplifier cable status: %d\n", ret);
+	return sysfs_emit(buf, "unconnected connected [unknown]\n");
+}
+
+static DEVICE_ATTR_RO(status);
+
+static bool amplifier_group_visible(struct kobject *kobj)
+{
+	struct alienfx_priv *priv = dev_get_drvdata(kobj_to_dev(kobj));
+
+	return priv->quirks->amplifier;
+}
+DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(amplifier);
+
+static struct attribute *amplifier_attrs[] = {
+	&dev_attr_status.attr,
+	NULL,
+};
+
+static const struct attribute_group amplifier_attribute_group = {
+	.name = "amplifier",
+	.is_visible = SYSFS_GROUP_VISIBLE(amplifier),
+	.attrs = amplifier_attrs,
+};
+
+/*
+ * Deep Sleep Control support
+ * - Modifies BIOS setting for deep sleep control allowing extra wakeup events
+ */
+static ssize_t deepsleep_show(struct device *dev, struct device_attribute *attr,
+			      char *buf)
+{
+	struct alienfx_platdata *pdata = dev_get_platdata(dev);
+	struct wmax_basic_args in_args = {
+		.arg = 0,
+	};
+	u32 out_data;
+	int ret;
+
+	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_DEEP_SLEEP_STATUS,
+				    &in_args, sizeof(in_args), &out_data);
+
+	if (!ret) {
+		if (out_data == 0)
+			return sysfs_emit(buf, "[disabled] s5 s5_s4\n");
+		else if (out_data == 1)
+			return sysfs_emit(buf, "disabled [s5] s5_s4\n");
+		else if (out_data == 2)
+			return sysfs_emit(buf, "disabled s5 [s5_s4]\n");
+	}
+
+	pr_err("alienware-wmi: unknown deep sleep status: %d\n", ret);
+	return sysfs_emit(buf, "disabled s5 s5_s4 [unknown]\n");
+}
+
+static ssize_t deepsleep_store(struct device *dev, struct device_attribute *attr,
+			       const char *buf, size_t count)
+{
+	struct alienfx_platdata *pdata = dev_get_platdata(dev);
+	struct wmax_basic_args args;
+	int ret;
+
+	if (strcmp(buf, "disabled\n") == 0)
+		args.arg = 0;
+	else if (strcmp(buf, "s5\n") == 0)
+		args.arg = 1;
+	else
+		args.arg = 2;
+	pr_debug("alienware-wmi: setting deep sleep to %d : %s", args.arg, buf);
+
+	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_DEEP_SLEEP_CONTROL,
+				    &args, sizeof(args), NULL);
+
+	if (!ret)
+		pr_err("alienware-wmi: deep sleep control failed: results: %u\n", ret);
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(deepsleep);
+
+static bool deepsleep_group_visible(struct kobject *kobj)
+{
+	struct alienfx_priv *priv = dev_get_drvdata(kobj_to_dev(kobj));
+
+	return priv->quirks->deepslp;
+}
+DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(deepsleep);
+
+static struct attribute *deepsleep_attrs[] = {
+	&dev_attr_deepsleep.attr,
+	NULL,
+};
+
+static const struct attribute_group deepsleep_attribute_group = {
+	.name = "deepsleep",
+	.is_visible = SYSFS_GROUP_VISIBLE(deepsleep),
+	.attrs = deepsleep_attrs,
+};
+
+static const struct attribute_group *wmax_alienfx_groups[] = {
+	&hdmi_attribute_group,
+	&amplifier_attribute_group,
+	&deepsleep_attribute_group,
+	NULL
+};
+
+/*
+ * Thermal Profile control
+ *  - Provides thermal profile control through the Platform Profile API
+ */
+static bool is_wmax_thermal_code(u32 code)
+{
+	if (code & WMAX_SENSOR_ID_MASK)
+		return false;
+
+	if ((code & WMAX_THERMAL_MODE_MASK) >= THERMAL_MODE_LAST)
+		return false;
+
+	if ((code & WMAX_THERMAL_TABLE_MASK) == WMAX_THERMAL_TABLE_BASIC &&
+	    (code & WMAX_THERMAL_MODE_MASK) >= THERMAL_MODE_BASIC_QUIET)
+		return true;
+
+	if ((code & WMAX_THERMAL_TABLE_MASK) == WMAX_THERMAL_TABLE_USTT &&
+	    (code & WMAX_THERMAL_MODE_MASK) <= THERMAL_MODE_USTT_LOW_POWER)
+		return true;
+
+	return false;
+}
+
+static int wmax_thermal_information(struct wmi_device *wdev, u8 operation,
+				    u8 arg, u32 *out_data)
+{
+	struct wmax_u32_args in_args = {
+		.operation = operation,
+		.arg1 = arg,
+		.arg2 = 0,
+		.arg3 = 0,
+	};
+	int ret;
+
+	ret = alienware_wmi_command(wdev, WMAX_METHOD_THERMAL_INFORMATION,
+				    &in_args, sizeof(in_args), out_data);
+	if (ret < 0)
+		return ret;
+
+	if (*out_data == WMAX_FAILURE_CODE)
+		return -EBADRQC;
+
+	return 0;
+}
+
+static int wmax_thermal_control(struct wmi_device *wdev, u8 profile)
+{
+	struct wmax_u32_args in_args = {
+		.operation = WMAX_OPERATION_ACTIVATE_PROFILE,
+		.arg1 = profile,
+		.arg2 = 0,
+		.arg3 = 0,
+	};
+	u32 out_data;
+	int ret;
+
+	ret = alienware_wmi_command(wdev, WMAX_METHOD_THERMAL_CONTROL,
+				    &in_args, sizeof(in_args), &out_data);
+	if (ret)
+		return ret;
+
+	if (out_data == WMAX_FAILURE_CODE)
+		return -EBADRQC;
+
+	return 0;
+}
+
+static int wmax_game_shift_status(struct wmi_device *wdev, u8 operation,
+				  u32 *out_data)
+{
+	struct wmax_u32_args in_args = {
+		.operation = operation,
+		.arg1 = 0,
+		.arg2 = 0,
+		.arg3 = 0,
+	};
+	int ret;
+
+	ret = alienware_wmi_command(wdev, WMAX_METHOD_GAME_SHIFT_STATUS,
+				    &in_args, sizeof(in_args), out_data);
+
+	if (ret < 0)
+		return ret;
+
+	if (*out_data == WMAX_FAILURE_CODE)
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
+static int thermal_profile_get(struct platform_profile_handler *pprof,
+			       enum platform_profile_option *profile)
+{
+	struct awcc_priv *priv = container_of(pprof, struct awcc_priv, pp_handler);
+	u32 out_data;
+	int ret;
+
+	ret = wmax_thermal_information(priv->wdev, WMAX_OPERATION_CURRENT_PROFILE,
+				       0, &out_data);
+
+	if (ret < 0)
+		return ret;
+
+	if (out_data == WMAX_THERMAL_MODE_GMODE) {
+		*profile = PLATFORM_PROFILE_PERFORMANCE;
+		return 0;
+	}
+
+	if (!is_wmax_thermal_code(out_data))
+		return -ENODATA;
+
+	out_data &= WMAX_THERMAL_MODE_MASK;
+	*profile = wmax_mode_to_platform_profile[out_data];
+
+	return 0;
+}
+
+static int thermal_profile_set(struct platform_profile_handler *pprof,
+			       enum platform_profile_option profile)
+{
+	struct awcc_priv *priv = container_of(pprof, struct awcc_priv, pp_handler);
+
+	if (awcc->gmode) {
+		u32 gmode_status;
+		int ret;
+
+		ret = wmax_game_shift_status(priv->wdev,
+					     WMAX_OPERATION_GET_GAME_SHIFT_STATUS,
+					     &gmode_status);
+
+		if (ret < 0)
+			return ret;
+
+		if ((profile == PLATFORM_PROFILE_PERFORMANCE && !gmode_status) ||
+		    (profile != PLATFORM_PROFILE_PERFORMANCE && gmode_status)) {
+			ret = wmax_game_shift_status(priv->wdev,
+						     WMAX_OPERATION_TOGGLE_GAME_SHIFT,
+						     &gmode_status);
+
+			if (ret < 0)
+				return ret;
+		}
+	}
+
+	return wmax_thermal_control(priv->wdev,
+				    priv->supported_thermal_profiles[profile]);
+}
+
+static int create_thermal_profile(struct wmi_device *wdev)
+{
+	struct awcc_priv *priv = dev_get_drvdata(&wdev->dev);
+	enum platform_profile_option profile;
+	enum wmax_thermal_mode mode;
+	u8 sys_desc[4];
+	u32 first_mode;
+	u32 out_data;
+	int ret;
+
+	ret = wmax_thermal_information(wdev, WMAX_OPERATION_SYS_DESCRIPTION,
+				       0, (u32 *) &sys_desc);
+	if (ret < 0)
+		return ret;
+
+	first_mode = sys_desc[0] + sys_desc[1];
+
+	for (u32 i = 0; i < sys_desc[3]; i++) {
+		ret = wmax_thermal_information(wdev, WMAX_OPERATION_LIST_IDS,
+					       i + first_mode, &out_data);
+
+		if (ret == -EIO)
+			return ret;
+
+		if (ret == -EBADRQC)
+			break;
+
+		if (!is_wmax_thermal_code(out_data))
+			continue;
+
+		mode = out_data & WMAX_THERMAL_MODE_MASK;
+		profile = wmax_mode_to_platform_profile[mode];
+		priv->supported_thermal_profiles[profile] = out_data;
+
+		set_bit(profile, priv->pp_handler.choices);
+	}
+
+	if (bitmap_empty(priv->pp_handler.choices, PLATFORM_PROFILE_LAST))
+		return -ENODEV;
+
+	if (awcc->gmode) {
+		priv->supported_thermal_profiles[PLATFORM_PROFILE_PERFORMANCE] =
+			WMAX_THERMAL_MODE_GMODE;
+
+		set_bit(PLATFORM_PROFILE_PERFORMANCE, priv->pp_handler.choices);
+	}
+
+	priv->pp_handler.profile_get = thermal_profile_get;
+	priv->pp_handler.profile_set = thermal_profile_set;
+	priv->pp_handler.name = "alienware-wmi";
+	priv->pp_handler.dev = &wdev->dev;
+
+	return platform_profile_register(&priv->pp_handler);
+}
+
+static int alienware_awcc_setup(struct wmi_device *wdev)
+{
+	struct awcc_priv *priv;
+	int ret;
+
+	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	dev_set_drvdata(&wdev->dev, priv);
+	priv->wdev = wdev;
+
+	ret = create_thermal_profile(wdev);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static void alienware_awcc_exit(struct wmi_device *wdev)
+{
+	struct awcc_priv *priv;
+
+	priv = dev_get_drvdata(&wdev->dev);
+
+	platform_profile_remove(&priv->pp_handler);
+}
+
+/*
+ * WMAX WMI driver
+ */
+static int wmax_wmi_update_led(struct alienfx_priv *priv,
+			       struct wmi_device *wdev, u8 location)
+{
+	struct wmax_led_args in_args = {
+		.led_mask = 1 << location,
+		.colors = priv->colors[location],
+		.state = priv->lighting_control_state,
+	};
+
+	return alienware_wmi_command(wdev, WMAX_METHOD_ZONE_CONTROL, &in_args,
+				     sizeof(in_args), NULL);
+}
+
+static int wmax_wmi_update_brightness(struct alienfx_priv *priv,
+				      struct wmi_device *wdev, u8 brightness)
+{
+	struct wmax_brightness_args in_args = {
+		.led_mask = 0xFF,
+		.percentage = brightness,
+	};
+
+	return alienware_wmi_command(wdev, WMAX_METHOD_BRIGHTNESS, &in_args,
+				     sizeof(in_args), NULL);
+}
+
+static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
+{
+	struct alienfx_platdata pdata = {
+		.wdev = wdev,
+		.ops = {
+			.upd_led = wmax_wmi_update_led,
+			.upd_brightness = wmax_wmi_update_brightness,
+		},
+	};
+	struct platform_device *pdev;
+	int ret = 0;
+
+	if (awcc) {
+		ret = alienware_awcc_setup(wdev);
+	} else {
+		ret = alienware_alienfx_setup(&pdata);
+		if (ret < 0)
+			return ret;
+
+		pdev = dev_get_drvdata(&wdev->dev);
+		ret = device_add_groups(&pdev->dev, wmax_alienfx_groups);
+	}
+
+	return ret;
+}
+
+static void wmax_wmi_remove(struct wmi_device *wdev)
+{
+	if (awcc)
+		alienware_awcc_exit(wdev);
+	else
+		alienware_alienfx_exit(wdev);
+}
+
+static struct wmi_device_id alienware_wmax_device_id_table[] = {
+	{ WMAX_CONTROL_GUID, NULL },
+	{ },
+};
+MODULE_DEVICE_TABLE(wmi, alienware_wmax_device_id_table);
+
+static struct wmi_driver alienware_wmax_wmi_driver = {
+	.driver = {
+		.name = "alienware-wmi-wmax",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.id_table = alienware_wmax_device_id_table,
+	.probe = wmax_wmi_probe,
+	.remove = wmax_wmi_remove,
+};
+
+int __init alienware_wmax_wmi_init(void)
+{
+	const struct dmi_system_id *id;
+
+	id = dmi_first_match(awcc_dmi_table);
+	if (id)
+		awcc = id->driver_data;
+
+	if (force_platform_profile)
+		awcc = &x_series_features;
+
+	if (force_gmode)
+		awcc = &g_series_features;
+
+	return wmi_driver_register(&alienware_wmax_wmi_driver);
+}
+
+void __exit alienware_wmax_wmi_exit(void)
+{
+	wmi_driver_unregister(&alienware_wmax_wmi_driver);
+}
-- 
2.47.1


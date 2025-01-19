Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8626A1E25F2;
	Sun, 19 Jan 2025 22:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737324386; cv=none; b=PfHr6RvVMn7Y3aUoJpFXIG/e9NJXds3GBYzgurATxWE1ljqBt5xdgXCsbwDhR+QELG7Laz5RtykOfIUjQAEbfk6VHNX+9HiJBPGl2Srrw4LO/na3VLIdohrFRoQeLZlsMcH5K5amQ+5UsJdt89zSe3o09svtmphU6+ZGHWVG6XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737324386; c=relaxed/simple;
	bh=G2gH4E4dVTK/8cLW1Ly1jinrUxsUbQBNpkMQrj4WnS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fQczHGWLeLCcpbTR2sZ7EaicequkeBQ+bhHY0MNEiVOjwXTyxz1d+mJvz4qurvUF+21rHvgdzY0O1FEvj8oBetE5J98zvGhDz/6V9NwA4NnCByvW/eV1EILUShc0ZEV+rY60Y24KfINGEIQUKYW5qOjVnkfPKFTKGZ9Y0MH/E0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nV3p6IIW; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nV3p6IIW"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7b6f19a6c04so339704485a.0;
        Sun, 19 Jan 2025 14:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737324382; x=1737929182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FUbe/N0R/8R00cRbzUwcj9WvJ8xXlERk696WZW+SFlk=;
        b=nV3p6IIWZFUBhepg3Ml7Ss/oYy/dXmxIDR1nwcItK7wuQ9l58AcAL93OE/0PjZ9iC9
         cw+CzQYG61n+zVeNg3sjwixMpPHuePNT/n1REEsGg/G3GRBPCd2W9jkLKWQGQsIZlVoP
         0/xs5TFwQaNtQDRTiuYCngoiTLKElZlzKqif4/b7gdO8cnrX5YJqLqaSdT3wb20U2YZ3
         KXCR/Dkhv5IN0idpPmp+tSOi9HIhtt3XxI3z6gPSye9dXNe+Bev222ZoqEeW7QQjcXOf
         Mlj8PbHNufxzH/3o7ojmA7iDrTE1JmIMuKKdTTSlMcG2oyMa/6VHDRBlNn8LLmKCy5sb
         6bog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737324382; x=1737929182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FUbe/N0R/8R00cRbzUwcj9WvJ8xXlERk696WZW+SFlk=;
        b=pODNYo4YLOs6mFMsNo2KzZbd887f3MOUqWxAD7WxvR+uFyWBqOFU/ydVVfPQaRfumE
         yX7rIDz+GnAQb+BOKJHRJp/BrylHCVwFL2jPVOl4qVa9F4dSWGRdRzMrSuNtGDm1/EkQ
         zQUbRS4xJObJxgRQscm+R0mT/ENfZdeK1URfS7u+isBYHSr+LMmLadGSDPnDkPyOyTPL
         kqmMAAnvbzXB81c8jWHFhOqJD7QvGpsL2scheZDDzdIDdv68Ph6jn3H6ETjenEyj7Psy
         cdYKS9rlDRKw5M0SqgD0DekUCpSTGtVP3LgoGhkPJJ9FLZck0f9hDA/TxWUygr7ARWmv
         zYHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjRVoSUmpKrpJB10yr+gjvmqzpq7HWk4zr0KRnIJc5lEIu/aNhdByD5ZSWDlZmKC2W+pRqd7rKFLWaKHQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZsqaNQBNnBN3UZcS2PCVmvl5P0h3y8+qIWDCNflMHWRhqDsQS
	no+F0j5FbDGso98g9U09f4SKbHbzRITx0bTP6YldAfHKlWPEV6yg3LiCLw==
X-Gm-Gg: ASbGncun/G61pLQOkC6t2MrNwqU1JrCEZvDUy01w6Bl+44VBP+0KS8UOn3vy8pxVFLF
	c2N+P7Op+NVtM3CKZlZwg+yDcxo2axbclbCLD5MctWgIZfExAJRlbHJ2ix0Lt6yTGt7atOzoDiN
	+ATQ0nWL5igU8s3C1Nbog8JpTzVrd1523xhkvjtoRFdWLHjGlZjRvIInk1jEb94ccvYD0lXVUDw
	teHcVKay8HRfu0D4xX6V5yxeTUS47uxhSlwWxuwLHVRclau45WM/sqi1lsoQNCjrHwBiaUkaDv7
	fQ==
X-Google-Smtp-Source: AGHT+IFFGLKyT+cLY4JGBuXfwDFGNprb7heMjH8WC0Nem9LQzFsM1iUpTsHYwKRZpaKOtvMZoWdwxw==
X-Received: by 2002:a05:620a:4453:b0:7be:2a68:6d79 with SMTP id af79cd13be357-7be6321032cmr2225425385a.7.1737324381669;
        Sun, 19 Jan 2025 14:06:21 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:c837:3446:190b:188d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be614f0096sm369243085a.112.2025.01.19.14.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 14:06:20 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v5 11/14] platform/x86: Split the alienware-wmi driver
Date: Sun, 19 Jan 2025 17:05:39 -0500
Message-ID: <20250119220542.3136-12-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250119220542.3136-1-kuurtb@gmail.com>
References: <20250119220542.3136-1-kuurtb@gmail.com>
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
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/Makefile            |   2 +
 .../platform/x86/dell/alienware-wmi-base.c    | 851 ------------------
 .../platform/x86/dell/alienware-wmi-legacy.c  | 101 +++
 .../platform/x86/dell/alienware-wmi-wmax.c    | 774 ++++++++++++++++
 drivers/platform/x86/dell/alienware-wmi.h     |   1 -
 5 files changed, 877 insertions(+), 852 deletions(-)
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
index f6001c53d631..d0f0b3c7a915 100644
--- a/drivers/platform/x86/dell/alienware-wmi-base.c
+++ b/drivers/platform/x86/dell/alienware-wmi-base.c
@@ -8,97 +8,22 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/acpi.h>
-#include <linux/bitfield.h>
-#include <linux/bits.h>
 #include <linux/cleanup.h>
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
 struct alienfx_quirks *alienfx;
 
 static struct alienfx_quirks quirk_inspiron5675 = {
@@ -223,139 +148,8 @@ static const struct dmi_system_id alienware_quirks[] __initconst = {
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
-	struct device *ppdev;
-	enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROFILE_LAST];
-};
-
 static u8 interface;
 
-struct awcc_quirks {
-	bool gmode;
-};
-
-static struct awcc_quirks g_series_quirks = {
-	.gmode = true,
-};
-
-static struct awcc_quirks generic_quirks = {
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
-		.driver_data = &generic_quirks,
-	},
-	{
-		.ident = "Alienware m18 R2",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m18 R2"),
-		},
-		.driver_data = &generic_quirks,
-	},
-	{
-		.ident = "Alienware x15 R1",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x15 R1"),
-		},
-		.driver_data = &generic_quirks,
-	},
-	{
-		.ident = "Alienware x17 R2",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x17 R2"),
-		},
-		.driver_data = &generic_quirks,
-	},
-	{
-		.ident = "Dell Inc. G15 5510",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5510"),
-		},
-		.driver_data = &g_series_quirks,
-	},
-	{
-		.ident = "Dell Inc. G15 5511",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5511"),
-		},
-		.driver_data = &g_series_quirks,
-	},
-	{
-		.ident = "Dell Inc. G15 5515",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5515"),
-		},
-		.driver_data = &g_series_quirks,
-	},
-	{
-		.ident = "Dell Inc. G3 3500",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3500"),
-		},
-		.driver_data = &g_series_quirks,
-	},
-	{
-		.ident = "Dell Inc. G3 3590",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3590"),
-		},
-		.driver_data = &g_series_quirks,
-	},
-	{
-		.ident = "Dell Inc. G5 5500",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "G5 5500"),
-		},
-		.driver_data = &g_series_quirks,
-	},
-};
-
-static struct awcc_quirks *awcc;
-
 int alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
 			  void *in_args, size_t in_size, u32 *out_data)
 {
@@ -591,449 +385,6 @@ static enum led_brightness global_led_get(struct led_classdev *led_cdev)
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
-	return alienfx->hdmi_mux;
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
-	return alienfx->amplifier;
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
-	return alienfx->deepslp;
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
-static int thermal_profile_get(struct device *dev,
-			       enum platform_profile_option *profile)
-{
-	struct awcc_priv *priv = dev_get_drvdata(dev);
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
-static int thermal_profile_set(struct device *dev,
-			       enum platform_profile_option profile)
-{
-	struct awcc_priv *priv = dev_get_drvdata(dev);
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
-static int thermal_profile_probe(void *drvdata, unsigned long *choices)
-{
-	enum platform_profile_option profile;
-	struct awcc_priv *priv = drvdata;
-	enum wmax_thermal_mode mode;
-	u8 sys_desc[4];
-	u32 first_mode;
-	u32 out_data;
-	int ret;
-
-	ret = wmax_thermal_information(priv->wdev, WMAX_OPERATION_SYS_DESCRIPTION,
-				       0, (u32 *) &sys_desc);
-	if (ret < 0)
-		return ret;
-
-	first_mode = sys_desc[0] + sys_desc[1];
-
-	for (u32 i = 0; i < sys_desc[3]; i++) {
-		ret = wmax_thermal_information(priv->wdev, WMAX_OPERATION_LIST_IDS,
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
-		set_bit(profile, choices);
-	}
-
-	if (bitmap_empty(choices, PLATFORM_PROFILE_LAST))
-		return -ENODEV;
-
-	if (awcc->gmode) {
-		priv->supported_thermal_profiles[PLATFORM_PROFILE_PERFORMANCE] =
-			WMAX_THERMAL_MODE_GMODE;
-
-		set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
-	}
-
-	return 0;
-}
-
-static const struct platform_profile_ops awcc_platform_profile_ops = {
-	.probe = thermal_profile_probe,
-	.profile_get = thermal_profile_get,
-	.profile_set = thermal_profile_set,
-};
-
-static int alienware_awcc_setup(struct wmi_device *wdev)
-{
-	struct awcc_priv *priv;
-
-	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-
-	priv->wdev = wdev;
-	dev_set_drvdata(&wdev->dev, priv);
-
-	priv->ppdev = devm_platform_profile_register(&wdev->dev, "alienware-wmi",
-						     priv, &awcc_platform_profile_ops);
-
-	return PTR_ERR_OR_ZERO(priv->ppdev);
-}
-
 /*
  * Platform Driver
  */
@@ -1066,13 +417,6 @@ static const struct attribute_group *alienfx_groups[] = {
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
@@ -1101,201 +445,6 @@ void alienware_alienfx_exit(struct wmi_device *wdev)
 	platform_device_unregister(pdev);
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
-static const struct wmi_device_id alienware_legacy_device_id_table[] = {
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
-	.no_singleton = true,
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
-		return alienware_awcc_setup(wdev);
-	} else {
-		ret = alienware_alienfx_setup(&pdata);
-		if (ret < 0)
-			return ret;
-
-		pdev = dev_get_drvdata(&wdev->dev);
-
-		ret = device_add_groups(&pdev->dev, wmax_alienfx_groups);
-		if (ret < 0)
-			alienware_alienfx_exit(wdev);
-
-		return ret;
-	}
-}
-
-static void wmax_wmi_remove(struct wmi_device *wdev)
-{
-	struct platform_device *pdev;
-
-	if (!awcc) {
-		pdev = dev_get_drvdata(&wdev->dev);
-
-		device_remove_groups(&pdev->dev, wmax_alienfx_groups);
-		alienware_alienfx_exit(wdev);
-	}
-}
-
-static const struct wmi_device_id alienware_wmax_device_id_table[] = {
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
-	.no_singleton = true,
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
-		awcc = &generic_quirks;
-
-	if (force_gmode) {
-		if (awcc)
-			awcc->gmode = true;
-		else
-			pr_warn("force_gmode requires platform profile support\n");
-	}
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
index 000000000000..48f8a204c7cc
--- /dev/null
+++ b/drivers/platform/x86/dell/alienware-wmi-legacy.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Alienware LEGACY WMI device driver
+ *
+ * Copyright (C) 2025 Kurt Borja <kuurtb@gmail.com>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
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
+static const struct wmi_device_id alienware_legacy_device_id_table[] = {
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
+	.no_singleton = true,
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
index 000000000000..7f9298950731
--- /dev/null
+++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
@@ -0,0 +1,774 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Alienware WMAX WMI device driver
+ *
+ * Copyright (C) 2014 Dell Inc <Dell.Client.Kernel@dell.com>
+ * Copyright (C) 2025 Kurt Borja <kuurtb@gmail.com>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
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
+static struct awcc_quirks g_series_quirks = {
+	.gmode = true,
+};
+
+static struct awcc_quirks generic_quirks = {
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
+		.driver_data = &generic_quirks,
+	},
+	{
+		.ident = "Alienware m18 R2",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m18 R2"),
+		},
+		.driver_data = &generic_quirks,
+	},
+	{
+		.ident = "Alienware x15 R1",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x15 R1"),
+		},
+		.driver_data = &generic_quirks,
+	},
+	{
+		.ident = "Alienware x17 R2",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x17 R2"),
+		},
+		.driver_data = &generic_quirks,
+	},
+	{
+		.ident = "Dell Inc. G15 5510",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5510"),
+		},
+		.driver_data = &g_series_quirks,
+	},
+	{
+		.ident = "Dell Inc. G15 5511",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5511"),
+		},
+		.driver_data = &g_series_quirks,
+	},
+	{
+		.ident = "Dell Inc. G15 5515",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5515"),
+		},
+		.driver_data = &g_series_quirks,
+	},
+	{
+		.ident = "Dell Inc. G3 3500",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3500"),
+		},
+		.driver_data = &g_series_quirks,
+	},
+	{
+		.ident = "Dell Inc. G3 3590",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3590"),
+		},
+		.driver_data = &g_series_quirks,
+	},
+	{
+		.ident = "Dell Inc. G5 5500",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "G5 5500"),
+		},
+		.driver_data = &g_series_quirks,
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
+	struct device *ppdev;
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
+static struct awcc_quirks *awcc;
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
+	return alienfx->hdmi_mux;
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
+	return alienfx->amplifier;
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
+	return alienfx->deepslp;
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
+static int thermal_profile_get(struct device *dev,
+			       enum platform_profile_option *profile)
+{
+	struct awcc_priv *priv = dev_get_drvdata(dev);
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
+static int thermal_profile_set(struct device *dev,
+			       enum platform_profile_option profile)
+{
+	struct awcc_priv *priv = dev_get_drvdata(dev);
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
+static int thermal_profile_probe(void *drvdata, unsigned long *choices)
+{
+	enum platform_profile_option profile;
+	struct awcc_priv *priv = drvdata;
+	enum wmax_thermal_mode mode;
+	u8 sys_desc[4];
+	u32 first_mode;
+	u32 out_data;
+	int ret;
+
+	ret = wmax_thermal_information(priv->wdev, WMAX_OPERATION_SYS_DESCRIPTION,
+				       0, (u32 *) &sys_desc);
+	if (ret < 0)
+		return ret;
+
+	first_mode = sys_desc[0] + sys_desc[1];
+
+	for (u32 i = 0; i < sys_desc[3]; i++) {
+		ret = wmax_thermal_information(priv->wdev, WMAX_OPERATION_LIST_IDS,
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
+		set_bit(profile, choices);
+	}
+
+	if (bitmap_empty(choices, PLATFORM_PROFILE_LAST))
+		return -ENODEV;
+
+	if (awcc->gmode) {
+		priv->supported_thermal_profiles[PLATFORM_PROFILE_PERFORMANCE] =
+			WMAX_THERMAL_MODE_GMODE;
+
+		set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
+	}
+
+	return 0;
+}
+
+static const struct platform_profile_ops awcc_platform_profile_ops = {
+	.probe = thermal_profile_probe,
+	.profile_get = thermal_profile_get,
+	.profile_set = thermal_profile_set,
+};
+
+static int alienware_awcc_setup(struct wmi_device *wdev)
+{
+	struct awcc_priv *priv;
+
+	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->wdev = wdev;
+	dev_set_drvdata(&wdev->dev, priv);
+
+	priv->ppdev = devm_platform_profile_register(&wdev->dev, "alienware-wmi",
+						     priv, &awcc_platform_profile_ops);
+
+	return PTR_ERR_OR_ZERO(priv->ppdev);
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
+		return alienware_awcc_setup(wdev);
+	} else {
+		ret = alienware_alienfx_setup(&pdata);
+		if (ret < 0)
+			return ret;
+
+		pdev = dev_get_drvdata(&wdev->dev);
+
+		ret = device_add_groups(&pdev->dev, wmax_alienfx_groups);
+		if (ret < 0)
+			alienware_alienfx_exit(wdev);
+
+		return ret;
+	}
+}
+
+static void wmax_wmi_remove(struct wmi_device *wdev)
+{
+	struct platform_device *pdev;
+
+	if (!awcc) {
+		pdev = dev_get_drvdata(&wdev->dev);
+
+		device_remove_groups(&pdev->dev, wmax_alienfx_groups);
+		alienware_alienfx_exit(wdev);
+	}
+}
+
+static const struct wmi_device_id alienware_wmax_device_id_table[] = {
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
+	.no_singleton = true,
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
+		awcc = &generic_quirks;
+
+	if (force_gmode) {
+		if (awcc)
+			awcc->gmode = true;
+		else
+			pr_warn("force_gmode requires platform profile support\n");
+	}
+
+	return wmi_driver_register(&alienware_wmax_wmi_driver);
+}
+
+void __exit alienware_wmax_wmi_exit(void)
+{
+	wmi_driver_unregister(&alienware_wmax_wmi_driver);
+}
diff --git a/drivers/platform/x86/dell/alienware-wmi.h b/drivers/platform/x86/dell/alienware-wmi.h
index 00b7505e1073..188440ef096e 100644
--- a/drivers/platform/x86/dell/alienware-wmi.h
+++ b/drivers/platform/x86/dell/alienware-wmi.h
@@ -46,7 +46,6 @@ struct color_platform {
 
 struct alienfx_priv {
 	struct platform_device *pdev;
-	struct alienfx_quirks *quirks;
 	struct led_classdev global_led;
 	struct color_platform colors[4];
 	u8 global_brightness;
-- 
2.48.1


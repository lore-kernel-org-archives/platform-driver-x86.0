Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8D01FC0F4;
	Sat, 21 Dec 2024 06:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734760844; cv=none; b=gx0AEkon+SDwXt7rw6ikRXV7GozLp5U+QVh6NsAnbI8DPxpS7YFKyn1yw5XYb8kvOzcH7GXjfwwQYwQJEHnGGbSOkIjvx2/EhVCPgUtE6vcazsgomr9wYbNXf4QiRSZqyLXSKaex0eHI5r95OMPUbomiP9JJOlDqXuvcWQbXySg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734760844; c=relaxed/simple;
	bh=U0ZociPc7NkHcP7tQQwcyLerTBGDWblBB7NZMGevoP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ku45S8i/42axjnKnrzUeJh1PSRx7zHrqxwUelrGRZOtVJqer3Ol/4XvsQ6wstusHBgxAo07nbDzWTNuRCzpDTBXN7Y3X2JU/d2HCAr1PE7069aMo8UBQ2R1Bzz2bay2mZSlCh2m1gumVHFqWyBrrIKX0Vdqq+24w5duUd6pgh7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mcKaqyQP; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mcKaqyQP"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6f150ddc86dso21554217b3.1;
        Fri, 20 Dec 2024 22:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734760840; x=1735365640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mPNkvL/R8QYxLzw1K623aBRkK8IaDv1TB39CxPOYPAY=;
        b=mcKaqyQPur7DjPhxD6XvUD+p3FzZgJw3Ke93VY78Bp7rmoh1bX2wT8C6+Q27SHpvi/
         0E23g1pmtc7WZrh4bzWUY11O/dGd8JzsF0reKaNLbW1BLX3+Yo1vCqwZXR4aYfFC22n5
         RZMQmDvqaYDmKIZy7KHfeeS/aLY8DFTrN2OxyMP5uoxN5EvXrd14nbND8zgc/m1/YbE0
         ElhQLVhvzrQ33M/pPKwDeCaaOvuEPGVyNajyARyf2Ih45sMcGSNV3VV999pqUyDPCtO2
         hZ0e9pZbY5VMuxkPD/BQDIpZv78bZqiML/CCAIkWBevKOOR+C0b/weoXgmzleDCqzcFE
         1U4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734760840; x=1735365640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mPNkvL/R8QYxLzw1K623aBRkK8IaDv1TB39CxPOYPAY=;
        b=oshZJv+7CRFAwy3S+VoCWM8Zfef7pfL8TrlKIVTfylsFryqtdLdWqojsasvn7VbXA0
         gIaP2PD/wowr7vveDokvps6lsUxxmmENvTS7bTeleCkjqHLFEywfWmV5VBYvCaCtjE4i
         TLPqxuPqBoxAURFLHxJb1K4kspgIdEtZz+FM23qGXI4huX3xG2EZUsNgigy34SlDcOF7
         VnouhiBVZ6Wt8D0eC5/ezRNie6ZrxWtRWobVEpuPPeSg7CDV/AljLwv8GOWNAmfuGzIV
         M7CyBdjj23ozUUg5+0NomOtY8F0t/h1QtZMNSqe6+Pj3VmYAZWla2LFkOrEMsnkvW/Dz
         IrwA==
X-Forwarded-Encrypted: i=1; AJvYcCU8jqSFOYxnLw0ad7OJT57Hk8j7RIZOftRQ27ouovm43jieCqPExodAmFVnTU7qhJo4sy/nul5lz3albvk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGw7irvX58F4ggPLDZC5bOdIRlwulPuZU4oWg5mk0KdhJVa5Bm
	nmRNf8zFNX9OuBTlCpg2D7K/yxFDHBAPSNFfY8jycPlCzKgN4jIm5lvm3g==
X-Gm-Gg: ASbGncuGnx1bMm5K3dxPnKI6vk4wHKiMn0xAjpHBk2LLnBX8R4DBhNgWpKmf/fBuSMV
	+z/1EPtqVMM0MfRtf07ovSqOM6OuG8lswGH7kDV6Xc2pITobCLEXf+LQ+oy5NoN1Doj6PwBOD8k
	QFzoM/Sjd3FJgp5PBMnzVKBpwEStwDlXBZZDOYnAEbOUzGCg8cfoqvVVXub6EUFAMxlafCYQA3P
	5RgH0djSPQQAYknYa6Ld7oQER9utq3lnwH5K560eSYbtsjhvTBAbPZTXKIYkF4K
X-Google-Smtp-Source: AGHT+IHXEIaPUxYAVad6YwV2XEYloCkQVqf9vkn7O3BVZSO2hL1jm+dBO3GC6AB8lACuufIRrUOpxg==
X-Received: by 2002:a05:690c:6911:b0:6ef:53bb:a83a with SMTP id 00721157ae682-6f3f814b16amr54164087b3.24.1734760839953;
        Fri, 20 Dec 2024 22:00:39 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f3e783ab9dsm12164077b3.119.2024.12.20.22.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 22:00:39 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	mario.limonciello@amd.com,
	w_armin@gmx.de,
	hdegoede@redhat.com,
	linux-kernel@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH 17/20] platform-x86: Split the alienware-wmi driver
Date: Sat, 21 Dec 2024 00:59:14 -0500
Message-ID: <20241221055917.10555-18-kuurtb@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241221055917.10555-1-kuurtb@gmail.com>
References: <20241221055917.10555-1-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split alienware-wmi WMI drivers into different files. This is done
seamlessly by copying and pasting.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/Makefile            |   2 +
 .../platform/x86/dell/alienware-wmi-base.c    | 596 ------------------
 .../platform/x86/dell/alienware-wmi-legacy.c  |  89 +++
 .../platform/x86/dell/alienware-wmi-wmax.c    | 526 ++++++++++++++++
 4 files changed, 617 insertions(+), 596 deletions(-)
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
index e8d470bbb608..450ba0a48004 100644
--- a/drivers/platform/x86/dell/alienware-wmi-base.c
+++ b/drivers/platform/x86/dell/alienware-wmi-base.c
@@ -8,80 +8,21 @@
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
 struct quirk_entry {
 	u8 num_zones;
 	u8 hdmi_mux;
@@ -213,120 +154,10 @@ static const struct dmi_system_id alienware_quirks[] __initconst = {
 	{}
 };
 
-struct awcc_features {
-	bool gmode;
-};
-
-static struct awcc_features g_series_features = {
-	.gmode = true,
-};
-
-static struct awcc_features x_series_features = {
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
-struct awcc_features *awcc;
-
 struct wmax_basic_args {
 	u8 arg;
 };
 
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
 static u8 interface;
 
 acpi_status alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
@@ -775,250 +606,6 @@ static const struct attribute_group deepsleep_attribute_group = {
 	.attrs = deepsleep_attrs,
 };
 
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
-	acpi_status status;
-
-	status = alienware_wmi_command(wdev, WMAX_METHOD_THERMAL_INFORMATION,
-				       &in_args, sizeof(in_args), out_data);
-
-	if (ACPI_FAILURE(status))
-		return -EIO;
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
-	acpi_status status;
-	u32 out_data;
-
-	status = alienware_wmi_command(wdev, WMAX_METHOD_THERMAL_CONTROL,
-				       &in_args, sizeof(in_args), &out_data);
-
-	if (ACPI_FAILURE(status))
-		return -EIO;
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
-	acpi_status status;
-
-	status = alienware_wmi_command(wdev, WMAX_METHOD_GAME_SHIFT_STATUS,
-				       &in_args, sizeof(in_args), out_data);
-
-	if (ACPI_FAILURE(status))
-		return -EIO;
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
-	struct awcc_priv *priv;
-	u32 out_data;
-	int ret;
-
-	priv = container_of(pprof, struct awcc_priv, pp_handler);
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
-	struct awcc_priv *priv;
-
-	priv = container_of(pprof, struct awcc_priv, pp_handler);
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
-	enum platform_profile_option profile;
-	enum wmax_thermal_mode mode;
-	struct awcc_priv *priv;
-	u8 sys_desc[4];
-	u32 first_mode;
-	u32 out_data;
-	int ret;
-
-	priv = dev_get_drvdata(&wdev->dev);
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
-	int ret;
-
-	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-
-	dev_set_drvdata(&wdev->dev, priv);
-
-	priv->wdev = wdev;
-
-	ret = create_thermal_profile(wdev);
-	if (ret < 0)
-		return ret;
-
-	return 0;
-}
-
-static void alienware_awcc_exit(struct wmi_device *wdev)
-{
-	struct awcc_priv *priv;
-
-	priv = dev_get_drvdata(&wdev->dev);
-
-	platform_profile_remove(&priv->pp_handler);
-}
-
 /*
  * Platform Driver
  */
@@ -1097,189 +684,6 @@ void alienware_alienfx_exit(struct wmi_device *wdev)
 	platform_driver_unregister(&platform_driver);
 }
 
-/*
- * Legacy WMI driver
- */
-static int legacy_wmi_update_led(struct alienfx_priv *priv,
-				 struct wmi_device *wdev, u8 location)
-{
-	struct legacy_led_args legacy_args;
-	struct acpi_buffer input;
-	acpi_status status;
-
-	legacy_args.colors = priv->colors[location];
-	legacy_args.brightness = priv->global_brightness;
-	legacy_args.state = priv->lighting_control_state;
-
-	input.length = sizeof(legacy_args);
-	input.pointer = &legacy_args;
-
-	if (legacy_args.state == LEGACY_RUNNING)
-		status = alienware_wmi_command(wdev, location + 1, &legacy_args,
-					       sizeof(legacy_args), NULL);
-	else
-		status = wmi_evaluate_method(LEGACY_POWER_CONTROL_GUID, 0,
-					     location + 1, &input, NULL);
-
-	if (ACPI_FAILURE(status))
-		return -EIO;
-
-	return 0;
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
-	acpi_status status;
-
-	status = alienware_wmi_command(wdev, WMAX_METHOD_ZONE_CONTROL,
-				       &in_args, sizeof(in_args), NULL);
-	if (ACPI_FAILURE(status))
-		return -EIO;
-
-	return 0;
-}
-
-static int wmax_wmi_update_brightness(struct alienfx_priv *priv,
-				      struct wmi_device *wdev, u8 brightness)
-{
-	struct wmax_brightness_args in_args = {
-		.led_mask = 0xFF,
-		.percentage = brightness,
-	};
-	acpi_status status;
-
-	status = alienware_wmi_command(wdev, WMAX_METHOD_BRIGHTNESS, &in_args,
-				       sizeof(in_args), NULL);
-	if (ACPI_FAILURE(status))
-		return -EIO;
-
-	return 0;
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
-	int ret = 0;
-
-	if (awcc)
-		ret = alienware_awcc_setup(wdev);
-	else
-		ret = alienware_alienfx_setup(&pdata);
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
index 000000000000..38dd2a602f34
--- /dev/null
+++ b/drivers/platform/x86/dell/alienware-wmi-legacy.c
@@ -0,0 +1,89 @@
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
+/*
+ * Legacy WMI driver
+ */
+static int legacy_wmi_update_led(struct alienfx_priv *priv,
+				 struct wmi_device *wdev, u8 location)
+{
+	struct legacy_led_args legacy_args;
+	struct acpi_buffer input;
+	acpi_status status;
+
+	legacy_args.colors = priv->colors[location];
+	legacy_args.brightness = priv->global_brightness;
+	legacy_args.state = priv->lighting_control_state;
+
+	input.length = sizeof(legacy_args);
+	input.pointer = &legacy_args;
+
+	if (legacy_args.state == LEGACY_RUNNING)
+		status = alienware_wmi_command(wdev, location + 1, &legacy_args,
+					       sizeof(legacy_args), NULL);
+	else
+		status = wmi_evaluate_method(LEGACY_POWER_CONTROL_GUID, 0,
+					     location + 1, &input, NULL);
+
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	return 0;
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
index 000000000000..75b9a1f029b2
--- /dev/null
+++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
@@ -0,0 +1,526 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Alienware WMAX WMI device driver
+ *
+ * Copyright (C) 2024 Kurt Borja <kuurtb@gmail.com>
+ */
+
+#include <linux/dmi.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/moduleparam.h>
+#include <linux/platform_profile.h>
+#include <linux/wmi.h>
+#include "alienware-wmi.h"
+
+#define WMAX_THERMAL_TABLE_MASK		GENMASK(7, 4)
+#define WMAX_THERMAL_MODE_MASK		GENMASK(3, 0)
+#define WMAX_SENSOR_ID_MASK		BIT(8)
+
+static bool force_platform_profile;
+module_param_unsafe(force_platform_profile, bool, 0);
+MODULE_PARM_DESC(force_platform_profile, "Forces auto-detecting thermal profiles without checking if WMI thermal backend is available");
+
+static bool force_gmode;
+module_param_unsafe(force_gmode, bool, 0);
+MODULE_PARM_DESC(force_gmode, "Forces G-Mode when performance profile is selected");
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
+struct awcc_features {
+	bool gmode;
+};
+
+static struct awcc_features g_series_features = {
+	.gmode = true,
+};
+
+static struct awcc_features x_series_features = {
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
+struct awcc_features *awcc;
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
+	acpi_status status;
+
+	status = alienware_wmi_command(wdev, WMAX_METHOD_THERMAL_INFORMATION,
+				       &in_args, sizeof(in_args), out_data);
+
+	if (ACPI_FAILURE(status))
+		return -EIO;
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
+	acpi_status status;
+	u32 out_data;
+
+	status = alienware_wmi_command(wdev, WMAX_METHOD_THERMAL_CONTROL,
+				       &in_args, sizeof(in_args), &out_data);
+
+	if (ACPI_FAILURE(status))
+		return -EIO;
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
+	acpi_status status;
+
+	status = alienware_wmi_command(wdev, WMAX_METHOD_GAME_SHIFT_STATUS,
+				       &in_args, sizeof(in_args), out_data);
+
+	if (ACPI_FAILURE(status))
+		return -EIO;
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
+	struct awcc_priv *priv;
+	u32 out_data;
+	int ret;
+
+	priv = container_of(pprof, struct awcc_priv, pp_handler);
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
+	struct awcc_priv *priv;
+
+	priv = container_of(pprof, struct awcc_priv, pp_handler);
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
+	enum platform_profile_option profile;
+	enum wmax_thermal_mode mode;
+	struct awcc_priv *priv;
+	u8 sys_desc[4];
+	u32 first_mode;
+	u32 out_data;
+	int ret;
+
+	priv = dev_get_drvdata(&wdev->dev);
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
+
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
+	acpi_status status;
+
+	status = alienware_wmi_command(wdev, WMAX_METHOD_ZONE_CONTROL,
+				       &in_args, sizeof(in_args), NULL);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	return 0;
+}
+
+static int wmax_wmi_update_brightness(struct alienfx_priv *priv,
+				      struct wmi_device *wdev, u8 brightness)
+{
+	struct wmax_brightness_args in_args = {
+		.led_mask = 0xFF,
+		.percentage = brightness,
+	};
+	acpi_status status;
+
+	status = alienware_wmi_command(wdev, WMAX_METHOD_BRIGHTNESS, &in_args,
+				       sizeof(in_args), NULL);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	return 0;
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
+	int ret = 0;
+
+	if (awcc)
+		ret = alienware_awcc_setup(wdev);
+	else
+		ret = alienware_alienfx_setup(&pdata);
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


Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEA14689;
	Thu,  2 Jan 2025 00:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735778951; cv=none; b=J+b2W9inCMFynx3H88aZQB9W6Rpx2NAF01o+4m+HtEldRYmMs1KFRHJRy4nA4/DCdBnt9yLTmnpgAjRd8K4wTZ5H0xWsFL5pTUeXfu40hkHd29dQUShYCOf4jrjbuC06pcak6wCcMFibLcutsmvzzvdN0yqqRatrTyFet0blRC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735778951; c=relaxed/simple;
	bh=WiP2RuQ+3vBwByJV33udqyrQPAWZBLVZKBQQiTrIGA8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bnR3QQyKoNKOiBeB5GRhvzxedlLXFiLdnApjIBf+lYkUuH5V2QAMYUrDEgonL6JjzPzm9zSAirqUZmtU1JZz9kfaKVw3dyso4wvksvCMvsLpoH/4/Nd+7LvND6+MRDh27H/JFULbc/yQ2BoC3hM71b16Trm3mtOOf0jb0s7vdv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=McWaIsw6; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="McWaIsw6"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ee76befe58so15045192a91.2;
        Wed, 01 Jan 2025 16:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735778948; x=1736383748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qgepQQY65Rjix+QY9dKxawxq+/tV33uZISaYDEwRLOo=;
        b=McWaIsw6MjL0E96pXv1uOL5K5UbyyfxU03GGpAjZ4V6PDAzRtSO/A/iZ6A05MXCK1l
         qQ4Leys0FgSQqqVy2RiGkPHNbTMkza03b2PLcHGfEurRbAmveoDrBkwRtcysDyIwmfSQ
         31mQ7SlsSR+b1MhgzZjhL4WfYp8wG6SNQnvqPpmlvrTxyHpbg9Kbi4q6gK+X2xlzTiuP
         pUZ6TxCAdlNWMhHHKAffBMFCm2VqkYKpyk1w0tfEO5eRufFOn3BJ2NE7K2UkucPXiHMY
         AJEbqGLW6RU3eWi3bo1DlCRzsWR7PBIsgJfW+zpFl9QCOLncOTmmjGdQvBCfLeLJxaQk
         XcLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735778948; x=1736383748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qgepQQY65Rjix+QY9dKxawxq+/tV33uZISaYDEwRLOo=;
        b=vqiEiVgbzJKZOml2+io9wCPFdJkHESVQ1uoQGddLVFVcOqGs9TyIyhNqEThYabN+bv
         R8Sd+uKsO94q9REH/prgTSCQwEmIoQG5TaKtOU32MnvxRyxK2jDOLoKT2dH608LbUVRt
         iN0TwFvX2oAqZcoBW2WwFPiAVsK+YLzmQ+RFFwlpSSv6MDbQKV7cUL7LomoryL7XUsHW
         c0xFpDcgWV8PzpjM2vXtkCMmOXUgUMZlNQcKKDgFGAdMcBZzRTjMuUt8agRcIOzhPJal
         wwcNEQOHP4Fg8GzppDrHL+NL9GJKa00eNMg4jRfhZ8oVJ+7h0szx0dkhD079laSkB9Nu
         grGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXTRItPsOlOo3xzrZMxADp/wAwEkA4MvWh01kNzMbv8jL/fhs85dEb9je1AWGjWrRPEgG2kTMNXXY=@vger.kernel.org, AJvYcCV8IpxBX94rxgvm/oLvFzxDp8o2Wej8xHXYQp0HBvi25nI1D2lT4WcaEs3qDFcuF00j8CE4P/hqoH6NxhvQ@vger.kernel.org, AJvYcCWGRZuLU2oxv6bN1CFJIvG0hvAMVuunxuOZKoaXS1vMucrJhMRfr9XK03HZ6e+/LYXy9TBtiCiYVnnbwlyGRjc7WgjISQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1pa6RNsvR0jXUpz/uHuAlCbGfvz/sm/XnEYvHXLrf1OvFiGAR
	abmvtBM238+XgcvM7tMFiIyLjLKwHZaO9q9FUIDqaxyryuHB9T5j
X-Gm-Gg: ASbGncvpacld9e9R9lhvUHdo32pdKBf+STDg918d/xzbgi2oUUxK6R9Itz6pE0UIZM8
	pzEZ+XIIaAF/g1XK6GjJRA9bjmMvT5hV4ejIF+3nyIXQAxIs5ez7c4c/aDi49tcaLUWkjhf3Kfc
	kqNzYyk+bBSuy+HC6jZvBfKQL3o239m8YeEvqFPD8doF+2n26AutN8RdwPzE1ckEHQJZQtUgNf+
	XJAICXVe8fQmHkqIoE3ftzITIh5Aw/WTuRgZIOckS909JgjkzxpGcCT8Ib2LY4LLBa0f2hQRjUk
	9B+YatWjsRoyU6UNomv/wKyqrBzY1yHMiTXP2Zj1WbPxwqwpCBM9zQM=
X-Google-Smtp-Source: AGHT+IE5QUU5wnvCJxSubbbcoIbt6Ws+kq0omwrV6le+yagtye4NZi2IfM9bKrQTQSM77KhQqWBvxg==
X-Received: by 2002:a05:6a21:3997:b0:1e0:c9a9:a950 with SMTP id adf61e73a8af0-1e5e081cb96mr70159809637.39.1735778948029;
        Wed, 01 Jan 2025 16:49:08 -0800 (PST)
Received: from localhost.localdomain (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8351fasm23793594b3a.62.2025.01.01.16.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jan 2025 16:49:07 -0800 (PST)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Mario Limonciello <superm1@kernel.org>,
	Luke Jones <luke@ljones.dev>,
	Xino Ni <nijs1@lenovo.com>,
	Zhixin Zhang <zhangzx36@lenovo.com>,
	Mia Shao <shaohz1@lenovo.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Cody T . -H . Chiu" <codyit@gmail.com>,
	John Martens <johnfanv2@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] platform/x86: Add Lenovo GameZone WMI Driver
Date: Wed,  1 Jan 2025 16:47:20 -0800
Message-ID: <20250102004854.14874-3-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250102004854.14874-1-derekjohn.clark@gmail.com>
References: <20250102004854.14874-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds lenovo-wmi-gamezone.c which provides a driver for the Lenovo
GameZone WMI interface that comes on Lenovo "Gaming Series" hardware.
Provides ACPI platform profiles over WMI.

v2:
- Use devm_kzalloc to ensure driver can be instanced, remove global
  reference.
- Ensure reverse Christmas tree for all variable declarations.
- Remove extra whitespace.
- Use guard(mutex) in all mutex instances, global mutex.
- Use pr_fmt instead of adding the driver name to each pr_err.
- Remove noisy pr_info usage.
- Rename gamezone_wmi to lenovo_wmi_gz_priv and gz_wmi to priv.
- Remove GZ_WMI symbol exporting.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 MAINTAINERS                                |   7 +
 drivers/platform/x86/Kconfig               |  11 ++
 drivers/platform/x86/Makefile              |   1 +
 drivers/platform/x86/lenovo-wmi-gamezone.c | 203 +++++++++++++++++++++
 drivers/platform/x86/lenovo-wmi.h          | 105 +++++++++++
 5 files changed, 327 insertions(+)
 create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone.c
 create mode 100644 drivers/platform/x86/lenovo-wmi.h

diff --git a/MAINTAINERS b/MAINTAINERS
index baf0eeb9a355..8f8a6aec6b92 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13034,6 +13034,13 @@ S:	Maintained
 W:	http://legousb.sourceforge.net/
 F:	drivers/usb/misc/legousbtower.c
 
+LENOVO WMI drivers
+M:	Derek J. Clark <derekjohn.clark@gmail.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/lenovo-wmi-gamezone.c
+F:	drivers/platform/x86/lenovo-wmi.h
+
 LETSKETCH HID TABLET DRIVER
 M:	Hans de Goede <hdegoede@redhat.com>
 L:	linux-input@vger.kernel.org
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 0258dd879d64..9a6ac7fdec9f 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -459,6 +459,17 @@ config IBM_RTL
 	 state = 0 (BIOS SMIs on)
 	 state = 1 (BIOS SMIs off)
 
+config LENOVO_WMI_GAMEZONE
+	tristate "Lenovo GameZone WMI Driver"
+	depends on ACPI_WMI
+	select ACPI_PLATFORM_PROFILE
+	help
+	  Say Y here if you have a WMI aware Lenovo Legion device and would like to use the
+	  platform-profile firmware interface.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called lenovo_wmi_gamezone.
+
 config IDEAPAD_LAPTOP
 	tristate "Lenovo IdeaPad Laptop Extras"
 	depends on ACPI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index e1b142947067..7cb29a480ed2 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -68,6 +68,7 @@ obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi.o
 obj-$(CONFIG_YOGABOOK)		+= lenovo-yogabook.o
 obj-$(CONFIG_YT2_1380)		+= lenovo-yoga-tab2-pro-1380-fastcharger.o
 obj-$(CONFIG_LENOVO_WMI_CAMERA)	+= lenovo-wmi-camera.o
+obj-$(CONFIG_LENOVO_WMI_GAMEZONE)	+= lenovo-wmi-gamezone.o
 
 # Intel
 obj-y				+= intel/
diff --git a/drivers/platform/x86/lenovo-wmi-gamezone.c b/drivers/platform/x86/lenovo-wmi-gamezone.c
new file mode 100644
index 000000000000..da5e2bc41f39
--- /dev/null
+++ b/drivers/platform/x86/lenovo-wmi-gamezone.c
@@ -0,0 +1,203 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Lenovo GameZone WMI interface driver. The GameZone WMI interface provides
+ * platform profile and fan curve settings for devices that fall under the
+ * "Gaming Series" of Lenovo Legion devices.
+ *
+ * Copyright(C) 2024 Derek J. Clark <derekjohn.clark@gmail.com>
+ */
+
+#include <linux/platform_profile.h>
+#include "lenovo-wmi.h"
+
+#define LENOVO_GAMEZONE_GUID "887B54E3-DDDC-4B2C-8B88-68A26A8835D0"
+
+/* Method IDs */
+#define WMI_METHOD_ID_SMARTFAN_SUPP 43 /* IsSupportSmartFan */
+#define WMI_METHOD_ID_SMARTFAN_SET 44 /* SetSmartFanMode */
+#define WMI_METHOD_ID_SMARTFAN_GET 45 /* GetSmartFanMode */
+
+static DEFINE_MUTEX(call_mutex);
+
+static const struct wmi_device_id lenovo_wmi_gamezone_id_table[] = {
+	{ LENOVO_GAMEZONE_GUID, NULL }, /* LENOVO_GAMEZONE_DATA */
+	{}
+};
+
+struct lenovo_wmi_gz_priv {
+	struct wmi_device *wdev;
+	enum platform_profile_option current_profile;
+	struct platform_profile_handler pprof;
+	bool platform_profile_support;
+};
+
+/* Platform Profile Methods */
+static int lenovo_wmi_gamezone_platform_profile_supported(
+	struct platform_profile_handler *pprof, int *supported)
+{
+	struct lenovo_wmi_gz_priv *priv;
+
+	priv = container_of(pprof, struct lenovo_wmi_gz_priv, pprof);
+
+	guard(mutex)(&call_mutex);
+	return lenovo_wmidev_evaluate_method_1(
+		priv->wdev, 0x0, WMI_METHOD_ID_SMARTFAN_SUPP, 0, supported);
+}
+
+static int
+lenovo_wmi_gamezone_profile_get(struct platform_profile_handler *pprof,
+				enum platform_profile_option *profile)
+{
+	struct lenovo_wmi_gz_priv *priv;
+	int sel_prof;
+	int err;
+
+	priv = container_of(pprof, struct lenovo_wmi_gz_priv, pprof);
+
+	guard(mutex)(&call_mutex);
+	err = lenovo_wmidev_evaluate_method_1(
+		priv->wdev, 0x0, WMI_METHOD_ID_SMARTFAN_GET, 0, &sel_prof);
+	if (err) {
+		pr_err("Error getting fan profile from WMI interface: %d\n",
+		       err);
+		return err;
+	}
+
+	switch (sel_prof) {
+	case SMARTFAN_MODE_QUIET:
+		*profile = PLATFORM_PROFILE_QUIET;
+		break;
+	case SMARTFAN_MODE_BALANCED:
+		*profile = PLATFORM_PROFILE_BALANCED;
+		break;
+	case SMARTFAN_MODE_PERFORMANCE:
+		*profile = PLATFORM_PROFILE_PERFORMANCE;
+		break;
+	case SMARTFAN_MODE_CUSTOM:
+		*profile = PLATFORM_PROFILE_CUSTOM;
+		break;
+	default:
+		return -EINVAL;
+	}
+	priv->current_profile = *profile;
+
+	return 0;
+}
+
+static int
+lenovo_wmi_gamezone_profile_set(struct platform_profile_handler *pprof,
+				enum platform_profile_option profile)
+{
+	struct lenovo_wmi_gz_priv *priv;
+	int sel_prof;
+	int err;
+
+	switch (profile) {
+	case PLATFORM_PROFILE_QUIET:
+		sel_prof = SMARTFAN_MODE_QUIET;
+		break;
+	case PLATFORM_PROFILE_BALANCED:
+		sel_prof = SMARTFAN_MODE_BALANCED;
+		break;
+	case PLATFORM_PROFILE_PERFORMANCE:
+		sel_prof = SMARTFAN_MODE_PERFORMANCE;
+		break;
+	case PLATFORM_PROFILE_CUSTOM:
+		sel_prof = SMARTFAN_MODE_CUSTOM;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	priv = container_of(pprof, struct lenovo_wmi_gz_priv, pprof);
+
+	guard(mutex)(&call_mutex);
+	err = lenovo_wmidev_evaluate_method_1(
+		priv->wdev, 0x0, WMI_METHOD_ID_SMARTFAN_SET, sel_prof, NULL);
+	if (err) {
+		pr_err("Error setting fan profile on WMI interface: %u\n", err);
+		return err;
+	}
+
+	priv->current_profile = profile;
+	return 0;
+}
+
+/* Driver Setup */
+static int platform_profile_setup(struct lenovo_wmi_gz_priv *priv)
+{
+	int supported;
+	int err;
+
+	err = lenovo_wmi_gamezone_platform_profile_supported(&priv->pprof,
+							     &supported);
+	if (err) {
+		pr_err("Error checking platform profile support: %d\n", err);
+		return err;
+	}
+
+	priv->platform_profile_support = supported;
+
+	if (!supported)
+		return -EOPNOTSUPP;
+
+	priv->pprof.name = "lenovo-wmi-gamezone";
+	priv->pprof.profile_get = lenovo_wmi_gamezone_profile_get;
+	priv->pprof.profile_set = lenovo_wmi_gamezone_profile_set;
+
+	set_bit(PLATFORM_PROFILE_QUIET, priv->pprof.choices);
+	set_bit(PLATFORM_PROFILE_BALANCED, priv->pprof.choices);
+	set_bit(PLATFORM_PROFILE_PERFORMANCE, priv->pprof.choices);
+	set_bit(PLATFORM_PROFILE_CUSTOM, priv->pprof.choices);
+
+	err = lenovo_wmi_gamezone_profile_get(&priv->pprof,
+					      &priv->current_profile);
+	if (err) {
+		pr_err("Error getting current platform profile: %d\n", err);
+		return err;
+	}
+
+	guard(mutex)(&call_mutex);
+	err = platform_profile_register(&priv->pprof);
+	if (err) {
+		pr_err("Error registering platform profile: %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+static int lenovo_wmi_gamezone_probe(struct wmi_device *wdev,
+				     const void *context)
+{
+	struct lenovo_wmi_gz_priv *priv;
+
+	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->wdev = wdev;
+	return platform_profile_setup(priv);
+}
+
+static void lenovo_wmi_gamezone_remove(struct wmi_device *wdev)
+{
+	struct lenovo_wmi_gz_priv *priv = dev_get_drvdata(&wdev->dev);
+
+	guard(mutex)(&call_mutex);
+	platform_profile_remove(&priv->pprof);
+}
+
+static struct wmi_driver lenovo_wmi_gamezone_driver = {
+	.driver = { .name = "lenovo_wmi_gamezone" },
+	.id_table = lenovo_wmi_gamezone_id_table,
+	.probe = lenovo_wmi_gamezone_probe,
+	.remove = lenovo_wmi_gamezone_remove,
+};
+
+module_wmi_driver(lenovo_wmi_gamezone_driver);
+
+MODULE_DEVICE_TABLE(wmi, lenovo_wmi_gamezone_id_table);
+MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
+MODULE_DESCRIPTION("Lenovo GameZone WMI Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/lenovo-wmi.h b/drivers/platform/x86/lenovo-wmi.h
new file mode 100644
index 000000000000..8a302c6c47cb
--- /dev/null
+++ b/drivers/platform/x86/lenovo-wmi.h
@@ -0,0 +1,105 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Lenovo Legion WMI interface driver. The Lenovo Legion WMI interface is
+ * broken up into multiple GUID interfaces that require cross-references
+ * between GUID's for some functionality. The "Custom Mode" interface is a
+ * legacy interface for managing and displaying CPU & GPU power and hwmon
+ * settings and readings. The "Other Mode" interface is a modern interface
+ * that replaces or extends the "Custom Mode" interface methods. The
+ * "GameZone" interface adds advanced features such as fan profiles and
+ * overclocking. The "Lighting" interface adds control of various status
+ * lights related to different hardware components. "Other Method" uses
+ * the data structs LENOVO_CAPABILITY_DATA_00, LENOVO_CAPABILITY_DATA_01
+ * and LENOVO_CAPABILITY_DATA_02 structs for capability information.
+ *
+ * Copyright(C) 2024 Derek J. Clark <derekjohn.clark@gmail.com>
+ *
+ */
+
+#define pr_fmt(fmt) "%s:%s: " fmt, KBUILD_MODNAME, __func__
+
+#ifndef _LENOVO_WMI_H_
+#define _LENOVO_WMI_H_
+
+#include <linux/mutex.h>
+#include <linux/types.h>
+#include <linux/wmi.h>
+
+/* Platform Profile Modes */
+#define SMARTFAN_MODE_QUIET 0x01
+#define SMARTFAN_MODE_BALANCED 0x02
+#define SMARTFAN_MODE_PERFORMANCE 0x03
+#define SMARTFAN_MODE_CUSTOM 0xFF
+
+struct wmi_method_args {
+	u32 arg0;
+	u32 arg1;
+};
+
+/* General Use functions */
+static int lenovo_wmidev_evaluate_method(struct wmi_device *wdev, u8 instance,
+					 u32 method_id, struct acpi_buffer *in,
+					 struct acpi_buffer *out)
+{
+	acpi_status status;
+
+	status = wmidev_evaluate_method(wdev, instance, method_id, in, out);
+
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	return 0;
+};
+
+int lenovo_wmidev_evaluate_method_2(struct wmi_device *wdev, u8 instance,
+				    u32 method_id, u32 arg0, u32 arg1,
+				    u32 *retval);
+
+int lenovo_wmidev_evaluate_method_2(struct wmi_device *wdev, u8 instance,
+				    u32 method_id, u32 arg0, u32 arg1,
+				    u32 *retval)
+{
+	struct wmi_method_args args = { arg0, arg1 };
+	struct acpi_buffer input = { (acpi_size)sizeof(args), &args };
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *ret_obj = NULL;
+	int err;
+
+	err = lenovo_wmidev_evaluate_method(wdev, instance, method_id, &input,
+					    &output);
+
+	if (err) {
+		pr_err("Attempt to get method value failed.\n");
+		return err;
+	}
+
+	if (retval) {
+		ret_obj = (union acpi_object *)output.pointer;
+		if (!ret_obj) {
+			pr_err("Failed to get valid ACPI object from WMI interface\n");
+			return -EIO;
+		}
+		if (ret_obj->type != ACPI_TYPE_INTEGER) {
+			pr_err("WMI query returnd ACPI object with wrong type.\n");
+			kfree(ret_obj);
+			return -EIO;
+		}
+		*retval = (u32)ret_obj->integer.value;
+	}
+
+	kfree(ret_obj);
+
+	return 0;
+}
+
+int lenovo_wmidev_evaluate_method_1(struct wmi_device *wdev, u8 instance,
+				    u32 method_id, u32 arg0, u32 *retval);
+
+int lenovo_wmidev_evaluate_method_1(struct wmi_device *wdev, u8 instance,
+				    u32 method_id, u32 arg0, u32 *retval)
+{
+	return lenovo_wmidev_evaluate_method_2(wdev, instance, method_id, arg0,
+					       0, retval);
+}
+
+#endif /* !_LENOVO_WMI_H_ */
-- 
2.47.0


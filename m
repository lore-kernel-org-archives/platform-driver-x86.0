Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE762FD697
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Feb 2026 12:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770382632; cv=none; b=i6wsTRyiERxCDEDn5ZmO5k7tiSCD4N1fqUJ7Xf8Z8DZtkpSRLKaCj50TKKodEVqPLRVSvhsoJMwHsMaJs9o1u7yNB+YNih8sYgon/+UfxPC/dIJkIUEopjwYcrBtgAtruLucYdvbHBwNn0RSoPjGVGWWN9VL2L4jtdjpLJ4uEFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770382632; c=relaxed/simple;
	bh=kPU1oBukxMqix0koJHcd3VsVzH9ya8xnAlosPcBArvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BbhYMoozpsXrZGIhE1oeZtqmNFwpuXd6VDJ4uPD2ZiZ1rPrA1CGHzJO7pI7d+yKMDIdDrjCXNfdr5Czzc+Kc59PHIq3u5OHjdb5EwrsTP7ooU9/4bV61kAxmrIHLu9KZIZaaH17O/bBKQ6st1q8FagSmXoQCTb8vLR8dwr5S54s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NJ3kS5bX; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NJ3kS5bX"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a8a7269547so19180215ad.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 06 Feb 2026 04:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770382631; x=1770987431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IoKTueZpXQx3gpN23ycBzI2bHPCHbPRI2wSorpiDz6Q=;
        b=NJ3kS5bX97a2RutqDdSY0DnIeuiHI9hhqnYAglQ3yi5bBtQIhsp1wX/vvb1FO6cfNf
         Fst3Mvkd5GGGhGMltn7qqDEfLtA6/M4uajanTJuIy5OacJR8hkRS551JIsR0aDkKKfF6
         Rgl9Csg5SEWakaFCUf2Fpt84HT5s+MtFbOINUB918o0Qd51zmSSC6aJ6LSD3xhY75q0A
         rzBnYktnmIxvu+rZtj745YChVjaCcNsifiP6ODxVrordDaPFQL8xDBX3ZosbHViypgMs
         stgqa/apiVqQw662mHU2FmZq/6tNSdY/t/btz/8ZIvyb48D/9vX8DDH/6bugIYl3VBCF
         OWow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770382631; x=1770987431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IoKTueZpXQx3gpN23ycBzI2bHPCHbPRI2wSorpiDz6Q=;
        b=GWY7oszRJaZPnC30KbEfpnJtzoQ8ILrvtzU4flWFw1FpOocAdUKY5dragBEbFb9WIb
         uHf2cNGErO/iluV6YjkGksb/7xVVhAMjZGAXmLCzyAByq8uC3y+YKsXnF7DfC1CltLJr
         ebPEFO7gl8cvuV8lEuxOZlXN4UuykMFLKUWDOIMN6EiHNSkvfvj1xVe810qSW0lxqYZY
         phIOnymN3G+6VrUhHovcpWwmcvJ8xKbU5d3k8c2SnFEvGJ00oRy4OgS6vHDEj+UHh0pm
         kUSugwWi+U6LYSw3OBpSOk1n1n2DXdXNCofJlQW+iPQYwgycW+6grQ5aYancAhNdkoHB
         XYcA==
X-Forwarded-Encrypted: i=1; AJvYcCW6H6YisqWE/C4YUV5xPvykM+EhGxVVSo3ZNEni2R3Onqqp6ZkdXi6jiotysXYX3xK883Rht22pE0MOa/H0f3sqUBrV@vger.kernel.org
X-Gm-Message-State: AOJu0YyHWnTyhPoQQg/FWSgUkkhO9uu0kD0EogDubU/Dr3KWGTQuKNVu
	++Yoif+mTxICJUwOAnXA634cDTQuIgK5xRpWoSzBPj0S6DeuP8YIP5w=
X-Gm-Gg: AZuq6aI6JzisQ87Vd9+X2C0f2hTZFh64dxPLEqpXcAEnkVc4XvlAplrEXrTAq3ebBm8
	krQ1K2TlZVs6tAPZrGF1mfLPk6lbCZfIVUQlyjtdXbRbMH9lqQ5A3y2NoTFhBLV/GkVOtKD7lI5
	jIAUqh9SU8zoDc0RbKp8HjOG49tN2JadEIcv4pr/3eU/SshqnvhK2lijXeRGxzLkMA0T4ClV1K4
	DJZPRwdgYx1NRq0YFeIeGeMfUlwvsTNIJdxdKZXeVCnYtJtUU/XoAL1FJOA4Xx6nDIo2zIL/0eH
	Gv/URGNWIF717S4z2hSbxbUijDmtZ3vW8LJdnpedbbu6m6jWvlIhri5bUmSdPWpXq6nAN4u69/5
	o8ney/fHOlq1IJJK6zR6R63DsWdeCAByi/iQFIgUNpKHs72gE0GQZqLZSCaQ8wA8+HKWjJkH7Gc
	C0xvtLJ4HoyP9JQqk=
X-Received: by 2002:a17:903:1b2e:b0:2a9:32c7:92db with SMTP id d9443c01a7336-2a951971b6fmr26541095ad.61.1770382631199;
        Fri, 06 Feb 2026 04:57:11 -0800 (PST)
Received: from at.. ([171.61.167.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951a636aasm23336005ad.12.2026.02.06.04.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 04:57:10 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Lukas Wunner <lukas@wunner.de>,
	Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/2] efi: Save Brightness using EFI on Macs
Date: Fri,  6 Feb 2026 12:56:21 +0000
Message-ID: <20260206125641.12983-2-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206125641.12983-1-atharvatiwarilinuxdev@gmail.com>
References: <20260206125641.12983-1-atharvatiwarilinuxdev@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently when a Mac reboots, the brightness is not the same
as the previous boot instead its the same as the last time the
Mac booted macOS.

We can fix this issue by saving the brightness level to the efivar
backlight-level.

We use delayed work instead of a shutdown callback,
as it still applies the brightness
even during forced shutdowns and at 0% battery.

(tested on iMac20,1)

Suggested-by: Lukas Wunner <lukas@wunner.de>
Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/firmware/efi/Kconfig                  | 10 ++
 drivers/firmware/efi/Makefile                 |  1 +
 drivers/firmware/efi/apple-brightness.c       | 91 +++++++++++++++++++
 .../linux/platform_data/apple-brightness.h    | 21 +++++
 4 files changed, 123 insertions(+)
 create mode 100644 drivers/firmware/efi/apple-brightness.c
 create mode 100644 include/linux/platform_data/apple-brightness.h

diff --git a/drivers/firmware/efi/Kconfig b/drivers/firmware/efi/Kconfig
index 29e0729299f5..dd0a9c9a772a 100644
--- a/drivers/firmware/efi/Kconfig
+++ b/drivers/firmware/efi/Kconfig
@@ -167,6 +167,16 @@ config APPLE_PROPERTIES
 
 	  If unsure, say Y if you have a Mac.  Otherwise N.
 
+config APPLE_BRIGHTNESS
+	bool "Apple Backlight control for EFI"
+	depends on X86
+	help
+	  This will save the brightness level to EFI, so brightness
+	  level is preserved across reboots and shutdows. allowing
+	  for improved support of Apple hardware.
+
+	  If unsure, say Y if you have a Mac, Otherwise N.
+
 config RESET_ATTACK_MITIGATION
 	bool "Reset memory attack mitigation"
 	depends on EFI_STUB
diff --git a/drivers/firmware/efi/Makefile b/drivers/firmware/efi/Makefile
index 8efbcf699e4f..1f5705cc87a2 100644
--- a/drivers/firmware/efi/Makefile
+++ b/drivers/firmware/efi/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_EFI_BOOTLOADER_CONTROL)	+= efibc.o
 obj-$(CONFIG_EFI_TEST)			+= test/
 obj-$(CONFIG_EFI_DEV_PATH_PARSER)	+= dev-path-parser.o
 obj-$(CONFIG_APPLE_PROPERTIES)		+= apple-properties.o
+obj-$(CONFIG_APPLE_BRIGHTNESS)		+= apple-brightness.o
 obj-$(CONFIG_EFI_RCI2_TABLE)		+= rci2-table.o
 obj-$(CONFIG_EFI_EMBEDDED_FIRMWARE)	+= embedded-firmware.o
 obj-$(CONFIG_LOAD_UEFI_KEYS)		+= mokvar-table.o
diff --git a/drivers/firmware/efi/apple-brightness.c b/drivers/firmware/efi/apple-brightness.c
new file mode 100644
index 000000000000..c32e365dc511
--- /dev/null
+++ b/drivers/firmware/efi/apple-brightness.c
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * apple-brightness.c - EFI brightness saver on Macs
+ * Copyright (C) 2026 Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/backlight.h>
+#include <linux/cleanup.h>
+#include <linux/efi.h>
+#include <linux/mutex.h>
+#include <linux/workqueue.h>
+#include <linux/platform_data/apple-brightness.h>
+
+static DEFINE_MUTEX(apple_brightness_mutex);
+static struct delayed_work apple_brightness_work;
+
+static u32 efi_attr;
+static u16 last_saved_level;
+
+static int (*get_brightness)(struct backlight_device *bl);
+static struct backlight_device *bl_dev;
+
+static void apple_brightness_workfn(struct work_struct *work)
+{
+	u16 level;
+	efi_status_t status;
+
+	mutex_lock(&apple_brightness_mutex);
+
+	level = (u16)get_brightness(bl_dev);
+
+	if (level == last_saved_level)
+		goto out;
+
+	status = efivar_set_variable(APPLE_BRIGHTNESS_NAME, &APPLE_BRIGHTNESS_GUID,
+				efi_attr, sizeof(level), &level);
+	if (status != EFI_SUCCESS)
+		pr_debug("Unable to set brightness: 0x%lx\n", status);
+	else
+		last_saved_level = level;
+
+out:
+	mutex_unlock(&apple_brightness_mutex);
+
+	mod_delayed_work(system_wq, &apple_brightness_work,
+			msecs_to_jiffies(APPLE_BRIGHTNESS_POLL));
+}
+
+int apple_brightness_probe(struct backlight_device *bl,
+	int (*get_brightnessfn)(struct backlight_device *bl))
+{
+	efi_status_t status;
+	unsigned long size = sizeof(last_saved_level);
+	int ret;
+
+	guard(mutex)(&apple_brightness_mutex);
+
+	bl_dev = bl;
+	get_brightness = get_brightnessfn;
+
+	if (!efi_rt_services_supported(EFI_RT_SUPPORTED_SET_VARIABLE))
+		return -ENODEV;
+
+	ret = efivar_lock();
+	if (ret)
+		return ret;
+
+	status = efivar_get_variable(APPLE_BRIGHTNESS_NAME, &APPLE_BRIGHTNESS_GUID,
+				&efi_attr, &size, &last_saved_level);
+
+	efivar_unlock();
+
+	if (status != EFI_SUCCESS)
+		return -ENODEV;
+
+	bl_dev = bl;
+	get_brightness = get_brightnessfn;
+
+	INIT_DELAYED_WORK(&apple_brightness_work, apple_brightness_workfn);
+	mod_delayed_work(system_wq, &apple_brightness_work,
+			msecs_to_jiffies(APPLE_BRIGHTNESS_POLL));
+
+	return 0;
+}
+EXPORT_SYMBOL(apple_brightness_probe);
+
+MODULE_AUTHOR("Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>");
+MODULE_DESCRIPTION("EFI Brightness saver for Macs");
+MODULE_LICENSE("Dual MIT/GPL");
diff --git a/include/linux/platform_data/apple-brightness.h b/include/linux/platform_data/apple-brightness.h
new file mode 100644
index 000000000000..4cf5e2d346cb
--- /dev/null
+++ b/include/linux/platform_data/apple-brightness.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
+/*
+ * apple-brightness.h - EFI brightness saver for Macs
+ * Copyright (C) 2026 Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
+ */
+
+#ifndef _APPLE_BL_H_
+#define _APPLE_BL_H_
+
+#include <linux/backlight.h>
+#include <linux/efi.h>
+
+#define APPLE_BRIGHTNESS_NAME           L"backlight-level"
+#define APPLE_BRIGHTNESS_GUID           EFI_GUID(0x7c436110, 0xab2a, 0x4bbb, 0xa8, 0x80, 0xfe, 0x41, 0x99, 0x5c, 0x9f, 0x82)
+
+#define APPLE_BRIGHTNESS_POLL           300
+
+int apple_brightness_probe(struct backlight_device *bl,
+	int (*get_brightnessfn)(struct backlight_device *bl));
+
+#endif /* _APPLE_BL_H */
-- 
2.43.0


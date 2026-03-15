Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8080C37C109
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Mar 2026 21:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773611599; cv=none; b=imAcVCrerrITdnbucwRYbmwo9lHK4fGQ+yMFZnWUFIXeIGNtimG1D8ebVZPmeixwR1nYvruPKgLr/dFehefUReUMvbEhX0WuhCpMLIWiwDmspij6kScT6+W2syKKOgH3DZlv2M/PJL8BfFZyABSjcPq8qhegCMpgj5+U/DQXMkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773611599; c=relaxed/simple;
	bh=d4jChEeUUc0f0rEMKPi4UAZuovkMFjwzj0INK1YLEaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dX1hEIWl4mnApqGQyE20bnzfynxa30hzTlD4slQVIGcfPPSI6wgu7yIPPBhUU0/TCNqb8srM8dRGdhEvOWhgtkaCb7JI+I4IZjn9G2Mf1yvaOgAp9SUmShmPmSZru5fpSeneEXj1WJDZcvt9Q6dJZ6lFmWdym61HLL7VKMOg+Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PnRfJkl5; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PnRfJkl5"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-358ed696623so1718477a91.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 15 Mar 2026 14:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773611598; x=1774216398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R6JQWklIlJSZA3P4ZxqqueLAj4IsTzAWLg/HK7yKGJM=;
        b=PnRfJkl5cG6QDT2F+yTcDk3/uBzdacQUw4nTbBHCnjSV0dmzIGTusuRWBYIUcSbgt4
         BNdTsh+ae2VLCuu/BYCOQDXzS/rfvHXCr2l6jQmOg7pbhIRio9rmI4WGJJBnEP4L1W3R
         xRZRL5mOeYx7rD//CQZVlLOSITfbBW4D9maC0KVv/S7d8ITEeuzpMRetj/xjy0VeKFLO
         FzlQwYjhACGsMSFFbY66fIs0WpOW853QbtgbFU9q62fE8M1/axNDaRjp6aa3jDQNO/T2
         YBQHGhVIYfBZS5WFJkWY+hphMWrjIEBEP3RO+OlJZVtD0UqoPWRWuXofkeDEcj42bNov
         CNjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773611598; x=1774216398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R6JQWklIlJSZA3P4ZxqqueLAj4IsTzAWLg/HK7yKGJM=;
        b=Y5LmjTR+QPCPo7ggMzDwOxKF8oK8Uy6V9vwk6Bxu6j9mgCLBa8D2cb8wH10yLEw5IA
         lM2nKn5XVyxCOwONj9r+amwtvUPNw2y6rTCTNrJGLeTzptEW67rYVmEWgsMSFWOggY/C
         Q9tp0aIT79xijmAHueKdJp2nccDGKRE6X0RqWmbTVJUiCOwAxf0qhK3aK+tt7LxzP/n5
         z8we6Aj9kTD+9aDk4ptTnSNhu7WkEV19IXIkrvv7aX67wa8tJuVF7rbbrjmPKbmCDFr/
         gTIyc6vd8qjzhF5KyepHoIfMV2lqDGRghFzF2XPNOwAEcDiClMlHX0XWH54vt/3s8fi5
         nhNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvAG80QxuLkMMzUAU4GcQGrkz6R2BS6HFEhLEFP1FziPiU6R7I9/29S3xM2M55xGf6qvaaUS82CAr7JrOdYrfZzuxr@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7B3AUMUCumj3620J/E8KDYwt1HwNfgxi2EyfSJ03ONgWVCkdN
	AB7G0CVILUgTwCrjL1v1B0SyVVRmks3iQwnafUc9lWFuqQphvbHdNpZdXqNQ
X-Gm-Gg: ATEYQzzSJxdbZoZAAmiibTCbSysQPHTTpyQsXNZrzRHKVUBM/TmFC/u+AjALTwvsZLz
	lMANg02myAVeeJPBbiLsw2Tyho/KUXuuZSercQ5ihpU+q1ZBea0zz5v+Co2zB6yMktZm4mYLh1N
	iXteD54HIizquTHN2zrwncV6GoRQGgniMCelahV/kMlbu2rnraezM8LksSmKYuvtXMTgyMoIpKd
	RM4p+OX5lFAv6PzDmplO0DOORFq65MdfT3DLDh/yA+Q67rzltCC7S4aq3RxmAcgLEGB875NL9pV
	sBZ7Y6hyvmwaJhPlHPsdm/1iBhf8AjYgkpk+QZL0Ga5R6IqZvzwojcTFFIhZYdvrnILNXv7+tfd
	UDQ3nYv4U/RiODWndQCV67lz7vZL3weCGhFJPGYPVbUE4mpTNJZZ276RmKs7+s9NMIONhoy3iwQ
	8K1a8704P+gvtaVe/JCTeQyONkJixuONeiyjO1LSREZ1GzGVdBbofSwMpIyY+XlZ4=
X-Received: by 2002:a17:90b:28cc:b0:359:fc88:fa99 with SMTP id 98e67ed59e1d1-35a22055572mr8857270a91.26.1773611597857;
        Sun, 15 Mar 2026 14:53:17 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([171.61.163.197])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35b9303eb9bsm3074980a91.8.2026.03.15.14.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 14:53:17 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 1/2] efi: Save Brightness using EFI on Macs
Date: Mon, 16 Mar 2026 03:22:41 +0530
Message-ID: <20260315215302.24087-2-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260315215302.24087-1-atharvatiwarilinuxdev@gmail.com>
References: <20260315215302.24087-1-atharvatiwarilinuxdev@gmail.com>
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

(tested on iMac20,1)

Suggested-by: Lukas Wunner <lukas@wunner.de>
Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/firmware/efi/Kconfig                  | 10 +++
 drivers/firmware/efi/Makefile                 |  1 +
 drivers/firmware/efi/apple-brightness.c       | 67 +++++++++++++++++++
 .../linux/platform_data/apple-brightness.h    | 20 ++++++
 4 files changed, 98 insertions(+)
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
index 000000000000..b060861b0795
--- /dev/null
+++ b/drivers/firmware/efi/apple-brightness.c
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * apple-brightness.c - EFI brightness saver on Macs
+ * Copyright (C) 2026 Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/backlight.h>
+#include <linux/efi.h>
+#include <linux/platform_data/apple-brightness.h>
+
+static u32 efi_attr;
+static u16 last_saved_level;
+
+static int (*get_brightness)(struct backlight_device *bl);
+static struct backlight_device *bl_dev;
+
+void apple_brightness_shutdown(void)
+{
+	u16 level;
+	efi_status_t status;
+
+	level = (u16)get_brightness(bl_dev);
+
+	if (level == last_saved_level)
+		return;
+
+	status = efivar_set_variable(APPLE_BRIGHTNESS_NAME, &APPLE_BRIGHTNESS_GUID,
+				efi_attr, sizeof(level), &level);
+	if (status != EFI_SUCCESS)
+		pr_debug("Unable to set brightness: 0x%lx\n", status);
+}
+EXPORT_SYMBOL(apple_brightness_shutdown);
+
+int apple_brightness_probe(struct backlight_device *bl,
+	int (*get_brightnessfn)(struct backlight_device *bl))
+{
+	efi_status_t status;
+	unsigned long size = sizeof(last_saved_level);
+	int ret;
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
+	return 0;
+}
+EXPORT_SYMBOL(apple_brightness_probe);
+
+MODULE_AUTHOR("Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>");
+MODULE_DESCRIPTION("EFI Brightness saver for Macs");
+MODULE_LICENSE("Dual MIT/GPL");
diff --git a/include/linux/platform_data/apple-brightness.h b/include/linux/platform_data/apple-brightness.h
new file mode 100644
index 000000000000..54e3f3f8aa1c
--- /dev/null
+++ b/include/linux/platform_data/apple-brightness.h
@@ -0,0 +1,20 @@
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
+int apple_brightness_probe(struct backlight_device *bl,
+	int (*get_brightnessfn)(struct backlight_device *bl));
+
+void apple_brightness_shutdown(void);
+#endif /* _APPLE_BL_H */
-- 
2.43.0


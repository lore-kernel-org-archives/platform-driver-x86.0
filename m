Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27C530B535
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Mar 2026 22:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773613239; cv=none; b=HCr4FciY62lsvXH3uji0p8KF/6QZysXZQcEBefBT9fUCPFagFSMJiDCyI4e1GI+CAFwTg6+tdfHWixqcZ5sEKuY0Urs7RMSzsni6KwEUwSbuYoP1qWV0llcQfbmFCY+63zGGxMsim+DB2ga6+3J2YH75ys6ishayuVC3stVvqUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773613239; c=relaxed/simple;
	bh=d4jChEeUUc0f0rEMKPi4UAZuovkMFjwzj0INK1YLEaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z4vL8z9oiTJK0fxygqe+exPf/WYENkooj8GOEkFJCazWeSXDddxYaV/MA5/ITWwbco7FfoBV7JYxBL2NzZL849fbMbvT0Wvqy/Me1aLDNs17UiWrZubd2ToU0Q0T2mnpSZ6qvV0UaJBjMgS5n6JCm8OYpITaLU1spyQmSFNS710=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iFR7tdAk; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iFR7tdAk"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-359ff894f0dso1364344a91.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 15 Mar 2026 15:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773613237; x=1774218037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R6JQWklIlJSZA3P4ZxqqueLAj4IsTzAWLg/HK7yKGJM=;
        b=iFR7tdAkoXa6GcKRjWuVOjC3094LSGTHCn3uQqDthbXeCtAzrheOF2a3jTYYN3CJsn
         7AVKRcGWbEAD7QmBdi8Tj1pE0RO9gNHYIaE83tvFlD1nQGgORVCzi7upWh/ntLhzoh7O
         TAfEvueDN5KqVVQca5s/hoJRK2TKsXR0JGqZihd2vt4CXCflzfI5mzLv8F+b9iYI8/7e
         7Lc94dYYwc3THFb3/2M0XxUzujFFkM9iaMbgQmZruB/1Wcpo+ncBjzDkueUhU498BbbP
         bb9YPTXed7QjTW0iMYtzRF5UXwaOh1HMmjN8hECUy9cV/3RfZoeB7LlRVGghE6IUVydk
         hm4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773613237; x=1774218037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R6JQWklIlJSZA3P4ZxqqueLAj4IsTzAWLg/HK7yKGJM=;
        b=iAU25Zr6kXgYQC4AF8h9ft+cnjT1RtGsCC362m0C2Q5EwxJIHstes6XOoSz5/kfJyk
         YE23gWcjUmIx7t9HOF71piGo0WxH0adn8qbNb3AdGjePK34nDLmrgeAlaqYpYA/dH1p0
         AXDRr5yujrd0+12xkOXUFrpbk0wLJn28DPWb8NlldNztRWKgUwhbIsZHlrHGz2w+qF1g
         BGhs+Ixw/vDsg7vRWzk9MHmlqhu1d5xNDRUOMdDhuOVIfRi78hKe5XxWgat+sjLz6bs+
         Glx82QJld65cYixcGpfMulHJXZywmLXE8N2fIwF4Qz7wVmXwjvo3iDR7cIbhF5H6bpkT
         WWug==
X-Forwarded-Encrypted: i=1; AJvYcCWL56hvs7k1X+syvsdvgsDtfNtNtbpDxLTrHbqMg/Z0wn/+i9iYYQVCqGZcG5u05eSmYKDAVpDuvFd7O0t0Em3Td5fC@vger.kernel.org
X-Gm-Message-State: AOJu0YyiEXSTMccRjBGG42ghhjbeBWisxFj/INFmfqvLt4p5s8sz2QrK
	uTF4KNbssqJsYxdgUMe1MRQLHFcA3AEtJRxlm+SiqTWkoTUEQ+RJ9Pk=
X-Gm-Gg: ATEYQzx3eL9b4ZAmtcdCZquw3FalVB57g97S6wHYnoGAM33tdR5tNgTtmBSEg7YcHyI
	bF4CV02+TPZQCWg9UD26P28PyxJQBQBDZRxYmI6es/O7HhTZPkbXlTSKenpf9eZSgYhLByYdG2Y
	lH3MIydOSc5ZGLnFJdsKDGLZ9araCi0+Qq8HQn7BV5oC9MhwAtavKRGFXtqR1JFiip5K7VnUmKw
	TfnyMxCjTsrYCfX5h/1mlGgEeYMmbU0PGF1QbZ2997Ytq7NjBSAY2KUv6nfP6D7jRF7eG/kH8mK
	b7/vqw3IxhWIHu3MnDtRpr4moIYEWQvYZY1ILQ4S6Ohhmjq+vOqwuH9F09YlAM+3nFhIefjeRQ7
	pMFoSeaxXiauwJqJ+BtjA1OKh4NQ5LGz/Hs0v9uM1sBF0iySRcDQwqWLLzqc/5A/3C0vRPuddlt
	L11yV0s7+27JgYtt78IEoq1QYLpWKigD0T1h/9TKgG17oPxPTJwStB/YKv7ogwJxE7Fv+770r75
	g==
X-Received: by 2002:a17:90b:1d09:b0:33b:bed8:891c with SMTP id 98e67ed59e1d1-35a22053278mr9573278a91.23.1773613237313;
        Sun, 15 Mar 2026 15:20:37 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([171.61.163.197])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35b98f0e5a6sm2547141a91.5.2026.03.15.15.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 15:20:37 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-efi@vger.kernel.org (open list:EXTENSIBLE FIRMWARE INTERFACE (EFI)),
	platform-driver-x86@vger.kernel.org (open list:X86 PLATFORM DRIVERS)
Subject: [PATCH v3 1/2] efi: Save Brightness using EFI on Macs
Date: Mon, 16 Mar 2026 03:49:59 +0530
Message-ID: <20260315222020.24341-2-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260315222020.24341-1-atharvatiwarilinuxdev@gmail.com>
References: <20260315222020.24341-1-atharvatiwarilinuxdev@gmail.com>
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


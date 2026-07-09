Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30544421F16
	for <platform-driver-x86@vger.kernel.org>; Thu,  9 Jul 2026 12:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783599848; cv=none; b=A74uZaU5MdPSRVh5TAyisCW4w4mPXql/HrDluGWGSFhF+YLCRiSUABIfgkpiaNyLSaH3avUGQkURlWqy0zrduKvOBNMtUDwpbNRZ6gQH8Thgsj+wz0XKuoh2H6VEpdoL/9VPOb+6OwJuOkD0vYMIGp6GcxkX90jiG+P8SBJN7KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783599848; c=relaxed/simple;
	bh=taafyRmWyCIqnMOOfq7PKJl+Fg5cFSuOxDQm5EAgBv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nTkl94Pr2FBs9PrWe174atJEfdjryVhCwjKLg5/dJoumIHML6q8YYTe2Nt/h+9yVHXiO2sJghZpSxvKMc4T4U2olltNuCcBOdaoyIeq4mK6n6Q659DH16sEfyg854ynshicYV/dP6KCEZR6SdNb9DxsPLIjeqkABrywEVP51AVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UT7kzf+3; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UT7kzf+3"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8485b358552so585778b3a.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Jul 2026 05:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783599844; x=1784204644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g6yLrFSwq1Ss8jBFrZQUovH4W6hVwnggm2wTC3p1PmI=;
        b=UT7kzf+3b2OdqgDX4cegtDjFXhQcXOJiMjgXQj7NP4jIZVokN6K7zx5XkHtlXqiHZk
         KHqr7+V6DqJUXrKrzfRRfCYi8ML+lK8aZgQTd6KjE90K7v0Fp+g3fqjV/qgHdDVIsos6
         njfQy/7/VfuJmvTTB0J/r9oGF1P/px0s0JLcXogKxAyrAmOS94/ENrSwo4ZdYGYGNSEY
         4mponrUYCuXLOR7J7h9ijDZJV4cqWgnoJXxavyHLq/lQFUdmeDqk9wmbToKWRCo2sGaU
         feuRxd39cJkShdnLgW/fRqxrKDZUV1PvzKWnSwPzKVWZV5wOwN+/SgNu5PpSDBFojsi/
         yawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783599844; x=1784204644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g6yLrFSwq1Ss8jBFrZQUovH4W6hVwnggm2wTC3p1PmI=;
        b=YLg6rTkbiQBm20qpkB70LkpFjMt2Yq4XgaTlelZrHY4B+9Dn+rUB5CrmJ7hezSUegj
         HeiC7KJDKPv3syPNZiQ4S2D33XFpQ4sUDgVMYcVW6oRZIKLqHUlqy1xci141uKXuHp9U
         Ubj/AL0JpZCu5MpRUPI8qEs6Q1Yq+LoHSV2Jw+HE4x6yptoK5RMcGQg3kN4y+PN1lMqk
         ff5xCJZgOZnzpLMNQXm5eY2LtMXICFWKJZfXapQoHsGMM613z5TKgNJcRrNd8J0hk1y1
         GmXyp3u53XehVgwIynCai/G19Q37vmwRE+jZzVKPKQRqkyT8P7Z7yEFqeG8eKLMDcJSn
         171Q==
X-Forwarded-Encrypted: i=1; AHgh+RqyUdaIHPvMP4Rg7tsqXJn282bCfGdXOSo82YMcQI3b5+fuYIzjlgd9mfiRuJKz+NjHfDF1MprH6FZr5CMhjaVtfwsK@vger.kernel.org
X-Gm-Message-State: AOJu0YzvOfzT7ahO2JNCFwBKXnFBWmDksmbBtGHSAuDxPzDbYTEU3vQv
	fG6F8HOuQ2k0GIWR6xs2lIC1PHtYdaBf/SiY2sq/ybNuldjJnC5pB+5V
X-Gm-Gg: AfdE7cli8AXjpZlM0dBObie8be8cHhiNo7+Z6DF2IzybJJEo7Fi2omALMFgQCKyhNq+
	O6NL8c1kfBVgE2uuu1NKHql87cNQciFP9MDzca+LanCyDAOIIyKMbhkfu+FlwKNksx7nfHGoGPi
	RSYUIGAu1EdqGzqceRxw+EmcoBIED3P01NVPZJJtVm9bI+FBx+ZujQr5LuWYelhn/LkUNFG0EXo
	zYZQ56zo82/lRfFtlzEIfSlDpCaB40pIBkO4z+pwfeyYb5cBunSDE06rC9R3kyJG14GxMCYocgt
	iXJIQiS2ks++JZwG+tH+gf5k9MLFAYn78SHlc4j0n7hkAy8qjFpzCYDDtTVAdPIMu6KDWH2TYEz
	/SH12A5TmgrbrKdXogFbyb6i55AELyMn3uWESkYUBOdZxYYkyOd0+ex49PKjDX/k=
X-Received: by 2002:a05:6a00:1944:b0:848:2f84:736 with SMTP id d2e1a72fcca58-84843135c2amr6415717b3a.73.1783599843638;
        Thu, 09 Jul 2026 05:24:03 -0700 (PDT)
Received: from qby-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8484f973c4bsm1672517b3a.25.2026.07.09.05.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 05:24:03 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: qby140326@gmail.com
Cc: W_Armin@gmx.de,
	foxido@foxido.dev,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	nika@nikableh.moe,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v1 1/4] platform/x86: redmi-wmi: Drop redmi-wmi driver
Date: Thu,  9 Jul 2026 20:23:34 +0800
Message-ID: <20260709122337.17417-2-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709122337.17417-1-qby140326@gmail.com>
References: <20260709122337.17417-1-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The redmi-wmi driver is no longer needed because its functionality
has been superseded by the new generic bitland platform driver.
All supported Redmi laptop models are now handled properly via the
updated WMI interfaces in bitland-mifs-wmi.

Remove the obsolete code, Kconfig entries, and Makefile references
to clean up the platform directory.

Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 MAINTAINERS                      |   6 --
 drivers/platform/x86/Kconfig     |  12 ---
 drivers/platform/x86/Makefile    |   1 -
 drivers/platform/x86/redmi-wmi.c | 154 -------------------------------
 4 files changed, 173 deletions(-)
 delete mode 100644 drivers/platform/x86/redmi-wmi.c

diff --git a/MAINTAINERS b/MAINTAINERS
index f37a81950e25..6d9b69c1df4c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22768,12 +22768,6 @@ S:	Maintained
 T:	git https://github.com/pkshih/rtw.git
 F:	drivers/net/wireless/realtek/rtw89/
 
-REDMIBOOK WMI DRIVERS
-M:	Gladyshev Ilya <foxido@foxido.dev>
-L:	platform-driver-x86@vger.kernel.org
-S:	Maintained
-F:	drivers/platform/x86/redmi-wmi.c
-
 REDPINE WIRELESS DRIVER
 L:	linux-wireless@vger.kernel.org
 S:	Orphan
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index b54b5212b204..036fc76f62df 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -90,18 +90,6 @@ config XIAOMI_WMI
 	  To compile this driver as a module, choose M here: the module will
 	  be called xiaomi-wmi.
 
-config REDMI_WMI
-	tristate "Redmibook WMI key driver"
-	depends on ACPI_WMI
-	depends on INPUT
-	select INPUT_SPARSEKMAP
-	help
-	  Say Y here if you want support for WMI-based hotkey events on
-	  Xiaomi Redmibook devices.
-
-	  To compile this driver as a module, choose M here: the module will
-	  be called redmi-wmi.
-
 config GIGABYTE_WMI
 	tristate "Gigabyte WMI temperature driver"
 	depends on ACPI_WMI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 872ac3842391..0da4876f766e 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -12,7 +12,6 @@ obj-$(CONFIG_HUAWEI_WMI)		+= huawei-wmi.o
 obj-$(CONFIG_MXM_WMI)			+= mxm-wmi.o
 obj-$(CONFIG_NVIDIA_WMI_EC_BACKLIGHT)	+= nvidia-wmi-ec-backlight.o
 obj-$(CONFIG_XIAOMI_WMI)		+= xiaomi-wmi.o
-obj-$(CONFIG_REDMI_WMI)			+= redmi-wmi.o
 obj-$(CONFIG_GIGABYTE_WMI)		+= gigabyte-wmi.o
 obj-$(CONFIG_BITLAND_MIFS_WMI)		+= bitland-mifs-wmi.o
 
diff --git a/drivers/platform/x86/redmi-wmi.c b/drivers/platform/x86/redmi-wmi.c
deleted file mode 100644
index 58898630eda6..000000000000
--- a/drivers/platform/x86/redmi-wmi.c
+++ /dev/null
@@ -1,154 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/* WMI driver for Xiaomi Redmibooks */
-
-#include <linux/acpi.h>
-#include <linux/bits.h>
-#include <linux/device.h>
-#include <linux/input.h>
-#include <linux/input/sparse-keymap.h>
-#include <linux/module.h>
-#include <linux/mutex.h>
-#include <linux/unaligned.h>
-#include <linux/wmi.h>
-
-#include <uapi/linux/input-event-codes.h>
-
-#define WMI_REDMIBOOK_KEYBOARD_EVENT_GUID "46C93E13-EE9B-4262-8488-563BCA757FEF"
-
-#define AI_KEY_VALUE_MASK BIT(8)
-
-static const struct key_entry redmi_wmi_keymap[] = {
-	{KE_KEY, 0x00000201,	{KEY_SELECTIVE_SCREENSHOT}},
-	{KE_KEY, 0x00000301,	{KEY_ALL_APPLICATIONS}},
-	{KE_KEY, 0x00001b01,	{KEY_CONFIG}},
-	{KE_KEY, 0x00011b01,	{KEY_CONFIG}},
-	{KE_KEY, 0x00010101,	{KEY_SWITCHVIDEOMODE}},
-	{KE_KEY, 0x00001a01,	{KEY_REFRESH_RATE_TOGGLE}},
-
-	/* AI button has code for each position */
-	{KE_KEY, 0x00011801,	{KEY_ASSISTANT}},
-	{KE_KEY, 0x00011901,	{KEY_ASSISTANT}},
-
-	/* Keyboard backlight */
-	{KE_IGNORE, 0x00000501, {}},
-	{KE_IGNORE, 0x00800501, {}},
-	{KE_IGNORE, 0x00050501, {}},
-	{KE_IGNORE, 0x000a0501, {}},
-
-	/* Xiaomi G Command Center */
-	{KE_KEY, 0x00010a01,	{KEY_VENDOR}},
-
-	/* OEM preset power mode */
-	{KE_IGNORE, 0x00011601, {}},
-	{KE_IGNORE, 0x00021601, {}},
-	{KE_IGNORE, 0x00031601, {}},
-	{KE_IGNORE, 0x00041601, {}},
-
-	/* Fn Lock state */
-	{KE_IGNORE, 0x00000701, {}},
-	{KE_IGNORE, 0x00010701, {}},
-
-	/* Fn+`/1/2/3/4 */
-	{KE_KEY, 0x00011101, {KEY_F13}},
-	{KE_KEY, 0x00011201, {KEY_F14}},
-	{KE_KEY, 0x00011301, {KEY_F15}},
-	{KE_KEY, 0x00011401, {KEY_F16}},
-	{KE_KEY, 0x00011501, {KEY_F17}},
-
-	{KE_END}
-};
-
-struct redmi_wmi {
-	struct input_dev *input_dev;
-	/* Protects the key event sequence */
-	struct mutex key_lock;
-};
-
-static int redmi_wmi_probe(struct wmi_device *wdev, const void *context)
-{
-	struct redmi_wmi *data;
-	int err;
-
-	/* Init dev */
-	data = devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
-
-	dev_set_drvdata(&wdev->dev, data);
-
-	err = devm_mutex_init(&wdev->dev, &data->key_lock);
-	if (err)
-		return err;
-
-	data->input_dev = devm_input_allocate_device(&wdev->dev);
-	if (!data->input_dev)
-		return -ENOMEM;
-
-	data->input_dev->name = "Redmibook WMI keys";
-	data->input_dev->phys = "wmi/input0";
-
-	err = sparse_keymap_setup(data->input_dev, redmi_wmi_keymap, NULL);
-	if (err)
-		return err;
-
-	return input_register_device(data->input_dev);
-}
-
-static void redmi_wmi_notify(struct wmi_device *wdev, union acpi_object *obj)
-{
-	struct key_entry *entry;
-	struct redmi_wmi *data = dev_get_drvdata(&wdev->dev);
-	bool autorelease = true;
-	u32 payload;
-	int value = 1;
-
-	if (obj->type != ACPI_TYPE_BUFFER) {
-		dev_err(&wdev->dev, "Bad response type %u\n", obj->type);
-		return;
-	}
-
-	if (obj->buffer.length < 32) {
-		dev_err(&wdev->dev, "Invalid buffer length %u\n", obj->buffer.length);
-		return;
-	}
-
-	payload = get_unaligned_le32(obj->buffer.pointer);
-	entry = sparse_keymap_entry_from_scancode(data->input_dev, payload);
-
-	if (!entry) {
-		dev_dbg(&wdev->dev, "Unknown WMI event with payload %u", payload);
-		return;
-	}
-
-	/* AI key quirk */
-	if (entry->keycode == KEY_ASSISTANT) {
-		value = !(payload & AI_KEY_VALUE_MASK);
-		autorelease = false;
-	}
-
-	guard(mutex)(&data->key_lock);
-	sparse_keymap_report_entry(data->input_dev, entry, value, autorelease);
-}
-
-static const struct wmi_device_id redmi_wmi_id_table[] = {
-	{ WMI_REDMIBOOK_KEYBOARD_EVENT_GUID, NULL },
-	{ }
-};
-
-static struct wmi_driver redmi_wmi_driver = {
-	.driver = {
-		.name = "redmi-wmi",
-		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
-	},
-	.id_table = redmi_wmi_id_table,
-	.min_event_size = 32,
-	.probe = redmi_wmi_probe,
-	.notify = redmi_wmi_notify,
-	.no_singleton = true,
-};
-module_wmi_driver(redmi_wmi_driver);
-
-MODULE_DEVICE_TABLE(wmi, redmi_wmi_id_table);
-MODULE_AUTHOR("Gladyshev Ilya <foxido@foxido.dev>");
-MODULE_DESCRIPTION("Redmibook WMI driver");
-MODULE_LICENSE("GPL");
-- 
2.55.0


Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9676D4779A9
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Oct 2026 10:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799591; cv=none; b=BOKaaCL6lndPyRcM3JWy4a4PoElp50HmssJAJt4toUTdJKWMNWdhRzAXz4zjHGlh7m/UctF4ybBui83ps5MpclghDd/ziyOgF5Fotzd95vaBnr71vwbV4jBWYzltMjziLdNJb34+qI0xJgo60+j7VaTcJz/bUFxJmbnL18s91rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799591; c=relaxed/simple;
	bh=B3BguTlk9zHZCJTi8lMUWN+v5BSrwQzEELivHJQlLuw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k1yAGLSLV9YG6yQoPyO3tEB1kufDU5WcWmwf8AXOqkg/i1nTlLYAnBlyYjeN8M2nly/9kHG3xeyEJTsejIDh/USzB6UcPvOXYWedMLjP1pP2Ez4Kld8uOUNMpjWOO3TLtpahHmRkuCQdCuyc+i2AF+EBSUxsLA/M/oIczmW0Gig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oFD5K8rG; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oFD5K8rG"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-ccce6d9abfeso985815a12.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Oct 2026 03:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799581; x=1792404381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jjSH+tkIvUiQIgLglZ3urjR5zbmpKuMZGwy9+eVmxXc=;
        b=oFD5K8rG79VWKWxunC6JEd1MoVnSTisrhhkJwr5DoB7IyeR1Kf9M9iosd5suSLR4kc
         4TeiwHMRadXMGGgkBmd9N762edlFESvDBml6aTyFu5FP4mS00MP5FlN5IUXpP6LGDrWZ
         4LyQe45Ft4XDIjdSFXLo0A1UTy0Bx0EcqXcGjuS0xkItWP1vSNZ7HS210ITH0dC4Ez0U
         gup3hk4ATdjjfKyQEngu/AzxK8t+cbnUKmiYLMD89Cqd7+D3bBJf3gsdX1WsCAko0V44
         hWsRScpF+6fAn1fBuHX8TkH1/GaA3APFuVuYelOLedTz4Zn0PSjGId4MeSwSNNEE3N4s
         6mBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799581; x=1792404381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jjSH+tkIvUiQIgLglZ3urjR5zbmpKuMZGwy9+eVmxXc=;
        b=vi+VWqjW88EImbThJliGK2Gp8VVG4p7sH11NQMeVFM7PrmO/m8g8Fx4B3OUKwiDZ7X
         Enb/NgWbB81aAe8WRzr1uyDM87RPlDeqcfE7sthkN4EE2LVjf0ntYc0UA9QeMsDRDVwl
         wFY5Yv9Dlr0WiFB01CI4dWVIDyCPKZG25PmCujkhhS31qLTfJgruTkKcQhSV46Xyd7WU
         eakvA41naz/1hs3+2aD8w31Zyn7mhmRHYYSKJafrw8srNTJ+qsxW3+pLb4W8A38O5/wk
         8+Fpvi/YBjBOtB/hYopqHdeD3AdRM5fzbI7BBgX9HzaKTyvfvG8URxqF57hYzo/b2rKl
         3KjA==
X-Forwarded-Encrypted: i=1; AKwUvBy9/ZFgN1/2jYXoQrTd5xlVqx0Hjm8OGkxFts10+QvZwfjuFTYYt+YUSqvtWIM3IjaJdomwY6iU2c4lms/lbNWumRQT@vger.kernel.org
X-Gm-Message-State: AFq9FYJwH+YXsZeJbZ5SPnGIiFg6PHHVACTTDTWbCH+pCEA8dfzPWta4
	6D9PudzkQriv+tsw3yD4NlpMQcTUQT0dtxX7xC8vuD2frdfDzkSNZ6e/
X-Gm-Gg: AYBFou0J+2VTt9vieAtOefYOf441RrxsafIeku1TTnHg7ArhyFi1xs7yDj6bzTfBlDZ
	mobKDw/VIwGRkhh08EwWGiCFzDabSGvMscuJ2Dp7XXOUyal9tU4FDVw55UEXQihgtXED/Z8zzyD
	3QlkuiJSabn43HkzjDWSv+KMkAmAgr3EGdrjPELPiPA78UPPS8ESV0f8uHLz2FtZnHIsNLVBVZ7
	2gz8sVkvy/7Gez0ctEz2QJsDv4EkupdB2ikaSvOzhEAt8sj6VQ805n6KpNj3Ar6pT2f7SautmuM
	JYXuEpyZFbZWBBJZN+07UXNou3lsHsMFSJodMjo2lgsD97cJWbEF++2XmiQKgq10+mqJFSBLaf6
	OKnzvnANlnaLi5dLsVSHq3ikBRaT2K4iwBi99rSD1sdnkdYsx65+1R/xb+MtGzvlNQwrAWvC2LS
	hxTzqEVu7MMb+MRMkhdsCPTjoPXpuVbQ/GqFwqXuacEbfIRa/sj1lhTtfiFEYG2SZeifJg9dU=
X-Received: by 2002:a05:6300:670e:b0:3e0:f8f3:ac70 with SMTP id adf61e73a8af0-3e16bee7e32mr7233958637.61.1791799580578;
        Mon, 12 Oct 2026 03:06:20 -0700 (PDT)
Received: from qby-nixos-laptop ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm4074272a12.29.2026.10.12.03.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:06:20 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: KentoNion <kento@kekto.ru>,
	platform-driver-x86@vger.kernel.org,
	ted eric <ericted8810@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	linux-kernel@vger.kernel.org,
	Chris Taraszka <chris@miget.com>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	=?UTF-8?q?=E9=AB=98=20=E4=BF=8A=E6=96=87?= <btx342@gmail.com>,
	powerfullz <wleizc7319@gmail.com>,
	=?UTF-8?q?=E5=AD=99=20=E8=AA=89=E9=93=AD?= <wolf109909@outlook.com>,
	=?UTF-8?q?Milo=C5=A1=20Vlku?= <vlku.milos.fun@gmail.com>,
	Rsplwe <i@rsplwe.com>,
	Bozhen Peng <bozhenpeng93@gmail.com>,
	Anton Karasev <uselessfire@gmail.com>,
	Jame Jao <jaojame6@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v11 4/6] platform/x86: redmi-wmi: Drop redmi-wmi driver
Date: Mon, 12 Oct 2026 18:05:30 +0800
Message-ID: <20261012100532.19612-5-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012100532.19612-1-qby140326@gmail.com>
References: <20261012100532.19612-1-qby140326@gmail.com>
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
index 0874713f262b..00338dd596a9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23036,12 +23036,6 @@ S:	Maintained
 T:	git https://github.com/pkshih/rtw.git
 F:	drivers/net/wireless/realtek/rtw89/
 
-REDMIBOOK WMI DRIVERS
-M:	Gladyshev Ilya <foxido@foxido.dev>
-L:	platform-driver-x86@vger.kernel.org
-S:	Maintained
-F:	drivers/platform/x86/redmi-wmi.c
-
 BITLAND LAPTOP DRIVER
 M:	Mingyou Chen <qby140326@gmail.com>
 M:	Ilya Gladyshev <ilya.gladyshev@linux.dev>
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 7ee9ff3879c9..f87a8ec95a86 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -78,18 +78,6 @@ config XIAOMI_WMI
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
index b90c544387be..3052b92fb5fa 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -9,7 +9,6 @@ obj-$(CONFIG_HUAWEI_WMI)		+= huawei-wmi.o
 obj-$(CONFIG_MXM_WMI)			+= mxm-wmi.o
 obj-$(CONFIG_NVIDIA_WMI_EC_BACKLIGHT)	+= nvidia-wmi-ec-backlight.o
 obj-$(CONFIG_XIAOMI_WMI)		+= xiaomi-wmi.o
-obj-$(CONFIG_REDMI_WMI)			+= redmi-wmi.o
 obj-$(CONFIG_GIGABYTE_WMI)		+= gigabyte-wmi.o
 obj-$(CONFIG_BITLAND_MIFS_WMI)		+= bitland-mifs-wmi.o
 
diff --git a/drivers/platform/x86/redmi-wmi.c b/drivers/platform/x86/redmi-wmi.c
deleted file mode 100644
index cc82ef502002..000000000000
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
-	/* Keyboard backlight: Off / Auto / Low / High (new state in byte 2) */
-	{KE_KEY, 0x00000501,	{KEY_KBDILLUMTOGGLE}},
-	{KE_KEY, 0x00800501,	{KEY_KBDILLUMTOGGLE}},
-	{KE_KEY, 0x00050501,	{KEY_KBDILLUMTOGGLE}},
-	{KE_KEY, 0x000a0501,	{KEY_KBDILLUMTOGGLE}},
-
-	/* Xiaomi G Command Center */
-	{KE_KEY, 0x00010a01,	{KEY_VENDOR}},
-
-	/* OEM preset power mode: 1=Balanced 2=Silent 3=Turbo 4=Full speed */
-	{KE_KEY, 0x00011601,	{KEY_PERFORMANCE}},
-	{KE_KEY, 0x00021601,	{KEY_PERFORMANCE}},
-	{KE_KEY, 0x00031601,	{KEY_PERFORMANCE}},
-	{KE_KEY, 0x00041601,	{KEY_PERFORMANCE}},
-
-	/* Fn Lock state: 1=on 0=off */
-	{KE_KEY, 0x00000701,	{KEY_FN_ESC}},
-	{KE_KEY, 0x00010701,	{KEY_FN_ESC}},
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


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010110;
	b=h3TgXkP3J6rLu76zYKnVS4a3pCsdqnLcD2Sf/B0KOTWSKOf+Ojisxx8M+iUsedyMucO/
	 Lcgi2dTJSM3lA9S6qr1FJjcVKdKBSkxMLXfsed6ksB5cGooziYrY+kGCN29nTQfo+WGDk
	 LnI5obtaCoys2wFmfIl5KXLuF50CheWzxda+JS6nEHYIcDEE0OBLDtjS6edJV3lp4KooA
	 WZxw0PZ2MEhvZ5GlSIjc2U2rXCDKxBpC7p8PHH0jpa9b2S4OTz/7o1yrw8frhpnk1OslZ
	 e4wWAGuwolx0tot0PZAqhHkT68Ksq4BZ/qbryZeD10taT2+rDS3TSK1koau3E/mfigg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cmxURDRu3LbZqxXFYtC9PMAtteB6y+VsKiKICEN6iuE=;
	b=WG6j++gTAQnflZpncAauLeWbVhbRhoJ6eOju9r+/7CILUkj6Uaq3pG1ESni5kAaDL/AR
	 bWwVaLghLRYXxQ/YY3rZqjcCy+2YA/DMOOifFMTGg+3kUkC4O3B5EKYNVD1K/L0gcC77q
	 J3hrfDfcRZNEih4kABfGGH7w8LFaG3pEbwLbR9s3raDwk2F5zZ5kCFvszq083YKum4PIM
	 R1SjxuovWUg4kKbtGj64QJ8MizlE864yHV/xDG9Oi+AADAPrvO6oxE52P2D+1d9X+xuUR
	 GBCXqjaFlweL6YLwmMV8ZvRCj8TpeWOlYDzOFUS8dzfHwVPmsyFEOFsxctDYWCgCTJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V07zEefw;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D187606A31A
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 10:21:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D187606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V07zEefw
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ace9e6e1a5so2016457a91.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 03:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793010109; x=1793614909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cmxURDRu3LbZqxXFYtC9PMAtteB6y+VsKiKICEN6iuE=;
        b=V07zEefw0tOY2Fb5J/x+nwUcYJ4xWi0i1SBrnp1t5PKvdwr0kpV7zNPLUdJEI6tNbg
         iHEkP0vZh3Ko1w5Z60ZDa7zTasu5fiWdB/g+VRHl3nfuQU/ARnoZSMuknroqdOwpcIg/
         OQQK7Pd6OR0GY3XODXC7hoFsZWw89hjIHnHfHVZPNt0W4OBnpDmwsU1vUpv2r2w4waXq
         4SSzJb9vD4uCGxvb94M94ASqFhHXYHW/1Fe9Jesla/aSj53V3SdspU4BFavEdmY/bhgw
         CAJqc0QWnTd+gTiv96qF5wubPaha6xPOX6MMO7fxSkv2lPwW+eg4YK+DlFcEe47JFkhF
         /wxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010109; x=1793614909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cmxURDRu3LbZqxXFYtC9PMAtteB6y+VsKiKICEN6iuE=;
        b=fSt2MEPlHneLZqzmRt1s2gZwAAGYjI8KqSeQMjkOWEqgJo2AcwFEb4JvGpwId2et9x
         Zf0FejpYHws6AZlZHMF326vTwTRtWSHEGbb5MMo3d7iYsTAexnrpeCi7VyA1WtK/XE1m
         2k97638J9/qnxh2NekTG5iAAowSLRwGCcU7udf7tij12o4FS5LE2XQwEztNXpXeRRiJ5
         pHJXuJT6PK4ka/ZxU3OHf51ufrgXuE+QUwl7MTiu58jBpcNKrkxU+CEuItnSlfRVo1/I
         ZdnDuhTah9+ixi/6IJWvr7CawwIVP+FNB/N6JAbBSlHltjmamr80EG4w+S5S2tZBbr2d
         E7DA==
X-Forwarded-Encrypted: i=1; AKwUvBwgFkjuopBUgImASgFC5crlr2vQ0WuYj405+4LUSBwU6BXMK2vdxi59iL0L3Jul50thXXkdcDz8OXHugCKqw28Hv01x@vger.kernel.org
X-Gm-Message-State: AFq9FYK9fm14phYsIvrfWlRcGWCHTXTwachXh5S4uHW7zxDCDj4153tY
	lK4odtb5/OI/2i+XWDNrGJsFD5+uTdEW1BDC3aT2SNTxuklOnijNLNZ3
X-Gm-Gg: AYBFou3AzyuOvT76G2Un9cVLdaxaZ+7YsC13QFSPymiUlmQ6tttpOCVdEFHvXDymHZx
	IiRUTRAorSBYTqYQKlXQJdBRfhP2k8nZr/GU3LwcKIa/6G1MgBuD0/GrtaUpaj7Lk2WW+WsKI+7
	wyB1G1M1U6SzFw5MO6BBuvflwjFTop88zDEKNaMTbN3UqBZzNZBbnVcM5hu6yCjkHn2tbyn5VMB
	zTntSDM/jzAVQJoOAqh2SxUM+MOciIz7cSZRQD/dp9lprpK43roFKPpQZq/3H4K2vsd7THH60lf
	qaTx1YPpRs+FkF1skVJmwA5d5guXl84igMEm2o0DGpWkkqgKEMcovaM8Rb8lw6dqL5Bpj0g77/U
	7bY2/nE7J5c/bLLlvhnmyYXSwV3+2ilGU/W/P3fUESq0DCeMbHmeA/fujbCAUPwrqCLcQmuh8tY
	il3XzucfhNn45tKeCdzlL2zQ2cjLQRYWGjA2UFOH+SLMlezjR34e/6Wgrg1EQuX7phGeuvXo6Pb
	bVYmYKdtBEXSlfblObqEHTgcbJlFkXiexcqZQ==
X-Received: by 2002:a17:90b:5746:b0:3ab:b39f:41ca with SMTP id 98e67ed59e1d1-3adeb6253demr3032213a91.31.1793010109460;
        Mon, 26 Oct 2026 03:21:49 -0700 (PDT)
Received: from qby-nixos-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe6af0dsm7877467a91.5.2026.10.26.03.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:21:49 -0700 (PDT)
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
	Serhiy Shliapuhin <shlyapugin@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v14 4/6] platform/x86: redmi-wmi: Drop redmi-wmi driver
Date: Mon, 26 Oct 2026 18:20:59 +0800
Message-ID: <20261026102101.224568-5-qby140326@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026102101.224568-1-qby140326@gmail.com>
References: <20261026102101.224568-1-qby140326@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
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
 drivers/platform/x86/Kconfig     |  15 +--
 drivers/platform/x86/Makefile    |   1 -
 drivers/platform/x86/redmi-wmi.c | 154 -------------------------------
 4 files changed, 8 insertions(+), 168 deletions(-)
 delete mode 100644 drivers/platform/x86/redmi-wmi.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 250c471e674d..8ca065eb448f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23038,12 +23038,6 @@ S:	Maintained
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
index 7ee9ff3879c9..6e561359a91b 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -79,16 +79,17 @@ config XIAOMI_WMI
 	  be called xiaomi-wmi.
 
 config REDMI_WMI
-	tristate "Redmibook WMI key driver"
+	tristate "Redmibook WMI key driver (DEPRECATED)"
 	depends on ACPI_WMI
+	depends on HWMON
 	depends on INPUT
-	select INPUT_SPARSEKMAP
+	depends on LEDS_CLASS
+	depends on POWER_SUPPLY
+	select BITLAND_MIFS_WMI
+	default BITLAND_MIFS_WMI
 	help
-	  Say Y here if you want support for WMI-based hotkey events on
-	  Xiaomi Redmibook devices.
-
-	  To compile this driver as a module, choose M here: the module will
-	  be called redmi-wmi.
+	  This option is deprecated and will be removed in a future release.
+	  Please enable CONFIG_BITLAND_MIFS_WMI directly.
 
 config GIGABYTE_WMI
 	tristate "Gigabyte WMI temperature driver"
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
2.56.0


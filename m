Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C986237DAC2
	for <platform-driver-x86@vger.kernel.org>; Sun, 16 Aug 2026 00:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786839152; cv=none; b=VVfZ+ET1mbj51y66zXVOqXAFimPvTwVT/Z5dH/CzLmqNnYZZLREGNyZfMy4KVRWU2TBQoVOf5fx6rFdBICYG1lj93WzjwnIciO0KR5t9EaxY46LZrDFvN2+wGwbHHUBQhCB6+qCa4VluxkGR39uUteHp/Lf/jSb1dWSlmZix/HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786839152; c=relaxed/simple;
	bh=qaNQ/iKdm+tr9gI6Dq66O60lBZHzk6jx64BBqORlpLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sgHL2Y+Bd+unIJBxd8d2v20LyfACY+PgNj5v47UUZzccbqB2sliWDHJAG6jV/JJPFcxhTbsF35q0Xm30vK/QabLT6/15S6TSwI3QV4AOUczaD/9aIIpAqNQn89OjmWQU6cPsbdUkLKf3fkdz2BrEOTdZqYn9KpnhvXSI9haxrLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=loyEtwBL; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="loyEtwBL"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3810c5d691bso1636122a91.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 15 Aug 2026 17:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786839146; x=1787443946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7u0RLtYXUYQ7iwz3Gl2qvOsAZ+m2eRqkafH2q6kwGqA=;
        b=loyEtwBLb3OLXES1ELEO/wslIu4qgm7r3Yus4QMIw9IMxiOxzDfEEjM9Ry3zm1lqEM
         PNMa1xD9acUioJ8igyjlBeOiMJ/fJg+Nf8tbLXvC6scPzeWrSFLcUTsqpG6wYFdmfuIq
         6noF18XnxAA6xwo/6S9nGS39/Z2QS2359D9NaaOhtEiRQs11TBQdahaJC008svQrY4Wu
         bfvKsdGCCeq8SfJn/aNS4IQx5MZjzrQUq/78HVLfqvAXh9Nw50aH+zU9jQ0prtpIKsCp
         LIClgc6FvEsKha+XAiIlo37PEWWLsy95Vw1w4Gjhp4NNiuS+Ucv7okqwjxhftV7i1YzM
         3mkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786839146; x=1787443946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7u0RLtYXUYQ7iwz3Gl2qvOsAZ+m2eRqkafH2q6kwGqA=;
        b=VtBBRPA1u6LFGTOYDqlyURD6InqBSe2DpmwsypiIHDghD478y3hKtPebTPpQsR8T41
         WiJ8cyOIu11xQz7tLIRdmFEQIPtBl2QEe04+kQy3jvSmUrn7p5rUbbUm6bRxfkx54qEp
         nMpoKy2OqmLT9l4Nrz+HdiuCOpGrFasOoXOPs5ESYCJxRzxotsNLbx5/w0JzLabvxydP
         SPZBQqe8SzVMC2ORiV0OS3AkqcgVWk9N9EwtUwZGRxjpoo7ov1zT8MoEEzhe3PQbePH6
         WTeGCCtuMJoOd6fmImyhjzYl8SY+wj/MYnT8neNrQBAaWUa1Annu2gw3IkFO1Pad679c
         EwzA==
X-Forwarded-Encrypted: i=1; AHgh+RplNzKwrcFWQSRijNgKARxbw0M+NI9/TKZX1gLEj1Gu5hIHFxhwTtt/EN5ec1yeqMFRQLzDc5CPCrzpIwj1ZDr/0I6z@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf6i3/LhAiXkcv9LfQjkfdXl3JnWAQ3M9EXwGOpNn5cJXHNw32
	gfXpMLkd/rUUoU6eoj4460KwrHKe337wJlxgOOQKmS+1XoNPONw88l0l
X-Gm-Gg: AR+sD12NAhYr8cjQj+Iss8TU9KWsqlTOceWTxSxJr+2EeVvAIciia5fMvc8D0Twh24R
	gGwyambMT5obgAFs6A0Jy900aa7LXTpCh/3mTzpD8MwX19IERjAxqEVfQrZ0K4fxW7uhctoSRhF
	0IaEMJ86ao2fiqWOYtMe5Y2p00KLKxgyROZ9h0eCZS/t2lJ+MZ9AcfdW+llplDjr/LVJvczo3Pe
	ezdkfRp2eiw7JbEJCER3wfYq41+rz1giJwZe45LTtwyYCkmgRzzIpsce3dy/I7ElnteoTSq/Vfw
	uVY78BoLEEzYIw6yj4AhBKtW2+p94VcMk+Y1fSiU8EJ65gbjhzOdTk0p5b7HuqE0JryMzNRESko
	QkojeHvpCTwVwXR6Bt3Zmz0PUTSchB7RqbMrNr+3krYngLK3R/CYjTOBTBfrjIvIPJrYYHFOzLV
	AQfwg7VkZ3JviVGzandanIZQKQtJLeKrn/L7I=
X-Received: by 2002:a17:90a:e707:b0:37c:18e0:90dc with SMTP id 98e67ed59e1d1-3933b8cb37dmr16672571a91.16.1786839146461;
        Sat, 15 Aug 2026 17:12:26 -0700 (PDT)
Received: from qby-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394ea96c87bsm7409320a91.4.2026.08.15.17.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 17:12:25 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: qby140326@gmail.com
Cc: W_Armin@gmx.de,
	foxido@foxido.dev,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	nika@nikableh.moe,
	platform-driver-x86@vger.kernel.org,
	vlku.milos.fun@gmail.com,
	i@rsplwe.com,
	wolf109909@outlook.com
Subject: [PATCH v4 4/6] platform/x86: redmi-wmi: Drop redmi-wmi driver
Date: Sun, 16 Aug 2026 08:11:27 +0800
Message-ID: <20260816001129.16998-5-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260816001129.16998-1-qby140326@gmail.com>
References: <20260816001129.16998-1-qby140326@gmail.com>
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
index af86b1df1a94..b92bc4816fa6 100644
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
 BITLAND LAPTOP DRIVER
 M:	Mingyou Chen <qby140326@gmail.com>
 M:	Gladyshev Ilya <foxido@foxido.dev>
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


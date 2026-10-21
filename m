Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792586105;
	b=gss+J1Jo7GBkhBKSPJCjnobf7S3lmadT8xP4XKLWzSnKp2clEW7HXLU+JlQlq5Rw3y8r
	 /HtegsN9pV2YMPGQMZfQU8ybUhSEcrD3AiOl/d53A012d9F3DdQprabf3xgJTgD0kq1H8
	 KuF3X8Egqlc3PXAOUuGIFefw3ZFc+xYCuMfMJualnw8vDeeq8c8Sb+HTWMHrvfaTW2/vF
	 aXQAYXnLnWxoEsVRFLWBlmGHCuxyIICczHXLhd0+3/9+/z3LcWJ1QONtnQG4P9ngRVPEb
	 zBZju36RxndseOG9Ft84ttJLxHI8LsD9d1k0pBd5rIij6c7Ypv0go/Dq/HyMgXV4PZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/U9pxeFHp1yyDPo3cqpKyHrdBbsfXfnVhdf6kExQeGo=;
	b=4dZP8f/UDSlc9vWs8zOvw5lcquHuLMnLMWkWgICq0zdR08oaFZKpeOvXYwSK9D1yhu+H
	 p3utcR4b8spthMKeSKT9wdWkojv55PMgoCpLqgCzqKzzYYOIk8Hr4VCX3KZCtvalXLPdt
	 ou5Z8xwSfn8VJt2j0dDjW1qxcMz3toi2H8hhTvGno9YeCIdQcN0OoaufpVaJDTn9WD+3/
	 2pNP1jc8cCCwCP2e1SpIr9odlnXIOy9D9lkrXDPcIPnND/VmtY170X7R4QJtIwk/Gocpt
	 1oEkMqJaNbRWGdDsg83O9pD3Osvaqm80sjeq5biVArjBstCI1CB3sQWTW4+Z7LdjjJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ev4046RD;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5586760A4AE2
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Oct 2026 12:35:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5586760A4AE2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ev4046RD
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cd5c9e52398so210953a12.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Oct 2026 05:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792586105; x=1793190905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/U9pxeFHp1yyDPo3cqpKyHrdBbsfXfnVhdf6kExQeGo=;
        b=ev4046RDKj26Fv3J+npltPnBTsfIOzkx5Gt6IeJiU7iJYoAK2nnoXpyetLTKjhv3fF
         VTAaBnPlus57g1Vr5NznAKcAgt+uHPXHB5NdHOCrVG0GjBzDpV/CJRxt+y4u+g1F8vKq
         ajgWCyBQmkr8VCIGs9d+/OsyJWIfQPNynNoDToTHn1nSSjLhDJNjyHhZRQS7vz6D1VSU
         lYyyqANt1i2kn+boDq7upwsUoOmF9tWb9X5Tda2Lp4ln4Ou+8OgD02oynwTlp/cBKoaE
         LG+xXiXzo0Sq7XzJCAJc3UKPKIaVDDUbO+QRH/DHM4pHHkDBAcEYx7XvQ6su1jnn2TP6
         A4lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792586105; x=1793190905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/U9pxeFHp1yyDPo3cqpKyHrdBbsfXfnVhdf6kExQeGo=;
        b=jgUmat0OpswvpPxd6eJfnr5TJ+OYiAQe0KqXcJul6wO6ZYrfpLm5ZPNLQxgOXWavm7
         7GJGkQh0tSBlG5gqZQx4rjCss8dmKbEvKnp7FHjvTPKJRl5n9cxN3RkuWbJk15uYAjFL
         Y9j3ouxn1xhb4D4GHv3oZlXRBXp74flFlF+meToAmV9pzpKB9LtQSVCuD2fEfd4p5I7s
         QVvXLtqMI82zmhR4RYRVAJPjMB1SjbIJy3Xku6JF36MGsF1YFy37FYjo6Yqquu7FBNJN
         SQxLdXTkpVKXN/Oc9GI+pz0N7FKO8Da4bwbIOs+UtjBUs3XjfJlMTsRuVXAUBI0VtgLV
         howQ==
X-Forwarded-Encrypted: i=1; AKwUvBw12XEMAL37VXNTViP96h5LYhs7VFQTL5PAiiP5aKv0cukVpMeyoZMZzdsO0771DWrEd/vn8jv3HyDKzLaiNGucyO9b@vger.kernel.org
X-Gm-Message-State: AFq9FYLmgT52CmpkCsErMaClBoCehG5P2So2Dn5g789ltWzmsAZ82ORI
	eMfjj7IVimBjr/LzKGGsYssNnayVeRtTnyLS5zqfVrbtGJ584QP52Da6
X-Gm-Gg: AYBFou0zarR0jMYEU0miCeSBKRLkJGIcHpFT6mpFylMHYakrDfL4x+QCiWudtWPojJU
	mqJn9BXGbhDlpiYxd0SW3zW6DuXWBxAqUNIvcRbwf+svHYHdMRHQXT+7WNW/hWEgBfKFgY4V8Dn
	QF5UXlhTPEzsVBVz2VgiM7NBvxkGT48dFksiLRdNQ9GJ6mo/Q2GK/HZPlHJBDvRYpIaZQxmxFRf
	MIyN4PLNv3YVxGwkYmNhuOedleyQCQIl7w5KXEQSzU/dcRJFOuBgBKivC+X6Sg3RmGihvGNm0kW
	nDoESQ1klPBakS6OUUW/HyJ7hhOCq2GnUUA4S6H0uL6Ujj8eLRnPVlyFE6ILh92kE0+83dhxPr+
	j5G/c4jrjJcthIxqh70AnNsxnhIBnjoThpqb+1fQ8FjBNdocYvu8W7zaeq2WY74dTOIbAHsD+Gz
	giVsHyezxjlx+1rRgX+r60GbWBXiyNqRHTE4U9uojDADBNQ4djEqi8vmswC098M3ms4WcE6HK/7
	Xz03KFDmYygISWpHCa7N7hVS9I1Y3HhDygmK7FXwUDYoWqJdvSV84g749irQ6lW64aYnmcDRjvX
	8w==
X-Received: by 2002:a17:90b:1642:b0:3ac:b3e5:426c with SMTP id 98e67ed59e1d1-3ad86c8f925mr1833838a91.26.1792586104709;
        Wed, 21 Oct 2026 05:35:04 -0700 (PDT)
Received: from qby-nixos-laptop ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad85f56b03sm1823615a91.3.2026.10.21.05.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:35:03 -0700 (PDT)
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
Subject: [PATCH v13 4/7] platform/x86: redmi-wmi: Drop redmi-wmi driver
Date: Wed, 21 Oct 2026 20:34:11 +0800
Message-ID: <20261021123414.25516-5-qby140326@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021123414.25516-1-qby140326@gmail.com>
References: <20261021123414.25516-1-qby140326@gmail.com>
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
 drivers/platform/x86/Kconfig     |  11 +--
 drivers/platform/x86/Makefile    |   1 -
 drivers/platform/x86/redmi-wmi.c | 154 -------------------------------
 4 files changed, 4 insertions(+), 168 deletions(-)
 delete mode 100644 drivers/platform/x86/redmi-wmi.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 63d2fec54e86..401811130a28 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23037,12 +23037,6 @@ S:	Maintained
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
index 7ee9ff3879c9..569644ed1bf5 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -79,16 +79,13 @@ config XIAOMI_WMI
 	  be called xiaomi-wmi.
 
 config REDMI_WMI
-	tristate "Redmibook WMI key driver"
+	tristate "Redmibook WMI key driver (DEPRECATED)"
 	depends on ACPI_WMI
 	depends on INPUT
-	select INPUT_SPARSEKMAP
+	select BITLAND_MIFS_WMI
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


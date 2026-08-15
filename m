Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8B541F36E
	for <platform-driver-x86@vger.kernel.org>; Sat, 15 Aug 2026 13:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786800390; cv=none; b=u5shNNWT3b8RX6INGJ/CSlrrodk4E8uxENtuyjG2B0gliMg1Dg4hQyan/LQ0dMpeLKMkYblUCksyJqd32pqvpXWTlHX0hxjaBBUYHhSb4pVcntsnJcmlnuc+cPGMCJdhKaThrxB7RsZZ+eh3af874KCJJUgBIZJfkq2mrdB2abs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786800390; c=relaxed/simple;
	bh=qaNQ/iKdm+tr9gI6Dq66O60lBZHzk6jx64BBqORlpLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xf91iD+U2FGmVMJ/y1sdSTto1kcdCmiOQ51sbu1mqW10f6XMn28lgjDmzcfhd1LAMzZVyIdew6ghJKhvDHW3WVPe1k2w10bbn4fMzB8+VSox7PmbKZOZGm62EnncSUA+twEyVsIjiD231kCvBKTGSh1z/nn6e2ItJRecmIYBslM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cI1x1nEW; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cI1x1nEW"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cace91f112so22936895ad.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 15 Aug 2026 06:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786800388; x=1787405188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7u0RLtYXUYQ7iwz3Gl2qvOsAZ+m2eRqkafH2q6kwGqA=;
        b=cI1x1nEW2RGXohKn4hf5UVB9ZVQq1tjrvJ+K/3JoCX5UGEa+Btmgfg9DzchMTv1+dr
         KRBkwq0xZLYC3UN/MX0mEkczDSCluqREYzidLzDc7fTfitGirtGCSdNteZPqM7ya25Jr
         s3bCvrbOQ/L+yH+FoABv7BXcxVGB89BeXwyQEvT1EnIk4DZql0E8bt2S6FubsZBcroQh
         tIyPZJo/mtqGLtOSpLfPGC6RMevd2GsagyBkbFg22wPfuJNJWgy3Rohbit6w09s4i3VX
         sTkVCbRgNHaTepz6F80mkEmLsHANLpGv7BlPPgD5MbU6AoIePsMeIfIb8sOMwSwXsoY8
         KIVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786800388; x=1787405188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7u0RLtYXUYQ7iwz3Gl2qvOsAZ+m2eRqkafH2q6kwGqA=;
        b=NOwYYeCimS89cvirsl+bcWDqj6OdDmb7zEBmSeu/pQd2RAtrPXiSCXPgv5VkR+kqwh
         np1gjKGuvDvEGJwhS3RZ9uc4j4IA/SO2VU/aenWhvi9h+zA2wkuZqcO8rz0uYK79774u
         Ffs8zqXTGijRl178ko1A6yDBuHU11hoyfMpvtMbEhE7Yj6xx75eo+sgvZJANtl0qUBBZ
         KtePRd8pmk200z9JgPYe69O3/ybPi/7AJQU0n+xCLRVQ1z0Vc5XK4xSKyWsGtI+z2DvB
         Sz1eY89U4cMAPsMnq+CBJDgZ3obbCOymhZ5G5njrwVlZFEByAUex4FqsocOJv42VKN9M
         XB4A==
X-Forwarded-Encrypted: i=1; AHgh+Rp+fyA7BU2SfyX04jQYfL0OMyXUfL6oz/nLwjgro0AdgK7tsRMAkIZWLpkOsjtGlvqyO+cAQAVB9P+OwJOAWy45GFT/@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1ObD7ivCWFd6fCnl0cWtQRy55BPvxN/GSmpiz9dNds0GxE3Pa
	ZJIZUpLefwwFpywlyhzcy6RqaurkUTQdraoDPUDZUD8VZr5qoP4n5wdL
X-Gm-Gg: AR+sD13ISXPtb0jKSL0pBPxr6BmlupXbXnGTjJ9VmnpHyJF5Iwxzki+is3x9ouKN2mm
	XQ1DcU3D0lpjD0HQ5D2xo6kH5dqt4LClOD5c3mKU6BehFy1Vu8BVrmZY8WROKNFnmXXrC+8Ku0H
	gREmtaYkicjZ9xvzID8x1n+/bTC0rjGCddTiOBnRnOXuSkoilaQhSEMDr8j3S9AuU9QYtyfdclJ
	ZjgfZs0ApCzBH3eLkUjsB7gT4PcBbwYzhpHc7lL8otS9BOfVUPLQtY8GCZWnRpxZXJX7f141NK9
	OB79y/3EXFqMsWunSk/Vo6i98rvrpg1MoSqZKUEpoaOOlq3gFQ0CpT3iUXozKgUijbIFAqNsUwB
	ojHFHYAY+DBNY2xUMLrQz39kJql6ZGexk8arWyyD6mQXPYVe6F7UHTSMra8gdSZJ8YRNAKtMDnp
	FNrXxemgncXqa5pvLfOPv32JCwTNYK8C+/MFs=
X-Received: by 2002:a17:902:fc4e:b0:2d5:2f49:b3de with SMTP id d9443c01a7336-2d52f49c24bmr111854585ad.0.1786800388131;
        Sat, 15 Aug 2026 06:26:28 -0700 (PDT)
Received: from qby-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3aebc81a6sm19433245ad.72.2026.08.15.06.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 06:26:27 -0700 (PDT)
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
Subject: [PATCH v3 4/6] platform/x86: redmi-wmi: Drop redmi-wmi driver
Date: Sat, 15 Aug 2026 21:25:45 +0800
Message-ID: <20260815132547.29022-5-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260815132547.29022-1-qby140326@gmail.com>
References: <20260815132547.29022-1-qby140326@gmail.com>
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


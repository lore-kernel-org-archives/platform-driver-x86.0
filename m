Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC0C30C16F
	for <platform-driver-x86@vger.kernel.org>; Sun, 16 Aug 2026 10:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786874932; cv=none; b=eIskhaSc0X1AFHQfRGY9mrDberu+9TKfloHGP0XludWq3mvwIF6inhq5/qh3wYJ360phIl0szL7m5t3Z3msQ7r+G89sBRR1yLsFIiz7kL2vSKYZRFPdPhQfcyX5obQiYiX4m7eQ+syxFouSHPbV9m4EPQn4AW6Mgl2NGJjhpo9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786874932; c=relaxed/simple;
	bh=qaNQ/iKdm+tr9gI6Dq66O60lBZHzk6jx64BBqORlpLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ih+hOE9dVo/lxN4CBKxG6MDQLspeIcw8WMJ51yeoWQhnfAqJ7kKKenYIIdW4376tWwsJkaDOC6H+hYhArJt4ZoFbE4Am5t1RCVrLEdl3IgfU5+god+lpNgzpxzV2dNPs7SCt3XBodGd+xS+Ji5qvh7yXO66g9XyfZvlUSqlmws0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJ8PpFZp; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJ8PpFZp"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84e507b079dso1515020b3a.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 16 Aug 2026 03:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786874930; x=1787479730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7u0RLtYXUYQ7iwz3Gl2qvOsAZ+m2eRqkafH2q6kwGqA=;
        b=XJ8PpFZpifdnNMV6s/N49cXfIDhS+cGOIePRAipVfU2wBER+EHepLPPi4pgm2Q7kdM
         hljgarJnBJmirG+9EUKY7x4br8yfCwTZxKUwVLDYo1x+UoUQ78dCQYAN/QNobFEqyU2e
         PYFJ6Hcvv4kyfH0J20URqz0UKhG0Hj+Skoa8UVLUYHLeX86tx0AziNoK0VX1oMd+eVD4
         GqtDBCf6BLY0IVpClEecBhULUgk74QFr3YHxMzlFZ+H5+rc7pnQUolQcy8q80BrLJusK
         AIurs/iFuTJ/qtF2Rk710Mm2dIZhTp2MQFRysvzz+47qRPpJHcVnnkP5IRvhe654vXgW
         wsQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786874930; x=1787479730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7u0RLtYXUYQ7iwz3Gl2qvOsAZ+m2eRqkafH2q6kwGqA=;
        b=Iu77Rrcjvd+X//Q8Q9EpFnAUM/YspRKTo2B2Udk6Ik2lBZdSsXB3DQqmbnauEvhgwX
         KTVDImvE3swIiNyZ6Uo40jE5ngEj0VCpdtdFsKQaewkKG+8i+qNkIVVorEbSpsZOBjTR
         JTL0lW9U/9gRNI5f28UWcqV10hDwx6HZW9C63Lhmsk3l2buZi6az8CAdS3Y6uXlP5iAf
         BvT7VLoKTEVgMxjaPw8PFDEyexM1MEGo9m4zx227SN9VJ9ak43fBTTAkOrIEk9fTY6gA
         fb7YAEM5jPwlbjlt7wQyb5bbDVmNsjHHhMeGMAzYuY8J42Wcs634yPbyoxkqWsJLTvaL
         e0nA==
X-Forwarded-Encrypted: i=1; AHgh+RrJ7Vy/2S6hbR8vuBMswDV5I1aNbCZjDM1vXfya34LHB3UHbdw2Ma8msLjyE8Z5LVM42vNGQs5Fu6K9BLuEReaZ2qop@vger.kernel.org
X-Gm-Message-State: AOJu0YzQsUJt4OGOqlP9QdrCDdypxuwaLqGs26nE94bdoSx9uP/HZWgq
	wgAdwzho/Ukjfy0Jl2fR2rakrQvTdlaO9Ete/MBzQCI1erzejINb5cji
X-Gm-Gg: AR+sD10RC0SBHEp6FgXoIafAd4on8XVphvYlfRyyhtxMFKk34AcP1XKErXlUbQjuzsh
	n2Vwo9vNjPW1d7IbXGznm3drgpXDYLwySBupCoV5/6gKnSuL6T3FWmpkJH+//9Ziqppuumo2ggH
	kOV7ke3SkYFEx92fWZAZ8eXNIkQu8joaN569ymjRKwG+e6UxP92nk5F/sFB1kxbAu3Q66iZSRGI
	ubkOL58WaeLuRQVfQeeRarMTrRw/BAXKHZEDrrmJVRqasPmcaj18smJ40h8hstqVusFw5y2oTEA
	Mt0AaTWke98fCoL78r34r5G/1AL5SPvDPqUMi6v+WN57joy+pr4zJA+c9NyHN5MEeyiJGvTv3aR
	4285HBmCG2BuyH91Y0RwC1omFq3D5VOnKlQQCGymZHMF0b/VbNexy+a/eyUOrzOOanbsMul30gn
	/VAeAJEauTRHhHPj/o86LSqbEfUWo/Sk4WflHi6lDO882pXA==
X-Received: by 2002:a05:6a00:414c:b0:845:e9e8:6458 with SMTP id d2e1a72fcca58-84fde38d9e8mr17570417b3a.20.1786874930513;
        Sun, 16 Aug 2026 03:08:50 -0700 (PDT)
Received: from qby-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d01f15dsm1759601b3a.20.2026.08.16.03.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 03:08:50 -0700 (PDT)
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
	wolf109909@outlook.com,
	rahulbheda131313@gmail.com
Subject: [PATCH v5 4/6] platform/x86: redmi-wmi: Drop redmi-wmi driver
Date: Sun, 16 Aug 2026 18:08:11 +0800
Message-ID: <20260816100813.300450-5-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260816100813.300450-1-qby140326@gmail.com>
References: <20260816100813.300450-1-qby140326@gmail.com>
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


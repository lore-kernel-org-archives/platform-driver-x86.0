Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009436;
	b=0csbvespoosRkXm7kyd+x0ylZDe05k+LwMUyYbL/7RAjuKXEjdn7bQe3O5Xf8jRPmslK
	 ZkG3QUbGPIXWcXImBRrv11F7mh8Uyyyv59xXmv/HzMDtSHim9HpBLhUWdCyrnjPxaRZgU
	 S3tjxcSlC+YBJViXuj79RvG1xupN55AuClh8Y+C2p9Qdnf+fAFe/CvoS8OxsFadVca0nK
	 tq3FSFLBSPXGhDLtlfFt0dqSlDC7OmtONoFlnrJ06B1QPHBRU9fSEqvCEW04bLmaQ7JwC
	 2Tx9fIfk4zZwwLoMc5IRtC6H4yYbk61hdXMQkj0G2/eNLKUDh4K+lNGwwCcw+NkpHHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009436;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cmxURDRu3LbZqxXFYtC9PMAtteB6y+VsKiKICEN6iuE=;
	b=j3gjzYZN7JUb4HuCLzGIxYvWgXxLJcDdIAArPaPXnCKxBI856yxilsZy66I7QD7gr+Xw
	 gjot2ZZ10LY/SBx7CbWy1B5g1Pj015mius8br3AZfP1IhCyDhcCYDLf/yxLF2sFhSM2Fi
	 8vfEJWZg8iY61uj6vapswqqyINw7LAQF1sc+lKv7/WHXMwkYgjppuCMzPpxPNpmN1yK7B
	 WiWus9syPu7ZvUqjmGYU+Nb0D4kdxRTIv95OZSruvsTIO7fwSZaqbpVXvbqgFOSX0KNzM
	 bVBvL8nItlxjW46WIW9eb5RCVGdOtXF8Yr5CJMiFBrjnbaH9b351TICz0eQnBoh2I8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Qi2TJE4w;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F7D606A339
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 10:10:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51F7D606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Qi2TJE4w
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e60f9af6e6so24724115ad.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 03:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793009436; x=1793614236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cmxURDRu3LbZqxXFYtC9PMAtteB6y+VsKiKICEN6iuE=;
        b=Qi2TJE4wzRO2xRzB/nxs30J3YpSGO/rxIjwTrBsBSh33YZr3RYoVOZKqqNR/Mr4Yvq
         JGAtE8oYRvQc9Gk1pqopj4pBJkaqWP9k603ZoJ2PooKxBevaWxFrTAZ9+X1R5j+CVz3N
         /dD3PISGAbDFfm8ILMD/Hlq06nf3zPQYwAyycM1lmgJa46ROcJHZpn5XIRfBckqBQApi
         LdDO/UY7HrxknZh65tglWSf22assJUogdNxbLsvOkd/6CCGmC4ReCIiXYrtliowIaukz
         difStZ1dOm3rw2jwtRXlIZf4rgiF5unGcZpcEyZG4evQbbC1xn31pDunn1Sgbq/Yf/Wt
         2oWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009436; x=1793614236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cmxURDRu3LbZqxXFYtC9PMAtteB6y+VsKiKICEN6iuE=;
        b=vTb+xwlXV/kndN0InDCoPwRlwjlzQvlZ8zvcXdQNSrPjsTU6Q7vqde3LGyaXzKklvU
         dvI7HwXPItIx5a3qBsScTLFe5HZm3UzyDfcjqIQPQNJT7G9aiZR+4xP1s++9fTXyYwQd
         ICDpEIUDY/4vzLgEnJ6fTspT3O86wNDQIWKGnkt+nAmwqbGsFTkmBUYDhiE7SOuoURNp
         auJhXd9Fk19tYb6XXCQEx5X1efWXZQDguxyEEuvoDY7Gf3t7aLYmPgQbZlQkfeNv0m3V
         xhwRDdWE4k3LKJIYfpLDLDU2pAIAPKKhB16V84twVIZQoM0GjJ6Khvwzux5vE8vCIlR0
         cf3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwLjtIdsGFzX8euCvoBrYVRMAd+hX2tAJLqkWhtw+I+ijxYXTxrX3osyQ03sNwP/Pqf5V03Q1f9lCINDRv4nkUKWO5R@vger.kernel.org
X-Gm-Message-State: AFq9FYIgkJ7YCa0mX4KPprI4WVGk70bHhEJDU4Jh4oi09Vj0V+phD/Hp
	ND1xHrbkxKV0tVMT5zOhzZQOCqDwWceLid63T3xLwGnOv+PcwrMfenHl
X-Gm-Gg: AYBFou05ivzYri20e63eVC3g8cyHH2nmmpaXYo3j5U+/n+LOEEfOpB86d7akIPO2TzS
	kTd8aI6Vkpr4xlG1HoWQrdxJNxyeEhmpasl9rFG4cCkYf0nMoQA/wKMgM4r1aI46WBurPKZJsGf
	YWA4cBEg2BWoBKP6gpLXYmJl+5KTN9N1nPFdrqcCJbmh/gYBSDjKECi9aYc0OQRI85HwQBbO7eg
	x9ImTkiGVr1EnCr9q9N5mc6rz/WPcjYRG+BFdci5YizyR1DBkFHB9O6CnVeiHu/FLQhBPzkP3tX
	2D9UA37xWjbcM/AP5YAkISBrvR9ToLkuuNVW9ABBzfklFy6HMYGKjC7ottXfQhB++7jqQP7rrT1
	qNruvx79nSs4iMZQdHXPJfosNKEjX8Lu8J2XSya9RF+wgVZ9rUpRUHvF6YOp61tdF8o6XPcZtSG
	poOtVyfWLwBWY1W2azrXaTDp4S9hu55DsrypNkAlFSxJsd8TzD7R31Ec/9FiMMG2GlPjM/oUjPl
	ONt9RpLIzw/g6q2yq/5ynyIWRb4phV8HLBK1g==
X-Received: by 2002:a17:902:f60f:b0:2e2:d77b:e587 with SMTP id d9443c01a7336-2ea9c68cb78mr60896085ad.18.1793009435715;
        Mon, 26 Oct 2026 03:10:35 -0700 (PDT)
Received: from qby-nixos-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1e52f3sm14586065ad.67.2026.10.26.03.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:10:35 -0700 (PDT)
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
Date: Mon, 26 Oct 2026 18:09:25 +0800
Message-ID: <20261026100927.217643-5-qby140326@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026100927.217643-1-qby140326@gmail.com>
References: <20261026100927.217643-1-qby140326@gmail.com>
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


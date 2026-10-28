Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186908;
	b=egv7HuSrLyBPvIytTEKzohKpLqZs8IdD/2MqnxjVr1/wstMAd39KVlLuCE19Fbqv99ui
	 Y6MhIrSmzWhjJ3ttBdTo852mV52wt0QvXL95TTd3B4icYklJI+uzQPhN6ad/gCKo/rPSx
	 4zQWpxZf7tIdyefYR4mWMBlPUtnTdf5NSuAn6uHnU/lW94MGpEL4nmSaX9nwM7x5k8SyR
	 RLfEolD05GMnP2ftGSavoSkIMQ4gyt1H4iT+HbRQJueONbJEBDkc4uzJ5NJeN+isyvpTM
	 ECPonjUMigPXFXyKvnSbN/dpBrp7M3zCmiwCeP7ObdSF2SsYfcZGYrpvcshw/ZH/Qaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186908;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cCgGM3irPqBvirq+p7tcD/3J00HIlDMpjyb73J5AciQ=;
	b=fZSY/XMPXtjQ8TOJr3GCVL4pHIGzpP3Bes87ioid/JWlJiUf8/sRnZyglZyCaZ6GZbD2
	 E62ppqLYDvBKMM99sDyg9W226T+kRNMWsVxOCA8q2G+hV0Jkau9lUuApvpOR1I19/J+kK
	 fMGghQSGdQUgzLRHtDZl4GFLUREoNzwPQ5ok/R4wZeRcINSPCeCKZ2noPHVCduMLapo5z
	 P+dorZ5YEJd2yVKJiUeeZaU5qhxWbbuyMqvNvr23bJuVbbwFA74SG4lhJrwz2SeD3GW1J
	 dhVxkYVDSQiVp6p4fzqimANVar5C7sP32FgRUk7Hidq/X1xX8jyyDRcdyLACo+MpTAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N1JRB6sK;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FC8606A325
	for <platform-driver-x86@vger.kernel.org>; Wed, 28 Oct 2026 11:28:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4FC8606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N1JRB6sK
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e831e86ebfso4788995ad.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Oct 2026 04:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793186907; x=1793791707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cCgGM3irPqBvirq+p7tcD/3J00HIlDMpjyb73J5AciQ=;
        b=N1JRB6sKFu4wFLoPvPVRb75Erm0kyWpV3b63A4vJA7Q4/O+cvilRvfyjC1mfy54q+/
         Jndgri+mfdBmNZFWlo/HV6wLT65VwZj0ME6r50faENbzEMprkmYJBOtMGEbgfTmkqfwb
         gWxIrJk1BlIosFepk1lg2rDPeMpG3cClXQrE1ejH9Kc0DhFTv2KKvwKwRw/ZhZ2ayIE7
         1767yLJvxhU/AaTTH1Sigw28x30ePXD9Z9Yg7wFdc+EcjngI01oGtMfSXNIxgI3Dhr3Y
         vjvxBrsy+E9HpSbc8V3t3aqh/j0QhlifrvOtIhQU1Kzr1K6D5lw1fIhNH2dJ+IBsqrFN
         rwGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793186907; x=1793791707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cCgGM3irPqBvirq+p7tcD/3J00HIlDMpjyb73J5AciQ=;
        b=tlw0w69gERvuPOIM4E9/dw7+Jx6Fngsp/THCbEs01EWK7k2UqgZ3ODhQvIjheESpqW
         426DsHmoBZP8Yfq819ZKfT5X6oAApnN3MBt1I/6xgmGmWkfCPSlUtsrEtPaGRtHs8nVD
         p6ojzZNc+Knf0yB2t176Y/qLDvOkUEgZmMvbgR/OhvlYDsQr4xn5o8EJ23fXV4efPTEo
         4vZkYNrD2KNBHgw9PffsqDUCYvdMefGUefF86LjZbU+6HgFgtwSaO0AX9ghBdJrvz1/i
         pvGkOs3boVMGx3MUD4X62YBerbZQBJIr51xlw/V9hnXQRhLvb2GzQCYxb297VHOzbY/V
         bv+Q==
X-Forwarded-Encrypted: i=1; AKwUvByEH1oP9NdNHe9RRrtZ3tRDmI6B3Mrq2GxWcWbqk+qw3YavEHGnmxUPJmmk2hUvGN57fPibfMrKoNHMRf8JSjkcNjXb@vger.kernel.org
X-Gm-Message-State: AFq9FYJzmuyuJy/dLrTXgnKcYgrQH2QvjuPWlHWc86EBXmBgzf/5lq4B
	jNz4P9Eq9xV5iqXpTVUyo4rFFSCZl0nQDy3JoiSbqdt5U5s645JyFM1Y
X-Gm-Gg: AYBFou3fg0i+tENklkQpmAuQrp7uvbq0CKoe/fgtZk/NIUtMh74h6dSgYAm5630YJf6
	MwLzqDcNJxf69IvhNb5mb3IRTHvt7I6ZjFchOdaNawm634ixgDtUdQDxoql6gJ7ByGUM90edfXX
	Q2PXHT6ZP7rcOAyDQ19Qwb1ZnvH+KzTYNpVrz2D4uykLmgCIfXB8etxvmhLfSSACCXjy7csA+uG
	DFLON8s99ZNRH7liP4SbgvV/fuJtxLwYKcmSvqzIgf+PK6e0eABCBiIynhQAUECpZLWXV1tIu6X
	7pRNKnlEDMmwr+2SIzb9R0Wxsiw57msAUYihGzE/s6qBSrWclYyKlXb9TmznKk+wEKGiwLPc5om
	C/xvtyTU5EqaBonObXag6k+dNLlKTPdhUpw9oJ1NO7AVGkDHawtnylW1H7w298fP+d/EEwHeu28
	UpORHNZEJB5mYIVABWh4FD09uei5PEM1EizzCUrKsgcfTkAFqEghu1FufSqrg3JGkZm81dF+OMC
	2jMX99OL3jdStw2x8IKuaYtwd2fc1hKWdY3AjblWLUeHHjOhvxxGAEmWWknmGPnM+qfQa7mkLVT
	9rPE8km5yOkOR16XJeTwgPAS+VAHFhpR
X-Received: by 2002:a17:902:d48f:b0:2e4:4eed:5cc5 with SMTP id d9443c01a7336-2eb0040010bmr21383835ad.38.1793186907133;
        Wed, 28 Oct 2026 04:28:27 -0700 (PDT)
Received: from qby-nixos-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b76dafsm20128745ad.18.2026.10.28.04.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:28:26 -0700 (PDT)
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
Subject: [PATCH v15 4/6] platform/x86: redmi-wmi: Drop redmi-wmi driver
Date: Wed, 28 Oct 2026 11:27:40 +0000
Message-ID: <20261028112742.674847-5-qby140326@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028112742.674847-1-qby140326@gmail.com>
References: <20261028112742.674847-1-qby140326@gmail.com>
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
 drivers/platform/x86/Kconfig     |  13 +--
 drivers/platform/x86/Makefile    |   1 -
 drivers/platform/x86/redmi-wmi.c | 154 -------------------------------
 4 files changed, 5 insertions(+), 169 deletions(-)
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
index 7ee9ff3879c9..e7f0734e57be 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -79,16 +79,12 @@ config XIAOMI_WMI
 	  be called xiaomi-wmi.
 
 config REDMI_WMI
-	tristate "Redmibook WMI key driver"
+	tristate "Redmibook WMI key driver (DEPRECATED)"
 	depends on ACPI_WMI
+	depends on HWMON
 	depends on INPUT
-	select INPUT_SPARSEKMAP
-	help
-	  Say Y here if you want support for WMI-based hotkey events on
-	  Xiaomi Redmibook devices.
-
-	  To compile this driver as a module, choose M here: the module will
-	  be called redmi-wmi.
+	depends on LEDS_CLASS
+	depends on POWER_SUPPLY
 
 config GIGABYTE_WMI
 	tristate "Gigabyte WMI temperature driver"
@@ -108,6 +104,7 @@ config BITLAND_MIFS_WMI
 	depends on INPUT
 	depends on LEDS_CLASS
 	depends on POWER_SUPPLY
+	default REDMI_WMI if REDMI_WMI
 	select ACPI_PLATFORM_PROFILE
 	select INPUT_SPARSEKMAP
 	help
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


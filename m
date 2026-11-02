Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793652386;
	b=rzeSRZo7siGkdPg6WkDH0d4wgz6BiN2ApmOb/ImRpLgnom5KfYVGYfFAGFZJeo5Z5x71
	 Xi8Cvc7YyYG5jjz3419MmwUkSRmg41MkHuHQEkTHsmXYaKRR+pa7hYljCvVqj3WLBLI3r
	 OHbjWPFJRuWG9ACPKsfMCwsOXwyZDvEYartCecwdW7zk0eD/my+gEUvnLGaKbEVy+e1qH
	 FvjirDY0V6TP+tFeI4s6fiod19RIns3bq4zjfy95PQJ4nc6rJzKEcenReSwM7GVubPmQ0
	 lTQc3Et3SW/oA/EhXmWzFGrM9lU0yrdsa9exNA4pKD2v0vV/VFgUsLJSd60RD8Wy6mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793652386;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=di6Jkafc/mpbrSDW2gaJ0nmrbE6SSajMfKo0S//Reo0=;
	b=Zf5sJWZc7Vzcm1A0qWz8ng7yoX7myxbiof4eRi3DdWWILRGP0etZrd1akymhEI8tncFD
	 A/Wg1xc0pEsPfdCTQAiS68kSbNq58gdH4BzvtI6RbXNNUQdY/vzIrpo5dwtPyqWJSoBZq
	 D3jXd5i/3GyGFu586V597GR61pnVukNj+w0qZtoC9qepNOXjExZpM0xYb7PQ66C4sppR4
	 ccNo/Hrtidc2wwreVV1O7izlEF29j0HNiJi9CRWYT7CT+7kDz7WAIfVXMrfcjKM+1dypF
	 Jeq83s/tCwN/EiQArobdTb4PMZlDQUXbK6o7Bvn8PrFxJnr50ndeExKepFK6DfpibTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yOAp7HcV;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374C8606A326
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2026 20:46:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 374C8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yOAp7HcV
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-369f3e9e431so35387eec.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 02 Nov 2026 12:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793652385; x=1794257185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=di6Jkafc/mpbrSDW2gaJ0nmrbE6SSajMfKo0S//Reo0=;
        b=yOAp7HcVolNt6JCpahtsBRUCuob9eeHzXReSWD0jBkmeri+7PsGX8cGOLPoLZMln4H
         GQKhqlZ+izRX2A2QxfAr4EyxHJuox4Zxo1HrnYJSdmtTUEpj1eduhDc3ggqRUJmB2/w1
         sMvjiWofHX8o8tddTIoAhOhX2YVJkLf/5xHgb4RrMvNdu7dWt5A6tWJ4aZLa2sPvOYxV
         TVSsHoQeo3P2qNBV3AIs0023ubwCaNr3S/JY3gxyUUAPWzurr0V9qHoHtM/wN8u2DkZh
         b+nVjyjLi89zKcWcXIubbyxGdS8+8BZ1XNSNHRNs4mbfcWblTTzmzPDUCqDWthbXvXXZ
         jHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793652385; x=1794257185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=di6Jkafc/mpbrSDW2gaJ0nmrbE6SSajMfKo0S//Reo0=;
        b=R7V6keEk6XLTQdyxXsvPrARqKCGWpGj9uk93mpJCbs2CfSdFR8dlvXrV/2InTj9x9Z
         aJ1ewMx8xR7Zr0uR2FEYA0Ag6TEZlii6zA5ZWmCwB650M6lAiwHKJmzk1Tgm2S0Zg5jU
         K0jS17y4DU8YstvSqrddGan81C7EVLjBIK7pylMEuFAaxwMxks59sKYgViqarWYMVZsQ
         3g0QhKkKbiOJOkKvpgoXE1n/vvdcGzovYEjyHTHhw7FyxBTRLcV2GLpqehMQx+dtGxvU
         3nwc4qYZc1/WmeRvC2fnn3uiqykpWUEGBB/CviYfeFqAud8nq5iIvCEpHYGJNMOnybQr
         g+Cw==
X-Gm-Message-State: APuU4Z+QV3zULt07Ny0aBy4C//Z2SSDmzBYRIwUiaBVusaLOTEJd1tqO
	j/eVYjO6avkHBkDPpx3fXJbRMG7Vn2jSC7Prd3UvgBiAdeS/Q0sSsNnHP1V4939m+c8=
X-Gm-Gg: AYBFou2Ut2EMEYSNy4twBMZuq4mt9nuSR7A+dIt9geFTDF/iZ1J6y39RBibJ9mJYQED
	ANkddparrB2mN2s41ZQnFYTWwVtHxmD9psG0HGPdEJ5D/sxkneUkVqsjIjtPtLrljzMHpxLBtg2
	cd7WW+9NUqG72CKBdLb9LDTNLcos5+3tc1/fgX5+kO5JLcjI7jy+KcXsrI+6QnvZGBkQWpmkM2J
	IRBpnmJ6HjmbPXMMz+BJNEdkIIYAd5M5v3XCWPARjVu14MJEA6W4Vb3PiPog+TyKlTiszCiFipv
	Xa95FLErIidttE69167rJc6JoHmlYJdRIFkdtdqCSpgzL9d9oDmMy05OZ2NBYLc6TH+UM2PnABH
	ZS4Eb1hVEsZGIpyyIxvCKi+kh8mwXxL/sBpa3omkmfKfncc5vU85ZtJkSyhCL8urmTy1Qx+UGmI
	t+MJ4iN8aUWL1+URjNQ2Oypb+XCa2N7Wi3d+6Dl3ksthKmpwqjiwc553mp4hln1QsT9KCgK7uvj
	+lc0/MzrYD0821AGleipbiFI92UToWTCawkDoJsmDZ+jQxJ3j4lGVOJR30hs8eMe2B4pDNso92X
	JMzS3xSUQlXfi8J5SvDf41UClUVO8Cq82lGXoZXfRQ717Dkq
X-Received: by 2002:a05:7301:6e98:b0:343:5f5f:eef0 with SMTP id 5a478bee46e88-36a3007202dmr22788846eec.21.1793652384988;
        Mon, 02 Nov 2026 12:46:24 -0800 (PST)
Received: from Lucy-Fedora ([155.254.126.101])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm48033670eec.26.2026.11.02.12.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 12:46:24 -0800 (PST)
From: Lucy Wong <lucywong2778@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lucy Wong <lucywong2778@gmail.com>
Subject: [PATCH v3] platform/x86: add Xiaomi WMI key driver
Date: Tue,  3 Nov 2026 04:46:11 +0800
Message-ID: <20261102204611.63792-1-lucywong2778@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <0f1fab72-bf10-4074-b832-77ab1b583b78@gmx.de>
References: <0f1fab72-bf10-4074-b832-77ab1b583b78@gmx.de>
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

Certain Xiaomi laptops expose extra function keys through a single WMI
event GUID (B74AF83F-8B2F-4069-ACAC-36D176F62FC0). Unlike the existing
xiaomi-wmi driver where each key has its own GUID, here all keys share
one GUID and the event buffer encodes both an event type and a keycode:

  buffer[1] = event type
    0x01: keyboard backlight level (EC handled)
    0x02: press/release keys (5 keys with abstract icons)
    0x03: firmware-handled toggles (touchpad, Fn lock)
  buffer[2] = keycode within that type

The keys with abstract icons are mapped to programmable macro keys for
userspace to bind. The backlight and toggle events are handled by the
firmware and are ignored.

Link: https://lore.kernel.org/platform-driver-x86/20260601151404.93049-1-lucywong2778@gmail.com/
Signed-off-by: Lucy Wong <lucywong2778@gmail.com>
---
Changes in v3:
- Add a mutex to serialize sparse_keymap_report_event() calls
- Document event types 0x01 and 0x03 with named defines
- Use dev_notice() for unknown key indices
- Fix reverse XMAS tree ordering of the notify() locals
- Set .probe_type = PROBE_PREFER_ASYNCHRONOUS

Changes in v2:
- Convert to .notify_new and set .min_event_size
- Ignore firmware-handled backlight and toggle events, which removes the
  toggle deduplication state
- Add the missing select INPUT_SPARSEKMAP
- Name the event codes and align the defines
- Add the dev_printk.h include

Re: BMOF data -- the WMI device does not expose embedded BMOF data; there
is no bmof sysfs attribute for B74AF83F-8B2F-4069-ACAC-36D176F62FC0.
---
 MAINTAINERS                            |   6 ++
 drivers/platform/x86/Kconfig           |  12 +++
 drivers/platform/x86/Makefile          |   1 +
 drivers/platform/x86/xiaomi-wmi-keys.c | 134 +++++++++++++++++++++++++
 4 files changed, 153 insertions(+)
 create mode 100644 drivers/platform/x86/xiaomi-wmi-keys.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 748ce4d1c6a2..0a280e6773a7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -30546,6 +30546,12 @@ F:	fs/xfs/
 F:	include/uapi/linux/dqblk_xfs.h
 F:	include/uapi/linux/fsmap.h
 
+XIAOMI WMI KEYS DRIVER
+M:	Lucy Wong <lucywong2778@gmail.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/xiaomi-wmi-keys.c
+
 XILINX AMS DRIVER
 M:	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
 M:	Conall O'Griofa <conall.ogriofa@amd.com>
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 9ce384e0475e..efebf9e55b98 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -78,6 +78,18 @@ config XIAOMI_WMI
 	  To compile this driver as a module, choose M here: the module will
 	  be called xiaomi-wmi.
 
+config XIAOMI_WMI_KEYS
+	tristate "Xiaomi WMI key events driver"
+	depends on ACPI_WMI
+	depends on INPUT
+	select INPUT_SPARSEKMAP
+	help
+	  Say Y here if you want to support WMI-based hotkey events on certain
+	  Xiaomi laptops.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called xiaomi-wmi-keys.
+
 config REDMI_WMI
 	tristate "Redmibook WMI key driver"
 	depends on ACPI_WMI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 229057234d00..e77959052776 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -9,6 +9,7 @@ obj-$(CONFIG_HUAWEI_WMI)		+= huawei-wmi.o
 obj-$(CONFIG_MXM_WMI)			+= mxm-wmi.o
 obj-$(CONFIG_NVIDIA_WMI_EC_BACKLIGHT)	+= nvidia-wmi-ec-backlight.o
 obj-$(CONFIG_XIAOMI_WMI)		+= xiaomi-wmi.o
+obj-$(CONFIG_XIAOMI_WMI_KEYS)		+= xiaomi-wmi-keys.o
 obj-$(CONFIG_REDMI_WMI)			+= redmi-wmi.o
 obj-$(CONFIG_GIGABYTE_WMI)		+= gigabyte-wmi.o
 obj-$(CONFIG_BITLAND_MIFS_WMI)		+= bitland-mifs-wmi.o
diff --git a/drivers/platform/x86/xiaomi-wmi-keys.c b/drivers/platform/x86/xiaomi-wmi-keys.c
new file mode 100644
index 000000000000..7452c6eb8eca
--- /dev/null
+++ b/drivers/platform/x86/xiaomi-wmi-keys.c
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Xiaomi laptop WMI hotkey driver
+ *
+ * Copyright (C) 2026 Lucy Wong <lucywong2778@gmail.com>
+ */
+
+#include <linux/device.h>
+#include <linux/dev_printk.h>
+#include <linux/input.h>
+#include <linux/input/sparse-keymap.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/wmi.h>
+
+#define XIAOMI_WMI_EVENT_GUID	"B74AF83F-8B2F-4069-ACAC-36D176F62FC0"
+
+#define XIAOMI_EVENT_TYPE_BACKLIGHT	0x01 /* keyboard backlight (EC handled) */
+#define XIAOMI_EVENT_TYPE_KEY		0x02 /* press/release keys */
+#define XIAOMI_EVENT_TYPE_TOGGLE	0x03 /* touchpad/Fn-lock toggles (EC handled) */
+
+#define XIAOMI_KEY_PRESS_FIRST	0x01
+#define XIAOMI_KEY_COUNT	5
+#define XIAOMI_KEY_RELEASE_FIRST	\
+	(XIAOMI_KEY_PRESS_FIRST + XIAOMI_KEY_COUNT)
+
+struct xiaomi_wmi_keys_event {
+	u8 reserved;
+	u8 type;
+	u8 code;
+};
+
+struct xiaomi_wmi_keys {
+	struct input_dev *input_dev;
+	struct mutex key_lock;	/* Serializes sparse_keymap_report_event() */
+};
+
+static const struct key_entry xiaomi_wmi_keys_keymap[] = {
+	/* programmable keys with abstract icons */
+	{ KE_KEY, 0x01, { KEY_MACRO1 } },
+	{ KE_KEY, 0x02, { KEY_MACRO2 } },
+	{ KE_KEY, 0x03, { KEY_MACRO3 } },
+	{ KE_KEY, 0x04, { KEY_MACRO4 } },
+	{ KE_KEY, 0x05, { KEY_MACRO5 } },
+	{ KE_END, 0 },
+};
+
+static int xiaomi_wmi_keys_probe(struct wmi_device *wdev, const void *context)
+{
+	struct xiaomi_wmi_keys *data;
+	int ret;
+
+	data = devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+	dev_set_drvdata(&wdev->dev, data);
+
+	ret = devm_mutex_init(&wdev->dev, &data->key_lock);
+	if (ret)
+		return ret;
+
+	data->input_dev = devm_input_allocate_device(&wdev->dev);
+	if (!data->input_dev)
+		return -ENOMEM;
+
+	data->input_dev->name = "Xiaomi WMI keys";
+	data->input_dev->phys = "wmi/input0";
+	data->input_dev->id.bustype = BUS_HOST;
+
+	ret = sparse_keymap_setup(data->input_dev, xiaomi_wmi_keys_keymap, NULL);
+	if (ret)
+		return ret;
+
+	return input_register_device(data->input_dev);
+}
+
+static void xiaomi_wmi_keys_notify(struct wmi_device *wdev,
+				   const struct wmi_buffer *buffer)
+{
+	struct xiaomi_wmi_keys *data = dev_get_drvdata(&wdev->dev);
+	const struct xiaomi_wmi_keys_event *event = buffer->data;
+	unsigned int code;
+	bool pressed;
+
+	/*
+	 * Only the press/release keys are reported. Event types 0x01
+	 * (backlight) and 0x03 (touchpad and Fn-lock toggles) are handled by
+	 * the firmware and need no action from the driver.
+	 */
+	if (event->type != XIAOMI_EVENT_TYPE_KEY) {
+		dev_dbg(&wdev->dev, "ignoring event type 0x%02x\n", event->type);
+		return;
+	}
+
+	if (event->code >= XIAOMI_KEY_PRESS_FIRST &&
+	    event->code < XIAOMI_KEY_PRESS_FIRST + XIAOMI_KEY_COUNT) {
+		code = event->code;
+		pressed = true;
+	} else if (event->code >= XIAOMI_KEY_RELEASE_FIRST &&
+		   event->code < XIAOMI_KEY_RELEASE_FIRST + XIAOMI_KEY_COUNT) {
+		code = event->code - XIAOMI_KEY_COUNT;
+		pressed = false;
+	} else {
+		dev_notice(&wdev->dev, "unknown key index 0x%02x\n", event->code);
+		return;
+	}
+
+	mutex_lock(&data->key_lock);
+	sparse_keymap_report_event(data->input_dev, code, pressed, false);
+	mutex_unlock(&data->key_lock);
+}
+
+static const struct wmi_device_id xiaomi_wmi_keys_id_table[] = {
+	{ .guid_string = XIAOMI_WMI_EVENT_GUID },
+	{ }
+};
+MODULE_DEVICE_TABLE(wmi, xiaomi_wmi_keys_id_table);
+
+static struct wmi_driver xiaomi_wmi_keys_driver = {
+	.driver = {
+		.name = "xiaomi-wmi-keys",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.id_table = xiaomi_wmi_keys_id_table,
+	.min_event_size = sizeof(struct xiaomi_wmi_keys_event),
+	.probe = xiaomi_wmi_keys_probe,
+	.notify_new = xiaomi_wmi_keys_notify,
+	.no_singleton = true,
+};
+module_wmi_driver(xiaomi_wmi_keys_driver);
+
+MODULE_AUTHOR("Lucy Wong <lucywong2778@gmail.com>");
+MODULE_DESCRIPTION("Xiaomi laptop WMI hotkey driver");
+MODULE_LICENSE("GPL");
-- 
2.56.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792695396;
	b=jXj+bAODQbTmaQbmi4DMfmxiowR4VwQbxhCmvyCf92w1srQC3/taTcVzDQv+D7MQ5reU
	 3/KnGqSA//xikXWGiO2YX9LJtWXGfNwMo1QnaiM4JnjD+US8Dr0+yq0LMDMcpTcCGXI8R
	 7OehfCoz68JLaghvzuAEgXiFzG1UTTPSuEbf/JbRSLNWY/PWj+/mZ7Uv2yI6j5GdXZ3sr
	 viy+LPL46j7FXRCnCdoMv6UeCnodudNiwomFouywP+me3EZLru+Up66YHmkkyoLCTp5BO
	 enbkN35mQw23CenkyqaZWV6DPi660X+PHhz3qghLzsDZDZU9NmdxwxAbtq3+qf3lOYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792695396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XZ/amS4mzaM2HGomiZj/qSvCCV52gQUu/7cJw6R1VsA=;
	b=UJngiGE28inKl6l4Et6ef08uxdtN3YgaGpowZTe1j75upgnhvHKz/EdTFmSMcN8IEVKz
	 3awR0hm11rnbeM97wVzj4ZjJZ3qNji4a0P2dj3/moA21ok6xOtxtc25LOnn4k5ulE6w6f
	 atZ6yKMMxz0j7yGGra5NKB7IuB9aTuF6Zpz9YkSeiKaeQidSmJSixZJlAuwQtRPkftuFF
	 dY6HbbGTKdaplJENO5DISZffhyAzzdyXiYswg3PoyKRDSfh/bWZxKVJvhrDrdi7Mmklzh
	 zvsVYn2uEHHO/iUpC4KHhwP+ySkit3PQQRLErNHrTDBApTbeQgaW95bfiU+RD15tAzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=c3Prp0lh;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA59A606A31A
	for <platform-driver-x86@vger.kernel.org>; Thu, 22 Oct 2026 18:56:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA59A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=c3Prp0lh
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ace9e6e1a5so709219a91.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Oct 2026 11:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792695395; x=1793300195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XZ/amS4mzaM2HGomiZj/qSvCCV52gQUu/7cJw6R1VsA=;
        b=c3Prp0lhvRU4qfuNt/z6tVRlfEH2iLh78Al0meWmPdrJyHt4AAxRFCnNb/siRbMFcZ
         jyMRuznMsiZbGanzNOpEASOXm8ABddDP5walet8cbmlrfICo1FUGPKIVfmGXlCIKC/qe
         g72oNvQPbmFGpwLqVaZS2g2wAQ57+64p7yvJhdCYdvW/DM6io2NZkfMIt2QEGZNnz3DB
         FJZa0aPVI27WSKD86Eni0w7HuVhj3mUVQfxmZiwbHOZOIHfgrqwTj3c08BxaPla7MMYc
         ffyujG4/O977f55SIY1GY2Q305AEanINsiySrBNZoDQXkMlZlDlSu+h+YYS3nna/3O5A
         zCdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792695395; x=1793300195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XZ/amS4mzaM2HGomiZj/qSvCCV52gQUu/7cJw6R1VsA=;
        b=rKKkYiaFuKkYMpZhCeQ4no92b93Kai6iimcDQYrvxJqwsaxdnWweTJMf95v8b0ziwr
         V0MoGn01pmLkiXeQfQ/cYBk3ukO4S67giJ+BNHvEWRoP3dhpDpoyrFPlTIMH0bpd1hMs
         ZIbwLWpzP0TVnSyHHjnCpKsOSpJhzraRNlmxbb6+EgUFRCYT09xTLG4iFD0E2ZjNev/V
         1TU7GUmQgz7gmtILH8S99/G+gbUo4Wi3y2TwK9qjmOfK3Y4NTfKQZzo52ZLDJsOho8+8
         gyx4HdXJUYZLfe/Eh4LMPtCQnGUueVOQ7FDb/5CF8kF9F/xdzITJ/DhGYwgovQBNgY+h
         90GA==
X-Gm-Message-State: AFq9FYLIePjqfQMO/wL/NExSi98r4/L0iT2qbBM8Ve6x1aVkxMvXBDtk
	FcBLEiQ8QKb75D3qeJkRCGR/zvxgS6sJ5rIPzMqlfxVGwW66STQqAoi2
X-Gm-Gg: AYBFou0TQccvQjpd8ZpbopgLHcslv2D/lUBGzOldp/lq4n/+WoIJbDn0M/THVpMCWY6
	cP53cEGmoqAMgV/BrozibAv5gsCG0nSIIQ8soiZ11vhLw8SfU9S4zGEjdkK9CvlBhGc7fo5pGpd
	AR0eOIb/CPTLwNEL90WiXn4tqzTMqTT3pXop0l9bDfUa7tPMv9/SycWldM2F7OcXFap+0l5IEz9
	8JBDsYCuEPkejOp4+NdYvEpPfq3E0oPCDRp98iVQb2/87N6Qa3lungzcm+HtUL5VqdondYm2PDu
	aiFerrqKXU5P2IXgzZkru69eA8AQHnmLhYaTP7jG1hi/pZElFpr/jGJO7nXLKevQZTL1dSd4zOj
	xUFGKyKpUD6f1RcSS22VSS+W+czWlTzp7GxkZc6IHroZMHkKFD1UiHxNYPBwO6XhCLgD8yBGRsq
	U1dC+cX13d68pruiC0t/rYC3XAhQXihrnDnFxWjuilbHk1lpH6jFPjxYM30ZqezN1/OUJ97OcxI
	5o35yCiQjQNwSkrDQiHPHL0kRkHxujBi9tHpbZf5Zk1rzdSy6qge6ua
X-Received: by 2002:a17:90b:2802:b0:3ac:b3c7:de04 with SMTP id 98e67ed59e1d1-3ada6c9d389mr1997279a91.34.1792695395293;
        Thu, 22 Oct 2026 11:56:35 -0700 (PDT)
Received: from Lucy-Fedora ([103.182.96.89])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adca08e785sm176123a91.0.2026.10.22.11.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:56:34 -0700 (PDT)
From: Lucy Wong <lucywong2778@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Armin Wolf <W_Armin@gmx.de>,
	Lucy Wong <lucywong2778@gmail.com>
Subject: [PATCH v2] platform/x86: add Xiaomi WMI key driver
Date: Fri, 23 Oct 2026 02:56:19 +0800
Message-ID: <20261022185619.40188-1-lucywong2778@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260601151404.93049-1-lucywong2778@gmail.com>
References: <20260601151404.93049-1-lucywong2778@gmail.com>
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
    0x02: press/release keys (5 keys with abstract icons)
    0x03: firmware-handled toggles (touchpad, Fn lock)
  buffer[2] = keycode within that type

The keys with abstract icons are mapped to programmable macro keys for
userspace to bind. The touchpad and Fn lock toggles, as well as the
keyboard backlight level events, are handled by the firmware and are
ignored.

Link: https://lore.kernel.org/platform-driver-x86/20260601151404.93049-1-lucywong2778@gmail.com/
Signed-off-by: Lucy Wong <lucywong2778@gmail.com>
---
Changes in v2:
- Convert to .notify_new and set .min_event_size
- Ignore firmware-handled backlight and toggle events, which removes the
  toggle deduplication state
- Add the missing select INPUT_SPARSEKMAP
- Name the event codes and align the defines
- Add the dev_printk.h include
---
 MAINTAINERS                            |   6 ++
 drivers/platform/x86/Kconfig           |  12 +++
 drivers/platform/x86/Makefile          |   1 +
 drivers/platform/x86/xiaomi-wmi-keys.c | 123 +++++++++++++++++++++++++
 4 files changed, 142 insertions(+)
 create mode 100644 drivers/platform/x86/xiaomi-wmi-keys.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 839e39825455..7969b82c8315 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29124,6 +29124,12 @@ F:	fs/xfs/
 F:	include/uapi/linux/dqblk_xfs.h
 F:	include/uapi/linux/fsmap.h
 
+XIAOMI WMI KEYS DRIVER
+M:	Lucy Wong <lucywong2778@gmail.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/xiaomi-wmi-keys.c
+
 XILINX AMS DRIVER
 M:	Salih Erim <salih.erim@amd.com>
 M:	Conall O'Griofa <conall.ogriofa@amd.com>
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index b54b5212b204..1e7128f88adf 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -90,6 +90,18 @@ config XIAOMI_WMI
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
index 872ac3842391..d852bb0bf61b 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_HUAWEI_WMI)		+= huawei-wmi.o
 obj-$(CONFIG_MXM_WMI)			+= mxm-wmi.o
 obj-$(CONFIG_NVIDIA_WMI_EC_BACKLIGHT)	+= nvidia-wmi-ec-backlight.o
 obj-$(CONFIG_XIAOMI_WMI)		+= xiaomi-wmi.o
+obj-$(CONFIG_XIAOMI_WMI_KEYS)		+= xiaomi-wmi-keys.o
 obj-$(CONFIG_REDMI_WMI)			+= redmi-wmi.o
 obj-$(CONFIG_GIGABYTE_WMI)		+= gigabyte-wmi.o
 obj-$(CONFIG_BITLAND_MIFS_WMI)		+= bitland-mifs-wmi.o
diff --git a/drivers/platform/x86/xiaomi-wmi-keys.c b/drivers/platform/x86/xiaomi-wmi-keys.c
new file mode 100644
index 000000000000..a01ef01e501e
--- /dev/null
+++ b/drivers/platform/x86/xiaomi-wmi-keys.c
@@ -0,0 +1,123 @@
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
+#include <linux/wmi.h>
+
+#define XIAOMI_WMI_EVENT_GUID	"B74AF83F-8B2F-4069-ACAC-36D176F62FC0"
+
+#define XIAOMI_EVENT_TYPE_KEY	0x02
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
+	const struct xiaomi_wmi_keys_event *event = buffer->data;
+	struct xiaomi_wmi_keys *data = dev_get_drvdata(&wdev->dev);
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
+		dev_dbg(&wdev->dev, "ignoring key code 0x%02x\n", event->code);
+		return;
+	}
+
+	sparse_keymap_report_event(data->input_dev, code, pressed, false);
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


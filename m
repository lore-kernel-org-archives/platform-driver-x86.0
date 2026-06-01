Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0168C3DBD41
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jun 2026 15:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780327651; cv=none; b=rVixgZEYsztw6C7FpYuKpuWpJzmXr0x3ZgYZT0svDHLlmzQPvqnP3clucwGnKnEHBvdgaFfJvH1c9Y9Q6SEY5x4JeoUAou++eTlmGvBsaToMrlZypGaROnVjGY1LCCckdayJFouFucj7NmI+WXpRYziNRIieca7nn+Kc+jLYHiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780327651; c=relaxed/simple;
	bh=U0SyTby7Moc7yebh7ThNHBwxaPJMTf9rOkHyWJGwP+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ieJyBt2j9idywaeTu+fBGD8/hW5GpRKGQWs1yjkrvzwNCeUSwXVIJdEoSIfoadfmDlWzXMNe2UWelwX/u5OXo3vVGc0VBmaiFoMa6X8dy2558puuNNeTAWI8KVgioD4ogWgMRFyk8jpoSt4beUGjnEYArSwdJv0f7YFS1/WXZgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HAtj2Og4; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HAtj2Og4"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-137bd9ed2b1so1421694c88.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 01 Jun 2026 08:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780327642; x=1780932442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kKdA0q9b01o5FaZjt3XQSJrVum84R1EFltIn6392mwU=;
        b=HAtj2Og4kp2DW7+QelqrpWBmq6RmP5n/9+YudTeG9AaGevY4vJIKA51Tf7in33AGMx
         tRrYTAL6gmRqOW7ZLy4mMgK5y3RPcHjw3xzSYzDTBJlegDiw0Ep6UuS/F+LxxOArt4n9
         REMmC68IyctliRHda5zEVLB5Z5u33C5cOM631YYNKV1ORkFhToZZRbPUnhg2B0KNttMp
         haMej4MoFWioZrGTU2UpR9IiZt1MWOZ8p7yc+1hlBw0wYkp37qotuM513LyvTZlJ4c2X
         CsQue00nLyWeLTuXcNSBSITFuFau9SLvKlRktyjmeksDEAZ/ucR2rXaG4QDvNpcKlh/A
         Y0pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780327642; x=1780932442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kKdA0q9b01o5FaZjt3XQSJrVum84R1EFltIn6392mwU=;
        b=YaP9Z0PGEkLjbZ37DJ4y3ebxgHhh258uy60nVDQNjEOl46rfjRf30U0CbvV0smj+y7
         a5SKw8IUPB49lLxYU/nIyC2gHAtarw0nUcQ7gg4PWryvIqV727wijS07skLXKfXczXGS
         8/ShbspSxLOgjn7HY1juE1qloZyx+Mn/+UfpQVTUxFn4qWHmGyRH0IMQdOJHunWPH8p5
         jzz3GWQDvJrfH5X5Oui6h+J5NJsefsouYC0VC+0Dwa4yyTKLQXR50Sh0bnzjYXAuRXuw
         LkbndkfprLq/jrIuYctvR1eQfvjUkFe/lK99vUtUHCq1mP6XNyiDoOKFgUM1qa3YIRVb
         k1ow==
X-Gm-Message-State: AOJu0YyMDH1mJB4lm6NI6Wvc+irTyFmbuoh5iJAQmjEi5pcAMjzOkKzw
	dmc0RIvJU9lBxNBjhPQzD7IYjpV2d9MEZptjOsO7vdd6SGu8HWOPLaA//YIwSjkSW9sS/Rnu32p
	d8g==
X-Gm-Gg: Acq92OHjiDKm2DF/LioNeoFH6s38XavapYxRqe09TzaOfbtNgtuM4xrMBWYLLtjjq2O
	5JvjtR8ah0s2cQnY8i8/+QEKwEmeip1wVGG7uV0GGgXh00DqDIcKVvvCSnWbIs/EHqIyxNzV4rY
	BgfKgy7ViWk8T6KUrvdTS9vSuAT11VW/EnqvILld+re5LmYUJMHX7spuhLPh2CVNmjKtaJqVea7
	DF2sxdFTQ2qaqSor/lE2IJ8a6IG/h1g5wOqmTCKLN32BQS8oj58bxmq6zE4eeqHxwKqNrjRG51i
	u3g0gpx9QjC4C/eELrL7KJAPlAgEGsFYOjiLSHLVOAYEv4KJNATZfo/FYtVif8UAf3ZNXsf1WLe
	4tFgguowfAOzY/WxeYVG4jfm0F7L35+wS7Wt3P7H1ZOjdqiSXvTB/WuWWrWf9QYQHtyLdTCAOOC
	xha6mzEVfNs/v/DaVrrHgXhro1adUGVEGgrWkK
X-Received: by 2002:a05:7300:8607:b0:304:e2a5:689a with SMTP id 5a478bee46e88-304fa5a94a8mr5599914eec.21.1780327641670;
        Mon, 01 Jun 2026 08:27:21 -0700 (PDT)
Received: from Lucy-Fedora ([198.176.56.12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed53f002sm9399076eec.18.2026.06.01.08.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:27:21 -0700 (PDT)
From: Lucy Wong <lucywong2778@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lucy Wong <lucywong2778@gmail.com>
Subject: [PATCH 1/1] platform/x86: add Xiaomi WMI key driver
Date: Mon,  1 Jun 2026 23:27:03 +0800
Message-ID: <20260601152703.94539-2-lucywong2778@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601152703.94539-1-lucywong2778@gmail.com>
References: <20260601152703.94539-1-lucywong2778@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
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
userspace to bind. The touchpad and Fn lock keys are handled by the EC
and are reported for notification purposes only.

Signed-off-by: Lucy Wong <lucywong2778@gmail.com>
---
 MAINTAINERS                            |   6 ++
 drivers/platform/x86/Kconfig           |  11 ++
 drivers/platform/x86/Makefile          |   1 +
 drivers/platform/x86/xiaomi-wmi-keys.c | 139 +++++++++++++++++++++++++
 4 files changed, 157 insertions(+)
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
index b54b5212b204..541b0a255daa 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -90,6 +90,17 @@ config XIAOMI_WMI
 	  To compile this driver as a module, choose M here: the module will
 	  be called xiaomi-wmi.
 
+config XIAOMI_WMI_KEYS
+	tristate "Xiaomi WMI key events driver"
+	depends on ACPI_WMI
+	depends on INPUT
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
index 000000000000..524ede0e64eb
--- /dev/null
+++ b/drivers/platform/x86/xiaomi-wmi-keys.c
@@ -0,0 +1,139 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Xiaomi laptop WMI hotkey driver
+ *
+ * Copyright (C) 2026 Lucy Wong <lucywong2778@gmail.com>
+ */
+
+#include <linux/acpi.h>
+#include <linux/device.h>
+#include <linux/input.h>
+#include <linux/input/sparse-keymap.h>
+#include <linux/jiffies.h>
+#include <linux/module.h>
+#include <linux/wmi.h>
+
+#define XIAOMI_WMI_EVENT_GUID "B74AF83F-8B2F-4069-ACAC-36D176F62FC0"
+
+#define XIAOMI_TYPE_BACKLIGHT 0x01 /* keyboard backlight level (EC handled) */
+#define XIAOMI_TYPE_KEY  0x02 /* press/release keys */
+#define XIAOMI_TYPE_TOGGLE 0x03 /* firmware toggle keys (notify only) */
+
+#define XIAOMI_KEY_PRESS_MIN 0x01
+#define XIAOMI_KEY_PRESS_MAX 0x05
+#define XIAOMI_KEY_RELEASE_OFF 0x05
+
+#define XIAOMI_TOGGLE_DEDUP_MS 50
+
+struct xiaomi_wmi {
+	struct input_dev *input_dev;
+	unsigned long last_toggle;
+	u8 last_toggle_code;
+};
+
+static const struct key_entry xiaomi_wmi_keymap[] = {
+	/* type 0x02: programmable keys with abstract icons */
+	{ KE_KEY, 0x0201, { KEY_MACRO1 } },
+	{ KE_KEY, 0x0202, { KEY_MACRO2 } },
+	{ KE_KEY, 0x0203, { KEY_MACRO3 } },
+	{ KE_KEY, 0x0204, { KEY_MACRO4 } },
+	{ KE_KEY, 0x0205, { KEY_MACRO5 } },
+	/* type 0x03: firmware-handled toggles, reported for OSD only */
+	{ KE_KEY, 0x0300, { KEY_F21 } }, /* touchpad toggle */
+	{ KE_KEY, 0x0301, { KEY_FN_ESC } }, /* Fn lock */
+	{ KE_END, 0 },
+};
+
+static int xiaomi_wmi_probe(struct wmi_device *wdev, const void *context)
+{
+	struct xiaomi_wmi *data;
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
+	ret = sparse_keymap_setup(data->input_dev, xiaomi_wmi_keymap, NULL);
+	if (ret)
+		return ret;
+
+	return input_register_device(data->input_dev);
+}
+
+static void xiaomi_wmi_notify(struct wmi_device *wdev, union acpi_object *obj)
+{
+	struct xiaomi_wmi *data = dev_get_drvdata(&wdev->dev);
+	u8 type, code;
+
+	if (obj->type != ACPI_TYPE_BUFFER || obj->buffer.length < 3)
+		return;
+
+	type = obj->buffer.pointer[1];
+	code = obj->buffer.pointer[2];
+
+	switch (type) {
+	case XIAOMI_TYPE_KEY:
+		if (code >= XIAOMI_KEY_PRESS_MIN &&
+		    code <= XIAOMI_KEY_PRESS_MAX) {
+			sparse_keymap_report_event(data->input_dev,
+						   0x0200 | code, 1, false);
+		} else if (code > XIAOMI_KEY_PRESS_MAX &&
+						code <= XIAOMI_KEY_PRESS_MAX +
+							XIAOMI_KEY_RELEASE_OFF) {
+			code -= XIAOMI_KEY_RELEASE_OFF;
+			sparse_keymap_report_event(data->input_dev,
+						   0x0200 | code, 0, false);
+		}
+		break;
+
+	case XIAOMI_TYPE_TOGGLE:
+		/* deduplicate: each press emits two identical events */
+		if (data->last_toggle_code == code &&
+		    time_before(jiffies, data->last_toggle +
+				msecs_to_jiffies(XIAOMI_TOGGLE_DEDUP_MS)))
+			return;
+		data->last_toggle_code = code;
+		data->last_toggle = jiffies;
+		sparse_keymap_report_event(data->input_dev,
+					   0x0300 | code, 1, true);
+		break;
+
+	case XIAOMI_TYPE_BACKLIGHT:
+		/* keyboard backlight handled by EC, nothing to do */
+		break;
+
+	default:
+		dev_dbg(&wdev->dev, "unknown event type 0x%02x\n", type);
+		break;
+	}
+}
+
+static const struct wmi_device_id xiaomi_wmi_id_table[] = {
+	{ .guid_string = XIAOMI_WMI_EVENT_GUID },
+	{ }
+};
+MODULE_DEVICE_TABLE(wmi, xiaomi_wmi_id_table);
+
+static struct wmi_driver xiaomi_wmi_driver = {
+	.driver = {
+		.name = "xiaomi-wmi-keys",
+	},
+	.id_table = xiaomi_wmi_id_table,
+	.probe = xiaomi_wmi_probe,
+	.notify = xiaomi_wmi_notify,
+	.no_singleton = true,
+};
+module_wmi_driver(xiaomi_wmi_driver);
+
+MODULE_AUTHOR("Lucy Wong <lucywong2778@gmail.com>");
+MODULE_DESCRIPTION("Xiaomi laptop WMI hotkey driver");
+MODULE_LICENSE("GPL");
-- 
2.54.0


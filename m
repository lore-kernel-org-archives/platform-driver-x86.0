Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F63D3D9DAD
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jun 2026 15:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780326864; cv=none; b=aeOLQ/xE98ss0QuECjV/u749CSJ1lHYk1vSIM4DhxnutZmJVD2P96f7r+8/r9AgLXAkN6cYExRrrGMopDVqeAPffqnp5TwBMLTjhg8+CAdK6dFAynUTAsBBMIxYYLkRp0chbtTQuKzQjLfWQCLGRzMwet2UiiuClZcYxhfCM5Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780326864; c=relaxed/simple;
	bh=U0SyTby7Moc7yebh7ThNHBwxaPJMTf9rOkHyWJGwP+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FtuBPBG6k8D0AEFQ75JsUlJNFi2WvYzHQnV8vfRUWXN+Kxg0solQCcNKp49RAVkI7JljAm/1tVkpllhKq+e1F6VqE6nHtkxjZXpTkpC5Tb+jatyeD3Vesh4xWCmNTVz+wB3WpqR1eFru4vBgY+Gjqx401XOV0OvITxSo6UMhXCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sEEZLL9y; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sEEZLL9y"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-306f36df4feso883563eec.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 01 Jun 2026 08:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780326862; x=1780931662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kKdA0q9b01o5FaZjt3XQSJrVum84R1EFltIn6392mwU=;
        b=sEEZLL9ypUaqWjojh3MPB4gbwdFAeAhFjO7CWCxXqLIcUgDzvHjbwcyK0xGbF4rJkZ
         J4jfiRJkcwFgjWlVSlrbh7ZcoLvFcpbT9RyUfu/JadB7VIhCLGBmspKGZWdIgiSMqQ7Q
         6tgNauvWbuDPN6YIzq52KZF52lJq9lejx7xTtHTLtCl/uEXs/h40csTEUNZ5/racxp2o
         482Tzh/np14AzriWpXqWMruJWRaKMaYpzasVP8jKvko1Fr7sDR0+U2/JYMfKawLJZ/Vu
         Kx2dsFekgSpMsLV+EAy+zpmXQkBWXoVt8BEm7pG+B76V71mt9RCbTe4J2FQYZSxzVLQY
         NlCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780326862; x=1780931662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kKdA0q9b01o5FaZjt3XQSJrVum84R1EFltIn6392mwU=;
        b=dUcimHBBhIDXQOfKzFku0w+TGTUwA8M8T2GdJLh/zN5Kbc7YFVPKvue96LjHCgA657
         0hVf2aUrXbuJ75B289Cro2JRhYsKOl73NOSTbNuivWlzKRI5mOGsPRyfWINKK9LiFcOK
         ornP4juCI4LAzoxyFtkl1MlSAPDQV80hs6Uv+RMGfoHvw/vR1K3h+HAbwF4MDNXdiFLw
         yCChdDZC7fryBzgqV/0BcZFkPcv/QysCTCJHtPdlJIIWw9fImG/lXAeuMECBB3i5DlBs
         5NWcIFxHE7+doQK7YJvEN6IJgL0pgHM1dL5tmXJPzIsaRpyEcAWBCiYA75sBgVhMVUoh
         9GDA==
X-Gm-Message-State: AOJu0YzyFPKbXONsg+k4BFbJOYR4UZA2FUIYUxn/ahRgge6IeH5gKBHX
	d0Qucb1DbHpJ6qLcD4SXzwFck86erXtQFi1I+EcotRm+eUoBC1fMJRtbZf/V0DIvRWN+lhQHSAP
	UYQ==
X-Gm-Gg: Acq92OH6yR3JWi+oE3BOd8r/D0yDL4eIF1M48xLr4KzAjRDLRZnO3SiOEgq/S3ORsmk
	nPPlVwgGNO4llCeCaMKy6pWNHqAUzMo3W1EmdPTnp/UGo/FhP4iBfTFDR8tFTnFg6GrzYiiW+IK
	r7GFwMhZaDhe1K6mxjnofE7F8EdSFiIbqYeUn4o2ICvxMsEzaTbHoDQGPkfB319Pm58yf/LPmMM
	tiMS/3wF0uFm0iEjwfRgaj1Zfzql25Bm2BMvBdcQWmAQww5cfGfnSaYNv2R19nbpOTK25G9BCjn
	7/Lyq/P3cUmSMhzKcY3+HcykyyrFh/s3YzmN+X4WZcOgDrxSTCn/CWQMwF4cmaDzbubYmF9vmIR
	xoERvPErg9oLUh3FqNZYNsRU7i8FMdAk7GptTJrmO9LByzDBUAdl9rapdwrWeVdeWydEnAxetYG
	WnEQX+AGAkyMWSWozpG74G48whSdURBljoPzL2
X-Received: by 2002:a05:7300:6426:b0:304:c9f1:a0e9 with SMTP id 5a478bee46e88-304eb115e9amr6707245eec.9.1780326862031;
        Mon, 01 Jun 2026 08:14:22 -0700 (PDT)
Received: from Lucy-Fedora ([198.176.56.12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed53d14fsm9116383eec.17.2026.06.01.08.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:14:21 -0700 (PDT)
From: Lucy Wong <lucywong2778@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lucy Wong <lucywong2778@gmail.com>
Subject: [PATCH 1/1] platform/x86: add Xiaomi WMI key driver
Date: Mon,  1 Jun 2026 23:14:04 +0800
Message-ID: <20260601151404.93049-2-lucywong2778@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601151404.93049-1-lucywong2778@gmail.com>
References: <20260601151404.93049-1-lucywong2778@gmail.com>
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


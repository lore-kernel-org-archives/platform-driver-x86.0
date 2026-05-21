Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B54C312832
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2026 14:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779374444; cv=none; b=NWdIlVjF+aB3r9SdHj+qYVFE78QpquPXI8PfCSTlEQdfRXkmUex0ZKOTDNgcGT5WLPjQZGqh0+Mw3Io8UVanmtLHVrAHsekH0F+D69cAUgcf1QLlJhXomWelOJsnY7lSwyheD/0FF/s15mw36uF4e7PV9WLtfy89GsvaDVYbnCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779374444; c=relaxed/simple;
	bh=TccoClsjvq3a1Z08EibgTMh05lXsbOOIKq+hMR6g128=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LbYlVAsMqbukdKSjzjKD0cFmj3TZF1f/WNwBzKlAEo1ury2yPQS1CyjjhwoQDBxnavjw+xAy1JMEaK81ufth4joK4lVf8EzJCWMzKY2g64kK30r1cpbXwfprMrGu4E8qQCuj6KP99Ogs812J3ghh15GGrO2l3rsid/1Avt5uHp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lBJMkTLb; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lBJMkTLb"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-90fc979d84cso410750685a.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2026 07:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779374441; x=1779979241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9mToUEMWhEityxSZzhgL4DxHeFYbKLW+yzmtB66brHo=;
        b=lBJMkTLbjDXP5zbpJxV9smGn6wqsKfX/tgwQQ42EUIIJD/xKZdsha0G8z6CYJ8M6ee
         2GU4R4OpXqw1jai7dImtC3qZ/dNDf/Dcj8HSNURUp4YdasAJqx0dmg3UX8a5GZdfLwt1
         /kkQkWfxYoPYy+6x5JZXQW+wRxr4xZPSwj4NErKnEMPI6am+Me/h5zDcTwI+EnIEGHnf
         sls7bvOmwYgUb7qBOoHYf15sHC6Sl3n9tteXnxDA9kLFgv3RGI9PL1hpXaR2E/od+Vdf
         0XNsM+JHkWcFfuoh3QcpwcAbjDJbA6DIqKmMZn9KqC5rRhQbUoqPxRcrEt+Q7nd9U0SD
         D7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779374441; x=1779979241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9mToUEMWhEityxSZzhgL4DxHeFYbKLW+yzmtB66brHo=;
        b=iwsir5bDnbGuyC3dOJyT/hwIKxikzAbeAcVvsv9FCWZIj0j5r2A0vjeHL4NCqQbofK
         XWb7Ml6T5JVV9b2ac4GAOMCeHbeEI2Ft4rh/Q9UbCj5twLdV447CkK2vpOZJEmHm0lc5
         1okjz2B0z+6W+nRXb36yNHeR4OW49MMNjQhOz2GsJq2XicEYfx2HijMqji68y0Hhwh8U
         dhLmex7s2Phc6okz0Dn8UciyA4zSNQNfqdkVwkswUbIgGW0zsDpHWHaYORHngB9F5hJr
         Qkzu+biu9cZN2pJcj6evZ/NcMS93VUpeKGDXwoadInu7zlbuIGKko6def4py5lEi9Gsb
         62/A==
X-Gm-Message-State: AOJu0Yz5SGpRvZESegsV84bgzcinumO+pggBs6bh1IjPGUV96il3rG+E
	R5ugQYMFqAKagP1JFcZQiuIRJTAds+/cSLJ7t5/HpVakOpcqtKHn6H0EyV8JLfsc
X-Gm-Gg: Acq92OETMHEKKvorjpGEDGd8pyRC8i6kV4uIpT9zTdDuDKY7m3lpysM3ZjCbTkMZCcV
	hlAtmNlnOs8T9FIZytHjgHIHyK3TIaaIngcavBEJrLJcLwTKH8hu85kpDopbt+BdODU7gN2w2Up
	D+01XavYUfMr+Lo+aGRxv9/AgEWD6WBXA+B9AKjLyd4MF5wu3u39NeCzJa/a6d4+UjGSNwirvgd
	h8YS7Z1wwZH2C5gtcHweys2gEvXZ+y9ClDBy16guyuXu5eBir753OxUQioq1ZLh4hw16q52ruiN
	e5jN8MFjw+IgtteiLJ+22b2oEe/XOwBE0IZe+tR3OXeuRNu0sNB9wB6vS6i+jpwAM7sESVAySo0
	d7Enh+RUneAeXjV0qNwmoQmhe87zo7/WshhIfDh2JhwxXixwW+gSqElARXnAMfzkesvpLmQV9qo
	j2n4NZIc1mMVdZaAZt9wFh
X-Received: by 2002:a05:6214:f0a:b0:8cc:3546:262f with SMTP id 6a1803df08f44-8cc6e3718a7mr47787406d6.26.1779374440981;
        Thu, 21 May 2026 07:40:40 -0700 (PDT)
Received: from fedora ([2600:382:9e2f:545e:1025:cba1:a424:4218])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cc781b37a8sm6387266d6.24.2026.05.21.07.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 07:40:40 -0700 (PDT)
From: Dave Carey <carvsdriver@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	carvsdriver@gmail.com
Subject: [PATCH v4] platform/x86/lenovo: Add Yoga Book 9 keyboard dock detection driver
Date: Thu, 21 May 2026 10:40:34 -0400
Message-ID: <20260521144034.282419-1-carvsdriver@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260519000239.29446-1-carvsdriver@gmail.com>
References: <20260519000239.29446-1-carvsdriver@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Book 9 14IAH10 ships with a detachable Bluetooth keyboard
that magnetically attaches to the bottom (secondary) screen in one of two
positions.  The Embedded Controller tracks the attachment state in a 2-bit
field called BKBD and signals changes via WMI event GUID
806BD2A2-177B-481D-BFB5-3BA0BB4A2285 (notify ID 0xEB on the WM10 ACPI
device).

The current BKBD state is read via WMI query GUID
E7F300FA-21CD-4003-ADAC-2696135982E6 (WQAF method), which returns an
8-byte buffer: bytes [0..3] hold the LFID constant 0x00060000 and bytes
[4..7] hold the BKBD value.

BKBD encoding:
  0 = keyboard detached
  1 = keyboard docked on top half of bottom screen
  2 = keyboard docked on bottom half of bottom screen
  3 = reserved (not observed in practice)

This driver:
  - Registers as a WMI driver on the event GUID.
  - Queries BKBD state on probe and on each WMI notification.
  - Reports SW_TABLET_MODE=1 when detached, SW_TABLET_MODE=0 when docked
    in either position (a physical keyboard is present in both cases).
  - Exposes the raw BKBD value via a read-only sysfs attribute
    "keyboard_position" for use by userspace (e.g. to distinguish between
    the two docked positions for different UI layouts).

Tested on: Lenovo Yoga Book 9 14IAH10 (model 83KJ), kernel 6.19.

Signed-off-by: Dave Carey <carvsdriver@gmail.com>
---
 .../testing/sysfs-driver-lenovo-yb9-kbdock    |  21 ++
 MAINTAINERS                                   |   7 +
 drivers/platform/x86/lenovo/Kconfig           |  14 ++
 drivers/platform/x86/lenovo/Makefile          |   1 +
 drivers/platform/x86/lenovo/yb9-kbdock.c      | 216 ++++++++++++++++++
 5 files changed, 259 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
 create mode 100644 drivers/platform/x86/lenovo/yb9-kbdock.c

diff --git a/Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock b/Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
new file mode 100644
index 0000000..bb57690
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
@@ -0,0 +1,21 @@
+What:		/sys/bus/wmi/drivers/lenovo-yb9-kbdock/<guid>/keyboard_position
+Date:		April 2026
+KernelVersion:	6.10
+Contact:	Dave Carey <carvsdriver@gmail.com>
+Description:
+		Read-only attribute reporting the current keyboard dock position
+		as reported by the Embedded Controller on the Lenovo Yoga Book 9
+		14IAH10.
+
+		Possible values:
+
+		==  ============================================================
+		0   detached  — keyboard is not docked to any screen
+		1   top-half  — keyboard docked on the top half of the bottom screen
+		2   bottom-half — keyboard docked on the bottom half of the bottom screen
+		==  ============================================================
+
+		The value is formatted as "<n> (<name>)\n", e.g. "1 (top-half)\n".
+
+		SW_TABLET_MODE input events are also emitted: 0 when the keyboard
+		is docked (either position), 1 when detached.
diff --git a/MAINTAINERS b/MAINTAINERS
index d1cc0e1..00e8275 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14479,6 +14479,13 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/lenovo/wmi-hotkey-utilities.c
 
+LENOVO YOGA BOOK 9 KEYBOARD DOCK DRIVER
+M:	Dave Carey <carvsdriver@gmail.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
+F:	drivers/platform/x86/lenovo/yb9-kbdock.c
+
 LETSKETCH HID TABLET DRIVER
 M:	Hans de Goede <hansg@kernel.org>
 L:	linux-input@vger.kernel.org
diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/lenovo/Kconfig
index 9c48487..938b361 100644
--- a/drivers/platform/x86/lenovo/Kconfig
+++ b/drivers/platform/x86/lenovo/Kconfig
@@ -43,6 +43,20 @@ config LENOVO_WMI_CAMERA
 	  To compile this driver as a module, choose M here: the module
 	  will be called lenovo-wmi-camera.
 
+config LENOVO_YB9_KBDOCK
+	tristate "Lenovo Yoga Book 9 keyboard dock detection"
+	depends on ACPI_WMI
+	depends on DMI
+	depends on INPUT
+	help
+	  Say Y here to enable keyboard dock detection on the Lenovo Yoga Book 9
+	  14IAH10.  The detachable Bluetooth keyboard magnetically attaches to
+	  either screen; this driver reports SW_TABLET_MODE input events based
+	  on the attachment state and exposes the raw position in sysfs.
+
+	  To compile this driver as a module, choose M here: the module will be
+	  called lenovo-yb9-kbdock.
+
 config LENOVO_YMC
 	tristate "Lenovo Yoga Tablet Mode Control"
 	depends on ACPI_WMI
diff --git a/drivers/platform/x86/lenovo/Makefile b/drivers/platform/x86/lenovo/Makefile
index 7b2128e..2842d7d 100644
--- a/drivers/platform/x86/lenovo/Makefile
+++ b/drivers/platform/x86/lenovo/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi.o
 obj-$(CONFIG_THINKPAD_ACPI)	+= thinkpad_acpi.o
 
 lenovo-target-$(CONFIG_LENOVO_WMI_HOTKEY_UTILITIES)	+= wmi-hotkey-utilities.o
+lenovo-target-$(CONFIG_LENOVO_YB9_KBDOCK)	+= yb9-kbdock.o
 lenovo-target-$(CONFIG_LENOVO_YMC)	+= ymc.o
 lenovo-target-$(CONFIG_YOGABOOK)	+= yogabook.o
 lenovo-target-$(CONFIG_YT2_1380)	+= yoga-tab2-pro-1380-fastcharger.o
diff --git a/drivers/platform/x86/lenovo/yb9-kbdock.c b/drivers/platform/x86/lenovo/yb9-kbdock.c
new file mode 100644
index 0000000..693e287
--- /dev/null
+++ b/drivers/platform/x86/lenovo/yb9-kbdock.c
@@ -0,0 +1,216 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Lenovo Yoga Book 9 keyboard-dock detection
+ *
+ * The Yoga Book 9 ships with a detachable Bluetooth keyboard that magnetically
+ * attaches to the bottom screen in one of two positions.  The EC tracks
+ * attachment state in a 2-bit field called BKBD and signals changes via WMI
+ * event 0xEB on the WM10 ACPI device.
+ *
+ * BKBD values:
+ *   0 = keyboard detached
+ *   1 = keyboard docked on the top half of the bottom screen
+ *   2 = keyboard docked on the bottom half of the bottom screen
+ *   3 = reserved / not observed
+ *
+ * This driver registers for the WMI event GUID, queries BKBD on probe and on
+ * each event, reports SW_TABLET_MODE=0 when the keyboard is docked (either
+ * position) and SW_TABLET_MODE=1 when detached, and exposes the raw BKBD
+ * value in sysfs as "keyboard_position".
+ *
+ * Copyright (C) 2026 Dave Carey <carvsdriver@gmail.com>
+ */
+
+#include <linux/acpi.h>
+#include <linux/dmi.h>
+#include <linux/input.h>
+#include <linux/module.h>
+#include <linux/wmi.h>
+
+/*
+ * WM10 ACPI device (_UID "GMZN"):
+ *   Event GUID — notify ID 0xEB fires on keyboard attachment change.
+ *   Query GUID — object "AF", maps to WQAF(); returns 8-byte buffer
+ *                {LFID=0x00060000, BKBD[31:0]}.
+ */
+#define YB9_KBDOCK_EVENT_GUID	"806BD2A2-177B-481D-BFB5-3BA0BB4A2285"
+#define YB9_KBDOCK_QUERY_GUID	"E7F300FA-21CD-4003-ADAC-2696135982E6"
+
+#define YB9_KBDOCK_QUERY_INSTANCE	0
+
+/* BKBD encoding — keyboard always docks on the bottom screen */
+#define BKBD_DETACHED		0
+#define BKBD_TOP_HALF		1	/* docked on top half of bottom screen */
+#define BKBD_BOTTOM_HALF	2	/* docked on bottom half of bottom screen */
+
+static const struct dmi_system_id yb9_kbdock_dmi_table[] = {
+	{
+		/* Lenovo Yoga Book 9 14IAH10 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR,   "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83KJ"),
+		},
+	},
+	{ }
+};
+
+struct yb9_kbdock_priv {
+	struct input_dev *input_dev;
+	unsigned int bkbd;	/* last read BKBD value (0-3) */
+};
+
+/* Read current BKBD state via WQAF.  Returns 0-3 or -errno. */
+static int yb9_kbdock_query(struct wmi_device *wdev)
+{
+	struct acpi_buffer out = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *obj;
+	acpi_status status;
+	u32 bkbd;
+
+	status = wmi_query_block(YB9_KBDOCK_QUERY_GUID,
+				 YB9_KBDOCK_QUERY_INSTANCE, &out);
+	if (ACPI_FAILURE(status)) {
+		dev_warn(&wdev->dev, "WQAF query failed: %s\n",
+			 acpi_format_exception(status));
+		return -EIO;
+	}
+
+	obj = out.pointer;
+	if (!obj) {
+		dev_warn(&wdev->dev, "WQAF returned NULL\n");
+		return -EIO;
+	}
+
+	/*
+	 * WQAF returns an 8-byte buffer: bytes [0..3] = LFID (0x00060000),
+	 * bytes [4..7] = BKBD value.  Guard against short buffers.
+	 */
+	if (obj->type == ACPI_TYPE_BUFFER && obj->buffer.length >= 8) {
+		memcpy(&bkbd, obj->buffer.pointer + 4, sizeof(bkbd));
+		bkbd &= 0x3;
+	} else if (obj->type == ACPI_TYPE_INTEGER) {
+		bkbd = obj->integer.value & 0x3;
+	} else {
+		dev_warn(&wdev->dev,
+			 "WQAF: unexpected result type %d len %u\n",
+			 obj->type,
+			 obj->type == ACPI_TYPE_BUFFER
+				? obj->buffer.length : 0);
+		kfree(obj);
+		return -EIO;
+	}
+
+	kfree(obj);
+	return (int)bkbd;
+}
+
+static void yb9_kbdock_update(struct wmi_device *wdev)
+{
+	struct yb9_kbdock_priv *priv = dev_get_drvdata(&wdev->dev);
+	int bkbd;
+	int tablet_mode;
+
+	bkbd = yb9_kbdock_query(wdev);
+	if (bkbd < 0)
+		return;
+
+	priv->bkbd = bkbd;
+
+	/*
+	 * Report tablet mode only when the keyboard is fully detached.
+	 * Both docked positions (top-half and bottom-half of the bottom screen)
+	 * indicate a physical keyboard is present — report laptop mode.
+	 */
+	tablet_mode = (bkbd == BKBD_DETACHED) ? 1 : 0;
+
+	input_report_switch(priv->input_dev, SW_TABLET_MODE, tablet_mode);
+	input_sync(priv->input_dev);
+
+	dev_dbg(&wdev->dev, "BKBD=%u tablet_mode=%d\n", bkbd, tablet_mode);
+}
+
+static void yb9_kbdock_notify(struct wmi_device *wdev, union acpi_object *data)
+{
+	yb9_kbdock_update(wdev);
+}
+
+/* sysfs: keyboard_position — exposes raw BKBD value */
+static ssize_t keyboard_position_show(struct device *dev,
+				      struct device_attribute *attr, char *buf)
+{
+	struct yb9_kbdock_priv *priv = dev_get_drvdata(dev);
+	static const char * const names[] = {
+		"detached", "top-half", "bottom-half", "unknown"
+	};
+	unsigned int bkbd = priv->bkbd;
+
+	if (bkbd > 3)
+		bkbd = 3;
+	return sysfs_emit(buf, "%u (%s)\n", bkbd, names[bkbd]);
+}
+static DEVICE_ATTR_RO(keyboard_position);
+
+static struct attribute *yb9_kbdock_attrs[] = {
+	&dev_attr_keyboard_position.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(yb9_kbdock);
+
+static int yb9_kbdock_probe(struct wmi_device *wdev, const void *ctx)
+{
+	struct yb9_kbdock_priv *priv;
+	struct input_dev *input_dev;
+	int err;
+
+	if (!dmi_check_system(yb9_kbdock_dmi_table)) {
+		dev_dbg(&wdev->dev, "not a Yoga Book 9, skipping\n");
+		return -ENODEV;
+	}
+
+	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	input_dev = devm_input_allocate_device(&wdev->dev);
+	if (!input_dev)
+		return -ENOMEM;
+
+	input_dev->name = "Lenovo Yoga Book 9 keyboard dock switch";
+	input_dev->phys = YB9_KBDOCK_EVENT_GUID "/input0";
+	input_dev->id.bustype = BUS_HOST;
+	input_set_capability(input_dev, EV_SW, SW_TABLET_MODE);
+
+	err = input_register_device(input_dev);
+	if (err) {
+		dev_err(&wdev->dev, "failed to register input device: %d\n", err);
+		return err;
+	}
+
+	priv->input_dev = input_dev;
+	dev_set_drvdata(&wdev->dev, priv);
+
+	/* Report initial state */
+	yb9_kbdock_update(wdev);
+	return 0;
+}
+
+static const struct wmi_device_id yb9_kbdock_wmi_id_table[] = {
+	{ .guid_string = YB9_KBDOCK_EVENT_GUID },
+	{ }
+};
+MODULE_DEVICE_TABLE(wmi, yb9_kbdock_wmi_id_table);
+
+static struct wmi_driver yb9_kbdock_driver = {
+	.driver = {
+		.name = "lenovo-yb9-kbdock",
+		.dev_groups = yb9_kbdock_groups,
+	},
+	.id_table = yb9_kbdock_wmi_id_table,
+	.probe    = yb9_kbdock_probe,
+	.notify   = yb9_kbdock_notify,
+};
+module_wmi_driver(yb9_kbdock_driver);
+
+MODULE_AUTHOR("Dave Carey <carvsdriver@gmail.com>");
+MODULE_DESCRIPTION("Lenovo Yoga Book 9 keyboard dock detection");
+MODULE_LICENSE("GPL");
-- 
2.54.0


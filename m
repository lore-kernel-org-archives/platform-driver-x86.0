Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05D436495F
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Apr 2026 13:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777123421; cv=none; b=A7oQgoLGRNZhSLdzhcxXOIWUO6HiMA2D9dE3NlhqQCvccWu0O/ELEKQ3SuZLMtloP9eDPmsT7N66x0yHklns1UY8D0WzQFRKF/YByd0E3q6VE92VQe0CtjffcJmlQI5EqSR43M+wkd+lf86eAgj4NE/ikVx7JPwa9UN6jAKlxC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777123421; c=relaxed/simple;
	bh=lm9LEQzjNKXZ7VbvV4yqQxT7Gx+XVBe9dRrJyFKxfWA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LvkYdrZ4mSKtcMeXns91C9og8z4vgA8N4JA+qhQzCV1+3gYBXnOWZcee1ZIGH7V0UnCzm8KgeolJxjBa3wBkHmP2bjdPYURyqAms13GR6aS8lxw8fBB3NIpSDZXvurI6DbTdbCkKMBUbXOU5Kc8snCCZ0++wLRUC/ei9lfrlFXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OrzsEX0w; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OrzsEX0w"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8aca0469204so82620116d6.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 25 Apr 2026 06:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777123419; x=1777728219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qGsrapfS3zWNRuCdyB3c2sy3qydg/qL6bjr8MaMgkrg=;
        b=OrzsEX0wV35zh6IwODGTxLsCrnbGcboW4zGSw5BTF9KPY9xmmP1pU7zyXCeotyK9EQ
         W0FFJOthI0ita19ZLMzDVs81pUF69BZ9jPY1GB7znN9a45qhXWIMgn1CTJvu7RFPTbKG
         7JcrRMCvgSgn2gu5wDqqTx270BtIYd02YVhD6NxkIG8MQmTHVgpIfHL0lRfJOirjHSK5
         O0A0pddLHlSKD1jDug8fXJhWSjp9Pf56wRXVak92B2DQJBjboKv4a0Vl9ul39EUSG8hy
         esRZZG6RtLQG2V4MIhbsETQUgMrrHeCK1DAgaFl9ZhaW03NDYMCU4u0PbWAVOoEuUGp/
         YJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777123419; x=1777728219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGsrapfS3zWNRuCdyB3c2sy3qydg/qL6bjr8MaMgkrg=;
        b=FFL6g0D83U0onrzeRqyvEVtOZ94Jj+72xWg9Itlv5ta2dpf+f7WcULt5/wZEm9sk/e
         kQvbRNsKJTtJlavdbfLaF857RTL5GXsEve0owrBhk/b6e8AC7SgnWpHY9S190nAQGvH8
         B1gFEw3dMUcAB4eD4mV+gxVwL9gSZHDLK99khYeR7VS0gmx69QIho5JmGgyoux+s+wS2
         GifrSe7XiIs0HmjajRJ9sdqXjS1R3x1kq4XxN4hd+w3u0RP3qmzM7LgClWFKm1iwn6Cy
         /qI1kLQyLo1l6km7otjVdsEbJZ6zh/K9EeiBgi9eV3xC5aR2G5wtqbbkak2g56A4gGMz
         v1WA==
X-Gm-Message-State: AOJu0Yz+TmusXpRUtEGZKf2yzmGzqH1oiXm/NZNaI8sSP1ZCUsJcURsa
	R7wp+U0m1AGBAailqIBGuoRxLRJ2/iIVi9Tc7aJTSBdnuAVYq1cFrvWYJiM2jOEO
X-Gm-Gg: AeBDieuMSkTCBGzDvm26LpC5lcS+VV2+PHASycJblvXc93mrKUKXq3n+X3IkZui4kpK
	xaWzOpUaz9jnzLna6OmqaU0JZIH5QYh3tQHxeFZEr7AsvPgMZci+dVjp2DAzfTp/EH22LpuceD/
	ozqdyfm1LRpUilwuwYA6zIwXPwV8cnR/PVm09NpQDHKpOvef/PBiJsumMzvLPYTxlwj00cbqzva
	JKix/+EdTNfwDlfmZ5aw37h/A4/6EKMnkJ5uqfgGCmWGlbS2CEihrHTs64bep12PjlSYczQBEGt
	18gRPJw2Iz3GZDP+k9uDQJ8ltUUEEgNf2GiMlvDwTl0qYfl0MXWDSFOagTIdl26AydASh/1FK4m
	e2wQwGjvRfgcXBMSmuKt4uNsFNLY2XAOSsmXGEE7h0Wn+WWP/i4y638ehCOWtiG1ER4W6yAdcAs
	ZMWtc0CV8Ly4tFeg5w/qbDPwnehh/1wzXoenfevDcfsgSln2786qale65Gqej3cyEfQtYPB8wrg
	1lvMxA=
X-Received: by 2002:ad4:5c65:0:b0:8ac:800f:10da with SMTP id 6a1803df08f44-8b027fd15e3mr584306926d6.4.1777123418502;
        Sat, 25 Apr 2026 06:23:38 -0700 (PDT)
Received: from fedora (pool-100-11-178-145.phlapa.fios.verizon.net. [100.11.178.145])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ae97d89sm215596236d6.42.2026.04.25.06.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 06:23:38 -0700 (PDT)
From: Dave Carey <carvsdriver@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Dave Carey <carvsdriver@gmail.com>
Subject: [PATCH] platform/x86/lenovo: Add Yoga Book 9 keyboard dock detection driver
Date: Sat, 25 Apr 2026 09:23:18 -0400
Message-ID: <20260425132323.82809-1-carvsdriver@gmail.com>
X-Mailer: git-send-email 2.53.0
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
 MAINTAINERS                                   |   6 +
 drivers/platform/x86/lenovo/Kconfig           |  14 ++
 drivers/platform/x86/lenovo/Makefile          |   1 +
 drivers/platform/x86/lenovo/yb9-kbdock.c      | 216 ++++++++++++++++++
 5 files changed, 258 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
 create mode 100644 MAINTAINERS
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
new file mode 100644
index 0000000..cb765b4
--- /dev/null
+++ b/MAINTAINERS
@@ -0,0 +1,6 @@
+LENOVO YOGA BOOK 9 KEYBOARD DOCK DRIVER
+M:	Dave Carey <carvsdriver@gmail.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
+F:	drivers/platform/x86/lenovo/yb9-kbdock.c
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
2.53.0


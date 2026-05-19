Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4D414F70
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 May 2026 00:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779148968; cv=none; b=CWqoV0G1iB55PbnZGLufPM/soW5ELcUnINNd89Hto1VK4/8r4QCMxwhN8zJTeb9Xn9KI0Lotu49TPah0V79Qf1VDXx7/skwclZXIeClHEQXWnaxTRZ1sIEzVnU3R38rChdkQHijN5qruv5zkE9sPEr1giJ+1IMDSdoE6UKGXW8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779148968; c=relaxed/simple;
	bh=MSQXlns5mTREbDHEDBBrSbveWDwxysleG9QJiW3eFjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W+71x34HMSct63ci7lmMbRO/GdXAY0390mz71xVHDRBltP2GTHh0ggD+r1Sf/+HkrZG70M+l49Wr/Cu5EPjhBqoOueTk3SFOXRJU8iLfXFty47yBiqVollcHnPuBqlb/Y8lqZU6sqpV9TLnKfJTST3ciEWVwjQAYQojNDZOo+vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iLC3OROO; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iLC3OROO"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-63124a80693so1009551137.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 May 2026 17:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779148965; x=1779753765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=og5TLqDWN0Dl1SdHjFhH0Odcad8jc06CRMJ4sL/bUfA=;
        b=iLC3OROOnb7vXeAUJzUTke7ZEcZYrJumPHZmtZpTKm5OZ0PI5DFxJV5OUIXQfltQ99
         3RcsO1cHcUtox/9Gb1N/q+wTiZafkCcDqLIre/gdsmXGIfFTxalK14v9TL7x7e+Gga6g
         DV9Vcff4e9VNhI+mEAUC6J9eeQPZugA+57apSY6KCuaWAOJ5Kn22/XwQv72tRJf/vEdX
         Tc8jPVDGaVxW/Nq1LGwVRYNsXdIewGqktjP0pIiDdqfcJS+aVHq7mxeI0mFTHoVZhGNl
         Xj11uNoFsFlCF1zdgoWlbrKWaX5Djb7Ciu7wPNkcgVYLCUMcCiaqPTmp8GA9168JjzRm
         c9gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779148965; x=1779753765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=og5TLqDWN0Dl1SdHjFhH0Odcad8jc06CRMJ4sL/bUfA=;
        b=idaoAf0qPQ0AutocZWr8A9vIT9+cIFo5o9YiA5ng6+PHLQihIxO2lnCCHyB7eBBynO
         W0C3Nzje8OJXihs3z71fwCTsczIlXIalZceWk/5eC1VAs6dnrQ8tyxhd7PkVcYPu0Xbj
         Il23L+ZrFxyyje4COabnQ5IjH6yxllGZlqpWHP8vpL/va6W7m9EynlDPexj8bmL7pap0
         s0uF7x9jQEju6fwP7YX4KzN+LQspIaBHRrqrjX8LxfChOan9Xxhm7jjmQAqqrVVqHkgI
         CQsctm9721FJzypQI396txyAUnpo60CZAnmmWYxnkSAIMiBy94+EZPWBYEuzNW9x9ahu
         EcOA==
X-Forwarded-Encrypted: i=1; AFNElJ9CL9t+fI5Q5XQ8QHAftVT3b3ntqvdRJjmDg4BEuzuZVuT0bY1CJ81fQEVLybFMx/7vh7EiPxD3oZcu7fqvRlZYLKxM@vger.kernel.org
X-Gm-Message-State: AOJu0YyV7kMC+kR7R3BLBif3onT9UIf8GTpNkun9UcDI4ZGei9WJTi9+
	hf1XcE7zn2+9Dn3IZ9TKEdAmlboliTE7pmdspyXQyO5v7nzrATUPN038
X-Gm-Gg: Acq92OFx2X6lqlk0Ko3DzL+3QPged9k70JUEYt0IMJgAIVxnOM6VJIew491yMyeSZgd
	47IYnclTHGWfSRVCsXxIxmZO0XYMm/Axy1j9mZHS4fapgX+6QioWvNO/l9XAa6lA7Gd81MgeJ29
	MueDU+SIY4IX+WdsaREyfQoA4tzVrA7wplnz1WYkkvQ6cYirSsJ9TaJn5V0xV1gQp50ljYG2fiY
	NXaKoJvhnHCPJbF2f/O0N/wBRxN9zDywpfc6ulWR6FwmHhQA+FHoyg51VFGfkrYSX3lzIFrlGnX
	oLFppA4YhSiKh9cuf1g/c3xAhJ9rFirt0F0u3j+GLA7JpDrGmvMDRNRWtI3vWKqo+HKSKC2OyTh
	jhmcpoMkidpKJ+OLWmbN34k8LQFwvxsaPFJAs1kyfECAl1zW8/5oFkZL9Qj6Z303agakIyCe0ig
	RayH3eumSC/Xv01UMyfQ5tlVba8/1B2qcluaW9dRIrjQ0AzQonod94fmIyXEJowhOCP5Oo+AcPi
	eNwdRQ=
X-Received: by 2002:a67:ef12:0:b0:650:aa33:5f2c with SMTP id ada2fe7eead31-650aa3367bbmr2769131137.7.1779148965210;
        Mon, 18 May 2026 17:02:45 -0700 (PDT)
Received: from fedora (pool-100-11-178-145.phlapa.fios.verizon.net. [100.11.178.145])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910bae24879sm1751895585a.18.2026.05.18.17.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 17:02:44 -0700 (PDT)
From: Dave Carey <carvsdriver@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: pithenrich2d@googlemail.com,
	mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com,
	W_Armin@gmx.de,
	platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	Dave Carey <carvsdriver@gmail.com>
Subject: [PATCH v3] platform/x86/lenovo: Add Yoga Book 9 keyboard dock detection driver
Date: Mon, 18 May 2026 20:02:39 -0400
Message-ID: <20260519000239.29446-1-carvsdriver@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260517150224.50191-1-carvsdriver@gmail.com>
References: <20260517150224.50191-1-carvsdriver@gmail.com>
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

The current BKBD state is read via a separate WMI query GUID
E7F300FA-21CD-4003-ADAC-2696135982E6 (WQAF method), which returns an
8-byte buffer: bytes [0..3] hold the LFID constant 0x00060000 and bytes
[4..7] hold the BKBD value.

BKBD encoding:
  0 = keyboard detached
  1 = keyboard docked on top half of bottom screen
  2 = keyboard docked on bottom half of bottom screen
  3 = reserved (not observed in practice)

Both GUIDs are children of the same ACPI device (WM10), so both are
matched by a single WMI driver.  The query device pointer is stored in a
module-level variable protected by a mutex; the event device uses
wmidev_block_query() via the stored pointer rather than the deprecated
global wmi_query_block().  get_device()/put_device() bracket each use of
the stored pointer so probe/remove races cannot produce a use-after-free.

This driver:
  - Registers as a WMI driver on both the event and query GUIDs.
  - Queries BKBD state synchronously on probe and on each WMI
    notification.
  - Sets the initial SW_TABLET_MODE bit before input_register_device()
    via __set_bit() so userspace always reads the correct state on first
    open.
  - Reports SW_TABLET_MODE=1 when detached, SW_TABLET_MODE=0 when docked
    in either position (a physical keyboard is present in both cases).
  - Exposes the raw BKBD value via a read-only sysfs attribute
    "keyboard_position" for use by userspace (e.g. to distinguish between
    the two docked positions for different UI layouts).  The attribute is
    registered per-device via devm_device_add_groups() in the event-device
    probe path only; the query device has no priv and no sysfs groups.

Tested on: Lenovo Yoga Book 9 14IAH10 (model 83KJ), kernel 6.19.

Signed-off-by: Dave Carey <carvsdriver@gmail.com>
---
 .../testing/sysfs-driver-lenovo-yb9-kbdock    |  21 ++
 MAINTAINERS                                   |   6 +
 drivers/platform/x86/lenovo/Kconfig           |  14 ++
 drivers/platform/x86/lenovo/Makefile          |   1 +
 drivers/platform/x86/lenovo/yb9-kbdock.c      | 270 ++++++++++++++++++
 5 files changed, 312 insertions(+)
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
index 0000000..0000000
--- /dev/null
+++ b/drivers/platform/x86/lenovo/yb9-kbdock.c
@@ -0,0 +1,270 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Lenovo Yoga Book 9 keyboard-dock detection
+ *
+ * Reports SW_TABLET_MODE based on keyboard attachment state and exposes the
+ * raw dock position via sysfs.
+ *
+ * Copyright (C) 2026 Dave Carey <carvsdriver@gmail.com>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/acpi.h>
+#include <linux/bitfield.h>
+#include <linux/cleanup.h>
+#include <linux/dmi.h>
+#include <linux/input.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/wmi.h>
+
+/*
+ * WM10 ACPI device (_UID "GMZN") exposes two relevant WMI GUIDs:
+ *   YB9_KBDOCK_EVENT_GUID — notify ID 0xEB fires on attachment state change.
+ *   YB9_KBDOCK_QUERY_GUID — object "AF" (WQAF), returns an 8-byte buffer
+ *                           whose upper four bytes hold the BKBD value.
+ *
+ * BKBD encoding:
+ *   0 (BKBD_DETACHED)    — keyboard detached       → SW_TABLET_MODE = 1
+ *   1 (BKBD_TOP_HALF)    — docked, top half        → SW_TABLET_MODE = 0
+ *   2 (BKBD_BOTTOM_HALF) — docked, bottom half     → SW_TABLET_MODE = 0
+ *   3                    — reserved; treated as an error
+ */
+#define YB9_KBDOCK_EVENT_GUID		"806BD2A2-177B-481D-BFB5-3BA0BB4A2285"
+#define YB9_KBDOCK_QUERY_GUID		"E7F300FA-21CD-4003-ADAC-2696135982E6"
+#define YB9_KBDOCK_QUERY_INSTANCE	0
+
+#define BKBD_DETACHED		0
+#define BKBD_TOP_HALF		1
+#define BKBD_BOTTOM_HALF	2
+#define BKBD_MASK		GENMASK(1, 0)
+
+/* Distinguish the two GUIDs via the id_table context field. */
+enum yb9_guid_type { YB9_GUID_EVENT, YB9_GUID_QUERY };
+
+/*
+ * Both GUIDs are children of the same ACPI device (WM10).  Store the query
+ * WMI device globally so the event-device probe and notify path can reach it
+ * via wmidev_block_query().  Protected by yb9_query_lock during probe/remove.
+ */
+static struct wmi_device *yb9_query_wdev;
+static DEFINE_MUTEX(yb9_query_lock);
+
+struct yb9_kbdock_priv {
+	struct input_dev *input_dev;
+	unsigned int bkbd;
+};
+
+/* Returns 0–2 on success, -errno on error. */
+static int yb9_kbdock_query(struct wmi_device *event_wdev,
+			     struct wmi_device *query_wdev)
+{
+	u32 bkbd;
+
+	union acpi_object *obj __free(kfree) =
+		wmidev_block_query(query_wdev, YB9_KBDOCK_QUERY_INSTANCE);
+	if (!obj) {
+		dev_warn(&event_wdev->dev, "WQAF query returned NULL\n");
+		return -EIO;
+	}
+
+	/*
+	 * WQAF returns an 8-byte buffer: bytes [0..3] = LFID (0x00060000),
+	 * bytes [4..7] = BKBD value.  Guard against short buffers.
+	 */
+	if (obj->type == ACPI_TYPE_BUFFER && obj->buffer.length >= 8)
+		memcpy(&bkbd, obj->buffer.pointer + 4, sizeof(bkbd));
+	else if (obj->type == ACPI_TYPE_INTEGER)
+		bkbd = obj->integer.value;
+	else {
+		dev_warn(&event_wdev->dev,
+			 "WQAF: unexpected result type %d len %u\n",
+			 obj->type, obj->type == ACPI_TYPE_BUFFER ? obj->buffer.length : 0);
+		return -EIO;
+	}
+
+	bkbd = FIELD_GET(BKBD_MASK, bkbd);
+	if (bkbd == 3) {
+		dev_warn(&event_wdev->dev, "BKBD value 3 is reserved\n");
+		return -EINVAL;
+	}
+
+	return bkbd;
+}
+
+static void yb9_kbdock_update(struct wmi_device *wdev)
+{
+	struct yb9_kbdock_priv *priv = dev_get_drvdata(&wdev->dev);
+	struct wmi_device *qwdev;
+	int tablet_mode;
+	int bkbd;
+
+	mutex_lock(&yb9_query_lock);
+	qwdev = yb9_query_wdev;
+	if (qwdev)
+		get_device(&qwdev->dev);
+	mutex_unlock(&yb9_query_lock);
+	if (!qwdev)
+		return;
+
+	bkbd = yb9_kbdock_query(wdev, qwdev);
+	put_device(&qwdev->dev);
+	if (bkbd < 0)
+		return;
+
+	priv->bkbd = bkbd;
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
+static ssize_t keyboard_position_show(struct device *dev,
+				      struct device_attribute *attr, char *buf)
+{
+	static const char * const names[] = {
+		"detached", "top-half", "bottom-half",
+	};
+	struct yb9_kbdock_priv *priv = dev_get_drvdata(dev);
+	unsigned int bkbd = priv->bkbd;
+
+	if (WARN_ON_ONCE(bkbd >= ARRAY_SIZE(names)))
+		return -EINVAL;
+	return sysfs_emit(buf, "%u (%s)\n", bkbd, names[bkbd]);
+}
+static DEVICE_ATTR_RO(keyboard_position);
+
+static struct attribute *yb9_kbdock_attrs[] = {
+	&dev_attr_keyboard_position.attr,
+	NULL,
+};
+
+static const struct attribute_group yb9_kbdock_group = {
+	.attrs = yb9_kbdock_attrs,
+};
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
+static int yb9_kbdock_probe(struct wmi_device *wdev, const void *ctx)
+{
+	enum yb9_guid_type type = (enum yb9_guid_type)(uintptr_t)ctx;
+	struct yb9_kbdock_priv *priv;
+	struct input_dev *input_dev;
+	struct wmi_device *qwdev;
+	int bkbd_init;
+	int err;
+
+	if (type == YB9_GUID_QUERY) {
+		if (!dmi_check_system(yb9_kbdock_dmi_table))
+			return -ENODEV;
+		mutex_lock(&yb9_query_lock);
+		yb9_query_wdev = wdev;
+		mutex_unlock(&yb9_query_lock);
+		return 0;
+	}
+
+	if (!dmi_check_system(yb9_kbdock_dmi_table))
+		return -ENODEV;
+
+	mutex_lock(&yb9_query_lock);
+	qwdev = yb9_query_wdev;
+	if (qwdev)
+		get_device(&qwdev->dev);
+	mutex_unlock(&yb9_query_lock);
+	if (!qwdev)
+		return -EPROBE_DEFER;
+
+	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv) {
+		put_device(&qwdev->dev);
+		return -ENOMEM;
+	}
+
+	input_dev = devm_input_allocate_device(&wdev->dev);
+	if (!input_dev) {
+		put_device(&qwdev->dev);
+		return -ENOMEM;
+	}
+
+	input_dev->name = "Lenovo Yoga Book 9 keyboard dock switch";
+	input_dev->phys = YB9_KBDOCK_EVENT_GUID "/input0";
+	input_dev->id.bustype = BUS_HOST;
+	input_dev->dev.parent = &wdev->dev;
+	input_set_capability(input_dev, EV_SW, SW_TABLET_MODE);
+
+	priv->input_dev = input_dev;
+	dev_set_drvdata(&wdev->dev, priv);
+
+	/*
+	 * Query the initial dock state and preset the switch bit before
+	 * input_register_device() so userspace never sees SW_TABLET_MODE = 0
+	 * for a detached keyboard on first open.
+	 */
+	bkbd_init = yb9_kbdock_query(wdev, qwdev);
+	put_device(&qwdev->dev);
+	if (bkbd_init >= 0) {
+		priv->bkbd = bkbd_init;
+		if (bkbd_init == BKBD_DETACHED)
+			__set_bit(SW_TABLET_MODE, input_dev->sw);
+	}
+
+	err = input_register_device(input_dev);
+	if (err) {
+		dev_err(&wdev->dev, "failed to register input device: %d\n", err);
+		return err;
+	}
+
+	err = devm_device_add_group(&wdev->dev, &yb9_kbdock_group);
+	if (err) {
+		dev_err(&wdev->dev, "failed to add sysfs group: %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+static void yb9_kbdock_remove(struct wmi_device *wdev)
+{
+	mutex_lock(&yb9_query_lock);
+	if (wdev == yb9_query_wdev)
+		yb9_query_wdev = NULL;
+	mutex_unlock(&yb9_query_lock);
+}
+
+static const struct wmi_device_id yb9_kbdock_wmi_id_table[] = {
+	{ .guid_string = YB9_KBDOCK_EVENT_GUID, .context = (void *)YB9_GUID_EVENT },
+	{ .guid_string = YB9_KBDOCK_QUERY_GUID, .context = (void *)YB9_GUID_QUERY },
+	{ }
+};
+MODULE_DEVICE_TABLE(wmi, yb9_kbdock_wmi_id_table);
+
+static struct wmi_driver yb9_kbdock_driver = {
+	.driver = {
+		.name = "lenovo-yb9-kbdock",
+	},
+	.id_table = yb9_kbdock_wmi_id_table,
+	.probe    = yb9_kbdock_probe,
+	.remove   = yb9_kbdock_remove,
+	.notify   = yb9_kbdock_notify,
+};
+module_wmi_driver(yb9_kbdock_driver);
+
+MODULE_AUTHOR("Dave Carey <carvsdriver@gmail.com>");
+MODULE_DESCRIPTION("Lenovo Yoga Book 9 keyboard dock detection");
+MODULE_LICENSE("GPL");
--
2.53.0


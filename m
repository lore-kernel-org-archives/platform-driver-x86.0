Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA71F3FD130
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 May 2026 12:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779884833; cv=none; b=RXMa4NFBQRpJk+9+tAkjnNoHVTEUk+E6cPLSNlLXZaO2iDRjRvt7Ys85HRINc4Fn3wgJiakPu2hn/ReWbUR94hZXlKlGn4UBIx5LJhPIangzEaUSMLIzddkegqNxzNMvM1VY2oCRbKFxpBEeeV03sLfvbB9gGgY6LNpWoMvsg30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779884833; c=relaxed/simple;
	bh=E3MhODjW3GqLgnst8gUFBV/XIjmEV1CCo/PYzrNhjsw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ielZgmK2hPy3xg1dihwthEPR+4773hH3Ic/Jx7XyTh6WXeuRx5uaRcuWIiev2+8371zLoUaJcMHgwNEiz84qwb+Rv9p+tdLrsc7B1SN04/y3AS8h4HfnDw1CBZFaWExKoi8J7khzUcYAZT41qCUVQCyLITU3f3c4Sw5krZT6s40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oBmHBNFm; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oBmHBNFm"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7bf0b47d2f1so101703477b3.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 May 2026 05:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779884831; x=1780489631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rWrEjBrl0vA7XJPIp0eMaT9Ioa30kwKnMaMfiWNApUY=;
        b=oBmHBNFmOpgnpsxyjBKfJi9M4JnTnkiHdGqNYUAO/eApYkIJmBIetpyHpR4tw9YWAR
         LHkOPBAi/WZx6OM90a0oeTtBF9ei10X/a6QqNIdkXtbxsAsGa4hmRcPxBkguPj2Ac8Qa
         5gbJUSKgK5rSPBVFqohF8WDiqlfsDhkIQAgKcofJRN8dDfunUwZ8MZchjTvJqDMDZ6gu
         CmtYqV6AHDtu7j3QkKuVSZFYqQBB5vbCu7OtHVQQeAI6g5CHn0fz9n1l4zezOof/6uQB
         9YMiANLqdlaJ+q7s2Mpa0ux6YeI7Yt3cNK8YL6UfZxKFeNYxsxE2LnfUlYHJJTQTOUd9
         54Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779884831; x=1780489631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rWrEjBrl0vA7XJPIp0eMaT9Ioa30kwKnMaMfiWNApUY=;
        b=jGCfB7kohF9loe+virYSZxSNoivohh65grJ1ySQGHV2KH5PMXCDlyacqRkbB22TZMK
         63j+r19O9qhfcY3Rduxdng/vTCMFpGmq+bmD1YC/S43cbkKhIgZ6tDshU+ax99BRQ2rK
         lhpE8HRLFX5+oZFNXeys5vKA2jV7WWWg6Ifq97Gs1d7iQyb9Y1hw8hx/Lp3F25vf9yWg
         YLmuhXTwLaLebVlAOHwF1VJA2m+rfKlrrtYH2di+QSY2Pdeyqdt5+lsjWZ/8MCUiJM65
         52WPEKsgA2CRlAqtrbeN392MDvOlYek2+bk9+UXjre/FN0PInZKRfWMEFS9HCUqVFo59
         bhTA==
X-Gm-Message-State: AOJu0Yxvm/wAIUyzPpoGtplY8nX4usy7BcrnGfnUYtxsPuAYmB9aaaW1
	MWOT4lOxFmhLFsb9J8yExP9xLGCf9WF5Oqy9HdYv++dqDUwUKdU1Ry8w5NPMNDk6
X-Gm-Gg: Acq92OEGXojxjTTQa7+XrTE8W06VtcCcXxUXHUggmFfznpXDZUB7QD45+z7DzxHZKO6
	+liZPrlcmG/QwidLG2LzBeYZCEv6L5FNcFxlj+VAGJR6BVEMIAPxOpHuE2xMbOYWj5lg8n89x5Q
	I/be/MO75SQAhHJFVsDuhyog0dnAGV3IK7z9vGp4LfDfjCMGNNqLNRn2bTRwsxnvRe6Y7vMNTAG
	ks83KV0LCJh83RwN5wUAoyl3I9QJrJCbX9fwiIukOLgK+g62BaK6SKfg2S/vndsJkM5RXHhksBn
	eVRsTDEzvSGbz2d4G2/qGrD4gjDZkid2OPLU/L1qjidSWVLXiobd79LLIjnV7evhzM+Ls4zO/kl
	hexaxs6ezozNEQYPZOjWzeN/zNctp3adVge8UdSjd+jgYLPGnBpxEP8jstyvha2ndq33ztTltK5
	mr7p7bQB/PYmiVlAD1L1SVvVojM95YYjHy1LctqpDTZvA=
X-Received: by 2002:a05:690c:9516:b0:7da:150a:18b6 with SMTP id 00721157ae682-7da150a2bbbmr46747717b3.16.1779884830652;
        Wed, 27 May 2026 05:27:10 -0700 (PDT)
Received: from fedora ([2600:382:9a04:67b3:d02d:af49:8dff:b33a])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7d38c43645csm74902097b3.41.2026.05.27.05.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 05:27:09 -0700 (PDT)
From: Dave Carey <carvsdriver@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	armin.wolf@outlook.de,
	linux-kernel@vger.kernel.org,
	Dave Carey <carvsdriver@gmail.com>
Subject: [PATCH v5] platform/x86/lenovo: Add Yoga Book 9 keyboard dock detection driver
Date: Wed, 27 May 2026 08:27:01 -0400
Message-ID: <20260527122701.242907-1-carvsdriver@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521144034.282419-1-carvsdriver@gmail.com>
References: <20260521144034.282419-1-carvsdriver@gmail.com>
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
device, _UID "GMZN").

The device contains embedded BMOF data (WQDD, 20705 bytes) documenting
both WMI interfaces used by this driver:

  LENOVO_BTKBD_EVENT (event GUID): WmiDataId(1) uint32 Status.
  The ACPI _WED(0xEB) method returns EC.BKBD directly as an integer,
  so the notify callback receives BKBD without a separate query.

  LENOVO_FEATURE_STATUS_DATA (block GUID, WQAF method): returns an
  8-byte buffer {uint32 IDs=0x00060000, uint32 Status=BKBD}.
  Used for the initial state read on probe and after resume.

BKBD encoding:
  0 = keyboard detached
  1 = keyboard docked on top half of bottom screen
  2 = keyboard docked on bottom half of bottom screen
  3 = reserved (not observed in practice)

This driver:
  - Registers two WMI drivers: one on the event GUID (LENOVO_BTKBD_EVENT)
    and one on the block GUID (LENOVO_FEATURE_STATUS_DATA).
  - On probe, reads initial BKBD state via wmidev_block_query() on the
    block device; whichever driver probes last triggers the initial read.
  - On WMI notification, reads BKBD directly from the event data integer
    (ACPI _WED(0xEB) returns EC.BKBD) without a redundant WQAF call.
  - Reports SW_TABLET_MODE=1 when detached, SW_TABLET_MODE=0 when docked
    in either position (a physical keyboard is present in both cases).
  - Exposes the raw BKBD value via read-only sysfs attribute
    "keyboard_position".
  - Re-reads BKBD state on resume from suspend or hibernation.

Tested on: Lenovo Yoga Book 9 14IAH10 (model 83KJ), kernel 7.0.

Signed-off-by: Dave Carey <carvsdriver@gmail.com>
---
v5:
- Rewrote as two WMI drivers (event + block) to avoid the deprecated
  wmi_query_block() API: event driver owns the GUID that delivers
  notifications, block driver owns the GUID used for querying state.
  Either can probe first; both probe callbacks check whether the other
  has already probed and fire the initial read when both are ready.
- Use wmidev_block_query() on the block wmi_device directly (replaces
  the deprecated wmi_query_block()).
- In the notify callback, read BKBD directly from the event data integer
  passed by the WMI core (_WED(0xEB) returns EC.BKBD; confirmed by
  decoding the embedded BMOF from WQDD).  Eliminates the redundant WQAF
  call that v4 made on every notification.
- Documented the two BMOF classes (LENOVO_BTKBD_EVENT and
  LENOVO_FEATURE_STATUS_DATA) with field layouts in the commit message
  and file header.
- sysfs keyboard_position: output bare integer, drop the parenthetical
  position-name suffix that a couple of reviewers found non-standard.
- Set .no_singleton = true on both WMI drivers (was missing from block
  driver in v4).
- Add PM resume callback (yb9_kbdock_resume) to re-read BKBD state
  after suspend/hibernation.

v4:
- Dropped module_wmi_driver(); registered two WMI drivers manually to
  allow sharing state.  module_init/exit pair registers/unregisters
  both.
- Added ATTRIBUTE_GROUPS() and .dev_groups for the sysfs attribute.
- sysfs show: performed a live query instead of returning a cached value.

v3:
- Switched to devm_input_allocate_device().
- Added DMI guard (dmi_check_system) to reject non-YB9 machines.
- Removed redundant MODULE_DEVICE_TABLE on block driver.

v2:
- Added .no_singleton = true on the event WMI driver.
- Added PM suspend/resume skeleton.
- Fixed MODULE_LICENSE to "GPL" (was "GPL v2").

 .../testing/sysfs-driver-lenovo-yb9-kbdock    |  19 +
 MAINTAINERS                                   |   7 +
 drivers/platform/x86/lenovo/Kconfig           |  14 +
 drivers/platform/x86/lenovo/Makefile          |   1 +
 drivers/platform/x86/lenovo/yb9-kbdock.c      | 324 ++++++++++++++++++
 5 files changed, 365 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
 create mode 100644 drivers/platform/x86/lenovo/yb9-kbdock.c

diff --git a/Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock b/Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
new file mode 100644
index 0000000..04e5293
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
@@ -0,0 +1,19 @@
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
+		==  =============================================================
+		0   keyboard is not docked to any screen (detached)
+		1   keyboard docked on the top half of the bottom screen
+		2   keyboard docked on the bottom half of the bottom screen
+		==  =============================================================
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
index 0000000..28a3ec7
--- /dev/null
+++ b/drivers/platform/x86/lenovo/yb9-kbdock.c
@@ -0,0 +1,324 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Lenovo Yoga Book 9 keyboard-dock detection
+ *
+ * The Yoga Book 9 ships with a detachable Bluetooth keyboard that magnetically
+ * attaches to the bottom screen in one of two positions.  The EC tracks
+ * attachment state in a 2-bit field called BKBD and signals changes via WMI
+ * event 0xEB on the WM10 ACPI device (_UID "GMZN").
+ *
+ * BKBD values:
+ *   0 = keyboard detached
+ *   1 = keyboard docked on the top half of the bottom screen
+ *   2 = keyboard docked on the bottom half of the bottom screen
+ *   3 = reserved / not observed
+ *
+ * Two WMI interfaces are used (documented in embedded BMOF, WQDD, 20705 bytes):
+ *
+ *   LENOVO_BTKBD_EVENT (event GUID, 806BD2A2-...)
+ *     WmiDataId(1) uint32 Status — _WED(0xEB) returns EC.BKBD directly.
+ *     The notify callback receives BKBD as an integer; no separate query needed.
+ *
+ *   LENOVO_FEATURE_STATUS_DATA (block GUID, E7F300FA-...)
+ *     WmiDataId(1) uint32 IDs   = 0x00060000 (feature selector)
+ *     WmiDataId(2) uint32 Status = BKBD value
+ *     Used on probe and resume to read initial state.
+ *
+ * SW_TABLET_MODE=1 is reported when the keyboard is detached;
+ * SW_TABLET_MODE=0 when docked in either position (keyboard present).
+ * The raw BKBD value is exposed via the sysfs attribute "keyboard_position".
+ *
+ * Copyright (C) 2026 Dave Carey <carvsdriver@gmail.com>
+ */
+
+#include <linux/acpi.h>
+#include <linux/dmi.h>
+#include <linux/input.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/pm.h>
+#include <linux/wmi.h>
+
+#define YB9_KBDOCK_EVENT_GUID	"806BD2A2-177B-481D-BFB5-3BA0BB4A2285"
+#define YB9_KBDOCK_QUERY_GUID	"E7F300FA-21CD-4003-ADAC-2696135982E6"
+
+/* BKBD encoding */
+#define BKBD_DETACHED		0
+#define BKBD_TOP_HALF		1
+#define BKBD_BOTTOM_HALF	2
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
+/*
+ * Shared state between the event and block WMI drivers.  Protected by lock.
+ * The lock may be held across wmidev_query_block() calls (which can sleep);
+ * block_remove() acquires the lock before clearing block_wdev, ensuring
+ * block_wdev remains valid for the duration of any in-progress query.
+ */
+static struct {
+	struct mutex lock;
+	struct input_dev *input_dev;	/* set by event probe */
+	struct wmi_device *block_wdev;	/* set by block probe */
+} yb9;
+
+/*
+ * Read BKBD from the block device via wmidev_block_query().
+ * Returns 0-3 on success, -errno on failure.  Caller must hold yb9.lock.
+ */
+static int yb9_kbdock_query_locked(struct device *log_dev)
+{
+	union acpi_object *obj;
+	u32 bkbd;
+
+	if (!yb9.block_wdev)
+		return -ENODEV;
+
+	obj = wmidev_block_query(yb9.block_wdev, 0);
+	if (!obj) {
+		dev_warn(log_dev, "WQAF returned NULL\n");
+		return -EIO;
+	}
+
+	/*
+	 * LENOVO_FEATURE_STATUS_DATA: 8-byte buffer {IDs=0x00060000, Status=BKBD}.
+	 */
+	if (obj->type == ACPI_TYPE_BUFFER && obj->buffer.length >= 8) {
+		memcpy(&bkbd, obj->buffer.pointer + 4, sizeof(bkbd));
+		bkbd &= 0x3;
+	} else if (obj->type == ACPI_TYPE_INTEGER) {
+		bkbd = obj->integer.value & 0x3;
+	} else {
+		dev_warn(log_dev, "WQAF: unexpected type %d len %u\n",
+			 obj->type,
+			 obj->type == ACPI_TYPE_BUFFER ? obj->buffer.length : 0);
+		kfree(obj);
+		return -EIO;
+	}
+
+	kfree(obj);
+	return (int)bkbd;
+}
+
+/* Report SW_TABLET_MODE from BKBD.  Caller must hold yb9.lock. */
+static void yb9_kbdock_report_locked(int bkbd, struct device *log_dev)
+{
+	int tablet = (bkbd == BKBD_DETACHED) ? 1 : 0;
+
+	input_report_switch(yb9.input_dev, SW_TABLET_MODE, tablet);
+	input_sync(yb9.input_dev);
+	dev_dbg(log_dev, "BKBD=%d SW_TABLET_MODE=%d\n", bkbd, tablet);
+}
+
+/* ------------------------------------------------------------------
+ * sysfs
+ * ------------------------------------------------------------------ */
+
+static ssize_t keyboard_position_show(struct device *dev,
+				      struct device_attribute *attr, char *buf)
+{
+	int bkbd;
+
+	mutex_lock(&yb9.lock);
+	bkbd = yb9_kbdock_query_locked(dev);
+	mutex_unlock(&yb9.lock);
+
+	if (bkbd < 0)
+		return bkbd;
+	return sysfs_emit(buf, "%u\n", (unsigned int)bkbd);
+}
+static DEVICE_ATTR_RO(keyboard_position);
+
+static struct attribute *yb9_kbdock_attrs[] = {
+	&dev_attr_keyboard_position.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(yb9_kbdock);
+
+/* ------------------------------------------------------------------
+ * Event WMI driver — LENOVO_BTKBD_EVENT
+ * ------------------------------------------------------------------ */
+
+static void yb9_kbdock_notify(struct wmi_device *wdev, union acpi_object *data)
+{
+	u32 bkbd;
+
+	/*
+	 * _WED(0xEB) returns EC.BKBD directly as an integer
+	 * (LENOVO_BTKBD_EVENT WmiDataId(1) uint32 Status).
+	 */
+	if (!data || data->type != ACPI_TYPE_INTEGER) {
+		dev_warn(&wdev->dev, "unexpected event data type %d\n",
+			 data ? data->type : -1);
+		return;
+	}
+	bkbd = data->integer.value & 0x3;
+
+	mutex_lock(&yb9.lock);
+	if (yb9.input_dev)
+		yb9_kbdock_report_locked(bkbd, &wdev->dev);
+	mutex_unlock(&yb9.lock);
+}
+
+static int yb9_kbdock_event_probe(struct wmi_device *wdev, const void *ctx)
+{
+	struct input_dev *input_dev;
+	int bkbd, err;
+
+	if (!dmi_check_system(yb9_kbdock_dmi_table))
+		return -ENODEV;
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
+	if (err)
+		return err;
+
+	mutex_lock(&yb9.lock);
+	yb9.input_dev = input_dev;
+	/* Read initial state if the block device has already probed. */
+	if (yb9.block_wdev) {
+		bkbd = yb9_kbdock_query_locked(&wdev->dev);
+		if (bkbd >= 0)
+			yb9_kbdock_report_locked(bkbd, &wdev->dev);
+	}
+	mutex_unlock(&yb9.lock);
+
+	return 0;
+}
+
+static void yb9_kbdock_event_remove(struct wmi_device *wdev)
+{
+	mutex_lock(&yb9.lock);
+	yb9.input_dev = NULL;
+	mutex_unlock(&yb9.lock);
+}
+
+static int yb9_kbdock_resume(struct device *dev)
+{
+	int bkbd;
+
+	mutex_lock(&yb9.lock);
+	if (yb9.input_dev && yb9.block_wdev) {
+		bkbd = yb9_kbdock_query_locked(dev);
+		if (bkbd >= 0)
+			yb9_kbdock_report_locked(bkbd, dev);
+	}
+	mutex_unlock(&yb9.lock);
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(yb9_kbdock_pm_ops, NULL, yb9_kbdock_resume);
+
+static const struct wmi_device_id yb9_kbdock_event_id_table[] = {
+	{ .guid_string = YB9_KBDOCK_EVENT_GUID },
+	{ }
+};
+MODULE_DEVICE_TABLE(wmi, yb9_kbdock_event_id_table);
+
+static struct wmi_driver yb9_kbdock_event_driver = {
+	.driver = {
+		.name = "lenovo-yb9-kbdock",
+		.dev_groups = yb9_kbdock_groups,
+		.pm = pm_sleep_ptr(&yb9_kbdock_pm_ops),
+	},
+	.id_table = yb9_kbdock_event_id_table,
+	.no_singleton = true,
+	.probe = yb9_kbdock_event_probe,
+	.remove = yb9_kbdock_event_remove,
+	.notify = yb9_kbdock_notify,
+};
+
+/* ------------------------------------------------------------------
+ * Block WMI driver — LENOVO_FEATURE_STATUS_DATA
+ * ------------------------------------------------------------------ */
+
+static int yb9_kbdock_block_probe(struct wmi_device *wdev, const void *ctx)
+{
+	int bkbd;
+
+	if (!dmi_check_system(yb9_kbdock_dmi_table))
+		return -ENODEV;
+
+	mutex_lock(&yb9.lock);
+	yb9.block_wdev = wdev;
+	/* Read initial state if the event device has already probed. */
+	if (yb9.input_dev) {
+		bkbd = yb9_kbdock_query_locked(&wdev->dev);
+		if (bkbd >= 0)
+			yb9_kbdock_report_locked(bkbd, &wdev->dev);
+	}
+	mutex_unlock(&yb9.lock);
+	return 0;
+}
+
+static void yb9_kbdock_block_remove(struct wmi_device *wdev)
+{
+	mutex_lock(&yb9.lock);
+	yb9.block_wdev = NULL;
+	mutex_unlock(&yb9.lock);
+}
+
+static const struct wmi_device_id yb9_kbdock_block_id_table[] = {
+	{ .guid_string = YB9_KBDOCK_QUERY_GUID },
+	{ }
+};
+
+static struct wmi_driver yb9_kbdock_block_driver = {
+	.driver = {
+		.name = "lenovo-yb9-kbdock-block",
+	},
+	.id_table = yb9_kbdock_block_id_table,
+	.no_singleton = true,
+	.probe = yb9_kbdock_block_probe,
+	.remove = yb9_kbdock_block_remove,
+};
+
+/* ------------------------------------------------------------------
+ * Module init / exit
+ * ------------------------------------------------------------------ */
+
+static int __init yb9_kbdock_init(void)
+{
+	int ret;
+
+	mutex_init(&yb9.lock);
+
+	ret = wmi_driver_register(&yb9_kbdock_event_driver);
+	if (ret)
+		return ret;
+
+	ret = wmi_driver_register(&yb9_kbdock_block_driver);
+	if (ret) {
+		wmi_driver_unregister(&yb9_kbdock_event_driver);
+		return ret;
+	}
+	return 0;
+}
+module_init(yb9_kbdock_init);
+
+static void __exit yb9_kbdock_exit(void)
+{
+	wmi_driver_unregister(&yb9_kbdock_block_driver);
+	wmi_driver_unregister(&yb9_kbdock_event_driver);
+}
+module_exit(yb9_kbdock_exit);
+
+MODULE_AUTHOR("Dave Carey <carvsdriver@gmail.com>");
+MODULE_DESCRIPTION("Lenovo Yoga Book 9 keyboard dock detection");
+MODULE_LICENSE("GPL");
-- 
2.54.0


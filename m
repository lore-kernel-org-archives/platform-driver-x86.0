Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34EB41168A
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Jun 2026 21:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781040402; cv=none; b=XNivueSWw4tNcge0AScYfcKdMsuK8rh8pA2FUyzFDimoLoNM16rN3GKFbhrQ29CcBe7/kHekxiRHSO5Ma+pn73Xye3qGw+mkSi98I8dsKy2Slu4gk/pDaqgeZZBx900COcIfSEXpBDaU0c4SupgcAKEKSV73MiLVQrJe3Nh2/SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781040402; c=relaxed/simple;
	bh=hfQOUiuGmzpUZo+gSeNocXoChKbS7listFAm1bAC6lI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sdO27Y9qdFhEgwg5cAEMRM64Bn+vHqCHLUZECzeZbJwi4o3rw3M7/tDh6VbeN0OAwN9M0jD4uRE5qZVP7KBsIV+nYHRbhBRo2Cocrsy9UhsBmDUQ+ETBvmVBHz5hz6k8xWfX16IBnniLiuUWBus/rW6CNFiR8gG9un7JlEXQdN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jAhM+zzi; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jAhM+zzi"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8ccf0fa0aacso83720146d6.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 09 Jun 2026 14:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781040399; x=1781645199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jtsq6ar/hYL2f3XMwD3BwuiAC477bjb3FJHRJIXJs1Q=;
        b=jAhM+zzi6VFpyQLQdluFcJO8s9ajnPGk6yklQie3NzIUV+yZVs1YjzOwJ0pHyMvhB2
         J25e5pp8D0rxzf/jdWdZhMEGyB4WVdjVuBs7a4jjxhzd2NF8GdQwEHjbGKvxets3ttZi
         gC0kr6obAx3gcWXEjymlJ7OUFJtPWzvhrjZFkSlAB4E0BN2U016Ep7rQEA6nt3CijGcO
         SMIpRD+H1cBoD5F2iXnejU2m5lCAOp4XkfjrN89zLFBrbr53z7+8hVJAjaGwf4rddjOB
         XFbl5CbI/t1rn7oPiFpLXCRgQ7JXdaNgW24g+O8GtclvT1hYva7l1Rco4UCHcH/ywfKh
         rIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781040399; x=1781645199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jtsq6ar/hYL2f3XMwD3BwuiAC477bjb3FJHRJIXJs1Q=;
        b=iSA/K4KkdtM11ZhGchYyJGwK6Ct0cU06/VohvuSx7kftn0QIZtZPo6LqFlqXN8/0j1
         bdUIYW8Njtog0FcwZC1E234ZC8BieQVXiW1AFZkIE2eBly7gqR0kShRZjTttN5Lz3JOt
         eH0gpK3R8ZO+8B1tAp0sFYT14ISHUFMYmSpVacKixle0zDKW6yQuBn0KNGxr2vrUwNBB
         rsYRlTksWytgnslESbhlZhM2qKLyCfHOiqpwMBljkuesNBybWkgbxR7seX1bsOwvtPuA
         fbJxTNgHU1rotkMSc6r870z0HlHvpeokkx8ObEL96nustC/vwmt1jT6KiHEpJtjjPc9l
         ZLyg==
X-Gm-Message-State: AOJu0YyX4SUiQR6i7e4rgukQJ3OxGtzChZL2j3RYrBDnL9o2y1EjWck2
	QxVbDaz+8F3LfVauyAL+E+BV/LgIn7wEdgyAHGM5ErUpeyxnQu6N4ytd8v+AEEyG
X-Gm-Gg: Acq92OGjiur/svbCCd+Hjq+pOcwViOT/n9X6SEJf3HwRF5rzgksi+HSIZY1ZqbnGjXg
	CEE2dvWN5UZzGh3sV559gR4bFmsS90w26z8GkDnhmfTrS5Y/a49JV3DiWnqeUV/vpXSP4rMO4zR
	ur22RekI+c//K7rfS5Ts+DBWDvIjW+XJBiweCJPqJvifbJ2xkrw17o9KyEHBOoPhisnyZEvY3ur
	o1COoWafhHTgjQj5ej9P5pg1R3ImoeMuBUdW1AIkaNKQG0uzcwKzh1WDZos+KtNWiT8NVuD5b4P
	/qmzV+X41kEMPOAmjrd4EEeWaLvm4S1UrVrl4R4M6BI63asxSBlEoMnanaphzqxqLUnN0znxpfP
	S+0pfwlL7AN+ejAOaWle3b+6NY6YwbA5KBYu+gczcE3A51AibLGroqMh6Ojc9U0XI8lFfCCC2Hi
	31hdLd+Q8ysB1QLStarKBA3ttap3rkdC9DqufSiP1jveaqO9njBFcR+ALdXLZRfKYSIwOCE3DQS
	W7u8Fs=
X-Received: by 2002:a05:6214:10ec:b0:8cc:d165:7ee0 with SMTP id 6a1803df08f44-8cee5fb6e29mr298831276d6.11.1781040398635;
        Tue, 09 Jun 2026 14:26:38 -0700 (PDT)
Received: from fedora (pool-100-11-178-145.phlapa.fios.verizon.net. [100.11.178.145])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ceccdcb3c5sm226713036d6.21.2026.06.09.14.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 14:26:38 -0700 (PDT)
From: Dave Carey <carvsdriver@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: johannes.goede@oss.qualcomm.com,
	mpearson-lenovo@squebb.ca,
	ilpo.jarvinen@linux.intel.com,
	armin.wolf@outlook.de,
	linux-kernel@vger.kernel.org,
	Dave Carey <carvsdriver@gmail.com>
Subject: [PATCH v7 2/2] platform/x86/lenovo: Add Yoga Book 9 keyboard dock detection driver
Date: Tue,  9 Jun 2026 17:26:31 -0400
Message-ID: <20260609212631.925943-3-carvsdriver@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609212631.925943-1-carvsdriver@gmail.com>
References: <20260608215205.678182-1-carvsdriver@gmail.com>
 <20260609212631.925943-1-carvsdriver@gmail.com>
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
  - On probe, reads initial BKBD state via wmidev_query_block() on the
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
v7:
- Use wmidev_query_block() in place of deprecated wmidev_block_query().
  Use __free(kfree) to manage the output buffer; simplify the parsing
  to a single length check now that the WMI core handles type conversion.
- Define BKBD_FIELD with GENMASK() and extract the field with FIELD_GET()
  instead of open-coded masking.
- Use guard(mutex) for all lock/unlock pairs.
- Add yb9_kbdock_sync_locked() helper to consolidate the duplicated
  initial-state read pattern in event_probe, block_probe, and resume.
- Add linux/bitfield.h, linux/cleanup.h, linux/slab.h includes.
- Fix comment on struct mutex field; use Context:/Returns: sections in
  the kerneldoc comment for yb9_kbdock_query_locked().

v6:
- Submitted as 2/2; patch 1/2 adds a DMI early-exit to lenovo-ymc to
  prevent duplicate SW_TABLET_MODE input nodes on the YB9.

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
 drivers/platform/x86/lenovo/yb9-kbdock.c      | 317 ++++++++++++++++++
 5 files changed, 358 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
 create mode 100644 drivers/platform/x86/lenovo/yb9-kbdock.c

diff --git a/Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock b/Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
new file mode 100644
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
--- /dev/null
+++ b/drivers/platform/x86/lenovo/yb9-kbdock.c
@@ -0,0 +1,317 @@
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
+#include <linux/bitfield.h>
+#include <linux/cleanup.h>
+#include <linux/dmi.h>
+#include <linux/input.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/pm.h>
+#include <linux/slab.h>
+#include <linux/wmi.h>
+
+#define YB9_KBDOCK_EVENT_GUID	"806BD2A2-177B-481D-BFB5-3BA0BB4A2285"
+#define YB9_KBDOCK_QUERY_GUID	"E7F300FA-21CD-4003-ADAC-2696135982E6"
+
+/* 2-bit EC field encoding the keyboard dock position */
+#define BKBD_FIELD		GENMASK(1, 0)
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
+	struct mutex lock; /* protects input_dev and block_wdev */
+	struct input_dev *input_dev;	/* set by event probe */
+	struct wmi_device *block_wdev;	/* set by block probe */
+} yb9;
+
+/**
+ * yb9_kbdock_query_locked() - Read BKBD from the block device.
+ * @log_dev: Device for logging.
+ *
+ * Context: Caller must hold yb9.lock.
+ * Returns: 0-3 on success, -errno on failure.
+ */
+static int yb9_kbdock_query_locked(struct device *log_dev)
+{
+	struct wmi_buffer out = {};
+	void *data __free(kfree) = NULL;
+	u32 bkbd;
+	int ret;
+
+	if (!yb9.block_wdev)
+		return -ENODEV;
+
+	ret = wmidev_query_block(yb9.block_wdev, 0, &out);
+	if (ret) {
+		dev_warn(log_dev, "WQAF failed: %d\n", ret);
+		return ret;
+	}
+
+	data = out.data;
+
+	/*
+	 * LENOVO_FEATURE_STATUS_DATA: 8-byte buffer {IDs=0x00060000, Status=BKBD}.
+	 * BKBD is at bytes 4-7.
+	 */
+	if (out.length < 8) {
+		dev_warn(log_dev, "WQAF: buffer too short (%zu)\n", out.length);
+		return -EIO;
+	}
+
+	memcpy(&bkbd, (u8 *)data + 4, sizeof(bkbd));
+	return (int)FIELD_GET(BKBD_FIELD, bkbd);
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
+/* Read BKBD and report if both WMI devices are ready.  Caller must hold yb9.lock. */
+static void yb9_kbdock_sync_locked(struct device *log_dev)
+{
+	int bkbd;
+
+	if (!yb9.input_dev || !yb9.block_wdev)
+		return;
+
+	bkbd = yb9_kbdock_query_locked(log_dev);
+	if (bkbd >= 0)
+		yb9_kbdock_report_locked(bkbd, log_dev);
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
+	guard(mutex)(&yb9.lock);
+	bkbd = yb9_kbdock_query_locked(dev);
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
+	bkbd = FIELD_GET(BKBD_FIELD, data->integer.value);
+
+	guard(mutex)(&yb9.lock);
+	if (yb9.input_dev)
+		yb9_kbdock_report_locked(bkbd, &wdev->dev);
+}
+
+static int yb9_kbdock_event_probe(struct wmi_device *wdev, const void *ctx)
+{
+	struct input_dev *input_dev;
+	int err;
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
+	guard(mutex)(&yb9.lock);
+	yb9.input_dev = input_dev;
+	yb9_kbdock_sync_locked(&wdev->dev);
+	return 0;
+}
+
+static void yb9_kbdock_event_remove(struct wmi_device *wdev)
+{
+	guard(mutex)(&yb9.lock);
+	yb9.input_dev = NULL;
+}
+
+static int yb9_kbdock_resume(struct device *dev)
+{
+	guard(mutex)(&yb9.lock);
+	yb9_kbdock_sync_locked(dev);
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
+	if (!dmi_check_system(yb9_kbdock_dmi_table))
+		return -ENODEV;
+
+	guard(mutex)(&yb9.lock);
+	yb9.block_wdev = wdev;
+	yb9_kbdock_sync_locked(&wdev->dev);
+	return 0;
+}
+
+static void yb9_kbdock_block_remove(struct wmi_device *wdev)
+{
+	guard(mutex)(&yb9.lock);
+	yb9.block_wdev = NULL;
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

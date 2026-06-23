Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514C72580F2
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jun 2026 12:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782219568; cv=none; b=k0jMU9cUO+pr4mlxT6IOukdWvZIAzhJH1OA4BH9d4xQ4/kq32ejFuaPKzcUXIprhJ2VsiNm7WW9EDB5jGg/4iiaPnCzuj2tuILBCTLBsg/5+A9LhriKK65nVqyy4uxbo2D4fgzyLskWmfStgJ7jVy62CGYhj0FuPzshqPTJfN88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782219568; c=relaxed/simple;
	bh=CMGYBqUhcwlvl+acp2H4hCMk3UA6uKosx4DQEcAu2GI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mbqzI7P/bLzsXsU6PQto7M+7S5WOSU/7C9K8VYLto+uomWYlnRlUUNH0PQHkZei+68ip5XELO2jWDI2LIokWsjpZZgeVfEYqNtd85fUc504o+1XJCW0+/FHLrkycUpLcD+yffw0rCG8PxO2cWEONFzQaa91RPVCvcB/qNVdd52Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C/8qokyk; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C/8qokyk"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-519f6a10d9bso27163601cf.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jun 2026 05:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782219565; x=1782824365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dg4DUl+B2vpVHtyV8Cc/a0+n3L7uunwRhkoL8xzs5kk=;
        b=C/8qokykJk1FiW5j/IvndfLoCAVmDlgzvgwYBKuVAMy8/lNwhbqPiccyFcMP195Q1y
         AAbTO8i8iYv5blWUwBc4rCu4DPvhiWGvartipENWGcUIGRaYfUEyIgylv9ajIg9Q9pC0
         9wBA6cpBh//9kJyOdZFRhvU83bHRhcEhCDNDm9u4fjpSnWWaqGGDzG1XkWyvcS8/PZKm
         Ayz+t8MjgeH8QiU+gdVLISfdmbB2c+/eAUi6q3CuGaOpZ6zsWjuw4/yvFcbykQPYUPwk
         vNJKnxtYbDLNf9xVAuKVmh/DiPoSjtSwMnPVSOyxlRlKH8EE5sqVE4kyI3UszUYFeZ/u
         npXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782219565; x=1782824365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dg4DUl+B2vpVHtyV8Cc/a0+n3L7uunwRhkoL8xzs5kk=;
        b=rAcElmnRSroW8YUy+NPNaUtJnghvkQ4bSUPLj7JqMhFb3bYqgQs689MpT54kGgE3Z8
         ulj5wLnR2aVvofFYagZIJuMgaGkBb+7fPfMcvGYkskDYurSfg7/2pltIwj/Jx12zXKTK
         y64yhsGZ7U5gFw9/fg5HqFRs8PhiK5+kx6Nk15UMRiRsRozOJs9M3Z8TLYFAb1zpl8Wm
         0XRqecJFYxiOJW+1pzwA3JajDoLlJ34ymPS/W4sCRkIWN2bC+QNOZD6zzV9ukoFEXqsU
         +SL2hVMfmiaeTXwvH0BzSPb2YNEgBT5IQbA1B91StbaJ8OOSHlalQ+9/4Yhoxp1Slcti
         EJeQ==
X-Gm-Message-State: AOJu0YxzWf9Px//RcFgmclEZ9wED2Wk15LhoqFM5QXLMKqZfsACdcvvw
	UZbkzy6W+4R8+fdFOW7nP90x2ontUZTWOKqnSj/IHOoEHDeTUtWT153eLkHr8io0
X-Gm-Gg: AfdE7clfxckWGANE0eUHCuRnz8AveFSuqQFUP185r20uX3cLVKPOot7y9OoYgEsn0Pu
	hCJxCg9wSujHyhnilvk5KkwGNyz62bSocUwtPSnF2mgVgJ6fn2l/Cxlup3WLjucTjcUWpQLxdlM
	Q9M6wbkaB/3JoJGAd66d4xmxiTVd8OdVgN3RndjVYLr4Cb4dUp3U70hPczVRoJkd3OrM52bHXTD
	quEYv6/90+C04aG52DGCogR5lXuvgkflk0KdTb7CIflAKF6xN4z+I/LBfnWkRwwa8BomUe6hT08
	KGjRKGtESpGVTh4sIodnjym2/En+/ypddyM1hDm1cmGbja6fnDJl4THTFOi3+Fwen5MhVYEICcj
	xe6ZwMzC1GZH+2c3/kWc6V6YtNNrNw5sWU91elW+ELsiKja/1vcVielX00cmMxFO2/JT8cQ/5+p
	S5s+1NkYUr+C1pXokipJM8NfwGR8GHZ4CrIco3D8HGxv7Vy1DVYOaC9C4ksQ==
X-Received: by 2002:a05:622a:190e:b0:517:c6d8:780 with SMTP id d75a77b69052e-519e4dce337mr292740991cf.56.1782219564910;
        Tue, 23 Jun 2026 05:59:24 -0700 (PDT)
Received: from fedora (pool-100-11-178-145.phlapa.fios.verizon.net. [100.11.178.145])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df7f01855bsm141447576d6.9.2026.06.23.05.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 05:59:24 -0700 (PDT)
From: Dave Carey <carvsdriver@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: W_Armin@gmx.de,
	ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	johannes.goede@oss.qualcomm.com,
	Dave Carey <carvsdriver@gmail.com>
Subject: [PATCH v11 2/2] platform/x86/lenovo: Add Yoga Book 9 keyboard dock detection driver
Date: Tue, 23 Jun 2026 08:59:14 -0400
Message-ID: <20260623125914.833063-3-carvsdriver@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623125914.833063-1-carvsdriver@gmail.com>
References: <8f84ca57-b856-4da0-8d90-e2be414f8997@gmx.de>
 <20260623125914.833063-1-carvsdriver@gmail.com>
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

This driver registers two WMI drivers sharing a module-level
BLOCKING_NOTIFIER_HEAD:

  - The event driver (LENOVO_BTKBD_EVENT) uses .notify_new() to receive
    a pre-parsed wmi_buffer and fires the notifier chain with the BKBD
    value extracted from the buffer.

  - The block driver (LENOVO_FEATURE_STATUS_DATA) owns the input_dev in
    its per-device private struct.  At probe time it registers a
    notifier_block on the chain and reads the initial BKBD state via
    wmidev_query_block().  The WMI buffer is parsed as
    struct lenovo_feature_status { __le32 id; __le32 status; }, and the
    ID field is verified before the status is used.

  - SW_TABLET_MODE=1 is reported when the keyboard is detached;
    SW_TABLET_MODE=0 when docked in either position (keyboard present).

  - The raw BKBD value is exposed via read-only sysfs attribute
    "keyboard_position".

  - BKBD state is re-read via wmidev_query_block() on resume from
    suspend or hibernation.

Tested on: Lenovo Yoga Book 9 14IAH10 (model 83KJ), kernel 7.0.

Acked-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Dave Carey <carvsdriver@gmail.com>
---
v11:
- ABI doc: correct Date to "June 2027" and KernelVersion to "7.3"; these
  fields should reflect when the ABI lands in the kernel, not the
  submission date (Armin Wolf).

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

 .../testing/sysfs-driver-lenovo-yb9-kbdock    |  19 ++
 MAINTAINERS                                   |   7 +
 drivers/platform/x86/lenovo/Kconfig           |  14 +
 drivers/platform/x86/lenovo/Makefile          |   1 +
 drivers/platform/x86/lenovo/yb9-kbdock.c      | 310 ++++++++++++++++++
 5 files changed, 351 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
 create mode 100644 drivers/platform/x86/lenovo/yb9-kbdock.c

diff --git a/Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock b/Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
new file mode 100644
index 0000000..ebe713a
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
@@ -0,0 +1,19 @@
+What:		/sys/bus/wmi/drivers/lenovo-yb9-kbdock/<guid>/keyboard_position
+Date:		June 2027
+KernelVersion:	7.3
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
index 0000000..dbf7ff4
--- /dev/null
+++ b/drivers/platform/x86/lenovo/yb9-kbdock.c
@@ -0,0 +1,310 @@
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
+ * The event driver (LENOVO_BTKBD_EVENT) fires a notifier chain on each WMI
+ * event.  The block driver (LENOVO_FEATURE_STATUS_DATA) owns the input_dev
+ * and registers a notifier_block to receive those events, eliminating the
+ * need for shared global state or a mutex.
+ *
+ * SW_TABLET_MODE=1 is reported when the keyboard is detached;
+ * SW_TABLET_MODE=0 when docked in either position (keyboard present).
+ * The raw BKBD value is exposed via the sysfs attribute "keyboard_position".
+ *
+ * Copyright (C) 2026 Dave Carey <carvsdriver@gmail.com>
+ */
+
+#include <linux/acpi.h>
+#include <linux/cleanup.h>
+#include <linux/dev_printk.h>
+#include <linux/dmi.h>
+#include <linux/input.h>
+#include <linux/module.h>
+#include <linux/notifier.h>
+#include <linux/pm.h>
+#include <linux/slab.h>
+#include <linux/wmi.h>
+
+#define YB9_KBDOCK_EVENT_GUID	"806BD2A2-177B-481D-BFB5-3BA0BB4A2285"
+#define YB9_KBDOCK_QUERY_GUID	"E7F300FA-21CD-4003-ADAC-2696135982E6"
+
+/* BKBD encoding */
+#define BKBD_DETACHED		0
+
+/* LENOVO_FEATURE_STATUS_DATA feature selector */
+#define YB9_FEATURE_STATUS_ID	0x00060000u
+
+/*
+ * LENOVO_FEATURE_STATUS_DATA: 8-byte buffer {uint32 IDs, uint32 Status}.
+ * IDs is always 0x00060000; Status holds the BKBD value (0–3).
+ */
+struct lenovo_feature_status {
+	__le32 id;
+	__le32 status;
+} __packed;
+
+/* ------------------------------------------------------------------
+ * Notifier chain — event driver fires it, block driver listens
+ * ------------------------------------------------------------------ */
+
+static BLOCKING_NOTIFIER_HEAD(yb9_kbdock_chain_head);
+
+static void devm_yb9_kbdock_unregister_notifier(void *data)
+{
+	struct notifier_block *nb = data;
+
+	blocking_notifier_chain_unregister(&yb9_kbdock_chain_head, nb);
+}
+
+static int devm_yb9_kbdock_register_notifier(struct device *dev,
+					      struct notifier_block *nb)
+{
+	int ret;
+
+	ret = blocking_notifier_chain_register(&yb9_kbdock_chain_head, nb);
+	if (ret < 0)
+		return ret;
+
+	return devm_add_action_or_reset(dev, devm_yb9_kbdock_unregister_notifier, nb);
+}
+
+/* ------------------------------------------------------------------
+ * Block WMI driver — LENOVO_FEATURE_STATUS_DATA
+ * (owns input_dev, sysfs, PM resume)
+ * ------------------------------------------------------------------ */
+
+struct yb9_kbdock_data {
+	struct wmi_device	*wdev;
+	struct input_dev	*input_dev;
+	struct notifier_block	 nb;
+};
+
+static int yb9_kbdock_query(struct yb9_kbdock_data *d)
+{
+	struct wmi_buffer out = {};
+	int ret;
+
+	ret = wmidev_query_block(d->wdev, 0, &out,
+				 sizeof(struct lenovo_feature_status));
+	if (ret)
+		return ret;
+
+	struct lenovo_feature_status *fs __free(kfree) = out.data;
+
+	if (le32_to_cpu(fs->id) != YB9_FEATURE_STATUS_ID)
+		return -EIO;
+
+	return le32_to_cpu(fs->status);
+}
+
+static void yb9_kbdock_report(struct yb9_kbdock_data *d, u32 bkbd)
+{
+	int tablet = (bkbd == BKBD_DETACHED) ? 1 : 0;
+
+	input_report_switch(d->input_dev, SW_TABLET_MODE, tablet);
+	input_sync(d->input_dev);
+	dev_dbg(&d->wdev->dev, "BKBD=%u SW_TABLET_MODE=%d\n", bkbd, tablet);
+}
+
+static void yb9_kbdock_sync(struct yb9_kbdock_data *d)
+{
+	int bkbd = yb9_kbdock_query(d);
+
+	if (bkbd >= 0)
+		yb9_kbdock_report(d, bkbd);
+}
+
+static int yb9_kbdock_nb_call(struct notifier_block *nb,
+			       unsigned long bkbd, void *unused)
+{
+	struct yb9_kbdock_data *d =
+		container_of(nb, struct yb9_kbdock_data, nb);
+
+	yb9_kbdock_report(d, bkbd);
+	return NOTIFY_DONE;
+}
+
+static ssize_t keyboard_position_show(struct device *dev,
+				       struct device_attribute *attr,
+				       char *buf)
+{
+	struct yb9_kbdock_data *d = dev_get_drvdata(dev);
+	int bkbd = yb9_kbdock_query(d);
+
+	if (bkbd < 0)
+		return bkbd;
+	return sysfs_emit(buf, "%d\n", bkbd);
+}
+static DEVICE_ATTR_RO(keyboard_position);
+
+static const struct attribute * const yb9_kbdock_attrs[] = {
+	&dev_attr_keyboard_position.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(yb9_kbdock);
+
+static int yb9_kbdock_resume(struct device *dev)
+{
+	struct yb9_kbdock_data *d = dev_get_drvdata(dev);
+
+	yb9_kbdock_sync(d);
+	return 0;
+}
+static DEFINE_SIMPLE_DEV_PM_OPS(yb9_kbdock_pm_ops, NULL, yb9_kbdock_resume);
+
+static int yb9_kbdock_block_probe(struct wmi_device *wdev, const void *ctx)
+{
+	struct yb9_kbdock_data *d;
+	struct input_dev *input_dev;
+	int ret;
+
+	d = devm_kzalloc(&wdev->dev, sizeof(*d), GFP_KERNEL);
+	if (!d)
+		return -ENOMEM;
+
+	d->wdev = wdev;
+
+	input_dev = devm_input_allocate_device(&wdev->dev);
+	if (!input_dev)
+		return -ENOMEM;
+
+	input_dev->name		= "Lenovo Yoga Book 9 keyboard dock switch";
+	input_dev->phys		= YB9_KBDOCK_QUERY_GUID "/input0";
+	input_dev->id.bustype	= BUS_HOST;
+	input_set_capability(input_dev, EV_SW, SW_TABLET_MODE);
+
+	ret = input_register_device(input_dev);
+	if (ret)
+		return ret;
+
+	d->input_dev		= input_dev;
+	d->nb.notifier_call	= yb9_kbdock_nb_call;
+
+	ret = devm_yb9_kbdock_register_notifier(&wdev->dev, &d->nb);
+	if (ret)
+		return ret;
+
+	dev_set_drvdata(&wdev->dev, d);
+	yb9_kbdock_sync(d);
+	return 0;
+}
+
+static const struct wmi_device_id yb9_kbdock_block_id_table[] = {
+	{ .guid_string = YB9_KBDOCK_QUERY_GUID },
+	{ }
+};
+
+static struct wmi_driver yb9_kbdock_block_driver = {
+	.driver = {
+		.name		= "lenovo-yb9-kbdock",
+		.dev_groups	= yb9_kbdock_groups,
+		.pm		= pm_sleep_ptr(&yb9_kbdock_pm_ops),
+	},
+	.id_table	= yb9_kbdock_block_id_table,
+	.no_singleton	= true,
+	.probe		= yb9_kbdock_block_probe,
+};
+
+/* ------------------------------------------------------------------
+ * Event WMI driver — LENOVO_BTKBD_EVENT
+ * (fires the notifier chain on each WMI event)
+ * ------------------------------------------------------------------ */
+
+static void yb9_kbdock_notify_new(struct wmi_device *wdev,
+				  const struct wmi_buffer *data)
+{
+	/*
+	 * _WED(0xEB) returns EC.BKBD directly as a 32-bit integer
+	 * (LENOVO_BTKBD_EVENT WmiDataId(1) uint32 Status).
+	 */
+	if (!data || data->length < sizeof(__le32))
+		return;
+
+	u32 bkbd = le32_to_cpu(*(const __le32 *)data->data);
+
+	blocking_notifier_call_chain(&yb9_kbdock_chain_head, bkbd, NULL);
+}
+
+static const struct wmi_device_id yb9_kbdock_event_id_table[] = {
+	{ .guid_string = YB9_KBDOCK_EVENT_GUID },
+	{ }
+};
+MODULE_DEVICE_TABLE(wmi, yb9_kbdock_event_id_table);
+
+static struct wmi_driver yb9_kbdock_event_driver = {
+	.driver = {
+		.name = "lenovo-yb9-kbdock-event",
+	},
+	.id_table	= yb9_kbdock_event_id_table,
+	.no_singleton	= true,
+	.notify_new	= yb9_kbdock_notify_new,
+};
+
+/* ------------------------------------------------------------------
+ * Module init / exit
+ * ------------------------------------------------------------------ */
+
+static const struct dmi_system_id yb9_kbdock_dmi_table[] __initconst = {
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
+static int __init yb9_kbdock_init(void)
+{
+	int ret;
+
+	if (!dmi_check_system(yb9_kbdock_dmi_table))
+		return -ENODEV;
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
+
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


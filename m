Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC603624B3
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Jun 2026 14:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781620519; cv=none; b=HP+N6i4/ej3EGxSAr6o3/lwrESde1r/P3Oa35/5EOFY8SPnxjLCBEFHV2cAw2vLkaz2YcraZHIzUoS3EReihKgJMMvwdH/OLG/XdieryMa6oxbwN4f4NkJRYXy8Olp9JrGSkyshWLhxLJ2ic+m9yVSxUee8qxeZJGP16dhNz86Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781620519; c=relaxed/simple;
	bh=6C3ANMP+mzDQjvI3eSuDFsG2lP4XZd+jqj4p7irPccA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m+ZwPgZfkVtwajyfu+F/N3obvUKOUWFtrdM0BLNb0cmkOShRd2y3FxM+zZUkWjpwRZ1V8xlx1Yilzk3F9EK/E/Ki0ki+DIKsWChsbe6k2h9PvUbt18h04tCtyYSI5F1BT4kuFWuIja7y9V3b5nC5BwmaoP1op9ZP5AjnZOGybyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MXBhTd7i; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MXBhTd7i"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5176a2fd597so42735611cf.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 Jun 2026 07:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781620517; x=1782225317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xm9j2vZyCtUCCHe6kd4kvUsAYrvf/1Hy2l5em8F5zK8=;
        b=MXBhTd7iwMdOSWG54ijzio2CjOIZPCe67uXzm7phdH/qheoJ1F/crADW4zHNtmbFjB
         rRLgSeiPQHY2uQjS9p2Ny/PI9L7AgwDHxoEhOz1xtVpGDc2dpZaWXJGcig33gNT9sgT0
         KNLti0uRCLMoQsOM2XLKZV1f1/eJMD8LLsRgyOz3/q+X+Rh6ev6cibgntbGJCQMiyUAN
         UbVAdEcZ8YQqtagbYHAaKlp/AO6IFIRPJ9+MNiEDeT7So8PLYbAQ2xB/gSPYDPCjq3S1
         /HPCoYbHwlXd0Uc4rtkNu/+tkncNDO7gyBJmvdoD3HoYqYnJWO2eQaQCTeK83aMAboSG
         N8jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781620517; x=1782225317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xm9j2vZyCtUCCHe6kd4kvUsAYrvf/1Hy2l5em8F5zK8=;
        b=TsNpDit14Eni6sYfZpwwitucan9e5vxR+07RVkBFXGt2lE2dFusWKaOzX83/IpTvLe
         5ETwpcwPW6lyqQQESrS20p9kWZ/kd533QbbIuHbEpt57XbejXJz2pcF97SU/pZlUfpz0
         LVRhdG50kcKF17Wh/lcD8GgDg69q9CJ9OjRuKeDQ1LxRX8hi0rKiNlofUmu8XMR59fBm
         sMuUSMBM41z7HkZaY6QbYXqmNyouWb3PLCk5zq2oO+jojKYmXZLfCF3dwBYIYfQCIstN
         g/CUhenVT/+tz/cV+Y6tcQxyyEkCfPbbdC3Cqv84ZJ/pPtFGrr/lt7KEOh/oFZeJS6Ar
         4G7A==
X-Forwarded-Encrypted: i=1; AFNElJ/Z0gtaWiY9uny9EJvUl+AfqFRdArtAe4wgIMFlX7y1r7f4CENBObxKT2iLqZo6kiadvsokifkitWroSp/qRK7A3YTx@vger.kernel.org
X-Gm-Message-State: AOJu0YyZihusXW2VFkCAWoR7VwqE2pLMZmc1qRDj1N6k2i59nGwELmGs
	WcqbKbYfVcrtGKjt6FY+GcU80w4/eB6GNC3EboNt3+naLNOK/ex2Ppke
X-Gm-Gg: Acq92OEpi+bylNUJNG6eHthIusPQN2LTjMuFqD7pmQkENCB6E85uNbBF6pWb2OrUqYS
	FB+Mf6fAuH4u2nFfa3g3udFWd8z558a8/Or0iTuC3VnVFrPcJX7GjfYztBPOyvro8W9HYUBueST
	VFn9OWO1Jciaj7ybpIAmsixiyQRG2nOU0/09qC7txggRFCW1ZB1OILsw4ErKMYCwFJQRQVEEUSX
	hOJe0CeiarzOAJJ4RwF6IE/Jm48L16mW1WWHZHRNuAIcGuf9tjR74E0g3d9T0sx86IzcFHbfBtW
	gMB7DpT1QregWjx1Kup0ODm7QL410zukwUsZxJGulTne8NFbx5wB7GTZ//noHzn5bwuGvERaKKp
	emYqiy6GUS2j//IvJTwmj8Q1ImtCJouFAYhKUKdsFZVzq86OSElzwSUKRG40WjkAqGu0w05rORv
	3FHp4/TpozvvDKvzYYOben2lBvZ0Ub89p5/6rmdIba/ZBLgBtlmokPXZ8ZcL3r/7fP/Lbm
X-Received: by 2002:a05:622a:4a13:b0:516:d60f:6438 with SMTP id d75a77b69052e-517fdcedb78mr279949951cf.0.1781620516476;
        Tue, 16 Jun 2026 07:35:16 -0700 (PDT)
Received: from fedora (pool-100-11-178-145.phlapa.fios.verizon.net. [100.11.178.145])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb7a3c4asm141855521cf.14.2026.06.16.07.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 07:35:16 -0700 (PDT)
From: Dave Carey <carvsdriver@gmail.com>
To: W_Armin@gmx.de,
	platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	Dave Carey <carvsdriver@gmail.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: [PATCH v9 2/2] platform/x86/lenovo: Add Yoga Book 9 keyboard dock detection driver
Date: Tue, 16 Jun 2026 10:35:08 -0400
Message-ID: <20260616143508.124122-3-carvsdriver@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260616143508.124122-1-carvsdriver@gmail.com>
References: <20260610155340.342949-1-carvsdriver@gmail.com>
 <20260616143508.124122-1-carvsdriver@gmail.com>
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
Signed-off-by: Dave Carey <carvsdriver@gmail.com>
---
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


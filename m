Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF08632939C
	for <platform-driver-x86@vger.kernel.org>; Sun, 19 Apr 2026 10:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776594512; cv=none; b=pvrtDe9gXjevmHK8+kLCRTlMFqqvHGU5hANt9ZfYkDdZMppMYqOjNhAYoULEnlS0m8+1f3odgdz+fSQgu6s1tUBB41ol2N3ncbgVRfHF6oQdKcDjG8buucK9p58iHmObo6E6xoKLYqEW/w3AwoEXvSkMO8wsouXN5LKVbwR32pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776594512; c=relaxed/simple;
	bh=4iJ1gv72UrEH9ch7bOz66/scCDLY1/qX+e5zfeb5yWA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z4eP1Im7F2dI9N0k1nKVW9EIhSTTLzfGxIgVp0aFz08wyMlzsv8/pBU3aWk0TrMd9NGqh+t9vicS+DTojOWo/KfWe32KzcxtKqWLKBVDEDCEkZlzDrw3tt6fbw7aWwxnXLhnHtPWiSyu9lsevnb1oT8Pw7vIM5U0BOsruX0JFZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=peQcvska; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="peQcvska"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43fea39e066so1157406f8f.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 19 Apr 2026 03:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1776594508; x=1777199308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NrNKL6waj+m8gxH0wqqXUCobj5ffrCP96TQS8MeVnFg=;
        b=peQcvskawP9lJEKvRWu7DTFYR5trvUfA4Db4BONZDtLXPKphbC7CokgNHVS3ahBP4c
         KbsG+1BiEFDUDW8Fr32NV3iKwyyBSMr9tsOg91oSWyuArE1PuiWJFiHsflKExPPSvyiT
         fWyOW64PrvUJoKq+wYDT4XYjX864vjKw4zj1iHnzZCrrRAedqYq9y9nAUsj7z9qea0F0
         HSgatF7k68Dp4PQSqgkrzSrajZxn9ozzgEpCUEdieI+c5uHA804kwW2eib8bS6xphXP4
         RmAdZCnoVLiahjM3Ov6UpmLyhoPku9rEEGckLhBUXY8b5Qo5Yw88oDW153YJ1JjtzqNm
         MJ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776594508; x=1777199308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NrNKL6waj+m8gxH0wqqXUCobj5ffrCP96TQS8MeVnFg=;
        b=hLCU4g+4zmeocwO8gRnCBLUD2mBIDThncV1X9hGFV3Xjr/jii0dGXotb+aoxykXGY+
         jJz1OBnwp0Sb6y+2tTHi0fhNmUTCq37732qd+VeiOwkWvDeJrmvC5Ldu3qliQkM+vvD8
         FUvEbFVgs3XfY2mTj2rC2hyrCO20P04vmMyN7wdgGCiKslDuupQWPodoWz2ol+cX8ISg
         C1JRNbo7UPNCebWRg3pycMqa/FfPGUjTZ/1nDZHrS2XMpH+UkcUo0vzxAPN89gI9PxBh
         eIVZMi+RiI/i6l9C1PltgqQxFi2SxBKoj05fwTQdzvTa2yoto6S9FqpMSqBpZMeuVTzx
         LBIg==
X-Forwarded-Encrypted: i=1; AFNElJ/pK09W8oEVFmBcnKHhmv7lnhsPGR9h2mID5g1aLL2jLUocwZSHZMmcjGZc3iLL5pyeH7cZ4zndDt91f2qcaXkh+JUS@vger.kernel.org
X-Gm-Message-State: AOJu0YzEc49GVu1Yfl4t5cmM1dI1Rv8YH94K1ozvj8Q6pg/SWvip2n/m
	hH52tE79XJbxLOhDuZ0oIsnAncCY+u5fbmTA1IgJx8zWRGItC8d9m3TxZIrV/pnAaQ==
X-Gm-Gg: AeBDiet/v5XC3Vw7ZRwyu0w4xSdaS2dnLqHzBrBBy4Pe4bXPLOiNOqg+reBAKWOWVYO
	gqw9UrHrs6cXBlMcIdP7NQfoQjtibLP70DvOenMXYwNYBgksqyn8ddynGi7nXIFxC6OC1iHFrHs
	aBWlc54PV+J60X32NZ0Uh6xMVbO998hPBdynbrLpYllRzlkbjj83i4zLUt6cflk49OpI8VrtuAw
	h6YJiHHr46aM/kSKmA0Nz1gvBAhZoXRSjQVmnxVQes9Gb2sLX08hdd/7mkib7yX4f15c5oyCtMl
	6rnq4uRo/43JI8Sd+aqvgA0J/OOQy9VEzD5BzhlUxbL62cDG7UfpcWnatvbifPiJxNHFZWpbL1u
	CnDEzLnC0OoK5FGsixKb1td94o8Kq2BCYlePdW/0+VZ2jybnumXvyr8hdZv7JclNQA5QFRPvt5Z
	RRkWVo18Bpzwv35JctJaF5UIkLNFgXLjvk/EdAvCzRzmORdVsGsXB5lKQpYbxVXtrMk5G6L4yJX
	saSBV2w/9q+k7Q6gpmfYLE8oWFXGvyjgP8BvCkP
X-Received: by 2002:a5d:5889:0:b0:439:b60a:b400 with SMTP id ffacd0b85a97d-43fe3e0be70mr13215631f8f.31.1776594507770;
        Sun, 19 Apr 2026 03:28:27 -0700 (PDT)
Received: from pit-c621e.speedport.ip (p4ffa8da1.dip0.t-ipconnect.de. [79.250.141.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb1176sm20604438f8f.3.2026.04.19.03.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 03:28:27 -0700 (PDT)
From: Pit Henrich <pithenrich2d@googlemail.com>
X-Google-Original-From: Pit Henrich <pithenrich2d@gmail.com>
To: hmh@hmh.eng.br
Cc: mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pithenrich2d@gmail.com
Subject: [PATCH v2] platform/x86: thinkpad-acpi: Add X1 Fold keyboard attachment detection
Date: Sun, 19 Apr 2026 12:27:24 +0200
Message-ID: <20260419102724.91451-1-pithenrich2d@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ThinkPad X1 Fold 16 Gen 1 firmware reports whether the keyboard is magnetically
attached (on the screen), but thinkpad-acpi does not expose this to userspace.
The state can be obtained via ACPI methods: GDST (get device state).

Add a read-only keyboard_attached_on_screen sysfs attribute, gated by
a DMI match. The state is read directly from the EC.

Cache the state and emit a sysfs notification on
TP_HKEY_EV_TABLET_CHANGED (0x60c0) when it changes. Initialize the cache during
hotkey setup and refresh it before the resume notification to keep the state
consistent across suspend and resume.

Signed-off-by: Pit Henrich <pithenrich2d@gmail.com>
---
This replaced the v1 patch in:
https://lore.kernel.org/all/20260314142236.74514-1-pithenrich2d@gmail.com/

Changes v1 -> v2:
 * Use ACPI method instead of using the EC directly (thanks Mark).

---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 85 ++++++++++++++++++++-
 1 file changed, 83 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 8982d92dfd97..b57ae7eb5548 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -218,8 +218,9 @@ enum tpacpi_hkey_event_t {
 	TP_HKEY_EV_LID_OPEN		= 0x5002, /* laptop lid opened */
 	TP_HKEY_EV_TABLET_TABLET	= 0x5009, /* tablet swivel up */
 	TP_HKEY_EV_TABLET_NOTEBOOK	= 0x500a, /* tablet swivel down */
-	TP_HKEY_EV_TABLET_CHANGED	= 0x60c0, /* X1 Yoga (2016):
-						   * enter/leave tablet mode
+	TP_HKEY_EV_TABLET_CHANGED	= 0x60c0, /* posture change event:
+						   * X1 Yoga (2016): enter/leave tablet mode
+						   * X1 Fold 16 Gen 1: keyboard attachment state changed
 						   */
 	TP_HKEY_EV_PEN_INSERTED		= 0x500b, /* tablet pen inserted */
 	TP_HKEY_EV_PEN_REMOVED		= 0x500c, /* tablet pen removed */
@@ -375,6 +376,7 @@ static struct {
 	u32 has_adaptive_kbd:1;
 	u32 kbd_lang:1;
 	u32 trackpoint_doubletap:1;
+	u32 has_keyboard_attached_on_screen:1;
 	struct quirk_entry *quirks;
 } tp_features;
 
@@ -2928,6 +2930,63 @@ static void hotkey_tablet_mode_notify_change(void)
 			     "hotkey_tablet_mode");
 }
 
+static bool keyboard_attached_on_screen;
+static bool keyboard_attached_on_screen_initialized;
+
+static int x1_fold_keyboard_attached_on_screen_get(bool *attached)
+{
+	int state;
+
+	if (!tp_features.has_keyboard_attached_on_screen)
+		return -ENODEV;
+
+	if (!acpi_evalf(NULL, &state, "\\_SB.DEVD.GDST", "d"))
+		return -EIO;
+
+	*attached = state != 0;
+	return 0;
+}
+
+static ssize_t keyboard_attached_on_screen_show(struct device *dev,
+						struct device_attribute *attr,
+						char *buf)
+{
+	bool attached;
+	int res;
+
+	res = x1_fold_keyboard_attached_on_screen_get(&attached);
+	if (res)
+		return res;
+
+	return sysfs_emit(buf, "%d\n", attached);
+}
+
+static DEVICE_ATTR_RO(keyboard_attached_on_screen);
+
+static void keyboard_attached_on_screen_notify_change(void)
+{
+	if (tp_features.has_keyboard_attached_on_screen)
+		sysfs_notify(&tpacpi_pdev->dev.kobj, NULL,
+			     "keyboard_attached_on_screen");
+}
+
+static bool keyboard_attached_on_screen_update(void)
+{
+	bool attached;
+
+	if (x1_fold_keyboard_attached_on_screen_get(&attached))
+		return false;
+
+	if (keyboard_attached_on_screen_initialized &&
+	    keyboard_attached_on_screen == attached)
+		return false;
+
+	keyboard_attached_on_screen = attached;
+	keyboard_attached_on_screen_initialized = true;
+
+	return true;
+}
+
 /* sysfs wakeup reason (pollable) -------------------------------------- */
 static ssize_t hotkey_wakeup_reason_show(struct device *dev,
 			   struct device_attribute *attr,
@@ -3032,6 +3091,7 @@ static struct attribute *hotkey_attributes[] = {
 	&dev_attr_hotkey_adaptive_all_mask.attr,
 	&dev_attr_hotkey_recommended_mask.attr,
 	&dev_attr_hotkey_tablet_mode.attr,
+	&dev_attr_keyboard_attached_on_screen.attr,
 	&dev_attr_hotkey_radio_sw.attr,
 #ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
 	&dev_attr_hotkey_source_mask.attr,
@@ -3046,6 +3106,9 @@ static umode_t hotkey_attr_is_visible(struct kobject *kobj,
 	if (attr == &dev_attr_hotkey_tablet_mode.attr) {
 		if (!tp_features.hotkey_tablet)
 			return 0;
+	} else if (attr == &dev_attr_keyboard_attached_on_screen.attr) {
+		if (!tp_features.has_keyboard_attached_on_screen)
+			return 0;
 	} else if (attr == &dev_attr_hotkey_radio_sw.attr) {
 		if (!tp_features.hotkey_wlsw)
 			return 0;
@@ -3462,6 +3525,7 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 	}
 
 	tabletsw_state = hotkey_init_tablet_mode();
+	keyboard_attached_on_screen_update();
 
 	/* Set up key map */
 	keymap_id = tpacpi_check_quirks(tpacpi_keymap_qtable,
@@ -3842,6 +3906,8 @@ static bool hotkey_notify_6xxx(const u32 hkey, bool *send_acpi_ev)
 	case TP_HKEY_EV_TABLET_CHANGED:
 		tpacpi_input_send_tabletsw();
 		hotkey_tablet_mode_notify_change();
+		if (keyboard_attached_on_screen_update())
+			keyboard_attached_on_screen_notify_change();
 		*send_acpi_ev = false;
 		return true;
 
@@ -3998,6 +4064,8 @@ static void hotkey_resume(void)
 	tpacpi_send_radiosw_update();
 	tpacpi_input_send_tabletsw();
 	hotkey_tablet_mode_notify_change();
+	keyboard_attached_on_screen_update();
+	keyboard_attached_on_screen_notify_change();
 	hotkey_wakeup_reason_notify_change();
 	hotkey_wakeup_hotunplug_complete_notify_change();
 	hotkey_poll_setup_safe(false);
@@ -4296,6 +4364,17 @@ static const struct dmi_system_id fwbug_list[] __initconst = {
 	{}
 };
 
+static const struct dmi_system_id keyboard_attached_on_screen_list[] __initconst = {
+	{
+		.ident = "ThinkPad X1 Fold 16 Gen 1",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "ThinkPad X1 Fold 16 Gen 1"),
+		},
+	},
+	{}
+};
+
 static const struct pci_device_id fwbug_cards_ids[] __initconst = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x24F3) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x24FD) },
@@ -12230,6 +12309,8 @@ static int __init thinkpad_acpi_module_init(void)
 	dmi_id = dmi_first_match(fwbug_list);
 	if (dmi_id)
 		tp_features.quirks = dmi_id->driver_data;
+	tp_features.has_keyboard_attached_on_screen =
+		dmi_check_system(keyboard_attached_on_screen_list);
 
 	/* Device initialization */
 	tpacpi_pdev = platform_device_register_simple(TPACPI_DRVR_NAME, PLATFORM_DEVID_NONE,
-- 
2.43.0


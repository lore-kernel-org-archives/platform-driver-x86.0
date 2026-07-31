Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99BD3C76BC
	for <platform-driver-x86@vger.kernel.org>; Fri, 31 Jul 2026 08:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785486520; cv=none; b=NeZo2q9usD1hc9eXqYRHHGbADfJUOFi49h1qzAYfMinByYmtDDsJ9rVJpTSadJFVYiymKZyPrpmIanQS6QlAWuUMDBze5sa3tAVQg5koXAkyi5fw/BjMrMd58yU1WYsWvxB/gX1a12zdG4kLFyGw5IGMfvg97yxaXgDtKtRB2l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785486520; c=relaxed/simple;
	bh=UJwcRhwcAm345qX7xpdsr+pBH4SyAhSqu0YOyt77/jg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=msKk2YiDOMtC9XNUrV8sPhhLfN3L5TH7+A1kmo9sNVqU71Zvi9ve9eUn5v4P4PNTbGWbmLvt2CYX8KJ5RAcj1i65Hno1hw8VpSneybUc/ySvIgqlKDw4GxirPMzOrpYvwPPSJtjdoMlk48v0TtEu5ukTHP0xw98jR7Xc7SJ6Kcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=GQXRlDws; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="GQXRlDws"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-69f2c67650aso1098762a12.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 31 Jul 2026 01:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1785486517; x=1786091317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v8Db4xK6p2ZIwj/YaIBTMFgWUnQscWvkT46GpYRR4pw=;
        b=GQXRlDwszE1YN4UioL7hzmBxhn6gczcNbhOeW/04EA1xZe5L3LQj9B7G1C+r1hDguR
         47rG8+8ixQNkxR5MldGPnMs07WlKGboQL69ZI3vuJ9r8Fg2FDCw5ZkgT4TDGUHKPikEB
         yrbA1Zv9/a2k+8rkwH3Gdeci6HSWAcMvgoQw32bbp4m4mA3BY0PL19oKGriEPuHHJgV/
         w3CeARwY073lQM7CyCpUvMlrT2QK0MvYoG73GARpkJxM3cu971M3WkEaW5MV4d53kds2
         fE9Ow5dgUWjhZhQbsVlOf2QFUqGJmvpY3vhrHap8ahOzZ88GQWRJHaRGipXwN9RjoLEr
         eQuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785486517; x=1786091317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v8Db4xK6p2ZIwj/YaIBTMFgWUnQscWvkT46GpYRR4pw=;
        b=r6t1MTRh8Q/kowJWU6ou8jo/EytCok0/banQxT+JLbTlbxI3R1EvNzfO58v1j8l3PP
         fYLPke5E/4IOlZWFUwaUbY8j1dVMYnWtzJjWtg3xP8Ab0Lg1yXrNkBgOqJDtMIBjpZmc
         ZsZiOhw9qI3tuj/ohG2eI8WAkof1UZE8QKjLfn0B8MonvrqRLU2cz4GHpc/lWG2xQ4oe
         tJ6YC/peJLU8CAs24ykQ90ne3ipqFne6bXiT/LYG0et76kuQXPAFAntbYmMWc93Y4+Fa
         zuSlL4e2Jt2ndzMsaLIE17yxiMFCttL6MO4g8gfHt2utJ1D5o/Q0TvO6uNzpU6YjFRzT
         eURw==
X-Forwarded-Encrypted: i=1; AHgh+RpGNzcrSmUrNguOsRSoG/CzRFQcfRAJsaZQkRPgF/aREEHOcewwPU2kmNIG9cwaeeTqHqpUD+r6bLdMi+DOjS1MttqX@vger.kernel.org
X-Gm-Message-State: AOJu0YxQjan2ppYxAl12nrJv3lMpJZCGnpCnuyF8/ub7g0HzoKJ5DDjN
	M7gtlbSuiJzdCRlKZrNswymW/MFyLxP2LRTmzDSPtq/VB0aA0hHivjM=
X-Gm-Gg: AR+sD12bwq9gSFFUYtKuK4HT5wU74OFvExzWF2gAPSgQyUPZHfMrQORV9hFEcWWaukO
	CxFCPHiCAeWfJFagJLjj9TCdOy/ZJGJiDSDeh5hSJkT8Kb6gPM8bLB6+RWLOPtgGNOdQoN6V3mm
	IB4TJU1c3lvflnRFo+c1+mKOVU3iJMWNYtLmthLWz/lvYVrlnfw4/MoclsRquTOT6GX1VOQTz9m
	4mItMZ/f8byun31GIx5CUQIsADeqwxVBHrwe3rA9ya7JX3BjJIgPejlZ6jsO+WBXB2gqyW3woS5
	Vrm94FfRZ4rpajVgTqSVycJDuePNfcOOx16v9DCxqspiH3MOUl9p2kHr4gwHP0ZizJlRaBrlw6D
	Yvx9hfA47PmzuABR56RGH1/Y3LHosfUwvaxJU/F8fRqfzEivpPZeMAl8+ET+g7XfAIFlN716C5W
	vNE7h2LVA2IdAN8oaZCwUyWsCiVyca6g2xLOoYgqtP0gHNwWNX9mqDGzhb9Cj+EJq0O4xhvDmLi
	s2j6JVdhaztmxqorKVnQs4b35LUmTpAe1IKtut6U8tnRGbMll3JHy928Zlpx8Cq7Vs=
X-Received: by 2002:a05:6402:274d:b0:69f:b4f4:4ebb with SMTP id 4fb4d7f45d1cf-6a098cfa4eamr514105a12.36.1785486516739;
        Fri, 31 Jul 2026 01:28:36 -0700 (PDT)
Received: from pit-c621e.lan (p508faa6b.dip0.t-ipconnect.de. [80.143.170.107])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a09c660febsm581023a12.28.2026.07.31.01.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 01:28:36 -0700 (PDT)
From: Pit Henrich <pithenrichmail@googlemail.com>
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
Subject: [PATCH v3] platform/x86: thinkpad-acpi: Add X1 Fold keyboard attachment detection
Date: Fri, 31 Jul 2026 10:28:18 +0200
Message-ID: <20260731082818.1578104-1-pithenrich2d@gmail.com>
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
a DMI match.

Cache the state and emit a sysfs notification on
TP_HKEY_EV_TABLET_CHANGED (0x60c0) when it changes. Initialize the cache during
hotkey setup and refresh it before the resume notification to keep the state
consistent across suspend and resume.

Signed-off-by: Pit Henrich <pithenrich2d@gmail.com>
---
This replaced the v2 patch in:
https://lore.kernel.org/all/20260419102724.91451-1-pithenrich2d@gmail.com/

Changes v1 -> v2:
 * Use ACPI method instead of using the EC directly (thanks Mark).
Changes v2 -> v3:
 * Added documentation to thinkpad-acpi.rst
 * Patched against current thinkpad_acpi.c

---
 .../admin-guide/laptops/thinkpad-acpi.rst     | 26 +++++-
 drivers/platform/x86/lenovo/thinkpad_acpi.c   | 85 ++++++++++++++++++-
 2 files changed, 108 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
index f874db31801d..7873a58cb2f5 100644
--- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
+++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
@@ -583,7 +583,8 @@ Events that are propagated by the driver to userspace:
 0x6030		System thermal table changed
 0x6032		Thermal Control command set completion  (DYTC, Windows)
 0x6040		Nvidia Optimus/AC adapter related (TO BE VERIFIED)
-0x60C0		X1 Yoga 2016, Tablet mode status changed
+0x60C0		X1 Yoga 2016 tablet mode or X1 Fold 16 Gen 1 keyboard
+		attachment state changed
 0x60F0		Thermal Transformation changed (GMTS, Windows)
 ======		=====================================================
 
@@ -1634,6 +1635,29 @@ if damage detected:
 The property is read-only. If feature is not supported then sysfs
 attribute is not created.
 
+X1 Fold keyboard attachment
+---------------------------
+
+sysfs attribute: keyboard_attached_on_screen
+
+ThinkPad X1 Fold 16 Gen 1 systems can report whether the keyboard is
+currently attached on-screen.
+
+This attribute is currently supported on ThinkPad X1 Fold 16 Gen 1
+systems only.
+
+The command to check the keyboard attachment state is::
+
+	cat /sys/devices/platform/thinkpad_acpi/keyboard_attached_on_screen
+
+The values are:
+
+- 0 if the keyboard is not attached on-screen
+- 1 if the keyboard is attached on-screen
+
+The property is read-only. If feature is not supported then the sysfs
+attribute is not created.
+
 Multiple Commands, Module Parameters
 ------------------------------------
 
diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 445e1403308e..66480609ee05 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -219,8 +219,9 @@ enum tpacpi_hkey_event_t {
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
@@ -374,6 +375,7 @@ static struct {
 	u32 has_adaptive_kbd:1;
 	u32 kbd_lang:1;
 	u32 trackpoint_doubletap_enable:1;
+	u32 has_keyboard_attached_on_screen:1;
 	struct quirk_entry *quirks;
 } tp_features;
 
@@ -2888,6 +2890,63 @@ static void hotkey_tablet_mode_notify_change(void)
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
@@ -3017,6 +3076,7 @@ static struct attribute *hotkey_attributes[] = {
 	&dev_attr_hotkey_adaptive_all_mask.attr,
 	&dev_attr_hotkey_recommended_mask.attr,
 	&dev_attr_hotkey_tablet_mode.attr,
+	&dev_attr_keyboard_attached_on_screen.attr,
 	&dev_attr_hotkey_radio_sw.attr,
 	&dev_attr_doubletap_enable.attr,
 #ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
@@ -3032,6 +3092,9 @@ static umode_t hotkey_attr_is_visible(struct kobject *kobj,
 	if (attr == &dev_attr_hotkey_tablet_mode.attr) {
 		if (!tp_features.hotkey_tablet)
 			return 0;
+	} else if (attr == &dev_attr_keyboard_attached_on_screen.attr) {
+		if (!tp_features.has_keyboard_attached_on_screen)
+			return 0;
 	} else if (attr == &dev_attr_hotkey_radio_sw.attr) {
 		if (!tp_features.hotkey_wlsw)
 			return 0;
@@ -3448,6 +3511,7 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 	}
 
 	tabletsw_state = hotkey_init_tablet_mode();
+	keyboard_attached_on_screen_update();
 
 	/* Set up key map */
 	keymap_id = tpacpi_check_quirks(tpacpi_keymap_qtable,
@@ -3828,6 +3892,8 @@ static bool hotkey_notify_6xxx(const u32 hkey, bool *send_acpi_ev)
 	case TP_HKEY_EV_TABLET_CHANGED:
 		tpacpi_input_send_tabletsw();
 		hotkey_tablet_mode_notify_change();
+		if (keyboard_attached_on_screen_update())
+			keyboard_attached_on_screen_notify_change();
 		*send_acpi_ev = false;
 		return true;
 
@@ -3984,6 +4050,8 @@ static void hotkey_resume(void)
 	tpacpi_send_radiosw_update();
 	tpacpi_input_send_tabletsw();
 	hotkey_tablet_mode_notify_change();
+	keyboard_attached_on_screen_update();
+	keyboard_attached_on_screen_notify_change();
 	hotkey_wakeup_reason_notify_change();
 	hotkey_wakeup_hotunplug_complete_notify_change();
 	hotkey_poll_setup_safe(false);
@@ -4282,6 +4350,17 @@ static const struct dmi_system_id fwbug_list[] __initconst = {
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
@@ -12239,6 +12318,8 @@ static int __init thinkpad_acpi_module_init(void)
 	dmi_id = dmi_first_match(fwbug_list);
 	if (dmi_id)
 		tp_features.quirks = dmi_id->driver_data;
+	tp_features.has_keyboard_attached_on_screen =
+		dmi_check_system(keyboard_attached_on_screen_list);
 
 	/* Device initialization */
 	tpacpi_pdev = platform_device_register_simple(TPACPI_DRVR_NAME, PLATFORM_DEVID_NONE,
-- 
2.43.0


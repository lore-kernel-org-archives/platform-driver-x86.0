Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE7C3C1984
	for <platform-driver-x86@vger.kernel.org>; Tue, 25 Aug 2026 19:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787685166; cv=none; b=nBbD/sVMzG+0CB79mwE0WTqW+p89dtyZmp/OpUimFVZaWXmIx76gvvspiZ0juYmbDjKviy8KdEklqUWJRsiLO4ycOfloc2ptSbA0WsbGStOK7rtYt/zHXqKVuhFcEQVHtHB1bwAlEDIW9giG8ibmIjLOp2ang2QufJ7ITbRGA9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787685166; c=relaxed/simple;
	bh=XqxjJtSUdnjazM3wr5TWYfyl1LyM07ShEvX4IgZG5tU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HjQ6rBE5Vjd8JxxEabm5HvyEUxRHOWvQPjwZ0fAhRmfnUmge///Gh/dKbV+xwMELNYCrVwpz9nMS8mEfLm47+Yw1+IGzYhAc6rk4vOJ4Af01ECT27NnYnP+u7vaXmnUIP2ElcINKXWhO4XbdYC7XmhaGc2++9SnmmEndZJN2rFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=K6s0myHo; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="K6s0myHo"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a0c8283146so193086a12.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Aug 2026 12:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1787685162; x=1788289962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wfkp4kamup22HCEjq1R7usjeF6wHMurRheytN/iZwsI=;
        b=K6s0myHouwb8djJWMcjHYb06xl3aKbVn0AwHhYZTEWBACl7myWugzVDSf+k4/bgiPW
         379LRNPcQQPhG+l3+TWrxelHC80SUVRGyMKr8+pZbJ+RD/NWwhQYAzB3vjRX+y0upnOi
         KiH8nI/4zL7jE3M3nUa/rovRvehCZT+Uk5t9mJyBEfcKidTXjrF1zGkweggqwuVkboJs
         i69u2E9gs3GYjDiR4A4wTEvhiICOXo4YSAdO22bLUUsdGelXBs5GU0qdGvlrEh41Govz
         79kWy3mqnucO6JSzwDFSI8MqUwzc8NVIsYS6Jt7jVJCfd8XGyVK3sWVtm8dYLjiRzB7D
         9oSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787685162; x=1788289962;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wfkp4kamup22HCEjq1R7usjeF6wHMurRheytN/iZwsI=;
        b=HRY0g6OSGGniPN2Yv0+ngSzHtcFX8yEQNjU1JESYKKJOUR4hlD/Hk+tDD+73TUTUDj
         9BCAUDARX328YdJPY2KmfFe/LnJncMyp/wXicCyjfAitjLhsNxPqr31yQb3zYjd30E+P
         wfY3B8hwqEOipWTYH61MbmWIXaR+Ny/CP1VRut47hqq2xA6yEm4dkwxnRPQinQDDRR5y
         P8NK4m+tWx/wYVt/ckTI5bUIFym7nkyk5yaBKA64YmmWeL0Gu/PBw5otBryWF7vYp6Oz
         IXfnERHQz3h/2inprxriFmcMgxv82lLFl29zyqZfjUjnkDkzA/7k0yOzOXnB+Vr0oDRW
         pqbw==
X-Forwarded-Encrypted: i=1; AHgh+RoZ4HuPcBOGFezqWeIJECAzNz6WH3HMCps9r1oiv0Jisp4iV+RbB8LN8A8HmLEvuoX6SnEUMiYxYoMSrbn+YQm1DHlk@vger.kernel.org
X-Gm-Message-State: AFuF++nln85olb7WUlpUKTU0hIjRRU0p+PbjQO0FfYPcSjeqnA+wCtJ9
	YNMYyk/VQg8Pq8tcixiQhrmCvIejLcND9WwhJuEY/65VbT/4uy1A4DU=
X-Gm-Gg: AR+sD114G750FyOjSfBc02Xv1YH2s13sDfRl+s+hfI3jRR3bWcdIk0r+1lLr8B3qo6H
	pb+dkKQkXr06XRVUXxy3eGagXS7do+HvdEZil0iD1Xu4EMvn4JTnuo3HHUoM120n2McnaebfgC0
	+rxwqsFUM/HU6vISSYPZ4xZIdV64MTn24P/xg+8ywf6DlKRqStBkhK9B5pJGnpiQw65DkyEg+hK
	tWE9z9jLeodpeWcEh8klcPqX2U74pI65RVh5vfI/Phh95nGGpRAhXcREvKGlxJMDU5+GmxQbqVj
	qs/I4NEX5Hz0oL0bTthEPTRQ3i+0Psnmm3P7zpv6dJxoE+J+36OkIVsmKONUDu8RfzLDa47vNaS
	yrz5xnAXGk5DZQfC5PSEm6dCUsUJxO5Qe0HVz6N0+JZ7z1tuUXO/Nl3ONOkgEzW6vDIEYGP/8fk
	drtP6Z6/vorsI4mHi6BEAq5w//gN7muheD9BqCHBmV5THlCFBu/aaLb72WM9rroe7HPztKCPRS7
	L6zFSK1IG+LE1pBMzkLWJf/ejhtQZ0E6PVxzzgwmbt2RQ==
X-Received: by 2002:a05:6402:3713:b0:6a0:e963:f546 with SMTP id 4fb4d7f45d1cf-6a5df65b4cdmr1546865a12.15.1787685160985;
        Tue, 25 Aug 2026 12:12:40 -0700 (PDT)
Received: from pit-x1 (nat-gw.rrze.uni-erlangen.de. [131.188.6.9])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5de5f7bb8sm999980a12.0.2026.08.25.12.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 12:12:39 -0700 (PDT)
From: Pit Henrich <pithenrichmail@googlemail.com>
X-Google-Original-From: Pit Henrich <pithenrich2d@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: hmh@hmh.eng.br,
	mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pit Henrich <pithenrich2d@gmail.com>
Subject: [PATCH v4] platform/x86: thinkpad-acpi: Add X1 Fold keyboard attachment detection
Date: Tue, 25 Aug 2026 21:12:10 +0200
Message-ID: <20260825191210.55090-1-pithenrich2d@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ThinkPad X1 Fold 16 Gen 1 firmware reports whether the keyboard is
magnetically attached (on the screen), but thinkpad-acpi does not expose
this to userspace. The state can be obtained via ACPI methods: GDST (get
device state).

Add a read-only keyboard_attached_on_screen sysfs attribute, gated by
a DMI match.

Cache the state and emit a sysfs notification on
TP_HKEY_EV_TABLET_CHANGED (0x60c0) when it changes. Initialize the
cache during hotkey setup and refresh it before the resume notification
to keep the state consistent across suspend and resume.

Signed-off-by: Pit Henrich <pithenrich2d@gmail.com>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
This replaces the v3 patch:
https://lore.kernel.org/all/20260731082818.1578104-1-pithenrich2d@gmail.com/

Changes v1 -> v2:
 * Use ACPI method instead of using the EC directly (thanks Mark).
Changes v2 -> v3:
 * Added documentation to thinkpad-acpi.rst
 * Patched against current thinkpad_acpi.c
Changes v3 -> v4:
 * Rebased onto the current platform-drivers-x86 review-ilpo-next branch.
 * Wrapped long lines reported by checkpatch.

---
 .../admin-guide/laptops/thinkpad-acpi.rst     | 26 +++++-
 drivers/platform/x86/lenovo/thinkpad_acpi.c   | 86 ++++++++++++++++++-
 2 files changed, 109 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
index db4588af0..60bf6868b8 100644
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
 
@@ -1658,6 +1659,29 @@ if damage detected:
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
index 1661f070c..61a63519a9 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -222,8 +222,10 @@ enum tpacpi_hkey_event_t {
 	TP_HKEY_EV_LID_OPEN		= 0x5002, /* laptop lid opened */
 	TP_HKEY_EV_TABLET_TABLET	= 0x5009, /* tablet swivel up */
 	TP_HKEY_EV_TABLET_NOTEBOOK	= 0x500a, /* tablet swivel down */
-	TP_HKEY_EV_TABLET_CHANGED	= 0x60c0, /* X1 Yoga (2016):
-						   * enter/leave tablet mode
+	TP_HKEY_EV_TABLET_CHANGED	= 0x60c0, /* posture change event:
+						   * X1 Yoga (2016): enter/leave tablet mode
+						   * X1 Fold 16 Gen 1: keyboard
+						   * attachment state changed
 						   */
 	TP_HKEY_EV_PEN_INSERTED		= 0x500b, /* tablet pen inserted */
 	TP_HKEY_EV_PEN_REMOVED		= 0x500c, /* tablet pen removed */
@@ -379,6 +381,7 @@ static struct {
 	u32 kbd_lang:1;
 	u32 trackpoint_doubletap_enable:1;
 	u32 usbc_security_supported:1;
+	u32 has_keyboard_attached_on_screen:1;
 	bool usbc_security_enabled;
 	struct quirk_entry *quirks;
 } tp_features;
@@ -2893,6 +2896,63 @@ static void hotkey_tablet_mode_notify_change(void)
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
@@ -3022,6 +3082,7 @@ static struct attribute *hotkey_attributes[] = {
 	&dev_attr_hotkey_adaptive_all_mask.attr,
 	&dev_attr_hotkey_recommended_mask.attr,
 	&dev_attr_hotkey_tablet_mode.attr,
+	&dev_attr_keyboard_attached_on_screen.attr,
 	&dev_attr_hotkey_radio_sw.attr,
 	&dev_attr_doubletap_enable.attr,
 #ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
@@ -3037,6 +3098,9 @@ static umode_t hotkey_attr_is_visible(struct kobject *kobj,
 	if (attr == &dev_attr_hotkey_tablet_mode.attr) {
 		if (!tp_features.hotkey_tablet)
 			return 0;
+	} else if (attr == &dev_attr_keyboard_attached_on_screen.attr) {
+		if (!tp_features.has_keyboard_attached_on_screen)
+			return 0;
 	} else if (attr == &dev_attr_hotkey_radio_sw.attr) {
 		if (!tp_features.hotkey_wlsw)
 			return 0;
@@ -3453,6 +3517,7 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 	}
 
 	tabletsw_state = hotkey_init_tablet_mode();
+	keyboard_attached_on_screen_update();
 
 	/* Set up key map */
 	keymap_id = tpacpi_check_quirks(tpacpi_keymap_qtable,
@@ -3833,6 +3898,8 @@ static bool hotkey_notify_6xxx(const u32 hkey, bool *send_acpi_ev)
 	case TP_HKEY_EV_TABLET_CHANGED:
 		tpacpi_input_send_tabletsw();
 		hotkey_tablet_mode_notify_change();
+		if (keyboard_attached_on_screen_update())
+			keyboard_attached_on_screen_notify_change();
 		*send_acpi_ev = false;
 		return true;
 
@@ -3989,6 +4056,8 @@ static void hotkey_resume(void)
 	tpacpi_send_radiosw_update();
 	tpacpi_input_send_tabletsw();
 	hotkey_tablet_mode_notify_change();
+	keyboard_attached_on_screen_update();
+	keyboard_attached_on_screen_notify_change();
 	hotkey_wakeup_reason_notify_change();
 	hotkey_wakeup_hotunplug_complete_notify_change();
 	hotkey_poll_setup_safe(false);
@@ -4287,6 +4356,17 @@ static const struct dmi_system_id fwbug_list[] __initconst = {
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
@@ -12360,6 +12440,8 @@ static int __init thinkpad_acpi_module_init(void)
 	dmi_id = dmi_first_match(fwbug_list);
 	if (dmi_id)
 		tp_features.quirks = dmi_id->driver_data;
+	tp_features.has_keyboard_attached_on_screen =
+		dmi_check_system(keyboard_attached_on_screen_list);
 
 	/* Device initialization */
 	tpacpi_pdev = platform_device_register_simple(TPACPI_DRVR_NAME, PLATFORM_DEVID_NONE,
-- 
2.53.0


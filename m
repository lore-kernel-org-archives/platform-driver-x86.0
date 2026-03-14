Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BEA239E76
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Mar 2026 14:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773498169; cv=none; b=opclE0WC3CbxFqMJlFFgVFkqAR4FOB5xxODIdo3dnL0YD6f0X59lSIEguI48rNmwOEHwGb4Nn0cZds+z0ZaMZE2fHOz3LGbMNqFK28+6FrdBMY1Ff2Q9YdDiiQ7KH1Fp2Sz39eMz1kHrLP4CwW46eUrTN3lyTByCunT1fyTN1VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773498169; c=relaxed/simple;
	bh=KcUfzA3kr56W2PxYcIg4uBs8H1ueATWCPNe5K4x/vb0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jffKrt8stauNArwerxE40/IFRM4tZj1TI3cyKPmhcEssW/isfKbDLliNyzYR4uMGyh8JmL9QJcwxlf20ZVb5ejxw/G15foIcwHx34mtrwFthSKV6Wy/JJ7NrSWM+7f323h8+At7cYZNIlr9m3n5M6VcNRH6oGQ4OOySfy0b1/7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=CMzEBnwN; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="CMzEBnwN"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4855dbfc129so8849105e9.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 14 Mar 2026 07:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1773498165; x=1774102965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DHOz8o4MRMcIRWyH11VMkQGW/AcId153GJbCp8QLKQ4=;
        b=CMzEBnwNRXTp0/ZtF5z6TrtNLkJam4r4OLI3j1CK52TYo0eCRvyWqF8N94H6bY2coC
         /zJsUYBP0wChC1kwlC7A3F3uzb7FSfYAMhwhqRZsY7x2pQNeHldgZLvr/vFMYqx1at3y
         BHjPtw2s32zz4MQqCu/4hGvzzDhvhIWtCBd5EXFKQs7e5pSCO2wYno3FsD9trY4laS3P
         7KuDCidmuw/EPIFk1TjKii9ql1dd9Jy0RW5nhVEuoxIBNrGR3/SYxcSqALk0lTqZvJ0l
         zf8ONw7qK+XQ5ltlyGOOEeC/dsYhVF4vvKACrM55HmeJkqWcr/K414qIyynOzAENNoCJ
         hUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773498165; x=1774102965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DHOz8o4MRMcIRWyH11VMkQGW/AcId153GJbCp8QLKQ4=;
        b=eJEd7+LjnU9ZBu501FSZbWto7qKnI1zhg+R3fKGWTFzXR/UnFBRw0wEdNDRdCs5uY3
         8HTtfXdeQ/K8pDBvhUlfy7lHnS5KfpFYIqM4Np8BXdQMsl0nuhbM4bNXaRp4Nak+RZEH
         3SjUjmo1c0UiANTJysrd/ZTCvnwEzId+ei6tR8Czh5dx9qBqAaMBzEyXQsLFQ7ZefZ8i
         oAwLyHxOAB2O1bPlH5T4X9WzS+ZrFJWSdUkHoXcy+ZKjuv8T21V5Bh79NsFCjKERy+H9
         nkPplH7rgLwlVoXkdBn0FJ5pGlEdXf89DcMgnNLDA5J9WJf5fEamVd6Jg1D1bWTWiXvS
         LSWg==
X-Forwarded-Encrypted: i=1; AJvYcCVCPez7qQzQ5UXx5VEov6Tw//uBDNgs/ZLCySGFblV7f72Ge1GDI9XHoaYr1rS8B2DXNgPMzQKylJi3sTNNA37WCgB2@vger.kernel.org
X-Gm-Message-State: AOJu0YwCDOuwvkGXArVtMV02XETiPPII7AmuM4+XAWSanT8d8zizgwdw
	zbJnwigtMySTe8MeHGypYbV40rCx5lZfnQOXCcmxm9UdOohVeW7Zkfc=
X-Gm-Gg: ATEYQzxhg35lNV84Ke/TCG9lAPQ26VkY0ewpc1Z7MuMfFbyVWTaKTCzna16vqKGX0hs
	ve2Nox1NOkJdFLBG/y7far3HUifMFcFuConuIW1U+bvS9wKfnQFvQYiA+sOSyAaKfuIRotTcCWL
	/Y7IrJvfDU5E7OsU8jUMQaUs6JFornFgEMFzIERIX9tOFUHpCWTKO35yrV9uzYHf1tvqrK7R5lJ
	YKKsr9UXDsCJdiLUxU8jZXo4hcR2OcsilsI1sPlv/kRhIwpUDVQMiepqCdu4TSNgnxL39aOA5HZ
	JRJxTOjKEpXFvfhfIvhhe+mZ7hqpLaejOw4lLkFRDbcrt4Yhpvr9E4XTBBqkF4l5njZ51bhk30k
	p+DfMpRbvAF9z8YfDzGQQVqFlgIf8hdk5B2uS3lOt1H4+zmkwi3k3T13BKYgEq7zJu82++S2yXw
	xq6fhLm4nuuXOVoqFDxogcVBO+Yln4XlPk/evTQgOHaj4PPAHgC0C+xBNFWRhccCagFqsBynixF
	G7W3VBpRBAyD9GPBQ==
X-Received: by 2002:a05:600c:4514:b0:483:78c5:d743 with SMTP id 5b1f17b1804b1-48556709e2cmr104979695e9.28.1773498164908;
        Sat, 14 Mar 2026 07:22:44 -0700 (PDT)
Received: from pit-c621e.lan (p508fa9af.dip0.t-ipconnect.de. [80.143.169.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b66ffe2sm262685915e9.13.2026.03.14.07.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 07:22:44 -0700 (PDT)
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
Subject: [PATCH] platform/x86: thinkpad-acpi: Add X1 Fold keyboard attachment detection
Date: Sat, 14 Mar 2026 15:22:35 +0100
Message-ID: <20260314142236.74514-1-pithenrich2d@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ThinkPad X1 Fold 16 Gen 1 firmware reports whether the keyboard is magnetically
attached (on the screen) via EC register 0xc1 bit 7, but thinkpad-acpi does
not expose this to userspace.

Add a read-only keyboard_attached_on_screen sysfs attribute, gated by
a DMI match. The state is read directly from the EC.

Cache the state and emit a sysfs notification on
TP_HKEY_EV_TABLET_CHANGED (0x60c0) when it changes. Initialize the cache during
hotkey setup and refresh it before the resume notification to keep the state
consistent across suspend and resume.

Signed-off-by: Pit Henrich <pithenrich2d@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 92 ++++++++++++++++++++-
 1 file changed, 90 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 8982d92dfd97..5b255062ff51 100644
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
 
@@ -2928,6 +2930,70 @@ static void hotkey_tablet_mode_notify_change(void)
 			     "hotkey_tablet_mode");
 }
 
+/*
+ * On the ThinkPad X1 Fold 16 Gen 1, EC register 0xc1 reports the keyboard
+ * attachment state in bit 7.
+ */
+#define TPACPI_X1_FOLD_KBD_EC_STATUS	0xc1
+#define TPACPI_X1_FOLD_KBD_ATTACHED	BIT(7)
+
+static bool keyboard_attached_on_screen;
+static bool keyboard_attached_on_screen_initialized;
+
+static int x1_fold_keyboard_attached_on_screen_get(bool *attached)
+{
+	u8 status;
+
+	if (!tp_features.has_keyboard_attached_on_screen)
+		return -ENODEV;
+
+	if (!acpi_ec_read(TPACPI_X1_FOLD_KBD_EC_STATUS, &status))
+		return -EIO;
+
+	*attached = status & TPACPI_X1_FOLD_KBD_ATTACHED;
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
@@ -3032,6 +3098,7 @@ static struct attribute *hotkey_attributes[] = {
 	&dev_attr_hotkey_adaptive_all_mask.attr,
 	&dev_attr_hotkey_recommended_mask.attr,
 	&dev_attr_hotkey_tablet_mode.attr,
+	&dev_attr_keyboard_attached_on_screen.attr,
 	&dev_attr_hotkey_radio_sw.attr,
 #ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
 	&dev_attr_hotkey_source_mask.attr,
@@ -3046,6 +3113,9 @@ static umode_t hotkey_attr_is_visible(struct kobject *kobj,
 	if (attr == &dev_attr_hotkey_tablet_mode.attr) {
 		if (!tp_features.hotkey_tablet)
 			return 0;
+	} else if (attr == &dev_attr_keyboard_attached_on_screen.attr) {
+		if (!tp_features.has_keyboard_attached_on_screen)
+			return 0;
 	} else if (attr == &dev_attr_hotkey_radio_sw.attr) {
 		if (!tp_features.hotkey_wlsw)
 			return 0;
@@ -3462,6 +3532,7 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 	}
 
 	tabletsw_state = hotkey_init_tablet_mode();
+	keyboard_attached_on_screen_update();
 
 	/* Set up key map */
 	keymap_id = tpacpi_check_quirks(tpacpi_keymap_qtable,
@@ -3842,6 +3913,8 @@ static bool hotkey_notify_6xxx(const u32 hkey, bool *send_acpi_ev)
 	case TP_HKEY_EV_TABLET_CHANGED:
 		tpacpi_input_send_tabletsw();
 		hotkey_tablet_mode_notify_change();
+		if (keyboard_attached_on_screen_update())
+			keyboard_attached_on_screen_notify_change();
 		*send_acpi_ev = false;
 		return true;
 
@@ -3998,6 +4071,8 @@ static void hotkey_resume(void)
 	tpacpi_send_radiosw_update();
 	tpacpi_input_send_tabletsw();
 	hotkey_tablet_mode_notify_change();
+	keyboard_attached_on_screen_update();
+	keyboard_attached_on_screen_notify_change();
 	hotkey_wakeup_reason_notify_change();
 	hotkey_wakeup_hotunplug_complete_notify_change();
 	hotkey_poll_setup_safe(false);
@@ -4296,6 +4371,17 @@ static const struct dmi_system_id fwbug_list[] __initconst = {
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
@@ -12230,6 +12316,8 @@ static int __init thinkpad_acpi_module_init(void)
 	dmi_id = dmi_first_match(fwbug_list);
 	if (dmi_id)
 		tp_features.quirks = dmi_id->driver_data;
+	tp_features.has_keyboard_attached_on_screen =
+		dmi_check_system(keyboard_attached_on_screen_list);
 
 	/* Device initialization */
 	tpacpi_pdev = platform_device_register_simple(TPACPI_DRVR_NAME, PLATFORM_DEVID_NONE,
-- 
2.43.0


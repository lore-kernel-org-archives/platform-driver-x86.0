Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614F03A963C
	for <platform-driver-x86@vger.kernel.org>; Sat, 13 Jun 2026 22:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781391522; cv=none; b=lMrDxRVZXvgJT1kgjOf6qG65BSVxyqY5Kr1HdbJc0g2d9wtimDMPAOs6T9tm/0oa46s/yxy1KLH1fLxWf+7iLQn0+LiHR2J3mILhxlAp2o/2h5G6dSSi9P7havacN4ahv9heJ3pbJhnEczYeEVYTOzIbehvlESvwDbHC7D0vSrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781391522; c=relaxed/simple;
	bh=/A741uDlGFD2WkGc46FuBg1F/gZV5dKz7KCPBbu/JpE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ttp/Wg7fs6i1FAb0HLzbj0Z4YcpDU72R4xtKOJJoDDwqiWckNt6QL3rB4PuCCpCTCOvnhvDUQzaTBdjrUZPKv709eWEMUpcLyfv141S7NNnH8WEn9A4vluW5CDKmwfjHRyBDHtFQMHUAw3eJUW/gHrlUT5rkvL8gTE6XDDt4K5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CbEiqYM5; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CbEiqYM5"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-36d98c9b596so1350685a91.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 13 Jun 2026 15:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781391519; x=1781996319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IjIDujvFdMaBCuNW6n4kM+LVX7mOvVximLwIuH8gZ8c=;
        b=CbEiqYM560wT7hzkPQ6lE4lKFlksPUtrDyuHVLMz9EBbS3Xtpe87RimXaj6xVM9tbg
         RTqOZ2pYwSqjUVI+x3VsrsLMS9g6qR3WLmms4CACaG2GetXrW5gFQ2bf0Me3UIlXrBOF
         6LgmZgOzH9+nAKe6u2ijszJqFhvMK4GK8cBUyUBjsOdZfTT4T4WLxYFf20bxDZgEQoeY
         O1VZD/7ezuF/nVwG/IZ8BEdiEQsbIauA/R53h+A+R7eD5E3Kcl7lm0zDkh9F3oYkKk/a
         TwtKCJv4GYzNrZyTTRRPZH35/EaFZfGuzItFfI81ayC54ob5VLhnWe0QUs7DPZ4jMNpd
         k9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781391519; x=1781996319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IjIDujvFdMaBCuNW6n4kM+LVX7mOvVximLwIuH8gZ8c=;
        b=qseGzjrBAoBTiJpx1oYd+SF915MIydcFtwy+JB8Ehi5VmXV02tL0aKS3BeutbjAA0Q
         iVOG+l97o+4H0prmQT5hgpW/WfII4paF0N7C2OSzh7XlNMvMQDsjFnkrGxMeQk+XQB2w
         R39tatHsmhl6gaQAN17uLKIygtpm8hkBmZ+tlnKk9uDadYMi8DspdqeKeLs3dLXsFr/e
         D+1k7W/qoiuIMfUSCB+3WzRF/c7+KQUHEoYthpI+tUo5lRJg7++TwlbaFo6a6lHvO2g7
         UckPm8ZEI9Sb+sGaV0DBO+d9c5WhBJSNVZ9dnTuabMAWJ6tGnqBchutNU6PKv7iZpV9A
         w7TQ==
X-Forwarded-Encrypted: i=1; AFNElJ9oTqUPYy+H1ntccNyoTawMWIRr1VUiY+Ra7cLxr6ie8OqOD6v1E69yVeb2+YGigyOcXNExnC4jTzfmPOsQ+PnRCgJp@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhzb+rDIppQ1WMILYWqhv9c8s8G/HoRADvryl+IoJhSs2xUZV7
	deu8CfQve4C0QkgYYlXLsHB5Q3ut1tuvj6fsR9NB9+D987EYXgUMmh4+
X-Gm-Gg: Acq92OFcygCVuCRCL88kHXDY6bNh8mgazWVuY1R0L9GR7Bl8VWskYOxD8D7o/2e4tU4
	LGSFz5BIleMi0kSNz8d6ov5eNYO8105vsqDT10ckiPjLWOhRJFi3AiYrA1q3sFFhRYsJuSJIec8
	LvPGb9a/8pQG7j2uHRsIR1a0Vk+3IDFHeVoLGja+/ChgRjXhxjAkhaOIkCosiMyYTMQgF1Pwl7z
	7lAHmcrf6JfbNb49pMNpoUEC+GQjfDfqZc434vr4YILOBjKp/EXgQ+q/K0920YskM/yUY9HHS9s
	D4yWoCF2Il+6tlSHtRHjdtF6KnVWiRpq1eadfqAsnKM8Q2wVwIeCqGqhNHHPsL1H28T8relxWc0
	Ut+MnyzQFLy/8RyGRCk4sgvpTpsJZ3hlctn1o+R53GLB+qWpgCZIvCj/XraFGzB0OhY+bTG2RPm
	xCPnLSIjtKEEfs6ujt6Bi77Z4RgEOTgWE7uGoFXk9YOCM2/nZA
X-Received: by 2002:a17:90b:56c4:b0:368:147f:bd2b with SMTP id 98e67ed59e1d1-37a03bd1880mr8650897a91.23.1781391518445;
        Sat, 13 Jun 2026 15:58:38 -0700 (PDT)
Received: from c12-ThinkPad-X1-Carbon-Gen-12 ([2400:2410:5f2b:700:f4db:34e:97b1:ad63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a212ab0dcsm6252292a91.15.2026.06.13.15.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 15:58:37 -0700 (PDT)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: mpearson-lenovo@squebb.ca,
	skhan@linuxfoundation.org,
	corbet@lwn.net,
	hmh@hmh.eng.br,
	hansg@kernel.org,
	derekjohn.clark@gmail.com,
	ilpo.jarvinen@linux.intel.com
Cc: linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-doc@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	vsankar@lenovo.com,
	Vishnu Sankar <vishnuocv@gmail.com>
Subject: [PATCH v3] platform/x86: thinkpad_acpi: Add USB-C Security (USCS) support
Date: Sun, 14 Jun 2026 07:57:36 +0900
Message-ID: <20260613225736.30906-1-vishnuocv@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Newer ThinkPad systems expose a USB-C Security (Restricted Mode) feature.
When active, USB-C data connections are disabled while power delivery is
preserved. This is useful for kiosk and physically-secured deployments.

Hardware interface:

The HKEY device exposes a read-only ACPI method USCS():

  Return value bit layout:
    Bit 16 : Capability flag (1 = feature present on this SKU)
    Bit  0 : Current state  (0 = security OFF, 1 = security ON)

The sysfs attribute is read-only.

The Fn+U followed by Fn+S hotkey chord is the only way to toggle the
hardware state.

Hotkey:

Fn+U followed by Fn+S generates HKEY event 0x131e.

sysfs interface:

  /sys/devices/platform/thinkpad_acpi/usb_c_security  (read-only)
  "enabled\n"  -- data connections are currently blocked
  "disabled\n" -- data connections are currently allowed

  The attribute is hidden on SKUs where the USCS capability bit (bit 16)
  is not set, so there is no ABI impact on unsupported hardware.

Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
---
Changes since v2:
- Move usbc_security_enabled out of tp_features bitfield to a bool
  member of tp_features to avoid unsafe concurrent bitfield RMW;
  usbc_security_supported remains a bitfield as it is init-only.
- Pass &tp_features.usbc_security_enabled directly to
  usbc_security_query() removing the local bool intermediary
  in both init and hotkey paths.
- Remove extra blank line before */ in block comment.
- Fix kerneldoc Returns: syntax and rewrite return value description
  to match the int return type.
- Split ternary return into two separate if statements for clarity

Changes since v1:
- Use guard(mutex) from cleanup.h instead of manual mutex_lock/unlock
- Revert usbc_security_query() to return int (-EIO/-ENODEV/0) instead
  of bool to avoid uninitialized *enabled bug on unsupported platforms
- Remove !! when assigning to bool in usbc_security_query()
- Remove dead tp_features.usbc_security_supported check in show()
  since is_visible() already gates the attribute on unsupported SKUs
- Use str_enabled_disabled() from string_choices.h in show()
- Fix uninitialized *enabled bug in tpacpi_usbc_security_init() by
  only assigning usbc_security_enabled after a successful query
---
 .../admin-guide/laptops/thinkpad-acpi.rst     |  24 ++++
 drivers/platform/x86/lenovo/thinkpad_acpi.c   | 116 ++++++++++++++++++
 2 files changed, 140 insertions(+)

diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
index f874db31801d..db4588af0278 100644
--- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
+++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
@@ -1543,6 +1543,30 @@ Values:
 
 	This setting can also be toggled via the Fn+doubletap hotkey.
 
+USB-C Security
+--------------
+
+sysfs: usb_c_security
+
+Reports the current state of the USB-C Security (Restricted Mode) feature
+on supported ThinkPad systems. When enabled, USB-C data connections are
+disabled while power delivery is preserved.
+
+The available command is::
+
+        cat /sys/devices/platform/thinkpad_acpi/usb_c_security
+
+Values:
+
+	* ``enabled``  - USB-C data connections are currently blocked
+	* ``disabled`` - USB-C data connections are currently allowed
+
+The attribute is read-only. The USB-C Security state can only be toggled
+via the Fn+U followed by Fn+S hotkey chord.
+
+The sysfs attribute is not created on platforms that do not support this
+feature.
+
 Auxmac
 ------
 
diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index e1cee42a1683..59b485a57ffe 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -38,6 +38,7 @@
 #include <linux/backlight.h>
 #include <linux/bitfield.h>
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/dmi.h>
 #include <linux/freezer.h>
@@ -66,6 +67,7 @@
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/string.h>
+#include <linux/string_choices.h>
 #include <linux/string_helpers.h>
 #include <linux/sysfs.h>
 #include <linux/types.h>
@@ -185,6 +187,7 @@ enum tpacpi_hkey_event_t {
 	TP_HKEY_EV_AMT_TOGGLE		= 0x131a, /* Toggle AMT on/off */
 	TP_HKEY_EV_CAMERASHUTTER_TOGGLE = 0x131b, /* Toggle Camera Shutter */
 	TP_HKEY_EV_DOUBLETAP_TOGGLE	= 0x131c, /* Toggle trackpoint doubletap on/off */
+	TP_HKEY_EV_USB_C_SECURITY	= 0x131e, /* USB C Security (Fn+U, Fn+S) */
 	TP_HKEY_EV_PROFILE_TOGGLE	= 0x131f, /* Toggle platform profile in 2024 systems */
 	TP_HKEY_EV_PROFILE_TOGGLE2	= 0x1401, /* Toggle platform profile in 2025 + systems */
 
@@ -373,6 +376,8 @@ static struct {
 	u32 has_adaptive_kbd:1;
 	u32 kbd_lang:1;
 	u32 trackpoint_doubletap_enable:1;
+	u32 usbc_security_supported:1;
+	bool usbc_security_enabled;
 	struct quirk_entry *quirks;
 } tp_features;
 
@@ -11265,6 +11270,110 @@ static struct ibm_struct hwdd_driver_data = {
 	.name = "hwdd",
 };
 
+/*************************************************************************
+ * USB-C Security subdriver
+ *
+ * HKEY.USCS(0) is a read-only ACPI method; its argument is ignored.
+ * It always returns:
+ *   bit 16 - USB-C security capability present on this SKU or not
+ *   bit  0 - USB-C Security state (enable or disable)
+ *
+ * Hotkey
+ * ------
+ * 0x131e (Fn+U, Fn+S): firmware toggles USBS before firing the event.
+ * The driver reads back the new state and notifies the sysfs attribute.
+ */
+
+/* USCS() return word bit layout */
+#define USCS_CAP_BIT		BIT(16)	/* capability: feature present on SKU */
+#define USCS_STATUS_BIT		BIT(0)	/* current security state */
+
+static DEFINE_MUTEX(usbc_security_mutex);
+
+/**
+ * usbc_security_query - read current USB-C security state via USCS()
+ * @enabled: out - true when security is ON (data connections blocked)
+ *
+ * Returns:
+ *   0        success, @enabled contains the current state
+ *  -EIO      ACPI evaluation failed
+ *  -ENODEV   capability bit absent; feature not present on this SKU*
+ */
+static int usbc_security_query(bool *enabled)
+{
+	int status;
+
+	guard(mutex)(&usbc_security_mutex);
+	if (!acpi_evalf(hkey_handle, &status, "USCS", "dd", 0))
+		return -EIO;
+
+	if (!(status & USCS_CAP_BIT)) {
+		pr_debug("USCS cap bit absent (raw=0x%x)\n", status);
+		return -ENODEV;
+	}
+
+	*enabled = status & USCS_STATUS_BIT;
+	return 0;
+}
+
+/* sysfs: /sys/devices/platform/thinkpad_acpi/usb_c_security ---------- */
+static ssize_t usb_c_security_show(struct device *dev,
+				   struct device_attribute *attr,
+				   char *buf)
+{
+	return sysfs_emit(buf, "%s\n",
+			  str_enabled_disabled(tp_features.usbc_security_enabled));
+}
+
+static DEVICE_ATTR_RO(usb_c_security);
+
+static struct attribute *usbc_security_attributes[] = {
+	&dev_attr_usb_c_security.attr,
+	NULL,
+};
+
+static umode_t usbc_security_attr_is_visible(struct kobject *kobj,
+					     struct attribute *attr, int n)
+{
+	return tp_features.usbc_security_supported ? attr->mode : 0;
+}
+
+static const struct attribute_group usbc_security_attr_group = {
+	.is_visible = usbc_security_attr_is_visible,
+	.attrs = usbc_security_attributes,
+};
+
+static int tpacpi_usbc_security_init(struct ibm_init_struct *iibm)
+{
+	int err;
+
+	err = usbc_security_query(&tp_features.usbc_security_enabled);
+	if (err == -ENODEV)
+		return 0;
+	if (err)
+		return err;
+
+	tp_features.usbc_security_supported = true;
+	return 0;
+}
+
+/* tpacpi_usbc_security_hotkey - handle Fn+U Fn+S hotkey (0x131e) */
+static bool tpacpi_usbc_security_hotkey(void)
+{
+	if (!tp_features.usbc_security_supported)
+		return false;
+
+	if (usbc_security_query(&tp_features.usbc_security_enabled))
+		return false;
+
+	sysfs_notify(&tpacpi_pdev->dev.kobj, NULL, "usb_c_security");
+	return true;
+}
+
+static struct ibm_struct usbc_security_driver_data = {
+	.name = "usbc_security",
+};
+
 /* --------------------------------------------------------------------- */
 
 static struct attribute *tpacpi_driver_attributes[] = {
@@ -11325,6 +11434,7 @@ static const struct attribute_group *tpacpi_groups[] = {
 	&dprc_attr_group,
 	&auxmac_attr_group,
 	&hwdd_attr_group,
+	&usbc_security_attr_group,
 	NULL,
 };
 
@@ -11479,6 +11589,8 @@ static bool tpacpi_driver_event(const unsigned int hkey_event)
 	case TP_HKEY_EV_PROFILE_TOGGLE2:
 		platform_profile_cycle();
 		return true;
+	case TP_HKEY_EV_USB_C_SECURITY:
+		return tpacpi_usbc_security_hotkey();
 	}
 
 	return false;
@@ -11930,6 +12042,10 @@ static struct ibm_init_struct ibms_init[] __initdata = {
 		.init = tpacpi_hwdd_init,
 		.data = &hwdd_driver_data,
 	},
+	{
+		.init = tpacpi_usbc_security_init,
+		.data = &usbc_security_driver_data,
+	},
 };
 
 static int __init set_ibm_param(const char *val, const struct kernel_param *kp)
-- 
2.51.0


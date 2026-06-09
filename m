Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6406D3C0A0F
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Jun 2026 04:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780978504; cv=none; b=rjWvBmyL4K7SaNRtcoNmLua657/MW3vuess7Pu3d45jWFlp5fwP4RCN3JqX/jzZkH/oeLZoHhPlANF+q4w98PMetpZY9JE2CYIeb376mRgwBOc+KWPqmYCaZnWlVJSq8iiIIAYAQ4ksxuclXM/rWL7GgW7UQnIIHsgft2qfNBqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780978504; c=relaxed/simple;
	bh=E/xl1JvCgeKLcTsv74DlRrmze/TsLnufeI1o4/GZ7bE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZDBdzNZsY4Yzp+tIOmLHYUaF8Ruvb5Cfqa3sfaOChnz2RT4g3JwL7LvldHcTBqYsO6j32HPPMu/ttMTtPYPWBgebY+t+W+6K0cBOIouYIo/OvNRNXuDvGfSeJ977of6rgqG5uF43lUpcAMiJ/1bVFhJvixQkWywOlbgYAQ6c9Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NLCmQN1U; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NLCmQN1U"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36bdb11bf8bso2934061a91.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Jun 2026 21:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780978502; x=1781583302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BgYD1+plAw+i8a8I9KmFfAGKUdU1l1KJmLovt53nB04=;
        b=NLCmQN1UWSbD84lh9iU3KubPv5ZuXWWeVkWEtIxFU+I/nfLAF/qyl9xgppQeogrZDX
         XKO8TNk3jGalidGb84WQ0bQFGakw2HWyRy01jNRqLoDuXE7O4bJgVmEp+DBZqIV9lSn8
         Zn00OAq0QnQhu95e2XqaRujWG7gBjlsRH0zkb1jExXYBEzq75ME9FCKaE2YxBRRHJXCe
         Oo2nhtRqBCZQ6VbPeTr0ozLyxT3sxGtQefHRC16CtBKLjrL3PLqInvdemX89OK4AyNzC
         9LDMYcnuFfuzrIZrsgYkPtsbT+hPuPR2QdxF8cd38otUhzXwmFIh4os758WICd3D/u9p
         Ddlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780978502; x=1781583302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BgYD1+plAw+i8a8I9KmFfAGKUdU1l1KJmLovt53nB04=;
        b=LuJr2p7GnNXckEmResUoyzAcgYoJjb7fZzpon3i8QT/9/y7AR7iJRSahDoDkalc6hg
         DU5aeBv2pgu/1zVC5xHRztx8gpP7XT6vdvjv3HNTEV4LDNyNRBdEc6MEOnJDGOiHgGQU
         kAfwr3TDp9n7PN/mY0aDM7+P6f+Np8BxtS3LH1bBje3OzkGVPI25N/kWvv5uorTkpeOp
         lFP7gExo0sn+tDpiIg5ZVGvEjKpFKhRLEwFm9eHKNhcSMMgA2I6cwoxYNPU1syQXgFe0
         F72SemzSyRp5BWQZpaWy6b2Oohoy+8RLnWNLVcX98SAisi4OhNn8S8qUgsHfZbyvCFko
         Qtog==
X-Forwarded-Encrypted: i=1; AFNElJ/UKpllis9kSOJ8S2kxkj91drzBXiE8VRi6J9GtU7RtMeN79rL6V+xt+/9pdNq1WIsx1qVRIO0j7VGuRTJTSWappUec@vger.kernel.org
X-Gm-Message-State: AOJu0YxqJHQz1l88gS6rqOnc2YbBIiXYxl1HUDzmtCzWafUvWIlexzr+
	/HJBx754Rskap/WOiByGwQ5i4HhIMhxgxNsmDr/G1oRZivTZKj/iz3Id
X-Gm-Gg: Acq92OFAslDQBaIxLdpt7cCgRy/DP67BZ1nVuX7MEZ1ZbWeDxoS0QlmQX60VDdrZ04Q
	6FvQvyoYpFgo2iL0egYVMyDFaPH6vLk5QP6nEH9hmOcSlbyc0RzjnYbrImuJecwkZ6Fk+hzlm/4
	tOVBdkBMv2P1vryg+r7HfyPIUYOMoIhroZzwfWVjZ8fqNtL4dq3ol39++JdnqRMhNh7odPJ2sqR
	Xsj6AMITwjL89u4eSxurjQxe9vfLhc8k1XwB+xFwcbDBBbnNYf6ybELxyrtTarMi924NHaxFXWi
	HcNNNBmFuYDYT+GJHyTbc/xsDiPmTSipSNEjXWFCO7RAz6loaN4RpLIyuprprYWFE6hONgl0jRx
	jK02O+zdI/tFvUATMsLyyDW1pYUwPOVoDJFlnjlb19UKMzJnHlwEHdlKg68NFuwWyk6aXbY6cfg
	ixLR9COgw11vU1WxefW8uttrBqZtutaYHeXjlBfCZi4wPW3+WTdeAokASL7QUa
X-Received: by 2002:a17:903:18e:b0:2be:e3bc:e8e4 with SMTP id d9443c01a7336-2c1e7e50ccamr217301755ad.18.1780978501658;
        Mon, 08 Jun 2026 21:15:01 -0700 (PDT)
Received: from c12-ThinkPad-X1-Carbon-Gen-12 ([2400:2410:5f2b:700:d93d:42a4:f320:1e3f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664ad138sm202962665ad.82.2026.06.08.21.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 21:15:00 -0700 (PDT)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: mpearson-lenovo@squebb.ca,
	hmh@hmh.eng.br,
	hansg@kernel.org,
	corbet@lwn.net,
	derekjohn.clark@gmail.com,
	ilpo.jarvinen@linux.intel.com,
	skhan@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-doc@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	vsankar@lenovo.com,
	Vishnu Sankar <vishnuocv@gmail.com>
Subject: [PATCH v2] platform/x86: thinkpad_acpi: Add USB-C Security (USCS) support
Date: Tue,  9 Jun 2026 13:14:02 +0900
Message-ID: <20260609041402.328509-1-vishnuocv@gmail.com>
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
 drivers/platform/x86/lenovo/thinkpad_acpi.c   | 118 ++++++++++++++++++
 2 files changed, 142 insertions(+)

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
index e1cee42a1683..379769b62c80 100644
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
+	TP_HKEY_EV_USB_C_SECURITY	= 0x131e, /* Toggle USB C Security ON/OFF */
 	TP_HKEY_EV_PROFILE_TOGGLE	= 0x131f, /* Toggle platform profile in 2024 systems */
 	TP_HKEY_EV_PROFILE_TOGGLE2	= 0x1401, /* Toggle platform profile in 2025 + systems */
 
@@ -373,6 +376,8 @@ static struct {
 	u32 has_adaptive_kbd:1;
 	u32 kbd_lang:1;
 	u32 trackpoint_doubletap_enable:1;
+	u32 usbc_security_supported:1;
+	u32 usbc_security_enabled:1;
 	struct quirk_entry *quirks;
 } tp_features;
 
@@ -11265,6 +11270,112 @@ static struct ibm_struct hwdd_driver_data = {
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
+ *
+ */
+
+/* USCS() return word bit layout */
+#define USCS_CAP_BIT		BIT(16)	/* capability: feature present on SKU */
+#define USCS_STATUS_BIT		BIT(0)	/* current security state */
+
+static DEFINE_MUTEX(usbc_security_mutex);
+
+/*
+ * usbc_security_query - read current USB-C security state via USCS()
+ * @enabled: out - true when security is ON (data connections blocked)
+ *
+ * Returns true if the feature is supported and query succeeded,
+ * false otherwise (feature absent or ACPI call failed).
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
+	bool enabled;
+	int err;
+
+	err = usbc_security_query(&enabled);
+	if (err)
+		return err == -ENODEV ? 0 : err;
+
+	tp_features.usbc_security_supported = true;
+	tp_features.usbc_security_enabled = enabled;
+	return 0;
+}
+
+/* tpacpi_usbc_security_hotkey - handle Fn+U Fn+S hotkey (0x131e) */
+static bool tpacpi_usbc_security_hotkey(void)
+{
+	bool enabled;
+
+	if (!tp_features.usbc_security_supported)
+		return false;
+
+	if (usbc_security_query(&enabled))
+		return false;
+
+	tp_features.usbc_security_enabled = enabled;
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
@@ -11325,6 +11436,7 @@ static const struct attribute_group *tpacpi_groups[] = {
 	&dprc_attr_group,
 	&auxmac_attr_group,
 	&hwdd_attr_group,
+	&usbc_security_attr_group,
 	NULL,
 };
 
@@ -11479,6 +11591,8 @@ static bool tpacpi_driver_event(const unsigned int hkey_event)
 	case TP_HKEY_EV_PROFILE_TOGGLE2:
 		platform_profile_cycle();
 		return true;
+	case TP_HKEY_EV_USB_C_SECURITY:
+		return tpacpi_usbc_security_hotkey();
 	}
 
 	return false;
@@ -11930,6 +12044,10 @@ static struct ibm_init_struct ibms_init[] __initdata = {
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


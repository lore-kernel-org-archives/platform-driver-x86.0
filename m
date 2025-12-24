Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4605233EB15
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Dec 2025 09:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766569831; cv=none; b=H+/JM36E0jkmMG5ES2qEuy8DjZcW4Sl2RJA2NwVjdj9343cIP1Nd5A35catU7Me3HIBRC2l7+DFCp22sbdZZTz24Hxaw/8ahJoIL10xbIFEOBFvXifWHilGoNLkyGb1RPzluGNUYfAicaGfFdo28LCtQid2jdeyKGXcXYKgcqVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766569831; c=relaxed/simple;
	bh=w/3g4eFXiT2U/wtv4X17PUxv3CGJizT7pIMWQgZTb+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D9C4uuiMcCY/mItM/JpJ727LzsoEE24isz7bb1ZKkGQ9YVo13OpQO+75h8H3L5Gwc8MBYmurvYXkqXaA2ZznR8G3GGMvyD03kkJDaZTBoIVzC504ZMEoZuKrmFcv/ghmekczwo/Lf3nQ8JjrFQ0IcMYEaZ235MmkbKdNtZNVf5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YC4pP91E; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YC4pP91E"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7f121c00dedso7782624b3a.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Dec 2025 01:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766569829; x=1767174629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WaJr5A7DWbl1OnZBkjyhkL36rVpB6K0V2Wz6wGmu9rU=;
        b=YC4pP91EGnG9Bqeqp8GfjJy6vktXYP/bx8dsSrp22DKbfYh+rxD53ZVRn/dhFhX1Og
         WQ8NFysvHKXDiFADODZ32eYuxKGzVI1oB8H7YKzn6KreVI/J52sxkFuojOR2LeT2EZ4b
         gipw5FHSDxMy+IydCbG7gUl1/8H3qmWrLLYJYyNBq883YLNX8kuvaM+n1JlsqRuKA66k
         DrIYfcZvNF2pIu+lfODo5cvs93SYn/1syyKZc5WDmPdjfVIfu9KoZc7T7TJtY5PlaWxS
         9j+E3jE6j3hmrtqAvntL+jy5vYf1j0i89UV5AGynoA6U6VsExZSd4uYtKNPJ59QnBcDm
         An0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766569829; x=1767174629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WaJr5A7DWbl1OnZBkjyhkL36rVpB6K0V2Wz6wGmu9rU=;
        b=NTd2eN2hwqJjAXPI0SOind+jjAHRX7nFWvGXZkmZqCNYu2tne5rP7NjOsgVKWKgHFx
         Zvbtm4RR2rJCurZCoWWJm3T1tfBEiTgryyH6BexIcJhPBWFdbdaf252pDfi8QU3DJxGh
         oHCmOM3Wy06bbCGYYaP0n+jwv/rZoN8YaXGZkn4zbmYwquubJPj79VxVi26d7R4QE/tK
         9v6ZOOrtBSGz94eXvzeO2//Pf+hgwaXdEzbnaXbEgYhMnKlyuLsGUKlB3epXigOcUzmh
         JRle/2ajTJ+FZq6Yu5GXLhKy5t7Xz3vLQTjlfjXyw3gAZsAFsbBdqFGf+ThsaXWWKu3g
         HLlw==
X-Gm-Message-State: AOJu0YwLTqU0UWy99Q6+J7K3ogxSTd4KQXmEQ9AbcIBoVVETRpKGOKMI
	z0ULv1koHSDIVYjF1Hv7PJpOl6dGpMqzMJHc/OopTlANIgpxpw1v9sF6
X-Gm-Gg: AY/fxX4h5DBtZzYcRVclivbQPCG4S7NeaGuXEDmEY1GpOvmZafFvjNwb1vyuasx9FK9
	cjNn5VP75SKvSY5nei/FnLGaGKGweAaSOlX4OKka6yp+KgHeMj9WJkgM5oBdw+UG6oo5byIueMn
	suKwXczCxs0Qi40mPbztY3cAc3E/INsdnjLxe/WjAEh+bR7nUK0uQY26yomSrErmXLKhgr2Swr2
	cjMtJ4ySLNbjK+XkEEwO1C93jRa4OpKOP+GgfguTTZJIHfsIWi2VIIDIXMxk2QlBpLfivJ1Ib2w
	63j949AfFfG5B5KL5dM6gg43WUNMWufCzP7EjMdizrxzoVHsb8PGSmfs87OeRdtUae5lfBqoteC
	piYRAVWfwa15ctTZnwFLHbM9oiKuVjlkqD0GDGZKhl8BkopV4Dzm1kBWxI3noeDtdNI5KnvPOFp
	xKkRmoT1zvAa3X4+Bbd/rZ8grmlzH52Q==
X-Google-Smtp-Source: AGHT+IHPM5bPrqInHK2p7cXEfYCqIXOJYZAlAdKR/emcwwhFgho45ImPMt2Bf1DENvNHciGXoxucYw==
X-Received: by 2002:a05:6a00:4006:b0:7e8:450c:6196 with SMTP id d2e1a72fcca58-7ff66480856mr16388259b3a.45.1766569829431;
        Wed, 24 Dec 2025 01:50:29 -0800 (PST)
Received: from nitin-ThinkPad-T1g-Gen-8.. ([2405:201:3006:188a:9ac9:e6ff:432:bb3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7aa328basm16372003b3a.11.2025.12.24.01.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 01:50:29 -0800 (PST)
From: Nitin Joshi <nitjoshi@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	njoshi1@lenovo.com,
	Nitin Joshi <nitjoshi@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: [PATCH v6 1/2] platform/x86: thinkpad_acpi: Add support to detect hardware damage detection capability.
Date: Wed, 24 Dec 2025 18:50:18 +0900
Message-ID: <20251224095019.11622-1-nitjoshi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thinkpads are adding the ability to detect and report hardware damage
status. Add new sysfs interface to identify whether hardware damage
is detected or not.

Initial support is available for the USB-C replaceable connector.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Nitin Joshi<nitjoshi@gmail.com>
---
Changes since v1:
-Split patch between hwdd_status and hwdd_detail
-Incorporated review comments
Changes since v2:
-Control visibility of the sysfs attribute based upon ucdd_supported
Changes since v3:
-Fix documentation build warning
Changes since v4:
-Removed extra line
Changes since v5:
-Improved code indentation
---
 .../admin-guide/laptops/thinkpad-acpi.rst     |  21 ++++
 drivers/platform/x86/lenovo/thinkpad_acpi.c   | 105 ++++++++++++++++++
 2 files changed, 126 insertions(+)

diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
index 4ab0fef7d440..2db05f718b11 100644
--- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
+++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
@@ -54,6 +54,7 @@ detailed description):
 	- Setting keyboard language
 	- WWAN Antenna type
 	- Auxmac
+	- Hardware damage detection capability
 
 A compatibility table by model and feature is maintained on the web
 site, http://ibm-acpi.sf.net/. I appreciate any success or failure
@@ -1576,6 +1577,26 @@ percentage level, above which charging will stop.
 The exact semantics of the attributes may be found in
 Documentation/ABI/testing/sysfs-class-power.
 
+Hardware damage detection capability
+------------------------------------
+
+sysfs attributes: hwdd_status
+
+Thinkpads are adding the ability to detect and report hardware damage.
+Add new sysfs interface to identify the damaged device status.
+Initial support is available for the USB-C replaceable connector.
+
+The command to check device damaged status is::
+
+        cat /sys/devices/platform/thinkpad_acpi/hwdd_status
+
+This value displays status of device damaged
+- 0 = Not Damaged
+- 1 = Damaged
+
+The property is read-only. If feature is not supported then sysfs
+attribute is not created.
+
 Multiple Commands, Module Parameters
 ------------------------------------
 
diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index cc19fe520ea9..3702374357ab 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -11080,6 +11080,106 @@ static const struct attribute_group auxmac_attr_group = {
 	.attrs = auxmac_attributes,
 };
 
+/*************************************************************************
+ * HWDD subdriver, for the Lenovo Hardware Damage Detection feature.
+ */
+
+#define HWDD_GET_DMG_USBC	0x80000001
+#define HWDD_GET_CAP		0
+#define HWDD_NOT_SUPPORTED	BIT(31)
+#define HWDD_SUPPORT_USBC	BIT(0)
+
+#define PORT_STATUS		GENMASK(7, 4)
+#define NUM_PORTS		4
+
+static bool hwdd_support_available;
+static bool ucdd_supported;
+
+static int hwdd_command(int command, int *output)
+{
+	acpi_handle hwdd_handle;
+
+	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "HWDD", &hwdd_handle)))
+		return -ENODEV;
+
+	if (!acpi_evalf(hwdd_handle, output, NULL, "dd", command))
+		return -EIO;
+
+	return 0;
+}
+
+/* sysfs type-c damage detection capability */
+static ssize_t hwdd_status_show(struct device *dev,
+				struct device_attribute *attr,
+				char *buf)
+{
+	unsigned int damage_status, port_status;
+	int err, i;
+
+	if (!ucdd_supported)
+		return -ENODEV;
+
+	/* Get USB TYPE-C damage status */
+	err = hwdd_command(HWDD_GET_DMG_USBC, &damage_status);
+	if (err)
+		return err;
+
+	port_status = FIELD_GET(PORT_STATUS, damage_status);
+	for (i = 0; i < NUM_PORTS; i++) {
+		if (!(damage_status & BIT(i)))
+			continue;
+		if (port_status & BIT(i))
+			return sysfs_emit(buf, "1\n");
+	}
+
+	return sysfs_emit(buf, "0\n");
+}
+static DEVICE_ATTR_RO(hwdd_status);
+
+static struct attribute *hwdd_attributes[] = {
+	&dev_attr_hwdd_status.attr,
+	NULL
+};
+
+static umode_t hwdd_attr_is_visible(struct kobject *kobj,
+				struct attribute *attr, int n)
+{
+	return hwdd_support_available ? attr->mode : 0;
+}
+
+static const struct attribute_group hwdd_attr_group = {
+	.is_visible = hwdd_attr_is_visible,
+	.attrs = hwdd_attributes,
+};
+
+static int tpacpi_hwdd_init(struct ibm_init_struct *iibm)
+{
+	int err, output;
+
+	/* Below command checks the HWDD damage capability */
+	err = hwdd_command(HWDD_GET_CAP, &output);
+	if (err)
+		return err;
+
+	if (!(output & HWDD_NOT_SUPPORTED))
+		return -ENODEV;
+
+	hwdd_support_available = true;
+
+	/*
+	 * BIT(0) is assigned to check capability of damage detection is
+	 * supported for USB Type-C port or not.
+	 */
+	if (output & HWDD_SUPPORT_USBC)
+		ucdd_supported = true;
+
+	return err;
+}
+
+static struct ibm_struct hwdd_driver_data = {
+	.name = "hwdd",
+};
+
 /* --------------------------------------------------------------------- */
 
 static struct attribute *tpacpi_driver_attributes[] = {
@@ -11139,6 +11239,7 @@ static const struct attribute_group *tpacpi_groups[] = {
 	&kbdlang_attr_group,
 	&dprc_attr_group,
 	&auxmac_attr_group,
+	&hwdd_attr_group,
 	NULL,
 };
 
@@ -11752,6 +11853,10 @@ static struct ibm_init_struct ibms_init[] __initdata = {
 		.init = auxmac_init,
 		.data = &auxmac_data,
 	},
+	{
+		.init = tpacpi_hwdd_init,
+		.data = &hwdd_driver_data,
+	},
 };
 
 static int __init set_ibm_param(const char *val, const struct kernel_param *kp)
-- 
2.43.0


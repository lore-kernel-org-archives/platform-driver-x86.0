Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB90133509C
	for <platform-driver-x86@vger.kernel.org>; Wed, 17 Dec 2025 06:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765954543; cv=none; b=u75iE2BuFfw0Fhz7f875H0yCUigAp4oS8lMoTu5HzTIXwE49/c+F78ugcITTARQY1tejfYsQjeYmV9oJLba7rHQhWhBnGV9dsciXETvwAWUy19a7x/Y34NIr7wxHe1o929VyPKytgNkxs9YkwUrfE4f5tLmcNS723bLdfVZD2ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765954543; c=relaxed/simple;
	bh=15akxeqFuZDUUvyRPF2BC/GpurOHTrShK47J1NAb9ZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ivC/z9PL014ZM0n5gAeoej+L0FnThOBlPOfRrhPPo0Scv+RjioV+ods2ZNi8UWQNpPs9F3TGG6OHCU/ONe0y7LOpVkiayl7ySlJvlWi9Vm5LR9iYd4u/ao/f6ZNmzby+iUf8BpeG5YrdwtjoS1JWtAamyBDaxcSuwFzo3hmh570=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PjQnZeL3; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PjQnZeL3"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a0d52768ccso38759205ad.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 Dec 2025 22:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765954539; x=1766559339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mjHhD9t0LWVinFppuhvjI6mglMkUYLDRhnxYPwqRQGU=;
        b=PjQnZeL3WGCxGNcWykpazjI9P35F5iU6bg/QoUF+vOkbgXjKu2ohTbkAWWImq0LCCd
         8wM6McYQeDsZKSPIqzbT8RXR7Kjibq4wRqp/osMLeEePJfzC3D40qrs+H6pibl8yseDv
         QRsofLDcUReRqRIr1CzrQ94u5geZyxwWMg1Va5XoStAz9LOdVm51MN6NaC6d3iYRNI5l
         /SgPrer+1n/gFTVUZJi2E49IZ4dSxntFl9D7jwX4uxCGc52rLpXmyDnGxIRASe7Op1Hq
         wqFOBwpnmU0KZ6n84xoQQRgQaNdkHpXv7W3DoA1oPcLKlIr0AQld2U+WGLsuF3bDRF47
         5IaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765954539; x=1766559339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mjHhD9t0LWVinFppuhvjI6mglMkUYLDRhnxYPwqRQGU=;
        b=iR+vRyO+pdwcN1I+HvSWGqb5etVpdH/RgnIRD9py2vQpQtrKXm+DpdR4rhbe8mNIHj
         gHe8HIpULphN/pU84UB+Xmqh8DDQt901Vytf7RKS/W5oRmmxw7SKv/w6+8CWcz7O3ceI
         xzHDdFh8E10ebUM6cst+A3zd9UmdJKhmaxvoPKU9UcZST4eZ3/gcDf2nWwTN7MwdWGXS
         jRw8MnEQBU7i1WLnH/Jmk37U+cNkcTy7o8oxtQPYqFGg1leTutiH0Hox8PPbkvagWrn+
         K7bPD4GbXHru9N0Oso3vi9NR5C7sKhkhgJJYAGMHCFywMbhycykS8eFgwfMCfEVSL12H
         Fi0A==
X-Gm-Message-State: AOJu0YwDj4IUaOWyt1sARiYfbWAVBrqouM8DUC4obvf4hwsk9Y49YHHN
	FLhPLX1qgqjxgyCc/8OgKOFfGjeXGsyDImUZcllM/ul/UvMEAF+LsgsaGsh1LQ==
X-Gm-Gg: AY/fxX4QamWr9PuZzaVRV4LYpa8Z5tjq340mjbFupyh3+B42HkhfATr01majwHyxDPD
	3owESwhxSETC3g7GHNWuAhMxT/BOv+ta7X8MRFpCCJlIHW171mF0aeC6Vv6uZMWjs5vQ92XN/tl
	LaUAvbmFpwLvJUjBfYDVgVAN10X238u5XsA32SlSujQAHz/LZPhbmz2SnBJY8/b0nJo/ujk1OZQ
	ALVoO5MgZh6jGwMCOMkiDngG2hd0oSMvGdCZhbsdTXomP5Qotiqwii1QiZFkfhUJVX6yu+WrWJX
	nrmrw4mjQhIjn8IwjnU5vndg3t5CNJfKkVfcswCvFUucFTFGmELswfureLl3Y6ilW5VRhuw1ONl
	0wJB+SlcFGCsH2LIFpnF21slE6SSxqSkaF5MdT/N7jlOopgDmb/4hDNlR0cLT7wfeH5cjAJ4bqW
	Xy38tGYEFd3U7hz4MvcXZeNJbDq/d0D1wl
X-Google-Smtp-Source: AGHT+IGcu3QWtpJapUaLDp6cxr/bxrFGIwZs5hxBGQrvlAjpTguLSlEWM2gYDdytcEp3nE9H6eeJWA==
X-Received: by 2002:a17:902:f605:b0:2a0:d46d:f990 with SMTP id d9443c01a7336-2a0d46dfb15mr144015965ad.31.1765954538682;
        Tue, 16 Dec 2025 22:55:38 -0800 (PST)
Received: from nitin-ThinkPad-T1g-Gen-8.. ([2405:201:3006:188a:4b8f:99bd:7069:8c6f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea06b49csm188230235ad.95.2025.12.16.22.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 22:55:38 -0800 (PST)
From: Nitin Joshi <nitjoshi@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	njoshi1@lenovo.com,
	Nitin Joshi <nitjoshi@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: [PATCH v5 1/2] platform/x86: thinkpad_acpi: Add support to detect hardware damage detection capability.
Date: Wed, 17 Dec 2025 15:55:22 +0900
Message-ID: <20251217065523.48399-1-nitjoshi@gmail.com>
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
index cc19fe520ea9..cb1f6dae9334 100644
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
+	if (ucdd_supported) {
+		/* Get USB TYPE-C damage status */
+		err = hwdd_command(HWDD_GET_DMG_USBC, &damage_status);
+		if (err)
+			return err;
+
+		port_status = FIELD_GET(PORT_STATUS, damage_status);
+		for (i = 0; i < NUM_PORTS; i++) {
+			if (!(damage_status & BIT(i)))
+				continue;
+			if (port_status & BIT(i))
+				return sysfs_emit(buf, "1\n");
+		}
+	} else
+		return -ENODEV;
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


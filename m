Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A0B35B126
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Dec 2025 12:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765886719; cv=none; b=UKVVdh8WmoBAcf05mSqidMyENgOfJ9S1aao6QjijcNjJUy6gd8C+lk5grPUvwH4ncn/wnxIwPvEW1yL0iO21Y1BxfciZb2URDnSl+M/9Fb0soy8JyZ6TgN75XSEmeMn63W9tygDxKcsxj9RtROfLCWuTvrDb/gBZLm/uHrQTKAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765886719; c=relaxed/simple;
	bh=r9Y4+Gg0k9uNMm9PYClZRzjQeB+ijoa4NM6l3rG+EI0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QA8mfv2f1BL/6UnfiQ5D66S16KLQaJlwAsE8QmaZrbcvSGJTGgqnNe8kP67MZzy9ykTB9Anb6XpNcszCModR+XrkLsi3pbdLMM/MdKLImZamNaEKMLd3jP1H23UkeEnDkBvTix3XdObRlE8yZ6RuHifqIxEEqJSEHJhqPOYHj7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B6IVHgAb; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B6IVHgAb"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a0834769f0so31998605ad.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 Dec 2025 04:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765886716; x=1766491516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oehfsgUcqNUHeOco4JsB7ICcF4xnNj0qLly8sotZOaY=;
        b=B6IVHgAbKtj9mvKePEmnoNdoaFEgBjeJ+q8bAnVKCSiSWc9dfmqKJJXDwhugcUkY2m
         NW9XqFT+4kwXFb5H8cHXd9mXlAjP6YyZgeMi2FN0M+16TDadlTwFVo6sD4tM8C4xTJse
         Y66AumZVPlhBLUe/BV3M8n3kEdmIMLkZM73zx2hrX77lymo3a1u5hkSDB99rBPj7ksgD
         Ug/YqEuk2pviNIM/iOuuyHsejZB45oTXcVmxBpL5wDBZ26i870Mjzp5ihMKBL4d12rMC
         tIb7pERZ2+5zmoVepTzybVK1z2oSrCU2+wmYCHzH2DeS8dm/DjtXFAaAcHHJKbSy3fhl
         mniA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765886716; x=1766491516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oehfsgUcqNUHeOco4JsB7ICcF4xnNj0qLly8sotZOaY=;
        b=CYJ0h8tu4E/BT7/AzlMa1ic7/Cmd1CTHiN5yo+xKbfoeeyspmIOJ/qG0pGpuwzwso6
         bMkZJ396hUhWvMjRDfDu6hsfN4j+qSd3z2NgemQ/JvdeV88ThQHSK7QpLOtBEV1uBR4V
         cae7cPqv1SOlaty7hABdlq6fmYAAaupDRgLTDQWusW+/V+w4I5ej0B1VsFg/TCfAVppK
         XjpKXQHUQffOM3fWkUNAYrwxJJWVEAjcZ4hAGMD9jhUY/hh110sFP3hDaRvCapAUhB0U
         unAsIPA6QGyVex1i/scbxWON9ASGHo9hIavardQkYphaH8Mzxt1RYnJXvU6H52pL+ln3
         kaeQ==
X-Gm-Message-State: AOJu0Yx7Z9ZV7Ii4YAWuq6z1Q4Wyoma6aRjJgq0e5vjokOKK3G4lTb4o
	E/Pi/GKOGJ0AnymLDvgFDJH6wkF8zClTvhfe6kIVii9rpDppNJ3+STT9
X-Gm-Gg: AY/fxX6661o3goNjc/8lkaVDWrFmheuwqLqR0oAZa+XR+iB6kYEmQfXYsUfTg1i4nWz
	ckgLzFFwjJNVQZ0aBjJDEv3ssKfkJl7HGYqmL2r06Bhx/1aziRGb3noFCu6q9u14aAnMR0eaSBx
	WXXacPB91+TtD1vP0s8GM68dYama6PEs9G+Lyv/Q5P/SosJBsaRUHDqTeFRlJ6xrWv5/KEjfqSH
	gl63Bsc0ULF+jZ9gmkue9JD1GXs9Vq7pTeNCUS3Y81iJaA8/hOgYcZ1unEZ4G3LH8DdkwKwriC/
	xWd98uFo4cu677knzB2pNmfjjBoOTiEKiCChT/RYelGPsQiMiu1cLs8OgvVbbJ88soQZNZtw8dS
	WdVGtqt++MACjgY31OmwcBFO/9+lQ0hiUje5eAazej2eQ67sLdK7zWX/AFqwtohWXCzPCJBL/hc
	YstxeN53e2obeCy6IsbnlP/aP+6/poTgNF
X-Google-Smtp-Source: AGHT+IGTsq6pX+WeWMQCpWMgnGcavloYAM6TkHoVpgVhBFiP26DlXf8j1LQ+GahBfocPJDvOOjAXeg==
X-Received: by 2002:a17:902:e5cb:b0:295:9e4e:4090 with SMTP id d9443c01a7336-29f24369cf3mr148296955ad.52.1765886716293;
        Tue, 16 Dec 2025 04:05:16 -0800 (PST)
Received: from nitin-ThinkPad-T1g-Gen-8.. ([2405:201:3006:188a:9344:a089:f162:6625])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29f177ff327sm132932335ad.101.2025.12.16.04.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 04:05:15 -0800 (PST)
From: Nitin Joshi <nitjoshi@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	njoshi1@lenovo.com,
	Nitin Joshi <nitjoshi@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: [PATCH v4 1/2] platform/x86: thinkpad_acpi: Add support to detect hardware damage detection capability.
Date: Tue, 16 Dec 2025 21:04:53 +0900
Message-ID: <20251216120454.41076-1-nitjoshi@gmail.com>
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
---
 .../admin-guide/laptops/thinkpad-acpi.rst     |  21 ++++
 drivers/platform/x86/lenovo/thinkpad_acpi.c   | 106 ++++++++++++++++++
 2 files changed, 127 insertions(+)

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
index cc19fe520ea9..b0f7dc0bd531 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -11080,6 +11080,107 @@ static const struct attribute_group auxmac_attr_group = {
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
@@ -11139,6 +11240,7 @@ static const struct attribute_group *tpacpi_groups[] = {
 	&kbdlang_attr_group,
 	&dprc_attr_group,
 	&auxmac_attr_group,
+	&hwdd_attr_group,
 	NULL,
 };
 
@@ -11752,6 +11854,10 @@ static struct ibm_init_struct ibms_init[] __initdata = {
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


Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDB4126C02
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Dec 2025 01:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765763803; cv=none; b=V6ZpjSnwlMMwrf4p8chC+pWP6BiS/oF49fT5v38nMCkpRVBqyxDztSDEfFfhR7un474yGDhXRhsNnZfPmhtbJ8P3nAMl/a+ajXD4nVki46hkq9zMh4uiE6BSH53J3Jul0uYnz48pfwob8HRgs7IzmMSiwMgEFDdZHNRn3+wiWKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765763803; c=relaxed/simple;
	bh=MYoWrP/b0MCDLqtIuwoTW37LumszrxL/ETQNKLmEJx8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Kda3bkSsm9magwB+G+Pw/+LEYBDVjHp4wFSBRW53tMOXJpPLDx9ZIILgn982E+TnT+acHtHcrTCmsY+yahsqZnPAWSR7IIDqq1y2mFemwvbPiGxBpj76dMz018StEX8oQ9BpzODHvpymoLJQsmrKnW26Q6u3TKtGTnNjdPvi528=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L2rCDlqE; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L2rCDlqE"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a09a3bd9c5so11178175ad.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 14 Dec 2025 17:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765763800; x=1766368600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0tPxZGQq1WAxsRlmsZkbB5nx8aPzt8Z8kT9wqa6XsQs=;
        b=L2rCDlqEOxrzwbrw6XESeJs1XgebUg88OqFfFnyP6bu5khInlfP3GIGFhjQ1Mx3Wym
         xciBJcf3BXWrNueVjhEIGndWobNekzVBCgcemqvzHNYg1yXtYu+m4Ri5NgqiPspQPs9E
         gVapxH94CMzQyrO9FxYBDjFeDKu1mn9cjxN4pn3waPOeodaJCfe+j+6vhaSdFUHCYVub
         ejl1OkSdjeX8eUefIght7TpyZQkghSatX0Nj7m2LAavoMqqZxu+ym2aAlHSEVaySao9N
         V7HiljSov50BTeVNWBeARTSKX7Hzj6dbmkUdDAay1xPRc+vfP3XslGWdqfilf1YJg4sL
         6IQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765763800; x=1766368600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0tPxZGQq1WAxsRlmsZkbB5nx8aPzt8Z8kT9wqa6XsQs=;
        b=OmziflUEp190dxQ+RxXG3mvN53yLpgr4XCrlMNeVVAU5reaEy4Hlf9tPPKoms42Sve
         KIvhelJMd+0GHZOpDx9qv545AQpQd/d3ui1jaJnY+nEazlANgRmJn4Od+TkgOa9C53AJ
         4vcye/0WoIL1rGdFuJyUTRTW7ixVF3SpRnabMyM8aMsfUoUSTK6uXhdAiRtJCBqos/tw
         R4K3CYvh5gm0Vpjkuu5KbfVIdB+Fk0ksxBhn6ezDSBrBI0Gqtj7aZ97pIBvVGciK0568
         LIApDZYdSO3w/tNLGhpToFqa29jzmCaCJhHoVDx+S93vx3yoqhz3rWzEwaJ+clNO+/sl
         eHng==
X-Gm-Message-State: AOJu0Yyc9+6w8X9YOeXx7xhmLRuyUz7FFmfJIuNCoXmZiVS/PhToF5kP
	ty66itJnIoydpuL3rRivffIJ5a1ElM6l0AEe2+xCKAwWbFwnpQ9a1a4y
X-Gm-Gg: AY/fxX5QIvE3rBWwROR3IBWDUQLu0KR+AXPGiIWvZj5AB4AHUx/538g0AjWnww0K02S
	1qLyZ5OoBSeZhg1/609f8/YKfSyx5kyBAEP5xxagH2MznujowRJwrH/E57ZHh4jg9r/zsE0urNl
	41GG9qOq9BjAnTH3X4t55EBH+rupOUd5x0+noyzbYx3z3qaC8nItR90q3GPFklt6jJYB/D8CmFO
	gg2iL7uS8zsjNDGUKbuMUGqR4b1O/9EW4cbkfUqEvdC4wj5FUrT6YfhagzZ9XxPFhrsPKa+IFqs
	yGyZnfncXevK4xAUa2AYhx18PqZdou/zpgYp20j/I9Q+7NaZF7y2+Z1S3RiOzRPOiXdyAXBBJYs
	iiaX4010FbXiuvJQSwqo8d3pr7ve0dgK0YK2UYT4LegeDtMDSME7hVjZYehQ7/jrwIiu5vdRoNx
	R9ziTeE1vwze+u9MhOgH3NpZELuYPNyROR
X-Google-Smtp-Source: AGHT+IFs4EQ0xv30VDM7RsD2dZsAhGlLJx8E4TV1wDywLwPUh21ppL6lHrDBhohzrKI1IF8cEvbtYg==
X-Received: by 2002:a17:902:f605:b0:2a0:dd66:d813 with SMTP id d9443c01a7336-2a0dd66d8e5mr29421145ad.55.1765763799442;
        Sun, 14 Dec 2025 17:56:39 -0800 (PST)
Received: from nitin-ThinkPad-T1g-Gen-8.. ([2405:201:3006:188a:90c8:dd19:c7f5:929c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a0be984c7csm30097495ad.66.2025.12.14.17.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 17:56:38 -0800 (PST)
From: Nitin Joshi <nitjoshi@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	njoshi1@lenovo.com,
	Nitin Joshi <nitjoshi@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: [PATCH v3 1/2] platform/x86: thinkpad_acpi: Add support to detect hardware damage detection capability.
Date: Mon, 15 Dec 2025 10:56:09 +0900
Message-ID: <20251215015611.16002-1-nitjoshi@gmail.com>
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
---
 .../admin-guide/laptops/thinkpad-acpi.rst     |  21 ++++
 drivers/platform/x86/lenovo/thinkpad_acpi.c   | 106 ++++++++++++++++++
 2 files changed, 127 insertions(+)

diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
index 4ab0fef7d440..94349e5f1298 100644
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
+-----------------
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


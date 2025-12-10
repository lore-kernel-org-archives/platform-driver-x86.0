Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA58280336
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Dec 2025 15:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765379510; cv=none; b=L7Z+Ty2mhkm91lwL9DUaKfyiCcKk+z9P5Uu2EqBowKitubQGVp3+/emTD1wQWos44Vtkz09ydyr7zDHSpZTWfZSRegzuEjJW7NvLGRmgQCuUAA34clEe6poHk7yKx+uXRGQC+fEJ28OlzqJM99AcZgGBQt8Eq4xQ/XLEEh1QVD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765379510; c=relaxed/simple;
	bh=lJHR6ni0lfHMnJiHXgk6DCAjC1Vg3PSRFIkZ3xVA8Tg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=De8EJhnn7TGci3GhtWLT9LwE7UaQVtnEI/fChYX/RYOddKJvxQiI1pAgFab9zSm4tWmubXzmf9uEkLvEvTZ0NK2LJDRVLFpqBvEvFkc7tczRwCdHizQhRwi3QsX2l+RhEsIjhpRAej3y8EopL187QqahNBlh/Y0U5kJ+Fk3Go2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JpqldvHh; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JpqldvHh"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-297dc3e299bso59602815ad.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Dec 2025 07:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765379508; x=1765984308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e0Dc2rnj4OLLO+hElvr1dnz7EcZz38BkTHw1EbpQe/c=;
        b=JpqldvHh+Rj6nbIKcKrwymt7dY/QMGj79WNbIP9EkaMVwlKXn2T5n3fLDROqiHw8v4
         vXW3n717YA9gtp61m5b/747Z2s/e4q4fMyjJvowNAseobzRL66jZn/qGnC0qXuaiCusM
         QfZ+EvOLv+ep5MRPoQS4Z2fZYgb/bDY6BI7Mvw50Q4fr+IcwOlvYLeqS4Ih+gycT1e8u
         S6GOslCkK+tGZLDCGQk2l4CUYrbCUaBt/P8DasmZ3rSFYQxS7Vm5jy5/biMVWK2EoORA
         d9bmliNAkG5d4+TDbhRjOb6IWDel4lI7FhVi57fmE+WPiLtw/OJsAe8+DxY4t8IR7/3e
         PRJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765379508; x=1765984308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0Dc2rnj4OLLO+hElvr1dnz7EcZz38BkTHw1EbpQe/c=;
        b=Wf3qHEOo11zfkr0Rb3ADX6YgNt4Tu18dUJ/6qecnQaHHUQ8RFvsDUex7SiAqV/kWlG
         UDngJkwEGYKVbZE2QxxduYlH9ikm/B6IY955Mz9Fn66xnlihFcuCcG2SuccFZTXUHvce
         b0XyyukqV1sJTPrs0ZaFlW6vOI+nH5cbi7T2o4tMEqlLUW2OmT0TdzCKvFq99NbqKuyo
         2El4budp1lgRq1jHGaZgiMwb25XB4U7ywoRYttTRPJ8UuIPwqnlEH63EUBon6tP9BtLa
         rxJWwWk9lgO+ntoDWfHbq3F9SFBXKi5pPlnXYMkjibJ//Z6o6Lvf1l9H1vuxqYeO0Vm0
         bEVQ==
X-Gm-Message-State: AOJu0YwoqQm0u0OiY9WCr8wfPwP6viJ5BLMF3yix0qoKefZR+XfKdWtN
	upgGIHMJdppua/y+JWSwijVe3NkAcnPIDqi8pwNQ2CvkKLtNnX4ptKea
X-Gm-Gg: AY/fxX54u6GTExpmEp87pnqiQDIowfXitshLAUYtDtyRX7YmCOswDsZ5m2vlnQ6SEjg
	c9FQX1CoZ618lAnviTJIZgnYGsz0M9bhf/FFVfX72HCf4mSYHbCj4ER5P08cPyjMH8RBIn8SpWA
	c+dolc90JGNjVsbwJ7DdVntiu8hvbEzialA28RdIMy7V+AdDi2WKi4k0hZ+H37wIn+UvlavEIY/
	2x5M8ksjBAZiZ4jGw2LoJk4od0zT50/nIrt56xCQbwIL1amc64FcipXR+9mpI948IKBOJBGXPRD
	98VFaxNUg/1qSDpScUQaI3VTCDcRTmr7W1iikXV3yMMwTj9YGnVbKklgUFNzh2wQcw7TqSBtHKz
	zLc4GdTKIFDPiOi3SrgtobAjKYnEg2mhkwehsphLl9DR200svsvfquvi3RcywqyzPQfWeCwzGRT
	9SWo+79ceEcYwNzaEux4rWNKdy5ZZv
X-Google-Smtp-Source: AGHT+IF8S14t6sEaFc+y6fOzrCEqznXB/wlHz6/lOKs8Vd5SrBRIgKBimJZelyj25YOpACLumvaOWA==
X-Received: by 2002:a17:903:17cf:b0:295:589a:d12a with SMTP id d9443c01a7336-29ec22e107fmr24303135ad.8.1765379508142;
        Wed, 10 Dec 2025 07:11:48 -0800 (PST)
Received: from nitin-ThinkPad-T1g-Gen-8.. ([240f:102:8600:1:c3a5:292d:c23b:266f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29e9822c308sm53371735ad.80.2025.12.10.07.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 07:11:47 -0800 (PST)
From: Nitin Joshi <nitjoshi@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	njoshi1@lenovo.com,
	Nitin Joshi <nitjoshi@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: [PATCH v2 1/2] platform/x86: thinkpad_acpi: Add support to detect hardware damage detection capability.
Date: Thu, 11 Dec 2025 00:11:32 +0900
Message-ID: <20251210151133.7933-1-nitjoshi@gmail.com>
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
---
 .../admin-guide/laptops/thinkpad-acpi.rst     |  21 ++++
 drivers/platform/x86/lenovo/thinkpad_acpi.c   | 104 ++++++++++++++++++
 2 files changed, 125 insertions(+)

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
index cc19fe520ea9..4cf365550bcb 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -11080,6 +11080,105 @@ static const struct attribute_group auxmac_attr_group = {
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
@@ -11139,6 +11238,7 @@ static const struct attribute_group *tpacpi_groups[] = {
 	&kbdlang_attr_group,
 	&dprc_attr_group,
 	&auxmac_attr_group,
+	&hwdd_attr_group,
 	NULL,
 };
 
@@ -11752,6 +11852,10 @@ static struct ibm_init_struct ibms_init[] __initdata = {
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


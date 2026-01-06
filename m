Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529363590B3
	for <platform-driver-x86@vger.kernel.org>; Tue,  6 Jan 2026 17:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767721544; cv=none; b=ptbOauW9doyOhApb00vV1UcU6W03M0EwHP6lGU4OaDnRY8T21Ny8vDNzN7xGs4ZHoBMuLUlUSq3nUJAogdtV/VKxtJnmSebsjJBlHtHJPbDyTvRJbVy8Np6P93c7owPuwwyXEckRERH1JeWUjyOVPfIlDWFmXzGTWLBStedPJes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767721544; c=relaxed/simple;
	bh=N5XDA3pHbxwIVNv4Q62stjY3z7JIMCAXVl4G72PT+rI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LHV94ouhK/eiONewzGxUU022cTQM+05JR9LNe8YSi14bJtIImO1FU4h//7WCX0wctEUJlv/SI/FjDDEy2Ef0v1P0OocqRueqQwhj2PIiL0rhi1F6OaRDE8WHlOmjEk311uo+2pSQcUaSSBSiNa7WSRjinC61YWXlWYFb1pOPpH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bjbnL8Ln; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bjbnL8Ln"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7b8bbf16b71so1160503b3a.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 06 Jan 2026 09:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767721543; x=1768326343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3We0aNqjHbYJgCNoEmx0vHJsTgZdujoUbsScQteKmFg=;
        b=bjbnL8LnsAX28BmJuHMQXXuvHJJyAEXcNwrqT6wUPqqxiQOn6cRW2k1jr1bVc/Mwz9
         xagb2WA0HT1JJXFm3q9nyYw0tSAsm0OUl+09xHhZLe57r7gehTvYedQuqHDexTgr1iXQ
         pm55e2qDxa8kE1811zn140kXF8kXlxcGHYbOiVK5DcLgoYPtkxPFSKqekpNMeAMTpArD
         Qwi0FP1O9y81iyDtpZe433J5k8q1QoxJrQDAMelQ5c8R4bhO+nuJKM++UWRlBn1BI4oT
         M8L7pSdtLpCEwLeWPojBMPiWTYUjossQxMG5qdErjvBjYWvU/5w99a6PiP5+gNA51+Vh
         ZZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767721543; x=1768326343;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3We0aNqjHbYJgCNoEmx0vHJsTgZdujoUbsScQteKmFg=;
        b=amKYs9hIczojuXgT/m9SmhdbU5CgGwiB0OaIsjR2+9kSuxHxVJUNAbtoh04UN0oZqo
         C5czFxwjQ6xV7TO7RnAn8g47cSTdUlUBhK30nzvT6Itg8GdWUbKg5qDB1sezzYcrvTI9
         gm9fGXREMXNvx5MXtnHGT0mView1y0qXM2CGaTOZ5/uLlS01cGTyQcxtaMM+Rm8JalEI
         NTwB7VrNLEbz2Gl33YqCXhJ/Aq7bLtSoJJLOkmjHsqJo00CsSQFSDF86Q186/tPcpsfZ
         pyjF64pWXvAI448YFb79djk4dnXjS7yJdhUwijhcpl+N0XZ8zMsiYKljPqI2nUDCzGyS
         Nj8w==
X-Gm-Message-State: AOJu0YwGg6rwNu7Qyp4PxUokOAhSHmt60EPQ/PiAHWX2ebRFGMSs9yBn
	cUO1eDWcWXZ3p95uTfRfEGVT8QddAJE3GLLKm4R4v6vUgA5LgAC+uz9E
X-Gm-Gg: AY/fxX6xw/0BUVe2CH5nQo3DJmoKIDrNyTJAzupw7O3YoCw9HL7bKaPSDT5idodF26d
	+W3GS5Eqvee9HhmiCtG/LxXoEAIdVnAxCsZFiu99ISPADOIF97YKcfiqqKkFB0kh+TfAyKWpfOO
	N9HRKE26ZdPt44NTKzKMCJbxLsaxqWlxWerPbLkkBPMwd7pM0/hpsKOLuMJQKRPd4PbOs1Stu48
	FI756tLvhzFijT+bQ3LIeLikB3S4EORRCu9JBkVKfqoNIyqx/gBT+Qihqy7p/yOHuMAcAkLdMLd
	eicyiyX0GyVamTICraCXZbUCvBsTqXrpiO9qNfEItOYhzJicTO19oPQQ0OKraRA2tWtqW01T5JI
	n3LnH5qZd/PEt5Qt9IlbAk4PUx+NLc5W1Q10a3qjod3E3ktd2fQq0gZv2NN8ZvtOpD79GOmRB20
	EjmkG162H0pehxppAzSTwLQOfYIuzzMyE=
X-Google-Smtp-Source: AGHT+IFmLF0U9sMTkHwAs7WeIqoh1LXSWh5COrN/21DjLYpj5NfMqzMqIrcPFGwn+NtnjHym7bH7VQ==
X-Received: by 2002:a05:6a00:1d06:b0:7e8:450c:61d2 with SMTP id d2e1a72fcca58-81882dde6f7mr3141538b3a.66.1767721542515;
        Tue, 06 Jan 2026 09:45:42 -0800 (PST)
Received: from nitin-ThinkPad-T1g-Gen-8.. ([2405:201:3006:188a:8d12:f5f:47cc:6a19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c52fd904sm2736818b3a.33.2026.01.06.09.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 09:45:41 -0800 (PST)
From: Nitin Joshi <nitjoshi@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	njoshi1@lenovo.com,
	Nitin Joshi <nitjoshi@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: [PATCH v7 1/2] platform/x86: thinkpad_acpi: Add support to detect hardware damage detection capability.
Date: Wed,  7 Jan 2026 02:45:18 +0900
Message-ID: <20260106174519.6402-1-nitjoshi@gmail.com>
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
Changes since v6:
- Improved formatting for htmldocs
---
 .../admin-guide/laptops/thinkpad-acpi.rst     |  22 ++++
 drivers/platform/x86/lenovo/thinkpad_acpi.c   | 105 ++++++++++++++++++
 2 files changed, 127 insertions(+)

diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
index 4ab0fef7d440..2f910ff31b37 100644
--- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
+++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
@@ -54,6 +54,7 @@ detailed description):
 	- Setting keyboard language
 	- WWAN Antenna type
 	- Auxmac
+	- Hardware damage detection capability
 
 A compatibility table by model and feature is maintained on the web
 site, http://ibm-acpi.sf.net/. I appreciate any success or failure
@@ -1576,6 +1577,27 @@ percentage level, above which charging will stop.
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
+This value displays status of device damaged.
+
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


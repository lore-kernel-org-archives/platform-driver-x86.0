Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6DE19E98D
	for <platform-driver-x86@vger.kernel.org>; Wed,  3 Dec 2025 03:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764733261; cv=none; b=ayHh5C9MactWPCdUF30utw+mTbDdg7Yl965jPTEUsh7j5dmuu8Jz6FjpLynvTpqC+F6WyKklDo3P1wMH/MCXZMFK5wiwfWBFES/zt/3CUXygqWpSExRqHJqOOslda9H5z5FckvTvt37BMB7v6BUS2ajIdfyhOm3B7rWdO3aGIcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764733261; c=relaxed/simple;
	bh=R3jUDS759/G9KS52In4ZzHyH2Y5JQWui218OXcTMql8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hLiXEmqwAKZDYLt9oCDH98hCDL5LKZuZu4EMoaPPTGWGY59pn2UJMArKCw0aWJGog75ybxPal/LhLwNUDBRHqHx/5/IRPpPmwcoVinDEj2ZeZ9Y2Ttp/gtgSpEPqATTcXctSCP/luGjNXddWnk/ik3t9zVYTUw4E3zhLk9b+POQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QYr0Jvdg; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QYr0Jvdg"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-297f35be2ffso94836235ad.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 Dec 2025 19:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764733259; x=1765338059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YqSs+R/bxNlwL+UKrDIq0f16+1E+6KIw718DOKRwEJw=;
        b=QYr0Jvdglf8dSsjNHk3VfkvW8C+TGSi4o36w7IjVnrgde05OYA8zv+RoZRQ0CLgKe3
         svLXR8xKSWuFWC+L8+zyfHmvoV04gBdrLWQxmh4DSMiVhN1AGmelpobv4z4/RH4EenJ0
         pznWqVPz8gaL0wuqQ8Dn4CZNrCWPpXyeHx7ZTzXFXosHTWMqLcBJJwswX7fIo/xTNGDG
         q/GNNQORXXgKQD5dT5jaIm6P/zYM8Y4+nE72ZfDarl64NrfegQUdECqXjUSo7fbfyx8G
         LWwxlBB4xPS8MSeTitB7SUnpUqbSVT42Iqpdu6bxbV8WfLuBeYMohoPO/ucyOeG01zl8
         R7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764733259; x=1765338059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YqSs+R/bxNlwL+UKrDIq0f16+1E+6KIw718DOKRwEJw=;
        b=pzOgcojl3Qd3jxegJe+4r3Xfcr3ufUeMjnfqx1MAgqPPO/u6J2zsYRj7Knwl1C1DV9
         fdfWNU02P94RJQ0c1ed9eAeDMF1s/yw4pCfA7Pf+/KVHCQIH8W1YC7Qc9E98ddABLCul
         ZpOXn8u+mKCpCtzkenBVWoJX0oA0FfvsDutFxqaXL2+EovQTGSYU2tDU0nShZhTa5XQY
         drnLAmtx1bKt3QH+BXLWzTly5tzYCd+ZnfJV1+6ztAFx9K+KNum7cVt+1AxMHHghssVG
         FXRGoRu/919PP7AgzE9XqGF37prJv17GyC7AIvUaXbkqdMO+RYD1oCj6lmyCMb/2ChcT
         evdg==
X-Gm-Message-State: AOJu0Yzwe/QHHEzXZUqPkQNJBRpu12a/KOSXqZsS6xpZwqA736SVfZlD
	GhKJ1CYFBpjUqajyPFFSjjR33j02d4xm7PxiMDRZ7+2TEokhtW2zQB3A
X-Gm-Gg: ASbGnctF1y0A+fPqarOf03pmX1MS0hFRJqGDSrnfi2W1QG3YszbhKLdww1THa3ZkBdx
	F8/EkypifHEAFiNgdmGvefjPP3aSE2nhxzBM/dKQ6YrDPUtQuQWvqwapya1DvtT6EuLa0rak9hU
	JBJsGTUSibp3LNA2rm+d5blsjGofMKY4WXBcajK8KYhQRWelLoXspTANCwkTOFqIh3cb8F6Ko8U
	82hOltsOmeXSKLzxbz1AodlyjQLjnkJ2Jrifcl5oSzFBsv13M2R76E4RZIThihDUXCCB7Dv++82
	NODyBBGhpvnIYGW9XQ4zotEzLDO9V7EgoF67N80uACgJswIbdhYSZQOUr53oGKuoovih6WQAmUt
	o74b5d/q8YZWQn6hvWEQ90u3Z8QPP86EinRdUDTQMjFrsbzBAnE0eFYDKMV2DD2qsy519DBEYXj
	rH6+Pa3V7PNA9OR84HMg4UbTtQjrjjLbRcghlJOKrMo9McWCmBgxoHOo9/ifVPQbYTYdRV5Gl15
	F0CMq/NUzsDpeAGnNOO
X-Google-Smtp-Source: AGHT+IEueXpg/iibr94r+z1KnfJYOGrb4/vNwkFTS6b5+vMZt0812CPoeEugr7YHZ2uAGtBR6uGTVQ==
X-Received: by 2002:a17:902:e94c:b0:295:8a21:1559 with SMTP id d9443c01a7336-29d6838c9cemr13471235ad.35.1764733259363;
        Tue, 02 Dec 2025 19:40:59 -0800 (PST)
Received: from nitin-ThinkPad-T1g-Gen-8.lenovo.com (zz20234032476F6CA7C6.userreverse.dion.ne.jp. [111.108.167.198])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb55192sm170950695ad.91.2025.12.02.19.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 19:40:58 -0800 (PST)
From: Nitin Joshi <nitjoshi@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	njoshi1@lenovo.com,
	Nitin Joshi <nitjoshi@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: [PATCH] platform/x86: thinkpad_acpi: Add support to detect hardware damage detection capability.
Date: Wed,  3 Dec 2025 12:40:32 +0900
Message-ID: <20251203034032.6018-1-nitjoshi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thinkpads are adding the ability to detect and report hardware damage
status. Add new sysfs interface to identify the impacted component
with status.
Initial support is available for the USB-C replaceable connector.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Nitin Joshi<nitjoshi@gmail.com>
---
 .../admin-guide/laptops/thinkpad-acpi.rst     |  26 +++
 drivers/platform/x86/lenovo/thinkpad_acpi.c   | 179 ++++++++++++++++++
 2 files changed, 205 insertions(+)

diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
index 4ab0fef7d440..4a3220529489 100644
--- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
+++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
@@ -54,6 +54,7 @@ detailed description):
 	- Setting keyboard language
 	- WWAN Antenna type
 	- Auxmac
+	- Hardware damage detection capability
 
 A compatibility table by model and feature is maintained on the web
 site, http://ibm-acpi.sf.net/. I appreciate any success or failure
@@ -1576,6 +1577,31 @@ percentage level, above which charging will stop.
 The exact semantics of the attributes may be found in
 Documentation/ABI/testing/sysfs-class-power.
 
+Hardware damage detection capability
+-----------------
+
+sysfs attributes: hwdd_status
+
+Thinkpads are adding the ability to detect and report hardware damage.
+Add new sysfs interface to identify the impacted component.
+Initial support is available for the USB-C replaceable connector.
+
+The available commands are::
+
+        cat /sys/devices/platform/thinkpad_acpi/hwdd_status
+
+This value displays device type and location of device with damage status.
+For example:
+if no damage is detected:
+  No damage detected
+if damage detected:
+  Damage detected:
+  Device: TYPE-C
+  Location: Base, Right side, Center port
+
+The property is read-only. If feature is not supported then sysfs
+class is not created.
+
 Multiple Commands, Module Parameters
 ------------------------------------
 
diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index cc19fe520ea9..c3629bed9a8e 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -11080,6 +11080,180 @@ static const struct attribute_group auxmac_attr_group = {
 	.attrs = auxmac_attributes,
 };
 
+/*************************************************************************
+ * HWDD subdriver, for the Lenovo Hardware Damage Detection feature.
+ */
+
+#define HWDD_GET_DMG_USBC 0x80000001
+#define HWDD_GET_CAP 0
+#define HWDD_NOT_SUPPORTED BIT(31)
+#define HWDD_SUPPORT_USBC BIT(0)
+#define HWDD_GET_CAP       0
+
+#define DAMAGE_STATUS_BIT  BIT(0)
+#define PORT_STATUS_OFFSET  4
+#define LID_STATUS_OFFSET  8
+#define BASE_STATUS_OFFSET 12
+#define PORT_DETAIL_OFFSET 16
+
+#define PORT_POS_OFFSET    2
+#define PORT_LOC_MASK      0x3
+
+#define PANEL_TOP   0
+#define PANEL_BASE  1
+#define PANEL_LEFT  2
+#define PANEL_RIGHT 3
+
+#define POS_LEFT    0
+#define POS_CENTER  1
+#define POS_RIGHT   2
+
+#define NUM_PORTS 4
+static bool hwdd_support_available;
+static bool ucdd_supported;
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
+static bool display_damage(char *buf, int *count, char *type, unsigned int dmg_status)
+{
+	unsigned char lid_status, base_status, port_status;
+	unsigned char loc_status, pos_status, panel_status;
+	bool damage_detected = false;
+	unsigned int i;
+
+	port_status = (dmg_status >> PORT_STATUS_OFFSET) & 0xF;
+	lid_status = (dmg_status >> LID_STATUS_OFFSET) & 0xF;
+	base_status = (dmg_status >> BASE_STATUS_OFFSET) & 0xF;
+	for (i = 0; i < NUM_PORTS; i++) {
+		if (dmg_status & BIT(i)) {
+			if (port_status & BIT(i)) {
+				*count += sysfs_emit_at(buf, *count, "%s damage detected:\n", type);
+				loc_status = (dmg_status >> (PORT_DETAIL_OFFSET + (4 * i))) & 0xF;
+				pos_status = (loc_status  >> PORT_POS_OFFSET) & PORT_LOC_MASK;
+				panel_status = loc_status & PORT_LOC_MASK;
+
+				*count += sysfs_emit_at(buf, *count, "Location: ");
+				if (lid_status & BIT(i))
+					*count += sysfs_emit_at(buf, *count, "Lid, ");
+				if (base_status & BIT(i))
+					*count += sysfs_emit_at(buf, *count, "Base, ");
+
+				switch (pos_status) {
+				case PANEL_TOP:
+					*count += sysfs_emit_at(buf, *count, "Top, ");
+					break;
+				case PANEL_BASE:
+					*count += sysfs_emit_at(buf, *count, "Bottom, ");
+					break;
+				case PANEL_LEFT:
+					*count += sysfs_emit_at(buf, *count, "Left, ");
+					break;
+				case PANEL_RIGHT:
+					*count += sysfs_emit_at(buf, *count, "Right, ");
+					break;
+				};
+
+				switch (panel_status) {
+				case POS_LEFT:
+					*count += sysfs_emit_at(buf, *count, "Left port\n");
+					break;
+				case POS_CENTER:
+					*count += sysfs_emit_at(buf, *count, "Center port\n");
+					break;
+				case POS_RIGHT:
+					*count += sysfs_emit_at(buf, *count, "Right port\n");
+					break;
+				default:
+					*count += sysfs_emit_at(buf, *count, "Undefined\n");
+					break;
+				};
+				damage_detected = true;
+			}
+		}
+	}
+	return damage_detected;
+}
+
+/* sysfs typc damage detection capability */
+static ssize_t hwdd_status_show(struct device *dev,
+				struct device_attribute *attr,
+				char *buf)
+{
+	bool damage_detected = false;
+	unsigned int damage_status;
+	int err, count = 0;
+
+	if (ucdd_supported) {
+		/* Get USB TYPE-C damage status */
+		err = hwdd_command(HWDD_GET_DMG_USBC, &damage_status);
+		if (err)
+			return err;
+
+		if (display_damage(buf, &count, "Type-C", damage_status))
+			damage_detected = true;
+	}
+
+	if (!damage_detected)
+		count  = count + sysfs_emit_at(buf, count, "No damage detected\n");
+
+	return count;
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
@@ -11139,6 +11313,7 @@ static const struct attribute_group *tpacpi_groups[] = {
 	&kbdlang_attr_group,
 	&dprc_attr_group,
 	&auxmac_attr_group,
+	&hwdd_attr_group,
 	NULL,
 };
 
@@ -11752,6 +11927,10 @@ static struct ibm_init_struct ibms_init[] __initdata = {
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


Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A003126AE
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Dec 2025 01:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765763809; cv=none; b=V9PcwuOTbRgaZfrAse7BuoW52rQk1/m77F61B8y1QRmjxauq+dvmduNToM5YsaSR395TwnhjWSB49yM4P/ujn7kLccF4eqJdG7tZ32YO+qsINn0YRLps5pi198wqJNJgbADjjdXxNvxLz1cRrZzgM52Ka4Owl7T+x1ZubN8uCNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765763809; c=relaxed/simple;
	bh=rlbA3d1XPV1KH1+xzw9DF0M07EEjFUgmB006yft8gpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J0qavJexivfRwNNfJ9dfhRoI5/4iI5LpyROn3DWGg649xJColkad3dJBIFWLZtc9nWNWIspJlj6nheWfXK/L0NIhpw9aWyOokaT//dbc531zFH6ZNfyq6SPI+EJ2Ps/JmOqgYcXuAs4lLcZlHAfnLeSoG2Sp6kATTkeX76cm81I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U7D4kn8R; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U7D4kn8R"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a0f3f74587so5188985ad.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 14 Dec 2025 17:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765763807; x=1766368607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z0lC7zjEAe7BuKplLBzarQG8mPzpHJVdoPmL8N89360=;
        b=U7D4kn8Rm1Vj0Ed2jjgVoYvbRFufQYInc7+FmrEPrCrVX5Hu5MVnIjkRoi/IowUy7X
         Xfd+hF7YTOWwBEatHo535V1DL4YAISQI1q5e4peEDp06EwstV05sMZEbBOik0fqPVx60
         T82EJ078A74dhpZUJTW+CkAicZCnn+6ZhXNvkk9+95qR+2FsW2i3MWu1XIugNH12u7OV
         /mwy5wm9wV2KwhkeC4RYdAPGk6nffRUuSIGDFtMCWMyCTFSZviNzyN6iXod/MFpFKkJn
         hUdDKKA9RnawOlgu6ZfyuFDjQXNXBZ5H0JutEDE/Zce5z+qyfhFJK7oSg827M6GzRcYI
         bFCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765763807; x=1766368607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z0lC7zjEAe7BuKplLBzarQG8mPzpHJVdoPmL8N89360=;
        b=jIIHq5G3UcYkv8B5nh1NZk4jT18C2MJTU/uMKHku7xIIJkkvY07+eEIb+1zH1U5bUK
         rL5vqsAW1Kk6c8pXyweqi7byFe4mQBUj1lDOJXQj60HEGVnYIqIPYBkp9UBJYzWlEjaF
         /gHD+vOfLgTG66xpzO+4UX0k622TbqlZ5aAo9XSLf5W7ZgHc8MCRlZ0Xy4HLsMBO4u0U
         96Mmsby3wyNLJovPNeIVmq7/NSMTarMKkC063/mYaKXrQCkLNersfDPi4F+8PR3mV9Z/
         4Asv7IsQr0Q4Q4Kl6jdjCgKE1cxO6/0aaKFR4QzUVT6hh+/UJLz68Eka4LHOY0nEyJpV
         qYIw==
X-Gm-Message-State: AOJu0Yz/fZXsvPJRlrg+I6tIakEa1ag7eKK7pwq+dJSfSTdE0mLHS1Rg
	q6KLxqggSfZMpJ2VVYWosoBWaCy/SIFH4hUNJvu6i5BD2hZLC+1FN9ei
X-Gm-Gg: AY/fxX6fGVMexZoNn6aiZdTn1yA8UcYo5cwnRhE6RD5f2EZ+ByEZOrM+sGs4CWe+kBQ
	XlI5yWvUpyTTknr5QBUuMM1sprQSbRLi3g/kOXGT7Cp1nTeEoAeRo/qFCQRaV6HTgpoxHT7+nbc
	giroyZBL1s0p6hAk1/uU2FrSX9yUUM2tKRrmqbMNOgKYLII8LNHyRXS3PGX97k3mhnT4C4cZzEd
	nMRrbPhFwfaXFfzxO/FgTzOPvSIEtq+QzlAl32PPu2+8Buct/r5OT5/mUD7U8CZvf9pDNZyfNEN
	efmhdxCk2rmoRbhLrBVrNc3QAU7rGJPZM5hljGgjDyOCSoxk+ojeJ5a+Mkyl8mfReWCKaenuxIu
	QnPkI0BSo5mqRbEDurefYMsx6/zK3C4COBUgye8wOSxsMUgSbkC+1aycYZM5r+7jvhxwBsTczyb
	XQMXa8ASTY52tNHIzSdxKSOxbA/TM1TiWW
X-Google-Smtp-Source: AGHT+IGseO3oEw1ZtuNq8UpLrMOmILMw0iwAJbnPBLWPnHaSKfUQa5DbfqBEvmxUAjKwWJiRYlRUiA==
X-Received: by 2002:a17:902:ce09:b0:2a0:d5df:111b with SMTP id d9443c01a7336-2a0d5df1341mr26418985ad.50.1765763806863;
        Sun, 14 Dec 2025 17:56:46 -0800 (PST)
Received: from nitin-ThinkPad-T1g-Gen-8.. ([2405:201:3006:188a:90c8:dd19:c7f5:929c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a0be984c7csm30097495ad.66.2025.12.14.17.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 17:56:46 -0800 (PST)
From: Nitin Joshi <nitjoshi@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	njoshi1@lenovo.com,
	Nitin Joshi <nitjoshi@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: [PATCH v3 2/2] platform/x86: thinkpad_acpi: Add sysfs to display details of damaged device.
Date: Mon, 15 Dec 2025 10:56:10 +0900
Message-ID: <20251215015611.16002-2-nitjoshi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251215015611.16002-1-nitjoshi@gmail.com>
References: <20251215015611.16002-1-nitjoshi@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add new sysfs interface to identify the impacted component with location of
device.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Nitin Joshi<nitjoshi@gmail.com>
---
Changes since v2:
-Control visibility of the sysfs attribute based upon ucdd_supported
---
 .../admin-guide/laptops/thinkpad-acpi.rst     |  13 +-
 drivers/platform/x86/lenovo/thinkpad_acpi.c   | 114 +++++++++++++++++-
 2 files changed, 122 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
index 94349e5f1298..3a9190ac47d0 100644
--- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
+++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
@@ -1580,7 +1580,7 @@ Documentation/ABI/testing/sysfs-class-power.
 Hardware damage detection capability
 -----------------
 
-sysfs attributes: hwdd_status
+sysfs attributes: hwdd_status, hwdd_detail
 
 Thinkpads are adding the ability to detect and report hardware damage.
 Add new sysfs interface to identify the damaged device status.
@@ -1594,6 +1594,17 @@ This value displays status of device damaged
 - 0 = Not Damaged
 - 1 = Damaged
 
+The command to check location of damaged device is::
+
+        cat /sys/devices/platform/thinkpad_acpi/hwdd_detail
+
+This value displays location of damaged device having 1 line per damaged "item".
+For example:
+if no damage is detected:
+  No damage detected
+if damage detected:
+  TYPE-C: Base, Right side, Center port
+
 The property is read-only. If feature is not supported then sysfs
 attribute is not created.
 
diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index b0f7dc0bd531..0dc6d7e07213 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -11089,8 +11089,24 @@ static const struct attribute_group auxmac_attr_group = {
 #define HWDD_NOT_SUPPORTED	BIT(31)
 #define HWDD_SUPPORT_USBC	BIT(0)
 
-#define PORT_STATUS		GENMASK(7, 4)
-#define NUM_PORTS		4
+#define PORT_STATUS     GENMASK(7, 4)
+#define LID_STATUS      GENMASK(11, 8)
+#define BASE_STATUS     GENMASK(15, 12)
+#define POS_STATUS      GENMASK(3, 2)
+#define PANEL_STATUS    GENMASK(1, 0)
+
+#define PORT_DETAIL_OFFSET	16
+
+#define PANEL_TOP	0
+#define PANEL_BASE	1
+#define PANEL_LEFT	2
+#define PANEL_RIGHT	3
+
+#define POS_LEFT	0
+#define POS_CENTER	1
+#define POS_RIGHT	2
+
+#define NUM_PORTS	4
 
 static bool hwdd_support_available;
 static bool ucdd_supported;
@@ -11108,7 +11124,96 @@ static int hwdd_command(int command, int *output)
 	return 0;
 }
 
-/* sysfs type-c damage detection capability */
+static bool display_damage(char *buf, int *count, char *type, unsigned int dmg_status)
+{
+	unsigned char lid_status, base_status, port_status;
+	unsigned char loc_status, pos_status, panel_status;
+	bool damage_detected = false;
+	int i;
+
+	port_status = FIELD_GET(PORT_STATUS, dmg_status);
+	lid_status = FIELD_GET(LID_STATUS, dmg_status);
+	base_status = FIELD_GET(BASE_STATUS, dmg_status);
+	for (i = 0; i < NUM_PORTS; i++) {
+		if (!(dmg_status & BIT(i)))
+			continue;
+
+		if (port_status & BIT(i)) {
+			*count += sysfs_emit_at(buf, *count, "%s: ", type);
+			loc_status = (dmg_status >> (PORT_DETAIL_OFFSET + (4 * i))) & 0xF;
+			pos_status = FIELD_GET(POS_STATUS, loc_status);
+			panel_status = FIELD_GET(PANEL_STATUS, loc_status);
+
+			if (lid_status & BIT(i))
+				*count += sysfs_emit_at(buf, *count, "Lid, ");
+			if (base_status & BIT(i))
+				*count += sysfs_emit_at(buf, *count, "Base, ");
+
+			switch (pos_status) {
+			case PANEL_TOP:
+				*count += sysfs_emit_at(buf, *count, "Top, ");
+				break;
+			case PANEL_BASE:
+				*count += sysfs_emit_at(buf, *count, "Bottom, ");
+				break;
+			case PANEL_LEFT:
+				*count += sysfs_emit_at(buf, *count, "Left, ");
+				break;
+			case PANEL_RIGHT:
+				*count += sysfs_emit_at(buf, *count, "Right, ");
+				break;
+			default:
+				pr_err("Unexpected value %d in switch statement\n", pos_status);
+			};
+
+			switch (panel_status) {
+			case POS_LEFT:
+				*count += sysfs_emit_at(buf, *count, "Left port\n");
+				break;
+			case POS_CENTER:
+				*count += sysfs_emit_at(buf, *count, "Center port\n");
+				break;
+			case POS_RIGHT:
+				*count += sysfs_emit_at(buf, *count, "Right port\n");
+				break;
+			default:
+				*count += sysfs_emit_at(buf, *count, "Undefined\n");
+				break;
+			};
+			damage_detected = true;
+		}
+	}
+	return damage_detected;
+}
+
+/* sysfs type-c damage detection detail */
+static ssize_t hwdd_detail_show(struct device *dev,
+				struct device_attribute *attr,
+				char *buf)
+{
+	bool damage_detected = false;
+	unsigned int damage_status;
+	int err, count = 0;
+
+
+	if (ucdd_supported) {
+		/* Get USB TYPE-C damage status */
+		err = hwdd_command(HWDD_GET_DMG_USBC, &damage_status);
+		if (err)
+			return err;
+
+		if (display_damage(buf, &count, "Type-C", damage_status))
+			damage_detected = true;
+	} else
+		return -ENODEV;
+
+	if (!damage_detected)
+		count += sysfs_emit_at(buf, count, "No damage detected\n");
+
+	return count;
+}
+
+/* sysfs typc damage detection capability */
 static ssize_t hwdd_status_show(struct device *dev,
 				struct device_attribute *attr,
 				char *buf)
@@ -11132,13 +11237,14 @@ static ssize_t hwdd_status_show(struct device *dev,
 	} else
 		return -ENODEV;
 
-
 	return sysfs_emit(buf, "0\n");
 }
 static DEVICE_ATTR_RO(hwdd_status);
+static DEVICE_ATTR_RO(hwdd_detail);
 
 static struct attribute *hwdd_attributes[] = {
 	&dev_attr_hwdd_status.attr,
+	&dev_attr_hwdd_detail.attr,
 	NULL
 };
 
-- 
2.43.0


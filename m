Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C64D35B156
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Dec 2025 12:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765886725; cv=none; b=oZw4rkGkpNPTPEOv5z4nqgDgAi9/JAcOOqHJCj7PyDnpZyneMrcsz7KhTv4fRnrE690qV1JdTGPl70/ALFy+B8oarCEIUXEXVrfXcnx1l3+tLbPHvuS1c2nX8BNzX2aPPsZG1Y9uj6ak1cGnscq2U7YjdxXK7SadiPldNmMLFQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765886725; c=relaxed/simple;
	bh=Cj/KD42roPai44YdgJdj/bEXmMNQ0vIoOC43DDitpCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ozrhrKbcsuTf1hASGMuNDU+mhzi/UWyeA7o5MeZ/GPbt5Wv2F2lP/qJ2Iq4Hmo8teIQWnuN7l46rJpoG+YWsvio/WdVW5gRBaj6NzEu8frT8umLbE5maP8WqkixS916Y5GHCXhWueB0Lu9W5ci8LBkh7u3w3MFcGFuKF71sUwrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CiJAW2an; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CiJAW2an"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a0d52768ccso27405815ad.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 Dec 2025 04:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765886722; x=1766491522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26kisLlQiiwX9VAw6X8tW6FunQDbD5zU6HHzOtQd9ds=;
        b=CiJAW2anVzhFrW7oY9CbV66TuzZQ9PiOzkwp7gUEY8eBPUegpgd6CX/desqdwhlxr4
         Gosvts0awd4TkMThOPQuvYMxG0MBPqXB/aLMQUZy7+EWrMQJpGEPKlbthd2FQ/mAt1N5
         jgg/f45wmAjpyujdjIy8qhup5Nq6Yc7FFdeLcNwtq1cFaznO2+6GLaUl4ov0sv4jm5dJ
         3E/VDRiRNsKxlHZ0XBhqKEOAFhYPfkAYFVAxscPP0/Lqhr+ZZz8YU0byu91GewmpQe7A
         Kc4qLeFLfLC2hZS5tGZDCSBEGo7nH48uMTiBtMQmk+frVKQbwe7m7uxiJbptGzCYkqTT
         MSAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765886722; x=1766491522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=26kisLlQiiwX9VAw6X8tW6FunQDbD5zU6HHzOtQd9ds=;
        b=KPlDHCP0+AY8IEb71/O9AqiInvj6RSQ90NoDX4yfzqPwCSSt7Trw5LEBro3bt1L34Y
         +VXgTmhpHa2k7YEhdYrW7/ghF13i0OMyyvnqMIKTIBN20/uQjN7eQl5/veX1OrBDnq5I
         qmuK5lRFCqWr0YUjiKkdDJ6y74svvOapWkrC50tEWVGjJsFUg67/1OiFTz+gxOnByQqR
         hI9Emnr8ak7a8+mqQORJuSxgsD7ntUx7vC6dhtFD26YexWDZEja4LYGeI71Zx/dghI18
         OLzOJyIZonrlDT445MaYFfPc1N7Ck2ycrlss6TL1xH9rQyviD+zt9NPeoH+QHLMSKWjz
         /BlA==
X-Gm-Message-State: AOJu0YzwGvNqBXIqnqNAzcpNuyP45W3tGxINDjZ5VTQiDntk4fI0fEli
	tyS4cEqENAK33UqGv2bCWSiaYOofGLEfm0yEFa6D5YTyK6eXId4esGWR
X-Gm-Gg: AY/fxX7K3hU5uJpDMzOyUMrjBdUxtoycc02hO7epwiyOa11WejTvsIKR3VW6LVUGudH
	weRnoFEqnMEOQbu4gD8lEcQdzv2461Q3g3YQC06KT85kP2RZXy3eYsnafAbFJEIh3RnN/qEtHpi
	z+o0f+06o0LrnwlvfovTTxl64t8h1z1wjqhJgLdB186wgeLVV9aZC3io7PK2VfGsngJ3PDOgY3z
	LZi6BeGmlWPxGcaHfNFEfbAJ74fHn7apfhf0e3t/QgFtXq+kR+EA7WyTi2SiR2dFVRl1ooeiKWT
	247haCPJbixwivpbEYBV6AOIJLq4cZE3fU0O4igQ2dXzDacyBKXkfgHbRZf15RJo3OY9TP4xC9E
	rHLRBXB/m6kBXrSBF6lKRQO/BX9L/iu6CN9NjSe6C5kxlhnZ/UbJUj1/SrBzSJecvJc7VERABhG
	dSMcbedds8DXHtpRRBsu4geeNLpcI95iNw
X-Google-Smtp-Source: AGHT+IGhDytGNr+3wEVd+HPkzYvRpXMRQZ/dzsynu61xXbnyW4P90DOSNw5dL/Xd5uJ4h/aePt9Ymw==
X-Received: by 2002:a17:902:ec81:b0:2a0:d34f:aff3 with SMTP id d9443c01a7336-2a0d34fb47amr82330005ad.18.1765886722163;
        Tue, 16 Dec 2025 04:05:22 -0800 (PST)
Received: from nitin-ThinkPad-T1g-Gen-8.. ([2405:201:3006:188a:9344:a089:f162:6625])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29f177ff327sm132932335ad.101.2025.12.16.04.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 04:05:21 -0800 (PST)
From: Nitin Joshi <nitjoshi@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	njoshi1@lenovo.com,
	Nitin Joshi <nitjoshi@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: [PATCH v4 2/2] platform/x86: thinkpad_acpi: Add sysfs to display details of damaged device.
Date: Tue, 16 Dec 2025 21:04:54 +0900
Message-ID: <20251216120454.41076-2-nitjoshi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216120454.41076-1-nitjoshi@gmail.com>
References: <20251216120454.41076-1-nitjoshi@gmail.com>
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
Changes since v3:
-Fix documentation build warning
---
 .../admin-guide/laptops/thinkpad-acpi.rst     |  13 +-
 drivers/platform/x86/lenovo/thinkpad_acpi.c   | 114 +++++++++++++++++-
 2 files changed, 122 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
index 2db05f718b11..3a37b14863a8 100644
--- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
+++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
@@ -1580,7 +1580,7 @@ Documentation/ABI/testing/sysfs-class-power.
 Hardware damage detection capability
 ------------------------------------
 
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
+- No damage detected
+if damage detected:
+- TYPE-C: Base, Right side, Center port
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


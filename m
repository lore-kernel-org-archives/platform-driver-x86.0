Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E3833F390
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Dec 2025 09:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766569835; cv=none; b=r8pgtDS+y199yICJaNrErISQmqQZXIghjaQEPJXsmN1gXL9JyLwciSfEAIeJihICU6ylhyXzFQUNxj6yLrE1AHlJOsOBWCPdPEMkjUwN236EN+zkje8ey3y3J4ful0RTrO7nOHZMO2EmI+15WIkexuKV75OTyonRPxilW8I4+dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766569835; c=relaxed/simple;
	bh=V5EGk4BGjnS/4/eleHFD550gqcXi7T6uzPhHKGSXLaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XKXKItAOjDs8AXc/8ATOdNEcnVcYUdwcsCfpK3OGr1W6NegbqbBBe7iv/TOTixrJZJEbDRtzXc1uL4kxnVQ7HBlJhkBNu0UNflmcM66XKRY0n+lMcX1Dyo/fkgVhZQfcH65c/9viRLRpjyyuqp9fs2Wp68B3uVCcsJsA27PiLIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MJ8OKaHM; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MJ8OKaHM"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7bb710d1d1dso8044620b3a.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Dec 2025 01:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766569833; x=1767174633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hn8WmsMwEydmglOkF6CvabWkz0d6PWX3JFU+DhEGtU0=;
        b=MJ8OKaHMvj6B6bpXhf7ZqpAW6JV4EW5BKcc9hhtI8+cVqouYjMYafC9TScyJmhUn+o
         cnYvBHY5KklfHrdhrLhOG6PkCSaszIChMybBpsA4Xubf1C+2stFomKeGk73UvdnfO7T6
         zUb1MIGUjrOITdNaCkKnfZW4CYgeRHy17maxK5RGdBW2Os/n7gprpWJl2vsH4lTJIJb6
         3hHR7VBWwe9N1ly/hDuhNniUPd/BKLpsfibk5fAcNmOQvQtx//Z1O8wMyJOQCtWXFsbq
         MtsS3rFB4YG7tTenBuBftARYX604A30OlT/6ew03D5WEOXDhyuUp8TYVFxa5HaOyzIH/
         F8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766569833; x=1767174633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hn8WmsMwEydmglOkF6CvabWkz0d6PWX3JFU+DhEGtU0=;
        b=oxsKmdM6ZlcCfilJomjuee80W0yjYfOhnLLbjZgEi0KkVwTCbEiP/ADeYWTQtW1FS/
         25wDF/jnNc6BdwHvRlMYz0jE54abtZDNLGxgH88LMS3plcsu81qG8Yn7dkkpyHiBxXk4
         4JIQp4MzkxpZr59btvAFNn2HzbpJkMZhSXzLypCQOmJzZSZTrGv5VbFpRvMftyitgq1d
         YP9Fp7iYDQSEZei7NV5aZuuBeQQjVuDTstk10VqZbcGt7jj3g4sZS/tuDLsMduKAxV5q
         QZLykS0gmT+cZwSa0yZux/1IOZPETXodEXNqoN9e01LhKtVK3Pg9VJXRPlOD0Yfs1WIZ
         u0+Q==
X-Gm-Message-State: AOJu0Ywx/IFFKlcaQylbop5O4Blm3HdSuxEYad/ZCdZDTDeuHQ/+Y1b6
	737XVqHb8u8ZnxEY6jWOW79SKoa4Nk70yIqVRFGeNwcvww8hPSXqNtKx
X-Gm-Gg: AY/fxX5c7ddcKjbNRHMlyCMPE8ukkzQGxNKMseLRBF03ResPTPGb7bfXITl40n7Vk5k
	+/tiZHyCYl/xG3acIoLX4Pe2JVIe9yOjOJ0q1uOvZbmY2KPUMBwfTX2vQnZYifdhm8uvzMgwZjY
	6rViiNUBD0HujYGVNzIk4Uvta8XwjllJ9chhkNsPHb/UF9kSoRUqykRsgtN9f/LxL1O4+fR1UCX
	WhiJRhylnwtEf8u6xM7uJy4S2uYoMQ04tohf80a/KOj1nvksHvETMouokUSMEoV29st/b/s0S89
	dI45hyANRRZPugwUEARi6AAupAW83emQycmiZb368QUkoRMLLJIuUlcnlDNNlh3rDvMHHRemk80
	DMEjWU+aUanPjXDuuMb8eQDLeGny0qIlGAv/ChRqVQ1vWC2LLH4WyIdrX4bakTShhK5rhfak3aJ
	0N/QKih/c4BWeX5DWaRTYx7KhoPOvv4A==
X-Google-Smtp-Source: AGHT+IETVJYi2E5BtSLEGF8Rmd3fNXRH+VBDvZUg94MbaZzPvtwxOLMq/Y/lo6J9evMOoL+usBQSLw==
X-Received: by 2002:a05:6a00:420f:b0:7ac:1444:6777 with SMTP id d2e1a72fcca58-7ff646f9380mr16325759b3a.12.1766569833193;
        Wed, 24 Dec 2025 01:50:33 -0800 (PST)
Received: from nitin-ThinkPad-T1g-Gen-8.. ([2405:201:3006:188a:9ac9:e6ff:432:bb3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7aa328basm16372003b3a.11.2025.12.24.01.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 01:50:32 -0800 (PST)
From: Nitin Joshi <nitjoshi@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	njoshi1@lenovo.com,
	Nitin Joshi <nitjoshi@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: [PATCH v6 2/2] platform/x86: thinkpad_acpi: Add sysfs to display details of damaged device.
Date: Wed, 24 Dec 2025 18:50:19 +0900
Message-ID: <20251224095019.11622-2-nitjoshi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251224095019.11622-1-nitjoshi@gmail.com>
References: <20251224095019.11622-1-nitjoshi@gmail.com>
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
Changes since v4:
-Improved indentation and removed extra line
Changes since v5:
-Improved indentation
---
 .../admin-guide/laptops/thinkpad-acpi.rst     |  13 ++-
 drivers/platform/x86/lenovo/thinkpad_acpi.c   | 104 +++++++++++++++++-
 2 files changed, 114 insertions(+), 3 deletions(-)

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
index 3702374357ab..95755fa1e008 100644
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
@@ -11108,6 +11124,88 @@ static int hwdd_command(int command, int *output)
 	return 0;
 }
 
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
+		if (!(dmg_status & BIT(i)) || !(port_status & BIT(i)))
+			continue;
+
+		*count += sysfs_emit_at(buf, *count, "%s: ", type);
+		loc_status = (dmg_status >> (PORT_DETAIL_OFFSET + (4 * i))) & 0xF;
+		pos_status = FIELD_GET(POS_STATUS, loc_status);
+		panel_status = FIELD_GET(PANEL_STATUS, loc_status);
+
+		if (lid_status & BIT(i))
+			*count += sysfs_emit_at(buf, *count, "Lid, ");
+		if (base_status & BIT(i))
+			*count += sysfs_emit_at(buf, *count, "Base, ");
+
+		switch (pos_status) {
+		case PANEL_TOP:
+			*count += sysfs_emit_at(buf, *count, "Top, ");
+			break;
+		case PANEL_BASE:
+			*count += sysfs_emit_at(buf, *count, "Bottom, ");
+			break;
+		case PANEL_LEFT:
+			*count += sysfs_emit_at(buf, *count, "Left, ");
+			break;
+		case PANEL_RIGHT:
+			*count += sysfs_emit_at(buf, *count, "Right, ");
+			break;
+		default:
+			pr_err("Unexpected value %d in switch statement\n", pos_status);
+		};
+
+		switch (panel_status) {
+		case POS_LEFT:
+			*count += sysfs_emit_at(buf, *count, "Left port\n");
+			break;
+		case POS_CENTER:
+			*count += sysfs_emit_at(buf, *count, "Center port\n");
+			break;
+		case POS_RIGHT:
+			*count += sysfs_emit_at(buf, *count, "Right port\n");
+			break;
+		default:
+			*count += sysfs_emit_at(buf, *count, "Undefined\n");
+			break;
+		};
+		damage_detected = true;
+	}
+	return damage_detected;
+}
+
+/* sysfs type-c damage detection detail */
+static ssize_t hwdd_detail_show(struct device *dev,
+				struct device_attribute *attr,
+				char *buf)
+{
+	unsigned int damage_status;
+	int err, count = 0;
+
+	if (!ucdd_supported)
+		return -ENODEV;
+
+	/* Get USB TYPE-C damage status */
+	err = hwdd_command(HWDD_GET_DMG_USBC, &damage_status);
+	if (err)
+		return err;
+
+	if (!display_damage(buf, &count, "Type-C", damage_status))
+		count += sysfs_emit_at(buf, count, "No damage detected\n");
+
+	return count;
+}
+
 /* sysfs type-c damage detection capability */
 static ssize_t hwdd_status_show(struct device *dev,
 				struct device_attribute *attr,
@@ -11135,9 +11233,11 @@ static ssize_t hwdd_status_show(struct device *dev,
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


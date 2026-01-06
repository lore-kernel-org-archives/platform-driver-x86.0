Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F33B35A943
	for <platform-driver-x86@vger.kernel.org>; Tue,  6 Jan 2026 17:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767721551; cv=none; b=jLtRVn8BqGzs00KBr62okT0pdUp5va+Qv/vhuRehJSlfmHICdvO51kbu9Iy+LWRf1/88sZridFLj+5fkp1b4jSNFbDqFhOushSrjKw1KiS25wpI1zLhpYXUtnjgQSzs0jD/Km6zHgHfrY5e0/iosWBrcYpy/PvhidoWJVrUbbOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767721551; c=relaxed/simple;
	bh=pjoBu6/NE6BVKjQnU/oO7uqGFyKlBVaCQFmgNJNL1Aw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YGgIDmYRtvdy/S6QfS7s876sj5rLSpX7GsiSxB1Wd4ucyd+VCoJ2tgd4E7v+NIjIuClDZe2y7H+YYybjq4VrC6YFx/c+ikaI3P8/Et8ktpkmwh3mm1s8PuZhjeyjnB2uAVBnxWDamGlx+Sa/DAulny2NyyMLjKsQAClA4/0NKJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G/tdGBQ3; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G/tdGBQ3"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a0d0788adaso10371135ad.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 06 Jan 2026 09:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767721549; x=1768326349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ruOQy1cPNsptD+7bq6IVfukZJftaWISvQkr6Jl3Z1dA=;
        b=G/tdGBQ3Gm9jYV7iCAQbe0yL28E5ruosMlv27UdbYbSgCJV15BGeNOKGaBz+LSJTIG
         Dtpv90OCSMZifqHWcHq7Q2MjFlsVIrFUMXDaNw90yOPPl4lxX7RLKJehPiB2ymYE2TAA
         cgddTHKif28Y88MDiAhzgb+WAkNoxasHWdOCoZLj00fM57btoWEvWSalwSDAaIlbvN7H
         nhVNvotGCFZU2tmhQNPDct2/pnUfVk3rn/Ka2tnzjt7m38x5MZmHWADSi7ZweqCY8lMw
         HWsVjLEmUIo7vq1VXiWa9URo2QgLGZw5AdBvoN1e9XPzCCSLh/oJe2Vun5I6Puv5+dEQ
         x/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767721549; x=1768326349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ruOQy1cPNsptD+7bq6IVfukZJftaWISvQkr6Jl3Z1dA=;
        b=M1pR3rwic0VIpAzqbsJyFnmgJHNjzfNeBTD6rxRs7hlgF56yoUuW0yjfNmV2OR1iFe
         aSNlxG2zvbGY/VgdS42PVmdLZP1ap3YD0sBdQo/2Fu44bE4almJpTvJBEyghXTB1538B
         bo0zAkZH7exXCBc1B5u5Y5YVn0Pc5Yii+MOCLXVULxMBtEgT1XvrdUUuMYadu/O3lGt2
         hssrWotWJPdKI1oLJVWi7xr3cL+YJC0huvWkQLRj3In5nISdxI98Ush0Tlv05L8V8Wyh
         75XvY39h5/e2NknhgO/KZdVOlVEWnx8JRd7Drg7A4iy2+4pZjSBBG99/QAf+bSnysOiY
         I9aw==
X-Gm-Message-State: AOJu0YycZpcN0Fd4t/b/iWFq2275xhhnw/WV8UsWbHdxpOe7FqM7Md6N
	nIahP4V/jtM9jW9Qr3xAmGK9Ul8oZhqQj+i6tgBsDbahP7/AojYkEPSM
X-Gm-Gg: AY/fxX69lTVJefJ4rLmFcSgL6XI7TlxKcg8rRwBSpkyPTKhSrObqOIz09pfQ3xqWaqa
	zuqxFXGBuOcKRyPW4Shzd+z0pZMr/oqliUts4Irjm2Nu818Hqc61fE5iZfiJvorTnObTahuQEKQ
	LYMT35F0jNtVK+iM56HhH2bIErkK/VhuoCkR4otrzXlCSKtEtDmHmnH2gsbwRbh1YxTHSpcyG2t
	fIno9RdTysaHH6oOXNAmB60jfM/i1InPBVi9yueHuXKldp2l8/t0Ze4XaSILoXTWIaejXW1bY0O
	uFmM9jCFUsDVknZU0m8ZAxBorf1hisNsndQUSspHQGyRZYpzmIHI2sB6EERXTZiulafY+JdcooW
	bzZjivfHsxAZ/KpuqSQK7/hYe6APFi/mxnz2j4QYIFN3IKMx/B62Dp3zsAm9Dyr2t/moEz9iEm0
	Mf3zHzCGK8i5kGg8Z+P6dQASygswKm8zA=
X-Google-Smtp-Source: AGHT+IG3PZ93AUEpqL1CwnVGRBKdi9RAZXjfCII3Rk2LB16IWyZ4rf3RtQ+Zqo50i+XreModHG0YGw==
X-Received: by 2002:a17:903:1c7:b0:298:efa:511f with SMTP id d9443c01a7336-2a3e2cf42f5mr32367375ad.39.1767721549207;
        Tue, 06 Jan 2026 09:45:49 -0800 (PST)
Received: from nitin-ThinkPad-T1g-Gen-8.. ([2405:201:3006:188a:8d12:f5f:47cc:6a19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c52fd904sm2736818b3a.33.2026.01.06.09.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 09:45:48 -0800 (PST)
From: Nitin Joshi <nitjoshi@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	njoshi1@lenovo.com,
	Nitin Joshi <nitjoshi@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: [PATCH v7 2/2] platform/x86: thinkpad_acpi: Add sysfs to display details of damaged device.
Date: Wed,  7 Jan 2026 02:45:19 +0900
Message-ID: <20260106174519.6402-2-nitjoshi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260106174519.6402-1-nitjoshi@gmail.com>
References: <20260106174519.6402-1-nitjoshi@gmail.com>
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
Changes since v6:
- Improved formatting for htmldocs
---
 .../admin-guide/laptops/thinkpad-acpi.rst     |  17 ++-
 drivers/platform/x86/lenovo/thinkpad_acpi.c   | 104 +++++++++++++++++-
 2 files changed, 118 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
index 2f910ff31b37..03951ed6b628 100644
--- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
+++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
@@ -1580,7 +1580,7 @@ Documentation/ABI/testing/sysfs-class-power.
 Hardware damage detection capability
 ------------------------------------
 
-sysfs attributes: hwdd_status
+sysfs attributes: hwdd_status, hwdd_detail
 
 Thinkpads are adding the ability to detect and report hardware damage.
 Add new sysfs interface to identify the damaged device status.
@@ -1595,6 +1595,21 @@ This value displays status of device damaged.
 - 0 = Not Damaged
 - 1 = Damaged
 
+The command to check location of damaged device is::
+
+        cat /sys/devices/platform/thinkpad_acpi/hwdd_detail
+
+This value displays location of damaged device having 1 line per damaged "item".
+For example:
+
+if no damage is detected:
+
+- No damage detected
+
+if damage detected:
+
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


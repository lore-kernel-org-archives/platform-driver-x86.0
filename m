Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFD1335560
	for <platform-driver-x86@vger.kernel.org>; Wed, 17 Dec 2025 06:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765954547; cv=none; b=Q71IcRNnxUzB9kxqNVOCkam7/IirgI3FpvawMJ6CnDbC9NFClZ7UDIpjlsIp26maMIx/2yhCLlTMGRJ01gtitKiIzQ3hsTxuZVul8CIBLjwwlYZLAFKURi8KlyryMvbYX40baA8XilOP76enbQ2NmQ++Z8vB58mG6F52DqU+Bq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765954547; c=relaxed/simple;
	bh=xnLGLpMsz336NP9jv8w0YNLGH0e5zkCBwuzsowlnHFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AsNeDnzeZUpyEVSg/MMXfbG7SRDl7GLnscegmzRV+jKL4IEURqfxW0CFjEJAbgJS+9bVOSaT7VVjg/fs7GwX+cbaF9t3MI0+Zm+ELG/IM6nTqw0z+38eUlQxd7pLfpji7Q8UIfgOLYjMu2CzuBtmGJ3MqgqhtfXLdo/+X6fCyFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LpgSaIvL; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LpgSaIvL"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a0833b5aeeso59708885ad.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 Dec 2025 22:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765954544; x=1766559344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kiteDKjxHplFnP15KLqe/F1Q3CnjL7YFs4HujDYREUg=;
        b=LpgSaIvLPl/N+5Mq5PVwXJzGwMGSmm5MgYo8eqowLvMQM5vdNyfypWmJS8ZfTiIkto
         fQWxfliU/rUoycT6Mv0Q9td+M4uhGJEl+1lO+0eUU0Y2AIbqxEIFoNI0CQEM8aFIk9ud
         gPaYInEuviULHS7w8mMJDLROJkcughteUrXCFNTg+L1z5voFlmftb/84DbqWYtFeqGx7
         9aCw7PpN3Dt9Fg8Eg89SeY3WsFwVtUexZTUSRTBeH2/JG1YdFcSVgEGDr2DJEMTL02LF
         YA/EF6elYUHCZNlsR8n5Ld/j5UXbDVddyKX94cwFseDgEsrpuv4/iKLe5v99z6cbFLZk
         rQKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765954544; x=1766559344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kiteDKjxHplFnP15KLqe/F1Q3CnjL7YFs4HujDYREUg=;
        b=I8TKLp7WdXUr7HWExoJbj80lTYLpPEw2cm5dtwhDzI1p15sS+PkXzizxTg2rztaIrD
         FzCEZhD/CtZXT7goyNx8SDLg/2UHpVAynAz+489ncZL/uW0YtdwxaHd4WgcJHI184tYt
         nCNy2OSoJaqtd0V0LlCXHisb4OdX/JhbcLj6vIn19vWDG8/cPqiQtvtH9oCkwDxLFpT+
         6lWt3vd7yUhcjirQ+WNwMiYv9xCgBM7yOyy2XDn0W3HiFOlxs3RjT83FmRR34ZIlmNMB
         srv63ejB5qQcx8VqsSnNo61vFo+5HCjfIakIx0/4OWR11rqNxKZU4woE0qvzj9sewdLW
         hEng==
X-Gm-Message-State: AOJu0Yy1qkE+bRvunlhJ1sW5SUjCDPVKXjXsmXjnCIdMoiR1HUUpIMSh
	rpRaFuETg+3bkwyDoUR3vCuUBn4mB2Jc7O+hYxQREekmaOAYGFYRs8nG
X-Gm-Gg: AY/fxX7bfO5rV5VHqioB1bmFpHFYdDIDk6Zn6NgkQI7mXrZ2JBwFEmPl3doOO98GMjx
	0DZA8oFcB8cjxAzUec10stxfBzRDdBSyUKcPRdfwmdouLRQakxJg0R2tKapDszai0/KYEx25k8B
	0mT1qJXLVRAaovb0RefsVOiIb+OyW3sgzb5ErQt+9WZAS/XmICDcUSIjeMWYhC7yuSLVdIpqnXC
	FEBV3VZ/7vjN1Ts81tj3Gs4tkyTSC8vQvsK/fLT+NMJ2f9HaNt0DDNdb4Cwp2eIuX7+rGT1udtq
	qekf6U30EbXpj4hs1G4jCWaYixw/1WOLt/Hd7BwGqxmiYyo6+EVVp3yIpaAm3uBFLIKk7+KmPnI
	G/htiA/mc/ZoikWej/37FXYBjGoZvbSkq5joJrwTeOpcvynK0RmsB7XYpMMoVk/+Ri6GGwqHUkc
	2wwT7Bq+sw/47T+ljHYsUxP0KEX3u0UmZg
X-Google-Smtp-Source: AGHT+IHGpo2E0TpRh1TBdXxCqpRQALfaHo1iXyimni/N654641YVrplatATMDfjaI3PeSflOvjdbeg==
X-Received: by 2002:a17:903:384f:b0:2a0:d629:9035 with SMTP id d9443c01a7336-2a0d62993c0mr113804975ad.3.1765954543584;
        Tue, 16 Dec 2025 22:55:43 -0800 (PST)
Received: from nitin-ThinkPad-T1g-Gen-8.. ([2405:201:3006:188a:4b8f:99bd:7069:8c6f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea06b49csm188230235ad.95.2025.12.16.22.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 22:55:43 -0800 (PST)
From: Nitin Joshi <nitjoshi@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	njoshi1@lenovo.com,
	Nitin Joshi <nitjoshi@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: [PATCH v5 2/2] platform/x86: thinkpad_acpi: Add sysfs to display details of damaged device.
Date: Wed, 17 Dec 2025 15:55:23 +0900
Message-ID: <20251217065523.48399-2-nitjoshi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217065523.48399-1-nitjoshi@gmail.com>
References: <20251217065523.48399-1-nitjoshi@gmail.com>
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
---
 .../admin-guide/laptops/thinkpad-acpi.rst     |  13 ++-
 drivers/platform/x86/lenovo/thinkpad_acpi.c   | 108 +++++++++++++++++-
 2 files changed, 118 insertions(+), 3 deletions(-)

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
index cb1f6dae9334..2e317e13d984 100644
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
@@ -11108,6 +11124,92 @@ static int hwdd_command(int command, int *output)
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
+	} else
+		return -ENODEV;
+
+	if (!damage_detected)
+		count += sysfs_emit_at(buf, count, "No damage detected\n");
+
+	return count;
+}
+
 /* sysfs type-c damage detection capability */
 static ssize_t hwdd_status_show(struct device *dev,
 				struct device_attribute *attr,
@@ -11135,9 +11237,11 @@ static ssize_t hwdd_status_show(struct device *dev,
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


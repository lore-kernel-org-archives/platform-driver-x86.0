Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B9728934F
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Dec 2025 15:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765379518; cv=none; b=rgAShqwgGnPikJRgOI1B4Yga0o8mOtYsAFRz6/ubxXRxnzSjDUCMZMWZaJH+MpnQYlk/4FvQolsn1Az6rZm2q0aHltdTi8Ck/DRlyrORseImDqlSYHnA09/ypmSCEdOMTvSVaysQBom0cs50QMHQPdzrb/ab1/i0dGxAEQ1mAFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765379518; c=relaxed/simple;
	bh=hmxTEveZtRPLZzZuDxtMOmSCJJhUg6YUZYnxgtbaQY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nzyUA7hDHx74Pw5QwA2Gess4xao8IkyyV5PXvHJngsmDr48+6BBjovmJF2s++UjEBAegM6T+KsjEG4LkQzOX2MWLW1uA5dt1Cmc58tXBMTSApn3EGfjypWMASQFKsIGE6bSEj5KVbT106DYuLm/fVdrBxkGJmnT5fHOX9ZENuCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QHnwy4cH; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHnwy4cH"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2956d816c10so80323205ad.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Dec 2025 07:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765379516; x=1765984316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g8QeyBqG4eSgs5TRH01cgNwwBFzAeViL62yZhTUE75E=;
        b=QHnwy4cHQIfnbbX/qqyyFQx6TNMf6FMhmooQA2OOc85Z/f1j1v8oaZOkj3RQz2A+PF
         c+BMSja+3fr0mfpJhRzznYzuA1DGoXI4Bh/HSsOU3hnAcmVR+UKR5JbdJpgmzjqwKYM6
         5c5Ql+FIAnQhqNaf1hSSUuG40W8Y91dt5ncyJ781Lyom5VgwMNhPJM+VQxs8+1dd+Q8/
         VhXKhXVnaQ76R/waM0jHq0h5rRjEThwBAF9Y8XO7Kmy2SaP/WJY/khZ0V92MhUZNzbXL
         Ur1WVFu4wYhP8UJGmj1w6JL2/710HPNR6Q8eI8z+gf8XaE6rVzhwUS8Zss81qijOZ/Fk
         eVeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765379516; x=1765984316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g8QeyBqG4eSgs5TRH01cgNwwBFzAeViL62yZhTUE75E=;
        b=hjycyGeLuqTqeYtQrhG9LO4GOGyrVs7XBy0srDV4DWEKEwjT3K93UgfmNj6TlJBGys
         J0NsrTPvL8h0MdOLAYLN1ojXj7iJQF5CGMCuBPeh5MfV8+bhhJ8JHUUKNnqPivf738W/
         UUvztaTBRP0+eKuZQqjByucL0w6fOSeQpeBp26mbpCsv9Brp6whlgUfls42g8r1Jhvr+
         LQiNvgHeYikBem3Xmep+eGVxLRWtnx9GSrrvvGT+/Tzt/EvylVe1+4KdoTpTmcU4nLBd
         mFBU1ogKiFGJNtvxvKEHvx4sYPPy3jDXK/42wRlVyEfK1xGLGbRUUGgWfNY9gJfWzXaq
         6kuw==
X-Gm-Message-State: AOJu0YwoAkbKb/2Qnna+OAAlsEUKgRpkkfEeNOMiU++1euahDCXMRddF
	xR16b4b5ruV8yHAU8/yZZ48uNFFOO85Bc+z5KA84ZCazpAPIJTjccv6D
X-Gm-Gg: AY/fxX4GNRe+IZfkwU1yYQhAjAOQLWhvXFSIaeLkz5pDZ49VGdBVmN3XTRngxItHhBa
	wpsppsUWkkDH/daRDgC/HEs/wc+xIEhU38YUAAFaNJnK8EwLl4x2sOv2azuc4Pe8nl36t+NBs5l
	Lp97ElpqAvKzWtC87T/EWL5OMmJGDf/2RUn+0AJhxbLUWtjUUTByPqR8+dP7Dhljzbo57xZ1JNA
	8i7BoVY/UBbCo0OUAFTCEqh3/XjT9z274sIcIgk+L7f1rrM+tt7Xj/6RQ1R4TqRVhziwwPSYqZb
	nCAWQFkXtJ4QMwFkPtBafiFXZwDxKNRjnjQRLZOoYDFEJg14tDoUQQ9+UDWfYimnPFRMO1bxO/r
	5GwExEG9i5io5rijEZ3bcrbW96uWPihQlMH7auTav58jUdvPY0dc4dYiFE+WjkzbzNZJV5V9cae
	BSli1QHoORxXIP9Y8IjBj7hSk8j2wDes+wefiIo3M=
X-Google-Smtp-Source: AGHT+IE5up+kjS9ChTwvy4S8B05bnda0IwKemd+1STFygk769diNE+eUFM9VKhgNAoKIbcVIs161tg==
X-Received: by 2002:a17:902:e809:b0:296:4d61:6cdb with SMTP id d9443c01a7336-29ec231f685mr29013055ad.27.1765379516077;
        Wed, 10 Dec 2025 07:11:56 -0800 (PST)
Received: from nitin-ThinkPad-T1g-Gen-8.. ([240f:102:8600:1:c3a5:292d:c23b:266f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29e9822c308sm53371735ad.80.2025.12.10.07.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 07:11:55 -0800 (PST)
From: Nitin Joshi <nitjoshi@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	njoshi1@lenovo.com,
	Nitin Joshi <nitjoshi@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: [PATCH v2 2/2] platform/x86: thinkpad_acpi: Add sysfs to display details of damaged device.
Date: Thu, 11 Dec 2025 00:11:33 +0900
Message-ID: <20251210151133.7933-2-nitjoshi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210151133.7933-1-nitjoshi@gmail.com>
References: <20251210151133.7933-1-nitjoshi@gmail.com>
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
 .../admin-guide/laptops/thinkpad-acpi.rst     |  13 +-
 drivers/platform/x86/lenovo/thinkpad_acpi.c   | 112 +++++++++++++++++-
 2 files changed, 121 insertions(+), 4 deletions(-)

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
index 4cf365550bcb..a092d57d995d 100644
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
@@ -11108,7 +11124,95 @@ static int hwdd_command(int command, int *output)
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
+	}
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
@@ -11134,9 +11238,11 @@ static ssize_t hwdd_status_show(struct device *dev,
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


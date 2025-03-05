Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9082B9A6;
	Wed,  5 Mar 2025 02:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741142016; cv=none; b=pwHw8IonbbIKIX7swn8rvmssJpCwVw195NZS6EI/9FwB4XvJRxE8wvvmqdFf6RwRlnDGMVe4hqNnXN1PqmF9Kc1DLa0JUn2gnJD92S8yrjnW5Jv3YDWun/pzZKsJaVRBEFbizoWBh+5GeSpyJZv1cvTioR9WCB1HWSTEi0oBkjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741142016; c=relaxed/simple;
	bh=HpmZuWNzhKhDZooEgV0w+CoL+y8ovQHJh7IawTz4hkM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NjPuNv4sQ2WctB74JmSGx2FAPOB1gZcVt5inmsJCBnkRuCdk7+BuIjJV2+myqS0gjVYbgoXvw3v8QyyC5cuZ9x3LD8knR05xtQC+xLKg+0gIpKPearfnGLmyczLwXvPQLpY45KHQLtJFDvKQmzXs1mmnOSxVVLz6dcvr2Q8HBaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k0phvOYE; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k0phvOYE"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ff187f027fso652467a91.1;
        Tue, 04 Mar 2025 18:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741142014; x=1741746814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4GSAgENfOxfC89eb+Rp4XOCAnqjWdXf70x0t0Zn6oHo=;
        b=k0phvOYEMpGMr9bFeRrJxR49B9lIUa/VyKqMHrnm6y2+HCr8YIZh8VqzSGDJIBPc1+
         RfBWPe2OK4VrqsXdz5q2MZMAweiNJCLRVDy+8kwlpKlpyJx83z1yuqvYwp66isIGOVNG
         DZuxmRr8jDXgx3mINvH3DtB3X/JM9RbA9KIV79k8NFtl9EeO+hh/k30+p/I8/Yp7IRLo
         H+Qoyj6DhgWu/fIihjEE/7UIyfiVoCyRPfLIChBHbSU/qlCV8nMJn+7sDWvUbGMeE1Si
         QYRUL8V2mKzPksFgxwnNA58Sl4MXycBjLgNr4XxgJkUT//1FoGzxC59xPsT6+yoH/Rd9
         TtZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741142014; x=1741746814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4GSAgENfOxfC89eb+Rp4XOCAnqjWdXf70x0t0Zn6oHo=;
        b=q/MPFy8Gpm/inPoVPC0JuiQRcHg9xrCX9pJuYE0pJ4xtsiuCnO24zn/6Y4WkECPokR
         GQwvSyxTA1ipRwWEcFYfT9yiEJPIZV24InFJPMc6JtrCmbBXnoeQbQQOSxFWt1xvxzrX
         xYf6MQVltHoqkmorFkWoJQxI50RmIIGw7s1Zpqc/B/HfGkyBAYNlpIwprQrg3fVUTBKG
         5l/1zdegMfjfkYovRT6v1WrhSu583zkE3XIbwVrAjb8//VG8Q0NA9tg6p5pkJB2y3RX1
         K5tWHmAdMmHxoArQHG/wvVDcD1V3YAX4dg90cQm+Ni3MHKp6gdDFOjRzGhrHOgQ4Kqn2
         FLPw==
X-Forwarded-Encrypted: i=1; AJvYcCWp2NrVcwOC8NGGI9ANiVIphs5HFE8gXXoXRHob2xHrp7vRk8rgEz+ylppACalLNfV1xtq2bDaLZwc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5KdSIR5MdMGdcApGdV7GlV3RBc+GgMe8xyOxP4X8xxIbTPXnM
	hW/0MXbxvZ1dOh5HmTLTkW4lnrgB4IrMuoyAfp3e2Gp8MO+UYw4x
X-Gm-Gg: ASbGncsxnUw17ze7ZGPet61YdJa9O4YrS6YmsVuf9kqPhfo4F+phAbP1wlX7Bz/7wp9
	OpGbEg+ojNepwklfz1NOFAOQKE1VKMIY2KbHE+e79aCjxHTA+gkgcDEQM0Le4LX61j8HtGp852H
	R533hskv06V6n7/0KOPkvITWrxSd4sGooZAFSRDoW1N+E41FnZ8bhz9DvTwwtjseh27KUyozLoZ
	2DM02f1g9E+Z5f1b48xR3JnIzubAPjnjybGwz8j61so7rZjPZqCw0oeX+Rkavxk5Ujqx0TyyH08
	lJkYyFZ23/EhABLx0tT9umejPkwTNwyfCv5iYymM/0ijI+YjMDcLogx+GsDNPMWV/qI6KPMlZXx
	QqqYzItGEjigUKD7AXbHJUXG5Kdh0YIhF1CDc
X-Google-Smtp-Source: AGHT+IHCZOJl87Q7hqtliBc4Iqc4H3wR/OVNQxB9m7efC1+KSWjW0kPoLD+b9J9kwjXYY5kYfgjUqQ==
X-Received: by 2002:a17:90a:d648:b0:2fa:4926:d18d with SMTP id 98e67ed59e1d1-2ff33c0a87dmr9035239a91.13.1741142014083;
        Tue, 04 Mar 2025 18:33:34 -0800 (PST)
Received: from nitin-ThinkPad-X1-2-in-1-Gen-9.. (127.37.178.217.static.user.transix.jp. [217.178.37.127])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff4e7bdb1esm167548a91.44.2025.03.04.18.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 18:33:33 -0800 (PST)
From: Nitin Joshi <nitjoshi@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com
Cc: platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-doc@vger.kernel.org,
	njoshi1@lenovo.com,
	mpearson-lenovo@squebb.ca,
	Nitin Joshi <nitjoshi@gmail.com>
Subject: [PATCH] platform/x86: thinkpad_acpi: Add new sysfs to check user presence sensing status
Date: Wed,  5 Mar 2025 11:33:19 +0900
Message-ID: <20250305023319.6318-1-nitjoshi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some Thinkpad products support Human Presence Detection (HPD) features.
Add new sysfs entry so that userspace can determine if feature is
supported or not.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Nitin Joshi <nitjoshi@gmail.com>
---
 .../admin-guide/laptops/thinkpad-acpi.rst     | 20 +++++
 drivers/platform/x86/thinkpad_acpi.c          | 79 +++++++++++++++++++
 2 files changed, 99 insertions(+)

diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
index 4ab0fef7d440..02e6c4306f90 100644
--- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
+++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
@@ -1576,6 +1576,26 @@ percentage level, above which charging will stop.
 The exact semantics of the attributes may be found in
 Documentation/ABI/testing/sysfs-class-power.
 
+User Presence Sensing Detection
+------
+
+sysfs: hpd_bios_enabled
+
+Some Thinkpad products support Human Presence Detection (HPD) features.
+Added new sysfs entry so that userspace can determine if feature related to
+HPD should be enabled or disabled.
+
+The available commands are::
+
+        cat /sys/devices/platform/thinkpad_acpi/hpd_bios_enabled
+
+BIOS status is mentioned as below:
+- 0 = Disable
+- 1 = Enable
+
+The property is read-only. If the platform doesn't have support the sysfs
+class is not created.
+
 Multiple Commands, Module Parameters
 ------------------------------------
 
diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 72a10ed2017c..daf31b2a4c73 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -11039,6 +11039,80 @@ static const struct attribute_group auxmac_attr_group = {
 	.attrs = auxmac_attributes,
 };
 
+/*************************************************************************
+ * CHPD subdriver, for the Lenovo Human Presence Detection feature.
+ */
+#define CHPD_GET_SENSOR_STATUS           0x00200000
+#define CHPD_GET_BIOS_UI_STATUS          0x00100000
+
+static bool has_user_presence_sensing;
+static int hpd_bios_status;
+static int chpd_command(int command, int *output)
+{
+	acpi_handle chpd_handle;
+
+	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "CHPD", &chpd_handle))) {
+		/* Platform doesn't support CHPD */
+		return -ENODEV;
+	}
+
+	if (!acpi_evalf(chpd_handle, output, NULL, "dd", command))
+		return -EIO;
+
+	return 0;
+}
+
+/* sysfs hpd bios status */
+static ssize_t hpd_bios_enabled_show(struct device *dev,
+				struct device_attribute *attr,
+				char *buf)
+{
+	return sysfs_emit(buf, "%d\n", hpd_bios_status);
+}
+static DEVICE_ATTR_RO(hpd_bios_enabled);
+
+static struct attribute *chpd_attributes[] = {
+	&dev_attr_hpd_bios_enabled.attr,
+	NULL
+};
+
+static umode_t chpd_attr_is_visible(struct kobject *kobj,
+					struct attribute *attr, int n)
+{
+	return has_user_presence_sensing ? attr->mode : 0;
+}
+
+static const struct attribute_group chpd_attr_group = {
+	.is_visible = chpd_attr_is_visible,
+	.attrs = chpd_attributes,
+};
+
+static int tpacpi_chpd_init(struct ibm_init_struct *iibm)
+{
+	int err, output;
+
+	err = chpd_command(CHPD_GET_SENSOR_STATUS, &output);
+	if (err)
+		return err;
+
+	if (output == 1)
+		return -ENODEV;
+
+	has_user_presence_sensing = true;
+	/* Get User Presence Sensing BIOS status */
+	err = chpd_command(CHPD_GET_BIOS_UI_STATUS, &output);
+	if (err)
+		return err;
+
+	hpd_bios_status = (output >> 1) & BIT(0);
+
+	return err;
+}
+
+static struct ibm_struct chpd_driver_data = {
+	.name = "chpd",
+};
+
 /* --------------------------------------------------------------------- */
 
 static struct attribute *tpacpi_driver_attributes[] = {
@@ -11098,6 +11172,7 @@ static const struct attribute_group *tpacpi_groups[] = {
 	&kbdlang_attr_group,
 	&dprc_attr_group,
 	&auxmac_attr_group,
+	&chpd_attr_group,
 	NULL,
 };
 
@@ -11694,6 +11769,10 @@ static struct ibm_init_struct ibms_init[] __initdata = {
 		.init = auxmac_init,
 		.data = &auxmac_data,
 	},
+	{
+		.init = tpacpi_chpd_init,
+		.data = &chpd_driver_data,
+	},
 };
 
 static int __init set_ibm_param(const char *val, const struct kernel_param *kp)
-- 
2.43.0


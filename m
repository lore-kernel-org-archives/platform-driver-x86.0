Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC13F338581
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Feb 2026 09:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770802024; cv=none; b=eyokupKvMwP3Um5tb4MJCCm1F9UFFxFEivlcU3H/zShReix2pGN66wAymqhSVx4SOJqISOFp7IsCvc833z9tbUSsWLl4uCy0GZQLPl0Fpw5WbRrGknv1tEpgIn81Hbr4B03lgOqZboCeO0OSO2JSYEtG1ss9FKT7q1x0QWk8LFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770802024; c=relaxed/simple;
	bh=DV94qfuseFusxvplrx2dXCALRLvoc4n/H9HoevKpCmg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GO4by24yvpGPdWYfS+U9XlWD3Ko5N1R47Xcyu8ioEOh6sRSTGPqwI3OxBdXnxbDBiaeff6wvy0JM3St+6V7ECJB+3MsBdHW1C0JxdDIqP7rTgRF8VFiVChPpKZZUgyZr6vRear1EPzMl21RNb4K8LeUeDq0abO+Q6vhCJPDnQbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zg1LdEI3; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zg1LdEI3"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-824a3ba5222so144431b3a.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Feb 2026 01:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770802022; x=1771406822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fm/MONFw5M6s0zO7PFtVTe+6JODzeoau1y16cdgAyAg=;
        b=Zg1LdEI3qtCpKM2qOnfEoCz2Rb+L8b1ZM+hmAGjNK0wurCb5OGUr0JXGbFBkmmcC6P
         PFhvuvfVVZscqYAfCMllecgremzgaepNNhNfzxsgr+eP2pt5KnD6DHhXDr+WOaLrWP1O
         mOt+DOhdJYyHbFxwzsn+aCPVafRPV7v+9GpIRFkFDsprB9v+PpHGUqrgoUTg9d8vIxqR
         D+FQrm1dfu5nWTTQaXh7hJXxXh/nsIAFPC6sv3kZiEa7qOmuSwzoSGmmmvo+BrFPWOqw
         FILK7iz7uiqVvBByv1zPtaKoQCsXDCypk0t0X6d8n4ek4wAg3n5gnCAkPxr3Nrzy7Q8j
         SGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770802022; x=1771406822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fm/MONFw5M6s0zO7PFtVTe+6JODzeoau1y16cdgAyAg=;
        b=RBakVBP9C1g/EVyNtcDNvuxXHw3i5wgTaQ8CRGEsyM7pwZz7+mDi6wwldbzDUsfMNC
         eOSOVyMZL/vRuVyGJlJeUdAqBY/WiyXqTsciuUfBfvD/LOGzlBtZOT5g89m5RwqD6UCc
         e5tn9zZjHj2Vswbnz0RidPUwU03A51ZCyxlA68g3+yWL4AYgF07Aq51hhSJ40he5xXD/
         n+ob09DqjScqLZkXPjOs0F0/dI7nSqtw4cNNv5/jyEqUnD80xPkQd++dnXdGtb0PsrTf
         oNFWjX5H2fk+mhSfxrVsb7OscIQ7skOIuhnaLJsTLn1BjN68jn1oIQmX13bSAMNA+g/E
         T3iQ==
X-Forwarded-Encrypted: i=1; AJvYcCWH4PmPEt9SxoHD9+E4mr+E+SgJwaqROCDkAW9BZ6TkO28wiJuAwM0Yxt6aH/Ye+ewyEXUNj8pP6xRzNMxjiG1HpHjk@vger.kernel.org
X-Gm-Message-State: AOJu0YzbMnXP6WwEgUYxmGgho4E8YZtLoFIxBJkyjdurjJAOYLbqCnPC
	7aKkBBvg1KVpXbG2TybYHkVP0x8PG1jFl3x+31td6HeWPEZZR8H5DfiZIa3lJ9E=
X-Gm-Gg: AZuq6aLoYZkw7sMK6mdgF/oZt5xZo7UshvwGEd1C4U17Ybp3ap6n/Dpl64LeBlG39R/
	QGnmFO99/9rz0YYQvTbWBkfdbuRRZPFUfbsMMjZ4DZcnna//dnwOg0MANC6EHMiPw5r4FKkQioM
	x3dBxktKk3Gi6uC8J3mOT5i6cTXDFPZiq6qLguiOnKh0GE577rnl2OEnRiKmsJ13pNIfjOQ1pQn
	9l0zJ3Tf/leKTTb6I4B9CES7dr69Pj6dl1QUKKvb3LbX3VxEizYaC85Kuc48YLQyaTL+u3ReaLY
	U1OVM8YWkmy7VJefSoOb1YYBVU+htzc97ooCYJAV469yyMS96A2OijmPFR7mK+Io++fEkySZ/Ro
	iIi6LTlFdJvWi1SUX2sO73fcAo6uGIwqCbNV+lLCUkgizb442DkKfeMHuXqR5L0lsHSn1ShlSt4
	3Jpi5AO1k4JGpjkej82GqlgufznlLNDiRbN2OSxio=
X-Received: by 2002:a05:6a20:2203:b0:38e:5655:2897 with SMTP id adf61e73a8af0-3942e396d10mr2126675637.22.1770802022085;
        Wed, 11 Feb 2026 01:27:02 -0800 (PST)
Received: from at-iMac.. ([2401:4900:8fee:b355:955a:194f:87e2:8df8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e198185b3sm1427787a12.33.2026.02.11.01.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 01:27:01 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] apple-gmux: preserve brightness using EFI
Date: Wed, 11 Feb 2026 14:56:38 +0530
Message-ID: <20260211092640.3231-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make apple-gmux save the current backlight brightness to EFI on shutdown,
so the brightness level is preserved across reboots.

(tested on iMac20,1)

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
v3:
- Only save the brightness when it differs from the boot brightness.
v2:
- Used correct size for efi_data
---
 drivers/platform/x86/apple-gmux.c | 61 +++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index 1417e230edbd..08b9f48c11b8 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -22,6 +22,7 @@
 #include <linux/pci.h>
 #include <linux/vga_switcheroo.h>
 #include <linux/debugfs.h>
+#include <linux/efi.h>
 #include <acpi/video.h>
 #include <asm/io.h>
 
@@ -78,6 +79,11 @@ struct apple_gmux_data {
 	/* debugfs data */
 	u8 selected_port;
 	struct dentry *debug_dentry;
+
+	/* efi data */
+	efi_status_t efi_status;
+	u32 efi_attr;
+	u16 efi_data;
 };
 
 static struct apple_gmux_data *apple_gmux_data;
@@ -107,6 +113,9 @@ struct apple_gmux_config {
 
 # define MMIO_GMUX_MAX_BRIGHTNESS	0xffff
 
+#define EFI_BRIGHTNESS_NAME		L"backlight-level"
+#define EFI_BRIGHTNESS_GUID		EFI_GUID(0x7c436110, 0xab2a, 0x4bbb, 0xa8, 0x80, 0xfe, 0x41, 0x99, 0x5c, 0x9f, 0x82)
+
 static u8 gmux_pio_read8(struct apple_gmux_data *gmux_data, int port)
 {
 	return inb(gmux_data->iostart + port);
@@ -751,6 +760,35 @@ static void gmux_fini_debugfs(struct apple_gmux_data *gmux_data)
 	debugfs_remove_recursive(gmux_data->debug_dentry);
 }
 
+#ifdef CONFIG_EFI
+MODULE_IMPORT_NS("EFIVAR");
+static void gmux_init_efi(struct apple_gmux_data *gmux_data)
+{
+	unsigned long size = sizeof(gmux_data->efi_data);
+
+	gmux_data->efi_status = EFI_UNSUPPORTED;
+
+	if (!efi_rt_services_supported(EFI_RT_SUPPORTED_SET_VARIABLE))
+		return;
+
+	if (efivar_lock())
+		return;
+
+	gmux_data->efi_status = efivar_get_variable(EFI_BRIGHTNESS_NAME, &EFI_BRIGHTNESS_GUID,
+					&gmux_data->efi_attr, &size, &gmux_data->efi_data);
+
+	efivar_unlock();
+}
+
+#else /* CONFIG_EFI */
+
+static void gmux_init_efi(struct apple_gmux_data *gmux_data)
+{
+	return;
+}
+
+#endif /* CONFIG_EFI */
+
 static int gmux_suspend(struct device *dev)
 {
 	struct pnp_dev *pnp = to_pnp_dev(dev);
@@ -960,6 +998,8 @@ static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
 	}
 
 	gmux_init_debugfs(gmux_data);
+	gmux_init_efi(gmux_data);
+
 	return 0;
 
 err_register_handler:
@@ -1012,6 +1052,26 @@ static void gmux_remove(struct pnp_dev *pnp)
 	kfree(gmux_data);
 }
 
+static void gmux_shutdown(struct pnp_dev *pnp)
+{
+	struct apple_gmux_data *gmux_data = pnp_get_drvdata(pnp);
+	u16 brightness = (u16)gmux_get_brightness(gmux_data->bdev);
+
+#ifdef CONFIG_EFI
+	if (gmux_data->efi_status == EFI_SUCCESS && gmux_data->efi_data != brightness) {
+		gmux_data->efi_status = efivar_set_variable(EFI_BRIGHTNESS_NAME,
+						&EFI_BRIGHTNESS_GUID,
+						gmux_data->efi_attr,
+						sizeof(brightness),
+						&brightness);
+		if (gmux_data->efi_status != EFI_SUCCESS)
+			pr_info("Unable to save brightness: 0x%lx\n", gmux_data->efi_status);
+	}
+#endif /* CONFIG_EFI */
+
+	gmux_remove(pnp);
+}
+
 static const struct pnp_device_id gmux_device_ids[] = {
 	{GMUX_ACPI_HID, 0},
 	{"", 0}
@@ -1026,6 +1086,7 @@ static struct pnp_driver gmux_pnp_driver = {
 	.name		= "apple-gmux",
 	.probe		= gmux_probe,
 	.remove		= gmux_remove,
+	.shutdown	= gmux_shutdown,
 	.id_table	= gmux_device_ids,
 	.driver		= {
 			.pm = &gmux_dev_pm_ops,
-- 
2.43.0


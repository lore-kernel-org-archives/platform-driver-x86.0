Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFFD2772D
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Mar 2026 22:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773528033; cv=none; b=YDEzn0dqaom3NjFlbeJkcJl8X6tmrTLx0Bvn5q5X7Q3nyQVnVhIZ/DUsS8QPCWAOu6q2F78sn1G3cExuWGcMIe09MgFInKqNIKgPnsIl0rbvtq5JKbcwKHvjQsavF78WmcR8Skw32yEwyssQ3NHm0tBsqzOzyfn+ZyGGVMytASM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773528033; c=relaxed/simple;
	bh=EiECS9uS2raJald4G1Z7WH5nAju0GwEo/qx/RGKwHQk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Eb8oAHGebcqMUqYajai0EOw8gotbuwvwWai23tTnufJuSBPnNmPHyP0UpynsmXrjEiCFFxqEy+Dl0fjUinMXRYDtrlfymIlXsVxRGDxudMbY6efJZ7xl7iUGSUntHvYd+MrHsA5ZljpQGToG9uR6xxgVcZ59zsH5pxiMQiHsKA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=no+oKk3b; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="no+oKk3b"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ad9516a653so14374075ad.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 14 Mar 2026 15:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773528031; x=1774132831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k/YNPxsCw6jxw3lcUUiuO3dmDTUsSL1Ns+YaCfsyYUE=;
        b=no+oKk3b1Mo6QYIfMxzRdmYKW4YvBhEB2Pn+H/PnhZODcNFNGOml0o7o83FtdZt/ym
         PwSn3A7R/eis0PR8Jdn3KrjdoL1e7Gw8XgFftfbRACARYMt4OOzThidW6+u7nKrM8iOv
         wHlRKFCXda9F/R0z8nW7eRHQufDDLIKQYYCsDX8SfAEZ5tjkrE6dl8BEFJt+BxGXHPpX
         KXhRLyeAQvUlggob/Tt/rGX60PfZ29me1b0TR9Cwm3vX6P7RGbXJv7gymj+lPYZD33TG
         dO0IA64CMjSurFH9wszTtLb20jdh9ZP1f8ubpq85OwEwIcDHR1KzDGIvOB2LUv0Z0+O0
         Y9KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773528031; x=1774132831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/YNPxsCw6jxw3lcUUiuO3dmDTUsSL1Ns+YaCfsyYUE=;
        b=sJ95dh4pQ1ifdoFuLgjyTShORJHvnbIJLXYCfYgrg4Is+vhaPPW/ojTxTy9C9CC1ay
         eK2SLu5gpjJvYneJXYlROW49TtWk5IZaZHXwe66181JMhYnIl67ZHjXrzNOdJsHwh8rY
         YbSphTAT3e8C0stuEwVbz+oVKj+qebZ0HL+InmtJUD4NZxmsFLBeQHIZcvueSL4YqKpx
         SBM/Wq+hUgc97Z29zOhNbQc3wqLpvV7VqdH7rPEjgnoKLbzM+2lE3eRq7KLqQ9fOvgdA
         dFH6NddnXiKyQ18DWFZTxNUVLDGxhMDJyq3zVQicVLCp8APRsXuFOMNhmtrNbcK1bbD+
         wELA==
X-Forwarded-Encrypted: i=1; AJvYcCV2Nf77P9ieR8MgTdoWW5VrhC/R0mNBJwCKxcKpV4Ds3WB6T3cWCUbZFr+F6jZfePnyhSd/rNW0L6+EPUHaFJiQDpOL@vger.kernel.org
X-Gm-Message-State: AOJu0YyBTN2+35GRCexZwtxik3F7Ri5e33zDow7EE4TkUPdYnOzglin5
	Cw6JpSeJm3XufpUvgJsHc0HZg+WfJmBXlofU2QgF0SsY9gsF7S8u+4g=
X-Gm-Gg: ATEYQzyU3s1ucSxcEnMPLFBe5Ppm6TG+ifX/g7mps5Boh1d17WUvKaFr8iaHXC6HmyN
	uwu52jyAo35gH9E7w6Fq5GkRVvj1H0TEAGLCXPExQCoKyx36rmQS/OCuA9k5aDN1BlnkQAjBqby
	wYSvXfJ3aZk/KJiNTLxu+MKLQk+mpPlNKHm0e8urKiaOpuHKOEUw0KsOhhM2K+HLdxe8X1j21Je
	fkvzazf1WQEd97vkka/UmJDGSkO0bYL/M8xVOmhT5VTgkxmu+nSfR09La4AT+nJ+wOKh2jZBz1J
	wVAHbrRZGxVD3HjjZxtylRG/2Ia+iUXJ/jLYKsa3tJvwku6Km2CebRRQqV7NlrPtbm47umf+YBb
	uGHQjxjW30fO4tbJVHPqO/5qHTu6ZIiZs2wpFFCNRHQSqs6QqnoCWyrIeqorE5844Rg4Ot/IgM2
	0S4h+jMI9w3DDwmMLV5PppM1qrItdoFxbGHLPI4NG5dtFMVTzQCLUzmO4LfHWuDB4=
X-Received: by 2002:a17:902:f601:b0:2ae:6364:e6f1 with SMTP id d9443c01a7336-2aeca940e7dmr86120365ad.1.1773528030850;
        Sat, 14 Mar 2026 15:40:30 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([171.61.163.197])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b050656d13sm2088905ad.87.2026.03.14.15.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 15:40:30 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] apple-gmux: preserve brightness using EFI
Date: Sun, 15 Mar 2026 04:10:15 +0530
Message-ID: <20260314224017.11982-1-atharvatiwarilinuxdev@gmail.com>
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
v4:
- Fix Build warnings when compiled without CONFIG_EFI
v3:
- Only save the brightness when it differs from the boot brightness.
v2:
- Used correct size for efi_data
---
 drivers/platform/x86/apple-gmux.c | 69 +++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index 1417e230edbd..6becaf67c862 100644
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
@@ -1012,6 +1052,34 @@ static void gmux_remove(struct pnp_dev *pnp)
 	kfree(gmux_data);
 }
 
+#ifdef CONFIG_EFI
+static void gmux_shutdown(struct pnp_dev *pnp)
+{
+	struct apple_gmux_data *gmux_data = pnp_get_drvdata(pnp);
+	u16 brightness = (u16)gmux_get_brightness(gmux_data->bdev);
+
+	if (gmux_data->efi_status == EFI_SUCCESS && gmux_data->efi_data != brightness) {
+		gmux_data->efi_status = efivar_set_variable(EFI_BRIGHTNESS_NAME,
+						&EFI_BRIGHTNESS_GUID,
+						gmux_data->efi_attr,
+						sizeof(brightness),
+						&brightness);
+		if (gmux_data->efi_status != EFI_SUCCESS)
+			pr_info("Unable to save brightness: 0x%lx\n", gmux_data->efi_status);
+	}
+
+	gmux_remove(pnp);
+}
+
+#else /* CONFIG_EFI */
+
+static void gmux_shutdown(struct pnp_dev *pnp)
+{
+	return;
+}
+
+#endif /* CONFIG_EFI */
+
 static const struct pnp_device_id gmux_device_ids[] = {
 	{GMUX_ACPI_HID, 0},
 	{"", 0}
@@ -1026,6 +1094,7 @@ static struct pnp_driver gmux_pnp_driver = {
 	.name		= "apple-gmux",
 	.probe		= gmux_probe,
 	.remove		= gmux_remove,
+	.shutdown	= gmux_shutdown,
 	.id_table	= gmux_device_ids,
 	.driver		= {
 			.pm = &gmux_dev_pm_ops,
-- 
2.43.0


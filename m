Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCB92222C0
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Feb 2026 09:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770109224; cv=none; b=Ivzy6vbjnJuFGDWbBwfIGL+r7Q6LdYEGT+7uRdeRT7+iziyDZ+mEABSqQDXZ6JD3b+HTKnLBxZQqAfVD4RiI2ucECmfE4mRU70q5FXsOwq+vStOM54dS3etMWc/BA2Sa0ESd9XfoDqqNCSs2bTTx2T88razoIWUJsiCugnIy1fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770109224; c=relaxed/simple;
	bh=hgwRh+I0dG23agQg7elJDtU4GiypDhatSHoBvwO7XHE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FjDadiho2D9MlSEptUWCu4Gs1ayTNH2kW2nO0tHdXf2dCOP1T40gMjXPR6FASMTdu6FMhCsZgDXTirYJA0Kt2KcxjXFID+1e+upV66x5c5rTRUjsvBapv38/dtzyiT99aMJ6I0q0fLUtFiLT5le8X7uI7OJYGMEhBMlr6tfdrtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eSazipcw; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eSazipcw"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a9296b3926so2242655ad.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 03 Feb 2026 01:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770109222; x=1770714022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TqbnW9e83D4avIY5Y+COHUyxlvGKXifi2kBdJR3lYfE=;
        b=eSazipcwDkqYvTcpbDwRXfEo6mmmkTquq3t6pBThKqJUwtjAEz02iI9G3vJC7wwIsD
         NbldMbF6SJL3epMnCVA/dkBxUsbm7akT1U//A4pQ/r+92CZ67U0rvcfSnInhw00sZ7/R
         hNsMlwFOLQh5MS2ZRg4li5EjtmNt9d8sG3hjbAmn0arvDK+6zK9kXN7mQM6aBXEpauZk
         r0uhqr1zmiS+Gx4BXjYbPZWW9XCFXDmi5ytFeUbzJ2K06SQsSdtZz97Bfzeo6kGzHCRq
         KLpAcTOcuV4wOUx1XOC86cqRI1DxS1/jhRftUXFxr6YQKS2pYPqkIqGv5CEZBZV16FM9
         1Bzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770109222; x=1770714022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TqbnW9e83D4avIY5Y+COHUyxlvGKXifi2kBdJR3lYfE=;
        b=dr5MXtlLBqhDpnDaBuVlcf5fqSZcC3jk4ilWxr2CpLLr0i9gURfMe9KGteth2qx08O
         yY4PMuPaOqwL/tNVzTQbd/0cpn8uBiCGBOsFeT4GyEFkiTkKPeSpVJ3R0A4BU/GeQkfg
         wFTrpTQQp4yPGaSpPvfDewXwxMx7N8/oEnJJJvbVVc5Na7G9D0ceX0Hrb9MbL1L5wnJV
         0cgK1xIKmd6bx+/FwEi6RKKCkHpSLFBs2jWtkC+EFiZclqw9HROj4CS1LxVFJq7tW4hr
         xHIHyNw3tDrChkJhZhJ3czSHdbDZD/7prGglyTxfpP+zKbAtWYZ6ZiKGE5iDWmWO7TAH
         Oh8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXtdiGcJ0339ptVShe7xgWNqgEtbqsjkhghGAGDbO8cdiLwcZbv38g3ZqLXRs14WeR09BQbFBmoN5JZLYXVWXHdY94W@vger.kernel.org
X-Gm-Message-State: AOJu0YyAbZyYU3drW6PBu69vmMp1XUse54GqEiGO2o5ZinATAf8U4loJ
	x5o1hEuEonRBHsZvsKi2RFfNbSkmPxQXejqNPvICQFm9+sLWqXSGKfC4JZln
X-Gm-Gg: AZuq6aLkXLEktMbS56k70hlegYdOhOaa6orpqeaInDeAJJd6m/9YwOhS3q87Qu6rPhH
	nR/PIQ4eH9FRBAShBFDfhdiXaQj88DpAkfH6vOlcr9UnIToq5Z7G2WVAkV8QYUZZJ8eLOAuhb5/
	6cOFBNibiCkvOe/xBE+CYgViH3S4/bH4wuHHEde0SM5wwpSkjOMx1oDP2qZGR6g3tnJZDAw+WAn
	44bY2fx1kmDlNmQz5r6nDWm2PVoMdEiEovaTrf6RgBPL/KQFtxZU+8k5sgKlDOrR1d9IqY2e0uX
	oCJGXITHhGKmwdCk/nWtWC0mWz4onasC83LhgS4shddvxmADNq1uuaE0VCY2aAwMQjQIvhB3ZY8
	xcDHTF3qMHCQ5N5xLESBDOkvpSlPqJDjQAOoa/pQ8CKOkIUzGnuUESrYasXBj+4MSa0n0HBe0CT
	WB7TkQBUb2qoctXlo=
X-Received: by 2002:a17:902:fb07:b0:295:c2e7:7199 with SMTP id d9443c01a7336-2a8d81504c5mr103298555ad.29.1770109222194;
        Tue, 03 Feb 2026 01:00:22 -0800 (PST)
Received: from at.. ([171.61.163.171])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b5d93cdsm166208305ad.70.2026.02.03.01.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 01:00:16 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] apple-gmux: preserve brightness using EFI
Date: Tue,  3 Feb 2026 09:00:04 +0000
Message-ID: <20260203090007.13501-1-atharvatiwarilinuxdev@gmail.com>
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

EFI Code inspired from drivers/input/keyboard/applespi.c:1589

(tested on iMac20,1)

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/platform/x86/apple-gmux.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index 1417e230edbd..4e687b61c92f 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -22,6 +22,7 @@
 #include <linux/pci.h>
 #include <linux/vga_switcheroo.h>
 #include <linux/debugfs.h>
+#include <linux/efi.h>
 #include <acpi/video.h>
 #include <asm/io.h>
 
@@ -107,6 +108,9 @@ struct apple_gmux_config {
 
 # define MMIO_GMUX_MAX_BRIGHTNESS	0xffff
 
+#define EFI_BRIGHTNESS_NAME		L"backlight-level"
+#define EFI_BRIGHTNESS_GUID		EFI_GUID(0x7c436110, 0xab2a, 0x4bbb, 0xa8, 0x80, 0xfe, 0x41, 0x99, 0x5c, 0x9f, 0x82)
+
 static u8 gmux_pio_read8(struct apple_gmux_data *gmux_data, int port)
 {
 	return inb(gmux_data->iostart + port);
@@ -1012,6 +1016,27 @@ static void gmux_remove(struct pnp_dev *pnp)
 	kfree(gmux_data);
 }
 
+static void gmux_shutdown(struct pnp_dev *pnp)
+{
+	struct apple_gmux_data *gmux_data = pnp_get_drvdata(pnp);
+	efi_status_t status = EFI_UNSUPPORTED;
+	u32 efi_attr;
+	u32 efi_data;
+
+	gmux_remove(pnp);
+
+	efi_data = (u16)gmux_get_brightness(gmux_data->bdev);
+	efi_attr = EFI_VARIABLE_NON_VOLATILE | EFI_VARIABLE_BOOTSERVICE_ACCESS|
+		EFI_VARIABLE_RUNTIME_ACCESS;
+
+	if (efi_rt_services_supported(EFI_RT_SUPPORTED_SET_VARIABLE))
+		status = efi.set_variable(EFI_BRIGHTNESS_NAME, &EFI_BRIGHTNESS_GUID,
+				efi_attr, sizeof(efi_data), &efi_data);
+
+	if (status != EFI_SUCCESS)
+		pr_warn("Unable to save brightness to EFI: 0x%lx\n", status);
+
+}
 static const struct pnp_device_id gmux_device_ids[] = {
 	{GMUX_ACPI_HID, 0},
 	{"", 0}
@@ -1026,6 +1051,7 @@ static struct pnp_driver gmux_pnp_driver = {
 	.name		= "apple-gmux",
 	.probe		= gmux_probe,
 	.remove		= gmux_remove,
+	.shutdown	= gmux_shutdown,
 	.id_table	= gmux_device_ids,
 	.driver		= {
 			.pm = &gmux_dev_pm_ops,
-- 
2.43.0


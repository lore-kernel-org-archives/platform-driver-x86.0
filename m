Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC73288B1
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Mar 2026 00:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773965398; cv=none; b=hz5zV6aCwSxX/FH3Io1bJlOHOR/uO/T1cTFWG5Ct1FwABzfKOVDECDS7gQcY3PlT/DkZgUb+VDUqErck9M3ESwvGRZNClx3e+2UE/GVNVd7Vtk22cJlig3CZEGx1fg9yl0Q1UJ2qJHsycKB9mvFqjPrrZQQrviNJ4nmLVmRD/Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773965398; c=relaxed/simple;
	bh=+075GOoyLbd5S34H1HUCr/nG7KpOcOATM4+CPgFOnJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hpj1w6HZmsC8igBp06tr+Mlc1M/0iguCYdWbGLQoEvFJcXH0GO0zbL99mVTiYXD3c5/CMRpth0NiYN2fOVTEudSo9WrU5c842K8fBzHRziWAPhCr4mWwR99s6hEv6uGUbDjgTVt3YdOnsPdmkz8vNJqfs+BlU8rYALAILRxhNxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hFTxmVXn; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hFTxmVXn"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2c0f754e756so1291232eec.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Mar 2026 17:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773965396; x=1774570196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yX+MCrL59z+GAPTCkuU/G/y2YHYVEKPhhbS8nU432oc=;
        b=hFTxmVXn0dDfoYV3hMU4aLW084yRWr1F33oAfITIKfKqgAq4lvvuQT4yIYAqAV0zGM
         7btESoIZgVGzkQh2iF4Li6eTBNrBxZlPkaC0SZgZQp1J4gAx34j6NsvGTjcjmP7um0Qm
         WttdjaQE8RWzY0NjymZ9ul0XFgt6JaDYlFXF12xUNdNTk7g0GaI03lLnbAmMQrOQL6ld
         Wtk2g+kwtCUuXiwPHEnhAp3J/VfgJ20iBYUFqBzo+GEiqJtp0ubjVNTeXR8YWGV34UUx
         4B4v6Ywt3YQQqnwUIEc7Eexj/W5G07OaSLQLBV/YrV+ABkYNOOGOdTPhTQD3uunkhEjn
         RCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773965396; x=1774570196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yX+MCrL59z+GAPTCkuU/G/y2YHYVEKPhhbS8nU432oc=;
        b=LFCYHhundMj+MxqjPIKgNwgOzhJGnuvFVFKgBx/tPwR6kacg97lqsEJNwi1H8xQGyU
         z5+D64gNbMtm5mNw4Egi0e1U1DujN8QftpNEBp5d2eL7UipvKahGXXsLgb0kFPVXLzER
         IQKoEdOVcS9URrvD0cKOPpmOJAR3XvNDYiSM/jgZmbrG1UbE3k0UPRqTtKmZIVRGM5zt
         f52pSmQtXG3KLh7/kpt5wrGQtlOnMTJuBDE1Yi4akNuazcsu2nxDI1oADerGOxc9XzgE
         29GQA/GaLLcyv7u5hH17ys4BtgOpghqMzdfJpfXbdCinnBRNi3vXIvhlCnNzmB/aAmNJ
         ZpzA==
X-Forwarded-Encrypted: i=1; AJvYcCW7xH7Z0g/yb0iEPjh5BLvEl/GxhbwzG8vKcPoI/8GEio0Xt3tyy3oCAz8id6X/9yR+z8lYHdzyeNh5vZgb7vQ9NKPq@vger.kernel.org
X-Gm-Message-State: AOJu0YxbrWXO3W7d7U4vqh8kg0YCwQax5+Pcl3uDEK4uLnFwq97aBW3w
	BgNTF3AMRTcjCxFL+AS0Tj0zoCd1z5dfX6Rmnukn8/UdCYBM8ejz1KJP
X-Gm-Gg: ATEYQzy0s5ppmrVP4k4RPlM0wbYgDMtysmdC16h+F+/GT0L0IVUUeqkdBLzRHZg67OX
	aswVpE+qIsIBS4ax0Eqx6UVYMV7ZMFUK12O7ZTiQja1UkbCmtsynra58bqT8a1NmHSgpACo3/0m
	v972hPKU62oJuCbMNOrNjHeRisF/rw3lZOF9CXnC2thyPCPVCuQ4I6E9BYCdt+TV56evssIu62i
	/NY/rz3fqehOt+QY81asJ7wPVmDG4qBWwI5DNFKE+dnHbU8PG72sOmQvmrZxLT+VaEMw0tamL4D
	fANnTQ8vcy14KRJAd+Zy170Ux72zFqK8HH1lBMvYb0gQblEBvH5HjwfSSZ6AVCzdGG4GGhnm5xc
	FbdpM+Ohzrnleo9M/XtUudUJ4JH54OFVWNk91JjOyoqzh2SQZIOmNB0eOMlSzJdKU9x79Su083U
	wFGTtBqvPlPNMVw20yXN5R7g==
X-Received: by 2002:a05:7300:50e:b0:2c0:ffe7:318d with SMTP id 5a478bee46e88-2c1097d7856mr553269eec.30.1773965396453;
        Thu, 19 Mar 2026 17:09:56 -0700 (PDT)
Received: from TC-LAPTOP.lan ([209.76.64.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b3253d0sm927960eec.29.2026.03.19.17.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 17:09:55 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	lee@kernel.org,
	djrscally@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH 1/5] platform/x86: intel_lpss: add resource conflict quirk for Dell Latitude 5285
Date: Thu, 19 Mar 2026 17:09:29 -0700
Message-ID: <20260320000937.9177-2-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260320000937.9177-1-tchatard@gmail.com>
References: <20260320000937.9177-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Dell Latitude 5285 2-in-1 has a BIOS bug where the ACPI GEXP device
and the I2C4 controller (INT3446) both claim the same MMIO region via the
shared SB04 variable. This causes intel_lpss_acpi to fail binding to I2C4
with -EBUSY, preventing the front camera (OV5670) sensor from being
registered.

Add a DMI quirk that selects IGNORE_RESOURCE_CONFLICTS for INT3446 on this
machine, matching the existing pattern used by other LPSS quirks.

Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/mfd/intel-lpss-acpi.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/mfd/intel-lpss-acpi.c b/drivers/mfd/intel-lpss-acpi.c
index 63406026d..7d0964848 100644
--- a/drivers/mfd/intel-lpss-acpi.c
+++ b/drivers/mfd/intel-lpss-acpi.c
@@ -13,6 +13,8 @@
 #include <linux/ioport.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/acpi.h>
+#include <linux/dmi.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
 #include <linux/platform_device.h>
@@ -52,6 +54,15 @@ static const struct intel_lpss_platform_info spt_i2c_info = {
 	.swnode = &spt_i2c_node,
 };
 
+/* Same as spt_i2c_info but with QUIRK_IGNORE_RESOURCE_CONFLICTS for Dell 5285
+ * where ACPI GEXP device conflicts with I2C4 (INT3446) MMIO resources.
+ */
+static const struct intel_lpss_platform_info spt_i2c_info_ignore_conflicts = {
+	.clk_rate = 120000000,
+	.swnode = &spt_i2c_node,
+	.quirks = QUIRK_IGNORE_RESOURCE_CONFLICTS,
+};
+
 static const struct property_entry uart_properties[] = {
 	PROPERTY_ENTRY_U32("reg-io-width", 4),
 	PROPERTY_ENTRY_U32("reg-shift", 2),
@@ -172,6 +183,16 @@ static const struct acpi_device_id intel_lpss_acpi_ids[] = {
 };
 MODULE_DEVICE_TABLE(acpi, intel_lpss_acpi_ids);
 
+static const struct dmi_system_id dell5285_lpss_dmi[] = {
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Latitude 5285"),
+		},
+	},
+	{ }
+};
+
 static int intel_lpss_acpi_probe(struct platform_device *pdev)
 {
 	const struct intel_lpss_platform_info *data;
@@ -182,6 +203,17 @@ static int intel_lpss_acpi_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENODEV;
 
+	/* Apply IGNORE_RESOURCE_CONFLICTS for I2C4 on Dell Latitude 5285.
+	 * The ACPI GEXP device conflicts with I2C4 (INT3446) MMIO resources
+	 * due to a BIOS bug where both use the same SB04 variable.
+	 */
+	if (data == &spt_i2c_info &&
+	    acpi_dev_hid_uid_match(ACPI_COMPANION(&pdev->dev), "INT3446", NULL) &&
+	    dmi_check_system(dell5285_lpss_dmi)) {
+		dev_info(&pdev->dev, "Dell 5285: applying IGNORE_RESOURCE_CONFLICTS for I2C4\n");
+		data = &spt_i2c_info_ignore_conflicts;
+	}
+
 	info = devm_kmemdup(&pdev->dev, data, sizeof(*info), GFP_KERNEL);
 	if (!info)
 		return -ENOMEM;
-- 
2.51.0


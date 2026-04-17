Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A13356A12
	for <platform-driver-x86@vger.kernel.org>; Fri, 17 Apr 2026 16:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776443585; cv=none; b=EBfTISeh75vgCM8X8ey+ubHe2XKgi6sKNOZ11dGaaUM5peSw0mLxf3A9f3G5+oRJuLaFnfvTYXGLLbFIj7ifiLqZEFRpPRifdIqvoJl1MUHTdwAFZjW8FzSmW7zIymP5La8PausKmA7OG2ms2APwdMQ8f5y1+7HD4t103NyjVz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776443585; c=relaxed/simple;
	bh=+075GOoyLbd5S34H1HUCr/nG7KpOcOATM4+CPgFOnJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MkEYpUsdjM98GvTeUu5L7j3HqWhABojbREb3/8CaC6KpOpMaLgEOtzoyrrEQ/cm20xTEWTgIZCOII+hzzhUgYhPfhgXvuckVR+lQYEZcsEr4FUHDAR+z0dbwjenV9Uf8qx14nQ7snMK2/9APHF8+CJ9AaD1IzfoS/cEE7PlyL+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ClKPsrUS; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ClKPsrUS"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12c1a170a50so1186034c88.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Apr 2026 09:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776443582; x=1777048382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yX+MCrL59z+GAPTCkuU/G/y2YHYVEKPhhbS8nU432oc=;
        b=ClKPsrUSsq+hitrgPAFzWIzs1HBzbZe8jyNtnZ6Sl2sbKeni2jWVys08nOfi+zw3AK
         iS2reSjObf6d8V8R5Hdq06k1lMvwG+F3GzJGnLIOeT95+ye/vSwmNjynZ3pqddp0g8Y9
         faiK7zlG+7WU9ovWzb+FclAkGMUswMEZwpAH1ROZq1QjGaL5nbCkfbl9rwlr5WqOe7Ir
         n753fcdjMsIvye7avBN28Uzw1EKckLXCgNkWfmAzBjAvD21vRY+gyVVXsaZVztlgLrvA
         ljqk18uxcb2BVF+U5+Mztr8wvxSaJ7X3MuNahjHAYQcVzaYZkG26IrMQzE2ybv5QrfTL
         pvqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776443582; x=1777048382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yX+MCrL59z+GAPTCkuU/G/y2YHYVEKPhhbS8nU432oc=;
        b=m0a3sY+sifJPvi0O+iXONRZrqzEU1GlOlQgwgEHW8VlwPsOceXDSBqTr0D3lURGYRD
         +rUFAMHoImYgjLhtZsU5Yvi2tdO6P0qdRI0UGvv+hRsGJrAkn+dSPaoiW69OAaHmVT+l
         bx8fnntk7zK4cymh+UC1j9NkJarRt8EhEbKUvmqJMOtymQlg7H/gbf+JvFwh1DGwfU7t
         uoxLsg0DT1ezLM7oT4vierveH/sWBNR1jfOg0D5IJg7DS+P8m8WNiqmDwMbDdxGav96s
         NLfMaKyCuf3RJkwiJw4LVO+78oO08S7+434pLcP5H0mxzyJ8a4seOuNIEwa6tazZ8Dxa
         OF9Q==
X-Forwarded-Encrypted: i=1; AFNElJ+Y226tyGJGA8Grrj5W7JfLPbNsKoUWFXzAHD5GYxO+UfusiiEXNad3oBrzoY+w8Ky9e8yOWUp4a4kco/AYH8ylX7rM@vger.kernel.org
X-Gm-Message-State: AOJu0YyysB1Lf+bACF9JDkDo9vFKWEbbXFUeMzBWGVkpEqq3351Q1VGE
	h1JPzdHRo2SeCz39wYqAIJjHnqro5bd2C9e2LrDyYi0guTQmMP4VvUZC
X-Gm-Gg: AeBDieskiSn4uzt2u+fQFnXQBLPyRdBiXsi1lxUzh99j2SoecC3EzFoq+SrrxUoN9Eb
	jLdiNFvk/RNq89wgE4GkKC6NZy0ZI6Tu23YFYjzJ4QZOXikS2By7KvQBGwh8Y6ntnaJbKi8jUon
	QF3m9MIBxDTNrC3uOrbsbtWgkAwxyMsob4uG1T49RARxFyK5g8RyrfkcQk3CbUB2U2nJuga/0Kg
	KxKa+0PLssT300u7ANfOh3nFr0OWHWQwKGpoIz8yf4NvirJv3WB79yKLkxgjMuetLUpZNwOLJ4Z
	Ogsp04MOc8Sc2M2+8RYorBGogOyrRWb8TYooQ09rv708N7gmqcv3boLU2ZvM2gcj6+vvuD9dVlc
	LYG/hjZwBqRA4anFGY9djuJCQm97aJCX53Ffb4IFvQp1N9MYjfshTnogFFEQgB6a3DU0D3vbaMN
	9xN8UkPGA6M46ugVPtYmZUYGcthw+UxthTRNnEeJRMt/VLySHxylNY/RSa00q598n4v7Q5yQ==
X-Received: by 2002:a05:7022:1282:b0:122:33e:6d41 with SMTP id a92af1059eb24-12c73f975e0mr1490067c88.23.1776443582098;
        Fri, 17 Apr 2026 09:33:02 -0700 (PDT)
Received: from TC-LAPTOP (23-93-157-142.fiber.dynamic.sonic.net. [23.93.157.142])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c749dc86bsm3603777c88.8.2026.04.17.09.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 09:33:01 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v3 1/5] platform/x86: intel_lpss: add resource conflict quirk for Dell Latitude 5285
Date: Fri, 17 Apr 2026 09:32:48 -0700
Message-ID: <20260417163252.15603-2-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260417163252.15603-1-tchatard@gmail.com>
References: <4ef5f305-0234-4193-a190-edbfe770ea04@kernel.org>
 <20260417163252.15603-1-tchatard@gmail.com>
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


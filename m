Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1926B5208B0
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 21:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790804618; cv=none; b=m5CrHz7ht2EzYCNP1M2qHuplunmkWnzQX5sDpuUoIOro84SDVbTEonGZOffNZqaln2PnJOAmEZTNYdBRpwXwdYcBHAh0MEp+YNMbYki9Lm2xfcFYzf4D3Y8Bn17hROt7aNZA/gLoxbuG5FfPgN/CWjbxEGSkGXpvySuu0YbGqVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790804618; c=relaxed/simple;
	bh=7wUoamM4+c7jF5tl6thS/Yftiw42UmhP7P4CTu0M+ms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bOt7185Bt4zKTrwCG+y6wL0EFDjHSdg5gWYeT4lYDPOrtVJxDgm2uA2XuSB9Zcc9IjgzyioWqfAk76xyRaVuhUZpGlabEUgkZS9N5ldOfOHcALYXcQ2Tivwlp3ujHqTT9Wmm5FG5465J9huXWy8r0W+PObNzNYUyNAlBNJNa+jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h6rW/G/+; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h6rW/G/+"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a0aa9d356eso4489238a91.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 14:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790804616; x=1791409416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9PppgYVQCH9iw7pmx72bD2vKBs7GSn3BtKiFc/nksis=;
        b=h6rW/G/+q4nszBuYAGA64z0RPROYap6yJU7l4ou0RQmiBagGd37pTUt6hzi0UGoClo
         j43K/YEGwJMLd6EjgEMygm558zfLhxjRCfoW/lTFIo0F3+lIbF2fF/qPv76SCGGasz/a
         8MLx0YHSS0wvMZzcc67JGjAvaIpDMiepf9D4tSf45jKIpQRQXJG3Vx6PeOYuHXEKsE4n
         a+TPUrZEE194LOhlqgE89+ugDoUTamM1r5Ldwtmpze/873D++Iorj7So4BF0QLpf/V9Z
         vBIjlC2rPnhGaX5tG5MhrFUXFq5B8NbOw6tuBkMJ/lm3+n746bAxzu4eCfoDbE8O3vqx
         HKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790804616; x=1791409416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9PppgYVQCH9iw7pmx72bD2vKBs7GSn3BtKiFc/nksis=;
        b=xeqJLeYUu2VlH/utBfzTcpDjyfiMMm3Vfm/WQed0wfstRxwFwOPUIGhWMHax89g4CC
         R3KK0rr+Jl+QlrzVAuXWfz52gm8sg6JuMalxRCIc5vcpfcyfiCJT7F5QlGxyvSak6d0H
         iNzE6UmUctX0a8v/4iraPrJXYP7DRb4NRfOH3n31+aukNKN2ar1QW/pvrzU59c2822+l
         lHo4cGdWQcCCCuVDuakJKV0i/V8v9LCl5ZOLRO66dAuo4PhUkV5eIgHBWufnqfCpF6Jt
         NrBikSniIvB3GhF0v/8BBAzTkwIdxgopOorxFj25Fe4F4o2a9FZk237ZSFGyHcsibWTU
         O+fg==
X-Forwarded-Encrypted: i=1; AKwUvBwzNcC1HNOGBu3vjuKAw5RugWRZcefuJr4Jy6c15EoKq37NFbSaKHoNlb2ULoQZTcuHoMxObRlR9YZyjrXle4848LNj@vger.kernel.org
X-Gm-Message-State: AFq9FYK7hQZdhZPjDB86fc0W+NoixoQ7eLChcZoGVpGjw5UOLvMjC8vz
	46JCFuj4Demxn47Ab0IHVPOwBCWSXJBQZtufgokqLwK/n2X4F+MZ7I7Z
X-Gm-Gg: AYBFou0zXZtk7j8AUHlkFJ7taYFmG6rSM7cC9l48qyivv0w+fi1U/d5VwmT0ttMqE2u
	4eyj4w5FOc5+kbJ4WV5K1Iy66sHyXsLKE+x+WFDzqQXk/nP5nJ3LZzde1s+cUH1lk/GEQSK89ru
	lGtejkhVqpmbGHXkdAf6Ri14U/I9AvyIqrOL2LugEAn8Lf/wcJBtnPj4zeZjNI331rc/7DCV+4N
	Ag7l3+ZgALQxoRbLJGeeyCDHJtvaMhbx1FPRJKhiAK0ZjULuHXEsdROSx9YbMBRsGJSF36l5+RB
	AzfWHpXDzqcZYCEjW3Yn9G8Fr4LGSBHClt5kB/amSN2NOTJtzffn8ftrLJQo/aCOAw9IoQX4NjV
	QQp73hlyc/u8Yut8rjbJg/gU9U5eSXmx4Oprfo8dMg6kqbvX2Q32XCQOT7CQGvjxIIs84356T1Q
	+SSAzW2qF8fKCpg2E5TDBNgY1Wr6uLWVM6f7WSFzq2WB7VMZpyw1z29/hjud2CM30sGtU=
X-Received: by 2002:a17:90b:4d01:b0:3a4:c946:9f47 with SMTP id 98e67ed59e1d1-3a4d18c2c5fmr2505401a91.42.1790804616282;
        Wed, 30 Sep 2026 14:43:36 -0700 (PDT)
Received: from TC-LAPTOP.lan ([99.30.92.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f47cbd1dsm1060539a91.16.2026.09.30.14.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 14:43:35 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	dan.scally@ideasonboard.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	dmanresa@gmail.com,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v11 1/9] mfd: intel-lpss: add resource conflict quirk for Dell Latitude 5285
Date: Wed, 30 Sep 2026 14:43:13 -0700
Message-ID: <20260930214321.600863-2-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930214321.600863-1-tchatard@gmail.com>
References: <20260930214321.600863-1-tchatard@gmail.com>
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

Match the affected machine by DMI and the affected device by ACPI ID,
carrying QUIRK_IGNORE_RESOURCE_CONFLICTS in the ACPI match data and
applying it to the per-device info in probe. This follows the quirk
organisation used by the PCI counterpart.

Assisted-by: Claude Code:claude-opus-4-8
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/mfd/intel-lpss-acpi.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/mfd/intel-lpss-acpi.c b/drivers/mfd/intel-lpss-acpi.c
index d4b24a717..9d7d0ad62 100644
--- a/drivers/mfd/intel-lpss-acpi.c
+++ b/drivers/mfd/intel-lpss-acpi.c
@@ -8,7 +8,9 @@
  *          Mika Westerberg <mika.westerberg@linux.intel.com>
  */
 
+#include <linux/acpi.h>
 #include <linux/device.h>
+#include <linux/dmi.h>
 #include <linux/gfp_types.h>
 #include <linux/ioport.h>
 #include <linux/module.h>
@@ -171,6 +173,27 @@ static const struct acpi_device_id intel_lpss_acpi_ids[] = {
 };
 MODULE_DEVICE_TABLE(acpi, intel_lpss_acpi_ids);
 
+/*
+ * Devices that need a quirk applied only on the machines matched by
+ * intel_lpss_quirk_dmi[] below. The quirk to apply is carried in the
+ * matching entry's driver_data.
+ */
+static const struct acpi_device_id intel_lpss_acpi_quirk_ids[] = {
+	/* Dell Latitude 5285: ACPI GEXP device conflicts with I2C4 (INT3446) */
+	{ "INT3446", QUIRK_IGNORE_RESOURCE_CONFLICTS },
+	{ }
+};
+
+static const struct dmi_system_id intel_lpss_quirk_dmi[] = {
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
@@ -185,6 +208,15 @@ static int intel_lpss_acpi_probe(struct platform_device *pdev)
 	if (!info)
 		return -ENOMEM;
 
+	/* Apply per-device quirks that are only needed on certain machines */
+	if (dmi_check_system(intel_lpss_quirk_dmi)) {
+		const struct acpi_device_id *id;
+
+		id = acpi_match_device(intel_lpss_acpi_quirk_ids, &pdev->dev);
+		if (id)
+			info->quirks |= id->driver_data;
+	}
+
 	/* No need to check mem and irq here as intel_lpss_probe() does it for us */
 	info->mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	info->irq = platform_get_irq(pdev, 0);
-- 
2.53.0


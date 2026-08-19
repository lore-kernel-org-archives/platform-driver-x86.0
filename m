Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E867338D6BD
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Aug 2026 14:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787148081; cv=none; b=aH9ltchSFhgxzrzDEN0csRLaHOwINT/Gbat4AJ9/Uw2WqSJ83XUuIOGa4dst2H0YeCeH3Q9dbjINXDVSKY1bGJKTvV/uQjeR4tEZb1bEssGJMOzzK91Dsp/99iL4I0B/sO1oJXN37rptviWE5d/T3srug8np3t8E0fSxRlRsLM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787148081; c=relaxed/simple;
	bh=jGEqquZ2fD8KfC6B3eKEDe79Xup6NmyDIFmkXgCEm9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IJjxhllqbIFHYeVeq+HXZDu/YOtlSLpD/1By40J2ziKVijG7HbPM5mHL9kwxLDzEprnyiFn/KCbsLbeWnw1XZeXvnadCn3pPJRb6rhnojpG6thZUY+jrPL+O3OXj/SlDkiiI2AYsRFC+D5M9RV8SKz1RSqzXCe8rtATI5rD0uaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gAWXJJRT; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gAWXJJRT"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4954d29264cso5618605e9.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 Aug 2026 07:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787148078; x=1787752878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Njwz4GpR6Lsmc9++a5m2bWV+NAXHXBWZE5m0XlH/aas=;
        b=gAWXJJRTR2+10sOkexBeSWd5j9MwLQmFi75lqYj4IZU25t+RSQUXFgx4kgo8tSHhO6
         S8PE6io5ZjSb6ZIAw2kj4A9Krnv81f4mDc2K29zDAcHvF186n5+3DGs9e9xHGMX44bQm
         r9BhedyICLMeX6LemI7/oProm6RgJxJvSlp8USwCnrJhZWPX7/tqnlh5U/hn62LdLuO0
         KXLuwQkZIR72izGiRpZmFGxvsErVwl32la0zq1TMylLCDuOAapBzmpp9gMr2tpluw1U5
         U3Ewq5pC3rwIrFiyNtByJzH/gWAh6tCQXWR9rq+g6sBcjSTGWWYArckcANyEVb1KjVIh
         DPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787148078; x=1787752878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Njwz4GpR6Lsmc9++a5m2bWV+NAXHXBWZE5m0XlH/aas=;
        b=KaWuI/Jac92WUN71SNe8X8k1a/T7Kl9RmBaxIUCZmKlXAM2HrUGxB0Z+M9XsyLPmGK
         tDvDOHy3zdhO6EOCZxI9s3ui3zPoM6o43GCpxOqLgNT7+KO/tEOm8VHKtc3Uxvl4uoaw
         U9SJTVi16quDr7l+XDWWEiY5L0QxBQQvIZQUZoFuvvC6XA4QrquMPYbWhTgrZARpWq81
         wwQyzPP7pjpI8eH33RRFnwDVjiAJiPQt03jkJz2OZ92wjw7EgYrVy4BUlRhgz/l7Of4K
         X3OJN68ZrRRxMJTjzQXu0CxNTkKVhVlmIEO8lHoxxuBP6UZqpyOlcMKDOMZYZ3cyEVrW
         9+eg==
X-Forwarded-Encrypted: i=1; AHgh+RoUqQ8XmPCkrVZ+cUpSzLZR2Er/PYOumF2EdLwx7HM5a8OFrqm2H9qtxvKPHfFPQ7CzhWtCGsBsdnQpZUdVSUbdgL2Z@vger.kernel.org
X-Gm-Message-State: AOJu0YwijJWDJrwZEQnCp2tke4ONVhLDwWWULmtrgMoh/lXxxyCaZlkz
	73gYhKasY5BZZB74oEQpx0FcstS+KJr0JLVjwqorBcb3JhUwvbni9ymQ
X-Gm-Gg: AR+sD12KpH0AiBm9N/mrH80w9v9XOk2eGil+VgQrCuHH8t1rrXDMCE65YjiAFvrnVbf
	E79euaPXLCBXEJPRj+Yy+BNpv6AIzDmoeRL8LkLW5JZX9Xz5kFyiX+6FntFFJq0h2bY4JQjfWZN
	SxtazAgqiz1u4jUtnVEdQZbIAxvPCOwPhwO2aqgnVhQp480bp9ng6ejvMmPrjAyRN302PcRSRRB
	74UXnhR7J4BzGg2xv4CofGnPBQeBN9mmVKN37Ualb1AdWFyMV9FIWronuwT82+/e0GZbk0MTWyG
	SFXD8DR41iV/lK/x2B8TOzhwhTD/4GIq5cc45SCEn2FNSPe+rybOpR+iBe4zL05Y+QkZsx9fnv4
	HxYfoQX1pNftRj6CUxqIN4+S4mzMV2dl9tUpTU+n5H7N3gQSvysRUIQSI9HcxCMX7sUofr56I//
	0zYaIIggIJtLwlKg/cggwWQMikewujbyHuEXevZYpseEVViYyrXJEac7Y=
X-Received: by 2002:a05:600c:4e55:b0:499:a07d:a482 with SMTP id 5b1f17b1804b1-499aa1a28efmr108125755e9.10.1787148077976;
        Wed, 19 Aug 2026 07:01:17 -0700 (PDT)
Received: from TC-LAPTOP ([2a01:e0a:b8a:2610:d3:816e:dd0c:fe6a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0fd728sm92751985e9.3.2026.08.19.07.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 07:01:17 -0700 (PDT)
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
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v7 1/5] platform/x86: intel_lpss: add resource conflict quirk for Dell Latitude 5285
Date: Wed, 19 Aug 2026 16:01:03 +0200
Message-ID: <20260819140107.1329091-2-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260819140107.1329091-1-tchatard@gmail.com>
References: <ae8U0JBdSaPgU-Zl@kekkonen.localdomain>
 <20260819140107.1329091-1-tchatard@gmail.com>
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
 drivers/mfd/intel-lpss-acpi.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/mfd/intel-lpss-acpi.c b/drivers/mfd/intel-lpss-acpi.c
index 63406026d..f08b41970 100644
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
@@ -52,6 +54,16 @@ static const struct intel_lpss_platform_info spt_i2c_info = {
 	.swnode = &spt_i2c_node,
 };
 
+/*
+ * Same as spt_i2c_info but with QUIRK_IGNORE_RESOURCE_CONFLICTS for Dell 5285
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
@@ -172,6 +184,16 @@ static const struct acpi_device_id intel_lpss_acpi_ids[] = {
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
@@ -182,6 +204,18 @@ static int intel_lpss_acpi_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENODEV;
 
+	/*
+	 * Apply IGNORE_RESOURCE_CONFLICTS for I2C4 on Dell Latitude 5285.
+	 * The ACPI GEXP device conflicts with I2C4 (INT3446) MMIO resources
+	 * due to a BIOS bug where both use the same SB04 variable.
+	 */
+	if (acpi_dev_hid_uid_match(ACPI_COMPANION(&pdev->dev),
+				   "INT3446", NULL) &&
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


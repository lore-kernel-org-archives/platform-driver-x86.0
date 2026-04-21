Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21E23A63EB
	for <platform-driver-x86@vger.kernel.org>; Tue, 21 Apr 2026 22:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776811957; cv=none; b=rVYYpQBuXLwng4fI7Ieg3/Mdp0/oQEnrjqFlg7YEDCYxKav4P6IFu9ZNoycTbOLHu6z8Cn7XjS/rr6I/QBVt9biN3TBaS9+QCY8gc+R8T9hvVLB3bdu+ULfkInN5aNDNdjD4VunkmZ9aBtFFhOAKrPl7ABVtTBrHXXWhq4xj4g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776811957; c=relaxed/simple;
	bh=lfv6xMuTWxVW/xyXczBYRRPg3gtNkJiy/z6/BGQznFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P85qn38pqJTM58mKxfky/9j6q7a7HwAtYDzENurrbYkFXN6u+dbl7rNKhGuxropiaAt5rXqZ11uH/D0KP2GjI0fcB0Erxff+Anyds2Nq59Rgg+HPMiyU0M6T3tYJx/uHkPh9+Lze4mL4Y5BnoW4BqTdHdfZPQIgCY/0V8IDUxyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H7K9HljG; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H7K9HljG"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso5108529eec.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Apr 2026 15:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776811953; x=1777416753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1E8HRC9jadERrbomVh88MVvNtDc5/zpLXfvKSJQAhUQ=;
        b=H7K9HljG3k4FBBsjw0fRAZ3ZDr1QYneatGr6HW/IAsFttqeG8bJNahLg3cabbnzYpK
         XA0k+XHQRVyrF2aaAXa/A7euBI4bbCjTnVqAYoyhVLiodx+z/pGG3xTUgfETs62PlwKW
         v6Rli7b9sU/00sU8et5GhWI2XOCkvyxtyjXFUBiPbdQ/qN0esBpmax0siiLy2Wjky0gm
         6Qynln8Bl2SgM5rEttdqReHBmGKdne2Aw/vUqBeVhwsP4Mo/NgRTYnLhcciNssOGfoIy
         soRWV/2zlHmbaDwFq39YlUO+HUlEUKBSubqWp87SEwuKb+DGb1AsinG4Chfp30td39nH
         DYdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776811953; x=1777416753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1E8HRC9jadERrbomVh88MVvNtDc5/zpLXfvKSJQAhUQ=;
        b=Ed4/5dcITHqRdeO+nISGvuCVHY3HbqUva4jiWZEa3W26e4UiIhsCtYBEs4TyhY/gJH
         2p0Gc/w6abd49WeZKBqYHBdlZ+wEr38NXJO+24xk/HwSB2h8VPU+VBlH06ylWvDioYW1
         pRmo4MPduyb14J6bn8oeceuhEDGiZ4aurNvpRJH15BEq35ACUk7t/IU6YN6LYVlKv20g
         wM4mCZl7BHx+KvDxpP+K9ar0PWF/duOY8+LpV/rPoVvZ9Uap3S2q8Z/YONT4MPRT/YMk
         OEGmtV3RAtq5EOuGX4BJ+gu6KpkAnujlOkV/NHKJGgGckM7Gdx0w1H7r4De8TJmcDD/A
         IfPQ==
X-Forwarded-Encrypted: i=1; AFNElJ8K2KiNaBiH+3RekhGSYjH5jJb1pb3OKBrdqIO+WJj1tcuz8vWwNXMEpOzcJj3Ms+1MgnVB4m2z42E3sv83ximgPuzf@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1E1yc9T7Dwr1rNfd3op4numGKkIU0Kl7wh+7rCq1YVSQgc07s
	XeMFhJxtjmpoMa2f53Rq2EBfIjFY6YQIG2BFyAbGXdiytUVboHiOHXiw
X-Gm-Gg: AeBDietDyEjfGawIC7hvRB2OXB0Hp4mFG2+waXHgoLGHr039HbtpN3OGAnYbN3okhZb
	SjZ5WSH5NKHPke3C8uLdOJwX2DXkchW6mfnTprJ5SV9LNGVaWgfpSUgFJ9IVBZgyyYY7fZFOIM6
	KpNow3gHVsrRqlum2TRHvZqse3XF0OftoDGCkGHAadzMcr9ZOSYVk98jRwRtTYoCGJkafvibAnP
	fXDc6zV2RiSghNBDDhZWfw6Z44cEvFINTiM9sGuzSgWQJEtLaXo6tzTcv4mxSDvnpeBUhbQ3Nym
	Y73AQZK2IdNcl8yC5f4Obo1E5yf0RaG9QlWnRHg+tnLUUBohvzOsX8E4d8CsXQ79x9mDYLmQ63p
	lKW/nWScDKOB3S5oKGo2tosamJkpILGJmvw8FlAq4QADgXX12kSgySi9VP6rdBPtPOxAcx2BsAE
	mVJuiG1ESx7bnrSF9WJxEi8T+vTpK24ikEu0z5xKBaG14=
X-Received: by 2002:a05:7300:cd94:b0:2ea:4228:ab11 with SMTP id 5a478bee46e88-2ea4228ab6amr3006778eec.3.1776811952929;
        Tue, 21 Apr 2026 15:52:32 -0700 (PDT)
Received: from TC-LAPTOP.lan ([209.76.64.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a8018sm26145884eec.8.2026.04.21.15.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 15:52:32 -0700 (PDT)
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
Subject: [PATCH v4 1/5] platform/x86: intel_lpss: add resource conflict quirk for Dell Latitude 5285
Date: Tue, 21 Apr 2026 15:52:13 -0700
Message-ID: <20260421225217.12472-2-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260421225217.12472-1-tchatard@gmail.com>
References: <aeMvy5aL0hSNNmEd@kekkonen.localdomain>
 <20260421225217.12472-1-tchatard@gmail.com>
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
index 63406026d..c48eac03a 100644
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


Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AC329DB6C
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Apr 2026 05:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777094059; cv=none; b=DjvstLG3vuIVbaD4XCBzNMfMPeFRznUKg52OI3xeHC0P9FP29SE01tdK13qwn++CMcGGT0SOMdvtQSuyDGqIX0KSpjZ5JBj7z6AbSu4tPBs0gm2rhUK3tkU73QhPUiHLPWXiJ7p8PXUGntpQH+p2NeWz315waf7+t/7DKRNdDV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777094059; c=relaxed/simple;
	bh=jGEqquZ2fD8KfC6B3eKEDe79Xup6NmyDIFmkXgCEm9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JUVdVddugDf5Zo3g5mY7fLPMzfoYjWZqs6iRUC9Hb/H9GlcBBMZcJVhfLCpTuK0GO5V/BGDQB5fhqGRVvA1RS+G98LApI4bGIepSA0urDQyw2PsZilHMl5HQ2ZdruqhVNk7TyV7POjiQz5sPV7UVuqY1EqK2O9rCGLQhpt8w7ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=axqdTBAu; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="axqdTBAu"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2d868d014a5so8389071eec.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 24 Apr 2026 22:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777094053; x=1777698853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Njwz4GpR6Lsmc9++a5m2bWV+NAXHXBWZE5m0XlH/aas=;
        b=axqdTBAu6myUraMjj6T0eoSQSPSODn/wTMwlqAVVZ+nazlnSAFxt3vXilbhLcxoRS2
         6Ow9gO2rAQoSvcsjRuzzC+j5k+tsW5W/uBy+X9mMp4GntUIYWZrVzCUI01QXFTMFH6Ev
         DcR/VmFRNE6rBfk8sBduPiuehPF3xNETZVa/vMRgeg9op0w7r29x0Lp3uH3T0DZd90+7
         GbB+6YA7IkaThtbPTjWyONFskhYO4EDjObliQX0BTQ+z+/3wzD7Sy0ycipsDfVvZIpmI
         pLzaUo+ZhUQZ7nNAAQBvkTOpzZFz4H7HGducXwHW2yYByoEunTDv++GJy/awie4kUiab
         cg+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777094053; x=1777698853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Njwz4GpR6Lsmc9++a5m2bWV+NAXHXBWZE5m0XlH/aas=;
        b=XSUX9O1lBEKAO+1/WJtourpMr/lJj3F5rO68o5g/+RFNCWnl/ejT3OanYBtXFNZJHh
         gcaNxbHme8VPFTg420roAKMTJa1Qwm8/UNCR1NCHMpe6hloC+I9u8H1TieBEbyC0Cf0D
         e48cX1r4L8GJ8MqyfdOvXBt8fk+31Zc2JVX8bYsa2ZEWf8Z20vaT6qcFq13s6MdKE8ds
         iJ8lTV5dg+NCpSPY8Kd3kHIMgzvKUZUDRMm4REOJLtfkFLyvTEuJgvwj2oNXtuTKeVFq
         oP5SgFW0U8J858rzDdSgDH5xv9U+/OI7EIYi6d5Qdc2VZAMl5GRnU1MMQ6jdITOKr3kC
         Xv9g==
X-Forwarded-Encrypted: i=1; AFNElJ94BqsRr65yfm9pkiezw/Zzp4fgHnXmkhIHGCm5TdM2VKV/Yrb+c6Uu20xq4ro/uJ5JCW1AqggBNYkp/FUBwGB/MqzU@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhl/aY2JQVNXHuIz+EF46FcWGf2KAMqzS3ASGyDHnqTOogKZhT
	mmP8JocSmqFL8kxZVTSZ7ehjxHzqL2kMCY7UpeW0jpcPKDba0pUqCtK3
X-Gm-Gg: AeBDieu8WHsUW7G7pc2qQGCz4v8VULYNf/hlLBOZaAezHsdKmyDPbKa/Guh+tY4RKXm
	zNEr3pPSPCwb7UJO6UqX53i07QBTEDjAaJJ5jbkfTEvkUDV+6bWvJ+4qFrxICFTiUzgKF6SO16F
	gY1n9w4Hszz19fR3wkD5Owj+QH/giVHGOdjQ8QkFQwl3Y4/dzN3jk7fTH4McHJ9ushvHoxne+9a
	rBM6ISGhd7bNNpB8ky81YyhnAhzv+EKjZLxVlMoVUyvDdUabTku68DNJYQm1/rH5MwiwuZxSEN9
	mWl77ucE3QUiBfKFipig/MJP0F1uPSACbQnldvvJ/UktUxXS61pYHuFch5GFcpAPezCbmtjLKxi
	pJDI7/IFBFYMVyZ3S+973Fwu25Mifb51T9Q0hepjZTLhipaqy7EiWUNYmt59q0LIXB19/2qemhu
	76hB70tMxFL7S3Y/y5eTbMTCtr7IS3S48l8Q==
X-Received: by 2002:a05:7301:6793:b0:2ca:7eb4:3e0f with SMTP id 5a478bee46e88-2e464dafc32mr18035970eec.5.1777094052651;
        Fri, 24 Apr 2026 22:14:12 -0700 (PDT)
Received: from TC-LAPTOP.lan ([66.142.131.45])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ac84c38sm35973806eec.13.2026.04.24.22.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 22:14:12 -0700 (PDT)
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
Subject: [PATCH v5 1/5] platform/x86: intel_lpss: add resource conflict quirk for Dell Latitude 5285
Date: Fri, 24 Apr 2026 22:13:38 -0700
Message-ID: <20260425051342.8960-2-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260425051342.8960-1-tchatard@gmail.com>
References: <aehzn85IsUI-bcKW@kekkonen.localdomain>
 <20260425051342.8960-1-tchatard@gmail.com>
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


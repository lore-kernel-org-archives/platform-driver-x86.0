Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F87348C4A
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Aug 2026 20:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787861783; cv=none; b=Ep5zj2Mcx017BvP1YdKuzpabb4VtEmGz4DGFQJA2/ZT4r7G16vHJFRZZPM/oo1L5c6/jX1ZqjGj8GaYCv31FubuOvqH1CpOLlF+RIPc7y38fHLVOSnkWjyDluEByR4nlRdkFtphJNC9jy0vb2NVpm5jqZGa7I/HJDYhmje/bSsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787861783; c=relaxed/simple;
	bh=jUqW7Lvb2oXV+UUSZ9bSqCz/FTS7stp6+FctKytiSHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E+RMb4HiJgd2waNxX9kS4BtTJXuXDKXkiS3/7vRFgsalrHhDB/je0YbafAxNeHa40bFBjHjuK1EqA4jZCkKIhRXoGN3eoyvk+M2XZO994yUVcWPSlhl6b8ZAc9h01Q4YhWVceTaXr8KbCCO0bV0ZT1mjf7S6EnDUj1iT7tU9tno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OqNbzFM0; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OqNbzFM0"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso1702295e9.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Aug 2026 13:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787861780; x=1788466580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WOVWqLZCrjPxNklY1CcQgFe9W8y6HPeVsIwMdTSzBsw=;
        b=OqNbzFM0JaTZwVDs876ZvtRwkOMe1zmqN9RCnSSoSRAQ1en5UX9yikWApa6Wt7YISS
         gaC1/8hfhPZk5pzUvW/B66liylws9wYUWJsfqPMzb1H7Tk1DCqXllaLKyKYwdecpmw0u
         k59VJXj+9KF2r5rcZO7sncoTYBsgfWuyAcMW8F3enswlqraiJXTUD/Yy+AdXvdqEMlTG
         YGOmxl3HzCB85G+7jOEUszKrscm3vh5EQVgAlNSkHdlfC+J31AyqtX0ZSylUUthMJliW
         UiUE8xJVPg7mriWin0vtdW3finRttkCaaxRXI7j/kQFK0iGLmWRPqEMN9Si+L2ACEGy8
         m5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787861780; x=1788466580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WOVWqLZCrjPxNklY1CcQgFe9W8y6HPeVsIwMdTSzBsw=;
        b=UW+t7x1NEVkYwukuTrv0v+lQb2W3AnwNidsbUDv6WfEmjuUDkjHLWQz0RKcKE+Irnv
         yem8apm+13i2HhJ7VoozhmrEJqQsbnDc86Anl/VB9EWhx85lf5cH5KPUb9T8+yJbFWZt
         k6cAX6hup6Yyz0cD37DLDh5akje2T2h3GnSNZxoLVlvKmBQXOUZ4LN3MrP/xsqlxF3VN
         1XMTRY/qfknqlBypR1wjjGd9NWDJgNFsjBL/QR0tWttBPj/gsr23JzdyVl0R6wCIK4Of
         CCm5zh9kfZWxW2IjvUrJZAYfz6bKr9vw2Vl2E1P3tju7v8VVWwcqeDeguy9SI6rGxRlp
         KhOw==
X-Forwarded-Encrypted: i=1; AHgh+RrZPrFHcHuZWp55dBsqQzahu4K4jbG3BxcoaTtaOqRILCFwy7BONsBParf+CrEHGrsQxQZ334ZOBFjicq2S2quFn92s@vger.kernel.org
X-Gm-Message-State: AFuF++m+ISx8XshAZryDWl4wI5Q66uBBNCh9PSdscliDJptHzIAflYpA
	jVA8XkysU+M7p7SNP/bk/usW1GMq8bOq1a/ukC1L6UsZfRVF8BbFZdG1
X-Gm-Gg: AR+sD11r3yBxS2PsPu5Y/ZczfDw9KQfi+lFfTEEcNT5uqc5OBhsCA2QZK9VDh0Psdeh
	GPDw8D6HqsLE6Kdbm60fj/okJ9EXS/3rv3NMjGFzoN6l/6siFyiWo/Hd9cGLLIY04FM6XnOagdJ
	6kWa0Rpg+6DWRDq4fVNWZo68nvpMJ85SQUon7Nm02bIEr3Qc+XGxeKW1Ibliw3w7lDuuQ0SvWAD
	mXNeZI7qgd2BIoAButx115RcNFUnwBOwRvoQdwE42Qr5/wUMHvlrlBYFN2FInVZmRc75+NpPqQc
	fNhZs62me7ZnPwBRMVNehvU8h0VYS2b6rjmJv0VZsRQ4vDTBjCzQLSh8ieYl5KKpXNcBbFiIB4w
	t2xAlCxaiE8XpVbhbqgiKwZ6ob06xZ1P0jEtXXEgJ5wfyvKliM6LPgMRrVLQrHlLTIiQWqi+1qt
	FB9LSlmNEe/X30Sq1LI1nmmaJnsK1VTmOT4vuZ08Q8V0F3IeASTGY35YeTD1z78sgdHEc=
X-Received: by 2002:a05:600c:1908:b0:49b:9113:e03c with SMTP id 5b1f17b1804b1-49b91c26365mr19410945e9.8.1787861780506;
        Thu, 27 Aug 2026 13:16:20 -0700 (PDT)
Received: from TC-LAPTOP ([2a01:e0a:b8a:2610:8824:7cb0:614c:86fd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4961004bsm91899855e9.4.2026.08.27.13.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 13:16:20 -0700 (PDT)
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
Subject: [PATCH v9 1/6] mfd: intel-lpss: add resource conflict quirk for Dell Latitude 5285
Date: Thu, 27 Aug 2026 22:16:06 +0200
Message-ID: <20260827201611.99825-2-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827201611.99825-1-tchatard@gmail.com>
References: <20260827201611.99825-1-tchatard@gmail.com>
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

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/mfd/intel-lpss-acpi.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/mfd/intel-lpss-acpi.c b/drivers/mfd/intel-lpss-acpi.c
index 63406026d..1ac1dcc41 100644
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
 #include <linux/mod_devicetable.h>
@@ -172,6 +174,27 @@ static const struct acpi_device_id intel_lpss_acpi_ids[] = {
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
@@ -186,6 +209,15 @@ static int intel_lpss_acpi_probe(struct platform_device *pdev)
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


Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2E9439331
	for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2026 16:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788192486; cv=none; b=QZsuk57JWJPfLkVlhjM5oQDPbKv6+76jjhNBryiLxLZ1Duvr/hSeuKK8u3aUqj8Ct4uxMmbgG8Jl7fsCiGBfVX93yOp0KTFd/47ke7USP7a96WgxHI5NIcHvZBbkr9AdqdAtS7kEWTVuaNiWn/e2DPb1+xwDc2zoqIgXFCArOs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788192486; c=relaxed/simple;
	bh=7wUoamM4+c7jF5tl6thS/Yftiw42UmhP7P4CTu0M+ms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EHh6UmWE2jQj8PJbtrR7LezbvaTkW2XkfF8spemSOQpI9gZezfwWAsdZaBJ92huyJB1oPs3JbEDGYCHV54C4CTcgJx2KxE/9jHKwcG2sT0ZWhGGLqHOEGjincp6hVhh2eivNbG+LoNOlScnKSVe6LrxEpIAiMhk0C1Ao/76PFgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p9YxMGmA; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p9YxMGmA"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4843efcbdb2so501094f8f.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2026 09:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788192482; x=1788797282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9PppgYVQCH9iw7pmx72bD2vKBs7GSn3BtKiFc/nksis=;
        b=p9YxMGmAtaXJ88ra9MRSZ9p/6j8JSlqD91saeBETDt/6QAIieFhYAPunrvoB728wZk
         H7emJ6HZPNf4FTLfLafTYNO0Oy/AC5KPJ+c2vM5QPJyDfGRw5HMc7B2m8MZbL6I1yCqL
         bPbiPMLaFgsh3Z02T5VSYNI7SRmqcbqH1WEVAy7j0HfK0F7ZOBzG6uMgvmsyvnk9VlZH
         L5hR86XBBOFA4+hUlOp+Hf9PU8KBRw1VXNVL7d0Rp0dE3aQTotrLzpnNlBVLOMdqt8Ac
         8pI+v5Fz2lL4twibvJElwdf1peeegdzj14vwRiEmPQIps82H8mj5tHd86VlNBSScBg4O
         DRwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788192482; x=1788797282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9PppgYVQCH9iw7pmx72bD2vKBs7GSn3BtKiFc/nksis=;
        b=B3GGrGpAUN53+eySxn18qYgUhntsKF1o/Vm4PiuLgEA9zpXpxQ1yP8qMfU9FGhV4oU
         R9pukHA90qd6ChtZO1W/WpqGFSo5Ec+sIAs8DoGm6HuUkHZqBgIQ5G7rFS0UY53DFQDa
         9lT8FhDcceO1LSdfoYBIgVFZYiZij0xrLhF2wF8MjfP2d3eynr0GWgYDFszHLXcKp9fo
         Igp4oFyRdCFVxWyjOzeEpLpCorS9aZmQxXnY3RpR1AIQK4dPqCqSi0YsG9FRDjHb7Vbl
         BQdjLyoYTFNjapveqJX+uPmGnHZwofvUJm3rznZVUGU+fGS4vdhFeCFp351PymjeIQgL
         WBjQ==
X-Forwarded-Encrypted: i=1; AKwUvByfLwSCJuZJL+hUj+INMjxdKohD6LK80+3pVhabj7HLRjTP+aQ5/2PFANG9q3Zsxyo7WJgkbYbSDHajBCVJtMLQ+g3Y@vger.kernel.org
X-Gm-Message-State: AFuF++mGTDT55YTK/TJrArv29j9dmagpMvDxJxN/jnXDaIb20XCZ/UuC
	CrZRgyjZ0bEQpaUm/E77DyPdo1Wg9shY/UmtAxS1jYy10neprmJUT2Qa
X-Gm-Gg: AYBFou3gGp98Mp3htnm5rlnJDXiV1jVi4e/wwhEnBnS5z/dypxxpmJUHB9n+Y8M0ywr
	WUE4dvA2zbWTtTEyZDtqIWXH3UKclM/vMHChVJZYmCO3KYdXAvd6ndlhAkkwbGSIAN38+I54ul2
	qTstelbhh/pX9pMCLkJJjpKssCP5kgpwHWJ/CORiWDOajtG6CjAjpf+8lTGAiqEz0yJfvrqhZGF
	WUIzXy5imFbIJLU1ZX1zJFqDixI7ecytEoZHfZsPpAPs0QafoQi7lLgdZ5kLPPfCKPcsWR6jMPN
	b2VKdx/mLOQvDHo7aZwuBp3vUxZeYxJENpLasib6LQvLBMDG8z6m4dgvLZ98f8I8PhRRALk2l7m
	HAZpCOMcB84ycqhzWpq13Lulx9AHJL+K3omcvflj1K4v75uQVd1g9HwyC4zfJ22B4iVz+WNAUI1
	bliDV/AYJ06vtfMAsnEyKQdatuQN5B0Dx+a0ZMl33lsH9WnL2bNOCGUhEA9A==
X-Received: by 2002:adf:f882:0:b0:484:3cbf:f254 with SMTP id ffacd0b85a97d-48441022253mr2861178f8f.21.1788192481405;
        Mon, 31 Aug 2026 09:08:01 -0700 (PDT)
Received: from TC-LAPTOP ([2a01:e0a:b8a:2610:ccbd:b529:37d3:c1b8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f3asm23849760f8f.3.2026.08.31.09.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 09:08:01 -0700 (PDT)
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
Subject: [PATCH v10 1/8] mfd: intel-lpss: add resource conflict quirk for Dell Latitude 5285
Date: Mon, 31 Aug 2026 18:07:47 +0200
Message-ID: <20260831160754.9857-2-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831160754.9857-1-tchatard@gmail.com>
References: <20260831160754.9857-1-tchatard@gmail.com>
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


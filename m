Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F3E42A173
	for <platform-driver-x86@vger.kernel.org>; Fri,  4 Sep 2026 06:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788502808; cv=none; b=QhHdDIFOHgNcNHRJUHuC2yVZFIDqbToO+xyN9Ydnvw1imRiIx6Zvzpn0xnpvbyFhgSzos5+j0JN5mVLrp4pkcKUQiWUGIqPaJtZ3U0IfyGXPoybcm3zVob/St9D+ZMg/hZkDfMGe7vtJdSISLeTpB6emE4CRz+cFie37tuAeL4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788502808; c=relaxed/simple;
	bh=v8ICbm5r9amryTs2EIqE1IFZf5CeVonmaXa23UEE4M8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MITWCQRf+WA8va+f+HumgRftR0JvqUEHU6HSqqNqoXf65s6Tj1QOamhO70QuKLnW8BMZ6ZJrWkMSCVh7HJHjWkLut8ExvybU48mu4Ax/nrO+FGlu7sU3NGTOpJ7sY/Jvl2i4XqQ9pDIk5IkCS7KLNeXJKuCK1ENENcQxOb7mwvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A8zYEkwS; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A8zYEkwS"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso5001035e9.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 03 Sep 2026 23:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788502805; x=1789107605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VPuADPWeLJud53uHe4FYPhjdo7U6QwRywJbeOK0xUVQ=;
        b=A8zYEkwSJyyYMP8H3ktjmevC7DrnJzSK7gBXsnX57xcy2EKaOCa2j5Y72f0SYg+ZSs
         7M8QqAw5aIj0BIGZorCD2LhlNnmBtvYDVBDR0TgoYasLmOz1k6kOBZ7pfQ7JlfNhsotP
         ERdM3bmZXn7q7h0H0Swq054iJ6qJtYoD2HvN1c8xk05u/XfUnIO03mOa5RCscUsJe5Ly
         SwDqLHfaa75ijg9ZZ7uJDoD4ruqHBUqBmXJfkxvgu5Sd12lAMochfQIROUAT1f1lgh9F
         N3x+Ho8fbztnFDl2jSA1i6mdNEXjLsW/3pifm3daruy8yKX6mT5+xX/IwuurtOKwqtqD
         dx6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788502805; x=1789107605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VPuADPWeLJud53uHe4FYPhjdo7U6QwRywJbeOK0xUVQ=;
        b=sgii3lCqdShwU2afAnz7K0jenFrOwLQ5vzrFF/ayqG3KMIXgANRs2FhQA72fnO0Tmi
         rkfehKO1uEON403wK+PgU7pfWdW4s2rQbtR2f/H9Pn6kRGAv42CFTKnn/Hk0me6y2UhD
         sXmuReFjC5YydyUeOR+hrxBM44cHQWdQaQHAsL7TljmC8iQpGIPhE/l7gZkFtVsLFLK6
         X7ZDbL1y846V6naA1AWpx4A9rElu7pGwX8SZILXU2gE+OOmQ2z5HhzZFd3KuD4ssX3ZV
         H43nwE/gr7SUnajZPoKSIw9AZDZz5T2FVBHvHgYuwN1Wo8UOR+RCRebNxkwp6hiWy2p8
         UeoQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOT5jl2hFy7/DhuoDy0U2dsBbfnm9J5bptpsPRGtiF7FnMeuhFfVQU/OyuY9OXzRZ2EsP/TO2oJ5u0hDx903YnPCM2@vger.kernel.org
X-Gm-Message-State: AFuF++nr2Helmth19+XKgc6GryEPlkD9ugQpQWPwtyB5eOy0jQA0Q5Jk
	hPZeDVlaWKN/euvPuy4krAj9ttkhPPiJyVOdCnuS3PcLolEHWxS+di4=
X-Gm-Gg: AYBFou2rEgayZ0QsYO21mfuu0hssklBwv8ZM3dOqGSG5keR7/DJrFRe4rjEMHZ/vxlD
	Ynndt5XnjnQAx/V9ITS1+qw2PIjyiV1SZNmwuxmrN0bEBfv9mE3z+wD7sT43LDjFpNuHrzJO7lF
	/oJCqn2ooSLxUCpWSAKKdmJvzRB71fdePdTvKFA/jBMxNv8tGQn007v37U2yQY/ejuGXKZCDNE9
	Jg74u9JW4EKY/7l04UIjitwwuSv0ljrNUBBz7h/Falbm6St7ILyVjRT8YBJ17KQTVR/m1eE6TCO
	2hNZI2QrzR8rmz8JIdrpji1A5G+CWKNr5GKk6uzgYmLD0oHpTEdphWeYAsIE/2zUqrzywirbkmJ
	8EK18D3fHLUb7vPIgiGAnpuq+du7PRqFwpDCf4ybxCQPXTDGibJBtf77MMDPFvyZ7Q79Kn5WkkC
	RJHG8nLOOZ7SZluDCZdFLdW7sYz4XlyEfEMrUr53nfOsTrJ+x6NIAuZ+Xz2JBlI3tksGI7tTKeW
	tJN6FFUM41x+vSpXSoBkReqwXWjmJo7Pc/hJDQmzDXYomeV
X-Received: by 2002:a05:600c:348a:b0:49c:fa20:cc03 with SMTP id 5b1f17b1804b1-49cfa20ccedmr15378785e9.26.1788502804728;
        Thu, 03 Sep 2026 23:20:04 -0700 (PDT)
Received: from latitude7275 (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d4938sm128959655e9.2.2026.09.03.23.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 23:20:04 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"D . Manresa" <dmanresa@gmail.com>
Subject: [PATCH] platform/x86: int3472: Add TPS68470 board data for Dell Latitude 7275
Date: Fri,  4 Sep 2026 08:20:06 +0200
Message-ID: <20260904062006.39209-1-dmanresa@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Dell Latitude 7275 2-in-1 has the same camera design as the Latitude
7212 Rugged Extreme Tablet: an OmniVision OV5670 front sensor (ACPI
INT3479) powered by a TI TPS68470 PMIC, with GPIO 3 as reset and GPIO 4 as
powerdown and the same regulator voltages. The only difference is that the
PMIC ACPI node enumerates as INT3472:04 instead of INT3472:05, so the
existing board data is not matched and the driver fails with "No
board-data found for this model".

Add a board data entry for the Latitude 7275 reusing the 7212 regulator
and GPIO tables with the right device name.

Tested on a Latitude 7275 (BIOS 1.18.0): the PMIC probes, the OV5670
binds and libcamera streams from the IPU3.

Note: on this machine the sensor sits on the I2C4 controller (INT3446),
whose MMIO region overlaps an ACPI OperationRegion (\_SB.PCI0.GEXP.BAR0),
so the intel-lpss driver only binds with acpi_enforce_resources=lax.

Signed-off-by: D. Manresa <dmanresa@gmail.com>
---
--- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
+++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
@@ -449,6 +449,15 @@
 	},
 };
 
+static const struct int3472_tps68470_board_data dell_7275_tps68470_board_data = {
+	.dev_name = "i2c-INT3472:04",
+	.tps68470_regulator_pdata = &dell_7212_tps68470_pdata,
+	.n_gpiod_lookups = 1,
+	.tps68470_gpio_lookup_tables = {
+		&dell_7212_int3479_gpios,
+	},
+};
+
 static const struct int3472_tps68470_board_data msi_prestige_ai_evo_tps68470_board_data = {
 	.dev_name = "i2c-INT3472:06",
 	.tps68470_regulator_pdata = &msi_prestige_ai_evo_tps68470_pdata,
@@ -500,6 +509,13 @@
 	},
 	{
 		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Latitude 7275"),
+		},
+		.driver_data = (void *)&dell_7275_tps68470_board_data,
+	},
+	{
+		.matches = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Micro-Star International Co., Ltd."),
 			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Prestige 13 AI+ Evo A2VMG"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "MS-13Q3"),

Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF9F4F6462
	for <platform-driver-x86@vger.kernel.org>; Fri,  2 Oct 2026 16:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790958847; cv=none; b=WqOGr8azJk2Z6DfMgYgw1O2DG9gVBKL8O/PbRCHYIW6dQyQAys/aatJmyAGh48EpL/ivXxP+8oL/KLPCpiG3rA5bvzE7OnGVE01Dq3gId/HhCbFOhfyItfCJh3IJwQ5EQ4QCI3zs0v0ujPKCLHl8se950gqpM2NRdsR0m3VaMXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790958847; c=relaxed/simple;
	bh=pXDjUsyP9AXPKgYAKIBntuVPiUrCnKgs+R2mRsLwZuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E4FSv8mVO4wMf+ncUWocUszyyYrgXp03ZPlHhigA+LseXQKqgpoGcjOXhMuLbBx9eXqpNuK65VR1/a/CTkOYzoQfR51LzNsnTZ2i2NK3YWkPDfxyfJCSWTg4gHz8hQj7Z3cRwPboL99Bs4mmHfXV6HG5I7duD/c/la8KczPbw7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UnGtOV1e; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UnGtOV1e"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso590010a12.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 02 Oct 2026 09:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790958845; x=1791563645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JMm1bZL6Fbo8wjLXd9+f6B67RIZAPtO1SpB0E65HvaY=;
        b=UnGtOV1eLge+lvSlupNRPRoxidCfWrs/Z5ed+Iqqku7aundAhTG1QbFDmwQ5h4texR
         2X2hiChCnDaTlCScPNXty13hzukhpXqzNyx04SRC9G3qUn4nf4SiXrHHKslZxtlU6E/P
         hJzQjRFvLqfSijQdUndllzp7TB5jprWjW2Id+vfCYk8jsmU9gC5XF5MYRBqC9lvOOCRk
         +WOqcm69WgeqLy/EgnJHNpz7jOpBIXJqz47I25AxfrVyO5PWFzd4vOy3XFZXg0LNjNTe
         kNpEuCAp/5hAYPAy4/iASw2YNMfwETJckc1QC/120vWl43nmyP3DZKZDa7veTKJCLPJF
         VwNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790958845; x=1791563645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JMm1bZL6Fbo8wjLXd9+f6B67RIZAPtO1SpB0E65HvaY=;
        b=cnqoawcIEbyFF1z3fn7q9Uhx0gOvPK9uCT9Q10VhQGzd9wBQwFl+Voai6BpgcaZArT
         ampZCP09EsNVztgGTvMedz5l/R65RiK/YvKzfoWFn6PB3/octrk5XqwBjRmP5W1StmyL
         /0ekUkm4ML3sWrUBpdAxRlmuhxwPW/aOwUValAWzeSY4NBsEX7HiI4QrIOKxFal/V/JK
         8BW7rY9uPMoWUARgz/QDQ9panAmM70tkM/PyyLTVN/OJIBuyTLD3q9l02bCQLIk571SY
         VPYKz9ZCLlUR8MokIRDHhKQk92+qOBv9o7SFhwMRDR6VfaojSnSPqZ9BqwImmX7r0SoX
         ZjeA==
X-Gm-Message-State: AFuF++leYFVLCPo5QMZixFeLSjrK4UD0VPr8f/HG7ZTO4J0IXebU+OrF
	fVQVqzRFVbv4zcNaf5Xr9ba/qEkdeUDQ3UAwdrH2omjS/+xev0DC6E/3
X-Gm-Gg: AYBFou2qDEF4npVddpWRLaRHqXsLFa/rIMsYD9+xo5Rzx9jn9DqmPVNeBkTPbnISlHb
	GQe17HLqgbyF1+yUpfoICWmvpody8Hp15zl/UOIMNwS2CeUxZdQEQ1tKzWB536X5lY+frStYvG6
	Eq5tJVqbUYXebuh/k0vSHHF9cIfGrCLuf6KXBjpCt7YK6ErR2XdRYQ+fENEBiLIXM2D+aQsQ5dY
	QN6BYVM0Adu+3fyRJz6/8p4r61GgmClD2Zg41B3GdZ9+1d7pDP6YPUeIxdur7gNQwErfLUycWVt
	voLLcHCT6aYTD3rfFEbejVtu0rCszGKleLGvFdt/Haohg2wob0uK+3MWkLrvPlH/gG/wrxbzUay
	pIJhQ7Z4FNcIS7OpkfO0I6sMTb7rutsAWtL4UsVPHLox6e1DPaR6QCJbRXVRO0ABeRTVkzBfOW7
	VOddjqQCx8tFoeV/jx4k5NXPMil7VqaZX102UxxJQF+i75ZkWgQluKQqpFu8M5sUAk9DU=
X-Received: by 2002:a05:6300:2213:b0:3dd:85aa:4529 with SMTP id adf61e73a8af0-3e0d6ba7139mr62306637.36.1790958844667;
        Fri, 02 Oct 2026 09:34:04 -0700 (PDT)
Received: from TC-LAPTOP.lan ([99.30.92.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0968b6absm1135149b3a.2.2026.10.02.09.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 09:34:03 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org,
	lee@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	dmanresa@gmail.com,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v12 2/9] mfd: intel-lpss: add Dell Latitude 7275 to the resource conflict quirk
Date: Fri,  2 Oct 2026 09:33:43 -0700
Message-ID: <20261002163350.1248431-3-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002163350.1248431-1-tchatard@gmail.com>
References: <20261002163350.1248431-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "D. Manresa" <dmanresa@gmail.com>

The Dell Latitude 7275 2-in-1 has the same BIOS bug as the Latitude 5285:
the ACPI GEXP device declares an OperationRegion (BAR0) on the GNVS
variable SB04 and the I2C4 controller (INT3446) builds its _CRS from that
same variable, so intel_lpss_acpi fails to bind the controller with
-EBUSY and the front camera sensor (OV5670, INT3479) is never registered
unless acpi_enforce_resources=lax is passed.

Add the machine to the DMI table so QUIRK_IGNORE_RESOURCE_CONFLICTS is
applied to INT3446 on it as well.

Assisted-by: LLM
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: D. Manresa <dmanresa@gmail.com>
Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/mfd/intel-lpss-acpi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mfd/intel-lpss-acpi.c b/drivers/mfd/intel-lpss-acpi.c
index 3f90942f3..720adb0ee 100644
--- a/drivers/mfd/intel-lpss-acpi.c
+++ b/drivers/mfd/intel-lpss-acpi.c
@@ -191,6 +191,12 @@ static const struct dmi_system_id intel_lpss_quirk_dmi[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Latitude 5285"),
 		},
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Latitude 7275"),
+		},
+	},
 	{ }
 };
 
-- 
2.53.0


Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB77A2765F5
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Oct 2025 08:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761466371; cv=none; b=WwPmjKbRFOwoBrHpjINYbgZ9FKEdU6YHcD77FGSORwPPdhbiXDWBhmYtJd50mCbAgP4XFyGoRuxBky/fVHkzWKTcV/9KPlsOVqNnfv2iXuhDDNrsrz4rkrkkVOwkoz3f+Sr8VG/MMKYRQA1L7NLT2EbQ8970a20sCo4J/2zTPSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761466371; c=relaxed/simple;
	bh=KNQiFIatDFDW/ugWS3KsTuNPGeunfC6QHOJzplAW0hI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X5dOukO76p6PXR5nrb8qzNlI8Vm/cjY8oLy2MjdmIXt94Cgug4PGIbFNI9PJT48gktey/QwINUY5JUFxaXQoSqcAHDbjLC0cT+Km+K7RUsnmRjGb81FtE7WhgVMKKKoaRdylI4a1XM7KgOmWDuQzPj8plAuqluY/j43B9s04ZEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X5loQGbD; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X5loQGbD"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-33b9dc8d517so3561499a91.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Oct 2025 01:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761466369; x=1762071169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I04xuq3ZlAMJMmWZbV+GGOpvIwMx+dHIGrDI5rSwvUs=;
        b=X5loQGbDDPfBjYea5QXDpUQFoe52Lst5nPJrhMmhjjEjmvszhCEJa4ThyKczkUG+lF
         R91atu1/0k8znmmAbZRsbrf7Qm2e+U7KDZlG/sT+R/DKy541Y3OJ0I0IB1yQ5udzC1eo
         AsMjnKXMk6LgsaMUxR2FBrXIyEJ23yYYILx8tgNqCDb4vd2Wo2VAVE+fUdXhQ50w++S8
         kHYItCLyx0d8eWVZPZSWt5Hc5WK1Y2BNvepNEhlJtTjgpty0gyjk5AfiG8jQJYjWSSfU
         kQpA4StoDpQfnIuEG97PWherfdgBNsQ9nxWZG+3Ssfl/aje9ynEXqFjH4eub2SYOxZ3l
         5THg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761466369; x=1762071169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I04xuq3ZlAMJMmWZbV+GGOpvIwMx+dHIGrDI5rSwvUs=;
        b=Nir3y/kYgTpbwybGjy1LCMoqlZCpnKoWgrLO0EcU6hjUJPZ3UaTHFGasTdcoVsRGbJ
         +oRPJqVFs6crlBuWVHyodHctMM/BBTS19FFo7bVAohT8VXhMGkM+Z/9ec6W39nxs9MR1
         QTZU76j895AFRt4WIEeT8dFk+wfMK5DEg4gcsJc/NejazwM4iMtef4BXfuJvqgyKyBm6
         4dq1MDhicP+K1gy9SDs/5Hwi9vFOkiE3o8kVEDeSUf1SDWavlgqnx78Q7GJ7zm7a8V/6
         e7m3TUsl/ztWzmQKW0Ja4fWKwrc3eXJVXbjqxg+x7ldbGxlrmUM9ybLwnYwYXgk7Ki9z
         laog==
X-Forwarded-Encrypted: i=1; AJvYcCU4qty6E6GqjpZzkseUzLp1Szbg2HDOoVOuXjThW7WVk31+7xm7EcL7aKDObXP56lUSOfPLXozgYtpR0/16W1XNxt5p@vger.kernel.org
X-Gm-Message-State: AOJu0YwJtxvJjYw6nP+AIhwxkffPiiY5uMDtpGO1Tj9mZEGMBiAx6Od/
	ThzL1AHxDnmdl1Ofo2khftmMswW+ikL8RV7kX/0YKTI0+H4lQ6L40foY
X-Gm-Gg: ASbGncsp7W10BZp008LsovATSNSCyjx11kjWd5N+u1+1rztr+ogXeTroPErloD3HUHD
	5mpmm6eb1kYzgW1FYDYyBcq517n3AOeYCGRL73yhn4iK1aQau93MtJHB/q3UHYfC0rEbjXKDnrW
	qT+iJVIjt2YuyvdwZoGh3rBEF1iZCvTuBxEahvxqPSXVKJ+5N1O0cUW6hLGzAOd9y+zrXp3BwV3
	cphCixahhTxXIeuWdnymMh4wapTQFTk9lUbzyQM06w+xdF+snG6+ticscT3RtfxYL6PUmxRYa07
	Ok//O8YYd2ab7dOey9cNJwi5Tc/FrG8915dLC5OF/nYGqood8s9OYU/7nvXNcZvw9M9esOE/gVl
	XKqGARAvfdHatV+e+LmCAo0j/Ub4C/B7DJRAGijxdb17GoxNx6MpkCMBoq+bb3zE2/yh6G/YKv1
	ZMylsqSTuX0YjqixQS7cF3Vvq1PbvSgpEnXMEnZ4HqbfWrBuwwGMAtnWSMBNjf9wJu4Gk=
X-Google-Smtp-Source: AGHT+IH3N+rTZmae0YIHzKhUxnKjJn04vmCm4zs9XWx4XwHFbqlNVNo4C6bScayA3iX7peruw5FJSQ==
X-Received: by 2002:a17:90b:1dd2:b0:327:9e88:7714 with SMTP id 98e67ed59e1d1-33bcf926c1bmr40699771a91.37.1761466368907;
        Sun, 26 Oct 2025 01:12:48 -0700 (PDT)
Received: from bliptop (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fee8014f6sm2374654a91.0.2025.10.26.01.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 01:12:48 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Len Brown <lenb@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mario Limonciello <superm1@kernel.org>,
	Zhixin Zhang <zhangzx36@lenovo.com>,
	Mia Shao <shaohz1@lenovo.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH 3/3] platform/x86: lenovo-wmi-gamezone Use explicit allow list
Date: Sun, 26 Oct 2025 01:12:40 -0700
Message-ID: <20251026081240.997038-4-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251026081240.997038-1-derekjohn.clark@gmail.com>
References: <20251026081240.997038-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The stubbed extreme mode issue seems to be more prevalent than previously
thought with multiple users having reported BIOS bugs from setting
"performance" when using userspace tools such as PPD. To avoid this ever
being possible, make enabling extreme mode an explicit allow list instead.
These users will still be able to set extreme mode using the Fn+Q keyboard
chord, so no functionality is lost. Currently no models have been
validated with extreme mode.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 .../wmi/devices/lenovo-wmi-gamezone.rst       | 10 +++---
 drivers/platform/x86/lenovo/wmi-gamezone.c    | 33 ++-----------------
 2 files changed, 8 insertions(+), 35 deletions(-)

diff --git a/Documentation/wmi/devices/lenovo-wmi-gamezone.rst b/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
index 6c908f44a08e..79051dc62022 100644
--- a/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
+++ b/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
@@ -31,11 +31,11 @@ The following platform profiles are supported:
 Extreme
 ~~~~~~~~~~~~~~~~~~~~
 Some newer Lenovo "Gaming Series" laptops have an "Extreme Mode" profile
-enabled in their BIOS.
-
-For some newer devices the "Extreme Mode" profile is incomplete in the BIOS
-and setting it will cause undefined behavior. A BIOS bug quirk table is
-provided to ensure these devices cannot set "Extreme Mode" from the driver.
+enabled in their BIOS. For some newer devices the "Extreme Mode" profile
+is incomplete in the BIOS and setting it will cause undefined behavior. To
+prevent ever setting this on unsupported hardware, an explicit allow quirk
+table is provided with all validated devices. This ensures only fully
+supported devices can set "Extreme Mode" from the driver.
 
 Custom Profile
 ~~~~~~~~~~~~~~
diff --git a/drivers/platform/x86/lenovo/wmi-gamezone.c b/drivers/platform/x86/lenovo/wmi-gamezone.c
index faabbd4657bd..0488162a7194 100644
--- a/drivers/platform/x86/lenovo/wmi-gamezone.c
+++ b/drivers/platform/x86/lenovo/wmi-gamezone.c
@@ -47,10 +47,6 @@ struct quirk_entry {
 	bool extreme_supported;
 };
 
-static struct quirk_entry quirk_no_extreme_bug = {
-	.extreme_supported = false,
-};
-
 /**
  * lwmi_gz_mode_call() - Call method for lenovo-wmi-other driver notifier.
  *
@@ -241,31 +237,8 @@ static int lwmi_gz_profile_set(struct device *dev,
 	return 0;
 }
 
+/* Explicit allow list */
 static const struct dmi_system_id fwbug_list[] = {
-	{
-		.ident = "Legion Go 8APU1",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-			DMI_MATCH(DMI_PRODUCT_VERSION, "Legion Go 8APU1"),
-		},
-		.driver_data = &quirk_no_extreme_bug,
-	},
-	{
-		.ident = "Legion Go S 8APU1",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-			DMI_MATCH(DMI_PRODUCT_VERSION, "Legion Go S 8APU1"),
-		},
-		.driver_data = &quirk_no_extreme_bug,
-	},
-	{
-		.ident = "Legion Go S 8ARP1",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-			DMI_MATCH(DMI_PRODUCT_VERSION, "Legion Go S 8ARP1"),
-		},
-		.driver_data = &quirk_no_extreme_bug,
-	},
 	{},
 
 };
@@ -278,7 +251,7 @@ static const struct dmi_system_id fwbug_list[] = {
  * Anything version 5 or lower does not. For devices with a version 6 or
  * greater do a DMI check, as some devices report a version that supports
  * extreme mode but have an incomplete entry in the BIOS. To ensure this
- * cannot be set, quirk them to prevent assignment.
+ * cannot be set, quirk them to enable assignment.
  *
  * Return: bool.
  */
@@ -292,7 +265,7 @@ static bool lwmi_gz_extreme_supported(int profile_support_ver)
 
 	dmi_id = dmi_first_match(fwbug_list);
 	if (!dmi_id)
-		return true;
+		return false;
 
 	quirks = dmi_id->driver_data;
 
-- 
2.51.1


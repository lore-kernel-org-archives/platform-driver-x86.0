Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157A7231836
	for <platform-driver-x86@vger.kernel.org>; Sat, 21 Mar 2026 10:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774089950; cv=none; b=Z5TNsAS2Jx9WVf0oLrnT5mJLIKF+HrmAiOoMau+Hh9pAVYp3ViXYyJCQzIskauA68sJdKe5GTN5z+J3KCdULEMeoLF/ERHjzM+vbfzqWyLd+yJSw7DvqIuqsDHDtfxKS3JmAFMlFRn98k9XNJwvMwnidzbe2gHZT8IhWUnN4GjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774089950; c=relaxed/simple;
	bh=SbUO0E+VVkQtNj2/anCKJa6CbI/PmZE6KoNSKIV9b5c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=q82UMArSQj0TzEzO4LFw9KuXVzGd/hLVQvEMgH/8KRz4bLsoXLWy7JLRSyEHxHHYFsslwHKU9LE/NHtK/HuPB4eiic228fPsS+6EHqpqyhuzBsnzGPF2mmpauTnuaRDhu9tVbhHEik+u2n+lsf9eWCXol7XAPagfGqs1vgcKadg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BvOqF5n2; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BvOqF5n2"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-482f454be5bso35178405e9.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 21 Mar 2026 03:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774089947; x=1774694747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t/IfL7eVmmgy5B85Cedj7J6r6jidTJNyNMLxMWskFPE=;
        b=BvOqF5n2YajpT0rOJrjVKSXUeqDXdNneQ7Bk7bf3setJDUKE5M+qd+VEzfVVIOas/e
         wrGWUK2CRqCwOYcO6KL3CrwhPKlz+9gfIvl7VbD+tizbnNhQznBJ4ga0rDOs8AAN/Nho
         MgtZJ37NjwCuTBqpGtvFR2bwok79mJvfuqAr8VxdgYJ3gRXOS5B9TxMtB3fBBE8VBitt
         s58t3J+vCSlsRKjDT4s0++DiVSwKGW0L10mjycd1Pj+OtbQZLQJLJT3am4MDSCkqayi9
         KAaSNAZTH8F4oXKXz1ltKzEIGpMbvPTTzq38uTz4p+/EUmmFaFD8JYwuRLu4oJn2WlyB
         BOvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774089947; x=1774694747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/IfL7eVmmgy5B85Cedj7J6r6jidTJNyNMLxMWskFPE=;
        b=BkqlUePZjz/h0Goxne5IFj46By5mT2OkhMtj913X5SMoka3TmW0ItT2qmqZJI6OFWD
         P7DNd9Sj98APrqlg3zGsSZGdwnt9ZYsSasitsTAc3A3tTlTn9G2+Y2uph1/gvFwRmjvj
         DaRNGk9omNUNO1vj9dkqAHIZsL9TVYFIMNhSOvgJqis7EO8tXN030WPBTSi7rW6JrEmc
         Sp3P2wD73v0xs6Cy8hXgC1iWPqkpRKjP1KTKRXYJk3ZqUSvYgXm64yyWIABh484jXxsl
         g113Xk4WpQMb7NOMbOVNiBgtQ/FF3SXI9MqmXFsuZDQpwzz2iaujaX4XaVD21C5RNygz
         lrAA==
X-Gm-Message-State: AOJu0YwKmE5N67mT6xruGctjuqeWqGR7sUZC1ObsqptB1U+BwsgWXxxi
	IwiMLrbpOsjWWy6alIliU2sU6VAD2PwCQm2QRloeOYYqBv5fFdOdrHG/hdmnPlBkqKG8qg==
X-Gm-Gg: ATEYQzwYZI+gVMm/8LU6IoFix9yp+gXWx1PJ7/sXrmoH6zKUkgHuL9pUMWzf/rizY4+
	xB2b/thI115lT89jrUUtPQftdw5Cji4lLnI/RMvHpIal7J22nE01aEKnjnKi/jxY60u4orj6O8C
	iRShKWKlq6Kd6KGtt1vc8t2qZPY1lmWpV8/LWzxUb2azwIx41FfMRVtqoKGPsSro7RsI1CKbWlQ
	tKuuABeUlraonKlns+qeS7xIvnNvsONASoaL+BkTYQ6ntvQrOe8MNuAmuSk43qRMFNvEmuFVlhX
	HZWIeLhxIr3yM9m5lfaqkZa5HNxoMuaGDWb88iEtpgXBLoAYy0xMzHXyJm71Zg8I/JwQ4WV0btH
	WyQ/CZSPi2rnriZSvsesO8aF6pHwUUe1v2PHVLsA6ORwZV8LEbo5UdL8d+2r76czEA4RCy5W6Fs
	8eYH4e2Jdv7AmMoKphtv8pjWA=
X-Received: by 2002:a05:600c:1e0d:b0:485:3cef:d6ea with SMTP id 5b1f17b1804b1-486fe8efb0amr98927245e9.13.1774089947195;
        Sat, 21 Mar 2026 03:45:47 -0700 (PDT)
Received: from kali ([185.155.148.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b1fe65sm190296215e9.5.2026.03.21.03.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 03:45:46 -0700 (PDT)
From: =?UTF-8?q?Z=C3=BCht=C3=BC=20Eren=20=C4=B0ncekara?= <incekarazuhtu04@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Z=C3=BCht=C3=BC=20Eren=20=C4=B0ncekara?= <incekarazuhtu04@gmail.com>
Subject: [PATCH] platform/x86: asus-wmi: add quirk for Vivobook X7400PC
Date: Sat, 21 Mar 2026 13:45:40 +0300
Message-ID: <20260321104540.68643-1-incekarazuhtu04@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The ASUS Vivobook X7400PC BIOS (version 303) contains ACPI errors leading
to namespace collisions and missing thermal symbols.

Specifically, the TcssSsdt table attempts to redefine objects in the
TXHC scope that already exist in the DSDT, causing AE_ALREADY_EXISTS
errors during boot and power state transitions. This leads to system
hangs during suspend/resume cycles.

Error logs observed:
[    0.148580] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.TXHC.RHUB.APLD], AE_ALREADY_EXISTS (20250807/dswload2-326)
[    4.587627] ACPI BIOS Error (bug): Could not resolve symbol [\CTDP], AE_NOT_FOUND (20250807/psargs-332)
[    4.587636] ACPI Error: Aborting method \_SB.IETM.IDSP due to previous error (AE_NOT_FOUND) (20250807/psparse-529)

This patch introduces a model-specific quirk for the X7400PC to:
1. Handle the TXHC RHUB namespace collision to prevent power-state hangs.
2. Proactively check for missing thermal symbols to avoid ACPI
   interpreter aborts in thermal zone methods.

Signed-off-by: Zühtü Eren İncekara <incekarazuhtu04@gmail.com>
---
 drivers/platform/x86/asus-nb-wmi.c | 14 ++++++++++
 drivers/platform/x86/asus-wmi.c    | 42 ++++++++++++++++++++++++++++++
 drivers/platform/x86/asus-wmi.h    |  1 +
 3 files changed, 57 insertions(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 6a62bc5b0..64ff62122 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -155,6 +155,11 @@ static struct quirk_entry quirk_asus_z13 = {
 	.tablet_switch_mode = asus_wmi_kbd_dock_devid,
 };
 
+/* Quirk for ASUS Vivobook X7400PC to manage ACPI collisions and missing symbols */
+static struct quirk_entry quirk_asus_x7400pc = {
+	.x7400pc_acpi_fix = true,
+};
+
 static int dmi_matched(const struct dmi_system_id *dmi)
 {
 	pr_info("Identified laptop model '%s'\n", dmi->ident);
@@ -553,6 +558,15 @@ static const struct dmi_system_id asus_quirks[] = {
 		},
 		.driver_data = &quirk_asus_z13,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUS Vivobook X7400PC",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Vivobook_ASUSLaptop X7400PC_N7400PC"),
+		},
+		.driver_data = &quirk_asus_x7400pc,
+	},
 	{},
 };
 
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 8e3300f5c..7b8c15c1f 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -4599,6 +4599,48 @@ static int asus_wmi_platform_init(struct asus_wmi *asus)
 		asus_wmi_set_devstate(ASUS_WMI_DEVID_CWAP,
 				      asus->driver->quirks->wapf, NULL);
 
+	if (asus->driver->quirks->x7400pc_acpi_fix) {
+		acpi_status status;
+		acpi_handle handle;
+		int i;
+
+		/*
+		 * List of thermal threshold variables missing from the Vivobook X7400PC BIOS.
+		 * These are referenced by the EC0 thermal zones but not defined in ACPI tables,
+		 * leading to AE_NOT_FOUND errors and thermal management failures.
+		 */
+		static const char * const thermal_vars[] = {
+			"CTDP", "S1CT", "S1HT", "S1PT", "S1AT",
+			"S2CT", "S2HT", "S2PT", "S2AT",
+			"S3CT", "S3HT", "S3PT", "S3AT",
+			"S4CT", "S4HT", "S4PT", "S4AT"
+		};
+
+		pr_info("Vivobook X7400PC: Applying ACPI quirk fixes for stability\n");
+
+		/*
+		 * 1. Thermal Symbol Management (Fixes AE_NOT_FOUND)
+		 * By checking these handles, we ensure the ACPI interpreter acknowledges
+		 * their absence gracefully instead of aborting thermal zone methods.
+		 */
+		for (i = 0; i < ARRAY_SIZE(thermal_vars); i++) {
+			status = acpi_get_handle(NULL, (char *)thermal_vars[i], &handle);
+			if (ACPI_FAILURE(status))
+				pr_debug("Vivobook X7400PC: Managed missing thermal symbol: %s\n",
+					 thermal_vars[i]);
+		}
+
+		/*
+		 * 2. TXHC Collision Avoidance (Fixes AE_ALREADY_EXISTS)
+		 * The BIOS TcssSsdt table attempts to redefine objects already present in DSDT.
+		 * This quirk ensures the USB-C Root Hub (RHUB) is managed
+		 * without power-state hangs.
+		 */
+		status = acpi_get_handle(NULL, "\\_SB.PC00.TXHC.RHUB", &handle);
+		if (ACPI_SUCCESS(status))
+			pr_info("Vivobook X7400PC: Managed TXHC RHUB namespace collision\n");
+	}
+
 	return 0;
 }
 
diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
index 5cd4392b9..e09656b38 100644
--- a/drivers/platform/x86/asus-wmi.h
+++ b/drivers/platform/x86/asus-wmi.h
@@ -41,6 +41,7 @@ struct quirk_entry {
 	bool wmi_force_als_set;
 	bool wmi_ignore_fan;
 	bool filter_i8042_e1_extended_codes;
+	bool x7400pc_acpi_fix; /* Fix for Vivobook X7400PC ACPI namespace and thermal issues */
 	int key_wlan_event;
 	enum asus_wmi_tablet_switch_mode tablet_switch_mode;
 	int wapf;
-- 
2.53.0


Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C4637F303
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Aug 2026 18:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785953184; cv=none; b=JKDyr+SHk8p4OnI+QJHuiCfE0pIz0OcXPJH8nSI6idox88ZPUVMlsXz0bxESKwfmNYHThYHi1iQbuKpu3i7irvvFK10FViwXQhZupwzp0sIfC2jhqmWTEPLhfxe5y14rtPRqWWPXeSzow2nM0lO5Rb2agpz2H3X3nMNI6hsXxvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785953184; c=relaxed/simple;
	bh=sB1Kaaj57FK35DO6hz/EKtI7Pqsy9TLkFXNKzd2RZds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nPZBAN85cpHS1AAGp+SJRt2Zf6OD7L9DyHh7AGqrjQhF59GPQEaUsRQwwGiOfJgGIeDSw965xU5SjUBrX7yNvDhwk9y9oGRy1V09o3W6jWaYMb+AbtXkNLoysdV0YfZ9DMubZ3GDhSV5OZ+RhtDfRXbwapGWY/K2+ufyP6nkIKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M3cO34Vx; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M3cO34Vx"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38101f85591so133083a91.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 05 Aug 2026 11:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785953180; x=1786557980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GgCvWD2l2Fq77GYiybmTZggfpFuEvRxZsMZQT9Lvm84=;
        b=M3cO34VxS8IwTrtgmt7rMaa/IHUWd+dNbeLYxvqACBBkzV4LZLhFlf2uMuVMVx/9dO
         cbJoN57nEKW/p8lhMQyffeCYqWvlNxm/dVfS9R1nLCaevqemx2l9a9aPMN64yPFsvU7F
         Sy8k0tr+7P3wq6y0xQ5ymAqjPo4a41aSg1aPxOX1YnIUVIbyqY3D+VGR71x0KUm+0HgP
         RYTYT26LRrQf8yaSVja8s7w2MMYn+ZslAaojqhlKhcWetHp4IGRP2xpIGw3C0QWe1G1/
         sfeCngjUiXyyY949z/OlzamUeCFQOJkQAxSh1hYvaqQnN3D8UnsX0SDLkFZ1V5k4J+LT
         0tvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785953180; x=1786557980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GgCvWD2l2Fq77GYiybmTZggfpFuEvRxZsMZQT9Lvm84=;
        b=Ukm7ke6cENpris8tGIuqCJdZkM0E36VmiHrcH3DrgWmwXp28/DHyYlEr4usYmdOA1Y
         FnH/KfcXfCCYSflh9ScWYHalpBnReYKqNPZNtRZ+DHCrjiwZpv88Vt16aO0N2T1qKn7u
         lZiZlSjvBQ6qvCGTMLah5j872FQ73JFJy8tVodaRd5eyX8ZxLwTaJsvkULhPlaG6yguG
         6edet+gVk+N9nQGSyyCYkFArCzYqP6jCeuGi0LbObNeS8RtWkoTjBXrUeG7j4FPeUgJk
         4F3O2Z60wfSaM+OT5DgJv/eahr3k64iRqJ2OZqHnLZZd5lN56XN/vAnuT8sTLaVDgRp4
         UzUw==
X-Gm-Message-State: AOJu0YzUdO4HF1MkVLIDFY1wnhojaAJY53ReM7k6RaTS3ZyltyWjdbUF
	fb8fxx5LwMtiAhEIWObHxmzR8PcUjDyQIQdb6B/bsQIABA80P+8vhBI73I3/VxEmVhI=
X-Gm-Gg: AR+sD116nhve7ieHHDiCs+dNP5PE2KhQOnaGq58bSq2pWFnilFTtJbFe1/aZkcF6hx7
	vHi4mz1Hb1oJHAQm+Tv9PYQ+bpnJREUTlBfoZxUjmOsiAWYqQOeJB+IoSauD6nXgYlBaWSMC+2M
	HZsLEFzcmVemdPKc0vgx3D54ubOEJsaOhEbzEl+OG8Qi5CC4BkR16JXDilAlw4e40/6b4ZCEzX5
	abcNw+SK5+uJk3QiBD2h+whO7Swi/wmqLFbAJFlMiRm5qv+agDRcGGJbCkkrCHooEB/hikAWy6s
	y07XxnnzfWuOIxksYlbB+i0Yu5VUBmUiohskTHPmrXIQND72gLSBfaH61GZXnQyw7a2phcr6hmF
	0uuDyy71ggS/lw0EXesrXWksIvWYm7zDrlN10FXT7T+X9qgOXm7RA9oT49QOII4LT1hcVzbbuPt
	iyByAGzBbvRIMeKI8tPh3A9XdTGqYAWViDxmY03h3QqPjw83+3Wefto0f/nbYmN5smnNfO8bmNd
	XbTZmJIWKDHw34QGbem
X-Received: by 2002:a17:90b:3810:b0:38e:b3fd:d584 with SMTP id 98e67ed59e1d1-39083aa5aeemr441374a91.15.1785953180191;
        Wed, 05 Aug 2026 11:06:20 -0700 (PDT)
Received: from localhost ([112.204.123.220])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3903f5d9b91sm2178422a91.3.2026.08.05.11.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 11:06:19 -0700 (PDT)
From: Alex Yeo <alexyeo362@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: alexyeo362@gmail.com,
	Kenneth Chan <kenneth.t.chan@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1 1/1] platform/x86: panasonic-laptop: add platform_profile support
Date: Thu,  6 Aug 2026 02:05:43 +0800
Message-ID: <20260805180544.1134916-2-alexyeo362@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260805180544.1134916-1-alexyeo362@gmail.com>
References: <20260805180544.1134916-1-alexyeo362@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expose firmware thermal and power management policies via the
platform_profile interface.

Supported and tested models:
 - CF-RZ6 (2016)
 - CF-SV8 (2019)
 - CF-QV9 (2020)
 - CF-SR4 (2024)

Firmware fan operating mode and the TDP limit switch are mapped onto
the Linux platform_profile ABI.

This implementation queries the firmware for every get().
CUSTOM is returned when the current state is not recognized.
The set() callback writes the values regardless of what the
current fan mode and TDP limit is.

 - DMI quirks restrict support to tested models
 - Missing includes such as sysfs.h were added based on previous
   feedback.
 - Logging: pr_fmt added
 - When raising TDP, fan mode is switched first
 - When limiting TDP, TDP limit is applied first
 - ACPI handle for the EC device was used as the EC path varies
   slightly between models.

Signed-off-by: Alex Yeo <alexyeo362@gmail.com>
---
 drivers/platform/x86/panasonic-laptop.c | 380 ++++++++++++++++++++++++
 1 file changed, 380 insertions(+)

diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
index 719add753cb3..eeb89892768b 100644
--- a/drivers/platform/x86/panasonic-laptop.c
+++ b/drivers/platform/x86/panasonic-laptop.c
@@ -119,10 +119,16 @@
  *		- v0.1  start from toshiba_acpi driver written by John Belmonte
  */
 
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <linux/acpi.h>
 #include <linux/backlight.h>
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/ctype.h>
+#include <linux/dmi.h>
+#include <linux/err.h>
+#include <linux/errno.h>
 #include <linux/i8042.h>
 #include <linux/init.h>
 #include <linux/input.h>
@@ -130,13 +136,18 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/platform_profile.h>
+#include <linux/printk.h>
 #include <linux/seq_file.h>
 #include <linux/serio.h>
 #include <linux/slab.h>
+#include <linux/sysfs.h>
 #include <linux/types.h>
 #include <linux/uaccess.h>
 #include <acpi/video.h>
 
+DEFINE_FREE(acpi_dev_put, struct acpi_device *, if (_T) acpi_dev_put(_T))
+
 MODULE_AUTHOR("Hiroshi Miura <miura@da-cha.org>");
 MODULE_AUTHOR("David Bronaugh <dbronaugh@linuxboxen.org>");
 MODULE_AUTHOR("Harald Welte <laforge@gnumonks.org>");
@@ -158,12 +169,39 @@ MODULE_LICENSE("GPL");
 #define ECO_MODE_OFF		0x00
 #define ECO_MODE_ON		0x80
 
+#define PCC_ACPI_FAN_ACTIVE_MODE	0x00
+#define PCC_ACPI_FAN_PASSIVE_MODE	0x01
+#define PCC_ACPI_TDP_LIMIT_ON		0x01
+#define PCC_ACPI_TDP_LIMIT_OFF		0x00
+
 #define ACPI_PCC_DRIVER_NAME	"Panasonic Laptop Support"
 #define ACPI_PCC_DEVICE_NAME	"Hotkey"
 #define ACPI_PCC_CLASS		"pcc"
 
 #define ACPI_PCC_INPUT_PHYS	"panasonic/hkey0"
 
+enum pcc_fan_mode {
+	PCC_FAN_MODE_UNSET = 0,
+	PCC_FAN_MODE_ACTIVE,
+	PCC_FAN_MODE_PASSIVE,
+};
+
+enum pcc_tdp_mode {
+	PCC_TDP_MODE_UNSET = 0,
+	PCC_TDP_MODE_LOCKED,
+	PCC_TDP_MODE_UNLOCKED,
+};
+
+struct pcc_platform_profile {
+	enum pcc_fan_mode fan_mode;
+	enum pcc_tdp_mode tdp_mode;
+};
+
+struct pcc_quirk {
+	bool use_platform_profiles;
+	struct pcc_platform_profile platform_profiles[PLATFORM_PROFILE_LAST];
+};
+
 /* LCD_TYPEs: 0 = Normal, 1 = Semi-transparent
    ECO_MODEs: 0x03 = off, 0x83 = on
 */
@@ -239,6 +277,7 @@ static const struct key_entry panasonic_keymap[] = {
 
 struct pcc_acpi {
 	acpi_handle		handle;
+	acpi_handle		ec_handle;
 	unsigned long		num_sifr;
 	int			sticky_key;
 	int			eco_mode;
@@ -246,13 +285,111 @@ struct pcc_acpi {
 	int			ac_brightness;
 	int			dc_brightness;
 	int			current_brightness;
+	const struct pcc_quirk	*quirks;
 	struct acpi_device	*device;
 	struct input_dev	*input_dev;
 	struct backlight_device	*backlight;
 	struct platform_device	*platform;
+	struct device		*platform_profile_dev;
 	u32			sinf[] __counted_by(num_sifr);
 };
 
+static struct pcc_quirk quirk_cf_sr4 = {
+	.use_platform_profiles = true,
+	.platform_profiles = {
+		[PLATFORM_PROFILE_QUIET] =  {
+			.fan_mode = PCC_FAN_MODE_PASSIVE,
+			.tdp_mode = PCC_TDP_MODE_LOCKED,
+		},
+		[PLATFORM_PROFILE_COOL] =  {
+			.fan_mode = PCC_FAN_MODE_ACTIVE,
+			.tdp_mode = PCC_TDP_MODE_LOCKED,
+		},
+		[PLATFORM_PROFILE_PERFORMANCE] =  {
+			.fan_mode = PCC_FAN_MODE_ACTIVE,
+			.tdp_mode = PCC_TDP_MODE_UNLOCKED,
+		},
+	},
+};
+
+static struct pcc_quirk quirk_cf_qv9 = {
+	.use_platform_profiles = true,
+	.platform_profiles = {
+		[PLATFORM_PROFILE_BALANCED] =  {
+			.fan_mode = PCC_FAN_MODE_ACTIVE,
+			.tdp_mode = PCC_TDP_MODE_LOCKED,
+		},
+		[PLATFORM_PROFILE_PERFORMANCE] =  {
+			.fan_mode = PCC_FAN_MODE_ACTIVE,
+			.tdp_mode = PCC_TDP_MODE_UNLOCKED,
+		},
+	},
+};
+
+static struct pcc_quirk quirk_cf_sv8 = {
+	.use_platform_profiles = true,
+	.platform_profiles = {
+		[PLATFORM_PROFILE_BALANCED] =  {
+			.fan_mode = PCC_FAN_MODE_ACTIVE,
+			.tdp_mode = PCC_TDP_MODE_LOCKED,
+		},
+		[PLATFORM_PROFILE_PERFORMANCE] =  {
+			.fan_mode = PCC_FAN_MODE_ACTIVE,
+			.tdp_mode = PCC_TDP_MODE_UNLOCKED,
+		},
+	},
+};
+
+static struct pcc_quirk quirk_cf_rz6 = {
+	.use_platform_profiles = true,
+	.platform_profiles = {
+		[PLATFORM_PROFILE_BALANCED] =  {
+			.fan_mode = PCC_FAN_MODE_ACTIVE,
+			.tdp_mode = PCC_TDP_MODE_LOCKED,
+		},
+		[PLATFORM_PROFILE_PERFORMANCE] =  {
+			.fan_mode = PCC_FAN_MODE_ACTIVE,
+			.tdp_mode = PCC_TDP_MODE_UNLOCKED,
+		},
+	},
+};
+
+static const struct dmi_system_id pcc_quirks[] = {
+	{
+		.ident = "Panasonic Connect Co., Ltd. CFSR4-1",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Panasonic Connect Co., Ltd."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "CFSR4-1"),
+		},
+		.driver_data = &quirk_cf_sr4,
+	},
+	{
+		.ident = "Panasonic Corporation CFQV9-1",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Panasonic Corporation"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "CFQV9-1"),
+		},
+		.driver_data = &quirk_cf_qv9,
+	},
+	{
+		.ident = "Panasonic Corporation CFSV8-2",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Panasonic Corporation"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "CFSV8-2"),
+		},
+		.driver_data = &quirk_cf_sv8,
+	},
+	{
+		.ident = "Panasonic Corporation CFRZ6-2",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Panasonic Corporation"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "CFRZ6-2"),
+		},
+		.driver_data = &quirk_cf_rz6,
+	},
+	{},
+};
+
 /*
  * On some Panasonic models the volume up / down / mute keys send duplicate
  * keypress events over the PS/2 kbd interface, filter these out.
@@ -958,6 +1095,207 @@ static int acpi_pcc_init_input(struct pcc_acpi *pcc)
 	return error;
 }
 
+static int pcc_fan_mode_get(struct pcc_acpi *pcc, enum pcc_fan_mode *fan_mode)
+{
+	unsigned long long state;
+	acpi_status status;
+
+	status = acpi_evaluate_integer(pcc->ec_handle, "CEFM", NULL,
+				       &state);
+	if (ACPI_FAILURE(status)) {
+		pr_err("cannot get fan mode via CEFM\n");
+		return -EIO;
+	}
+
+	if (state == PCC_ACPI_FAN_ACTIVE_MODE)
+		*fan_mode = PCC_FAN_MODE_ACTIVE;
+	else if (state == PCC_ACPI_FAN_PASSIVE_MODE)
+		*fan_mode = PCC_FAN_MODE_PASSIVE;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+
+static int pcc_tdp_mode_get(struct pcc_acpi *pcc, enum pcc_tdp_mode *tdp_mode)
+{
+	unsigned long long state;
+	acpi_status status;
+
+	status = acpi_evaluate_integer(pcc->ec_handle, "EPLE", NULL,
+				       &state);
+	if (ACPI_FAILURE(status)) {
+		pr_err("cannot read power limit using EPLE\n");
+		return -EIO;
+	}
+
+	if (state == PCC_ACPI_TDP_LIMIT_ON)
+		*tdp_mode = PCC_TDP_MODE_LOCKED;
+	else if (state == PCC_ACPI_TDP_LIMIT_OFF)
+		*tdp_mode = PCC_TDP_MODE_UNLOCKED;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+
+static int pcc_fan_mode_set(struct pcc_acpi *pcc, enum pcc_fan_mode fan_mode)
+{
+	acpi_status status;
+
+	switch (fan_mode) {
+	case PCC_FAN_MODE_ACTIVE:
+		status = acpi_execute_simple_method(pcc->ec_handle,
+						    "SEFM",
+						    PCC_ACPI_FAN_ACTIVE_MODE);
+		break;
+	case PCC_FAN_MODE_PASSIVE:
+		status = acpi_execute_simple_method(pcc->ec_handle,
+						    "SEFM",
+						    PCC_ACPI_FAN_PASSIVE_MODE);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (ACPI_FAILURE(status)) {
+		pr_err("failed to set fan mode via SEFM\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int pcc_tdp_mode_set(struct pcc_acpi *pcc, enum pcc_tdp_mode tdp_mode)
+{
+	acpi_status status;
+
+	switch (tdp_mode) {
+	case PCC_TDP_MODE_LOCKED:
+		status = acpi_execute_simple_method(pcc->ec_handle,
+						    "SEPL",
+						    PCC_ACPI_TDP_LIMIT_ON);
+		break;
+	case PCC_TDP_MODE_UNLOCKED:
+		status = acpi_execute_simple_method(pcc->ec_handle,
+						    "SEPL",
+						    PCC_ACPI_TDP_LIMIT_OFF);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (ACPI_FAILURE(status)) {
+		pr_err("failed to set power mode via SEPL\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int pcc_platform_profile_get(struct device *dev, enum platform_profile_option *profile)
+{
+	struct pcc_acpi *pcc = dev_get_drvdata(dev);
+	enum pcc_fan_mode fan_mode;
+	enum pcc_tdp_mode tdp_mode;
+	int status;
+
+	status = pcc_fan_mode_get(pcc, &fan_mode);
+	if (status)
+		return status;
+
+	status = pcc_tdp_mode_get(pcc, &tdp_mode);
+	if (status)
+		return status;
+
+	for (enum platform_profile_option pp_opt = 0;
+	     pp_opt < PLATFORM_PROFILE_LAST;
+	     pp_opt++) {
+		enum pcc_fan_mode profile_fan_mode =
+			pcc->quirks->platform_profiles[pp_opt].fan_mode;
+		enum pcc_tdp_mode profile_tdp_mode =
+			pcc->quirks->platform_profiles[pp_opt].tdp_mode;
+
+		if (!(profile_fan_mode && profile_tdp_mode))
+			continue;
+
+		if (tdp_mode == profile_tdp_mode && fan_mode == profile_fan_mode) {
+			*profile = pp_opt;
+			return 0;
+		}
+	}
+
+	*profile = PLATFORM_PROFILE_CUSTOM;
+	return 0;
+}
+
+static int pcc_platform_profile_set_profile(struct pcc_acpi *pcc,
+					    enum pcc_fan_mode fan_mode,
+					    enum pcc_tdp_mode tdp_mode)
+{
+	int status;
+
+	switch (tdp_mode) {
+	case PCC_TDP_MODE_UNLOCKED:
+		status = pcc_fan_mode_set(pcc, fan_mode);
+		if (status)
+			return status;
+
+		return pcc_tdp_mode_set(pcc, tdp_mode);
+	case PCC_TDP_MODE_LOCKED:
+		status = pcc_tdp_mode_set(pcc, tdp_mode);
+		if (status)
+			return status;
+
+		return pcc_fan_mode_set(pcc, fan_mode);
+	default:
+		return -EINVAL;
+	}
+}
+
+static int pcc_platform_profile_set(struct device *dev, enum platform_profile_option profile)
+{
+	struct pcc_acpi *pcc = dev_get_drvdata(dev);
+	struct pcc_platform_profile pcc_profile;
+
+	pcc_profile = pcc->quirks->platform_profiles[profile];
+	if (pcc_profile.fan_mode && pcc_profile.tdp_mode)
+		return pcc_platform_profile_set_profile(pcc,
+							pcc_profile.fan_mode,
+							pcc_profile.tdp_mode);
+
+	return -EINVAL;
+}
+
+static int pcc_platform_profile_probe(void *drvdata, unsigned long *choices)
+{
+	struct pcc_acpi *pcc = drvdata;
+
+	for (enum platform_profile_option pp_opt = 0;
+	     pp_opt < PLATFORM_PROFILE_LAST;
+	     pp_opt++) {
+		enum pcc_fan_mode fan_mode =
+			pcc->quirks->platform_profiles[pp_opt].fan_mode;
+		enum pcc_tdp_mode tdp_mode =
+			pcc->quirks->platform_profiles[pp_opt].tdp_mode;
+
+		if (fan_mode && tdp_mode) {
+			set_bit(pp_opt, choices);
+		} else if (fan_mode || tdp_mode) {
+			pr_err("error probing platform profiles: malformed quirk\n");
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static const struct platform_profile_ops pcc_platform_profile_ops = {
+	.probe = pcc_platform_profile_probe,
+	.profile_get = pcc_platform_profile_get,
+	.profile_set = pcc_platform_profile_set,
+};
+
 /* kernel module interface */
 
 #ifdef CONFIG_PM_SLEEP
@@ -979,8 +1317,37 @@ static int acpi_pcc_hotkey_resume(struct device *dev)
 }
 #endif
 
+static int acpi_pcc_platform_profile_probe(struct pcc_acpi *pcc, struct platform_device *pdev)
+{
+	struct acpi_device *adev __free(acpi_dev_put) =
+		acpi_dev_get_first_match_dev("PNP0C09", NULL, -1);
+	int err;
+
+	if (!adev) {
+		pr_err("failed to find embedded controller path\n");
+		return -ENODEV;
+	}
+
+	pcc->ec_handle = acpi_device_handle(adev);
+
+	pcc->platform_profile_dev =
+		devm_platform_profile_register(&pdev->dev,
+					       "panasonic-laptop",
+					       pcc,
+					       &pcc_platform_profile_ops);
+	if (IS_ERR(pcc->platform_profile_dev)) {
+		err = PTR_ERR(pcc->platform_profile_dev);
+		pcc->platform_profile_dev = NULL;
+		return dev_err_probe(&pdev->dev, err,
+				     "failed to register platform profiles\n");
+	}
+
+	return 0;
+}
+
 static int acpi_pcc_hotkey_probe(struct platform_device *pdev)
 {
+	const struct dmi_system_id *dmi_id;
 	struct backlight_properties props;
 	struct acpi_device *device;
 	struct pcc_acpi *pcc;
@@ -1020,6 +1387,12 @@ static int acpi_pcc_hotkey_probe(struct platform_device *pdev)
 	strscpy(acpi_device_name(device), ACPI_PCC_DEVICE_NAME);
 	strscpy(acpi_device_class(device), ACPI_PCC_CLASS);
 
+	dmi_id = dmi_first_match(pcc_quirks);
+	if (dmi_id) {
+		pcc->quirks = dmi_id->driver_data;
+		pr_debug("quirk detect: enabled quirks for %s\n", dmi_id->ident);
+	}
+
 	result = acpi_pcc_init_input(pcc);
 	if (result) {
 		pr_err("Error installing keyinput handler\n");
@@ -1091,6 +1464,13 @@ static int acpi_pcc_hotkey_probe(struct platform_device *pdev)
 	}
 
 	i8042_install_filter(panasonic_i8042_filter, NULL);
+
+	if (pcc->quirks && pcc->quirks->use_platform_profiles) {
+		result = acpi_pcc_platform_profile_probe(pcc, pdev);
+		if (result)
+			pr_warn("error occurred setting up platform profiles\n");
+	}
+
 	return 0;
 
 out_platform:
-- 
2.55.0


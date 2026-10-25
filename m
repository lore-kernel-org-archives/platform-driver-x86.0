Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792955618;
	b=fj8qlLD2Drto+cpGxKggdmJ4hzrISiNZN3Md5a+vLzWDsBPUDmXf8EbCV8gCvDU4FXHh
	 CK2PTgNvYOheSu9ci1be/5y0uRrD/2d4E2BmO20398W5LyLRGXGVDeQu3iCCLXIda3a0k
	 8gtX4eZtJQCney4LJNTv5hHqJjwXfFwgZ4WeCuI3WFEChDtZleHAVzLEtAD4aAzDadGUW
	 Z985pJZE6wZP/dqVPvkV3PLxNjPD2wPAi19W/seCgCEOMsnH2sOEuM6jIzJ3cnibRxu9e
	 nGWgeZAj1eDDqFo0IZm5rFJeCMESxzR2afg9UGGocuEV1CfSrTVB2VBicXgpXltK/sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792955618;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=eCOktqHAkQJBFEmTS3UZFjwTg44wxsH+6JjCI7IFTe0=;
	b=Bs9e8gIQuXg8pKUm8sBs9FcyXD9ZWW2eCigJ6uqDr3snZ016VI6mv1sctgxFM9fiq1lA
	 5XH5RTaUM8O830JOgrmSwM7tBLYzuasAsjabfCXw4niUbhY5aUuO9n7aTE1XzwGG0BI6x
	 oHsNtYYOuDBaxJQ6H8IybZ0EDuw8zs4S4zxdOIYmqPJ++AREhaV1863r4sV7zuW0yD3XR
	 U67Hb/pdPj2R5EHuPq8BlZy95GlXOZn/MVEtezFZdVNSZQQ2H0SDsMMOdECRLLMYeelvF
	 EOlSpTFNkNiL0xiIOFY0G3AMYiBQZxzqNbBXXz2r9rC3HzCbKd14Vc5RACunLMIHMbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="E0JK/bjf";
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D390606A31A
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 19:13:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D390606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E0JK/bjf
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e98798cbddso8340615ad.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 12:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792955617; x=1793560417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eCOktqHAkQJBFEmTS3UZFjwTg44wxsH+6JjCI7IFTe0=;
        b=E0JK/bjfLiO0j1FA/dPL0JyF6tH29GrV8q3C1yGTmTXOpanzNnFSXU1wQWHzvQHK4Q
         XLK3wlN3StJABYn3Pr0d1fkb2UxAcO7gfH5zpc5bKjT5nR9JK/e0Krubps2lbVgwsaY8
         nwY0RZJLhbvTEa5BNIVR7DguouYLPixWNo37VLyeKkrIX0b8WRVquUw+bqZTx7j/jfqG
         QdQ/iBb+KDqat28fIm5Z2WmIrYFNwEVjBhJp3TBGlJHjNAohiWFiPZjg6GPS1QkKted2
         NeU9IsM0zgBiX4YwIyeQjR2vsryF/d/tvSQruU1TzcGnS7x5j6665uVWk9wYUYgnZNtj
         Ajmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792955617; x=1793560417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eCOktqHAkQJBFEmTS3UZFjwTg44wxsH+6JjCI7IFTe0=;
        b=C+sHnfcjjbRiSfDWcuZwLWsUaQXwgbQHKpCDjb2y1ZtaOK4xa0RnOrT/X+CP7E0uVs
         Dvraejd0b9bQcVDF6T4dq0FtBd73czdzGafDR9wUlbivuJfGAykzdpncTncKCgU8Nx2n
         Q5PPDH2jIzViRhUaKEKi6k2Rq2bMA+TezCq2stSQC8RuhRsWi5uVUdo1+gbFdufS/6Nr
         tZpvzCpVrA/zfwm4xCaiRUBJYsgIbSUBmh5qJBCMaMzKckR/SFyrJt/e7FUgCOWBnrBd
         BJKAMFtVsJP0n7jdPtjIroWndLOVO0ZllEYzZIGDUWSWBfXYwu3U/5tahsFKUkn54YX+
         ZxXA==
X-Gm-Message-State: AFq9FYIDVpdGJYAA1MturoVkLnR1UbUFi0vGcVaYI0FIMIKiJXfw5J4y
	IBWzAjzlUElN0KSuBAhCuW8jH9c+yXsFsTbrnRr4lJCOrxlNnuNIozRKCueaIFe77XE=
X-Gm-Gg: AYBFou2WUlNnpj+SAq45w5Te9gQMPVIoUaJf6bxiWYgixtY9XmsAWYKlzephRh1PSKu
	gsUR3CffEg1dxf74NfOsSRDo0YqHeN8iAl9/S5P2T+8CzbBf+oBCo9yVGgeEH3oyh/XsPSZ95Fr
	3H2GB1Osvu9bpHyQUlKGU9BKw5EvBHBphz5c+Y0eplnmjWDIvPVcs7gaekbfXjS0rweVOvqNeLy
	ablOk506OW/LdHd5XkfwcU2a7nnDQ6RQHoEFpIoikQmhlt+BZ2MHMt+wKpKd3muHZZDJbgiye2O
	YFtMzfaNTw+DgxpVuhKaFDFzibmdXfv3ANG3LKB8Z7XnfjmPUw7xCBlMvJJVGz1xTlubET0AZ5f
	p4ve0ppXYWswDthAKXLtV3wZDI83ugo3p5GUd34s3TggSShuoUPCg6L4TTYGIz9WBUcM+VopUkb
	1K6tFfj3QlY1ORETUVH48Uw2InXDDwGTRXFgD0wppqVd9KyQ64Jq7KvGL6a4YN/rTGHEh3mJaxQ
	uWKFyNjGMZk5sOSPsGC3HC6RNN+5nNORQFi/fLuzjJmffhFACKivG9oUDsk6AGFBX6W4lYz6fWN
	WhgE6W818+3z
X-Received: by 2002:a17:902:ea12:b0:2e5:dce7:5c43 with SMTP id d9443c01a7336-2ea9c0d4b74mr38071025ad.6.1792955616749;
        Sun, 25 Oct 2026 12:13:36 -0700 (PDT)
Received: from localhost ([112.204.100.142])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2ea9b1f2637sm9180035ad.70.2026.10.25.12.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 12:13:35 -0700 (PDT)
From: Alex Yeo <alexyeo362@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: alexyeo362@gmail.com,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Kenneth Chan <kenneth.t.chan@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v4] platform/x86: panasonic-laptop: Add platform_profile support
Date: Mon, 26 Oct 2026 03:12:59 +0800
Message-ID: <20261025191300.1259541-1-alexyeo362@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
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

 - Introduce as separate platform_driver
 - Used DEFINE for driver and platform_profile device name
 - DMI quirks restrict support to tested models
 - When raising TDP, fan mode is switched first
 - When limiting TDP, TDP limit is applied first
 - ACPI handle for the EC device was used as the EC path varies
   slightly between models.
 - This device is optional: keep hotkey and everything already
   loaded if profile driver fails for any reason.
 - Common fan/power settings are shared by a quirk_default struct to
   avoid duplication of similar structs.

Signed-off-by: Alex Yeo <alexyeo362@gmail.com>
---
v4:
 - Consolidated separate quirk structs for the RZ6, QV9 and SV8 into a
   quirk_default struct.

v3: https://lore.kernel.org/platform-driver-x86/20261007190446.38862-1-alexyeo362@gmail.com/
 - Removed sysfs.h import
 - Refactored platform profile probe function to use a different pattern
   (check warn_on, continue on double unset, then set)

v2: https://lore.kernel.org/platform-driver-x86/20261006085021.853827-1-alexyeo362@gmail.com/
 - Refactored code to use its own platform_driver
 - Removed DEFINE_FREE and its corresponding __free as its addition
   in this module is inappropriate
 - Removed pr_fmt line as its addition to this patch is inappropriate
 - Added DMI check during __init to prevent attempt of platform profile
   device loading on unsupported hardware
 - Fixed use of enums as truth values by adding explicit comparisons
 - Added *profile_pdev to keep track of new platform_driver
 - Removed extra spaces in the quirk definitions
 - Added helper function for calling EC methods for simplicity
 - Use ARRAY_SIZE() for for loops and added include for array_size.h
 - Refactored pcc_profile to be a pointer in platform profile set
   function
 - Use WARN_ON() when a malformed quirk is detected in the platform
   profile probe function
 - Avoid use of status as variable name if not acpi_status
 - Added Kconfig line for ACPI_PLATFORM_PROFILE
 - Removed bool .use_platform_profiles from the quirks struct as it is
   no longer needed as a result of the platform_driver being separate.
 - Moved DMI quirk matching in probe function before devm_kzalloc of
   driver struct

v1: https://lore.kernel.org/platform-driver-x86/20260805180544.1134916-1-alexyeo362@gmail.com/

This RFC patch adds support for mapping firmware thermal and CPU power
operating policy to platform_profile for Panasonic Let's Note laptops.
This originally started as a hwmon and thermal patch, but further
analysis had revealed that these are firmware power and thermal
policies as opposed to fan control.

Panasonic firmware exposes firmware operating policy through two
methods:
 - Fan cooling policy (active/passive)
 - Processor TDP limit (capped/uncapped)

At boot, firmware defaults to an active cooling policy with the
CPU TDP capped. Vendor drivers / DPTF normally unlocks this on
Windows.

These 2 methods map to 4 possible distinct states. Only states that
correspond to the platform_profile ABI are mapped and exposed as
choices. Unmapped states will be returned as "custom" by the driver.

I have tested the following models:
 - CF-RZ6 (2016)
 - CF-SV8 (2019)
 - CF-QV9 (2020)
 - CF-SR4 (2024)

State to platform_profile mapping:

 Profile                         | Fan Mode  | TDP
+--------------------------------+-----------+------------+
 PLATFORM_PROFILE_COOL (SR4 only)| Active    | Locked
 PLATFORM_PROFILE_BALANCED       | Active    | Locked
 PLATFORM_PROFILE_QUIET          | Passive   | Locked
 PLATFORM_PROFILE_PERFORMANCE    | Active    | Unlocked
 CUSTOM (unmapped on all)        | Passive   | Unlocked

Across all of them, the fan and TDP modes are toggled by the same ACPI
methods. However, there is a slight variation in its interpretation based
on testing results.

These methods are normally called by the DPTF/IPF _OSC handshake.
Depending on the capability bits, the firmware will alter its thermal
and power policy.

\_SB.IETM Implementation A:
 - CF-RZ6 (2016)
 - CF-SV8 (2019)

\_SB.IETM Implementation B:
 - CF-QV9 (2020)
 - CF-SR4 (2024)

Models belonging to the same group share what appears to be identical
AML code for the _OSC.

This patch only exposes the ability to read and set these firmware
toggles. The get() callback queries current firmware state and returns
the mapped platform_profile. The set() callback sets the target state
regardless of current state.

Proposed mappings in this patch are defined in the quirks struct.
Activation of platform_profile is gated by DMI checks.

For every model except the SR4, only balanced and performance profiles
are defined. This is because the aggressive fan paired with the locked
TDP on the SR4 more appropriately correspond to the cool profile.

Test results for the proposed mappings are below.

Test results:
================
(CPU PkgWatt: peak / sustained)
(Sysbench CPU: all available threads)

CF-RZ6: (i5-7Y57, Startup default: Balanced)

 Platform Profile |  CPU PkgWatt    |  Sysbench CPU  | Stress Temp (CPU)
+-----------------+-----------------+----------------+-------------------+
 BALANCED         |  10.0W / 9.0W   |    19712       |   57C
 PERFORMANCE      |  18.9W / 14.9W  |    29132       |   72C

CF-SV8: (i5-8365U, Startup default: Balanced)

 Platform Profile |  CPU PkgWatt     |  Sysbench CPU  | Stress Temp (CPU)
+-----------------+------------------+----------------+-------------------+
 BALANCED         |  9.9W  / 9.9W    |    44695       |   58C
 PERFORMANCE      |  29.0W / 19.9W   |    71747       |   81C

CF-QV9: (i5-10310U, Startup default: Balanced)

 Platform Profile |  CPU PkgWatt     |  Sysbench CPU  | Stress Temp (CPU)
+-----------------+------------------+----------------+-------------------+
 BALANCED         |  10.0W / 9.9W    |    46545       |   59C
 PERFORMANCE      |  18.9W / 14.9W   |    57416       |   70C

CF-SR4: (i5-1345U, Startup default: Cool)

 Platform Profile |  CPU PkgWatt     |  Sysbench CPU  | Stress Temp (CPU)
+-----------------+------------------+----------------+-------------------+
 COOL             |  12.0W / 12.0W   |    177139      |   66C
 QUIET            |  12.0W / 12.0W   |    176315      |   73C-75C
 PERFORMANCE      |  29.6W / 21.3W   |    247602      |   98C-100C

CF-SR4 Notes:
 - QUIET: downclock/throttle at 75C, no increase in package_throttle_count
 - PERFORMANCE: stable boost clock, package_throttle_count increase


Other notes:
===============

Additional notes about thermald:
During testing, I have observed that running thermald for the first time
since boot will trigger an _OSC negotiation that will unlock CPU TDP for
new models (IETM Implementation B). Once thermald is running, exits or
runs again, these bits were not observed to change again during testing.

Running thermald on older models (IETM Implementation A) does not touch
the fan curve or TDP mode setting.

Suspend: observed to not alter the values set prior to suspend

 drivers/platform/x86/Kconfig            |   1 +
 drivers/platform/x86/panasonic-laptop.c | 373 +++++++++++++++++++++++-
 2 files changed, 373 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 957034f39e4e..571c09152310 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -820,6 +820,7 @@ config PANASONIC_LAPTOP
 	depends on ACPI_VIDEO=n || ACPI_VIDEO
 	depends on SERIO_I8042 || SERIO_I8042 = n
 	select INPUT_SPARSEKMAP
+	select ACPI_PLATFORM_PROFILE
 	help
 	  This driver adds support for access to backlight control and hotkeys
 	  on Panasonic Let's Note laptops.
diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
index 19d194ff37ca..e929d2527fb9 100644
--- a/drivers/platform/x86/panasonic-laptop.c
+++ b/drivers/platform/x86/panasonic-laptop.c
@@ -120,9 +120,13 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/array_size.h>
 #include <linux/backlight.h>
 #include <linux/bits.h>
 #include <linux/ctype.h>
+#include <linux/dmi.h>
+#include <linux/err.h>
+#include <linux/errno.h>
 #include <linux/i8042.h>
 #include <linux/init.h>
 #include <linux/input.h>
@@ -130,6 +134,8 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/platform_profile.h>
+#include <linux/printk.h>
 #include <linux/seq_file.h>
 #include <linux/serio.h>
 #include <linux/slab.h>
@@ -158,10 +164,37 @@ MODULE_LICENSE("GPL");
 #define ECO_MODE_OFF		0x00
 #define ECO_MODE_ON		0x80
 
+#define PCC_ACPI_FAN_ACTIVE_MODE	0x00
+#define PCC_ACPI_FAN_PASSIVE_MODE	0x01
+#define PCC_ACPI_TDP_LIMIT_ON		0x01
+#define PCC_ACPI_TDP_LIMIT_OFF		0x00
+
 #define ACPI_PCC_DRIVER_NAME	"Panasonic Laptop Support"
+#define PROFILE_PCC_DRIVER_NAME	"panasonic-platform-profile"
 
 #define ACPI_PCC_INPUT_PHYS	"panasonic/hkey0"
 
+enum pcc_profile_fan_mode {
+	PCC_FAN_MODE_UNSET = 0,
+	PCC_FAN_MODE_ACTIVE,
+	PCC_FAN_MODE_PASSIVE,
+};
+
+enum pcc_profile_tdp_mode {
+	PCC_TDP_MODE_UNSET = 0,
+	PCC_TDP_MODE_LOCKED,
+	PCC_TDP_MODE_UNLOCKED,
+};
+
+struct pcc_platform_profile {
+	enum pcc_profile_fan_mode fan_mode;
+	enum pcc_profile_tdp_mode tdp_mode;
+};
+
+struct pcc_profile_quirk {
+	struct pcc_platform_profile platform_profiles[PLATFORM_PROFILE_LAST];
+};
+
 /* LCD_TYPEs: 0 = Normal, 1 = Semi-transparent
    ECO_MODEs: 0x03 = off, 0x83 = on
 */
@@ -251,6 +284,78 @@ struct pcc_acpi {
 	u32			sinf[] __counted_by(num_sifr);
 };
 
+struct pcc_profile {
+	acpi_handle			ec_handle;
+	const struct pcc_profile_quirk	*quirks;
+	struct device			*platform_profile_dev;
+};
+
+static struct pcc_profile_quirk quirk_default = {
+	.platform_profiles = {
+		[PLATFORM_PROFILE_BALANCED] = {
+			.fan_mode = PCC_FAN_MODE_ACTIVE,
+			.tdp_mode = PCC_TDP_MODE_LOCKED,
+		},
+		[PLATFORM_PROFILE_PERFORMANCE] = {
+			.fan_mode = PCC_FAN_MODE_ACTIVE,
+			.tdp_mode = PCC_TDP_MODE_UNLOCKED,
+		},
+	},
+};
+
+static struct pcc_profile_quirk quirk_cf_sr4 = {
+	.platform_profiles = {
+		[PLATFORM_PROFILE_QUIET] = {
+			.fan_mode = PCC_FAN_MODE_PASSIVE,
+			.tdp_mode = PCC_TDP_MODE_LOCKED,
+		},
+		[PLATFORM_PROFILE_COOL] = {
+			.fan_mode = PCC_FAN_MODE_ACTIVE,
+			.tdp_mode = PCC_TDP_MODE_LOCKED,
+		},
+		[PLATFORM_PROFILE_PERFORMANCE] = {
+			.fan_mode = PCC_FAN_MODE_ACTIVE,
+			.tdp_mode = PCC_TDP_MODE_UNLOCKED,
+		},
+	},
+};
+
+static const struct dmi_system_id pcc_profile_quirks[] = {
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
+		.driver_data = &quirk_default,
+	},
+	{
+		.ident = "Panasonic Corporation CFSV8-2",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Panasonic Corporation"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "CFSV8-2"),
+		},
+		.driver_data = &quirk_default,
+	},
+	{
+		.ident = "Panasonic Corporation CFRZ6-2",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Panasonic Corporation"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "CFRZ6-2"),
+		},
+		.driver_data = &quirk_default,
+	},
+	{},
+};
+
 /*
  * On some Panasonic models the volume up / down / mute keys send duplicate
  * keypress events over the PS/2 kbd interface, filter these out.
@@ -1143,4 +1248,270 @@ static void acpi_pcc_hotkey_remove(struct platform_device *pdev)
 	kfree(pcc);
 }
 
-module_platform_driver(acpi_pcc_driver);
+static int pcc_profile_fan_mode_get(struct pcc_profile *pcc, enum pcc_profile_fan_mode *fan_mode)
+{
+	unsigned long long state;
+	acpi_status status;
+
+	status = acpi_evaluate_integer(pcc->ec_handle, "CEFM", NULL, &state);
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
+static int pcc_profile_tdp_mode_get(struct pcc_profile *pcc, enum pcc_profile_tdp_mode *tdp_mode)
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
+static int pcc_profile_ec_execute(struct pcc_profile *pcc, char *method, u64 arg)
+{
+	acpi_status status;
+
+	status = acpi_execute_simple_method(pcc->ec_handle, method, arg);
+	if (ACPI_FAILURE(status)) {
+		pr_err("failed to execute EC method %s\n", method);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int pcc_profile_fan_mode_set(struct pcc_profile *pcc, enum pcc_profile_fan_mode fan_mode)
+{
+	switch (fan_mode) {
+	case PCC_FAN_MODE_ACTIVE:
+		return pcc_profile_ec_execute(pcc, "SEFM", PCC_ACPI_FAN_ACTIVE_MODE);
+	case PCC_FAN_MODE_PASSIVE:
+		return pcc_profile_ec_execute(pcc, "SEFM", PCC_ACPI_FAN_PASSIVE_MODE);
+	default:
+		return -EINVAL;
+	}
+}
+
+static int pcc_profile_tdp_mode_set(struct pcc_profile *pcc, enum pcc_profile_tdp_mode tdp_mode)
+{
+	switch (tdp_mode) {
+	case PCC_TDP_MODE_LOCKED:
+		return pcc_profile_ec_execute(pcc, "SEPL", PCC_ACPI_TDP_LIMIT_ON);
+	case PCC_TDP_MODE_UNLOCKED:
+		return pcc_profile_ec_execute(pcc, "SEPL", PCC_ACPI_TDP_LIMIT_OFF);
+	default:
+		return -EINVAL;
+	}
+}
+
+static int pcc_profile_platform_profile_get(struct device *dev,
+					    enum platform_profile_option *profile)
+{
+	struct pcc_profile *pcc = dev_get_drvdata(dev);
+	enum platform_profile_option pp_opt;
+	enum pcc_profile_fan_mode fan_mode;
+	enum pcc_profile_tdp_mode tdp_mode;
+	int err;
+
+	err = pcc_profile_fan_mode_get(pcc, &fan_mode);
+	if (err)
+		return err;
+
+	err = pcc_profile_tdp_mode_get(pcc, &tdp_mode);
+	if (err)
+		return err;
+
+	for (pp_opt = 0; pp_opt < ARRAY_SIZE(pcc->quirks->platform_profiles); pp_opt++) {
+		const struct pcc_platform_profile *pcc_profile =
+			&pcc->quirks->platform_profiles[pp_opt];
+
+		if (tdp_mode == pcc_profile->tdp_mode &&
+		    fan_mode == pcc_profile->fan_mode) {
+			*profile = pp_opt;
+			return 0;
+		}
+	}
+
+	*profile = PLATFORM_PROFILE_CUSTOM;
+	return 0;
+}
+
+static int pcc_profile_platform_profile_set_profile(struct pcc_profile *pcc,
+						    enum pcc_profile_fan_mode fan_mode,
+						    enum pcc_profile_tdp_mode tdp_mode)
+{
+	int err;
+
+	switch (tdp_mode) {
+	case PCC_TDP_MODE_UNLOCKED:
+		err = pcc_profile_fan_mode_set(pcc, fan_mode);
+		if (err)
+			return err;
+
+		return pcc_profile_tdp_mode_set(pcc, tdp_mode);
+	case PCC_TDP_MODE_LOCKED:
+		err = pcc_profile_tdp_mode_set(pcc, tdp_mode);
+		if (err)
+			return err;
+
+		return pcc_profile_fan_mode_set(pcc, fan_mode);
+	default:
+		return -EINVAL;
+	}
+}
+
+static int pcc_profile_platform_profile_set(struct device *dev,
+					    enum platform_profile_option profile)
+{
+	struct pcc_profile *pcc = dev_get_drvdata(dev);
+	const struct pcc_platform_profile *pcc_profile = &pcc->quirks->platform_profiles[profile];
+
+	return pcc_profile_platform_profile_set_profile(pcc,
+						pcc_profile->fan_mode,
+						pcc_profile->tdp_mode);
+}
+
+static int pcc_profile_platform_profile_probe(void *drvdata, unsigned long *choices)
+{
+	enum platform_profile_option pp_opt;
+	struct pcc_profile *pcc = drvdata;
+
+	for (pp_opt = 0; pp_opt < ARRAY_SIZE(pcc->quirks->platform_profiles); pp_opt++) {
+		const struct pcc_platform_profile *profile =
+			&pcc->quirks->platform_profiles[pp_opt];
+
+		/* Both TDP and fan mode should be set */
+		if (WARN_ON((profile->fan_mode != PCC_FAN_MODE_UNSET) !=
+			    (profile->tdp_mode != PCC_TDP_MODE_UNSET)))
+			return -EINVAL;
+
+		if (profile->fan_mode == PCC_FAN_MODE_UNSET &&
+		    profile->tdp_mode == PCC_TDP_MODE_UNSET)
+			continue;
+
+		set_bit(pp_opt, choices);
+	}
+
+	return 0;
+}
+
+static const struct platform_profile_ops pcc_platform_profile_ops = {
+	.probe = pcc_profile_platform_profile_probe,
+	.profile_get = pcc_profile_platform_profile_get,
+	.profile_set = pcc_profile_platform_profile_set,
+};
+
+static int pcc_profile_driver_probe(struct platform_device *pdev)
+{
+	const struct dmi_system_id *dmi_id;
+	struct acpi_device *ec_adev;
+	struct pcc_profile *pcc;
+
+	dmi_id = dmi_first_match(pcc_profile_quirks);
+	if (!dmi_id)
+		return -ENODEV;
+
+	pcc = devm_kzalloc(&pdev->dev, sizeof(*pcc), GFP_KERNEL);
+	if (!pcc)
+		return -ENOMEM;
+
+	ec_adev = acpi_dev_get_first_match_dev("PNP0C09", NULL, -1);
+	if (!ec_adev)
+		return -ENODEV;
+
+	pcc->ec_handle = ec_adev->handle;
+	acpi_dev_put(ec_adev);
+
+	pcc->quirks = dmi_id->driver_data;
+
+	pcc->platform_profile_dev =
+		devm_platform_profile_register(&pdev->dev,
+					       PROFILE_PCC_DRIVER_NAME,
+					       pcc,
+					       &pcc_platform_profile_ops);
+	if (IS_ERR(pcc->platform_profile_dev)) {
+		return dev_err_probe(&pdev->dev,
+				     PTR_ERR(pcc->platform_profile_dev),
+				     "failed to register platform profiles\n");
+	}
+
+	return 0;
+}
+
+static struct platform_driver profile_pcc_driver = {
+	.probe = pcc_profile_driver_probe,
+	.driver = {
+		.name = PROFILE_PCC_DRIVER_NAME,
+	},
+};
+
+static struct platform_device *profile_pdev;
+
+static int __init panasonic_module_init(void)
+{
+	int err;
+
+	err = platform_driver_register(&acpi_pcc_driver);
+	if (err)
+		return err;
+
+	if (!dmi_check_system(pcc_profile_quirks))
+		return 0;
+
+	err = platform_driver_register(&profile_pcc_driver);
+	if (err) {
+		pr_warn("failed to register profile driver: %d\n", err);
+		return 0;
+	}
+
+	profile_pdev = platform_device_register_simple(PROFILE_PCC_DRIVER_NAME,
+						       PLATFORM_DEVID_NONE,
+						       NULL, 0);
+	if (IS_ERR(profile_pdev)) {
+		err = PTR_ERR(profile_pdev);
+		pr_warn("failed to register profile device: %d\n", err);
+
+		profile_pdev = NULL;
+		platform_driver_unregister(&profile_pcc_driver);
+		return 0;
+	}
+
+	return 0;
+}
+
+static void __exit panasonic_module_exit(void)
+{
+	if (profile_pdev) {
+		platform_device_unregister(profile_pdev);
+		platform_driver_unregister(&profile_pcc_driver);
+	}
+
+	platform_driver_unregister(&acpi_pcc_driver);
+}
+
+module_init(panasonic_module_init);
+module_exit(panasonic_module_exit);
-- 
2.55.0


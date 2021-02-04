Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58D40C433DB
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Feb 2021 20:41:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 133B164F48
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Feb 2021 20:41:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbhBDUlh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 4 Feb 2021 15:41:37 -0500
Received: from mail-40133.protonmail.ch ([185.70.40.133]:50276 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbhBDUkt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Feb 2021 15:40:49 -0500
Date:   Thu, 04 Feb 2021 20:40:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1612471204;
        bh=BxS3as75xXnioCISJT2J2o20wWm8qoV3qCQ/fC1Aydg=;
        h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
        b=nr58ULUCfat3VQWUQDcCGr61HGfME6+POxrNa/K2uGd3wUm7u9wLTaUBCZ5ik9xqS
         tklfpbSJulGZvRVz56VSiOlOsS7b0B5XS6EjLlYMD3bCPWTwcxqw+oXccce0ljggbx
         bLZpOGM5rmlnRWOEw3RNXp6Lh8SVjKXGglQiYKw8=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Mark Pearson <markpearson@lenovo.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [RFC PATCH 2/2] platform/x86: thinkpad_acpi/ideapad-laptop: extract common DYTC constants/functions
Message-ID: <20210204203933.559752-3-pobrn@protonmail.com>
In-Reply-To: <20210204203933.559752-1-pobrn@protonmail.com>
References: <20210204203933.559752-1-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Extract common DYTC constants/functions into a dedicated header file
to avoid code duplication. Rename DYTC_MODE_BALANCE to DYTC_MODE_BALANCED
and DYTC_MODE_PERFORM to DYTC_MODE_PERFORMANCE to be consistent
with the platform_profile_option enum.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>

 create mode 100644 drivers/platform/x86/lenovo/dytc.h

diff --git a/drivers/platform/x86/lenovo/dytc.h b/drivers/platform/x86/leno=
vo/dytc.h
new file mode 100644
index 000000000000..9ec341bdef70
--- /dev/null
+++ b/drivers/platform/x86/lenovo/dytc.h
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+#ifndef _LENOVO_DYTC_H_
+#define _LENOVO_DYTC_H_
+
+#include <linux/platform_profile.h>
+
+#define DYTC_CMD_QUERY         0 /* To get DYTC status - enable/revision *=
/
+#define DYTC_CMD_SET           1 /* To enable/disable IC function mode */
+#define DYTC_CMD_GET           2 /* To get current IC function and mode */
+#define DYTC_CMD_RESET       511 /* To reset back to default */
+
+#define DYTC_QUERY_ENABLE_BIT  8 /* Bit        8 - 0 =3D disabled, 1 =3D e=
nabled */
+#define DYTC_QUERY_SUBREV_BIT 16 /* Bits 16 - 27 - sub revision */
+#define DYTC_QUERY_REV_BIT    28 /* Bits 28 - 31 - revision */
+
+#define DYTC_GET_FUNCTION_BIT  8 /* Bits  8 - 11 - function setting */
+#define DYTC_GET_MODE_BIT     12 /* Bits 12 - 15 - mode setting */
+#define DYTC_GET_LAPMODE_BIT  17 /* Bit       17 - set when in lapmode */
+
+#define DYTC_SET_FUNCTION_BIT 12 /* Bits 12 - 15 - function setting */
+#define DYTC_SET_MODE_BIT     16 /* Bits 16 - 19 - mode setting */
+#define DYTC_SET_VALID_BIT    20 /* Bit       20 - 1 =3D on, 0 =3D off */
+
+#define DYTC_FUNCTION_STD      0 /* Function =3D  0, standard mode */
+#define DYTC_FUNCTION_CQL      1 /* Function =3D  1, lap mode */
+#define DYTC_FUNCTION_MMC     11 /* Function =3D 11, desk mode */
+
+#define DYTC_MODE_PERFORMANCE  2 /* High power mode aka performance */
+#define DYTC_MODE_LOW_POWER    3 /* Low power mode aka quiet */
+#define DYTC_MODE_BALANCED    15 /* Default mode aka balanced */
+
+#define DYTC_SET_COMMAND(function, mode, on) \
+=09(DYTC_CMD_SET | (function) << DYTC_SET_FUNCTION_BIT | \
+=09 (mode) << DYTC_SET_MODE_BIT | \
+=09 (on) << DYTC_SET_VALID_BIT)
+
+#define DYTC_DISABLE_CQL DYTC_SET_COMMAND(DYTC_FUNCTION_CQL, DYTC_MODE_BAL=
ANCED, 0)
+
+#define DYTC_ENABLE_CQL DYTC_SET_COMMAND(DYTC_FUNCTION_CQL, DYTC_MODE_BALA=
NCED, 1)
+
+static int inline convert_dytc_to_profile(int dytcmode, enum platform_prof=
ile_option *profile)
+{
+=09switch (dytcmode) {
+=09case DYTC_MODE_LOW_POWER:
+=09=09*profile =3D PLATFORM_PROFILE_LOW_POWER;
+=09=09break;
+=09case DYTC_MODE_BALANCED:
+=09=09*profile =3D  PLATFORM_PROFILE_BALANCED;
+=09=09break;
+=09case DYTC_MODE_PERFORMANCE:
+=09=09*profile =3D  PLATFORM_PROFILE_PERFORMANCE;
+=09=09break;
+=09default: /* Unknown mode */
+=09=09return -EINVAL;
+=09}
+
+=09return 0;
+}
+
+static inline int convert_profile_to_dytc(enum platform_profile_option pro=
file, int *dytcmode)
+{
+=09switch (profile) {
+=09case PLATFORM_PROFILE_LOW_POWER:
+=09=09*dytcmode =3D DYTC_MODE_LOW_POWER;
+=09=09break;
+=09case PLATFORM_PROFILE_BALANCED:
+=09=09*dytcmode =3D DYTC_MODE_BALANCED;
+=09=09break;
+=09case PLATFORM_PROFILE_PERFORMANCE:
+=09=09*dytcmode =3D DYTC_MODE_PERFORMANCE;
+=09=09break;
+=09default: /* Unknown profile */
+=09=09return -EOPNOTSUPP;
+=09}
+
+=09return 0;
+}
+
+#endif /* _LENOVO_DYTC_H_ */
diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platfor=
m/x86/lenovo/ideapad-laptop.c
index 6cb5ad4be231..387c8c86b8bb 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -35,6 +35,8 @@
=20
 #include <dt-bindings/leds/common.h>
=20
+#include "dytc.h"
+
 #define IDEAPAD_RFKILL_DEV_NUM=093
=20
 #if IS_ENABLED(CONFIG_ACPI_WMI)
@@ -676,76 +678,6 @@ static const struct attribute_group ideapad_attribute_=
group =3D {
 /*
  * DYTC Platform profile
  */
-#define DYTC_CMD_QUERY        0 /* To get DYTC status - enable/revision */
-#define DYTC_CMD_SET          1 /* To enable/disable IC function mode */
-#define DYTC_CMD_GET          2 /* To get current IC function and mode */
-#define DYTC_CMD_RESET    0x1ff /* To reset back to default */
-
-#define DYTC_QUERY_ENABLE_BIT 8  /* Bit        8 - 0 =3D disabled, 1 =3D e=
nabled */
-#define DYTC_QUERY_SUBREV_BIT 16 /* Bits 16 - 27 - sub revision */
-#define DYTC_QUERY_REV_BIT    28 /* Bits 28 - 31 - revision */
-
-#define DYTC_GET_FUNCTION_BIT 8  /* Bits  8-11 - function setting */
-#define DYTC_GET_MODE_BIT     12 /* Bits 12-15 - mode setting */
-
-#define DYTC_SET_FUNCTION_BIT 12 /* Bits 12-15 - function setting */
-#define DYTC_SET_MODE_BIT     16 /* Bits 16-19 - mode setting */
-#define DYTC_SET_VALID_BIT    20 /* Bit     20 - 1 =3D on, 0 =3D off */
-
-#define DYTC_FUNCTION_STD     0  /* Function =3D 0, standard mode */
-#define DYTC_FUNCTION_CQL     1  /* Function =3D 1, lap mode */
-#define DYTC_FUNCTION_MMC     11 /* Function =3D 11, desk mode */
-
-#define DYTC_MODE_PERFORM     2  /* High power mode aka performance */
-#define DYTC_MODE_LOW_POWER       3  /* Low power mode aka quiet */
-#define DYTC_MODE_BALANCE   0xF  /* Default mode aka balanced */
-
-#define DYTC_SET_COMMAND(function, mode, on) \
-=09(DYTC_CMD_SET | (function) << DYTC_SET_FUNCTION_BIT | \
-=09 (mode) << DYTC_SET_MODE_BIT | \
-=09 (on) << DYTC_SET_VALID_BIT)
-
-#define DYTC_DISABLE_CQL DYTC_SET_COMMAND(DYTC_FUNCTION_CQL, DYTC_MODE_BAL=
ANCE, 0)
-
-#define DYTC_ENABLE_CQL DYTC_SET_COMMAND(DYTC_FUNCTION_CQL, DYTC_MODE_BALA=
NCE, 1)
-
-static int convert_dytc_to_profile(int dytcmode, enum platform_profile_opt=
ion *profile)
-{
-=09switch (dytcmode) {
-=09case DYTC_MODE_LOW_POWER:
-=09=09*profile =3D PLATFORM_PROFILE_LOW_POWER;
-=09=09break;
-=09case DYTC_MODE_BALANCE:
-=09=09*profile =3D  PLATFORM_PROFILE_BALANCED;
-=09=09break;
-=09case DYTC_MODE_PERFORM:
-=09=09*profile =3D  PLATFORM_PROFILE_PERFORMANCE;
-=09=09break;
-=09default: /* Unknown mode */
-=09=09return -EINVAL;
-=09}
-
-=09return 0;
-}
-
-static int convert_profile_to_dytc(enum platform_profile_option profile, i=
nt *perfmode)
-{
-=09switch (profile) {
-=09case PLATFORM_PROFILE_LOW_POWER:
-=09=09*perfmode =3D DYTC_MODE_LOW_POWER;
-=09=09break;
-=09case PLATFORM_PROFILE_BALANCED:
-=09=09*perfmode =3D DYTC_MODE_BALANCE;
-=09=09break;
-=09case PLATFORM_PROFILE_PERFORMANCE:
-=09=09*perfmode =3D DYTC_MODE_PERFORM;
-=09=09break;
-=09default: /* Unknown profile */
-=09=09return -EOPNOTSUPP;
-=09}
-
-=09return 0;
-}
=20
 /*
  * dytc_profile_get: Function to register with platform_profile
diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform=
/x86/lenovo/thinkpad_acpi.c
index b881044b31b0..61990fc9870c 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -74,6 +74,8 @@
 #include <acpi/battery.h>
 #include <acpi/video.h>
=20
+#include "dytc.h"
+
 /* ThinkPad CMOS commands */
 #define TP_CMOS_VOLUME_DOWN=090
 #define TP_CMOS_VOLUME_UP=091
@@ -9845,9 +9847,6 @@ static struct ibm_struct lcdshadow_driver_data =3D {
  * Thinkpad sensor interfaces
  */
=20
-#define DYTC_CMD_GET          2 /* To get current IC function and mode */
-#define DYTC_GET_LAPMODE_BIT 17 /* Set when in lapmode */
-
 #define PALMSENSOR_PRESENT_BIT 0 /* Determine if psensor present */
 #define PALMSENSOR_ON_BIT      1 /* psensor status */
=20
@@ -9999,79 +9998,11 @@ static struct ibm_struct proxsensor_driver_data =3D=
 {
  * DYTC Platform Profile interface
  */
=20
-#define DYTC_CMD_QUERY        0 /* To get DYTC status - enable/revision */
-#define DYTC_CMD_SET          1 /* To enable/disable IC function mode */
-#define DYTC_CMD_RESET    0x1ff /* To reset back to default */
-
-#define DYTC_QUERY_ENABLE_BIT 8  /* Bit        8 - 0 =3D disabled, 1 =3D e=
nabled */
-#define DYTC_QUERY_SUBREV_BIT 16 /* Bits 16 - 27 - sub revision */
-#define DYTC_QUERY_REV_BIT    28 /* Bits 28 - 31 - revision */
-
-#define DYTC_GET_FUNCTION_BIT 8  /* Bits  8-11 - function setting */
-#define DYTC_GET_MODE_BIT     12 /* Bits 12-15 - mode setting */
-
-#define DYTC_SET_FUNCTION_BIT 12 /* Bits 12-15 - function setting */
-#define DYTC_SET_MODE_BIT     16 /* Bits 16-19 - mode setting */
-#define DYTC_SET_VALID_BIT    20 /* Bit     20 - 1 =3D on, 0 =3D off */
-
-#define DYTC_FUNCTION_STD     0  /* Function =3D 0, standard mode */
-#define DYTC_FUNCTION_CQL     1  /* Function =3D 1, lap mode */
-#define DYTC_FUNCTION_MMC     11 /* Function =3D 11, desk mode */
-
-#define DYTC_MODE_PERFORM     2  /* High power mode aka performance */
-#define DYTC_MODE_LOWPOWER    3  /* Low power mode */
-#define DYTC_MODE_BALANCE   0xF  /* Default mode aka balanced */
-
-#define DYTC_SET_COMMAND(function, mode, on) \
-=09(DYTC_CMD_SET | (function) << DYTC_SET_FUNCTION_BIT | \
-=09 (mode) << DYTC_SET_MODE_BIT | \
-=09 (on) << DYTC_SET_VALID_BIT)
-
-#define DYTC_DISABLE_CQL DYTC_SET_COMMAND(DYTC_FUNCTION_CQL, DYTC_MODE_BAL=
ANCE, 0)
-
-#define DYTC_ENABLE_CQL DYTC_SET_COMMAND(DYTC_FUNCTION_CQL, DYTC_MODE_BALA=
NCE, 1)
-
 static bool dytc_profile_available;
 static enum platform_profile_option dytc_current_profile;
 static atomic_t dytc_ignore_event =3D ATOMIC_INIT(0);
 static DEFINE_MUTEX(dytc_mutex);
=20
-static int convert_dytc_to_profile(int dytcmode, enum platform_profile_opt=
ion *profile)
-{
-=09switch (dytcmode) {
-=09case DYTC_MODE_LOWPOWER:
-=09=09*profile =3D PLATFORM_PROFILE_LOW_POWER;
-=09=09break;
-=09case DYTC_MODE_BALANCE:
-=09=09*profile =3D  PLATFORM_PROFILE_BALANCED;
-=09=09break;
-=09case DYTC_MODE_PERFORM:
-=09=09*profile =3D  PLATFORM_PROFILE_PERFORMANCE;
-=09=09break;
-=09default: /* Unknown mode */
-=09=09return -EINVAL;
-=09}
-=09return 0;
-}
-
-static int convert_profile_to_dytc(enum platform_profile_option profile, i=
nt *perfmode)
-{
-=09switch (profile) {
-=09case PLATFORM_PROFILE_LOW_POWER:
-=09=09*perfmode =3D DYTC_MODE_LOWPOWER;
-=09=09break;
-=09case PLATFORM_PROFILE_BALANCED:
-=09=09*perfmode =3D DYTC_MODE_BALANCE;
-=09=09break;
-=09case PLATFORM_PROFILE_PERFORMANCE:
-=09=09*perfmode =3D DYTC_MODE_PERFORM;
-=09=09break;
-=09default: /* Unknown profile */
-=09=09return -EOPNOTSUPP;
-=09}
-=09return 0;
-}
-
 /*
  * dytc_profile_get: Function to register with platform_profile
  * handler. Returns current platform profile.
--=20
2.30.0



Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26D33C433DB
	for <platform-driver-x86@archiver.kernel.org>; Fri, 22 Jan 2021 23:32:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D4293239D4
	for <platform-driver-x86@archiver.kernel.org>; Fri, 22 Jan 2021 23:32:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727946AbhAVXc2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 22 Jan 2021 18:32:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728521AbhAVXbb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 22 Jan 2021 18:31:31 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85988C06174A
        for <platform-driver-x86@vger.kernel.org>; Fri, 22 Jan 2021 15:30:50 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id b26so9838359lff.9
        for <platform-driver-x86@vger.kernel.org>; Fri, 22 Jan 2021 15:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usc-edu.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=vfi43vuCIofg3hXwG/xBUlge5e4jrwNdcMlzE2lY65g=;
        b=DM2Dm6xpmqQTaM6VIm2ZpuoFQX2oDOq4ptmlVoPzLHcwfhylxi4r5QMXHj00UMBKMM
         KFEXR1xPUCeTY9HNLYlCTtBFsE+bGCdNhvQX9bYKQsGX/6+WCcDdcDmxkHOU6hU3AuHd
         A/GabYjksu0k6Ypx/gGo9LMkEErZOzS9hmvKZvodyHPUYi+7xdz2b3oWAQZEJabkQGlP
         hL8rWE3EWNEmH2CUPKq/IRNeYtXKUTxR01SfGAMGFcdH/ly5XP9oNgfVsyxuWY/BZTOt
         Ku9iQrxTWcFp6LBjJCpyTSY6o9voUdsXk0H2FOR8Ser6mcJoLJAMqbo1CjsiyPL0aDRC
         +HdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=vfi43vuCIofg3hXwG/xBUlge5e4jrwNdcMlzE2lY65g=;
        b=gxhWQX6ZwMwLfw1QHyNJmgIKGyvM4eeTsEg/VtJLz4AsnirKIj3bfngbbTi2pr07vD
         owXhoHzZSjz4KhGms6jwqFcFhQFDw7rhTbLn6qkXtGfBeyLG35w0YbTCe2U3B3T8rPeo
         6DyPOUWw2rs1B1YHLvgkQlXltEgLIyQH3h28IPLBql6bM+PcgCyA85j64OJ8Xxr2NK9D
         iRscxYuPwJM311sTRCb1YyoGpA/dvfvuJfw3ML0VDhGjd0zSuNV97Zk7wEs+w4pIiAnQ
         QJZRZVji3GjXuuK5GzfiD3msdAd2k0f7oDi15xwQSPdVFf9gm+5C+PI7btsBHktRSXal
         AQ1A==
X-Gm-Message-State: AOAM531TRy3SFS+lVxR1VWXBxRLjDZHxJ3KEB2RPwviuq0/Q1X6tC4de
        DBqvuePzvas5YT7IvtJg5wGY+pOfJV468R8APDAH0w==
X-Google-Smtp-Source: ABdhPJwuxchoLlmbl2rguwnd9mUVSAK+ti7bxk0xgEMBeLda0WBgj4z6yLY4w1vsjzQAseWP4D1EInNhTJLNlNZy6/8=
X-Received: by 2002:ac2:599d:: with SMTP id w29mr646758lfn.607.1611358248951;
 Fri, 22 Jan 2021 15:30:48 -0800 (PST)
MIME-Version: 1.0
From:   Zhen Gong <zhengong@usc.edu>
Date:   Fri, 22 Jan 2021 15:30:37 -0800
Message-ID: <CAJCLVRB26cnFrB9d+XpEcotcdj25j67CC0osiiC9yLZtf8hQOw@mail.gmail.com>
Subject: Re: [PATCH v9] platform/x86: thinkpad_acpi: Add platform profile support
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mark,

Is the DYTC part considered finalized? Current version-based
approach could not determine if MMC function is available
for platform profile. Some 4.2 or even 4.0 models including
Ideapad ones have complete MMC support. However, some
5.0 models don=E2=80=99t fully support the MMC function (only balance
mode allowed) and the PSC function might be used instead.

Thank you for your effort to bring this feature alive!

Yours,
Zhen Gong

On Jan 11, 2021, at 08:22, Mark Pearson <markpearson@lenovo.com> wrote:

Add support to thinkpad_acpi for Lenovo platforms that have DYTC
version 5 support or newer to use the platform profile feature.

This will allow users to determine and control the platform modes
between low-power, balanced operation and performance modes.

Signed-off-by: Mark Pearson <markpearson@lenovo.com>
Reported-by: kernel test robot <lkp@intel.com>
---
Changes in v2:
Address (hopefully) all recommendations from review including:
- use IS_ENABLED instead of IS_DEFINED
- update driver to work with all the fixes in platform_profile update
- improve error handling for invalid inputs
- move tracking of current profile mode into this driver

Changes in v3:
- version update for patch series

Changes in v4:
- Rebase on top of palm sensor patch which led to a little bit of file
  restructuring/clean up
- Use BIT macro where applicable
- Formatting fixes
- Check sysfs node created on exit function
- implement and use DYTC_SET_COMMAND macro
- in case of failure setting performance mode make sure CQL mode is
  enabled again before returning.
- Clean up initialisation and error handling code

Changes in v5:
- Use atomic_int with ignoring events
- Add mutex when accessing ACPI information
- Clean up registration code
- Use cached value in profile_get function
- Add dytc_cql_command function to clean up and provide common handler
- Update to work with changes in platform_profile implementation

Changes in v6:
- Update file to build against update in v6 platform_profile

Changes in v7 & v8:
- version bump along with rest of patch series

Changes in v9:
- Update define names to be correct with the linux-pm branches accepted
  version
- Rename DYTC_MODE_QUIET to LOW_POWER just because it's confusing. It
  was originally based on internal documentation.
Note - originally this patch was part of a series but with the other two
pieces being accepted into the acpi maintainers branch this one becomes
standalone.

drivers/platform/x86/thinkpad_acpi.c | 294 ++++++++++++++++++++++++++-
1 file changed, 288 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c
b/drivers/platform/x86/thinkpad_acpi.c
index e03df2881dc6..c5645331cfac 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -66,6 +66,7 @@
#include <linux/acpi.h>
#include <linux/pci.h>
#include <linux/power_supply.h>
+#include <linux/platform_profile.h>
#include <sound/core.h>
#include <sound/control.h>
#include <sound/initval.h>
@@ -9854,16 +9855,27 @@ static bool has_lapsensor;
static bool palm_state;
static bool lap_state;

-static int lapsensor_get(bool *present, bool *state)
+static int dytc_command(int command, int *output)
{
acpi_handle dytc_handle;
- int output;

- *present =3D false;
- if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "DYTC", &dytc_handle)))
+ if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "DYTC", &dytc_handle))) {
+ /* Platform doesn't support DYTC */
return -ENODEV;
- if (!acpi_evalf(dytc_handle, &output, NULL, "dd", DYTC_CMD_GET))
+ }
+ if (!acpi_evalf(dytc_handle, output, NULL, "dd", command))
return -EIO;
+ return 0;
+}
+
+static int lapsensor_get(bool *present, bool *state)
+{
+ int output, err;
+
+ *present =3D false;
+ err =3D dytc_command(DYTC_CMD_GET, &output);
+ if (err)
+ return err;

*present =3D true; /*If we get his far, we have lapmode support*/
*state =3D output & BIT(DYTC_GET_LAPMODE_BIT) ? true : false;
@@ -9982,6 +9994,264 @@ static struct ibm_struct proxsensor_driver_data =3D=
 {
.exit =3D proxsensor_exit,
};

+#if IS_ENABLED(CONFIG_ACPI_PLATFORM_PROFILE)
+
+/*************************************************************************
+ * DYTC Platform Profile interface
+ */
+
+#define DYTC_CMD_QUERY        0 /* To get DYTC status - enable/revision */
+#define DYTC_CMD_SET          1 /* To enable/disable IC function mode */
+#define DYTC_CMD_RESET    0x1ff /* To reset back to default */
+
+#define DYTC_QUERY_ENABLE_BIT 8  /* Bit        8 - 0 =3D disabled, 1 =3D e=
nabled */
+#define DYTC_QUERY_SUBREV_BIT 16 /* Bits 16 - 27 - sub revision */
+#define DYTC_QUERY_REV_BIT    28 /* Bits 28 - 31 - revision */
+
+#define DYTC_GET_FUNCTION_BIT 8  /* Bits  8-11 - function setting */
+#define DYTC_GET_MODE_BIT     12 /* Bits 12-15 - mode setting */
+
+#define DYTC_SET_FUNCTION_BIT 12 /* Bits 12-15 - function setting */
+#define DYTC_SET_MODE_BIT     16 /* Bits 16-19 - mode setting */
+#define DYTC_SET_VALID_BIT    20 /* Bit     20 - 1 =3D on, 0 =3D off */
+
+#define DYTC_FUNCTION_STD     0  /* Function =3D 0, standard mode */
+#define DYTC_FUNCTION_CQL     1  /* Function =3D 1, lap mode */
+#define DYTC_FUNCTION_MMC     11 /* Function =3D 11, desk mode */
+
+#define DYTC_MODE_PERFORM     2  /* High power mode aka performance */
+#define DYTC_MODE_LOWPOWER    3  /* Low power mode */
+#define DYTC_MODE_BALANCE   0xF  /* Default mode aka balanced */
+
+#define DYTC_SET_COMMAND(function, mode, on) \
+ (DYTC_CMD_SET | (function) << DYTC_SET_FUNCTION_BIT | \
+ (mode) << DYTC_SET_MODE_BIT | \
+ (on) << DYTC_SET_VALID_BIT)
+
+#define DYTC_DISABLE_CQL DYTC_SET_COMMAND(DYTC_FUNCTION_CQL,
DYTC_MODE_BALANCE, 0)
+
+#define DYTC_ENABLE_CQL DYTC_SET_COMMAND(DYTC_FUNCTION_CQL,
DYTC_MODE_BALANCE, 1)
+
+static bool dytc_profile_available;
+static enum platform_profile_option dytc_current_profile;
+static atomic_t dytc_ignore_event =3D ATOMIC_INIT(0);
+static DEFINE_MUTEX(dytc_mutex);
+
+static int convert_dytc_to_profile(int dytcmode, enum
platform_profile_option *profile)
+{
+ switch (dytcmode) {
+ case DYTC_MODE_LOWPOWER:
+ *profile =3D PLATFORM_PROFILE_LOW_POWER;
+ break;
+ case DYTC_MODE_BALANCE:
+ *profile =3D  PLATFORM_PROFILE_BALANCED;
+ break;
+ case DYTC_MODE_PERFORM:
+ *profile =3D  PLATFORM_PROFILE_PERFORMANCE;
+ break;
+ default: /* Unknown mode */
+ return -EINVAL;
+ }
+ return 0;
+}
+
+static int convert_profile_to_dytc(enum platform_profile_option
profile, int *perfmode)
+{
+ switch (profile) {
+ case PLATFORM_PROFILE_LOW_POWER:
+ *perfmode =3D DYTC_MODE_LOWPOWER;
+ break;
+ case PLATFORM_PROFILE_BALANCED:
+ *perfmode =3D DYTC_MODE_BALANCE;
+ break;
+ case PLATFORM_PROFILE_PERFORMANCE:
+ *perfmode =3D DYTC_MODE_PERFORM;
+ break;
+ default: /* Unknown profile */
+ return -EOPNOTSUPP;
+ }
+ return 0;
+}
+
+/*
+ * dytc_profile_get: Function to register with platform_profile
+ * handler. Returns current platform profile.
+ */
+int dytc_profile_get(struct platform_profile_handler *pprof,
+ enum platform_profile_option *profile)
+{
+ *profile =3D dytc_current_profile;
+ return 0;
+}
+
+/*
+ * Helper function - check if we are in CQL mode and if we are
+ *  -  disable CQL,
+ *  - run the command
+ *  - enable CQL
+ *  If not in CQL mode, just run the command
+ */
+int dytc_cql_command(int command, int *output)
+{
+ int err, cmd_err, dummy;
+ int cur_funcmode;
+
+ /* Determine if we are in CQL mode. This alters the commands we do */
+ err =3D dytc_command(DYTC_CMD_GET, output);
+ if (err)
+ return err;
+
+ cur_funcmode =3D (*output >> DYTC_GET_FUNCTION_BIT) & 0xF;
+ /* Check if we're OK to return immediately */
+ if ((command =3D=3D DYTC_CMD_GET) && (cur_funcmode !=3D DYTC_FUNCTION_CQL=
))
+ return 0;
+
+ if (cur_funcmode =3D=3D DYTC_FUNCTION_CQL) {
+ atomic_inc(&dytc_ignore_event);
+ err =3D dytc_command(DYTC_DISABLE_CQL, &dummy);
+ if (err)
+ return err;
+ }
+
+ cmd_err =3D dytc_command(command, output);
+ /* Check return condition after we've restored CQL state */
+
+ if (cur_funcmode =3D=3D DYTC_FUNCTION_CQL) {
+ err =3D dytc_command(DYTC_ENABLE_CQL, &dummy);
+ if (err)
+ return err;
+ }
+
+ return cmd_err;
+}
+
+/*
+ * dytc_profile_set: Function to register with platform_profile
+ * handler. Sets current platform profile.
+ */
+int dytc_profile_set(struct platform_profile_handler *pprof,
+ enum platform_profile_option profile)
+{
+ int output;
+ int err;
+
+ if (!dytc_profile_available)
+ return -ENODEV;
+
+ err =3D mutex_lock_interruptible(&dytc_mutex);
+ if (err)
+ return err;
+
+ if (profile =3D=3D PLATFORM_PROFILE_BALANCED) {
+ /* To get back to balanced mode we just issue a reset command */
+ err =3D dytc_command(DYTC_CMD_RESET, &output);
+ if (err)
+ goto unlock;
+ } else {
+ int perfmode;
+
+ err =3D convert_profile_to_dytc(profile, &perfmode);
+ if (err)
+ goto unlock;
+
+ /* Determine if we are in CQL mode. This alters the commands we do */
+ err =3D dytc_cql_command(DYTC_SET_COMMAND(DYTC_FUNCTION_MMC, perfmode,
1), &output);
+ if (err)
+ goto unlock;
+ }
+ /* Success - update current profile */
+ dytc_current_profile =3D profile;
+unlock:
+ mutex_unlock(&dytc_mutex);
+ return err;
+}
+
+static void dytc_profile_refresh(void)
+{
+ enum platform_profile_option profile;
+ int output, err;
+ int perfmode;
+
+ mutex_lock(&dytc_mutex);
+ err =3D dytc_cql_command(DYTC_CMD_GET, &output);
+ mutex_unlock(&dytc_mutex);
+ if (err)
+ return;
+
+ perfmode =3D (output >> DYTC_GET_MODE_BIT) & 0xF;
+ convert_dytc_to_profile(perfmode, &profile);
+ if (profile !=3D dytc_current_profile) {
+ dytc_current_profile =3D profile;
+ platform_profile_notify();
+ }
+}
+
+static struct platform_profile_handler dytc_profile =3D {
+ .profile_get =3D dytc_profile_get,
+ .profile_set =3D dytc_profile_set,
+};
+
+static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
+{
+ int err, output;
+
+ /* Setup supported modes */
+ set_bit(PLATFORM_PROFILE_LOW_POWER, dytc_profile.choices);
+ set_bit(PLATFORM_PROFILE_BALANCED, dytc_profile.choices);
+ set_bit(PLATFORM_PROFILE_PERFORMANCE, dytc_profile.choices);
+
+ dytc_profile_available =3D false;
+ err =3D dytc_command(DYTC_CMD_QUERY, &output);
+ /*
+ * If support isn't available (ENODEV) then don't return an error
+ * and don't create the sysfs group
+ */
+ if (err =3D=3D -ENODEV)
+ return 0;
+ /* For all other errors we can flag the failure */
+ if (err)
+ return err;
+
+ /* Check DYTC is enabled and supports mode setting */
+ if (output & BIT(DYTC_QUERY_ENABLE_BIT)) {
+ /* Only DYTC v5.0 and later has this feature. */
+ int dytc_version;
+
+ dytc_version =3D (output >> DYTC_QUERY_REV_BIT) & 0xF;
+ if (dytc_version >=3D 5) {
+ dbg_printk(TPACPI_DBG_INIT,
+   "DYTC version %d: thermal mode available\n", dytc_version);
+ /* Create platform_profile structure and register */
+ err =3D platform_profile_register(&dytc_profile);
+ /*
+ * If for some reason platform_profiles aren't enabled
+ * don't quit terminally.
+ */
+ if (err)
+ return 0;
+
+ dytc_profile_available =3D true;
+ /* Ensure initial values are correct */
+ dytc_profile_refresh();
+ }
+ }
+ return 0;
+}
+
+static void dytc_profile_exit(void)
+{
+ if (dytc_profile_available) {
+ dytc_profile_available =3D false;
+ platform_profile_remove();
+ }
+}
+
+static struct ibm_struct  dytc_profile_driver_data =3D {
+ .name =3D "dytc-profile",
+ .exit =3D dytc_profile_exit,
+};
+#endif /* CONFIG_ACPI_PLATFORM_PROFILE */
+
/**************************************************************************=
**
 **************************************************************************=
**
 *
@@ -10030,8 +10300,14 @@ static void tpacpi_driver_event(const
unsigned int hkey_event)
mutex_unlock(&kbdlight_mutex);
}

- if (hkey_event =3D=3D TP_HKEY_EV_THM_CSM_COMPLETED)
+ if (hkey_event =3D=3D TP_HKEY_EV_THM_CSM_COMPLETED) {
lapsensor_refresh();
+#if IS_ENABLED(CONFIG_ACPI_PLATFORM_PROFILE)
+ /* If we are already accessing DYTC then skip dytc update */
+ if (!atomic_add_unless(&dytc_ignore_event, -1, 0))
+ dytc_profile_refresh();
+#endif
+ }
}

static void hotkey_driver_event(const unsigned int scancode)
@@ -10474,6 +10750,12 @@ static struct ibm_init_struct ibms_init[]
__initdata =3D {
.init =3D tpacpi_proxsensor_init,
.data =3D &proxsensor_driver_data,
},
+#if IS_ENABLED(CONFIG_ACPI_PLATFORM_PROFILE)
+ {
+ .init =3D tpacpi_dytc_profile_init,
+ .data =3D &dytc_profile_driver_data,
+ },
+#endif
};

static int __init set_ibm_param(const char *val, const struct kernel_param =
*kp)

Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38036C433DB
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 21:58:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D229964F5F
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 21:58:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231421AbhBCV57 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 3 Feb 2021 16:57:59 -0500
Received: from mail-40134.protonmail.ch ([185.70.40.134]:62442 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231807AbhBCV5v (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 16:57:51 -0500
Date:   Wed, 03 Feb 2021 21:56:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1612389425;
        bh=EuInSQ26C/gYqcH2XwOX6Y076F2/9EhamcUwmrXtHsU=;
        h=Date:To:From:Reply-To:Subject:From;
        b=FwOSc7uXo234cZhuq1dfzcwB4NWn/NkPlC1ZV8gGIxEOuniPSR9N174OwoECEd3Uo
         4dXTIUPeCMMvVWAEpy+Y6l7Fckv5iPzUaPcOj5thyUhXPV0KTAt78eTCWwfU0YoGCF
         St6ZXVH0tz+nh55a5r35qTnc/YUCmyG+HJEw14j0=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v3 24/29] platform/x86: ideapad-laptop: fix checkpatch warnings, more consistent style
Message-ID: <20210203215403.290792-25-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Fix all checkpatch warnings. Reorder variable definitions from
longest to shortest. Add more whitespaces for better readability.
Rename variables named `ret` to `err` where appropriate. Reorder
sysfs attributes show/store callbacks and the `ideapad_attributes`
array in lexicographic order. And other minor formatting changes.
No significant functional changes are intended.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index 4fd9670100cb..2068831c5fe8 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -32,7 +32,7 @@
=20
 #include <acpi/video.h>
=20
-#define IDEAPAD_RFKILL_DEV_NUM=09(3)
+#define IDEAPAD_RFKILL_DEV_NUM=093
=20
 #if IS_ENABLED(CONFIG_ACPI_WMI)
 static const char *const ideapad_wmi_fnesc_events[] =3D {
@@ -99,7 +99,7 @@ enum {
 struct ideapad_dytc_priv {
 =09enum platform_profile_option current_profile;
 =09struct platform_profile_handler pprof;
-=09struct mutex mutex;
+=09struct mutex mutex; /* protects the DYTC interface */
 =09struct ideapad_private *priv;
 };
=20
@@ -136,7 +136,7 @@ MODULE_PARM_DESC(no_bt_rfkill, "No rfkill for bluetooth=
.");
 /*
  * ACPI Helpers
  */
-#define IDEAPAD_EC_TIMEOUT (200) /* in ms */
+#define IDEAPAD_EC_TIMEOUT 200 /* in ms */
=20
 static int eval_int(acpi_handle handle, const char *name, unsigned long *r=
es)
 {
@@ -146,7 +146,9 @@ static int eval_int(acpi_handle handle, const char *nam=
e, unsigned long *res)
 =09status =3D acpi_evaluate_integer(handle, (char *)name, NULL, &result);
 =09if (ACPI_FAILURE(status))
 =09=09return -EIO;
+
 =09*res =3D result;
+
 =09return 0;
 }
=20
@@ -225,6 +227,7 @@ static int eval_vpcw(acpi_handle handle, unsigned long =
cmd, unsigned long data)
 =09status =3D acpi_evaluate_object(handle, "VPCW", &params, NULL);
 =09if (ACPI_FAILURE(status))
 =09=09return -EIO;
+
 =09return 0;
 }
=20
@@ -241,13 +244,17 @@ static int read_ec_data(acpi_handle handle, unsigned =
long cmd, unsigned long *da
=20
 =09while (time_before(jiffies, end_jiffies)) {
 =09=09schedule();
+
 =09=09err =3D eval_vpcr(handle, 1, &val);
 =09=09if (err)
 =09=09=09return err;
+
 =09=09if (val =3D=3D 0)
 =09=09=09return eval_vpcr(handle, 0, data);
 =09}
+
 =09acpi_handle_err(handle, "timeout in %s\n", __func__);
+
 =09return -ETIMEDOUT;
 }
=20
@@ -259,6 +266,7 @@ static int write_ec_cmd(acpi_handle handle, unsigned lo=
ng cmd, unsigned long dat
 =09err =3D eval_vpcw(handle, 0, data);
 =09if (err)
 =09=09return err;
+
 =09err =3D eval_vpcw(handle, 1, cmd);
 =09if (err)
 =09=09return err;
@@ -267,13 +275,17 @@ static int write_ec_cmd(acpi_handle handle, unsigned =
long cmd, unsigned long dat
=20
 =09while (time_before(jiffies, end_jiffies)) {
 =09=09schedule();
+
 =09=09err =3D eval_vpcr(handle, 1, &val);
 =09=09if (err)
 =09=09=09return err;
+
 =09=09if (val =3D=3D 0)
 =09=09=09return 0;
 =09}
+
 =09acpi_handle_err(handle, "timeout in %s\n", __func__);
+
 =09return -ETIMEDOUT;
 }
=20
@@ -291,6 +303,7 @@ static int debugfs_status_show(struct seq_file *s, void=
 *data)
 =09=09seq_printf(s, "Backlight now:  %lu\n", value);
 =09if (!read_ec_data(priv->adev->handle, VPCCMD_R_BL_POWER, &value))
 =09=09seq_printf(s, "BL power value: %s (%lu)\n", value ? "on" : "off", va=
lue);
+
 =09seq_puts(s, "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D\n");
=20
 =09if (!read_ec_data(priv->adev->handle, VPCCMD_R_RF, &value))
@@ -301,12 +314,14 @@ static int debugfs_status_show(struct seq_file *s, vo=
id *data)
 =09=09seq_printf(s, "BT status:    %s (%lu)\n", value ? "on" : "off", valu=
e);
 =09if (!read_ec_data(priv->adev->handle, VPCCMD_R_3G, &value))
 =09=09seq_printf(s, "3G status:    %s (%lu)\n", value ? "on" : "off", valu=
e);
+
 =09seq_puts(s, "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D\n");
=20
 =09if (!read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &value))
 =09=09seq_printf(s, "Touchpad status: %s (%lu)\n", value ? "on" : "off", v=
alue);
 =09if (!read_ec_data(priv->adev->handle, VPCCMD_R_CAMERA, &value))
 =09=09seq_printf(s, "Camera status:   %s (%lu)\n", value ? "on" : "off", v=
alue);
+
 =09seq_puts(s, "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D\n");
=20
 =09if (!eval_gbmd(priv->adev->handle, &value))
@@ -370,8 +385,8 @@ static void ideapad_debugfs_init(struct ideapad_private=
 *priv)
=20
 =09priv->debug =3D dir;
=20
-=09debugfs_create_file("cfg", S_IRUGO, dir, priv, &debugfs_cfg_fops);
-=09debugfs_create_file("status", S_IRUGO, dir, priv, &debugfs_status_fops)=
;
+=09debugfs_create_file("cfg", 0444, dir, priv, &debugfs_cfg_fops);
+=09debugfs_create_file("status", 0444, dir, priv, &debugfs_status_fops);
 }
=20
 static void ideapad_debugfs_exit(struct ideapad_private *priv)
@@ -383,75 +398,79 @@ static void ideapad_debugfs_exit(struct ideapad_priva=
te *priv)
 /*
  * sysfs
  */
-static ssize_t show_ideapad_cam(struct device *dev,
-=09=09=09=09struct device_attribute *attr,
-=09=09=09=09char *buf)
+static ssize_t camera_power_show(struct device *dev,
+=09=09=09=09 struct device_attribute *attr,
+=09=09=09=09 char *buf)
 {
-=09unsigned long result;
 =09struct ideapad_private *priv =3D dev_get_drvdata(dev);
+=09unsigned long result;
 =09int err;
=20
 =09err =3D read_ec_data(priv->adev->handle, VPCCMD_R_CAMERA, &result);
 =09if (err)
 =09=09return err;
+
 =09return sysfs_emit(buf, "%d\n", !!result);
 }
=20
-static ssize_t store_ideapad_cam(struct device *dev,
-=09=09=09=09 struct device_attribute *attr,
-=09=09=09=09 const char *buf, size_t count)
+static ssize_t camera_power_store(struct device *dev,
+=09=09=09=09  struct device_attribute *attr,
+=09=09=09=09  const char *buf, size_t count)
 {
 =09struct ideapad_private *priv =3D dev_get_drvdata(dev);
 =09bool state;
-=09int ret;
-
-=09ret =3D kstrtobool(buf, &state);
-=09if (ret)
-=09=09return ret;
-=09ret =3D write_ec_cmd(priv->adev->handle, VPCCMD_W_CAMERA, state);
-=09if (ret)
-=09=09return ret;
+=09int err;
+
+=09err =3D kstrtobool(buf, &state);
+=09if (err)
+=09=09return err;
+
+=09err =3D write_ec_cmd(priv->adev->handle, VPCCMD_W_CAMERA, state);
+=09if (err)
+=09=09return err;
+
 =09return count;
 }
=20
-static DEVICE_ATTR(camera_power, 0644, show_ideapad_cam, store_ideapad_cam=
);
+static DEVICE_ATTR_RW(camera_power);
=20
-static ssize_t show_ideapad_fan(struct device *dev,
-=09=09=09=09struct device_attribute *attr,
-=09=09=09=09char *buf)
+static ssize_t conservation_mode_show(struct device *dev,
+=09=09=09=09      struct device_attribute *attr,
+=09=09=09=09      char *buf)
 {
-=09unsigned long result;
 =09struct ideapad_private *priv =3D dev_get_drvdata(dev);
+=09unsigned long result;
 =09int err;
=20
-=09err =3D read_ec_data(priv->adev->handle, VPCCMD_R_FAN, &result);
+=09err =3D eval_gbmd(priv->adev->handle, &result);
 =09if (err)
 =09=09return err;
-=09return sysfs_emit(buf, "%lu\n", result);
+
+=09return sysfs_emit(buf, "%d\n", !!test_bit(GBMD_CONSERVATION_STATE_BIT, =
&result));
 }
=20
-static ssize_t store_ideapad_fan(struct device *dev,
-=09=09=09=09 struct device_attribute *attr,
-=09=09=09=09 const char *buf, size_t count)
+static ssize_t conservation_mode_store(struct device *dev,
+=09=09=09=09       struct device_attribute *attr,
+=09=09=09=09       const char *buf, size_t count)
 {
 =09struct ideapad_private *priv =3D dev_get_drvdata(dev);
-=09unsigned int state;
-=09int ret;
+=09bool state;
+=09int err;
+
+=09err =3D kstrtobool(buf, &state);
+=09if (err)
+=09=09return err;
+
+=09err =3D exec_smbc(priv->adev->handle, state ? SMBC_CONSERVATION_ON : SM=
BC_CONSERVATION_OFF);
+=09if (err)
+=09=09return err;
=20
-=09ret =3D kstrtouint(buf, 0, &state);
-=09if (ret)
-=09=09return ret;
-=09if (state > 4 || state =3D=3D 3)
-=09=09return -EINVAL;
-=09ret =3D write_ec_cmd(priv->adev->handle, VPCCMD_W_FAN, state);
-=09if (ret)
-=09=09return ret;
 =09return count;
 }
=20
-static DEVICE_ATTR(fan_mode, 0644, show_ideapad_fan, store_ideapad_fan);
+static DEVICE_ATTR_RW(conservation_mode);
=20
-static ssize_t touchpad_show(struct device *dev,
+static ssize_t fan_mode_show(struct device *dev,
 =09=09=09     struct device_attribute *attr,
 =09=09=09     char *buf)
 {
@@ -459,113 +478,121 @@ static ssize_t touchpad_show(struct device *dev,
 =09unsigned long result;
 =09int err;
=20
-=09err =3D read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &result);
+=09err =3D read_ec_data(priv->adev->handle, VPCCMD_R_FAN, &result);
 =09if (err)
 =09=09return err;
-=09return sysfs_emit(buf, "%d\n", !!result);
+
+=09return sysfs_emit(buf, "%lu\n", result);
 }
=20
-static ssize_t touchpad_store(struct device *dev,
+static ssize_t fan_mode_store(struct device *dev,
 =09=09=09      struct device_attribute *attr,
 =09=09=09      const char *buf, size_t count)
 {
 =09struct ideapad_private *priv =3D dev_get_drvdata(dev);
-=09bool state;
-=09int ret;
+=09unsigned int state;
+=09int err;
+
+=09err =3D kstrtouint(buf, 0, &state);
+=09if (err)
+=09=09return err;
+
+=09if (state > 4 || state =3D=3D 3)
+=09=09return -EINVAL;
=20
-=09ret =3D kstrtobool(buf, &state);
-=09if (ret)
-=09=09return ret;
+=09err =3D write_ec_cmd(priv->adev->handle, VPCCMD_W_FAN, state);
+=09if (err)
+=09=09return err;
=20
-=09ret =3D write_ec_cmd(priv->adev->handle, VPCCMD_W_TOUCHPAD, state);
-=09if (ret)
-=09=09return ret;
 =09return count;
 }
=20
-static DEVICE_ATTR_RW(touchpad);
+static DEVICE_ATTR_RW(fan_mode);
=20
-static ssize_t conservation_mode_show(struct device *dev,
-=09=09=09=09struct device_attribute *attr,
-=09=09=09=09char *buf)
+static ssize_t fn_lock_show(struct device *dev,
+=09=09=09    struct device_attribute *attr,
+=09=09=09    char *buf)
 {
 =09struct ideapad_private *priv =3D dev_get_drvdata(dev);
-=09unsigned long result;
+=09unsigned long hals;
 =09int err;
=20
-=09err =3D eval_gbmd(priv->adev->handle, &result);
+=09err =3D eval_hals(priv->adev->handle, &hals);
 =09if (err)
 =09=09return err;
-=09return sysfs_emit(buf, "%d\n", !!test_bit(GBMD_CONSERVATION_STATE_BIT, =
&result));
+
+=09return sysfs_emit(buf, "%d\n", !!test_bit(HALS_FNLOCK_STATE_BIT, &hals)=
);
 }
=20
-static ssize_t conservation_mode_store(struct device *dev,
-=09=09=09=09 struct device_attribute *attr,
-=09=09=09=09 const char *buf, size_t count)
+static ssize_t fn_lock_store(struct device *dev,
+=09=09=09     struct device_attribute *attr,
+=09=09=09     const char *buf, size_t count)
 {
 =09struct ideapad_private *priv =3D dev_get_drvdata(dev);
 =09bool state;
-=09int ret;
+=09int err;
=20
-=09ret =3D kstrtobool(buf, &state);
-=09if (ret)
-=09=09return ret;
+=09err =3D kstrtobool(buf, &state);
+=09if (err)
+=09=09return err;
+
+=09err =3D exec_sals(priv->adev->handle, state ? SALS_FNLOCK_ON : SALS_FNL=
OCK_OFF);
+=09if (err)
+=09=09return err;
=20
-=09ret =3D exec_smbc(priv->adev->handle, state ? SMBC_CONSERVATION_ON : SM=
BC_CONSERVATION_OFF);
-=09if (ret)
-=09=09return ret;
 =09return count;
 }
=20
-static DEVICE_ATTR_RW(conservation_mode);
+static DEVICE_ATTR_RW(fn_lock);
=20
-static ssize_t fn_lock_show(struct device *dev,
-=09=09=09    struct device_attribute *attr,
-=09=09=09    char *buf)
+static ssize_t touchpad_show(struct device *dev,
+=09=09=09     struct device_attribute *attr,
+=09=09=09     char *buf)
 {
 =09struct ideapad_private *priv =3D dev_get_drvdata(dev);
-=09unsigned long hals;
-=09int fail =3D eval_hals(priv->adev->handle, &hals);
+=09unsigned long result;
+=09int err;
=20
-=09if (fail)
-=09=09return fail;
+=09err =3D read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &result);
+=09if (err)
+=09=09return err;
=20
-=09return sysfs_emit(buf, "%d\n", !!test_bit(HALS_FNLOCK_STATE_BIT, &hals)=
);
+=09return sysfs_emit(buf, "%d\n", !!result);
 }
=20
-static ssize_t fn_lock_store(struct device *dev,
-=09=09=09     struct device_attribute *attr,
-=09=09=09     const char *buf, size_t count)
+static ssize_t touchpad_store(struct device *dev,
+=09=09=09      struct device_attribute *attr,
+=09=09=09      const char *buf, size_t count)
 {
 =09struct ideapad_private *priv =3D dev_get_drvdata(dev);
 =09bool state;
-=09int ret;
+=09int err;
+
+=09err =3D kstrtobool(buf, &state);
+=09if (err)
+=09=09return err;
=20
-=09ret =3D kstrtobool(buf, &state);
-=09if (ret)
-=09=09return ret;
+=09err =3D write_ec_cmd(priv->adev->handle, VPCCMD_W_TOUCHPAD, state);
+=09if (err)
+=09=09return err;
=20
-=09ret =3D exec_sals(priv->adev->handle, state ? SALS_FNLOCK_ON : SALS_FNL=
OCK_OFF);
-=09if (ret)
-=09=09return ret;
 =09return count;
 }
=20
-static DEVICE_ATTR_RW(fn_lock);
-
+static DEVICE_ATTR_RW(touchpad);
=20
 static struct attribute *ideapad_attributes[] =3D {
 =09&dev_attr_camera_power.attr,
-=09&dev_attr_fan_mode.attr,
-=09&dev_attr_touchpad.attr,
 =09&dev_attr_conservation_mode.attr,
+=09&dev_attr_fan_mode.attr,
 =09&dev_attr_fn_lock.attr,
+=09&dev_attr_touchpad.attr,
 =09NULL
 };
=20
 static umode_t ideapad_is_visible(struct kobject *kobj,
-=09=09=09=09 struct attribute *attr,
-=09=09=09=09 int idx)
+=09=09=09=09  struct attribute *attr,
+=09=09=09=09  int idx)
 {
 =09struct device *dev =3D kobj_to_dev(kobj);
 =09struct ideapad_private *priv =3D dev_get_drvdata(dev);
@@ -642,6 +669,7 @@ static int convert_dytc_to_profile(int dytcmode, enum p=
latform_profile_option *p
 =09default: /* Unknown mode */
 =09=09return -EINVAL;
 =09}
+
 =09return 0;
 }
=20
@@ -660,6 +688,7 @@ static int convert_profile_to_dytc(enum platform_profil=
e_option profile, int *pe
 =09default: /* Unknown profile */
 =09=09return -EOPNOTSUPP;
 =09}
+
 =09return 0;
 }
=20
@@ -667,24 +696,24 @@ static int convert_profile_to_dytc(enum platform_prof=
ile_option profile, int *pe
  * dytc_profile_get: Function to register with platform_profile
  * handler. Returns current platform profile.
  */
-int dytc_profile_get(struct platform_profile_handler *pprof,
-=09=09=09enum platform_profile_option *profile)
+static int dytc_profile_get(struct platform_profile_handler *pprof,
+=09=09=09    enum platform_profile_option *profile)
 {
-=09struct ideapad_dytc_priv *dytc;
+=09struct ideapad_dytc_priv *dytc =3D container_of(pprof, struct ideapad_d=
ytc_priv, pprof);
=20
-=09dytc =3D container_of(pprof, struct ideapad_dytc_priv, pprof);
 =09*profile =3D dytc->current_profile;
 =09return 0;
 }
=20
 /*
  * Helper function - check if we are in CQL mode and if we are
- *  -  disable CQL,
+ *  - disable CQL,
  *  - run the command
  *  - enable CQL
  *  If not in CQL mode, just run the command
  */
-int dytc_cql_command(struct ideapad_private *priv, unsigned long cmd, unsi=
gned long *output)
+static int dytc_cql_command(struct ideapad_private *priv, unsigned long cm=
d,
+=09=09=09    unsigned long *output)
 {
 =09int err, cmd_err, cur_funcmode;
=20
@@ -720,16 +749,13 @@ int dytc_cql_command(struct ideapad_private *priv, un=
signed long cmd, unsigned l
  * dytc_profile_set: Function to register with platform_profile
  * handler. Sets current platform profile.
  */
-int dytc_profile_set(struct platform_profile_handler *pprof,
-=09=09=09enum platform_profile_option profile)
+static int dytc_profile_set(struct platform_profile_handler *pprof,
+=09=09=09    enum platform_profile_option profile)
 {
-=09struct ideapad_dytc_priv *dytc;
-=09struct ideapad_private *priv;
+=09struct ideapad_dytc_priv *dytc =3D container_of(pprof, struct ideapad_d=
ytc_priv, pprof);
+=09struct ideapad_private *priv =3D dytc->priv;
 =09int err;
=20
-=09dytc =3D container_of(pprof, struct ideapad_dytc_priv, pprof);
-=09priv =3D dytc->priv;
-
 =09err =3D mutex_lock_interruptible(&dytc->mutex);
 =09if (err)
 =09=09return err;
@@ -747,16 +773,18 @@ int dytc_profile_set(struct platform_profile_handler =
*pprof,
 =09=09=09goto unlock;
=20
 =09=09/* Determine if we are in CQL mode. This alters the commands we do *=
/
-=09=09err =3D dytc_cql_command(priv,
-=09=09=09=09DYTC_SET_COMMAND(DYTC_FUNCTION_MMC, perfmode, 1),
-=09=09=09=09NULL);
+=09=09err =3D dytc_cql_command(priv, DYTC_SET_COMMAND(DYTC_FUNCTION_MMC, p=
erfmode, 1),
+=09=09=09=09       NULL);
 =09=09if (err)
 =09=09=09goto unlock;
 =09}
+
 =09/* Success - update current profile */
 =09dytc->current_profile =3D profile;
+
 unlock:
 =09mutex_unlock(&dytc->mutex);
+
 =09return err;
 }
=20
@@ -773,7 +801,10 @@ static void dytc_profile_refresh(struct ideapad_privat=
e *priv)
 =09=09return;
=20
 =09perfmode =3D (output >> DYTC_GET_MODE_BIT) & 0xF;
-=09convert_dytc_to_profile(perfmode, &profile);
+
+=09if (convert_dytc_to_profile(perfmode, &profile))
+=09=09return;
+
 =09if (profile !=3D priv->dytc->current_profile) {
 =09=09priv->dytc->current_profile =3D profile;
 =09=09platform_profile_notify();
@@ -794,14 +825,14 @@ static int ideapad_dytc_profile_init(struct ideapad_p=
rivate *priv)
 =09=09return err;
=20
 =09/* Check DYTC is enabled and supports mode setting */
-=09if (!(output & BIT(DYTC_QUERY_ENABLE_BIT)))
+=09if (!test_bit(DYTC_QUERY_ENABLE_BIT, &output))
 =09=09return -ENODEV;
=20
 =09dytc_version =3D (output >> DYTC_QUERY_REV_BIT) & 0xF;
 =09if (dytc_version < 5)
 =09=09return -ENODEV;
=20
-=09priv->dytc =3D kzalloc(sizeof(struct ideapad_dytc_priv), GFP_KERNEL);
+=09priv->dytc =3D kzalloc(sizeof(*priv->dytc), GFP_KERNEL);
 =09if (!priv->dytc)
 =09=09return -ENOMEM;
=20
@@ -819,17 +850,18 @@ static int ideapad_dytc_profile_init(struct ideapad_p=
rivate *priv)
 =09/* Create platform_profile structure and register */
 =09err =3D platform_profile_register(&priv->dytc->pprof);
 =09if (err)
-=09=09goto mutex_destroy;
+=09=09goto pp_reg_failed;
=20
 =09/* Ensure initial values are correct */
 =09dytc_profile_refresh(priv);
=20
 =09return 0;
=20
-mutex_destroy:
+pp_reg_failed:
 =09mutex_destroy(&priv->dytc->mutex);
 =09kfree(priv->dytc);
 =09priv->dytc =3D NULL;
+
 =09return err;
 }
=20
@@ -841,6 +873,7 @@ static void ideapad_dytc_profile_exit(struct ideapad_pr=
ivate *priv)
 =09platform_profile_remove();
 =09mutex_destroy(&priv->dytc->mutex);
 =09kfree(priv->dytc);
+
 =09priv->dytc =3D NULL;
 }
=20
@@ -890,16 +923,15 @@ static void ideapad_sync_rfk_state(struct ideapad_pri=
vate *priv)
=20
 static int ideapad_register_rfkill(struct ideapad_private *priv, int dev)
 {
-=09int ret;
-=09unsigned long sw_blocked;
+=09unsigned long rf_enabled;
+=09int err;
=20
-=09if (no_bt_rfkill &&
-=09    (ideapad_rfk_data[dev].type =3D=3D RFKILL_TYPE_BLUETOOTH)) {
+=09if (no_bt_rfkill && ideapad_rfk_data[dev].type =3D=3D RFKILL_TYPE_BLUET=
OOTH) {
 =09=09/* Force to enable bluetooth when no_bt_rfkill=3D1 */
-=09=09write_ec_cmd(priv->adev->handle,
-=09=09=09     ideapad_rfk_data[dev].opcode, 1);
+=09=09write_ec_cmd(priv->adev->handle, ideapad_rfk_data[dev].opcode, 1);
 =09=09return 0;
 =09}
+
 =09priv->rfk_priv[dev].dev =3D dev;
 =09priv->rfk_priv[dev].priv =3D priv;
=20
@@ -911,20 +943,17 @@ static int ideapad_register_rfkill(struct ideapad_pri=
vate *priv, int dev)
 =09if (!priv->rfk[dev])
 =09=09return -ENOMEM;
=20
-=09if (read_ec_data(priv->adev->handle, ideapad_rfk_data[dev].opcode-1,
-=09=09=09 &sw_blocked)) {
-=09=09rfkill_init_sw_state(priv->rfk[dev], 0);
-=09} else {
-=09=09sw_blocked =3D !sw_blocked;
-=09=09rfkill_init_sw_state(priv->rfk[dev], sw_blocked);
-=09}
+=09err =3D read_ec_data(priv->adev->handle, ideapad_rfk_data[dev].opcode -=
 1, &rf_enabled);
+=09if (err)
+=09=09rf_enabled =3D 1;
+
+=09rfkill_init_sw_state(priv->rfk[dev], !rf_enabled);
=20
-=09ret =3D rfkill_register(priv->rfk[dev]);
-=09if (ret) {
+=09err =3D rfkill_register(priv->rfk[dev]);
+=09if (err)
 =09=09rfkill_destroy(priv->rfk[dev]);
-=09=09return ret;
-=09}
-=09return 0;
+
+=09return err;
 }
=20
 static void ideapad_unregister_rfkill(struct ideapad_private *priv, int de=
v)
@@ -955,26 +984,25 @@ static void ideapad_sysfs_exit(struct ideapad_private=
 *priv)
  * input device
  */
 static const struct key_entry ideapad_keymap[] =3D {
-=09{ KE_KEY, 6,  { KEY_SWITCHVIDEOMODE } },
-=09{ KE_KEY, 7,  { KEY_CAMERA } },
-=09{ KE_KEY, 8,  { KEY_MICMUTE } },
-=09{ KE_KEY, 11, { KEY_F16 } },
-=09{ KE_KEY, 13, { KEY_WLAN } },
-=09{ KE_KEY, 16, { KEY_PROG1 } },
-=09{ KE_KEY, 17, { KEY_PROG2 } },
-=09{ KE_KEY, 64, { KEY_PROG3 } },
-=09{ KE_KEY, 65, { KEY_PROG4 } },
-=09{ KE_KEY, 66, { KEY_TOUCHPAD_OFF } },
-=09{ KE_KEY, 67, { KEY_TOUCHPAD_ON } },
+=09{ KE_KEY,   6, { KEY_SWITCHVIDEOMODE } },
+=09{ KE_KEY,   7, { KEY_CAMERA } },
+=09{ KE_KEY,   8, { KEY_MICMUTE } },
+=09{ KE_KEY,  11, { KEY_F16 } },
+=09{ KE_KEY,  13, { KEY_WLAN } },
+=09{ KE_KEY,  16, { KEY_PROG1 } },
+=09{ KE_KEY,  17, { KEY_PROG2 } },
+=09{ KE_KEY,  64, { KEY_PROG3 } },
+=09{ KE_KEY,  65, { KEY_PROG4 } },
+=09{ KE_KEY,  66, { KEY_TOUCHPAD_OFF } },
+=09{ KE_KEY,  67, { KEY_TOUCHPAD_ON } },
 =09{ KE_KEY, 128, { KEY_ESC } },
-
-=09{ KE_END, 0 },
+=09{ KE_END },
 };
=20
 static int ideapad_input_init(struct ideapad_private *priv)
 {
 =09struct input_dev *inputdev;
-=09int error;
+=09int err;
=20
 =09inputdev =3D input_allocate_device();
 =09if (!inputdev)
@@ -985,26 +1013,28 @@ static int ideapad_input_init(struct ideapad_private=
 *priv)
 =09inputdev->id.bustype =3D BUS_HOST;
 =09inputdev->dev.parent =3D &priv->platform_device->dev;
=20
-=09error =3D sparse_keymap_setup(inputdev, ideapad_keymap, NULL);
-=09if (error) {
+=09err =3D sparse_keymap_setup(inputdev, ideapad_keymap, NULL);
+=09if (err) {
 =09=09dev_err(&priv->platform_device->dev,
-=09=09=09"Unable to setup input device keymap\n");
+=09=09=09"Could not set up input device keymap: %d\n", err);
 =09=09goto err_free_dev;
 =09}
=20
-=09error =3D input_register_device(inputdev);
-=09if (error) {
+=09err =3D input_register_device(inputdev);
+=09if (err) {
 =09=09dev_err(&priv->platform_device->dev,
-=09=09=09"Unable to register input device\n");
+=09=09=09"Could not register input device: %d\n", err);
 =09=09goto err_free_dev;
 =09}
=20
 =09priv->inputdev =3D inputdev;
+
 =09return 0;
=20
 err_free_dev:
 =09input_free_device(inputdev);
-=09return error;
+
+=09return err;
 }
=20
 static void ideapad_input_exit(struct ideapad_private *priv)
@@ -1025,6 +1055,7 @@ static void ideapad_input_novokey(struct ideapad_priv=
ate *priv)
=20
 =09if (read_ec_data(priv->adev->handle, VPCCMD_R_NOVO, &long_pressed))
 =09=09return;
+
 =09if (long_pressed)
 =09=09ideapad_input_report(priv, 17);
 =09else
@@ -1040,8 +1071,8 @@ static void ideapad_check_special_buttons(struct idea=
pad_private *priv)
=20
 =09for_each_set_bit (bit, &value, 16) {
 =09=09switch (bit) {
-=09=09case 0:=09/* Z580 */
 =09=09case 6:=09/* Z570 */
+=09=09case 0:=09/* Z580 */
 =09=09=09/* Thermal Management button */
 =09=09=09ideapad_input_report(priv, 65);
 =09=09=09break;
@@ -1069,6 +1100,7 @@ static int ideapad_backlight_get_brightness(struct ba=
cklight_device *blightdev)
 =09err =3D read_ec_data(priv->adev->handle, VPCCMD_R_BL, &now);
 =09if (err)
 =09=09return err;
+
 =09return now;
 }
=20
@@ -1081,6 +1113,7 @@ static int ideapad_backlight_update_status(struct bac=
klight_device *blightdev)
 =09=09=09   blightdev->props.brightness);
 =09if (err)
 =09=09return err;
+
 =09err =3D write_ec_cmd(priv->adev->handle, VPCCMD_W_BL_POWER,
 =09=09=09   blightdev->props.power !=3D FB_BLANK_POWERDOWN);
 =09if (err)
@@ -1104,30 +1137,36 @@ static int ideapad_backlight_init(struct ideapad_pr=
ivate *priv)
 =09err =3D read_ec_data(priv->adev->handle, VPCCMD_R_BL_MAX, &max);
 =09if (err)
 =09=09return err;
+
 =09err =3D read_ec_data(priv->adev->handle, VPCCMD_R_BL, &now);
 =09if (err)
 =09=09return err;
+
 =09err =3D read_ec_data(priv->adev->handle, VPCCMD_R_BL_POWER, &power);
 =09if (err)
 =09=09return err;
=20
-=09memset(&props, 0, sizeof(struct backlight_properties));
+=09memset(&props, 0, sizeof(props));
+
 =09props.max_brightness =3D max;
 =09props.type =3D BACKLIGHT_PLATFORM;
+
 =09blightdev =3D backlight_device_register("ideapad",
 =09=09=09=09=09      &priv->platform_device->dev,
 =09=09=09=09=09      priv,
 =09=09=09=09=09      &ideapad_backlight_ops,
 =09=09=09=09=09      &props);
 =09if (IS_ERR(blightdev)) {
+=09=09err =3D PTR_ERR(blightdev);
 =09=09dev_err(&priv->platform_device->dev,
-=09=09=09"Could not register backlight device\n");
-=09=09return PTR_ERR(blightdev);
+=09=09=09"Could not register backlight device: %d\n", err);
+=09=09return err;
 =09}
=20
 =09priv->blightdev =3D blightdev;
 =09blightdev->props.brightness =3D now;
 =09blightdev->props.power =3D power ? FB_BLANK_UNBLANK : FB_BLANK_POWERDOW=
N;
+
 =09backlight_update_status(blightdev);
=20
 =09return 0;
@@ -1141,13 +1180,15 @@ static void ideapad_backlight_exit(struct ideapad_p=
rivate *priv)
=20
 static void ideapad_backlight_notify_power(struct ideapad_private *priv)
 {
-=09unsigned long power;
 =09struct backlight_device *blightdev =3D priv->blightdev;
+=09unsigned long power;
=20
 =09if (!blightdev)
 =09=09return;
+
 =09if (read_ec_data(priv->adev->handle, VPCCMD_R_BL_POWER, &power))
 =09=09return;
+
 =09blightdev->props.power =3D power ? FB_BLANK_UNBLANK : FB_BLANK_POWERDOW=
N;
 }
=20
@@ -1156,12 +1197,10 @@ static void ideapad_backlight_notify_brightness(str=
uct ideapad_private *priv)
 =09unsigned long now;
=20
 =09/* if we control brightness via acpi video driver */
-=09if (priv->blightdev =3D=3D NULL) {
+=09if (!priv->blightdev)
 =09=09read_ec_data(priv->adev->handle, VPCCMD_R_BL, &now);
-=09=09return;
-=09}
-
-=09backlight_force_update(priv->blightdev, BACKLIGHT_UPDATE_HOTKEY);
+=09else
+=09=09backlight_force_update(priv->blightdev, BACKLIGHT_UPDATE_HOTKEY);
 }
=20
 /*
@@ -1176,13 +1215,14 @@ static void ideapad_sync_touchpad_state(struct idea=
pad_private *priv)
=20
 =09/* Without reading from EC touchpad LED doesn't switch state */
 =09if (!read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &value)) {
-=09=09/* Some IdeaPads don't really turn off touchpad - they only
+=09=09unsigned char param;
+=09=09/*
+=09=09 * Some IdeaPads don't really turn off touchpad - they only
 =09=09 * switch the LED state. We (de)activate KBC AUX port to turn
 =09=09 * touchpad off and on. We send KEY_TOUCHPAD_OFF and
-=09=09 * KEY_TOUCHPAD_ON to not to get out of sync with LED */
-=09=09unsigned char param;
-=09=09i8042_command(&param, value ? I8042_CMD_AUX_ENABLE :
-=09=09=09      I8042_CMD_AUX_DISABLE);
+=09=09 * KEY_TOUCHPAD_ON to not to get out of sync with LED
+=09=09 */
+=09=09i8042_command(&param, value ? I8042_CMD_AUX_ENABLE : I8042_CMD_AUX_D=
ISABLE);
 =09=09ideapad_input_report(priv, value ? 67 : 66);
 =09}
 }
@@ -1194,6 +1234,7 @@ static void ideapad_acpi_notify(acpi_handle handle, u=
32 event, void *data)
=20
 =09if (read_ec_data(handle, VPCCMD_R_VPC1, &vpc1))
 =09=09return;
+
 =09if (read_ec_data(handle, VPCCMD_R_VPC2, &vpc2))
 =09=09return;
=20
@@ -1201,9 +1242,6 @@ static void ideapad_acpi_notify(acpi_handle handle, u=
32 event, void *data)
=20
 =09for_each_set_bit (bit, &vpc1, 16) {
 =09=09switch (bit) {
-=09=09case 9:
-=09=09=09ideapad_sync_rfk_state(priv);
-=09=09=09break;
 =09=09case 13:
 =09=09case 11:
 =09=09case 8:
@@ -1211,6 +1249,9 @@ static void ideapad_acpi_notify(acpi_handle handle, u=
32 event, void *data)
 =09=09case 6:
 =09=09=09ideapad_input_report(priv, bit);
 =09=09=09break;
+=09=09case 9:
+=09=09=09ideapad_sync_rfk_state(priv);
+=09=09=09break;
 =09=09case 5:
 =09=09=09ideapad_sync_touchpad_state(priv);
 =09=09=09break;
@@ -1223,16 +1264,17 @@ static void ideapad_acpi_notify(acpi_handle handle,=
 u32 event, void *data)
 =09=09case 2:
 =09=09=09ideapad_backlight_notify_power(priv);
 =09=09=09break;
-=09=09case 0:
-=09=09=09ideapad_check_special_buttons(priv);
-=09=09=09break;
 =09=09case 1:
-=09=09=09/* Some IdeaPads report event 1 every ~20
+=09=09=09/*
+=09=09=09 * Some IdeaPads report event 1 every ~20
 =09=09=09 * seconds while on battery power; some
 =09=09=09 * report this when changing to/from tablet
 =09=09=09 * mode. Squelch this event.
 =09=09=09 */
 =09=09=09break;
+=09=09case 0:
+=09=09=09ideapad_check_special_buttons(priv);
+=09=09=09break;
 =09=09default:
 =09=09=09dev_info(&priv->platform_device->dev,
 =09=09=09=09 "Unknown event: %lu\n", bit);
@@ -1304,14 +1346,14 @@ static void ideapad_check_features(struct ideapad_p=
rivate *priv)
=20
 static int ideapad_acpi_add(struct platform_device *pdev)
 {
-=09int ret, i;
 =09struct ideapad_private *priv;
 =09struct acpi_device *adev;
 =09acpi_status status;
 =09unsigned long cfg;
+=09int err, i;
=20
-=09ret =3D acpi_bus_get_device(ACPI_HANDLE(&pdev->dev), &adev);
-=09if (ret)
+=09err =3D acpi_bus_get_device(ACPI_HANDLE(&pdev->dev), &adev);
+=09if (err)
 =09=09return -ENODEV;
=20
 =09if (eval_int(adev->handle, "_CFG", &cfg))
@@ -1322,20 +1364,21 @@ static int ideapad_acpi_add(struct platform_device =
*pdev)
 =09=09return -ENOMEM;
=20
 =09dev_set_drvdata(&pdev->dev, priv);
+
 =09priv->cfg =3D cfg;
 =09priv->adev =3D adev;
 =09priv->platform_device =3D pdev;
=20
 =09ideapad_check_features(priv);
=20
-=09ret =3D ideapad_sysfs_init(priv);
-=09if (ret)
-=09=09return ret;
+=09err =3D ideapad_sysfs_init(priv);
+=09if (err)
+=09=09return err;
=20
 =09ideapad_debugfs_init(priv);
=20
-=09ret =3D ideapad_input_init(priv);
-=09if (ret)
+=09err =3D ideapad_input_init(priv);
+=09if (err)
 =09=09goto input_failed;
=20
 =09/*
@@ -1356,24 +1399,25 @@ static int ideapad_acpi_add(struct platform_device =
*pdev)
 =09ideapad_sync_rfk_state(priv);
 =09ideapad_sync_touchpad_state(priv);
=20
-=09ret =3D ideapad_dytc_profile_init(priv);
-=09if (ret) {
-=09=09if (ret !=3D -ENODEV)
-=09=09=09dev_warn(&pdev->dev, "Could not set up DYTC interface: %d\n", ret=
);
+=09err =3D ideapad_dytc_profile_init(priv);
+=09if (err) {
+=09=09if (err !=3D -ENODEV)
+=09=09=09dev_warn(&pdev->dev, "Could not set up DYTC interface: %d\n", err=
);
 =09=09else
 =09=09=09dev_info(&pdev->dev, "DYTC interface is not available\n");
 =09}
=20
 =09if (acpi_video_get_backlight_type() =3D=3D acpi_backlight_vendor) {
-=09=09ret =3D ideapad_backlight_init(priv);
-=09=09if (ret && ret !=3D -ENODEV)
+=09=09err =3D ideapad_backlight_init(priv);
+=09=09if (err && err !=3D -ENODEV)
 =09=09=09goto backlight_failed;
 =09}
+
 =09status =3D acpi_install_notify_handler(adev->handle,
 =09=09=09=09=09     ACPI_DEVICE_NOTIFY,
 =09=09=09=09=09     ideapad_acpi_notify, priv);
 =09if (ACPI_FAILURE(status)) {
-=09=09ret =3D -EIO;
+=09=09err =3D -EIO;
 =09=09goto notification_failed;
 =09}
=20
@@ -1386,29 +1430,38 @@ static int ideapad_acpi_add(struct platform_device =
*pdev)
 =09=09=09break;
 =09=09}
 =09}
+
 =09if (ACPI_FAILURE(status) && status !=3D AE_NOT_EXIST) {
-=09=09ret =3D -EIO;
+=09=09err =3D -EIO;
 =09=09goto notification_failed_wmi;
 =09}
 #endif
=20
 =09return 0;
+
 #if IS_ENABLED(CONFIG_ACPI_WMI)
 notification_failed_wmi:
 =09acpi_remove_notify_handler(priv->adev->handle,
-=09=09ACPI_DEVICE_NOTIFY, ideapad_acpi_notify);
+=09=09=09=09   ACPI_DEVICE_NOTIFY,
+=09=09=09=09   ideapad_acpi_notify);
 #endif
+
 notification_failed:
 =09ideapad_backlight_exit(priv);
+
 backlight_failed:
 =09ideapad_dytc_profile_exit(priv);
+
 =09for (i =3D 0; i < IDEAPAD_RFKILL_DEV_NUM; i++)
 =09=09ideapad_unregister_rfkill(priv, i);
+
 =09ideapad_input_exit(priv);
+
 input_failed:
 =09ideapad_debugfs_exit(priv);
 =09ideapad_sysfs_exit(priv);
-=09return ret;
+
+=09return err;
 }
=20
 static int ideapad_acpi_remove(struct platform_device *pdev)
@@ -1420,12 +1473,17 @@ static int ideapad_acpi_remove(struct platform_devi=
ce *pdev)
 =09if (priv->fnesc_guid)
 =09=09wmi_remove_notify_handler(priv->fnesc_guid);
 #endif
+
 =09acpi_remove_notify_handler(priv->adev->handle,
-=09=09ACPI_DEVICE_NOTIFY, ideapad_acpi_notify);
+=09=09=09=09   ACPI_DEVICE_NOTIFY,
+=09=09=09=09   ideapad_acpi_notify);
+
 =09ideapad_backlight_exit(priv);
 =09ideapad_dytc_profile_exit(priv);
+
 =09for (i =3D 0; i < IDEAPAD_RFKILL_DEV_NUM; i++)
 =09=09ideapad_unregister_rfkill(priv, i);
+
 =09ideapad_input_exit(priv);
 =09ideapad_debugfs_exit(priv);
 =09ideapad_sysfs_exit(priv);
@@ -1450,8 +1508,8 @@ static int ideapad_acpi_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(ideapad_pm, NULL, ideapad_acpi_resume);
=20
 static const struct acpi_device_id ideapad_device_ids[] =3D {
-=09{ "VPC2004", 0},
-=09{ "", 0},
+=09{"VPC2004", 0},
+=09{"", 0},
 };
 MODULE_DEVICE_TABLE(acpi, ideapad_device_ids);
=20
--=20
2.30.0



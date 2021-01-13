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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0841FC433E0
	for <platform-driver-x86@archiver.kernel.org>; Wed, 13 Jan 2021 18:24:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A403A2343E
	for <platform-driver-x86@archiver.kernel.org>; Wed, 13 Jan 2021 18:24:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728016AbhAMSXh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 13 Jan 2021 13:23:37 -0500
Received: from mail-40136.protonmail.ch ([185.70.40.136]:56961 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727984AbhAMSXh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Jan 2021 13:23:37 -0500
Date:   Wed, 13 Jan 2021 18:22:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1610562153;
        bh=uR32sQic+qTSoA+P5UGUjcZ3uTGtvVRgURiw4806O3s=;
        h=Date:To:From:Reply-To:Subject:From;
        b=DrPWZ3HFLweR9Lo4kDmmXZ3reVGVknX+ewApuhGYTKWWA9a7uB7R/j4iVB3scSZi4
         YneV5XVnl70vScCoGclrbeSWD3/y8KJ6aQqdy2N67cy6fDip6kh7bxG/wQsvg7WHYJ
         Ckzx1O/+L+j9yZJImOx4uuVxPlHswmjCE0K1SRQk=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v2 19/24] platform/x86: ideapad-laptop: fix checkpatch warnings, more consistent style
Message-ID: <20210113182016.166049-20-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Fix (almost all) checkpatch warnings. Reorder variable definitions from
longest to shortest. Add more whitespaces for better readability. Rename
variables named `ret` to `err` where appropriate.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index 83ad82b21b59..0e50969bd194 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -129,13 +129,15 @@ MODULE_PARM_DESC(no_bt_rfkill, "No rfkill for bluetoo=
th.");
=20
 static int eval_int(acpi_handle handle, const char *method, unsigned long =
*val)
 {
-=09acpi_status acpi_err;
 =09unsigned long long result;
+=09acpi_status acpi_err;
=20
 =09acpi_err =3D acpi_evaluate_integer(handle, (char *)method, NULL, &resul=
t);
 =09if (ACPI_FAILURE(acpi_err))
 =09=09return -EIO;
+
 =09*val =3D result;
+
 =09return 0;
 }
=20
@@ -167,10 +169,10 @@ static int eval_sals(acpi_handle handle, unsigned lon=
g arg)
=20
 static int eval_vpcr(acpi_handle handle, unsigned long cmd, unsigned long =
*val)
 {
-=09acpi_status acpi_err;
-=09unsigned long long result;
 =09struct acpi_object_list params;
+=09unsigned long long result;
 =09union acpi_object in_obj;
+=09acpi_status acpi_err;
=20
 =09params.count =3D 1;
 =09params.pointer =3D &in_obj;
@@ -178,12 +180,12 @@ static int eval_vpcr(acpi_handle handle, unsigned lon=
g cmd, unsigned long *val)
 =09in_obj.integer.value =3D cmd;
=20
 =09acpi_err =3D acpi_evaluate_integer(handle, "VPCR", &params, &result);
-
 =09if (ACPI_FAILURE(acpi_err))
 =09=09return -EIO;
+
 =09*val =3D result;
-=09return 0;
=20
+=09return 0;
 }
=20
 static int eval_vpcw(acpi_handle handle, unsigned long cmd, unsigned long =
data)
@@ -202,13 +204,14 @@ static int eval_vpcw(acpi_handle handle, unsigned lon=
g cmd, unsigned long data)
 =09acpi_err =3D acpi_evaluate_object(handle, "VPCW", &params, NULL);
 =09if (ACPI_FAILURE(acpi_err))
 =09=09return -EIO;
+
 =09return 0;
 }
=20
 static int read_ec_data(acpi_handle handle, unsigned long cmd, unsigned lo=
ng *data)
 {
+=09unsigned long end_jiffies, val;
 =09int err;
-=09unsigned long int end_jiffies, val;
=20
 =09err =3D eval_vpcw(handle, 1, cmd);
 =09if (err)
@@ -216,39 +219,51 @@ static int read_ec_data(acpi_handle handle, unsigned =
long cmd, unsigned long *da
=20
 =09for (end_jiffies =3D jiffies + msecs_to_jiffies(IDEAPAD_EC_TIMEOUT) + 1=
;
 =09     time_before(jiffies, end_jiffies);) {
+
 =09=09schedule();
+
 =09=09err =3D eval_vpcr(handle, 1, &val);
+
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
 static int write_ec_cmd(acpi_handle handle, unsigned long cmd, unsigned lo=
ng data)
 {
-=09int err;
 =09unsigned long end_jiffies, val;
+=09int err;
=20
 =09err =3D eval_vpcw(handle, 0, data);
 =09if (err)
 =09=09return err;
+
 =09err =3D eval_vpcw(handle, 1, cmd);
 =09if (err)
 =09=09return err;
=20
 =09for (end_jiffies =3D jiffies + msecs_to_jiffies(IDEAPAD_EC_TIMEOUT) + 1=
;
 =09     time_before(jiffies, end_jiffies);) {
+
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
@@ -265,30 +280,40 @@ static int debugfs_status_show(struct seq_file *s, vo=
id *data)
=20
 =09if (!read_ec_data(priv->adev->handle, VPCCMD_R_BL_MAX, &value))
 =09=09seq_printf(s, "Backlight max:\t%lu\n", value);
+
 =09if (!read_ec_data(priv->adev->handle, VPCCMD_R_BL, &value))
 =09=09seq_printf(s, "Backlight now:\t%lu\n", value);
+
 =09if (!read_ec_data(priv->adev->handle, VPCCMD_R_BL_POWER, &value))
 =09=09seq_printf(s, "BL power value:\t%s (%lu)\n", value ? "on" : "off", v=
alue);
+
 =09seq_puts(s, "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D\n");
=20
 =09if (!read_ec_data(priv->adev->handle, VPCCMD_R_RF, &value))
 =09=09seq_printf(s, "Radio status:\t%s (%lu)\n", value ? "on" : "off", val=
ue);
+
 =09if (!read_ec_data(priv->adev->handle, VPCCMD_R_WIFI, &value))
 =09=09seq_printf(s, "Wifi status:\t%s (%lu)\n", value ? "on" : "off", valu=
e);
+
 =09if (!read_ec_data(priv->adev->handle, VPCCMD_R_BT, &value))
 =09=09seq_printf(s, "BT status:\t%s (%lu)\n", value ? "on" : "off", value)=
;
+
 =09if (!read_ec_data(priv->adev->handle, VPCCMD_R_3G, &value))
 =09=09seq_printf(s, "3G status:\t%s (%lu)\n", value ? "on" : "off", value)=
;
+
 =09seq_puts(s, "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D\n");
=20
 =09if (!read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &value))
 =09=09seq_printf(s, "Touchpad status:\t%s (%lu)\n", value ? "on" : "off", =
value);
+
 =09if (!read_ec_data(priv->adev->handle, VPCCMD_R_CAMERA, &value))
 =09=09seq_printf(s, "Camera status:\t%s (%lu)\n", value ? "on" : "off", va=
lue);
+
 =09seq_puts(s, "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D\n");
=20
 =09if (!eval_gbmd(priv->adev->handle, &value))
 =09=09seq_printf(s, "GBMD: %#010lx\n", value);
+
 =09if (!eval_hals(priv->adev->handle, &value))
 =09=09seq_printf(s, "HALS: %#010lx\n", value);
=20
@@ -349,8 +374,8 @@ static void ideapad_debugfs_init(struct ideapad_private=
 *priv)
 =09dir =3D debugfs_create_dir("ideapad", NULL);
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
@@ -362,73 +387,80 @@ static void ideapad_debugfs_exit(struct ideapad_priva=
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
 =09return sysfs_emit(buf, "%lu\n", result);
 }
=20
-static ssize_t store_ideapad_cam(struct device *dev,
-=09=09=09=09 struct device_attribute *attr,
-=09=09=09=09 const char *buf, size_t count)
+static ssize_t camera_power_store(struct device *dev,
+=09=09=09=09  struct device_attribute *attr,
+=09=09=09=09  const char *buf, size_t count)
 {
-=09int ret;
 =09struct ideapad_private *priv =3D dev_get_drvdata(dev);
 =09unsigned int state;
+=09int err;
+
+=09err =3D kstrtouint(buf, 0, &state);
+=09if (err)
+=09=09return err;
+
+=09err =3D write_ec_cmd(priv->adev->handle, VPCCMD_W_CAMERA, state);
+=09if (err)
+=09=09return err;
=20
-=09ret =3D kstrtouint(buf, 0, &state);
-=09if (ret)
-=09=09return ret;
-=09ret =3D write_ec_cmd(priv->adev->handle, VPCCMD_W_CAMERA, state);
-=09if (ret)
-=09=09return ret;
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
+static ssize_t fan_mode_show(struct device *dev,
+=09=09=09     struct device_attribute *attr,
+=09=09=09     char *buf)
 {
-=09unsigned long result;
 =09struct ideapad_private *priv =3D dev_get_drvdata(dev);
+=09unsigned long result;
 =09int err;
=20
 =09err =3D read_ec_data(priv->adev->handle, VPCCMD_R_FAN, &result);
 =09if (err)
 =09=09return err;
+
 =09return sysfs_emit(buf, "%lu\n", result);
 }
=20
-static ssize_t store_ideapad_fan(struct device *dev,
-=09=09=09=09 struct device_attribute *attr,
-=09=09=09=09 const char *buf, size_t count)
+static ssize_t fan_mode_store(struct device *dev,
+=09=09=09      struct device_attribute *attr,
+=09=09=09      const char *buf, size_t count)
 {
-=09int ret;
 =09struct ideapad_private *priv =3D dev_get_drvdata(dev);
 =09unsigned int state;
+=09int err;
+
+=09err =3D kstrtouint(buf, 0, &state);
+=09if (err)
+=09=09return err;
=20
-=09ret =3D kstrtouint(buf, 0, &state);
-=09if (ret)
-=09=09return ret;
 =09if (state > 4 || state =3D=3D 3)
 =09=09return -EINVAL;
-=09ret =3D write_ec_cmd(priv->adev->handle, VPCCMD_W_FAN, state);
-=09if (ret)
-=09=09return ret;
+
+=09err =3D write_ec_cmd(priv->adev->handle, VPCCMD_W_FAN, state);
+=09if (err)
+=09=09return err;
+
 =09return count;
 }
=20
-static DEVICE_ATTR(fan_mode, 0644, show_ideapad_fan, store_ideapad_fan);
+static DEVICE_ATTR_RW(fan_mode);
=20
 static ssize_t touchpad_show(struct device *dev,
 =09=09=09     struct device_attribute *attr,
@@ -441,6 +473,7 @@ static ssize_t touchpad_show(struct device *dev,
 =09err =3D read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &result);
 =09if (err)
 =09=09return err;
+
 =09return sysfs_emit(buf, "%lu\n", result);
 }
=20
@@ -450,23 +483,24 @@ static ssize_t touchpad_store(struct device *dev,
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
+=09err =3D write_ec_cmd(priv->adev->handle, VPCCMD_W_TOUCHPAD, state);
+=09if (err)
+=09=09return err;
=20
-=09ret =3D write_ec_cmd(priv->adev->handle, VPCCMD_W_TOUCHPAD, state);
-=09if (ret)
-=09=09return ret;
 =09return count;
 }
=20
 static DEVICE_ATTR_RW(touchpad);
=20
 static ssize_t conservation_mode_show(struct device *dev,
-=09=09=09=09struct device_attribute *attr,
-=09=09=09=09char *buf)
+=09=09=09=09      struct device_attribute *attr,
+=09=09=09=09      char *buf)
 {
 =09struct ideapad_private *priv =3D dev_get_drvdata(dev);
 =09unsigned long result;
@@ -475,25 +509,27 @@ static ssize_t conservation_mode_show(struct device *=
dev,
 =09err =3D eval_gbmd(priv->adev->handle, &result);
 =09if (err)
 =09=09return err;
+
 =09return sysfs_emit(buf, "%u\n", test_bit(GBMD_CONSERVATION_STATE_BIT, &r=
esult));
 }
=20
 static ssize_t conservation_mode_store(struct device *dev,
-=09=09=09=09 struct device_attribute *attr,
-=09=09=09=09 const char *buf, size_t count)
+=09=09=09=09       struct device_attribute *attr,
+=09=09=09=09       const char *buf, size_t count)
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
=20
-=09ret =3D eval_smbc(priv->adev->handle,
+=09err =3D eval_smbc(priv->adev->handle,
 =09=09=09state ? SMBC_CONSERVATION_ON : SMBC_CONSERVATION_OFF);
-=09if (ret)
-=09=09return ret;
+=09if (err)
+=09=09return err;
+
 =09return count;
 }
=20
@@ -505,10 +541,11 @@ static ssize_t fn_lock_show(struct device *dev,
 {
 =09struct ideapad_private *priv =3D dev_get_drvdata(dev);
 =09unsigned long hals;
-=09int fail =3D eval_hals(priv->adev->handle, &hals);
+=09int err;
=20
-=09if (fail)
-=09=09return fail;
+=09err =3D eval_hals(priv->adev->handle, &hals);
+=09if (err)
+=09=09return err;
=20
 =09return sysfs_emit(buf, "%u\n", test_bit(HALS_FNLOCK_STATE_BIT, &hals));
 }
@@ -519,22 +556,22 @@ static ssize_t fn_lock_store(struct device *dev,
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
=20
-=09ret =3D eval_sals(priv->adev->handle,
+=09err =3D eval_sals(priv->adev->handle,
 =09=09=09state ? SALS_FNLOCK_ON : SALS_FNLOCK_OFF);
-=09if (ret)
-=09=09return ret;
+=09if (err)
+=09=09return err;
+
 =09return count;
 }
=20
 static DEVICE_ATTR_RW(fn_lock);
=20
-
 static struct attribute *ideapad_attributes[] =3D {
 =09&dev_attr_camera_power.attr,
 =09&dev_attr_fan_mode.attr,
@@ -618,16 +655,16 @@ static void ideapad_sync_rfk_state(struct ideapad_pri=
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
 =09=09write_ec_cmd(priv->adev->handle,
 =09=09=09     ideapad_rfk_data[dev].opcode, 1);
 =09=09return 0;
 =09}
+
 =09priv->rfk_priv[dev].dev =3D dev;
 =09priv->rfk_priv[dev].priv =3D priv;
=20
@@ -639,19 +676,19 @@ static int ideapad_register_rfkill(struct ideapad_pri=
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
 1,
+=09=09=09   &rf_enabled);
+=09if (err)
+=09=09rf_enabled =3D 1;
+
+=09rfkill_init_sw_state(priv->rfk[dev], !rf_enabled);
=20
-=09ret =3D rfkill_register(priv->rfk[dev]);
-=09if (ret) {
+=09err =3D rfkill_register(priv->rfk[dev]);
+=09if (err) {
 =09=09rfkill_destroy(priv->rfk[dev]);
-=09=09return ret;
+=09=09return err;
 =09}
+
 =09return 0;
 }
=20
@@ -670,7 +707,7 @@ static void ideapad_unregister_rfkill(struct ideapad_pr=
ivate *priv, int dev)
 static int ideapad_sysfs_init(struct ideapad_private *priv)
 {
 =09return sysfs_create_group(&priv->platform_device->dev.kobj,
-=09=09=09=09    &ideapad_attribute_group);
+=09=09=09=09  &ideapad_attribute_group);
 }
=20
 static void ideapad_sysfs_exit(struct ideapad_private *priv)
@@ -696,13 +733,13 @@ static const struct key_entry ideapad_keymap[] =3D {
 =09{ KE_KEY, 67, { KEY_TOUCHPAD_ON } },
 =09{ KE_KEY, 128, { KEY_ESC } },
=20
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
@@ -713,15 +750,15 @@ static int ideapad_input_init(struct ideapad_private =
*priv)
 =09inputdev->id.bustype =3D BUS_HOST;
 =09inputdev->dev.parent =3D &priv->platform_device->dev;
=20
-=09error =3D sparse_keymap_setup(inputdev, ideapad_keymap, NULL);
-=09if (error) {
+=09err =3D sparse_keymap_setup(inputdev, ideapad_keymap, NULL);
+=09if (err) {
 =09=09dev_err(&priv->platform_device->dev,
 =09=09=09"Unable to setup input device keymap\n");
 =09=09goto err_free_dev;
 =09}
=20
-=09error =3D input_register_device(inputdev);
-=09if (error) {
+=09err =3D input_register_device(inputdev);
+=09if (err) {
 =09=09dev_err(&priv->platform_device->dev,
 =09=09=09"Unable to register input device\n");
 =09=09goto err_free_dev;
@@ -732,7 +769,7 @@ static int ideapad_input_init(struct ideapad_private *p=
riv)
=20
 err_free_dev:
 =09input_free_device(inputdev);
-=09return error;
+=09return err;
 }
=20
 static void ideapad_input_exit(struct ideapad_private *priv)
@@ -753,6 +790,7 @@ static void ideapad_input_novokey(struct ideapad_privat=
e *priv)
=20
 =09if (read_ec_data(priv->adev->handle, VPCCMD_R_NOVO, &long_pressed))
 =09=09return;
+
 =09if (long_pressed)
 =09=09ideapad_input_report(priv, 17);
 =09else
@@ -815,6 +853,7 @@ static int ideapad_backlight_update_status(struct backl=
ight_device *blightdev)
 =09=09=09   blightdev->props.brightness);
 =09if (err)
 =09=09return err;
+
 =09err =3D write_ec_cmd(priv->adev->handle, VPCCMD_W_BL_POWER,
 =09=09=09   blightdev->props.power !=3D FB_BLANK_POWERDOWN);
 =09if (err)
@@ -875,13 +914,15 @@ static void ideapad_backlight_exit(struct ideapad_pri=
vate *priv)
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
@@ -890,12 +931,10 @@ static void ideapad_backlight_notify_brightness(struc=
t ideapad_private *priv)
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
@@ -910,13 +949,15 @@ static void ideapad_sync_touchpad_state(struct ideapa=
d_private *priv)
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
+=09=09i8042_command(&param,
+=09=09=09      value ? I8042_CMD_AUX_ENABLE : I8042_CMD_AUX_DISABLE);
 =09=09ideapad_input_report(priv, value ? 67 : 66);
 =09}
 }
@@ -960,7 +1001,8 @@ static void ideapad_acpi_notify(acpi_handle handle, u3=
2 event, void *data)
 =09=09=09ideapad_check_special_buttons(priv);
 =09=09=09break;
 =09=09case 1:
-=09=09=09/* Some IdeaPads report event 1 every ~20
+=09=09=09/*
+=09=09=09 * Some IdeaPads report event 1 every ~20
 =09=09=09 * seconds while on battery power; some
 =09=09=09 * report this when changing to/from tablet
 =09=09=09 * mode. Squelch this event.
@@ -1033,14 +1075,14 @@ static void ideapad_check_features(struct ideapad_p=
rivate *priv)
=20
 static int ideapad_acpi_add(struct platform_device *pdev)
 {
-=09int ret, i;
-=09unsigned long cfg;
 =09struct ideapad_private *priv;
 =09struct acpi_device *adev;
 =09acpi_status acpi_err;
+=09unsigned long cfg;
+=09int err, i;
=20
-=09ret =3D acpi_bus_get_device(ACPI_HANDLE(&pdev->dev), &adev);
-=09if (ret)
+=09err =3D acpi_bus_get_device(ACPI_HANDLE(&pdev->dev), &adev);
+=09if (err)
 =09=09return -ENODEV;
=20
 =09if (eval_int(adev->handle, "_CFG", &cfg))
@@ -1057,14 +1099,14 @@ static int ideapad_acpi_add(struct platform_device =
*pdev)
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
@@ -1086,14 +1128,16 @@ static int ideapad_acpi_add(struct platform_device =
*pdev)
 =09ideapad_sync_touchpad_state(priv);
=20
 =09if (acpi_video_get_backlight_type() =3D=3D acpi_backlight_vendor) {
-=09=09ret =3D ideapad_backlight_init(priv);
-=09=09if (ret && ret !=3D -ENODEV)
+=09=09err =3D ideapad_backlight_init(priv);
+=09=09if (err && err !=3D -ENODEV)
 =09=09=09goto backlight_failed;
 =09}
+
 =09acpi_err =3D acpi_install_notify_handler(adev->handle,
-=09=09=09ACPI_DEVICE_NOTIFY, ideapad_acpi_notify, priv);
+=09=09=09=09=09       ACPI_DEVICE_NOTIFY,
+=09=09=09=09=09       ideapad_acpi_notify, priv);
 =09if (ACPI_FAILURE(acpi_err)) {
-=09=09ret =3D -EIO;
+=09=09err =3D -EIO;
 =09=09goto notification_failed;
 =09}
=20
@@ -1106,28 +1150,36 @@ static int ideapad_acpi_add(struct platform_device =
*pdev)
 =09=09=09break;
 =09=09}
 =09}
+
 =09if (ACPI_FAILURE(acpi_err) && acpi_err !=3D AE_NOT_EXIST) {
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
@@ -1139,11 +1191,15 @@ static int ideapad_acpi_remove(struct platform_devi=
ce *pdev)
 =09if (priv->fnesc_guid)
 =09=09wmi_remove_notify_handler(priv->fnesc_guid);
 #endif
+
 =09acpi_remove_notify_handler(priv->adev->handle,
-=09=09ACPI_DEVICE_NOTIFY, ideapad_acpi_notify);
+=09=09=09=09   ACPI_DEVICE_NOTIFY,
+=09=09=09=09   ideapad_acpi_notify);
 =09ideapad_backlight_exit(priv);
+
 =09for (i =3D 0; i < IDEAPAD_RFKILL_DEV_NUM; i++)
 =09=09ideapad_unregister_rfkill(priv, i);
+
 =09ideapad_input_exit(priv);
 =09ideapad_debugfs_exit(priv);
 =09ideapad_sysfs_exit(priv);
@@ -1158,18 +1214,20 @@ static int ideapad_acpi_resume(struct device *devic=
e)
=20
 =09if (!device)
 =09=09return -EINVAL;
+
 =09priv =3D dev_get_drvdata(device);
=20
 =09ideapad_sync_rfk_state(priv);
 =09ideapad_sync_touchpad_state(priv);
+
 =09return 0;
 }
 #endif
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


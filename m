Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0D1AC433E0
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 21:57:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F9E164E4E
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 21:57:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232467AbhBCV5U (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 3 Feb 2021 16:57:20 -0500
Received: from mail1.protonmail.ch ([185.70.40.18]:61821 "EHLO
        mail1.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232376AbhBCV5C (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 16:57:02 -0500
Date:   Wed, 03 Feb 2021 21:56:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1612389378;
        bh=CTIglaHxRXQDh+Zq6I880PTmpspSRZj5ejmlz+E39jY=;
        h=Date:To:From:Reply-To:Subject:From;
        b=ob3hQjHeoZDIKOuSiYW28lHT34ILrlEKu75VuD/Llbo8+1YnmyzsYz6RnzgT9HKk4
         70DW+7hWwQb5mK+DyHVHR/TUNbzOYODMlB5E9evac5jHYSjhqdkXkJSekOcJYc8OHr
         YVggxa793fa48ybIazRFgoZRf6p9vZNxNN6UpSdc=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v3 18/29] platform/x86: ideapad-laptop: rework is_visible() logic
Message-ID: <20210203215403.290792-19-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Store the supported features in the driver private
data, and modify the is_visible() callback to use it,
and create ideapad_check_features() to populate it.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index c8ab660cdacc..77a8e19441ed 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -115,9 +115,15 @@ struct ideapad_private {
 =09struct ideapad_dytc_priv *dytc;
 =09struct dentry *debug;
 =09unsigned long cfg;
-=09bool has_hw_rfkill_switch;
-=09bool has_touchpad_switch;
 =09const char *fnesc_guid;
+=09struct {
+=09=09bool conservation_mode    : 1;
+=09=09bool dytc                 : 1;
+=09=09bool fan_mode             : 1;
+=09=09bool fn_lock              : 1;
+=09=09bool hw_rfkill_switch     : 1;
+=09=09bool touchpad_ctrl_via_ec : 1;
+=09} features;
 };
=20
 static bool no_bt_rfkill;
@@ -563,24 +569,18 @@ static umode_t ideapad_is_visible(struct kobject *kob=
j,
 {
 =09struct device *dev =3D kobj_to_dev(kobj);
 =09struct ideapad_private *priv =3D dev_get_drvdata(dev);
-=09bool supported;
+=09bool supported =3D true;
=20
 =09if (attr =3D=3D &dev_attr_camera_power.attr)
 =09=09supported =3D test_bit(CFG_CAP_CAM_BIT, &priv->cfg);
-=09else if (attr =3D=3D &dev_attr_fan_mode.attr) {
-=09=09unsigned long value;
-=09=09supported =3D !read_ec_data(priv->adev->handle, VPCCMD_R_FAN,
-=09=09=09=09=09  &value);
-=09} else if (attr =3D=3D &dev_attr_conservation_mode.attr) {
-=09=09supported =3D acpi_has_method(priv->adev->handle, "GBMD") &&
-=09=09=09    acpi_has_method(priv->adev->handle, "SBMC");
-=09} else if (attr =3D=3D &dev_attr_fn_lock.attr) {
-=09=09supported =3D acpi_has_method(priv->adev->handle, "HALS") &&
-=09=09=09acpi_has_method(priv->adev->handle, "SALS");
-=09} else if (attr =3D=3D &dev_attr_touchpad.attr)
-=09=09supported =3D priv->has_touchpad_switch;
-=09else
-=09=09supported =3D true;
+=09else if (attr =3D=3D &dev_attr_conservation_mode.attr)
+=09=09supported =3D priv->features.conservation_mode;
+=09else if (attr =3D=3D &dev_attr_fan_mode.attr)
+=09=09supported =3D priv->features.fan_mode;
+=09else if (attr =3D=3D &dev_attr_fn_lock.attr)
+=09=09supported =3D priv->features.fn_lock;
+=09else if (attr =3D=3D &dev_attr_touchpad.attr)
+=09=09supported =3D priv->features.touchpad_ctrl_via_ec;
=20
 =09return supported ? attr->mode : 0;
 }
@@ -784,6 +784,9 @@ static int ideapad_dytc_profile_init(struct ideapad_pri=
vate *priv)
 =09int err, dytc_version;
 =09unsigned long output;
=20
+=09if (!priv->features.dytc)
+=09=09return -ENODEV;
+
 =09err =3D eval_dytc(priv->adev->handle, DYTC_CMD_QUERY, &output);
 =09/* For all other errors we can flag the failure */
 =09if (err)
@@ -873,7 +876,7 @@ static void ideapad_sync_rfk_state(struct ideapad_priva=
te *priv)
 =09unsigned long hw_blocked =3D 0;
 =09int i;
=20
-=09if (priv->has_hw_rfkill_switch) {
+=09if (priv->features.hw_rfkill_switch) {
 =09=09if (read_ec_data(priv->adev->handle, VPCCMD_R_RF, &hw_blocked))
 =09=09=09return;
 =09=09hw_blocked =3D !hw_blocked;
@@ -1167,7 +1170,7 @@ static void ideapad_sync_touchpad_state(struct ideapa=
d_private *priv)
 {
 =09unsigned long value;
=20
-=09if (!priv->has_touchpad_switch)
+=09if (!priv->features.touchpad_ctrl_via_ec)
 =09=09return;
=20
 =09/* Without reading from EC touchpad LED doesn't switch state */
@@ -1271,6 +1274,29 @@ static const struct dmi_system_id hw_rfkill_list[] =
=3D {
 =09{}
 };
=20
+static void ideapad_check_features(struct ideapad_private *priv)
+{
+=09acpi_handle handle =3D priv->adev->handle;
+=09unsigned long val;
+
+=09priv->features.hw_rfkill_switch =3D dmi_check_system(hw_rfkill_list);
+
+=09/* Most ideapads with ELAN0634 touchpad don't use EC touchpad switch */
+=09priv->features.touchpad_ctrl_via_ec =3D !acpi_dev_present("ELAN0634", N=
ULL, -1);
+
+=09if (!read_ec_data(handle, VPCCMD_R_FAN, &val))
+=09=09priv->features.fan_mode =3D true;
+
+=09if (acpi_has_method(handle, "GBMD") && acpi_has_method(handle, "SBMC"))
+=09=09priv->features.conservation_mode =3D true;
+
+=09if (acpi_has_method(handle, "DYTC"))
+=09=09priv->features.dytc =3D true;
+
+=09if (acpi_has_method(handle, "HALS") && acpi_has_method(handle, "SALS"))
+=09=09priv->features.fn_lock =3D true;
+}
+
 static int ideapad_acpi_add(struct platform_device *pdev)
 {
 =09int ret, i;
@@ -1294,10 +1320,8 @@ static int ideapad_acpi_add(struct platform_device *=
pdev)
 =09priv->cfg =3D cfg;
 =09priv->adev =3D adev;
 =09priv->platform_device =3D pdev;
-=09priv->has_hw_rfkill_switch =3D dmi_check_system(hw_rfkill_list);
=20
-=09/* Most ideapads with ELAN0634 touchpad don't use EC touchpad switch */
-=09priv->has_touchpad_switch =3D !acpi_dev_present("ELAN0634", NULL, -1);
+=09ideapad_check_features(priv);
=20
 =09ret =3D ideapad_sysfs_init(priv);
 =09if (ret)
@@ -1313,11 +1337,11 @@ static int ideapad_acpi_add(struct platform_device =
*pdev)
 =09 * On some models without a hw-switch (the yoga 2 13 at least)
 =09 * VPCCMD_W_RF must be explicitly set to 1 for the wifi to work.
 =09 */
-=09if (!priv->has_hw_rfkill_switch)
+=09if (!priv->features.hw_rfkill_switch)
 =09=09write_ec_cmd(priv->adev->handle, VPCCMD_W_RF, 1);
=20
 =09/* The same for Touchpad */
-=09if (!priv->has_touchpad_switch)
+=09if (!priv->features.touchpad_ctrl_via_ec)
 =09=09write_ec_cmd(priv->adev->handle, VPCCMD_W_TOUCHPAD, 1);
=20
 =09for (i =3D 0; i < IDEAPAD_RFKILL_DEV_NUM; i++)
@@ -1327,7 +1351,13 @@ static int ideapad_acpi_add(struct platform_device *=
pdev)
 =09ideapad_sync_rfk_state(priv);
 =09ideapad_sync_touchpad_state(priv);
=20
-=09ideapad_dytc_profile_init(priv);
+=09ret =3D ideapad_dytc_profile_init(priv);
+=09if (ret) {
+=09=09if (ret !=3D -ENODEV)
+=09=09=09dev_warn(&pdev->dev, "Could not set up DYTC interface: %d\n", ret=
);
+=09=09else
+=09=09=09dev_info(&pdev->dev, "DYTC interface is not available\n");
+=09}
=20
 =09if (acpi_video_get_backlight_type() =3D=3D acpi_backlight_vendor) {
 =09=09ret =3D ideapad_backlight_init(priv);
--=20
2.30.0



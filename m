Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8BABC433DB
	for <platform-driver-x86@archiver.kernel.org>; Wed, 13 Jan 2021 18:22:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B75082343E
	for <platform-driver-x86@archiver.kernel.org>; Wed, 13 Jan 2021 18:22:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727785AbhAMSW6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 13 Jan 2021 13:22:58 -0500
Received: from mail2.protonmail.ch ([185.70.40.22]:52658 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726385AbhAMSW6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Jan 2021 13:22:58 -0500
Date:   Wed, 13 Jan 2021 18:21:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1610562111;
        bh=vp9uEKkUhqrTJs6wmjxS71ZUosdJefwI9tYJ9zSNYuQ=;
        h=Date:To:From:Reply-To:Subject:From;
        b=r2iekdHIOod1x5AzV51lXsxpaCSzfMAPZlWuFdduAiCxDwl4rtBK2gnuTefgLu5oq
         5UGVvySWbt6O0jM6IRKESEQx0AJJX7TRuywbFaUuR1B8eFX+/LMA78D4Niufib08Nz
         2aSP+opVnMO+KXc70XGnLvxO3Fu+0d7Yo4Pk9s3g=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v2 13/24] platform/x86: ideapad-laptop: rework is_visible() logic
Message-ID: <20210113182016.166049-14-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Store the supported features in the driver private data, and modify the
is_visible() callback to use it, and create ideapad_check_features() to
populate it.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index c3234e0931a9..15d070b503dc 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -105,9 +105,14 @@ struct ideapad_private {
 =09struct backlight_device *blightdev;
 =09struct dentry *debug;
 =09unsigned long cfg;
-=09bool has_hw_rfkill_switch;
-=09bool has_touchpad_switch;
 =09const char *fnesc_guid;
+=09struct {
+=09=09bool hw_rfkill_switch     : 1,
+=09=09     fan_mode             : 1,
+=09=09     touchpad_ctrl_via_ec : 1,
+=09=09     conservation_mode    : 1,
+=09=09     fn_lock              : 1;
+=09} features;
 };
=20
 static bool no_bt_rfkill;
@@ -545,24 +550,18 @@ static umode_t ideapad_is_visible(struct kobject *kob=
j,
 {
 =09struct device *dev =3D container_of(kobj, struct device, kobj);
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
+=09else if (attr =3D=3D &dev_attr_fan_mode.attr)
+=09=09supported =3D priv->features.fan_mode;
+=09else if (attr =3D=3D &dev_attr_touchpad.attr)
+=09=09supported =3D priv->features.touchpad_ctrl_via_ec;
+=09else if (attr =3D=3D &dev_attr_conservation_mode.attr)
+=09=09supported =3D priv->features.conservation_mode;
+=09else if (attr =3D=3D &dev_attr_fn_lock.attr)
+=09=09supported =3D priv->features.fn_lock;
=20
 =09return supported ? attr->mode : 0;
 }
@@ -605,7 +604,7 @@ static void ideapad_sync_rfk_state(struct ideapad_priva=
te *priv)
 =09unsigned long hw_blocked =3D 0;
 =09int i;
=20
-=09if (priv->has_hw_rfkill_switch) {
+=09if (priv->features.hw_rfkill_switch) {
 =09=09if (read_ec_data(priv->adev->handle, VPCCMD_R_RF, &hw_blocked))
 =09=09=09return;
 =09=09hw_blocked =3D !hw_blocked;
@@ -905,7 +904,7 @@ static void ideapad_sync_touchpad_state(struct ideapad_=
private *priv)
 {
 =09unsigned long value;
=20
-=09if (!priv->has_touchpad_switch)
+=09if (!priv->features.touchpad_ctrl_via_ec)
 =09=09return;
=20
 =09/* Without reading from EC touchpad LED doesn't switch state */
@@ -1008,6 +1007,26 @@ static const struct dmi_system_id hw_rfkill_list[] =
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
+=09if (!read_ec_data(handle, VPCCMD_R_FAN, &val))
+=09=09priv->features.fan_mode =3D true;
+
+=09/* Most ideapads with ELAN0634 touchpad don't use EC touchpad switch */
+=09priv->features.touchpad_ctrl_via_ec =3D !acpi_dev_present("ELAN0634", N=
ULL, -1);
+
+=09if (acpi_has_method(handle, "GBMD") && acpi_has_method(handle, "SBMC"))
+=09=09priv->features.conservation_mode =3D true;
+
+=09if (acpi_has_method(handle, "HALS") && acpi_has_method(handle, "SALS"))
+=09=09priv->features.fn_lock =3D true;
+}
+
 static int ideapad_acpi_add(struct platform_device *pdev)
 {
 =09int ret, i;
@@ -1031,10 +1050,8 @@ static int ideapad_acpi_add(struct platform_device *=
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
@@ -1050,11 +1067,11 @@ static int ideapad_acpi_add(struct platform_device =
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
--=20
2.30.0



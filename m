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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D20DC433E9
	for <platform-driver-x86@archiver.kernel.org>; Wed, 13 Jan 2021 18:23:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C6D192343F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 13 Jan 2021 18:23:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727560AbhAMSXY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 13 Jan 2021 13:23:24 -0500
Received: from mail2.protonmail.ch ([185.70.40.22]:53177 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728016AbhAMSXY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Jan 2021 13:23:24 -0500
Date:   Wed, 13 Jan 2021 18:22:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1610562160;
        bh=DY43qlnV4V/jkod+VKvUB82WxK9UbINZIGvTYTvlDM8=;
        h=Date:To:From:Reply-To:Subject:From;
        b=ED7heM9r4X855TDd72dbpuaMWI922fqXYbaQBfHIAxVxJX5gICkO1ffEk/GAUshfe
         7x7261nQUJBCADszrBN0stR9etRnvJp//6QPvUwDseEkfFjqr7u+M2I/KzRowINEBV
         /OUuyevhi0xdi2Wv7Va9KVywDMnBjlDNb5PinrXg=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v2 21/24] platform/x86: ideapad-laptop: add keyboard backlight control support
Message-ID: <20210113182016.166049-22-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On certain models it is possible to control/query the keyboard backlight
via the SALS/HALS ACPI methods. Add support for that, and register an LED
class device to expose this functionality.
Tested on: Lenovo YOGA 520-14IKB 80X8

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 91e6176cdfbd..6192bf42a87d 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -624,6 +624,8 @@ config IDEAPAD_LAPTOP
 =09depends on BACKLIGHT_CLASS_DEVICE
 =09depends on ACPI_VIDEO || ACPI_VIDEO =3D n
 =09depends on ACPI_WMI || ACPI_WMI =3D n
+=09select NEW_LEDS
+=09select LEDS_CLASS
 =09select INPUT_SPARSEKMAP
 =09help
 =09  This is a driver for Lenovo IdeaPad netbooks contains drivers for
diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index e1ab5c2e982f..7a0dbafe5dfc 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -21,6 +21,7 @@
 #include <linux/input/sparse-keymap.h>
 #include <linux/jiffies.h>
 #include <linux/kernel.h>
+#include <linux/leds.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/rfkill.h>
@@ -30,6 +31,8 @@
=20
 #include <acpi/video.h>
=20
+#include <dt-bindings/leds/common.h>
+
 #define IDEAPAD_RFKILL_DEV_NUM=09(3)
=20
 #if IS_ENABLED(CONFIG_ACPI_WMI)
@@ -57,12 +60,16 @@ enum {
 };
=20
 enum {
+=09HALS_KBD_BL_SUPPORT_BIT  =3D 4,
+=09HALS_KBD_BL_STATE_BIT    =3D 5,
 =09HALS_FNLOCK_SUPPORT_BIT  =3D 9,
 =09HALS_FNLOCK_STATE_BIT    =3D 10,
 =09HALS_HOTKEYS_PRIMARY_BIT =3D 11,
 };
=20
 enum {
+=09SALS_KBD_BL_ON  =3D 0x8,
+=09SALS_KBD_BL_OFF =3D 0x9,
 =09SALS_FNLOCK_ON  =3D 0xe,
 =09SALS_FNLOCK_OFF =3D 0xf,
 };
@@ -114,8 +121,14 @@ struct ideapad_private {
 =09=09     fan_mode             : 1,
 =09=09     touchpad_ctrl_via_ec : 1,
 =09=09     conservation_mode    : 1,
-=09=09     fn_lock              : 1;
+=09=09     fn_lock              : 1,
+=09=09     kbd_bl               : 1;
 =09} features;
+=09struct {
+=09=09bool initialized;
+=09=09struct led_classdev led;
+=09=09unsigned int last_brightness;
+=09} kbd_bl;
 };
=20
 static bool no_bt_rfkill;
@@ -937,6 +950,105 @@ static void ideapad_backlight_notify_brightness(struc=
t ideapad_private *priv)
 =09=09backlight_force_update(priv->blightdev, BACKLIGHT_UPDATE_HOTKEY);
 }
=20
+/*
+ * keyboard backlight
+ */
+static int ideapad_kbd_bl_brightness_get(struct ideapad_private *priv)
+{
+=09unsigned long hals;
+=09int err;
+
+=09err =3D eval_hals(priv->adev->handle, &hals);
+=09if (err)
+=09=09return err;
+
+=09return test_bit(HALS_KBD_BL_STATE_BIT, &hals);
+}
+
+static enum led_brightness ideapad_kbd_bl_led_cdev_brightness_get(struct l=
ed_classdev *led_cdev)
+{
+=09struct ideapad_private *priv =3D container_of(led_cdev, struct ideapad_=
private, kbd_bl.led);
+
+=09return ideapad_kbd_bl_brightness_get(priv);
+}
+
+static int ideapad_kbd_bl_brightness_set(struct ideapad_private *priv, uns=
igned int brightness)
+{
+=09int err;
+
+=09err =3D eval_sals(priv->adev->handle,
+=09=09=09brightness ? SALS_KBD_BL_ON : SALS_KBD_BL_OFF);
+=09if (err)
+=09=09return err;
+
+=09priv->kbd_bl.last_brightness =3D brightness;
+
+=09return 0;
+}
+
+static int ideapad_kbd_bl_led_cdev_brightness_set(struct led_classdev *led=
_cdev,
+=09=09=09=09=09=09  enum led_brightness brightness)
+{
+=09struct ideapad_private *priv =3D container_of(led_cdev, struct ideapad_=
private, kbd_bl.led);
+
+=09return ideapad_kbd_bl_brightness_set(priv, brightness);
+}
+
+static void ideapad_kbd_bl_notify(struct ideapad_private *priv)
+{
+=09int brightness;
+
+=09if (!priv->kbd_bl.initialized)
+=09=09return;
+
+=09brightness =3D ideapad_kbd_bl_brightness_get(priv);
+=09if (brightness < 0)
+=09=09return;
+
+=09if (brightness =3D=3D priv->kbd_bl.last_brightness)
+=09=09return;
+
+=09priv->kbd_bl.last_brightness =3D brightness;
+
+=09led_classdev_notify_brightness_hw_changed(&priv->kbd_bl.led, brightness=
);
+}
+
+static int ideapad_kbd_bl_init(struct ideapad_private *priv)
+{
+=09int err;
+
+=09if (!priv->features.kbd_bl)
+=09=09return -ENODEV;
+
+=09err =3D ideapad_kbd_bl_brightness_get(priv);
+=09if (err < 0)
+=09=09return err;
+
+=09priv->kbd_bl.last_brightness =3D err;
+
+=09priv->kbd_bl.led.name                    =3D "platform::" LED_FUNCTION_=
KBD_BACKLIGHT;
+=09priv->kbd_bl.led.max_brightness          =3D 1;
+=09priv->kbd_bl.led.brightness_get          =3D ideapad_kbd_bl_led_cdev_br=
ightness_get;
+=09priv->kbd_bl.led.brightness_set_blocking =3D ideapad_kbd_bl_led_cdev_br=
ightness_set;
+=09priv->kbd_bl.led.flags                   =3D LED_BRIGHT_HW_CHANGED;
+
+=09err =3D led_classdev_register(&priv->platform_device->dev, &priv->kbd_b=
l.led);
+=09if (err)
+=09=09return err;
+
+=09priv->kbd_bl.initialized =3D true;
+
+=09return 0;
+}
+
+static void ideapad_kbd_bl_exit(struct ideapad_private *priv)
+{
+=09if (!priv->kbd_bl.initialized)
+=09=09return;
+
+=09led_classdev_unregister(&priv->kbd_bl.led);
+}
+
 /*
  * module init/exit
  */
@@ -1006,8 +1118,9 @@ static void ideapad_acpi_notify(acpi_handle handle, u=
32 event, void *data)
 =09=09=09 * Some IdeaPads report event 1 every ~20
 =09=09=09 * seconds while on battery power; some
 =09=09=09 * report this when changing to/from tablet
-=09=09=09 * mode. Squelch this event.
+=09=09=09 * mode.
 =09=09=09 */
+=09=09=09ideapad_kbd_bl_notify(priv);
 =09=09=09break;
 =09=09default:
 =09=09=09dev_warn(&priv->platform_device->dev,
@@ -1068,9 +1181,13 @@ static void ideapad_check_features(struct ideapad_pr=
ivate *priv)
 =09=09priv->features.conservation_mode =3D true;
=20
 =09if (acpi_has_method(handle, "HALS") && acpi_has_method(handle, "SALS"))=
 {
-=09=09if (!eval_hals(handle, &val))
+=09=09if (!eval_hals(handle, &val)) {
 =09=09=09if (test_bit(HALS_FNLOCK_SUPPORT_BIT, &val))
 =09=09=09=09priv->features.fn_lock =3D true;
+
+=09=09=09if (test_bit(HALS_KBD_BL_SUPPORT_BIT, &val))
+=09=09=09=09priv->features.kbd_bl =3D true;
+=09=09}
 =09}
 }
=20
@@ -1110,6 +1227,11 @@ static int ideapad_acpi_add(struct platform_device *=
pdev)
 =09if (err)
 =09=09goto input_failed;
=20
+=09err =3D ideapad_kbd_bl_init(priv);
+=09if (err && err !=3D -ENODEV)
+=09=09dev_warn(&pdev->dev,
+=09=09=09 "Could not register keyboard backlight led: %d\n", err);
+
 =09/*
 =09 * On some models without a hw-switch (the yoga 2 13 at least)
 =09 * VPCCMD_W_RF must be explicitly set to 1 for the wifi to work.
@@ -1174,6 +1296,7 @@ static int ideapad_acpi_add(struct platform_device *p=
dev)
 =09for (i =3D 0; i < IDEAPAD_RFKILL_DEV_NUM; i++)
 =09=09ideapad_unregister_rfkill(priv, i);
=20
+=09ideapad_kbd_bl_exit(priv);
 =09ideapad_input_exit(priv);
=20
 input_failed:
@@ -1201,6 +1324,7 @@ static int ideapad_acpi_remove(struct platform_device=
 *pdev)
 =09for (i =3D 0; i < IDEAPAD_RFKILL_DEV_NUM; i++)
 =09=09ideapad_unregister_rfkill(priv, i);
=20
+=09ideapad_kbd_bl_exit(priv);
 =09ideapad_input_exit(priv);
 =09ideapad_debugfs_exit(priv);
 =09ideapad_sysfs_exit(priv);
--=20
2.30.0



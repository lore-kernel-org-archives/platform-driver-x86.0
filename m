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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C81AC433E0
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 21:57:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD14364D90
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 21:57:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232430AbhBCV5e (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 3 Feb 2021 16:57:34 -0500
Received: from mail-40134.protonmail.ch ([185.70.40.134]:18733 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232437AbhBCV51 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 16:57:27 -0500
Date:   Wed, 03 Feb 2021 21:57:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1612389429;
        bh=WIG875gim8mu7dwTflhai9jDItpRN/nZ3N/G6mWSqZ4=;
        h=Date:To:From:Reply-To:Subject:From;
        b=jp5QBBWrE7gbLXMowfdwTLwG6rUvyycIRX0CEQJFdBg5i2pnRkxgCg4IFUPA0t2tU
         1xX4y4Vhq8Fgx/TLtctQur3PCCVvHn5WfqstejAvlG867032dxCHWeLyrDQN1MOvQI
         pPMDTVCqnb1CfhI2+nBD/EHWM4bBJN70+NjQFvwE=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v3 26/29] platform/x86: ideapad-laptop: add keyboard backlight control support
Message-ID: <20210203215403.290792-27-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On certain models it is possible to control/query the
keyboard backlight via the SALS/HALS ACPI methods. Add
support for that, and register an LED class device to expose
this functionality. Tested on: Lenovo YOGA 520-14IKB 80X8

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index 76b723f32c84..c3f1b621c92f 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -11,6 +11,7 @@
 #include <linux/acpi.h>
 #include <linux/backlight.h>
 #include <linux/bitops.h>
+#include <linux/bug.h>
 #include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/dmi.h>
@@ -22,6 +23,7 @@
 #include <linux/input/sparse-keymap.h>
 #include <linux/jiffies.h>
 #include <linux/kernel.h>
+#include <linux/leds.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/platform_profile.h>
@@ -32,6 +34,8 @@
=20
 #include <acpi/video.h>
=20
+#include <dt-bindings/leds/common.h>
+
 #define IDEAPAD_RFKILL_DEV_NUM=093
=20
 #if IS_ENABLED(CONFIG_ACPI_WMI)
@@ -59,12 +63,16 @@ enum {
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
@@ -125,8 +133,14 @@ struct ideapad_private {
 =09=09bool fan_mode             : 1;
 =09=09bool fn_lock              : 1;
 =09=09bool hw_rfkill_switch     : 1;
+=09=09bool kbd_bl               : 1;
 =09=09bool touchpad_ctrl_via_ec : 1;
 =09} features;
+=09struct {
+=09=09bool initialized;
+=09=09struct led_classdev led;
+=09=09unsigned int last_brightness;
+=09} kbd_bl;
 };
=20
 static bool no_bt_rfkill;
@@ -1203,6 +1217,108 @@ static void ideapad_backlight_notify_brightness(str=
uct ideapad_private *priv)
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
+=09return !!test_bit(HALS_KBD_BL_STATE_BIT, &hals);
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
+=09int err =3D exec_sals(priv->adev->handle, brightness ? SALS_KBD_BL_ON :=
 SALS_KBD_BL_OFF);
+
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
+=09int brightness, err;
+
+=09if (!priv->features.kbd_bl)
+=09=09return -ENODEV;
+
+=09if (WARN_ON(priv->kbd_bl.initialized))
+=09=09return -EEXIST;
+
+=09brightness =3D ideapad_kbd_bl_brightness_get(priv);
+=09if (brightness < 0)
+=09=09return brightness;
+
+=09priv->kbd_bl.last_brightness =3D brightness;
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
+=09priv->kbd_bl.initialized =3D false;
+
+=09led_classdev_unregister(&priv->kbd_bl.led);
+}
+
 /*
  * module init/exit
  */
@@ -1270,8 +1386,10 @@ static void ideapad_acpi_notify(acpi_handle handle, =
u32 event, void *data)
 =09=09=09 * Some IdeaPads report event 1 every ~20
 =09=09=09 * seconds while on battery power; some
 =09=09=09 * report this when changing to/from tablet
-=09=09=09 * mode. Squelch this event.
+=09=09=09 * mode; some report this when the keyboard
+=09=09=09 * backlight has changed.
 =09=09=09 */
+=09=09=09ideapad_kbd_bl_notify(priv);
 =09=09=09break;
 =09=09case 0:
 =09=09=09ideapad_check_special_buttons(priv);
@@ -1341,6 +1459,9 @@ static void ideapad_check_features(struct ideapad_pri=
vate *priv)
 =09=09if (!eval_hals(handle, &val)) {
 =09=09=09if (test_bit(HALS_FNLOCK_SUPPORT_BIT, &val))
 =09=09=09=09priv->features.fn_lock =3D true;
+
+=09=09=09if (test_bit(HALS_KBD_BL_SUPPORT_BIT, &val))
+=09=09=09=09priv->features.kbd_bl =3D true;
 =09=09}
 =09}
 }
@@ -1382,6 +1503,14 @@ static int ideapad_acpi_add(struct platform_device *=
pdev)
 =09if (err)
 =09=09goto input_failed;
=20
+=09err =3D ideapad_kbd_bl_init(priv);
+=09if (err) {
+=09=09if (err !=3D -ENODEV)
+=09=09=09dev_warn(&pdev->dev, "Could not set up keyboard backlight LED: %d=
\n", err);
+=09=09else
+=09=09=09dev_info(&pdev->dev, "Keyboard backlight control not available\n"=
);
+=09}
+
 =09/*
 =09 * On some models without a hw-switch (the yoga 2 13 at least)
 =09 * VPCCMD_W_RF must be explicitly set to 1 for the wifi to work.
@@ -1456,6 +1585,7 @@ static int ideapad_acpi_add(struct platform_device *p=
dev)
 =09for (i =3D 0; i < IDEAPAD_RFKILL_DEV_NUM; i++)
 =09=09ideapad_unregister_rfkill(priv, i);
=20
+=09ideapad_kbd_bl_exit(priv);
 =09ideapad_input_exit(priv);
=20
 input_failed:
@@ -1485,6 +1615,7 @@ static int ideapad_acpi_remove(struct platform_device=
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



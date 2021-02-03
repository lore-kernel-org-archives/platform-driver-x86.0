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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37E8CC433DB
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 21:58:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F391C64E4E
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 21:58:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231807AbhBCV6J (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 3 Feb 2021 16:58:09 -0500
Received: from mail-40134.protonmail.ch ([185.70.40.134]:22808 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232491AbhBCV6F (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 16:58:05 -0500
Date:   Wed, 03 Feb 2021 21:57:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1612389443;
        bh=6i8W0eq7v7CIJ0RXzFn1bJ+I5Imthj5QS63mvNUev+E=;
        h=Date:To:From:Reply-To:Subject:From;
        b=C+Aj1QBtFiHf7nb7YTgZcg6gqjCDhGJWN6VpqWZHdSWYxmx5fuPKIfKXZi2hfLnAg
         mFkxTkllyegNbAFoUW4IgMrBQXyaGf5CU8cDp/GBoNhOQQ47TZcEKvmA1DTC86PsJo
         oEwyDB5E3fKXc8wQ6jvT+3gEciXh1VOmwSJngcdw=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v3 27/29] platform/x86: ideapad-laptop: add "always on USB charging" control support
Message-ID: <20210203215403.290792-28-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Certain models have a so-called "always on USB charging" feature,
which enables USB charging even when the computer is turned off
or suspended, and which may be controlled/queried using the
SALS/HALS ACPI methods. Expose this functionality via a new device
attribute (usb_charging). Tested on: Lenovo YOGA 520-14IKB 80X8

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>

diff --git a/Documentation/ABI/testing/sysfs-platform-ideapad-laptop b/Docu=
mentation/ABI/testing/sysfs-platform-ideapad-laptop
index fd2ac02bc5bd..b17688d73922 100644
--- a/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
+++ b/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
@@ -41,3 +41,12 @@ Description:
=20
 =09=09  # echo "0" >=09\
 =09=09  /sys/bus/pci/devices/0000:00:1f.0/PNP0C09:00/VPC2004:00/fn_lock
+
+What:=09=09/sys/bus/platform/devices/VPC2004:*/usb_charging
+Date:=09=09Feb 2021
+KernelVersion:=095.12
+Contact:=09platform-driver-x86@vger.kernel.org
+Description:
+=09=09Controls whether the "always on USB charging" feature is
+=09=09enabled or not. This feature enables charging USB devices
+=09=09even if the computer is not turned on.
diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index c3f1b621c92f..12a74fddca49 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -63,18 +63,22 @@ enum {
 };
=20
 enum {
-=09HALS_KBD_BL_SUPPORT_BIT  =3D 4,
-=09HALS_KBD_BL_STATE_BIT    =3D 5,
-=09HALS_FNLOCK_SUPPORT_BIT  =3D 9,
-=09HALS_FNLOCK_STATE_BIT    =3D 10,
-=09HALS_HOTKEYS_PRIMARY_BIT =3D 11,
+=09HALS_KBD_BL_SUPPORT_BIT       =3D 4,
+=09HALS_KBD_BL_STATE_BIT         =3D 5,
+=09HALS_USB_CHARGING_SUPPORT_BIT =3D 6,
+=09HALS_USB_CHARGING_STATE_BIT   =3D 7,
+=09HALS_FNLOCK_SUPPORT_BIT       =3D 9,
+=09HALS_FNLOCK_STATE_BIT         =3D 10,
+=09HALS_HOTKEYS_PRIMARY_BIT      =3D 11,
 };
=20
 enum {
-=09SALS_KBD_BL_ON  =3D 0x8,
-=09SALS_KBD_BL_OFF =3D 0x9,
-=09SALS_FNLOCK_ON  =3D 0xe,
-=09SALS_FNLOCK_OFF =3D 0xf,
+=09SALS_KBD_BL_ON        =3D 0x8,
+=09SALS_KBD_BL_OFF       =3D 0x9,
+=09SALS_USB_CHARGING_ON  =3D 0xa,
+=09SALS_USB_CHARGING_OFF =3D 0xb,
+=09SALS_FNLOCK_ON        =3D 0xe,
+=09SALS_FNLOCK_OFF       =3D 0xf,
 };
=20
 enum {
@@ -135,6 +139,7 @@ struct ideapad_private {
 =09=09bool hw_rfkill_switch     : 1;
 =09=09bool kbd_bl               : 1;
 =09=09bool touchpad_ctrl_via_ec : 1;
+=09=09bool usb_charging         : 1;
 =09} features;
 =09struct {
 =09=09bool initialized;
@@ -595,12 +600,49 @@ static ssize_t touchpad_store(struct device *dev,
=20
 static DEVICE_ATTR_RW(touchpad);
=20
+static ssize_t usb_charging_show(struct device *dev,
+=09=09=09=09 struct device_attribute *attr,
+=09=09=09=09 char *buf)
+{
+=09struct ideapad_private *priv =3D dev_get_drvdata(dev);
+=09unsigned long hals;
+=09int err;
+
+=09err =3D eval_hals(priv->adev->handle, &hals);
+=09if (err)
+=09=09return err;
+
+=09return sysfs_emit(buf, "%d\n", !!test_bit(HALS_USB_CHARGING_STATE_BIT, =
&hals));
+}
+
+static ssize_t usb_charging_store(struct device *dev,
+=09=09=09=09  struct device_attribute *attr,
+=09=09=09=09  const char *buf, size_t count)
+{
+=09struct ideapad_private *priv =3D dev_get_drvdata(dev);
+=09bool state;
+=09int err;
+
+=09err =3D kstrtobool(buf, &state);
+=09if (err)
+=09=09return err;
+
+=09err =3D exec_sals(priv->adev->handle, state ? SALS_USB_CHARGING_ON : SA=
LS_USB_CHARGING_OFF);
+=09if (err)
+=09=09return err;
+
+=09return count;
+}
+
+static DEVICE_ATTR_RW(usb_charging);
+
 static struct attribute *ideapad_attributes[] =3D {
 =09&dev_attr_camera_power.attr,
 =09&dev_attr_conservation_mode.attr,
 =09&dev_attr_fan_mode.attr,
 =09&dev_attr_fn_lock.attr,
 =09&dev_attr_touchpad.attr,
+=09&dev_attr_usb_charging.attr,
 =09NULL
 };
=20
@@ -623,6 +665,8 @@ static umode_t ideapad_is_visible(struct kobject *kobj,
 =09else if (attr =3D=3D &dev_attr_touchpad.attr)
 =09=09supported =3D priv->features.touchpad_ctrl_via_ec &&
 =09=09=09    test_bit(CFG_CAP_TOUCHPAD_BIT, &priv->cfg);
+=09else if (attr =3D=3D &dev_attr_usb_charging.attr)
+=09=09supported =3D priv->features.usb_charging;
=20
 =09return supported ? attr->mode : 0;
 }
@@ -1462,6 +1506,9 @@ static void ideapad_check_features(struct ideapad_pri=
vate *priv)
=20
 =09=09=09if (test_bit(HALS_KBD_BL_SUPPORT_BIT, &val))
 =09=09=09=09priv->features.kbd_bl =3D true;
+
+=09=09=09if (test_bit(HALS_USB_CHARGING_SUPPORT_BIT, &val))
+=09=09=09=09priv->features.usb_charging =3D true;
 =09=09}
 =09}
 }
--=20
2.30.0



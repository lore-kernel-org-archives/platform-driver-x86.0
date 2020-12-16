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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2F0DC2BBCF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Dec 2020 01:42:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C783422D75
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Dec 2020 01:42:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725786AbgLPBls (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Dec 2020 20:41:48 -0500
Received: from mail-40134.protonmail.ch ([185.70.40.134]:18514 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725308AbgLPBls (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Dec 2020 20:41:48 -0500
Date:   Wed, 16 Dec 2020 01:40:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1608082851;
        bh=m/4mDecNAFwWp4FOVItvUsnlVzJlQgrHmWND0EIwl34=;
        h=Date:To:From:Reply-To:Subject:From;
        b=VXKc8pZ/c/J7TiSMwqBse3cMyA4ND0/H6R3Pt4ACg33ftYsDSAL7e07gnEh3jKo1x
         /l0Z/Wgd7k4Q/jsc3ATfp+40HmSDuhU9fMLiJvhTzp9Y30T9OPVf30PPsqgosuId7K
         gNdzUOxf7QUc6uUICWppzNBIxdHYrIi13UXbKDT8=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH 22/24] platform/x86: ideapad-laptop: add "always on USB charging" control support
Message-ID: <20201216013857.360987-23-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Certain models have a so-called "always on USB charging" feature, which
enables USB charging even when the computer is turned off or suspended,
and which may be controlled/queried using the SALS/HALS ACPI methods.
Expose this functionality via a new device attribute (usb_charging).
Tested on: Lenovo YOGA 520-14IKB 80X8

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index a43574e65f61..5f7883e59f21 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -58,18 +58,22 @@ enum {
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
@@ -118,6 +122,7 @@ struct ideapad_private {
 =09=09bool fan_mode          : 1,
 =09=09     conservation_mode : 1,
 =09=09     fn_lock           : 1,
+=09=09     usb_charging      : 1,
 =09=09     hw_rfkill_switch  : 1;
 =09} features;
 =09struct {
@@ -581,12 +586,50 @@ static ssize_t fn_lock_store(struct device *dev,
=20
 static DEVICE_ATTR_RW(fn_lock);
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
+=09return sysfs_emit(buf, "%u\n", test_bit(HALS_USB_CHARGING_STATE_BIT, &h=
als));
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
+=09err =3D eval_sals(priv->adev->handle,
+=09=09=09state ? SALS_USB_CHARGING_ON : SALS_USB_CHARGING_OFF);
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
 =09&dev_attr_fan_mode.attr,
 =09&dev_attr_touchpad.attr,
 =09&dev_attr_conservation_mode.attr,
 =09&dev_attr_fn_lock.attr,
+=09&dev_attr_usb_charging.attr,
 =09NULL
 };
=20
@@ -608,6 +651,8 @@ static umode_t ideapad_is_visible(struct kobject *kobj,
 =09=09supported =3D priv->features.conservation_mode;
 =09else if (attr =3D=3D &dev_attr_fn_lock.attr)
 =09=09supported =3D priv->features.fn_lock;
+=09else if (attr =3D=3D &dev_attr_usb_charging.attr)
+=09=09supported =3D priv->features.usb_charging;
=20
 =09return supported ? attr->mode : 0;
 }
@@ -1175,9 +1220,13 @@ static void ideapad_check_features(struct ideapad_pr=
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
+=09=09=09if (test_bit(HALS_USB_CHARGING_SUPPORT_BIT, &val))
+=09=09=09=09priv->features.usb_charging =3D true;
+=09=09}
 =09}
 }
=20
--=20
2.29.2



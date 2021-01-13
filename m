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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D9EC433DB
	for <platform-driver-x86@archiver.kernel.org>; Wed, 13 Jan 2021 18:24:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8142C23436
	for <platform-driver-x86@archiver.kernel.org>; Wed, 13 Jan 2021 18:24:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727998AbhAMSXe (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 13 Jan 2021 13:23:34 -0500
Received: from mail1.protonmail.ch ([185.70.40.18]:55621 "EHLO
        mail1.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727984AbhAMSXd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Jan 2021 13:23:33 -0500
Date:   Wed, 13 Jan 2021 18:22:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1610562169;
        bh=+sS6pRrnr3xd5yOrE9QR7DNWIvpqoMvbatCJYNRsMbk=;
        h=Date:To:From:Reply-To:Subject:From;
        b=PCyLym9gFVEC2HRUSDfLBFTc91Jy/S/PfTtUhXPrg4Ey4TCycSlcwdiUem/aQafsK
         0lDgzdAuKyl2aEJlQXDr3XH1rTvzAeLzebsMpEgkVLFscPiyphczQ7SP1Lm5FIuzV9
         AbobGo/SPN+lgISWsNcuOfrXgB9ZpAmQEMs9dHC4=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v2 22/24] platform/x86: ideapad-laptop: add "always on USB charging" control support
Message-ID: <20210113182016.166049-23-pobrn@protonmail.com>
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
Reviewed-by: Hans de Goede <hdegoede@redhat.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index 7a0dbafe5dfc..da1c89b2e086 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -60,18 +60,22 @@ enum {
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
@@ -122,7 +126,8 @@ struct ideapad_private {
 =09=09     touchpad_ctrl_via_ec : 1,
 =09=09     conservation_mode    : 1,
 =09=09     fn_lock              : 1,
-=09=09     kbd_bl               : 1;
+=09=09     kbd_bl               : 1,
+=09=09     usb_charging         : 1;
 =09} features;
 =09struct {
 =09=09bool initialized;
@@ -585,12 +590,50 @@ static ssize_t fn_lock_store(struct device *dev,
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
@@ -613,6 +656,8 @@ static umode_t ideapad_is_visible(struct kobject *kobj,
 =09=09supported =3D priv->features.conservation_mode;
 =09else if (attr =3D=3D &dev_attr_fn_lock.attr)
 =09=09supported =3D priv->features.fn_lock;
+=09else if (attr =3D=3D &dev_attr_usb_charging.attr)
+=09=09supported =3D priv->features.usb_charging;
=20
 =09return supported ? attr->mode : 0;
 }
@@ -1187,6 +1232,9 @@ static void ideapad_check_features(struct ideapad_pri=
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


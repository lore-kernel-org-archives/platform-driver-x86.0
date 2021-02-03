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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A269C433E0
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 21:56:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3482464E4E
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 21:56:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232366AbhBCV4v (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 3 Feb 2021 16:56:51 -0500
Received: from mail-40131.protonmail.ch ([185.70.40.131]:59151 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231318AbhBCV4t (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 16:56:49 -0500
Date:   Wed, 03 Feb 2021 21:55:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1612389367;
        bh=gGyzy6J413D8Goh69tP/efDGaWYPLVeIpXBnutcEtvg=;
        h=Date:To:From:Reply-To:Subject:From;
        b=njEo/rQvK6GD+kwNa5vSwRlcTynD13s0pXSVkDCGzVwSr/FoU0G8/R9aY9D67jj5/
         eCCPyGfI218akpuYAP+mx4oxFtdBYdn45YrgzBLLqmijmGk0FNti4H/ZWK/fvq4pEB
         Yy/Rs6Y5eXzLc3wE6YeDeEuk0fiLiFKM1N05X3ZE=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v3 16/29] platform/x86: ideapad-laptop: group and separate (un)related constants into enums
Message-ID: <20210203215403.290792-17-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Group and rename constants depending on which ACPI interface
they pertain to, and rename CFG_X constants to CFG_CAP_X.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index 00d9e23a0310..e74f25ec4a27 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -34,14 +34,6 @@
=20
 #define IDEAPAD_RFKILL_DEV_NUM=09(3)
=20
-#define BM_CONSERVATION_BIT (5)
-#define HA_FNLOCK_BIT       (10)
-
-#define CFG_BT_BIT=09(16)
-#define CFG_3G_BIT=09(17)
-#define CFG_WIFI_BIT=09(18)
-#define CFG_CAMERA_BIT=09(19)
-
 #if IS_ENABLED(CONFIG_ACPI_WMI)
 static const char *const ideapad_wmi_fnesc_events[] =3D {
 =09"26CAB2E5-5CF1-46AE-AAC3-4A12B6BA50E6", /* Yoga 3 */
@@ -50,10 +42,28 @@ static const char *const ideapad_wmi_fnesc_events[] =3D=
 {
 #endif
=20
 enum {
-=09BMCMD_CONSERVATION_ON =3D 3,
-=09BMCMD_CONSERVATION_OFF =3D 5,
-=09HACMD_FNLOCK_ON =3D 0xe,
-=09HACMD_FNLOCK_OFF =3D 0xf,
+=09CFG_CAP_BT_BIT   =3D 16,
+=09CFG_CAP_3G_BIT   =3D 17,
+=09CFG_CAP_WIFI_BIT =3D 18,
+=09CFG_CAP_CAM_BIT  =3D 19,
+};
+
+enum {
+=09GBMD_CONSERVATION_STATE_BIT =3D 5,
+};
+
+enum {
+=09SMBC_CONSERVATION_ON  =3D 3,
+=09SMBC_CONSERVATION_OFF =3D 5,
+};
+
+enum {
+=09HALS_FNLOCK_STATE_BIT =3D 10,
+};
+
+enum {
+=09SALS_FNLOCK_ON  =3D 0xe,
+=09SALS_FNLOCK_OFF =3D 0xf,
 };
=20
 enum {
@@ -309,7 +319,7 @@ static int debugfs_status_show(struct seq_file *s, void=
 *data)
=20
 =09if (!method_gbmd(priv->adev->handle, &value)) {
 =09=09seq_printf(s, "Conservation mode:\t%s(%lu)\n",
-=09=09=09   test_bit(BM_CONSERVATION_BIT, &value) ? "On" : "Off",
+=09=09=09   test_bit(GBMD_CONSERVATION_STATE_BIT, &value) ? "On" : "Off",
 =09=09=09   value);
 =09}
=20
@@ -323,13 +333,13 @@ static int debugfs_cfg_show(struct seq_file *s, void =
*data)
=20
 =09seq_printf(s, "cfg: 0x%.8lX\n\nCapability: ",
 =09=09   priv->cfg);
-=09if (test_bit(CFG_BT_BIT, &priv->cfg))
+=09if (test_bit(CFG_CAP_BT_BIT, &priv->cfg))
 =09=09seq_printf(s, "Bluetooth ");
-=09if (test_bit(CFG_3G_BIT, &priv->cfg))
+=09if (test_bit(CFG_CAP_3G_BIT, &priv->cfg))
 =09=09seq_printf(s, "3G ");
-=09if (test_bit(CFG_WIFI_BIT, &priv->cfg))
+=09if (test_bit(CFG_CAP_WIFI_BIT, &priv->cfg))
 =09=09seq_printf(s, "Wireless ");
-=09if (test_bit(CFG_CAMERA_BIT, &priv->cfg))
+=09if (test_bit(CFG_CAP_CAM_BIT, &priv->cfg))
 =09=09seq_printf(s, "Camera ");
 =09seq_printf(s, "\nGraphic: ");
 =09switch ((priv->cfg)&0x700) {
@@ -491,7 +501,7 @@ static ssize_t conservation_mode_show(struct device *de=
v,
 =09err =3D method_gbmd(priv->adev->handle, &result);
 =09if (err)
 =09=09return err;
-=09return sysfs_emit(buf, "%d\n", !!test_bit(BM_CONSERVATION_BIT, &result)=
);
+=09return sysfs_emit(buf, "%d\n", !!test_bit(GBMD_CONSERVATION_STATE_BIT, =
&result));
 }
=20
 static ssize_t conservation_mode_store(struct device *dev,
@@ -507,8 +517,8 @@ static ssize_t conservation_mode_store(struct device *d=
ev,
 =09=09return ret;
=20
 =09ret =3D method_int1(priv->adev->handle, "SBMC", state ?
-=09=09=09=09=09      BMCMD_CONSERVATION_ON :
-=09=09=09=09=09      BMCMD_CONSERVATION_OFF);
+=09=09=09=09=09      SMBC_CONSERVATION_ON :
+=09=09=09=09=09      SMBC_CONSERVATION_OFF);
 =09if (ret)
 =09=09return ret;
 =09return count;
@@ -529,7 +539,7 @@ static ssize_t fn_lock_show(struct device *dev,
 =09=09return fail;
=20
 =09result =3D hals;
-=09return sysfs_emit(buf, "%d\n", !!test_bit(HA_FNLOCK_BIT, &result));
+=09return sysfs_emit(buf, "%d\n", !!test_bit(HALS_FNLOCK_STATE_BIT, &resul=
t));
 }
=20
 static ssize_t fn_lock_store(struct device *dev,
@@ -545,8 +555,8 @@ static ssize_t fn_lock_store(struct device *dev,
 =09=09return ret;
=20
 =09ret =3D method_int1(priv->adev->handle, "SALS", state ?
-=09=09=09  HACMD_FNLOCK_ON :
-=09=09=09  HACMD_FNLOCK_OFF);
+=09=09=09  SALS_FNLOCK_ON :
+=09=09=09  SALS_FNLOCK_OFF);
 =09if (ret)
 =09=09return ret;
 =09return count;
@@ -573,7 +583,7 @@ static umode_t ideapad_is_visible(struct kobject *kobj,
 =09bool supported;
=20
 =09if (attr =3D=3D &dev_attr_camera_power.attr)
-=09=09supported =3D test_bit(CFG_CAMERA_BIT, &(priv->cfg));
+=09=09supported =3D test_bit(CFG_CAP_CAM_BIT, &priv->cfg);
 =09else if (attr =3D=3D &dev_attr_fan_mode.attr) {
 =09=09unsigned long value;
 =09=09supported =3D !read_ec_data(priv->adev->handle, VPCCMD_R_FAN,
@@ -859,9 +869,9 @@ struct ideapad_rfk_data {
 };
=20
 static const struct ideapad_rfk_data ideapad_rfk_data[] =3D {
-=09{ "ideapad_wlan",    CFG_WIFI_BIT, VPCCMD_W_WIFI, RFKILL_TYPE_WLAN },
-=09{ "ideapad_bluetooth", CFG_BT_BIT, VPCCMD_W_BT, RFKILL_TYPE_BLUETOOTH }=
,
-=09{ "ideapad_3g",        CFG_3G_BIT, VPCCMD_W_3G, RFKILL_TYPE_WWAN },
+=09{ "ideapad_wlan",      CFG_CAP_WIFI_BIT, VPCCMD_W_WIFI, RFKILL_TYPE_WLA=
N },
+=09{ "ideapad_bluetooth", CFG_CAP_BT_BIT,   VPCCMD_W_BT,   RFKILL_TYPE_BLU=
ETOOTH },
+=09{ "ideapad_3g",        CFG_CAP_3G_BIT,   VPCCMD_W_3G,   RFKILL_TYPE_WWA=
N },
 };
=20
 static int ideapad_rfk_set(void *data, bool blocked)
--=20
2.30.0



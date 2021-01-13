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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 809DAC433E9
	for <platform-driver-x86@archiver.kernel.org>; Wed, 13 Jan 2021 18:22:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D5CB23436
	for <platform-driver-x86@archiver.kernel.org>; Wed, 13 Jan 2021 18:22:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728152AbhAMSWY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 13 Jan 2021 13:22:24 -0500
Received: from mail2.protonmail.ch ([185.70.40.22]:39244 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728117AbhAMSWX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Jan 2021 13:22:23 -0500
Date:   Wed, 13 Jan 2021 18:21:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1610562101;
        bh=EnZuNMH7q1iKYXqK67NYqRBHD0iessAfjOpE2E/Sxsg=;
        h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
        b=l89WuHcjRugPvABniAjeePla6rNbt1262lPEhBBqD/yalhPRJVO1ZXtUB9fsZGzcj
         6wmejoJlg4ab+dX/sF2sShsbnRmtAx1JQV4YwcdkdYuNUpl4FrJNdvQ4XxEeqKz4FA
         XiRc9Jtj0m3znk7xo03rVs7JUoyPCTMCybEdKqFo=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v2 11/24] platform/x86: ideapad-laptop: group and separate (un)related constants into enums
Message-ID: <20210113182016.166049-12-pobrn@protonmail.com>
In-Reply-To: <20210113182016.166049-1-pobrn@protonmail.com>
References: <20210113182016.166049-1-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Group and rename constants depending on which ACPI interface they
pertain to, and rename CFG_X constants to CFG_CAP_X.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index cba3d9419f52..5f36e77d9058 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -32,14 +32,6 @@
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
@@ -48,10 +40,28 @@ static const char *const ideapad_wmi_fnesc_events[] =3D=
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
@@ -278,7 +288,7 @@ static int debugfs_status_show(struct seq_file *s, void=
 *data)
=20
 =09if (!method_gbmd(priv->adev->handle, &value)) {
 =09=09seq_printf(s, "Conservation mode:\t%s(%lu)\n",
-=09=09=09   test_bit(BM_CONSERVATION_BIT, &value) ? "On" : "Off",
+=09=09=09   test_bit(GBMD_CONSERVATION_STATE_BIT, &value) ? "On" : "Off",
 =09=09=09   value);
 =09}
=20
@@ -295,13 +305,13 @@ static int debugfs_cfg_show(struct seq_file *s, void =
*data)
 =09} else {
 =09=09seq_printf(s, "cfg: 0x%.8lX\n\nCapability: ",
 =09=09=09   priv->cfg);
-=09=09if (test_bit(CFG_BT_BIT, &priv->cfg))
+=09=09if (test_bit(CFG_CAP_BT_BIT, &priv->cfg))
 =09=09=09seq_printf(s, "Bluetooth ");
-=09=09if (test_bit(CFG_3G_BIT, &priv->cfg))
+=09=09if (test_bit(CFG_CAP_3G_BIT, &priv->cfg))
 =09=09=09seq_printf(s, "3G ");
-=09=09if (test_bit(CFG_WIFI_BIT, &priv->cfg))
+=09=09if (test_bit(CFG_CAP_WIFI_BIT, &priv->cfg))
 =09=09=09seq_printf(s, "Wireless ");
-=09=09if (test_bit(CFG_CAMERA_BIT, &priv->cfg))
+=09=09if (test_bit(CFG_CAP_CAM_BIT, &priv->cfg))
 =09=09=09seq_printf(s, "Camera ");
 =09=09seq_printf(s, "\nGraphic: ");
 =09=09switch ((priv->cfg)&0x700) {
@@ -461,7 +471,7 @@ static ssize_t conservation_mode_show(struct device *de=
v,
 =09err =3D method_gbmd(priv->adev->handle, &result);
 =09if (err)
 =09=09return err;
-=09return sysfs_emit(buf, "%u\n", test_bit(BM_CONSERVATION_BIT, &result));
+=09return sysfs_emit(buf, "%u\n", test_bit(GBMD_CONSERVATION_STATE_BIT, &r=
esult));
 }
=20
 static ssize_t conservation_mode_store(struct device *dev,
@@ -477,8 +487,8 @@ static ssize_t conservation_mode_store(struct device *d=
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
@@ -499,7 +509,7 @@ static ssize_t fn_lock_show(struct device *dev,
 =09=09return fail;
=20
 =09result =3D hals;
-=09return sysfs_emit(buf, "%u\n", test_bit(HA_FNLOCK_BIT, &result));
+=09return sysfs_emit(buf, "%u\n", test_bit(HALS_FNLOCK_STATE_BIT, &result)=
);
 }
=20
 static ssize_t fn_lock_store(struct device *dev,
@@ -515,8 +525,8 @@ static ssize_t fn_lock_store(struct device *dev,
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
@@ -543,7 +553,7 @@ static umode_t ideapad_is_visible(struct kobject *kobj,
 =09bool supported;
=20
 =09if (attr =3D=3D &dev_attr_camera_power.attr)
-=09=09supported =3D test_bit(CFG_CAMERA_BIT, &(priv->cfg));
+=09=09supported =3D test_bit(CFG_CAP_CAM_BIT, &priv->cfg);
 =09else if (attr =3D=3D &dev_attr_fan_mode.attr) {
 =09=09unsigned long value;
 =09=09supported =3D !read_ec_data(priv->adev->handle, VPCCMD_R_FAN,
@@ -578,9 +588,9 @@ struct ideapad_rfk_data {
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


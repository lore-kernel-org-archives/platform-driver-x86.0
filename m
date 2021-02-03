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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0CE9C433DB
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 21:56:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76EF464E46
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 21:56:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232324AbhBCV4l (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 3 Feb 2021 16:56:41 -0500
Received: from mail-40134.protonmail.ch ([185.70.40.134]:40275 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232366AbhBCV4k (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 16:56:40 -0500
Date:   Wed, 03 Feb 2021 21:55:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1612389358;
        bh=Hv90NEpSErVY37H/qgkp68BU+eDOPY0KcZCwUyw0JCY=;
        h=Date:To:From:Reply-To:Subject:From;
        b=VmFedQwgAPkbSi/IDZEyYymWwby7R46PT4WKaRoat3+5Rk873Z1e0ujGNmbCtrWkI
         JQXZi01TJPwPpVB4P3unauPO+V4lSKS3eRyvPqJH+PQy0Jlyt/REbGX26l7ffBlnNG
         fIDd49noTMyB2APd0i8QyfNpmjk9gkA99VA1up5k=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v3 15/29] platform/x86: ideapad-laptop: misc. device attribute changes
Message-ID: <20210203215403.290792-16-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Do not handle zero length buffer separately. Use kstrtouint() instead
of sscanf(). Use kstrtobool() in store_ideapad_cam(). These
introduce minor ABI changes, but it is expected that no users rely
on the previous behavior. Thus the change is deemed justifed.
Additionally, use `!!` to convert to `int` and use the "%d" format
specifier in sysfs_emit() for boolean-like attributes.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index 70aa775e80ad..00d9e23a0310 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -388,20 +388,20 @@ static ssize_t show_ideapad_cam(struct device *dev,
 =09err =3D read_ec_data(priv->adev->handle, VPCCMD_R_CAMERA, &result);
 =09if (err)
 =09=09return err;
-=09return sysfs_emit(buf, "%lu\n", result);
+=09return sysfs_emit(buf, "%d\n", !!result);
 }
=20
 static ssize_t store_ideapad_cam(struct device *dev,
 =09=09=09=09 struct device_attribute *attr,
 =09=09=09=09 const char *buf, size_t count)
 {
-=09int ret, state;
 =09struct ideapad_private *priv =3D dev_get_drvdata(dev);
+=09bool state;
+=09int ret;
=20
-=09if (!count)
-=09=09return 0;
-=09if (sscanf(buf, "%i", &state) !=3D 1)
-=09=09return -EINVAL;
+=09ret =3D kstrtobool(buf, &state);
+=09if (ret)
+=09=09return ret;
 =09ret =3D write_ec_cmd(priv->adev->handle, VPCCMD_W_CAMERA, state);
 =09if (ret)
 =09=09return ret;
@@ -428,14 +428,14 @@ static ssize_t store_ideapad_fan(struct device *dev,
 =09=09=09=09 struct device_attribute *attr,
 =09=09=09=09 const char *buf, size_t count)
 {
-=09int ret, state;
 =09struct ideapad_private *priv =3D dev_get_drvdata(dev);
+=09unsigned int state;
+=09int ret;
=20
-=09if (!count)
-=09=09return 0;
-=09if (sscanf(buf, "%i", &state) !=3D 1)
-=09=09return -EINVAL;
-=09if (state < 0 || state > 4 || state =3D=3D 3)
+=09ret =3D kstrtouint(buf, 0, &state);
+=09if (ret)
+=09=09return ret;
+=09if (state > 4 || state =3D=3D 3)
 =09=09return -EINVAL;
 =09ret =3D write_ec_cmd(priv->adev->handle, VPCCMD_W_FAN, state);
 =09if (ret)
@@ -456,7 +456,7 @@ static ssize_t touchpad_show(struct device *dev,
 =09err =3D read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &result);
 =09if (err)
 =09=09return err;
-=09return sysfs_emit(buf, "%lu\n", result);
+=09return sysfs_emit(buf, "%d\n", !!result);
 }
=20
 /* Switch to RO for now: It might be revisited in the future */
@@ -491,7 +491,7 @@ static ssize_t conservation_mode_show(struct device *de=
v,
 =09err =3D method_gbmd(priv->adev->handle, &result);
 =09if (err)
 =09=09return err;
-=09return sysfs_emit(buf, "%u\n", test_bit(BM_CONSERVATION_BIT, &result));
+=09return sysfs_emit(buf, "%d\n", !!test_bit(BM_CONSERVATION_BIT, &result)=
);
 }
=20
 static ssize_t conservation_mode_store(struct device *dev,
@@ -529,7 +529,7 @@ static ssize_t fn_lock_show(struct device *dev,
 =09=09return fail;
=20
 =09result =3D hals;
-=09return sysfs_emit(buf, "%u\n", test_bit(HA_FNLOCK_BIT, &result));
+=09return sysfs_emit(buf, "%d\n", !!test_bit(HA_FNLOCK_BIT, &result));
 }
=20
 static ssize_t fn_lock_store(struct device *dev,
--=20
2.30.0



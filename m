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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67091C433E0
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 21:56:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 21E2A64E46
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 21:56:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232372AbhBCV4k (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 3 Feb 2021 16:56:40 -0500
Received: from mail-40134.protonmail.ch ([185.70.40.134]:16297 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232324AbhBCV4j (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 16:56:39 -0500
Date:   Wed, 03 Feb 2021 21:55:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1612389356;
        bh=9IOq1PI2s28VN/ey4rKGDnB7P2XZG7UCvROOWDx1nUo=;
        h=Date:To:From:Reply-To:Subject:From;
        b=kY5Ja6rFLrI1qqe29bnEH+a1CitK/Kz3SOuTaCfwgjLhKYnzNL/sVp7NbY0+uTd4Q
         Jiq6FbG7XvOritvvuH+jS275vBdL+akSfJm7xIDoxh2VjeBxpJYYgO79VkZcPxjNpo
         8q0DK4a4Uk8YK6bFSoyGK9am1+LhJcDxUPypo7uk=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v3 14/29] platform/x86: ideapad-laptop: always propagate error codes from device attributes' show() callback
Message-ID: <20210203215403.290792-15-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Consumers can differentiate an error from a successful read much more
easily if the read() call fails with an appropriate errno instead of
returning a magic string like "-1". This introduces an ABI change, but
not many users are expected to be relying on the previous behavior,
and this change makes this module conforming to the standard behavior
that sysfs attribute show/store callbacks return an appropriate
errno in case of failure. Thus the ABI breakage is deemed justified.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index 7815ec93f546..70aa775e80ad 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -383,9 +383,11 @@ static ssize_t show_ideapad_cam(struct device *dev,
 {
 =09unsigned long result;
 =09struct ideapad_private *priv =3D dev_get_drvdata(dev);
+=09int err;
=20
-=09if (read_ec_data(priv->adev->handle, VPCCMD_R_CAMERA, &result))
-=09=09return sysfs_emit(buf, "-1\n");
+=09err =3D read_ec_data(priv->adev->handle, VPCCMD_R_CAMERA, &result);
+=09if (err)
+=09=09return err;
 =09return sysfs_emit(buf, "%lu\n", result);
 }
=20
@@ -414,9 +416,11 @@ static ssize_t show_ideapad_fan(struct device *dev,
 {
 =09unsigned long result;
 =09struct ideapad_private *priv =3D dev_get_drvdata(dev);
+=09int err;
=20
-=09if (read_ec_data(priv->adev->handle, VPCCMD_R_FAN, &result))
-=09=09return sysfs_emit(buf, "-1\n");
+=09err =3D read_ec_data(priv->adev->handle, VPCCMD_R_FAN, &result);
+=09if (err)
+=09=09return err;
 =09return sysfs_emit(buf, "%lu\n", result);
 }
=20
@@ -447,9 +451,11 @@ static ssize_t touchpad_show(struct device *dev,
 {
 =09struct ideapad_private *priv =3D dev_get_drvdata(dev);
 =09unsigned long result;
+=09int err;
=20
-=09if (read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &result))
-=09=09return sysfs_emit(buf, "-1\n");
+=09err =3D read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &result);
+=09if (err)
+=09=09return err;
 =09return sysfs_emit(buf, "%lu\n", result);
 }
=20
@@ -480,9 +486,11 @@ static ssize_t conservation_mode_show(struct device *d=
ev,
 {
 =09struct ideapad_private *priv =3D dev_get_drvdata(dev);
 =09unsigned long result;
+=09int err;
=20
-=09if (method_gbmd(priv->adev->handle, &result))
-=09=09return sysfs_emit(buf, "-1\n");
+=09err =3D method_gbmd(priv->adev->handle, &result);
+=09if (err)
+=09=09return err;
 =09return sysfs_emit(buf, "%u\n", test_bit(BM_CONSERVATION_BIT, &result));
 }
=20
@@ -518,7 +526,7 @@ static ssize_t fn_lock_show(struct device *dev,
 =09int fail =3D read_method_int(priv->adev->handle, "HALS", &hals);
=20
 =09if (fail)
-=09=09return sysfs_emit(buf, "-1\n");
+=09=09return fail;
=20
 =09result =3D hals;
 =09return sysfs_emit(buf, "%u\n", test_bit(HA_FNLOCK_BIT, &result));
--=20
2.30.0



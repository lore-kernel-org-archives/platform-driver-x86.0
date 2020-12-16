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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 353AEC2BB48
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Dec 2020 01:40:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E87F423120
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Dec 2020 01:40:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725800AbgLPBkt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Dec 2020 20:40:49 -0500
Received: from mail2.protonmail.ch ([185.70.40.22]:10554 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725802AbgLPBkt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Dec 2020 20:40:49 -0500
Date:   Wed, 16 Dec 2020 01:39:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1608082790;
        bh=sRQq/xEv3F9s5lmNZnqabsnU76C+BPqWl6gzVh4fuzw=;
        h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
        b=jQy1gD2A1VcshIXFPo6RQ+GotKF0lyCvx7vAArBoRqwJq+TIXNQ06Evi+uk92VUO0
         xgAjrBzH5+N1fwkGYhoZCXTk0coa+quMF061AYhqkWPDNOQxt+0gsH24Sn5iOS2gXm
         C14wgpH+COYQXj2sYPtYDh/LGkoEzn2omB8yE/u0=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH 09/24] platform/x86: ideapad-laptop: always propagate error codes from device attributes' show() callback
Message-ID: <20201216013857.360987-10-pobrn@protonmail.com>
In-Reply-To: <20201216013857.360987-1-pobrn@protonmail.com>
References: <20201216013857.360987-1-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Consumers can differentiate an error from a successful read much more
easily if the read() call fails with the appropriate errno instead of
returning a magic string like "-1".

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index 1d43894d557e..b6b5a508a8b8 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -351,9 +351,11 @@ static ssize_t show_ideapad_cam(struct device *dev,
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
@@ -382,9 +384,11 @@ static ssize_t show_ideapad_fan(struct device *dev,
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
@@ -415,9 +419,11 @@ static ssize_t touchpad_show(struct device *dev,
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
@@ -448,9 +454,11 @@ static ssize_t conservation_mode_show(struct device *d=
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
@@ -486,7 +494,7 @@ static ssize_t fn_lock_show(struct device *dev,
 =09int fail =3D read_method_int(priv->adev->handle, "HALS", &hals);
=20
 =09if (fail)
-=09=09return sysfs_emit(buf, "-1\n");
+=09=09return fail;
=20
 =09result =3D hals;
 =09return sysfs_emit(buf, "%u\n", test_bit(HA_FNLOCK_BIT, &result));
--=20
2.29.2



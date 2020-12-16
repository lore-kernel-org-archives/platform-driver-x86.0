Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BFA4C2BBCF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Dec 2020 01:40:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 071462311E
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Dec 2020 01:40:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725785AbgLPBkY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Dec 2020 20:40:24 -0500
Received: from mail-40131.protonmail.ch ([185.70.40.131]:34128 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725550AbgLPBkY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Dec 2020 20:40:24 -0500
Date:   Wed, 16 Dec 2020 01:39:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1608082781;
        bh=VkOOQi+ZkPYfoiIDG9iAawrkQXozPeNmJQW1T/c5jbI=;
        h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
        b=PqG90gTWl6Sxo1395XjJzQr2PSGC03E6UDHTVgt0kqFIAopq1BI3mcJZ9k5cX1nWe
         TqyoXbCDkZMCMAkpGmnPt7BgQJNDETxzq0S6hFmnq6rU5Hear96kVfqMpEgKXMFYro
         z8SijJKkLRwCQ7KbpaAKmCbYOvqlzJ6STTxrO+bM=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH 08/24] platform/x86: ideapad-laptop: convert ACPI helpers to return -EIO in case of failure
Message-ID: <20201216013857.360987-9-pobrn@protonmail.com>
In-Reply-To: <20201216013857.360987-1-pobrn@protonmail.com>
References: <20201216013857.360987-1-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

ACPI helpers returned -1 in case of failure. Convert these functions to
return appropriate error codes, and convert their users to propagate
these error codes accordingly.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index d9ac96f6b465..1d43894d557e 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -115,7 +115,7 @@ static int read_method_int(acpi_handle handle, const ch=
ar *method, int *val)
 =09status =3D acpi_evaluate_integer(handle, (char *)method, NULL, &result)=
;
 =09if (ACPI_FAILURE(status)) {
 =09=09*val =3D -1;
-=09=09return -1;
+=09=09return -EIO;
 =09}
 =09*val =3D result;
 =09return 0;
@@ -136,7 +136,7 @@ static int method_int1(acpi_handle handle, char *method=
, int cmd)
 =09acpi_status status;
=20
 =09status =3D acpi_execute_simple_method(handle, method, cmd);
-=09return ACPI_FAILURE(status) ? -1 : 0;
+=09return ACPI_FAILURE(status) ? -EIO : 0;
 }
=20
 static int method_vpcr(acpi_handle handle, int cmd, int *ret)
@@ -155,7 +155,7 @@ static int method_vpcr(acpi_handle handle, int cmd, int=
 *ret)
=20
 =09if (ACPI_FAILURE(status)) {
 =09=09*ret =3D -1;
-=09=09return -1;
+=09=09return -EIO;
 =09}
 =09*ret =3D result;
 =09return 0;
@@ -177,54 +177,60 @@ static int method_vpcw(acpi_handle handle, int cmd, i=
nt data)
=20
 =09status =3D acpi_evaluate_object(handle, "VPCW", &params, NULL);
 =09if (status !=3D AE_OK)
-=09=09return -1;
+=09=09return -EIO;
 =09return 0;
 }
=20
 static int read_ec_data(acpi_handle handle, int cmd, unsigned long *data)
 {
-=09int val;
+=09int val, err;
 =09unsigned long int end_jiffies;
=20
-=09if (method_vpcw(handle, 1, cmd))
-=09=09return -1;
+=09err =3D method_vpcw(handle, 1, cmd);
+=09if (err)
+=09=09return err;
=20
 =09for (end_jiffies =3D jiffies + msecs_to_jiffies(IDEAPAD_EC_TIMEOUT) + 1=
;
 =09     time_before(jiffies, end_jiffies);) {
 =09=09schedule();
-=09=09if (method_vpcr(handle, 1, &val))
-=09=09=09return -1;
+=09=09err =3D method_vpcr(handle, 1, &val);
+=09=09if (err)
+=09=09=09return err;
 =09=09if (val =3D=3D 0) {
-=09=09=09if (method_vpcr(handle, 0, &val))
-=09=09=09=09return -1;
+=09=09=09err =3D method_vpcr(handle, 0, &val);
+=09=09=09if (err)
+=09=09=09=09return err;
 =09=09=09*data =3D val;
 =09=09=09return 0;
 =09=09}
 =09}
 =09acpi_handle_err(handle, "timeout in %s\n", __func__);
-=09return -1;
+=09return -ETIMEDOUT;
 }
=20
 static int write_ec_cmd(acpi_handle handle, int cmd, unsigned long data)
 {
-=09int val;
+=09int val, err;
 =09unsigned long int end_jiffies;
=20
-=09if (method_vpcw(handle, 0, data))
-=09=09return -1;
-=09if (method_vpcw(handle, 1, cmd))
-=09=09return -1;
+=09err =3D method_vpcw(handle, 0, data);
+=09if (err)
+=09=09return err;
+=09err =3D method_vpcw(handle, 1, cmd);
+=09if (err)
+=09=09return err;
=20
 =09for (end_jiffies =3D jiffies + msecs_to_jiffies(IDEAPAD_EC_TIMEOUT) + 1=
;
 =09     time_before(jiffies, end_jiffies);) {
 =09=09schedule();
-=09=09if (method_vpcr(handle, 1, &val))
-=09=09=09return -1;
+=09=09err =3D method_vpcr(handle, 1, &val);
+=09=09if (err)
+=09=09=09return err;
 =09=09if (val =3D=3D 0)
 =09=09=09return 0;
 =09}
 =09acpi_handle_err(handle, "timeout in %s\n", __func__);
-=09return -1;
+=09return -ETIMEDOUT;
 }
=20
 /*
@@ -363,8 +369,8 @@ static ssize_t store_ideapad_cam(struct device *dev,
 =09if (sscanf(buf, "%i", &state) !=3D 1)
 =09=09return -EINVAL;
 =09ret =3D write_ec_cmd(priv->adev->handle, VPCCMD_W_CAMERA, state);
-=09if (ret < 0)
-=09=09return -EIO;
+=09if (ret)
+=09=09return ret;
 =09return count;
 }
=20
@@ -396,8 +402,8 @@ static ssize_t store_ideapad_fan(struct device *dev,
 =09if (state < 0 || state > 4 || state =3D=3D 3)
 =09=09return -EINVAL;
 =09ret =3D write_ec_cmd(priv->adev->handle, VPCCMD_W_FAN, state);
-=09if (ret < 0)
-=09=09return -EIO;
+=09if (ret)
+=09=09return ret;
 =09return count;
 }
=20
@@ -429,8 +435,8 @@ static ssize_t __maybe_unused touchpad_store(struct dev=
ice *dev,
 =09=09return ret;
=20
 =09ret =3D write_ec_cmd(priv->adev->handle, VPCCMD_W_TOUCHPAD, state);
-=09if (ret < 0)
-=09=09return -EIO;
+=09if (ret)
+=09=09return ret;
 =09return count;
 }
=20
@@ -463,8 +469,8 @@ static ssize_t conservation_mode_store(struct device *d=
ev,
 =09ret =3D method_int1(priv->adev->handle, "SBMC", state ?
 =09=09=09=09=09      BMCMD_CONSERVATION_ON :
 =09=09=09=09=09      BMCMD_CONSERVATION_OFF);
-=09if (ret < 0)
-=09=09return -EIO;
+=09if (ret)
+=09=09return ret;
 =09return count;
 }
=20
@@ -501,8 +507,8 @@ static ssize_t fn_lock_store(struct device *dev,
 =09ret =3D method_int1(priv->adev->handle, "SALS", state ?
 =09=09=09  HACMD_FNLOCK_ON :
 =09=09=09  HACMD_FNLOCK_OFF);
-=09if (ret < 0)
-=09=09return -EIO;
+=09if (ret)
+=09=09return ret;
 =09return count;
 }
=20
@@ -740,7 +746,8 @@ static void ideapad_check_special_buttons(struct ideapa=
d_private *priv)
 {
 =09unsigned long bit, value;
=20
-=09read_ec_data(priv->adev->handle, VPCCMD_R_SPECIAL_BUTTONS, &value);
+=09if (read_ec_data(priv->adev->handle, VPCCMD_R_SPECIAL_BUTTONS, &value))
+=09=09return;
=20
 =09for_each_set_bit(bit, &value, 16) {
 =09=09switch (bit) {
@@ -768,28 +775,33 @@ static int ideapad_backlight_get_brightness(struct ba=
cklight_device *blightdev)
 {
 =09struct ideapad_private *priv =3D bl_get_data(blightdev);
 =09unsigned long now;
+=09int err;
=20
 =09if (!priv)
 =09=09return -EINVAL;
=20
-=09if (read_ec_data(priv->adev->handle, VPCCMD_R_BL, &now))
-=09=09return -EIO;
+=09err =3D read_ec_data(priv->adev->handle, VPCCMD_R_BL, &now);
+=09if (err)
+=09=09return err;
 =09return now;
 }
=20
 static int ideapad_backlight_update_status(struct backlight_device *blight=
dev)
 {
 =09struct ideapad_private *priv =3D bl_get_data(blightdev);
+=09int err;
=20
 =09if (!priv)
 =09=09return -EINVAL;
=20
-=09if (write_ec_cmd(priv->adev->handle, VPCCMD_W_BL,
-=09=09=09 blightdev->props.brightness))
-=09=09return -EIO;
-=09if (write_ec_cmd(priv->adev->handle, VPCCMD_W_BL_POWER,
-=09=09=09 blightdev->props.power =3D=3D FB_BLANK_POWERDOWN ? 0 : 1))
-=09=09return -EIO;
+=09err =3D write_ec_cmd(priv->adev->handle, VPCCMD_W_BL,
+=09=09=09   blightdev->props.brightness);
+=09if (err)
+=09=09return err;
+=09err =3D write_ec_cmd(priv->adev->handle, VPCCMD_W_BL_POWER,
+=09=09=09   blightdev->props.power !=3D FB_BLANK_POWERDOWN);
+=09if (err)
+=09=09return err;
=20
 =09return 0;
 }
@@ -804,13 +816,17 @@ static int ideapad_backlight_init(struct ideapad_priv=
ate *priv)
 =09struct backlight_device *blightdev;
 =09struct backlight_properties props;
 =09unsigned long max, now, power;
-
-=09if (read_ec_data(priv->adev->handle, VPCCMD_R_BL_MAX, &max))
-=09=09return -EIO;
-=09if (read_ec_data(priv->adev->handle, VPCCMD_R_BL, &now))
-=09=09return -EIO;
-=09if (read_ec_data(priv->adev->handle, VPCCMD_R_BL_POWER, &power))
-=09=09return -EIO;
+=09int err;
+
+=09err =3D read_ec_data(priv->adev->handle, VPCCMD_R_BL_MAX, &max);
+=09if (err)
+=09=09return err;
+=09err =3D read_ec_data(priv->adev->handle, VPCCMD_R_BL, &now);
+=09if (err)
+=09=09return err;
+=09err =3D read_ec_data(priv->adev->handle, VPCCMD_R_BL_POWER, &power);
+=09if (err)
+=09=09return err;
=20
 =09memset(&props, 0, sizeof(struct backlight_properties));
 =09props.max_brightness =3D max;
--=20
2.29.2



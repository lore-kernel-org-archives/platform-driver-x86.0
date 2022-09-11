Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D78EECAAD3
	for <platform-driver-x86@archiver.kernel.org>; Sun, 11 Sep 2022 18:08:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbiIKSIc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 11 Sep 2022 14:08:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbiIKSIb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 11 Sep 2022 14:08:31 -0400
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4587E20BD5
        for <platform-driver-x86@vger.kernel.org>; Sun, 11 Sep 2022 11:08:27 -0700 (PDT)
Date:   Sun, 11 Sep 2022 18:08:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1662919704; x=1663178904;
        bh=nf7B2DgRTdBvBcuo9n6wvTsuhh/fLCneIyBnA0TLIjw=;
        h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
         References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
         Feedback-ID:Message-ID;
        b=EdO+/kF5hOwjGm2pkXWPs5SrUo6hvoUqEIsaOB/TPGbQ1zQ2j8thS3z3EOoOVUDDx
         JViAgQFoHdo/spH1wywSRXAjRayve1Jc8AJsluWDmrPjmVF6DS9YYj59gUwZ9jXKDa
         sViEDkp7xZN13XKVEHP60ezuh2pZwDh/GnO9JmakOEgk2ey6dGsE1xpJo43pzDowVD
         du76oTGlfCn12/lhDSWJOKTD1iP2H86EhVYFX5cshTzFrWDQnAJUDQ21DkhVS8R6sY
         kIDEs8PwBTwgNDbsGjcrdNI1qX0XMZDss+NDWpMaI+ZMJ6xoRvuuqjy609WkWvGfPn
         2yM3DLzGvYp8A==
To:     Philipp Jungkamp <p.jungkamp@gmx.net>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Ike Panhc <ike.pan@canonical.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH] Add IdeaPad quick_charge attribute to sysfs
Message-ID: <53wDIoII2bk1Vao8Qd8ld5zPUc4AspLN6vlcaLzZWMIDEw8CDekKbEXien_60KD8F9V51jk5vuf55FFKQafHGKeYGOrIcJXVhoZRQsYKbqE=@protonmail.com>
In-Reply-To: <20220911161718.24284-1-p.jungkamp@gmx.net>
References: <20220911161718.24284-1-p.jungkamp@gmx.net>
Feedback-ID: 20568564:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi


2022. szeptember 11., vas=C3=A1rnap 18:17 keltez=C3=A9ssel, Philipp Jungkam=
p =C3=ADrta:
> More recent IdeaPads allow USB-C quick-charging to be controlled via
> ACPI. This seems to be mutually exclusive with the ACPI conservation
> mode.
>=20
> Expose a readable and writable 'quick_charge' sysfs attribute next when
> support is indicated in ACPI.
> ---
> I deduced the indicator bits from their names in the DSDT (QCHO and
> QCHX). I don't have an IdeaPad except mine on hand and can't check
> whether these are indeed the intended uses or their behaviour on other
> IdeaPads. I can confirm that a change in the quick_charge toggle is
> visible in Lenovo Vantage when dual booting into Windows 11.
>=20
> Greetings,
> Philipp Jungkamp

There is already an entry for this on the kernel bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=3D216176

I have two concerns: one, it adds a new driver specific attribute for a som=
ewhat
generic functionality; two, Lenovo Vantage does not only check this single =
bit
before allowing this mode to be enabled (as far as I can recall).


Regards,
Barnab=C3=A1s P=C5=91cze


>=20
>  drivers/platform/x86/ideapad-laptop.c | 64 ++++++++++++++++++++++++++-
>  1 file changed, 62 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86=
/ideapad-laptop.c
> index abd0c81d62c4..dea35779264a 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -54,12 +54,16 @@ enum {
>  };
>=20
>  enum {
> -=09GBMD_CONSERVATION_STATE_BIT =3D 5,
> +=09GBMD_QUICK_CHARGE_STATE_BIT   =3D 2,
> +=09GBMD_CONSERVATION_STATE_BIT   =3D 5,
> +=09GBMD_QUICK_CHARGE_SUPPORT_BIT =3D 17,
>  };
>=20
>  enum {
>  =09SBMC_CONSERVATION_ON  =3D 3,
>  =09SBMC_CONSERVATION_OFF =3D 5,
> +=09SBMC_QUICK_CHARGE_ON  =3D 7,
> +=09SBMC_QUICK_CHARGE_OFF =3D 8,
>  };
>=20
>  enum {
> @@ -140,6 +144,7 @@ struct ideapad_private {
>  =09=09bool kbd_bl               : 1;
>  =09=09bool touchpad_ctrl_via_ec : 1;
>  =09=09bool usb_charging         : 1;
> +=09=09bool quick_charge         : 1;
>  =09} features;
>  =09struct {
>  =09=09bool initialized;
> @@ -482,6 +487,12 @@ static ssize_t conservation_mode_store(struct device=
 *dev,
>  =09if (err)
>  =09=09return err;
>=20
> +=09if (priv->features.quick_charge && state) {
> +=09=09err =3D exec_sbmc(priv->adev->handle, SBMC_QUICK_CHARGE_OFF);
> +=09=09if (err)
> +=09=09=09return err;
> +=09}
> +
>  =09err =3D exec_sbmc(priv->adev->handle, state ? SBMC_CONSERVATION_ON : =
SBMC_CONSERVATION_OFF);
>  =09if (err)
>  =09=09return err;
> @@ -491,6 +502,48 @@ static ssize_t conservation_mode_store(struct device=
 *dev,
>=20
>  static DEVICE_ATTR_RW(conservation_mode);
>=20
> +static ssize_t quick_charge_show(struct device *dev,
> +=09=09=09=09 struct device_attribute *attr,
> +=09=09=09=09 char *buf)
> +{
> +=09struct ideapad_private *priv =3D dev_get_drvdata(dev);
> +=09unsigned long result;
> +=09int err;
> +
> +=09err =3D eval_gbmd(priv->adev->handle, &result);
> +=09if (err)
> +=09=09return err;
> +
> +=09return sysfs_emit(buf, "%d\n", !!test_bit(GBMD_QUICK_CHARGE_STATE_BIT=
, &result));
> +}
> +
> +static ssize_t quick_charge_store(struct device *dev,
> +=09=09=09=09  struct device_attribute *attr,
> +=09=09=09=09  const char *buf, size_t count)
> +{
> +=09struct ideapad_private *priv =3D dev_get_drvdata(dev);
> +=09bool state;
> +=09int err;
> +
> +=09err =3D kstrtobool(buf, &state);
> +=09if (err)
> +=09=09return err;
> +
> +=09if (priv->features.conservation_mode && state) {
> +=09=09err =3D exec_sbmc(priv->adev->handle, SBMC_CONSERVATION_OFF);
> +=09=09if (err)
> +=09=09=09return err;
> +=09}
> +
> +=09err =3D exec_sbmc(priv->adev->handle, state ? SBMC_QUICK_CHARGE_ON : =
SBMC_QUICK_CHARGE_OFF);
> +=09if (err)
> +=09=09return err;
> +
> +=09return count;
> +}
> +
> +static DEVICE_ATTR_RW(quick_charge);
> +
>  static ssize_t fan_mode_show(struct device *dev,
>  =09=09=09     struct device_attribute *attr,
>  =09=09=09     char *buf)
> @@ -641,6 +694,7 @@ static DEVICE_ATTR_RW(usb_charging);
>  static struct attribute *ideapad_attributes[] =3D {
>  =09&dev_attr_camera_power.attr,
>  =09&dev_attr_conservation_mode.attr,
> +=09&dev_attr_quick_charge.attr,
>  =09&dev_attr_fan_mode.attr,
>  =09&dev_attr_fn_lock.attr,
>  =09&dev_attr_touchpad.attr,
> @@ -660,6 +714,8 @@ static umode_t ideapad_is_visible(struct kobject *kob=
j,
>  =09=09supported =3D test_bit(CFG_CAP_CAM_BIT, &priv->cfg);
>  =09else if (attr =3D=3D &dev_attr_conservation_mode.attr)
>  =09=09supported =3D priv->features.conservation_mode;
> +=09else if (attr =3D=3D &dev_attr_quick_charge.attr)
> +=09=09supported =3D priv->features.quick_charge;
>  =09else if (attr =3D=3D &dev_attr_fan_mode.attr)
>  =09=09supported =3D priv->features.fan_mode;
>  =09else if (attr =3D=3D &dev_attr_fn_lock.attr)
> @@ -1546,9 +1602,13 @@ static void ideapad_check_features(struct ideapad_=
private *priv)
>  =09if (!read_ec_data(handle, VPCCMD_R_FAN, &val))
>  =09=09priv->features.fan_mode =3D true;
>=20
> -=09if (acpi_has_method(handle, "GBMD") && acpi_has_method(handle, "SBMC"=
))
> +=09if (acpi_has_method(handle, "GBMD") && acpi_has_method(handle, "SBMC"=
)) {
>  =09=09priv->features.conservation_mode =3D true;
>=20
> +=09=09if (!eval_gbmd(handle,&val) && test_bit(GBMD_QUICK_CHARGE_SUPPORT_=
BIT, &val))
> +=09=09=09priv->features.quick_charge =3D true;
> +=09}
> +
>  =09if (acpi_has_method(handle, "DYTC"))
>  =09=09priv->features.dytc =3D true;
>=20
> --
> 2.37.3
> 

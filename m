Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55075C4338F
	for <platform-driver-x86@archiver.kernel.org>; Sun, 22 Aug 2021 18:53:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A54061248
	for <platform-driver-x86@archiver.kernel.org>; Sun, 22 Aug 2021 18:53:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230245AbhHVSxt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 22 Aug 2021 14:53:49 -0400
Received: from mail1.protonmail.ch ([185.70.40.18]:50170 "EHLO
        mail1.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229850AbhHVSxt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 22 Aug 2021 14:53:49 -0400
Date:   Sun, 22 Aug 2021 18:53:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1629658386;
        bh=ytF2aLsZm9mWPv5hVhZurBOewRdKwxRzy42QHOaomAA=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=YVsFaC1ssKuXVsNh7U+EJrZtzCxIuz5Tz62v7Oib+RgtMc8DyixOi5/KeWyyiexxc
         Cp7AlQ8CrJ+HTdVxeGkTftXtUFqD8Kh/R8b6EjvIhvqK7DDlGq9DDGkLoMtSszzijt
         CTrWYhrizuL7CNGkZ4OZKzvFjrDc0/u1Y2QDlkEE=
To:     Enver Balalic <balalic.enver@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Guenter Roeck <linux@roeck-us.net>, hdegoede@redhat.com,
        mgross@linux.intel.com, platform-driver-x86@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH] platform/x86: hp-wmi: add support for omen laptops
Message-ID: <QE1CIdLSloSwQQSm0WtOvLS4FokfcOI98asGDxe9ou4lNhblbatRDH1zhlPj6zMukG36Z2vNrJnnoIMhKEHsbhp4iqb3Xg9zDi_bua-Js8w=@protonmail.com>
In-Reply-To: <20210822181051.jefthtoelu5kujcg@omen.localdomain>
References: <20210822163143.jutjs7un5d547ehr@omen.localdomain> <dmlqFeCj95CYJBSHp58FRsLPWQqI-Kh_O82mUrhHsBbnCNKSwlWd9ynWz2JQAdWwaGMvagH5LOQlz0r5_5yerwCZRXIJLbU4lmTOu03ZQnU=@protonmail.com> <f79cf69c-e050-5008-f01f-344257d66c45@roeck-us.net> <20210822181051.jefthtoelu5kujcg@omen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi


2021. augusztus 22., vas=C3=A1rnap 20:10 keltez=C3=A9ssel, Enver Balalic =
=C3=ADrta:
> [...]
> > > > +static int hp_wmi_hwmon_init(void)
> > > > +{
> > > > +=09struct device *dev =3D &hp_wmi_platform_dev->dev;
> > > > +=09struct device *hwmon;
> > > > +
> > > > +=09hwmon =3D devm_hwmon_device_register_with_groups(dev, "hp", &hp=
_wmi_driver,
> > > > +=09=09=09hwmon_attribute_groups);
> > >
> > > I think you should use
> > >
> > >    [devm_]hwmon_device_register_with_info()
> > >
> > > as it creates sysfs attributes for you, etc. You wouldn't need to man=
ually
> > > create device attributes, and you wouldn't need fan{1,2}_show() at al=
l.
> > >
> >
> > Correct. Also, the code as written doesn't really make sense as hwmon d=
river
> > because all its attributes are non-standard. The "sensors" command will=
 show
> > nothing.
> >
>
> I failed to take a look at the documentation instead i just looked at a
> different laptop's WMI driver as a reference. My bad.
>
> > If you don't want to use standard hwmon ABI attributes, please don't re=
gister
> > a hwmon driver. The non-standard attributes can reside in the platform
> > sysfs directory. There is already the non-standard "hddtemp", so that w=
ould
> > not make much of a difference anyway. On top of that, "max_fan" is adde=
d as
> > non-hwmon attribute, making the hwmon registration even more pointless.
> >
> > Guenter
>
> I would like to expose these fan speeds properly, and hwmon seemed like
> the way to do it. I'll redo this part to match how it should be done in t=
he
> documentation.
>
> The questions I have are:
>
> The only value I have is the current fan speed in RPM, I don't have
> the rest of the values like min,max,pulses,target. Is it ok to implement =
this
> in hwmon if I don't have those values? Can I use default values in place =
of
> the ones I don't have, or should i omit those fields entirely.
> I can assume min speed to be 0 since it does turn off the fans at light l=
oad
> but in the case of the max speed property, I don't know what it is. Do I =
omit
> that field entirely or ?
>

I think you can simply omit what you don't have. In your case,
I imagine you'll have something like this:

  static const struct hwmon_channel_info *info[] =3D {
    HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT),
    HWMON_CHANNEL_INFO(pwm, HWMON_PWM_ENABLE),
    NULL
  };

  static const struct hwmon_ops ops =3D {
    .is_visible =3D ...,
    .read       =3D ...,
    .write      =3D ...,
  };

  static const struct hwmon_chip_info chip_info =3D {
    .ops  =3D &ops,
    .info =3D info,
  };


> The "max_fan" that I added is not a RPM value, it's a simple toggle in WM=
I
> that either sets the fans to blow at their max speed (1), or it sets them
> to auto (0), this matches what the windows omen command center does.
> I don't know of a way to expose this "properly" so i just added a simple
> attribute. Is there a proper way to expose this behaviour ?
>

I believe the proper way to expose that is via a pwmN_enable attribute on t=
he
hwmon device, this should be created by the hwmon subsystem when it sees th=
e

  HWMON_CHANNEL_INFO(pwm, HWMON_PWM_ENABLE),

channel in the info struct.

If both fans are controlled by one switch, I think it's fine to just have a
single pwmN_enable attribute. But Guenter can probably tell you more.

For this attribute the value 2 means automatic, 1 means manual, 0 means ful=
l speed
as far as I'm aware (at least this is what thinkpad_acpi does). If manual f=
an
control is not available, returning -EOPNOTSUPP is probably fine.


> [...]


Best regards,
Barnab=C3=A1s P=C5=91cze

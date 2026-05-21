Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4B13CDBDF
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2026 13:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779369430; cv=none; b=UW/zngmuH9lz33HjuX5O+QKuPAj7oANLXvKSb8Pk2UgbRhSiSixVYLdSW3AGtpP0oDW08R6DUfsc9sf1C6axEvnXJSRD2DUr4Q7LWRi6KmQv08qpMeHV8rnZtBP4yHWe+D1yLnUMLZnSqlTRilpG1OSoEei/EDIoG5ZBUahpSIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779369430; c=relaxed/simple;
	bh=jDA+GmpXeDYmTN6Q7UEDhzJfS0O0/46BE8ejbAdWWe0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=lKfiNoE0T6ApQ+2StaXhMuLxARm2NJM3yL2NmoQmK8u5rEueW7pX5xw6FBTj7eT+o0fYRFaRzLTn6lXKbUgeRyuM37GD8W2jw1BEEkxDNnKjowcpCekjXQpfYXwNrCkt380zML8XFhge7AAbRzJtBzCoonyOQ1JFQKMwxd9csto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gO88AtwX; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gO88AtwX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779369429; x=1810905429;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=jDA+GmpXeDYmTN6Q7UEDhzJfS0O0/46BE8ejbAdWWe0=;
  b=gO88AtwXZNxtU7KMOAQSH7UiOy4jba/g5rdU/5WymX4ivEm/bQ1kZ/7H
   rXhKDDKAaEC7V2vqwoeEBxzPXdE/UAUMWgQcPW4uoGeB+DK+1+isqXS5x
   hoty7mmM+kEvZuSEJF96fFLmxbVgMQi8KaYejqS55VArNWsE5kerKc+HO
   LVlAShB2fG6XfK3k4OLDANC8bn2pImzRNeKgbGi+7Gmvp6MwoIM87983r
   3dd3gZsYEq2uXSzvHVHrjCr6hVfk/vsw4RGLbDphEqWOJxGjPExYJLUg6
   XTIdTk+scXoS4WU9qUCLBUvU2xgVcsf0qRy045IhOc2JKN7bb4Y2Z5H28
   A==;
X-CSE-ConnectionGUID: dmiN8BBeQSiDBC0xyNOWKA==
X-CSE-MsgGUID: cUjCmF3+S+CClB4kVwL1TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="105747312"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="105747312"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 06:17:08 -0700
X-CSE-ConnectionGUID: B/GfSriXQQWZsAzJLSkdEg==
X-CSE-MsgGUID: yIr5b8wpSdC8M21MMsGm5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="236109825"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.98])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 06:17:05 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 21 May 2026 16:17:02 +0300 (EEST)
To: Radhey Kalra <radheykalra901@gmail.com>
cc: platform-driver-x86@vger.kernel.org, krishna.chomal108@gmail.com
Subject: Re: [PATCH v5 1/2] platform/x86: hp-wmi: Prepare Victus fan control
 board data
In-Reply-To: <CAJ5VyXKpDK6ZPBvkLwTqsUryZBzQY6NnFZX51zmcXyAs9kzzDg@mail.gmail.com>
Message-ID: <9187b87f-3842-c41d-b4ab-6c0968c884d7@linux.intel.com>
References: <20260520140800.130530-1-radheykalra901@gmail.com> <20260520140800.130530-2-radheykalra901@gmail.com> <7c6770ca-b9db-9504-d0d2-11a136955dee@linux.intel.com> <CAJ5VyXKpDK6ZPBvkLwTqsUryZBzQY6NnFZX51zmcXyAs9kzzDg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1133350261-1779369422=:1175"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1133350261-1779369422=:1175
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 21 May 2026, Radhey Kalra wrote:

> Hi Ilpo,
>=20
> Agreed, that was a mistake. The gpu_delta parsing change does not
> logically belong in the board-data refactor.
>=20
> I folded it into the preparatory patch while trying to reduce the
> series size, but that made the patch less focused.

If we're talking about < 25 patches, you should not even think of the=20
series length. Many focused patches is almost always better from=20
reviewer's perspective than a large chunk which mixes things up (it's=20
also used if somebody looks these commits from git history later,=20
smaller changes are just easier to check for correctness).

--=20
 i.

> I will split it
> back out so the series is:
>=20
> board-data / fan-control selection refactor
> fan-table gpu_delta parsing fix
> 8A3D board addition
>=20
> Thanks, Radhey
>=20
>=20
> On Thu, May 21, 2026 at 6:33=E2=80=AFPM Ilpo J=C3=A4rvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
> >
> > On Wed, 20 May 2026, Radhey Kalra wrote:
> >
> > > Move the Victus S thermal-profile DMI data behind hp_wmi_board_params=
 so
> > > board-specific feature data can describe thermal-profile and fan-cont=
rol
> > > support together.
> > >
> > > Use the active board data for fan-control decisions instead of checki=
ng
> > > is_victus_s_thermal_profile() in the hwmon path.
> >
> > > Also derive gpu_delta
> > > from the first non-zero GPU RPM row so fan tables whose first GPU RPM=
 is
> > > zero still produce valid fan settings.
> >
> > Unfortunately, moving gpu_delta things from own patch to the refactor
> > patch is a step backwards.
> >
> > Why would it logically belong to this patch??
> >
> > --
> >  i.
> >
> > > No fan-control support changes intended for existing boards. Fan tabl=
es
> > > with an initial zero GPU RPM row now produce a valid GPU delta.
> > >
> > > Signed-off-by: Radhey Kalra <radheykalra901@gmail.com>
> > > ---
> > >  drivers/platform/x86/hp/hp-wmi.c | 204 ++++++++++++++++++++++-------=
--
> > >  1 file changed, 145 insertions(+), 59 deletions(-)
> > >
> > > diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/=
hp/hp-wmi.c
> > > index d1cc6e7..dcfffe6 100644
> > > --- a/drivers/platform/x86/hp/hp-wmi.c
> > > +++ b/drivers/platform/x86/hp/hp-wmi.c
> > > @@ -133,11 +133,52 @@ static const struct thermal_profile_params omen=
_v1_no_ec_thermal_params =3D {
> > >       .ec_tp_offset   =3D HP_NO_THERMAL_PROFILE_OFFSET,
> > >  };
> > >
> > > -/*
> > > - * A generic pointer for the currently-active board's thermal profil=
e
> > > - * parameters.
> > > - */
> > > -static struct thermal_profile_params *active_thermal_profile_params;
> > > +struct hp_wmi_fan_profile_params {
> > > +     int (*get_fan_speed)(int fan);
> > > +     bool fan_table;
> > > +};
> > > +
> > > +struct hp_wmi_board_params {
> > > +     const struct thermal_profile_params *thermal_profile;
> > > +     const struct hp_wmi_fan_profile_params *fan_profile;
> > > +};
> > > +
> > > +static int hp_wmi_get_fan_speed_victus_s(int fan);
> > > +
> > > +static const struct hp_wmi_fan_profile_params victus_s_fan_profile_p=
arams =3D {
> > > +     .get_fan_speed  =3D hp_wmi_get_fan_speed_victus_s,
> > > +     .fan_table      =3D true,
> > > +};
> > > +
> > > +static const struct hp_wmi_board_params victus_s_board_params =3D {
> > > +     .thermal_profile        =3D &victus_s_thermal_params,
> > > +     .fan_profile            =3D &victus_s_fan_profile_params,
> > > +};
> > > +
> > > +static const struct hp_wmi_board_params omen_v1_board_params =3D {
> > > +     .thermal_profile        =3D &omen_v1_thermal_params,
> > > +     .fan_profile            =3D &victus_s_fan_profile_params,
> > > +};
> > > +
> > > +static const struct hp_wmi_board_params omen_v1_legacy_board_params =
=3D {
> > > +     .thermal_profile        =3D &omen_v1_legacy_thermal_params,
> > > +     .fan_profile            =3D &victus_s_fan_profile_params,
> > > +};
> > > +
> > > +static const struct hp_wmi_board_params omen_v1_no_ec_board_params =
=3D {
> > > +     .thermal_profile        =3D &omen_v1_no_ec_thermal_params,
> > > +     .fan_profile            =3D &victus_s_fan_profile_params,
> > > +};
> > > +
> > > +static const struct hp_wmi_board_params *active_board_params;
> > > +
> > > +static const struct thermal_profile_params *hp_wmi_thermal_profile(v=
oid)
> > > +{
> > > +     if (!active_board_params)
> > > +             return NULL;
> > > +
> > > +     return active_board_params->thermal_profile;
> > > +}
> > >
> > >  /* DMI board names of devices that should use the omen specific path=
 for
> > >   * thermal profiles.
> > > @@ -187,67 +228,67 @@ static const char * const victus_thermal_profil=
e_boards[] =3D {
> > >       "8A25",
> > >  };
> > >
> > > -/* DMI Board names of Victus 16-r and Victus 16-s laptops */
> > > -static const struct dmi_system_id victus_s_thermal_profile_boards[] =
__initconst =3D {
> > > +/* DMI board-specific feature data for Omen and Victus laptops. */
> > > +static const struct dmi_system_id hp_wmi_feature_boards[] __initcons=
t =3D {
> > >       {
> > >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8A44") },
> > > -             .driver_data =3D (void *)&omen_v1_legacy_thermal_params=
,
> > > +             .driver_data =3D (void *)&omen_v1_legacy_board_params,
> > >       },
> > >       {
> > >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8A4D") },
> > > -             .driver_data =3D (void *)&omen_v1_legacy_thermal_params=
,
> > > +             .driver_data =3D (void *)&omen_v1_legacy_board_params,
> > >       },
> > >       {
> > >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8BAB") },
> > > -             .driver_data =3D (void *)&omen_v1_thermal_params,
> > > +             .driver_data =3D (void *)&omen_v1_board_params,
> > >       },
> > >       {
> > >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8BBE") },
> > > -             .driver_data =3D (void *)&victus_s_thermal_params,
> > > +             .driver_data =3D (void *)&victus_s_board_params,
> > >       },
> > >       {
> > >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8BCA") },
> > > -             .driver_data =3D (void *)&omen_v1_thermal_params,
> > > +             .driver_data =3D (void *)&omen_v1_board_params,
> > >       },
> > >       {
> > >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8BCD") },
> > > -             .driver_data =3D (void *)&omen_v1_thermal_params,
> > > +             .driver_data =3D (void *)&omen_v1_board_params,
> > >       },
> > >       {
> > >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8BD4") },
> > > -             .driver_data =3D (void *)&victus_s_thermal_params,
> > > +             .driver_data =3D (void *)&victus_s_board_params,
> > >       },
> > >       {
> > >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8BD5") },
> > > -             .driver_data =3D (void *)&victus_s_thermal_params,
> > > +             .driver_data =3D (void *)&victus_s_board_params,
> > >       },
> > >       {
> > >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8C76") },
> > > -             .driver_data =3D (void *)&omen_v1_thermal_params,
> > > +             .driver_data =3D (void *)&omen_v1_board_params,
> > >       },
> > >       {
> > >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8C77") },
> > > -             .driver_data =3D (void *)&omen_v1_thermal_params,
> > > +             .driver_data =3D (void *)&omen_v1_board_params,
> > >       },
> > >       {
> > >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8C78") },
> > > -             .driver_data =3D (void *)&omen_v1_thermal_params,
> > > +             .driver_data =3D (void *)&omen_v1_board_params,
> > >       },
> > >       {
> > >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8C99") },
> > > -             .driver_data =3D (void *)&victus_s_thermal_params,
> > > +             .driver_data =3D (void *)&victus_s_board_params,
> > >       },
> > >       {
> > >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8C9C") },
> > > -             .driver_data =3D (void *)&victus_s_thermal_params,
> > > +             .driver_data =3D (void *)&victus_s_board_params,
> > >       },
> > >       {
> > >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8D41") },
> > > -             .driver_data =3D (void *)&victus_s_thermal_params,
> > > +             .driver_data =3D (void *)&victus_s_board_params,
> > >       },
> > >       {
> > >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8D87") },
> > > -             .driver_data =3D (void *)&omen_v1_no_ec_thermal_params,
> > > +             .driver_data =3D (void *)&omen_v1_no_ec_board_params,
> > >       },
> > >       {},
> > >  };
> > > @@ -1769,6 +1810,38 @@ static bool is_victus_s_thermal_profile(void)
> > >       return is_victus_s_board;
> > >  }
> > >
> > > +static const struct hp_wmi_fan_profile_params *hp_wmi_fan_profile(vo=
id)
> > > +{
> > > +     if (!active_board_params)
> > > +             return NULL;
> > > +
> > > +     return active_board_params->fan_profile;
> > > +}
> > > +
> > > +static bool hp_wmi_fan_control_supported(void)
> > > +{
> > > +     const struct hp_wmi_fan_profile_params *params =3D hp_wmi_fan_p=
rofile();
> > > +
> > > +     return params && params->get_fan_speed;
> > > +}
> > > +
> > > +static bool hp_wmi_fan_table_supported(void)
> > > +{
> > > +     const struct hp_wmi_fan_profile_params *params =3D hp_wmi_fan_p=
rofile();
> > > +
> > > +     return params && params->fan_table;
> > > +}
> > > +
> > > +static int hp_wmi_get_active_fan_speed(int fan)
> > > +{
> > > +     const struct hp_wmi_fan_profile_params *params =3D hp_wmi_fan_p=
rofile();
> > > +
> > > +     if (!params || !params->get_fan_speed)
> > > +             return -EOPNOTSUPP;
> > > +
> > > +     return params->get_fan_speed(fan);
> > > +}
> > > +
> > >  static int victus_s_gpu_thermal_profile_get(bool *ctgp_enable,
> > >                                           bool *ppab_enable,
> > >                                           u8 *dstate,
> > > @@ -1854,7 +1927,10 @@ static int platform_profile_victus_s_get_ec(en=
um platform_profile_option *profil
> > >       u8 current_dstate, current_gpu_slowdown_temp, tp;
> > >       const struct thermal_profile_params *params;
> > >
> > > -     params =3D active_thermal_profile_params;
> > > +     params =3D hp_wmi_thermal_profile();
> > > +     if (!params)
> > > +             return -ENODEV;
> > > +
> > >       if (params->ec_tp_offset =3D=3D HP_EC_OFFSET_UNKNOWN ||
> > >           params->ec_tp_offset =3D=3D HP_NO_THERMAL_PROFILE_OFFSET) {
> > >               *profile =3D active_platform_profile;
> > > @@ -1866,10 +1942,10 @@ static int platform_profile_victus_s_get_ec(e=
num platform_profile_option *profil
> > >               return ret;
> > >
> > >       /*
> > > -      * We cannot use active_thermal_profile_params here, because bo=
ards
> > > -      * like 8C78 have tp =3D=3D 0x0 || tp =3D=3D 0x1 after cold boo=
t, but logically
> > > -      * it should have tp =3D=3D 0x30 || tp =3D=3D 0x31, as correcte=
d by the Omen
> > > -      * Gaming Hub on windows. Hence accept both of these values.
> > > +      * Boards like 8C78 have tp =3D=3D 0x0 || tp =3D=3D 0x1 after c=
old boot,
> > > +      * but logically it should have tp =3D=3D 0x30 || tp =3D=3D 0x3=
1, as
> > > +      * corrected by the Omen Gaming Hub on windows. Hence accept bo=
th
> > > +      * of these values.
> > >        */
> > >       if (tp =3D=3D victus_s_thermal_params.performance ||
> > >           tp =3D=3D omen_v1_thermal_params.performance) {
> > > @@ -1904,12 +1980,12 @@ static int platform_profile_victus_s_get_ec(e=
num platform_profile_option *profil
> > >
> > >  static int platform_profile_victus_s_set_ec(enum platform_profile_op=
tion profile)
> > >  {
> > > -     struct thermal_profile_params *params;
> > > +     const struct thermal_profile_params *params;
> > >       bool gpu_ctgp_enable, gpu_ppab_enable;
> > >       u8 gpu_dstate; /* Test shows 1 =3D 100%, 2 =3D 50%, 3 =3D 25%, =
4 =3D 12.5% */
> > >       int err, tp;
> > >
> > > -     params =3D active_thermal_profile_params;
> > > +     params =3D hp_wmi_thermal_profile();
> > >       if (!params)
> > >               return -ENODEV;
> > >
> > > @@ -2175,6 +2251,7 @@ static const struct platform_profile_ops hp_wmi=
_platform_profile_ops =3D {
> > >  static int thermal_profile_setup(struct platform_device *device)
> > >  {
> > >       const struct platform_profile_ops *ops;
> > > +     const struct thermal_profile_params *params;
> > >       int err, tp;
> > >
> > >       if (is_omen_thermal_profile()) {
> > > @@ -2206,13 +2283,17 @@ static int thermal_profile_setup(struct platf=
orm_device *device)
> > >
> > >               ops =3D &platform_profile_victus_ops;
> > >       } else if (is_victus_s_thermal_profile()) {
> > > +             params =3D hp_wmi_thermal_profile();
> > > +             if (!params)
> > > +                     return -ENODEV;
> > > +
> > >               /*
> > >                * For an unknown EC layout board, platform_profile_vic=
tus_s_get_ec(),
> > >                * behaves like a wrapper around active_platform_profil=
e, to avoid using
> > >                * uninitialized data, we default to PLATFORM_PROFILE_B=
ALANCED.
> > >                */
> > > -             if (active_thermal_profile_params->ec_tp_offset =3D=3D =
HP_EC_OFFSET_UNKNOWN ||
> > > -                 active_thermal_profile_params->ec_tp_offset =3D=3D =
HP_NO_THERMAL_PROFILE_OFFSET) {
> > > +             if (params->ec_tp_offset =3D=3D HP_EC_OFFSET_UNKNOWN ||
> > > +                 params->ec_tp_offset =3D=3D HP_NO_THERMAL_PROFILE_O=
FFSET) {
> > >                       active_platform_profile =3D PLATFORM_PROFILE_BA=
LANCED;
> > >               } else {
> > >                       err =3D platform_profile_victus_s_get_ec(&activ=
e_platform_profile);
> > > @@ -2380,7 +2461,7 @@ static int hp_wmi_apply_fan_settings(struct hp_=
wmi_hwmon_priv *priv)
> > >
> > >       switch (priv->mode) {
> > >       case PWM_MODE_MAX:
> > > -             if (is_victus_s_thermal_profile()) {
> > > +             if (hp_wmi_fan_control_supported()) {
> > >                       ret =3D hp_wmi_get_fan_count_userdefine_trigger=
();
> > >                       if (ret < 0)
> > >                               return ret;
> > > @@ -2392,7 +2473,7 @@ static int hp_wmi_apply_fan_settings(struct hp_=
wmi_hwmon_priv *priv)
> > >                                secs_to_jiffies(KEEP_ALIVE_DELAY_SECS)=
);
> > >               return 0;
> > >       case PWM_MODE_MANUAL:
> > > -             if (!is_victus_s_thermal_profile())
> > > +             if (!hp_wmi_fan_control_supported())
> > >                       return -EOPNOTSUPP;
> > >               ret =3D hp_wmi_fan_speed_set(priv, pwm_to_rpm(priv->pwm=
, priv));
> > >               if (ret < 0)
> > > @@ -2401,7 +2482,7 @@ static int hp_wmi_apply_fan_settings(struct hp_=
wmi_hwmon_priv *priv)
> > >                                secs_to_jiffies(KEEP_ALIVE_DELAY_SECS)=
);
> > >               return 0;
> > >       case PWM_MODE_AUTO:
> > > -             if (is_victus_s_thermal_profile()) {
> > > +             if (hp_wmi_fan_control_supported()) {
> > >                       ret =3D hp_wmi_get_fan_count_userdefine_trigger=
();
> > >                       if (ret < 0)
> > >                               return ret;
> > > @@ -2425,12 +2506,12 @@ static umode_t hp_wmi_hwmon_is_visible(const =
void *data,
> > >  {
> > >       switch (type) {
> > >       case hwmon_pwm:
> > > -             if (attr =3D=3D hwmon_pwm_input && !is_victus_s_thermal=
_profile())
> > > +             if (attr =3D=3D hwmon_pwm_input && !hp_wmi_fan_control_=
supported())
> > >                       return 0;
> > >               return 0644;
> > >       case hwmon_fan:
> > > -             if (is_victus_s_thermal_profile()) {
> > > -                     if (hp_wmi_get_fan_speed_victus_s(channel) >=3D=
 0)
> > > +             if (hp_wmi_fan_control_supported()) {
> > > +                     if (hp_wmi_get_active_fan_speed(channel) >=3D 0=
)
> > >                               return 0444;
> > >               } else {
> > >                       if (hp_wmi_get_fan_speed(channel) >=3D 0)
> > > @@ -2454,8 +2535,8 @@ static int hp_wmi_hwmon_read(struct device *dev=
, enum hwmon_sensor_types type,
> > >       priv =3D dev_get_drvdata(dev);
> > >       switch (type) {
> > >       case hwmon_fan:
> > > -             if (is_victus_s_thermal_profile())
> > > -                     ret =3D hp_wmi_get_fan_speed_victus_s(channel);
> > > +             if (hp_wmi_fan_control_supported())
> > > +                     ret =3D hp_wmi_get_active_fan_speed(channel);
> > >               else
> > >                       ret =3D hp_wmi_get_fan_speed(channel);
> > >               if (ret < 0)
> > > @@ -2464,10 +2545,10 @@ static int hp_wmi_hwmon_read(struct device *d=
ev, enum hwmon_sensor_types type,
> > >               return 0;
> > >       case hwmon_pwm:
> > >               if (attr =3D=3D hwmon_pwm_input) {
> > > -                     if (!is_victus_s_thermal_profile())
> > > +                     if (!hp_wmi_fan_control_supported())
> > >                               return -EOPNOTSUPP;
> > >
> > > -                     rpm =3D hp_wmi_get_fan_speed_victus_s(channel);
> > > +                     rpm =3D hp_wmi_get_active_fan_speed(channel);
> > >                       if (rpm < 0)
> > >                               return rpm;
> > >                       *val =3D rpm_to_pwm(rpm / 100, priv);
> > > @@ -2501,7 +2582,7 @@ static int hp_wmi_hwmon_write(struct device *de=
v, enum hwmon_sensor_types type,
> > >       switch (type) {
> > >       case hwmon_pwm:
> > >               if (attr =3D=3D hwmon_pwm_input) {
> > > -                     if (!is_victus_s_thermal_profile())
> > > +                     if (!hp_wmi_fan_control_supported())
> > >                               return -EOPNOTSUPP;
> > >                       /* PWM input is invalid when not in manual mode=
 */
> > >                       if (priv->mode !=3D PWM_MODE_MANUAL)
> > > @@ -2518,13 +2599,13 @@ static int hp_wmi_hwmon_write(struct device *=
dev, enum hwmon_sensor_types type,
> > >                       priv->mode =3D PWM_MODE_MAX;
> > >                       return hp_wmi_apply_fan_settings(priv);
> > >               case PWM_MODE_MANUAL:
> > > -                     if (!is_victus_s_thermal_profile())
> > > +                     if (!hp_wmi_fan_control_supported())
> > >                               return -EOPNOTSUPP;
> > >                       /*
> > >                        * When switching to manual mode, set fan speed=
 to
> > >                        * current RPM values to ensure a smooth transi=
tion.
> > >                        */
> > > -                     rpm =3D hp_wmi_get_fan_speed_victus_s(channel);
> > > +                     rpm =3D hp_wmi_get_active_fan_speed(channel);
> > >                       if (rpm < 0)
> > >                               return rpm;
> > >                       priv->pwm =3D rpm_to_pwm(rpm / 100, priv);
> > > @@ -2585,13 +2666,14 @@ static int hp_wmi_setup_fan_settings(struct h=
p_wmi_hwmon_priv *priv)
> > >       u8 min_rpm, max_rpm;
> > >       u8 cpu_rpm, gpu_rpm, noise_db;
> > >       int gpu_delta, i, num_entries, ret;
> > > +     bool gpu_delta_found =3D false;
> > >       size_t header_size, entry_size;
> > >
> > >       /* Default behaviour on hwmon init is automatic mode */
> > >       priv->mode =3D PWM_MODE_AUTO;
> > >
> > > -     /* Bypass all non-Victus S devices */
> > > -     if (!is_victus_s_thermal_profile())
> > > +     /* Bypass devices without fan control support. */
> > > +     if (!hp_wmi_fan_table_supported())
> > >               return 0;
> > >
> > >       ret =3D hp_wmi_perform_query(HPWMI_VICTUS_S_GET_FAN_TABLE_QUERY=
,
> > > @@ -2625,12 +2707,15 @@ static int hp_wmi_setup_fan_settings(struct h=
p_wmi_hwmon_priv *priv)
> > >                       min_rpm =3D cpu_rpm;
> > >               if (cpu_rpm > max_rpm)
> > >                       max_rpm =3D cpu_rpm;
> > > +             if (!gpu_delta_found && gpu_rpm > 0) {
> > > +                     gpu_delta =3D gpu_rpm - cpu_rpm;
> > > +                     gpu_delta_found =3D true;
> > > +             }
> > >       }
> > >
> > > -     if (min_rpm =3D=3D U8_MAX || max_rpm =3D=3D 0)
> > > +     if (min_rpm =3D=3D U8_MAX || max_rpm =3D=3D 0 || !gpu_delta_fou=
nd)
> > >               return -EINVAL;
> > >
> > > -     gpu_delta =3D fan_table->entries[0].gpu_rpm - fan_table->entrie=
s[0].cpu_rpm;
> > >       priv->min_rpm =3D min_rpm;
> > >       priv->max_rpm =3D max_rpm;
> > >       priv->gpu_delta =3D gpu_delta;
> > > @@ -2673,24 +2758,25 @@ static int hp_wmi_hwmon_init(void)
> > >       return 0;
> > >  }
> > >
> > > -static void __init setup_active_thermal_profile_params(void)
> > > +static void __init setup_active_board_params(void)
> > >  {
> > >       const struct dmi_system_id *id;
> > > +     const struct thermal_profile_params *params;
> > >
> > > -     /*
> > > -      * Currently only victus_s devices use the
> > > -      * active_thermal_profile_params
> > > -      */
> > > -     id =3D dmi_first_match(victus_s_thermal_profile_boards);
> > > +     id =3D dmi_first_match(hp_wmi_feature_boards);
> > >       if (id) {
> > > +             active_board_params =3D id->driver_data;
> > > +             params =3D hp_wmi_thermal_profile();
> > > +             if (!params)
> > > +                     return;
> > > +
> > >               /*
> > >                * Marking this boolean is required to ensure that
> > >                * is_victus_s_thermal_profile() behaves like a valid
> > >                * wrapper.
> > >                */
> > >               is_victus_s_board =3D true;
> > > -             active_thermal_profile_params =3D id->driver_data;
> > > -             if (active_thermal_profile_params->ec_tp_offset =3D=3D =
HP_EC_OFFSET_UNKNOWN) {
> > > +             if (params->ec_tp_offset =3D=3D HP_EC_OFFSET_UNKNOWN) {
> > >                       pr_warn("Unknown EC layout for board %s. Therma=
l profile readback will be disabled. Please report this to platform-driver-=
x86@vger.kernel.org\n",
> > >                               dmi_get_system_info(DMI_BOARD_NAME));
> > >               }
> > > @@ -2725,10 +2811,10 @@ static int __init hp_wmi_init(void)
> > >               }
> > >
> > >               /*
> > > -              * Setup active board's thermal profile parameters befo=
re
> > > -              * starting platform driver probe.
> > > +              * Setup active board feature data before starting plat=
form
> > > +              * driver probe.
> > >                */
> > > -             setup_active_thermal_profile_params();
> > > +             setup_active_board_params();
> > >               err =3D platform_driver_probe(&hp_wmi_driver, hp_wmi_bi=
os_setup);
> > >               if (err)
> > >                       goto err_unregister_device;
> > >
>=20
--8323328-1133350261-1779369422=:1175--

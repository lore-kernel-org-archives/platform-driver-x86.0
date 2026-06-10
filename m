Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E942397E89
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jun 2026 10:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781087526; cv=none; b=uI37SB/Aj1s+UkjD/tCDBAjzwNXuFc3UR0a/OitC8hkuFi8/GPOWYO9RSymusrX5RsAaNYgirB7VBSdOGImpqx8D6ik3GnLiIn+84pGESuqV9I8SHuB0NtRwkNftBeWCUHwm6KwSSpjBimqx5Yu0OvfSriVvUHccBXK5OwAGrxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781087526; c=relaxed/simple;
	bh=5H+t6G3M8vaLZ62OszGhgLQxB4nl8Su+qseCmVbfzS0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Lw4IGZO0sgC45p+itQD0F9paRceQtvzJMxzhJ2Dzt9wDD102bourGgH1KQAvKExf3yzX1Yy1mN0Eg2DXTXVuxhqtWACF7BptAXZi0Oibp+o/hSlFygqGUfcfFU4tF+B/BdvWXTiCz8eAKMcCf6zCIAIATiDgHExmR3Z8oVlN20Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aUlFSPtv; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aUlFSPtv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781087521; x=1812623521;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=5H+t6G3M8vaLZ62OszGhgLQxB4nl8Su+qseCmVbfzS0=;
  b=aUlFSPtvzq7QqlTGHr/bAnqisTKJsKmJJUvR+DHjYl+u3DbV0F2b7RQa
   nfHZTOhlE5owUuzogP+9JVJLxtMFS+KHYluAw5lN9EFZylKdbCLwyoZoX
   9YZXW6DVwkqEYI8nplF9oHSGHXrHFRk2rahWxTIZ3gz+L+wWbzPnMsUOz
   ynTyEwjVQd2MHZ0oBu4UQdphjTmZgmHwlT+/umAXCfOfadnFWvU9O/VKQ
   YiqgYTE9Acib0bkMF+2yUsYwDKVHRdMve+Z50obqol/SfYbbCE8q4c6tP
   kBRXX6x4jbw1V3NMMI3EXVMCsfAWsO4LX9pAq/EZCOPXHYOw1DaSn2pv2
   A==;
X-CSE-ConnectionGUID: VZUm8qv4SbeLkFLHA4w7Nw==
X-CSE-MsgGUID: Vk6M8kcvTk+xkLSiYLfBJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="92550390"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="92550390"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 03:32:01 -0700
X-CSE-ConnectionGUID: CvB0wkTCS/qQbUjV4j0T5A==
X-CSE-MsgGUID: 5k7cWO9/R6iPIj5Z633vcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="276331256"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.18])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 03:31:59 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 10 Jun 2026 13:31:54 +0300 (EEST)
To: Radhey Kalra <radheykalra901@gmail.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
    krishna.chomal108@gmail.com
Subject: Re: [PATCH v9 1/3] platform/x86: hp-wmi: Introduce board-specific
 feature data
In-Reply-To: <CAJ5VyXKzub-1hu2Wbmt8HeP7J6uRQjyiAzVHz3ef9muicqFy1A@mail.gmail.com>
Message-ID: <457b00e5-ac64-f424-8a73-28d5976dba1d@linux.intel.com>
References: <20260606080204.724444-1-radheykalra901@gmail.com> <20260606080204.724444-2-radheykalra901@gmail.com> <03f68166-5b76-8fbf-5782-048a0e3d1c8a@linux.intel.com> <CAJ5VyXKzub-1hu2Wbmt8HeP7J6uRQjyiAzVHz3ef9muicqFy1A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1448155573-1781087514=:1359"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1448155573-1781087514=:1359
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 10 Jun 2026, Radhey Kalra wrote:

> Hi Ilpo,
>=20
> Will do. I'll rebase this series against for-next and send v10 shortly.

It seems I had a problem in my end, so all the ID changes are only now in=
=20
for-next. I'm sorry about the extra hassle.

--
 i.

> Thanks, Radhey
>=20
>=20
> On Wed, Jun 10, 2026 at 2:53=E2=80=AFPM Ilpo J=C3=A4rvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
> >
> > On Sat, 6 Jun 2026, Radhey Kalra wrote:
> >
> > > The hp_wmi DMI table is about to carry more than thermal-profile data=
=2E
> > > Replace the direct thermal_profile_params .driver_data pointers with
> > > hp_wmi_board_params and rename the table/setup helper accordingly.
> > >
> > > No functional changes intended.
> > >
> > > Signed-off-by: Radhey Kalra <radheykalra901@gmail.com>
> > > ---
> > >  drivers/platform/x86/hp/hp-wmi.c | 121 ++++++++++++++++++++---------=
--
> > >  1 file changed, 77 insertions(+), 44 deletions(-)
> > >
> > > diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/=
hp/hp-wmi.c
> > > index 48292cc..4a795e6 100644
> > > --- a/drivers/platform/x86/hp/hp-wmi.c
> > > +++ b/drivers/platform/x86/hp/hp-wmi.c
> > > @@ -133,11 +133,35 @@ static const struct thermal_profile_params omen=
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
> > > +struct hp_wmi_board_params {
> > > +     const struct thermal_profile_params *thermal_profile;
> > > +};
> > > +
> > > +static const struct hp_wmi_board_params victus_s_board_params =3D {
> > > +     .thermal_profile        =3D &victus_s_thermal_params,
> > > +};
> > > +
> > > +static const struct hp_wmi_board_params omen_v1_board_params =3D {
> > > +     .thermal_profile        =3D &omen_v1_thermal_params,
> > > +};
> > > +
> > > +static const struct hp_wmi_board_params omen_v1_legacy_board_params =
=3D {
> > > +     .thermal_profile        =3D &omen_v1_legacy_thermal_params,
> > > +};
> > > +
> > > +static const struct hp_wmi_board_params omen_v1_no_ec_board_params =
=3D {
> > > +     .thermal_profile        =3D &omen_v1_no_ec_thermal_params,
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
> > > @@ -187,75 +211,75 @@ static const char * const victus_thermal_profil=
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
> > >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8902") },
> > > -             .driver_data =3D (void *)&omen_v1_legacy_thermal_params=
,
> > > +             .driver_data =3D (void *)&omen_v1_legacy_board_params,
> > >       },
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
> > >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8BC2") },
> > > -             .driver_data =3D (void *)&omen_v1_thermal_params,
> > > +             .driver_data =3D (void *)&omen_v1_board_params,
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
> > > -             .driver_data =3D (void *)&omen_v1_no_ec_thermal_params,
> > > +             .driver_data =3D (void *)&omen_v1_no_ec_board_params,
> > >       },
> > >       {
> > >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8D87") },
> > > -             .driver_data =3D (void *)&omen_v1_no_ec_thermal_params,
> > > +             .driver_data =3D (void *)&omen_v1_no_ec_board_params,
> > >       },
> > >       {},
> > >  };
> >
> > Could you do a rebase for this as there are a few ID additions in the
> > for-next branch so I don't need to handle the conversion myself.
> >
> > > @@ -1862,7 +1886,10 @@ static int platform_profile_victus_s_get_ec(en=
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
> > > @@ -1874,10 +1901,10 @@ static int platform_profile_victus_s_get_ec(e=
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
> > > @@ -1912,12 +1939,12 @@ static int platform_profile_victus_s_get_ec(e=
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
> > > @@ -2183,6 +2210,7 @@ static const struct platform_profile_ops hp_wmi=
_platform_profile_ops =3D {
> > >  static int thermal_profile_setup(struct platform_device *device)
> > >  {
> > >       const struct platform_profile_ops *ops;
> > > +     const struct thermal_profile_params *params;
> > >       int err, tp;
> > >
> > >       if (is_omen_thermal_profile()) {
> > > @@ -2214,13 +2242,17 @@ static int thermal_profile_setup(struct platf=
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
> > > @@ -2681,24 +2713,25 @@ static int hp_wmi_hwmon_init(void)
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
> > > @@ -2733,10 +2766,10 @@ static int __init hp_wmi_init(void)
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
> >
> > --
> >  i.
> >
>=20
--8323328-1448155573-1781087514=:1359--

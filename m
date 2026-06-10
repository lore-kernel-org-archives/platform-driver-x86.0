Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366923B71AC
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jun 2026 10:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781086720; cv=pass; b=lQKIjvImFA4jkA+mtWSDFq3im6nUjNPHFFGroI5QuMehSzOehoLHc83X4bsL9dIECkhUnTxr+iECw4ZLr5QaliLiWrZe9iw7lBQpX+/h0Md/nXPGW5baLOOXkPpVO2YEaLEF7SaYs7KciV6duxKUbn5P9Aox5BAGbt6Xf6/rVIc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781086720; c=relaxed/simple;
	bh=mO0GMVH3hQJE29c3JHdmleQ6Ad0D84plgpCCK0IHAjE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kGzx7sLdK9LjsTgsiBcbsKijAe5e2sIgyR5U1s2jvnAVp6owHv1O+Mi8SSUntIOpKxhKpBV7lsvlg7oGke3W1QMT4Ofe+4LsFcGdKRHGTgJHLYzCUt+FctV+/jkVzEeLEax/mdhJdZ3GaDdejGauS/G+NnFPKiDqBgBRGtMzNao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JhOtN3nE; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JhOtN3nE"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-beb7f26ed62so751081866b.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jun 2026 03:18:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781086717; cv=none;
        d=google.com; s=arc-20240605;
        b=WNQqFcjGBjAYaKXpLrMVhmQ1uZhtvFta8Ug5LpN3dwgCrt/+gDLAO9RnqVs9UUhB+3
         DypM76WdPvxG7HTfUKff346N7UtRZ372CiwNU+p2vOSIEKNyqCDCrUsAhh1Cenka2KIp
         BiqHNmJgKoMoRxuucwBQdSl5KFic/BK+f6mS+GNrJf+b7sNvBXp71fBg1Arc3aGy1chl
         U6fofnohurY/aNbSwIye1tRsiiSXW3Odi+5K+UwbTPpsf4rDm3c8MfQWq8tNjJu/51zk
         n3AmBdYC97Cu6UcNQlt7s425szE8tCT4G/+XPHMSVI3g4LIM7liG/scsZmPISYtmriC9
         vZFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wtCbgaicrYfskDtPT5aWlg0KYe+9N4+u9LjviDhZ4ZI=;
        fh=audd8TrHKq5asRuOjdUVKwU8xgPLGnsU7WNlh3e/R2k=;
        b=XBXOnk4qXQGEyzZKvabOESy7+zg1JAdf6247zPwhLeZn7Abr2oVioBTQF5JwxeOgHY
         I9I3y+cWB2c51ES08T7OrwxDhdi6Jz3fKPTehfV2bjYFvpURpDNJvRC6yKF59kYxqnKp
         xF52q8hATxQ18LYYGJVRtvAk57LeLQk/V6UUpC8hbImMNV//Wiozfb8WHQ1tKbPr35Ef
         RVDhPcxVO/eJ052a6zaMRwUDOsZq+41ev3USj2SwvTgc+4kYrIAXrn4v3Rgk8oWWb2ba
         p+BIKaR44ryQFuLt4ZHKFgPon3x5uqVdl4SJy7kyEgsx0MA7QIXkfvw75+h90exL1801
         0MKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086717; x=1781691517; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wtCbgaicrYfskDtPT5aWlg0KYe+9N4+u9LjviDhZ4ZI=;
        b=JhOtN3nEz0uTxQYTtxrIrDUwOGfOmgI7PQJaMg00OaF2oWMMlBfJG0K19Zgu7kDcyx
         S/8aKYZWS2ZbjS/TN76WiM/QlGWTkd+KkCcm9Be9Q1I9yew0D+/+ll6KeSQ25lkx8Oke
         mQwrE5Sx4vmSHD6TWOvbGcrfqhWYCjdYJlm2KOpdFQQWwFt7D5xnihpfQfuMKYp6e7Aa
         4EML75Jqejqaxf5tQLjYqstfdwEaGNexj/elor7RyZnBFR7UVFysjE6VCLLpO1NCE0+G
         cWKOxqJAqMagHw23SeV+eZa0WXpCeqV+M57bxeHTSpH2F+iHyopwX49NSZBcRfUaa45q
         /7Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086717; x=1781691517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wtCbgaicrYfskDtPT5aWlg0KYe+9N4+u9LjviDhZ4ZI=;
        b=pIqsMXM40oNptJydSdQuLvwx84khiO8DZN2DDazYdx6E3cc0CYKxM3PZwFJJjnFLRh
         XGaGVvCinjHlHSj2hnoSNQJ3PARYHiHi8GwHTbZlEpBD8AmaCUpqbCaLmrxM+nH7GnWy
         G2QH0k5L9p4Tc5Gl33EE1pavBSbrVAxtdvZgLVKvkWfbONjk0/dJGEgdu0Xx8oGFFTg3
         ijLKhNHc+fXduc7SxxuFVjX/nNPI1EeLWndSy0Eil55YeaEPO+WDQjTbSQa1joYvmGu9
         rdvC4TzAi1adIx2DwfQAtwkpujY9y46B2Ca3EWrztP7K1b0aBDq0yz0GjL7G+cQ5DeR3
         FQBw==
X-Gm-Message-State: AOJu0YxyxLBmUPfu9miMnokisGuwrQK+2ogHjapdEW87FpKYX/tF4ZD0
	T3lHYiSXbcmW8jSQvN/bkjviPuakwHpiAAGW1dIyhCBhrAROnfRRRkTCQV7Mqcgf0HgSghoBt/B
	LXMSo5Ixd6m2c5lr+yLOcb5EyOBZ4y80=
X-Gm-Gg: Acq92OGHg3nUF5qcjUHMskT2Ms6NB0I1LQC6N3vKEJg1grBZK8SMaaqBCT9l5e7Vu4s
	O2gHZ33C6YaLECXkF7bph0FWaTliMDDTPHCrzNIwkmeambPHxnOAHKm4uHHYFfURwiBkIWsVr71
	gZoCFb7VeZnAMRL34hV/zqzz+5+PSstoR/4Ok6A9PtHlUutpr8Q/4IkDynFAWxdnHxZY3J9W8MQ
	tFQce6Qkk829BuTZEuigjvJKBa3IwbjvUyWJx2HW72RA6YW2fZ2idenwAeH+rpDb/EqGie3lK0Z
	sonkWdIAHZTLanifWAjXti+27ZsQ8aI8sqcgqEcC1Z37+clYujQ=
X-Received: by 2002:a17:907:c510:b0:bed:7f50:c724 with SMTP id
 a640c23a62f3a-bf939419020mr358852466b.37.1781086716154; Wed, 10 Jun 2026
 03:18:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260606080204.724444-1-radheykalra901@gmail.com>
 <20260606080204.724444-2-radheykalra901@gmail.com> <03f68166-5b76-8fbf-5782-048a0e3d1c8a@linux.intel.com>
In-Reply-To: <03f68166-5b76-8fbf-5782-048a0e3d1c8a@linux.intel.com>
From: Radhey Kalra <radheykalra901@gmail.com>
Date: Wed, 10 Jun 2026 15:48:22 +0530
X-Gm-Features: AVVi8CdjAtjSKQx1qj-Chc-SxYUq_HiufOqETJ1jnNZbnL0t8OHKkf7BMm3fsnk
Message-ID: <CAJ5VyXKzub-1hu2Wbmt8HeP7J6uRQjyiAzVHz3ef9muicqFy1A@mail.gmail.com>
Subject: Re: [PATCH v9 1/3] platform/x86: hp-wmi: Introduce board-specific
 feature data
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
	krishna.chomal108@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ilpo,

Will do. I'll rebase this series against for-next and send v10 shortly.

Thanks, Radhey


On Wed, Jun 10, 2026 at 2:53=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Sat, 6 Jun 2026, Radhey Kalra wrote:
>
> > The hp_wmi DMI table is about to carry more than thermal-profile data.
> > Replace the direct thermal_profile_params .driver_data pointers with
> > hp_wmi_board_params and rename the table/setup helper accordingly.
> >
> > No functional changes intended.
> >
> > Signed-off-by: Radhey Kalra <radheykalra901@gmail.com>
> > ---
> >  drivers/platform/x86/hp/hp-wmi.c | 121 ++++++++++++++++++++-----------
> >  1 file changed, 77 insertions(+), 44 deletions(-)
> >
> > diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp=
/hp-wmi.c
> > index 48292cc..4a795e6 100644
> > --- a/drivers/platform/x86/hp/hp-wmi.c
> > +++ b/drivers/platform/x86/hp/hp-wmi.c
> > @@ -133,11 +133,35 @@ static const struct thermal_profile_params omen_v=
1_no_ec_thermal_params =3D {
> >       .ec_tp_offset   =3D HP_NO_THERMAL_PROFILE_OFFSET,
> >  };
> >
> > -/*
> > - * A generic pointer for the currently-active board's thermal profile
> > - * parameters.
> > - */
> > -static struct thermal_profile_params *active_thermal_profile_params;
> > +struct hp_wmi_board_params {
> > +     const struct thermal_profile_params *thermal_profile;
> > +};
> > +
> > +static const struct hp_wmi_board_params victus_s_board_params =3D {
> > +     .thermal_profile        =3D &victus_s_thermal_params,
> > +};
> > +
> > +static const struct hp_wmi_board_params omen_v1_board_params =3D {
> > +     .thermal_profile        =3D &omen_v1_thermal_params,
> > +};
> > +
> > +static const struct hp_wmi_board_params omen_v1_legacy_board_params =
=3D {
> > +     .thermal_profile        =3D &omen_v1_legacy_thermal_params,
> > +};
> > +
> > +static const struct hp_wmi_board_params omen_v1_no_ec_board_params =3D=
 {
> > +     .thermal_profile        =3D &omen_v1_no_ec_thermal_params,
> > +};
> > +
> > +static const struct hp_wmi_board_params *active_board_params;
> > +
> > +static const struct thermal_profile_params *hp_wmi_thermal_profile(voi=
d)
> > +{
> > +     if (!active_board_params)
> > +             return NULL;
> > +
> > +     return active_board_params->thermal_profile;
> > +}
> >
> >  /* DMI board names of devices that should use the omen specific path f=
or
> >   * thermal profiles.
> > @@ -187,75 +211,75 @@ static const char * const victus_thermal_profile_=
boards[] =3D {
> >       "8A25",
> >  };
> >
> > -/* DMI Board names of Victus 16-r and Victus 16-s laptops */
> > -static const struct dmi_system_id victus_s_thermal_profile_boards[] __=
initconst =3D {
> > +/* DMI board-specific feature data for Omen and Victus laptops. */
> > +static const struct dmi_system_id hp_wmi_feature_boards[] __initconst =
=3D {
> >       {
> >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8902") },
> > -             .driver_data =3D (void *)&omen_v1_legacy_thermal_params,
> > +             .driver_data =3D (void *)&omen_v1_legacy_board_params,
> >       },
> >       {
> >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8A44") },
> > -             .driver_data =3D (void *)&omen_v1_legacy_thermal_params,
> > +             .driver_data =3D (void *)&omen_v1_legacy_board_params,
> >       },
> >       {
> >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8A4D") },
> > -             .driver_data =3D (void *)&omen_v1_legacy_thermal_params,
> > +             .driver_data =3D (void *)&omen_v1_legacy_board_params,
> >       },
> >       {
> >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8BAB") },
> > -             .driver_data =3D (void *)&omen_v1_thermal_params,
> > +             .driver_data =3D (void *)&omen_v1_board_params,
> >       },
> >       {
> >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8BBE") },
> > -             .driver_data =3D (void *)&victus_s_thermal_params,
> > +             .driver_data =3D (void *)&victus_s_board_params,
> >       },
> >       {
> >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8BC2") },
> > -             .driver_data =3D (void *)&omen_v1_thermal_params,
> > +             .driver_data =3D (void *)&omen_v1_board_params,
> >       },
> >       {
> >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8BCA") },
> > -             .driver_data =3D (void *)&omen_v1_thermal_params,
> > +             .driver_data =3D (void *)&omen_v1_board_params,
> >       },
> >       {
> >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8BCD") },
> > -             .driver_data =3D (void *)&omen_v1_thermal_params,
> > +             .driver_data =3D (void *)&omen_v1_board_params,
> >       },
> >       {
> >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8BD4") },
> > -             .driver_data =3D (void *)&victus_s_thermal_params,
> > +             .driver_data =3D (void *)&victus_s_board_params,
> >       },
> >       {
> >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8BD5") },
> > -             .driver_data =3D (void *)&victus_s_thermal_params,
> > +             .driver_data =3D (void *)&victus_s_board_params,
> >       },
> >       {
> >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8C76") },
> > -             .driver_data =3D (void *)&omen_v1_thermal_params,
> > +             .driver_data =3D (void *)&omen_v1_board_params,
> >       },
> >       {
> >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8C77") },
> > -             .driver_data =3D (void *)&omen_v1_thermal_params,
> > +             .driver_data =3D (void *)&omen_v1_board_params,
> >       },
> >       {
> >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8C78") },
> > -             .driver_data =3D (void *)&omen_v1_thermal_params,
> > +             .driver_data =3D (void *)&omen_v1_board_params,
> >       },
> >       {
> >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8C99") },
> > -             .driver_data =3D (void *)&victus_s_thermal_params,
> > +             .driver_data =3D (void *)&victus_s_board_params,
> >       },
> >       {
> >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8C9C") },
> > -             .driver_data =3D (void *)&victus_s_thermal_params,
> > +             .driver_data =3D (void *)&victus_s_board_params,
> >       },
> >       {
> >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8D41") },
> > -             .driver_data =3D (void *)&omen_v1_no_ec_thermal_params,
> > +             .driver_data =3D (void *)&omen_v1_no_ec_board_params,
> >       },
> >       {
> >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8D87") },
> > -             .driver_data =3D (void *)&omen_v1_no_ec_thermal_params,
> > +             .driver_data =3D (void *)&omen_v1_no_ec_board_params,
> >       },
> >       {},
> >  };
>
> Could you do a rebase for this as there are a few ID additions in the
> for-next branch so I don't need to handle the conversion myself.
>
> > @@ -1862,7 +1886,10 @@ static int platform_profile_victus_s_get_ec(enum=
 platform_profile_option *profil
> >       u8 current_dstate, current_gpu_slowdown_temp, tp;
> >       const struct thermal_profile_params *params;
> >
> > -     params =3D active_thermal_profile_params;
> > +     params =3D hp_wmi_thermal_profile();
> > +     if (!params)
> > +             return -ENODEV;
> > +
> >       if (params->ec_tp_offset =3D=3D HP_EC_OFFSET_UNKNOWN ||
> >           params->ec_tp_offset =3D=3D HP_NO_THERMAL_PROFILE_OFFSET) {
> >               *profile =3D active_platform_profile;
> > @@ -1874,10 +1901,10 @@ static int platform_profile_victus_s_get_ec(enu=
m platform_profile_option *profil
> >               return ret;
> >
> >       /*
> > -      * We cannot use active_thermal_profile_params here, because boar=
ds
> > -      * like 8C78 have tp =3D=3D 0x0 || tp =3D=3D 0x1 after cold boot,=
 but logically
> > -      * it should have tp =3D=3D 0x30 || tp =3D=3D 0x31, as corrected =
by the Omen
> > -      * Gaming Hub on windows. Hence accept both of these values.
> > +      * Boards like 8C78 have tp =3D=3D 0x0 || tp =3D=3D 0x1 after col=
d boot,
> > +      * but logically it should have tp =3D=3D 0x30 || tp =3D=3D 0x31,=
 as
> > +      * corrected by the Omen Gaming Hub on windows. Hence accept both
> > +      * of these values.
> >        */
> >       if (tp =3D=3D victus_s_thermal_params.performance ||
> >           tp =3D=3D omen_v1_thermal_params.performance) {
> > @@ -1912,12 +1939,12 @@ static int platform_profile_victus_s_get_ec(enu=
m platform_profile_option *profil
> >
> >  static int platform_profile_victus_s_set_ec(enum platform_profile_opti=
on profile)
> >  {
> > -     struct thermal_profile_params *params;
> > +     const struct thermal_profile_params *params;
> >       bool gpu_ctgp_enable, gpu_ppab_enable;
> >       u8 gpu_dstate; /* Test shows 1 =3D 100%, 2 =3D 50%, 3 =3D 25%, 4 =
=3D 12.5% */
> >       int err, tp;
> >
> > -     params =3D active_thermal_profile_params;
> > +     params =3D hp_wmi_thermal_profile();
> >       if (!params)
> >               return -ENODEV;
> >
> > @@ -2183,6 +2210,7 @@ static const struct platform_profile_ops hp_wmi_p=
latform_profile_ops =3D {
> >  static int thermal_profile_setup(struct platform_device *device)
> >  {
> >       const struct platform_profile_ops *ops;
> > +     const struct thermal_profile_params *params;
> >       int err, tp;
> >
> >       if (is_omen_thermal_profile()) {
> > @@ -2214,13 +2242,17 @@ static int thermal_profile_setup(struct platfor=
m_device *device)
> >
> >               ops =3D &platform_profile_victus_ops;
> >       } else if (is_victus_s_thermal_profile()) {
> > +             params =3D hp_wmi_thermal_profile();
> > +             if (!params)
> > +                     return -ENODEV;
> > +
> >               /*
> >                * For an unknown EC layout board, platform_profile_victu=
s_s_get_ec(),
> >                * behaves like a wrapper around active_platform_profile,=
 to avoid using
> >                * uninitialized data, we default to PLATFORM_PROFILE_BAL=
ANCED.
> >                */
> > -             if (active_thermal_profile_params->ec_tp_offset =3D=3D HP=
_EC_OFFSET_UNKNOWN ||
> > -                 active_thermal_profile_params->ec_tp_offset =3D=3D HP=
_NO_THERMAL_PROFILE_OFFSET) {
> > +             if (params->ec_tp_offset =3D=3D HP_EC_OFFSET_UNKNOWN ||
> > +                 params->ec_tp_offset =3D=3D HP_NO_THERMAL_PROFILE_OFF=
SET) {
> >                       active_platform_profile =3D PLATFORM_PROFILE_BALA=
NCED;
> >               } else {
> >                       err =3D platform_profile_victus_s_get_ec(&active_=
platform_profile);
> > @@ -2681,24 +2713,25 @@ static int hp_wmi_hwmon_init(void)
> >       return 0;
> >  }
> >
> > -static void __init setup_active_thermal_profile_params(void)
> > +static void __init setup_active_board_params(void)
> >  {
> >       const struct dmi_system_id *id;
> > +     const struct thermal_profile_params *params;
> >
> > -     /*
> > -      * Currently only victus_s devices use the
> > -      * active_thermal_profile_params
> > -      */
> > -     id =3D dmi_first_match(victus_s_thermal_profile_boards);
> > +     id =3D dmi_first_match(hp_wmi_feature_boards);
> >       if (id) {
> > +             active_board_params =3D id->driver_data;
> > +             params =3D hp_wmi_thermal_profile();
> > +             if (!params)
> > +                     return;
> > +
> >               /*
> >                * Marking this boolean is required to ensure that
> >                * is_victus_s_thermal_profile() behaves like a valid
> >                * wrapper.
> >                */
> >               is_victus_s_board =3D true;
> > -             active_thermal_profile_params =3D id->driver_data;
> > -             if (active_thermal_profile_params->ec_tp_offset =3D=3D HP=
_EC_OFFSET_UNKNOWN) {
> > +             if (params->ec_tp_offset =3D=3D HP_EC_OFFSET_UNKNOWN) {
> >                       pr_warn("Unknown EC layout for board %s. Thermal =
profile readback will be disabled. Please report this to platform-driver-x8=
6@vger.kernel.org\n",
> >                               dmi_get_system_info(DMI_BOARD_NAME));
> >               }
> > @@ -2733,10 +2766,10 @@ static int __init hp_wmi_init(void)
> >               }
> >
> >               /*
> > -              * Setup active board's thermal profile parameters before
> > -              * starting platform driver probe.
> > +              * Setup active board feature data before starting platfo=
rm
> > +              * driver probe.
> >                */
> > -             setup_active_thermal_profile_params();
> > +             setup_active_board_params();
> >               err =3D platform_driver_probe(&hp_wmi_driver, hp_wmi_bios=
_setup);
> >               if (err)
> >                       goto err_unregister_device;
> >
>
> --
>  i.
>

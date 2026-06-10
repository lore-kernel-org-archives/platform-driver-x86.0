Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87BA2E2DFB
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jun 2026 10:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781087678; cv=pass; b=c3jBOPmeMIuUES01J0vDDqLm4eVpVdMI5rQUebbBgtnpdypucFQYNRPchlSy2aKSZBOzRZ0zmWucJXURNMS+MZOn8pkUhqj8LcMVv/XLyf/p69yykAho1wYZK21LGad4CNS6OhHbD0menNcz0zZ27sqS+suXcuHtrKmXDDO6O7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781087678; c=relaxed/simple;
	bh=71bdwR34rqlYpUwWsdg7+wXM272yiRLEjj6xcszCb+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d2ygigq7PX0t4kqGGLXhmcfp6eNUg11GKffTVV+ru99VVtGRbJ1LtSAPeRqkctYO4fyARLqhxKeZLt3ukQakxBIwVCS3o8KW7hbOiLAl/KwslDkauoL+/uLW+jVZZmALdTt1/Lx0k8wgK7+eUfBt27R2FmX3oeXWV67ORk4M9og=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A6Pkls3c; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A6Pkls3c"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-bebc80100efso707613066b.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jun 2026 03:34:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781087675; cv=none;
        d=google.com; s=arc-20240605;
        b=b02vBK5hnqUXkARwJF1CCD47zNTBz+B2qBUxd08lCxdI+mtNjD65qDUX1QD0W4E6sa
         atD7yssDqICIeab3QF1pkZ0Rw3g+b4SUQb+nmpb18sZe7FeOet4PUz9/TkPVBUiDpfWc
         9e6eaNVEmln9xQe1kNZe9Pzf6Ar0zlHIt9k3AnwfpjRj0kyTpXJABpxkJzgjbx+TasLO
         u1xdTfpuXdkEFs7C1y0ksxQB7gLDOh6qVAL+ukMrsEC/rfKBLH5WIB8C+cQa2FCEmjGj
         uhWvIg72Ky4+HVPUAjl5vdKZWwgzzRx7PSQJ3EX8uS7UFPmYRllyE/z931nPtsUdBAyx
         VhHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k8o/Xmek0iO0jA9btMmNEoFuXDrTrFTx96RrVluIr5c=;
        fh=audd8TrHKq5asRuOjdUVKwU8xgPLGnsU7WNlh3e/R2k=;
        b=UH0FbUpsPzyZU2SNNGiS84vCu4vaihdjmTWJDm5QEylHQsUQMCb1uU+AlHme+Nhy4n
         x2gkg6ZiXUQRbPRDDty0PGV+Q0sI6fV2tPNFmiMDA0MdVtoAOrLgjAl9z/pNqL9FjRLp
         UEFR45nLlz5s+kFp9OeZAD0g1WdXX0lCGdKbcb8cr0jet6OlA+NhNdGD2b1Sx+mRT39y
         2aRONLAFJSPZNF5cVrSnOdDHQ4Rc2pnNSjw2Yak1GSnMOyhB3u1vjDRC3syHvqM22Lgn
         ytYlgs9YCqBDFGW4amjvYSUUvgg7f1iZnZq0CZRO9hEb4lzKsyOETTmNp6GPyqCt+cG3
         tbZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781087675; x=1781692475; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k8o/Xmek0iO0jA9btMmNEoFuXDrTrFTx96RrVluIr5c=;
        b=A6Pkls3cg8RViBA4XL0Ljl5R5xFfL2a1J9ueqfChBCIBL0k3VUQCvAZ4oy5ONX+9id
         qvvKmwFaRRXkxGsu5fRt+G6uStT1mGcTzPWj/TcKUFLIv33H/1cU5suiGshQMNxYhwyu
         FQaAtntXw6HamPtBN2dzA1n76y70Pz5tInF9185oC1Tlac7q3sst3bXlNB4CBighKfKw
         RRlfPPu+3homo3G11cc+OEBq7pcsyWrYT2hTrIsLOCNx10/wtRLvxA+nJ9KJa1o2PE0j
         76qkIlPa/vduDk+wfIYiZ++s1qsPkoCgjudfChCMFAWM5GINBGhmLKTj7wzoie2wUVZN
         Cl/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781087675; x=1781692475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k8o/Xmek0iO0jA9btMmNEoFuXDrTrFTx96RrVluIr5c=;
        b=YNECkS9p1NP2uxPYWdVExtNxFxSSow7wawwq7YC4l5QYwofJVKpCNKd6vOxrgOBuK8
         FqtrEbLMFxra/jYI/Q0i1vpW4TNlritrXqvYm7aCMKqnRn3vs8FHxY2D6Qin+enye+Ij
         18p6oW7vdrrYqqoBPzovQ77k+EHanmRtqGqsxjQ2wpM+dLtALbw89nrS4XV7eTEgpFG0
         Vp1ZKmOJALP2wb/uBjbJ4Wwqdi/Pn5AAcMcyf90RgoiYSoby3i13igh7NAoMuXAI2oTd
         aIs7q1UbCku5bJozqkdD35l8fST31F+4dxAV+rgyz+gv3tEok3l+BcAbLOi/QwX4XQQy
         FgmA==
X-Gm-Message-State: AOJu0YyqZ8kbdKrEoJgzdzoiwdVeqGVoyOe6gzTl+eRsxHhINC4vd+tx
	BogkMAezsLY2Jd5F09Anmw7hSd62+O/wP3MlNQA41AUWfZ5QwVgFhCvRgiIKrInUuo3S34OYv7j
	DY9+LsXsg2Tksx22WtKL7doGTqxx7vR8=
X-Gm-Gg: Acq92OHeeYRw2dNm464qABWwdiBV1XXZiU3vhDxf4+KqJ8Mq4P7zzAKM9SIb+iDbIvP
	ShBSlxbdG0CbiycDGkFLmm3nYvKQwgDxmM6cTgb9FnxQe2z2DXN39NHPgNpQC6EZehmMM1UwSIw
	NhqhGVokfMLXuSFYlrAtiM0DyOOJV34cFn70hQ97ha3qcHsYwQ0WmqF3EJhm/cjyGCuy916vW10
	Dv3d05F2ik9r0/q8z/3hrN/sVRGNhR7iAXKAeovpZucoezX2xpHFyvcE+C5DiHn5509b1UIDr2j
	geXY6GdhPuZgf4NNnJk/UXPhKg/fOTW2hpaek057XP6155jCu5A=
X-Received: by 2002:a17:907:2675:b0:beb:bf23:ac78 with SMTP id
 a640c23a62f3a-bf3733071demr795844866b.44.1781087674968; Wed, 10 Jun 2026
 03:34:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260606080204.724444-1-radheykalra901@gmail.com>
 <20260606080204.724444-2-radheykalra901@gmail.com> <03f68166-5b76-8fbf-5782-048a0e3d1c8a@linux.intel.com>
 <CAJ5VyXKzub-1hu2Wbmt8HeP7J6uRQjyiAzVHz3ef9muicqFy1A@mail.gmail.com> <457b00e5-ac64-f424-8a73-28d5976dba1d@linux.intel.com>
In-Reply-To: <457b00e5-ac64-f424-8a73-28d5976dba1d@linux.intel.com>
From: Radhey Kalra <radheykalra901@gmail.com>
Date: Wed, 10 Jun 2026 16:04:22 +0530
X-Gm-Features: AVVi8CcMoN1xgoriNu71ohMRNqNbgfriJD-ElrxX4F8oR1Tsuuao1eNyIpKUzuA
Message-ID: <CAJ5VyXKGgnReptw-Z_HR0kt5GQoM8zb6YyW1syE3=Ne_xwZJDA@mail.gmail.com>
Subject: Re: [PATCH v9 1/3] platform/x86: hp-wmi: Introduce board-specific
 feature data
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
	krishna.chomal108@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

No problem, I understand.

On Wed, Jun 10, 2026 at 4:02=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Wed, 10 Jun 2026, Radhey Kalra wrote:
>
> > Hi Ilpo,
> >
> > Will do. I'll rebase this series against for-next and send v10 shortly.
>
> It seems I had a problem in my end, so all the ID changes are only now in
> for-next. I'm sorry about the extra hassle.
>
> --
>  i.
>
> > Thanks, Radhey
> >
> >
> > On Wed, Jun 10, 2026 at 2:53=E2=80=AFPM Ilpo J=C3=A4rvinen
> > <ilpo.jarvinen@linux.intel.com> wrote:
> > >
> > > On Sat, 6 Jun 2026, Radhey Kalra wrote:
> > >
> > > > The hp_wmi DMI table is about to carry more than thermal-profile da=
ta.
> > > > Replace the direct thermal_profile_params .driver_data pointers wit=
h
> > > > hp_wmi_board_params and rename the table/setup helper accordingly.
> > > >
> > > > No functional changes intended.
> > > >
> > > > Signed-off-by: Radhey Kalra <radheykalra901@gmail.com>
> > > > ---
> > > >  drivers/platform/x86/hp/hp-wmi.c | 121 ++++++++++++++++++++-------=
----
> > > >  1 file changed, 77 insertions(+), 44 deletions(-)
> > > >
> > > > diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x8=
6/hp/hp-wmi.c
> > > > index 48292cc..4a795e6 100644
> > > > --- a/drivers/platform/x86/hp/hp-wmi.c
> > > > +++ b/drivers/platform/x86/hp/hp-wmi.c
> > > > @@ -133,11 +133,35 @@ static const struct thermal_profile_params om=
en_v1_no_ec_thermal_params =3D {
> > > >       .ec_tp_offset   =3D HP_NO_THERMAL_PROFILE_OFFSET,
> > > >  };
> > > >
> > > > -/*
> > > > - * A generic pointer for the currently-active board's thermal prof=
ile
> > > > - * parameters.
> > > > - */
> > > > -static struct thermal_profile_params *active_thermal_profile_param=
s;
> > > > +struct hp_wmi_board_params {
> > > > +     const struct thermal_profile_params *thermal_profile;
> > > > +};
> > > > +
> > > > +static const struct hp_wmi_board_params victus_s_board_params =3D =
{
> > > > +     .thermal_profile        =3D &victus_s_thermal_params,
> > > > +};
> > > > +
> > > > +static const struct hp_wmi_board_params omen_v1_board_params =3D {
> > > > +     .thermal_profile        =3D &omen_v1_thermal_params,
> > > > +};
> > > > +
> > > > +static const struct hp_wmi_board_params omen_v1_legacy_board_param=
s =3D {
> > > > +     .thermal_profile        =3D &omen_v1_legacy_thermal_params,
> > > > +};
> > > > +
> > > > +static const struct hp_wmi_board_params omen_v1_no_ec_board_params=
 =3D {
> > > > +     .thermal_profile        =3D &omen_v1_no_ec_thermal_params,
> > > > +};
> > > > +
> > > > +static const struct hp_wmi_board_params *active_board_params;
> > > > +
> > > > +static const struct thermal_profile_params *hp_wmi_thermal_profile=
(void)
> > > > +{
> > > > +     if (!active_board_params)
> > > > +             return NULL;
> > > > +
> > > > +     return active_board_params->thermal_profile;
> > > > +}
> > > >
> > > >  /* DMI board names of devices that should use the omen specific pa=
th for
> > > >   * thermal profiles.
> > > > @@ -187,75 +211,75 @@ static const char * const victus_thermal_prof=
ile_boards[] =3D {
> > > >       "8A25",
> > > >  };
> > > >
> > > > -/* DMI Board names of Victus 16-r and Victus 16-s laptops */
> > > > -static const struct dmi_system_id victus_s_thermal_profile_boards[=
] __initconst =3D {
> > > > +/* DMI board-specific feature data for Omen and Victus laptops. */
> > > > +static const struct dmi_system_id hp_wmi_feature_boards[] __initco=
nst =3D {
> > > >       {
> > > >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8902") },
> > > > -             .driver_data =3D (void *)&omen_v1_legacy_thermal_para=
ms,
> > > > +             .driver_data =3D (void *)&omen_v1_legacy_board_params=
,
> > > >       },
> > > >       {
> > > >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8A44") },
> > > > -             .driver_data =3D (void *)&omen_v1_legacy_thermal_para=
ms,
> > > > +             .driver_data =3D (void *)&omen_v1_legacy_board_params=
,
> > > >       },
> > > >       {
> > > >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8A4D") },
> > > > -             .driver_data =3D (void *)&omen_v1_legacy_thermal_para=
ms,
> > > > +             .driver_data =3D (void *)&omen_v1_legacy_board_params=
,
> > > >       },
> > > >       {
> > > >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8BAB") },
> > > > -             .driver_data =3D (void *)&omen_v1_thermal_params,
> > > > +             .driver_data =3D (void *)&omen_v1_board_params,
> > > >       },
> > > >       {
> > > >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8BBE") },
> > > > -             .driver_data =3D (void *)&victus_s_thermal_params,
> > > > +             .driver_data =3D (void *)&victus_s_board_params,
> > > >       },
> > > >       {
> > > >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8BC2") },
> > > > -             .driver_data =3D (void *)&omen_v1_thermal_params,
> > > > +             .driver_data =3D (void *)&omen_v1_board_params,
> > > >       },
> > > >       {
> > > >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8BCA") },
> > > > -             .driver_data =3D (void *)&omen_v1_thermal_params,
> > > > +             .driver_data =3D (void *)&omen_v1_board_params,
> > > >       },
> > > >       {
> > > >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8BCD") },
> > > > -             .driver_data =3D (void *)&omen_v1_thermal_params,
> > > > +             .driver_data =3D (void *)&omen_v1_board_params,
> > > >       },
> > > >       {
> > > >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8BD4") },
> > > > -             .driver_data =3D (void *)&victus_s_thermal_params,
> > > > +             .driver_data =3D (void *)&victus_s_board_params,
> > > >       },
> > > >       {
> > > >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8BD5") },
> > > > -             .driver_data =3D (void *)&victus_s_thermal_params,
> > > > +             .driver_data =3D (void *)&victus_s_board_params,
> > > >       },
> > > >       {
> > > >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8C76") },
> > > > -             .driver_data =3D (void *)&omen_v1_thermal_params,
> > > > +             .driver_data =3D (void *)&omen_v1_board_params,
> > > >       },
> > > >       {
> > > >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8C77") },
> > > > -             .driver_data =3D (void *)&omen_v1_thermal_params,
> > > > +             .driver_data =3D (void *)&omen_v1_board_params,
> > > >       },
> > > >       {
> > > >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8C78") },
> > > > -             .driver_data =3D (void *)&omen_v1_thermal_params,
> > > > +             .driver_data =3D (void *)&omen_v1_board_params,
> > > >       },
> > > >       {
> > > >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8C99") },
> > > > -             .driver_data =3D (void *)&victus_s_thermal_params,
> > > > +             .driver_data =3D (void *)&victus_s_board_params,
> > > >       },
> > > >       {
> > > >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8C9C") },
> > > > -             .driver_data =3D (void *)&victus_s_thermal_params,
> > > > +             .driver_data =3D (void *)&victus_s_board_params,
> > > >       },
> > > >       {
> > > >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8D41") },
> > > > -             .driver_data =3D (void *)&omen_v1_no_ec_thermal_param=
s,
> > > > +             .driver_data =3D (void *)&omen_v1_no_ec_board_params,
> > > >       },
> > > >       {
> > > >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8D87") },
> > > > -             .driver_data =3D (void *)&omen_v1_no_ec_thermal_param=
s,
> > > > +             .driver_data =3D (void *)&omen_v1_no_ec_board_params,
> > > >       },
> > > >       {},
> > > >  };
> > >
> > > Could you do a rebase for this as there are a few ID additions in the
> > > for-next branch so I don't need to handle the conversion myself.
> > >
> > > > @@ -1862,7 +1886,10 @@ static int platform_profile_victus_s_get_ec(=
enum platform_profile_option *profil
> > > >       u8 current_dstate, current_gpu_slowdown_temp, tp;
> > > >       const struct thermal_profile_params *params;
> > > >
> > > > -     params =3D active_thermal_profile_params;
> > > > +     params =3D hp_wmi_thermal_profile();
> > > > +     if (!params)
> > > > +             return -ENODEV;
> > > > +
> > > >       if (params->ec_tp_offset =3D=3D HP_EC_OFFSET_UNKNOWN ||
> > > >           params->ec_tp_offset =3D=3D HP_NO_THERMAL_PROFILE_OFFSET)=
 {
> > > >               *profile =3D active_platform_profile;
> > > > @@ -1874,10 +1901,10 @@ static int platform_profile_victus_s_get_ec=
(enum platform_profile_option *profil
> > > >               return ret;
> > > >
> > > >       /*
> > > > -      * We cannot use active_thermal_profile_params here, because =
boards
> > > > -      * like 8C78 have tp =3D=3D 0x0 || tp =3D=3D 0x1 after cold b=
oot, but logically
> > > > -      * it should have tp =3D=3D 0x30 || tp =3D=3D 0x31, as correc=
ted by the Omen
> > > > -      * Gaming Hub on windows. Hence accept both of these values.
> > > > +      * Boards like 8C78 have tp =3D=3D 0x0 || tp =3D=3D 0x1 after=
 cold boot,
> > > > +      * but logically it should have tp =3D=3D 0x30 || tp =3D=3D 0=
x31, as
> > > > +      * corrected by the Omen Gaming Hub on windows. Hence accept =
both
> > > > +      * of these values.
> > > >        */
> > > >       if (tp =3D=3D victus_s_thermal_params.performance ||
> > > >           tp =3D=3D omen_v1_thermal_params.performance) {
> > > > @@ -1912,12 +1939,12 @@ static int platform_profile_victus_s_get_ec=
(enum platform_profile_option *profil
> > > >
> > > >  static int platform_profile_victus_s_set_ec(enum platform_profile_=
option profile)
> > > >  {
> > > > -     struct thermal_profile_params *params;
> > > > +     const struct thermal_profile_params *params;
> > > >       bool gpu_ctgp_enable, gpu_ppab_enable;
> > > >       u8 gpu_dstate; /* Test shows 1 =3D 100%, 2 =3D 50%, 3 =3D 25%=
, 4 =3D 12.5% */
> > > >       int err, tp;
> > > >
> > > > -     params =3D active_thermal_profile_params;
> > > > +     params =3D hp_wmi_thermal_profile();
> > > >       if (!params)
> > > >               return -ENODEV;
> > > >
> > > > @@ -2183,6 +2210,7 @@ static const struct platform_profile_ops hp_w=
mi_platform_profile_ops =3D {
> > > >  static int thermal_profile_setup(struct platform_device *device)
> > > >  {
> > > >       const struct platform_profile_ops *ops;
> > > > +     const struct thermal_profile_params *params;
> > > >       int err, tp;
> > > >
> > > >       if (is_omen_thermal_profile()) {
> > > > @@ -2214,13 +2242,17 @@ static int thermal_profile_setup(struct pla=
tform_device *device)
> > > >
> > > >               ops =3D &platform_profile_victus_ops;
> > > >       } else if (is_victus_s_thermal_profile()) {
> > > > +             params =3D hp_wmi_thermal_profile();
> > > > +             if (!params)
> > > > +                     return -ENODEV;
> > > > +
> > > >               /*
> > > >                * For an unknown EC layout board, platform_profile_v=
ictus_s_get_ec(),
> > > >                * behaves like a wrapper around active_platform_prof=
ile, to avoid using
> > > >                * uninitialized data, we default to PLATFORM_PROFILE=
_BALANCED.
> > > >                */
> > > > -             if (active_thermal_profile_params->ec_tp_offset =3D=
=3D HP_EC_OFFSET_UNKNOWN ||
> > > > -                 active_thermal_profile_params->ec_tp_offset =3D=
=3D HP_NO_THERMAL_PROFILE_OFFSET) {
> > > > +             if (params->ec_tp_offset =3D=3D HP_EC_OFFSET_UNKNOWN =
||
> > > > +                 params->ec_tp_offset =3D=3D HP_NO_THERMAL_PROFILE=
_OFFSET) {
> > > >                       active_platform_profile =3D PLATFORM_PROFILE_=
BALANCED;
> > > >               } else {
> > > >                       err =3D platform_profile_victus_s_get_ec(&act=
ive_platform_profile);
> > > > @@ -2681,24 +2713,25 @@ static int hp_wmi_hwmon_init(void)
> > > >       return 0;
> > > >  }
> > > >
> > > > -static void __init setup_active_thermal_profile_params(void)
> > > > +static void __init setup_active_board_params(void)
> > > >  {
> > > >       const struct dmi_system_id *id;
> > > > +     const struct thermal_profile_params *params;
> > > >
> > > > -     /*
> > > > -      * Currently only victus_s devices use the
> > > > -      * active_thermal_profile_params
> > > > -      */
> > > > -     id =3D dmi_first_match(victus_s_thermal_profile_boards);
> > > > +     id =3D dmi_first_match(hp_wmi_feature_boards);
> > > >       if (id) {
> > > > +             active_board_params =3D id->driver_data;
> > > > +             params =3D hp_wmi_thermal_profile();
> > > > +             if (!params)
> > > > +                     return;
> > > > +
> > > >               /*
> > > >                * Marking this boolean is required to ensure that
> > > >                * is_victus_s_thermal_profile() behaves like a valid
> > > >                * wrapper.
> > > >                */
> > > >               is_victus_s_board =3D true;
> > > > -             active_thermal_profile_params =3D id->driver_data;
> > > > -             if (active_thermal_profile_params->ec_tp_offset =3D=
=3D HP_EC_OFFSET_UNKNOWN) {
> > > > +             if (params->ec_tp_offset =3D=3D HP_EC_OFFSET_UNKNOWN)=
 {
> > > >                       pr_warn("Unknown EC layout for board %s. Ther=
mal profile readback will be disabled. Please report this to platform-drive=
r-x86@vger.kernel.org\n",
> > > >                               dmi_get_system_info(DMI_BOARD_NAME));
> > > >               }
> > > > @@ -2733,10 +2766,10 @@ static int __init hp_wmi_init(void)
> > > >               }
> > > >
> > > >               /*
> > > > -              * Setup active board's thermal profile parameters be=
fore
> > > > -              * starting platform driver probe.
> > > > +              * Setup active board feature data before starting pl=
atform
> > > > +              * driver probe.
> > > >                */
> > > > -             setup_active_thermal_profile_params();
> > > > +             setup_active_board_params();
> > > >               err =3D platform_driver_probe(&hp_wmi_driver, hp_wmi_=
bios_setup);
> > > >               if (err)
> > > >                       goto err_unregister_device;
> > > >
> > >
> > > --
> > >  i.
> > >
> >

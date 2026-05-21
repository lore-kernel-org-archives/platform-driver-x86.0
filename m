Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3093D6CC7
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2026 13:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368798; cv=pass; b=cUdbZU0SVPawHenFl2rdHXe36LqQvG+jOu+Ox32AZFGm8TPxiOyDuonAKE0ZBTQ403R2cPt758sKMj3w9kpF/q/Y6IMF6sdelCrPTc/i2jXMD8c5VSSPiQX3hZUZRH/T8Uv0d8Vw2nj0miSLl+gPAc8YrmnpQ/nw51FLMZEujP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368798; c=relaxed/simple;
	bh=o05gcTuvahJw7sOq+eNAkkNOCxf4a+e2XKaD3ipr8JQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kWKKxFL1OyfJk5VpgmgKjXM6LtJv/0we7g0Y6pYnDRTSRmEmcP2WNIzOxt2Vr3QWOtH8XXPZZx65Al1pnpwLngXpFmafOWA9o6LJGqt/rZKAV13pTAXcGuX2c/fydwaHlEqM6TzYQiN8016vpySD+gfPUDJOntfsLhmvZ+BKwcA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MNu+TIg1; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MNu+TIg1"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6877c719cb0so2291607a12.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2026 06:06:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779368795; cv=none;
        d=google.com; s=arc-20240605;
        b=TLq5Pir3bGkavIlLXvBJc5qy/6KKFeqhKjPUYjIxPMjliQShCtfmSmqoEET0gabEqm
         pn7cSHt2nfhpcqDwGuOWnraiPFy8pBLMS3cljWivPPDEQhF4IjWpIBwMqbzbQcQzKH3C
         PNQHUzQSfIWsoNyekRsiDa+k4MhDozMCSuhlJqAsTcwAUQog44rW+2tCYvH+c/TtUJ+s
         IMrmj1/gzJrVCYReTNNYD1cs48+cdtaCIsiUkZMZ1DkHjfYZ24Jz9Op7tRon9+8HNbQF
         JEVOFJOj+vXb5SJFhsOp+dLLhJA/vDnBf4db6f22WZKvnDPufZz7N7v8cWGyZU9BKjkW
         FMaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SzM+6xsNM8gF8cjnNF3rb06XCCa81/eqbh8dMU+R+oE=;
        fh=zR38bmj9DOOdsRgoaoc3o8ctCJ4iwXl+vqqBK0t3UNs=;
        b=KsBBgIt1fdHms2HA2UabEyK/+BxaPy3XYiQ7r/XEVM3VDjVzOJyu5SsxV/0xXKJ1Kq
         DKtzJ73tWr0rxooO6lvrrsU7KdIV/eupxI9VXcGL6eMw9Mfxkx4ELC/IsGHGUryCtRp6
         IbE2YjrWVFVxcm8KC/TwvcK3fJiZ8ifAaV0Kb0zp5A6ZRfvlR/LUdMrSBhC+DhST0daB
         VseUJlxwevKVpAvzctGtt83Fdi4BYuoKvCF1Ysbi4+8xvCL8Wf9wMqNyVXsXvmeq593a
         kGS88E48bkSy0o2xTjOmFL8Djzi19RviiapU2AuYwu0jYcbjtbB+6s/W7twCZEsE1ow7
         2RMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779368795; x=1779973595; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SzM+6xsNM8gF8cjnNF3rb06XCCa81/eqbh8dMU+R+oE=;
        b=MNu+TIg1xuqbXUAXXC09wdlIf/5e9kecaILg56EXj+o+2LS61RtP0/wxNL75XF/p4l
         lJUGosKM1bOECtpuDPwwNeTh4odOg4/FGX4HSq3bekbxnerohpbYsWO5SK1He0MbDykE
         yM/GXD/CfY3QHe5+URtL/0JV3AD7UjdtnGgEbhoWIs8QlFIFEzibxq9twvh5p710PBb5
         yoR8udrgy2Kb8fBTrdS+73HTzES7SC+U03F3eVNxzXduCP83RgOwqqJ5MjHGWj57x6+5
         nqajIBJzvCh1Miztjm/HB3hA3dcwEx3aWFGcMhWpdPUuymAr/HokNkR+AJr0cBpk4673
         2pyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368795; x=1779973595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SzM+6xsNM8gF8cjnNF3rb06XCCa81/eqbh8dMU+R+oE=;
        b=hUPMWvQiVhg3ryz3j/iV1UYm/3alzoUsLlNRmYg7FETRfl0z8Vgh2TWnFjx1CQnUl2
         VMff+5Rp9+P8vspYirbA9FRNGxtHtQ70ZN2QXVjN2tjHIss38c1xDJOAJNv/Jt0d5Aqh
         PtCVyYuajBXaduJSkrF6mkDhv9lnQiqnmidg8To+jI30x5bOtcAGKHXzEhJvH0OlEKlg
         3AsoRilD3RyrhrclB8fje2Bz2eenOkHhbLA0pCbDZzpOGQJo/h3AzFFxU8yeryhFmrxF
         MaFkz4HT/JvsHgLLAXFv3QyF+ywAY4EivfUjmOv6toGEHiTTKItgDF4gb0XLuXtH58X3
         raiA==
X-Gm-Message-State: AOJu0Yx16t3oCkOX4/RyaRGf9d+fvFic93SN85mhNIwvy4lhff/3yasK
	kS5XLVypTpZxqFgRI+DX6F5G3CwJYSARsroy3xQ4y1qYBwtgKiG2vHWhzbQemFxHTX376vLl3xK
	HFaw5VSMCJG75kjNZmjd6bnizgDLeSP8=
X-Gm-Gg: Acq92OHfAVenuvOrMv37e3iT/KJmDrxh6LPF80g/+aBQD2pEANdWMRTSNnsZVFZ3vQl
	hWaZXynn/2mKjgGBOJ22q/sasVYRayVdwLn+FSZf5Jdyq08/CrfFVQzMzKsf/hMIxSN3Q7JfQpx
	ls0arLaQg6twxjYaYY8PbUX3lDkCQd8ZR9pUolYHmDfp6yTgCFwePQEUmIXjBOFP9ndknhQCvsd
	23rt1Pkdohf/Jxg6xLBWWTS6G0YhXFNU09ZyVLYrsKsRk8m/+h9VdgsGHGb/aYTuQzCUk8TIzgO
	4X2tCEVq7y79jHXKG87zHtW+ouVT74OKHJFj9ZOw
X-Received: by 2002:a05:6402:3808:b0:674:5b2c:d42c with SMTP id
 4fb4d7f45d1cf-688354341cfmr1359958a12.3.1779368794405; Thu, 21 May 2026
 06:06:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520140800.130530-1-radheykalra901@gmail.com>
 <20260520140800.130530-2-radheykalra901@gmail.com> <7c6770ca-b9db-9504-d0d2-11a136955dee@linux.intel.com>
In-Reply-To: <7c6770ca-b9db-9504-d0d2-11a136955dee@linux.intel.com>
From: Radhey Kalra <radheykalra901@gmail.com>
Date: Thu, 21 May 2026 18:36:21 +0530
X-Gm-Features: AVHnY4IZLQ5W4xDgNfC2_kQ_6KYi9DbBHbyjiXFcdSQHn3xacIX-jIOOj6NREQk
Message-ID: <CAJ5VyXKpDK6ZPBvkLwTqsUryZBzQY6NnFZX51zmcXyAs9kzzDg@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] platform/x86: hp-wmi: Prepare Victus fan control
 board data
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, krishna.chomal108@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ilpo,

Agreed, that was a mistake. The gpu_delta parsing change does not
logically belong in the board-data refactor.

I folded it into the preparatory patch while trying to reduce the
series size, but that made the patch less focused. I will split it
back out so the series is:

board-data / fan-control selection refactor
fan-table gpu_delta parsing fix
8A3D board addition

Thanks, Radhey


On Thu, May 21, 2026 at 6:33=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Wed, 20 May 2026, Radhey Kalra wrote:
>
> > Move the Victus S thermal-profile DMI data behind hp_wmi_board_params s=
o
> > board-specific feature data can describe thermal-profile and fan-contro=
l
> > support together.
> >
> > Use the active board data for fan-control decisions instead of checking
> > is_victus_s_thermal_profile() in the hwmon path.
>
> > Also derive gpu_delta
> > from the first non-zero GPU RPM row so fan tables whose first GPU RPM i=
s
> > zero still produce valid fan settings.
>
> Unfortunately, moving gpu_delta things from own patch to the refactor
> patch is a step backwards.
>
> Why would it logically belong to this patch??
>
> --
>  i.
>
> > No fan-control support changes intended for existing boards. Fan tables
> > with an initial zero GPU RPM row now produce a valid GPU delta.
> >
> > Signed-off-by: Radhey Kalra <radheykalra901@gmail.com>
> > ---
> >  drivers/platform/x86/hp/hp-wmi.c | 204 ++++++++++++++++++++++---------
> >  1 file changed, 145 insertions(+), 59 deletions(-)
> >
> > diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp=
/hp-wmi.c
> > index d1cc6e7..dcfffe6 100644
> > --- a/drivers/platform/x86/hp/hp-wmi.c
> > +++ b/drivers/platform/x86/hp/hp-wmi.c
> > @@ -133,11 +133,52 @@ static const struct thermal_profile_params omen_v=
1_no_ec_thermal_params =3D {
> >       .ec_tp_offset   =3D HP_NO_THERMAL_PROFILE_OFFSET,
> >  };
> >
> > -/*
> > - * A generic pointer for the currently-active board's thermal profile
> > - * parameters.
> > - */
> > -static struct thermal_profile_params *active_thermal_profile_params;
> > +struct hp_wmi_fan_profile_params {
> > +     int (*get_fan_speed)(int fan);
> > +     bool fan_table;
> > +};
> > +
> > +struct hp_wmi_board_params {
> > +     const struct thermal_profile_params *thermal_profile;
> > +     const struct hp_wmi_fan_profile_params *fan_profile;
> > +};
> > +
> > +static int hp_wmi_get_fan_speed_victus_s(int fan);
> > +
> > +static const struct hp_wmi_fan_profile_params victus_s_fan_profile_par=
ams =3D {
> > +     .get_fan_speed  =3D hp_wmi_get_fan_speed_victus_s,
> > +     .fan_table      =3D true,
> > +};
> > +
> > +static const struct hp_wmi_board_params victus_s_board_params =3D {
> > +     .thermal_profile        =3D &victus_s_thermal_params,
> > +     .fan_profile            =3D &victus_s_fan_profile_params,
> > +};
> > +
> > +static const struct hp_wmi_board_params omen_v1_board_params =3D {
> > +     .thermal_profile        =3D &omen_v1_thermal_params,
> > +     .fan_profile            =3D &victus_s_fan_profile_params,
> > +};
> > +
> > +static const struct hp_wmi_board_params omen_v1_legacy_board_params =
=3D {
> > +     .thermal_profile        =3D &omen_v1_legacy_thermal_params,
> > +     .fan_profile            =3D &victus_s_fan_profile_params,
> > +};
> > +
> > +static const struct hp_wmi_board_params omen_v1_no_ec_board_params =3D=
 {
> > +     .thermal_profile        =3D &omen_v1_no_ec_thermal_params,
> > +     .fan_profile            =3D &victus_s_fan_profile_params,
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
> > @@ -187,67 +228,67 @@ static const char * const victus_thermal_profile_=
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
> > -             .driver_data =3D (void *)&victus_s_thermal_params,
> > +             .driver_data =3D (void *)&victus_s_board_params,
> >       },
> >       {
> >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8D87") },
> > -             .driver_data =3D (void *)&omen_v1_no_ec_thermal_params,
> > +             .driver_data =3D (void *)&omen_v1_no_ec_board_params,
> >       },
> >       {},
> >  };
> > @@ -1769,6 +1810,38 @@ static bool is_victus_s_thermal_profile(void)
> >       return is_victus_s_board;
> >  }
> >
> > +static const struct hp_wmi_fan_profile_params *hp_wmi_fan_profile(void=
)
> > +{
> > +     if (!active_board_params)
> > +             return NULL;
> > +
> > +     return active_board_params->fan_profile;
> > +}
> > +
> > +static bool hp_wmi_fan_control_supported(void)
> > +{
> > +     const struct hp_wmi_fan_profile_params *params =3D hp_wmi_fan_pro=
file();
> > +
> > +     return params && params->get_fan_speed;
> > +}
> > +
> > +static bool hp_wmi_fan_table_supported(void)
> > +{
> > +     const struct hp_wmi_fan_profile_params *params =3D hp_wmi_fan_pro=
file();
> > +
> > +     return params && params->fan_table;
> > +}
> > +
> > +static int hp_wmi_get_active_fan_speed(int fan)
> > +{
> > +     const struct hp_wmi_fan_profile_params *params =3D hp_wmi_fan_pro=
file();
> > +
> > +     if (!params || !params->get_fan_speed)
> > +             return -EOPNOTSUPP;
> > +
> > +     return params->get_fan_speed(fan);
> > +}
> > +
> >  static int victus_s_gpu_thermal_profile_get(bool *ctgp_enable,
> >                                           bool *ppab_enable,
> >                                           u8 *dstate,
> > @@ -1854,7 +1927,10 @@ static int platform_profile_victus_s_get_ec(enum=
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
> > @@ -1866,10 +1942,10 @@ static int platform_profile_victus_s_get_ec(enu=
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
> > @@ -1904,12 +1980,12 @@ static int platform_profile_victus_s_get_ec(enu=
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
> > @@ -2175,6 +2251,7 @@ static const struct platform_profile_ops hp_wmi_p=
latform_profile_ops =3D {
> >  static int thermal_profile_setup(struct platform_device *device)
> >  {
> >       const struct platform_profile_ops *ops;
> > +     const struct thermal_profile_params *params;
> >       int err, tp;
> >
> >       if (is_omen_thermal_profile()) {
> > @@ -2206,13 +2283,17 @@ static int thermal_profile_setup(struct platfor=
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
> > @@ -2380,7 +2461,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wm=
i_hwmon_priv *priv)
> >
> >       switch (priv->mode) {
> >       case PWM_MODE_MAX:
> > -             if (is_victus_s_thermal_profile()) {
> > +             if (hp_wmi_fan_control_supported()) {
> >                       ret =3D hp_wmi_get_fan_count_userdefine_trigger()=
;
> >                       if (ret < 0)
> >                               return ret;
> > @@ -2392,7 +2473,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wm=
i_hwmon_priv *priv)
> >                                secs_to_jiffies(KEEP_ALIVE_DELAY_SECS));
> >               return 0;
> >       case PWM_MODE_MANUAL:
> > -             if (!is_victus_s_thermal_profile())
> > +             if (!hp_wmi_fan_control_supported())
> >                       return -EOPNOTSUPP;
> >               ret =3D hp_wmi_fan_speed_set(priv, pwm_to_rpm(priv->pwm, =
priv));
> >               if (ret < 0)
> > @@ -2401,7 +2482,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wm=
i_hwmon_priv *priv)
> >                                secs_to_jiffies(KEEP_ALIVE_DELAY_SECS));
> >               return 0;
> >       case PWM_MODE_AUTO:
> > -             if (is_victus_s_thermal_profile()) {
> > +             if (hp_wmi_fan_control_supported()) {
> >                       ret =3D hp_wmi_get_fan_count_userdefine_trigger()=
;
> >                       if (ret < 0)
> >                               return ret;
> > @@ -2425,12 +2506,12 @@ static umode_t hp_wmi_hwmon_is_visible(const vo=
id *data,
> >  {
> >       switch (type) {
> >       case hwmon_pwm:
> > -             if (attr =3D=3D hwmon_pwm_input && !is_victus_s_thermal_p=
rofile())
> > +             if (attr =3D=3D hwmon_pwm_input && !hp_wmi_fan_control_su=
pported())
> >                       return 0;
> >               return 0644;
> >       case hwmon_fan:
> > -             if (is_victus_s_thermal_profile()) {
> > -                     if (hp_wmi_get_fan_speed_victus_s(channel) >=3D 0=
)
> > +             if (hp_wmi_fan_control_supported()) {
> > +                     if (hp_wmi_get_active_fan_speed(channel) >=3D 0)
> >                               return 0444;
> >               } else {
> >                       if (hp_wmi_get_fan_speed(channel) >=3D 0)
> > @@ -2454,8 +2535,8 @@ static int hp_wmi_hwmon_read(struct device *dev, =
enum hwmon_sensor_types type,
> >       priv =3D dev_get_drvdata(dev);
> >       switch (type) {
> >       case hwmon_fan:
> > -             if (is_victus_s_thermal_profile())
> > -                     ret =3D hp_wmi_get_fan_speed_victus_s(channel);
> > +             if (hp_wmi_fan_control_supported())
> > +                     ret =3D hp_wmi_get_active_fan_speed(channel);
> >               else
> >                       ret =3D hp_wmi_get_fan_speed(channel);
> >               if (ret < 0)
> > @@ -2464,10 +2545,10 @@ static int hp_wmi_hwmon_read(struct device *dev=
, enum hwmon_sensor_types type,
> >               return 0;
> >       case hwmon_pwm:
> >               if (attr =3D=3D hwmon_pwm_input) {
> > -                     if (!is_victus_s_thermal_profile())
> > +                     if (!hp_wmi_fan_control_supported())
> >                               return -EOPNOTSUPP;
> >
> > -                     rpm =3D hp_wmi_get_fan_speed_victus_s(channel);
> > +                     rpm =3D hp_wmi_get_active_fan_speed(channel);
> >                       if (rpm < 0)
> >                               return rpm;
> >                       *val =3D rpm_to_pwm(rpm / 100, priv);
> > @@ -2501,7 +2582,7 @@ static int hp_wmi_hwmon_write(struct device *dev,=
 enum hwmon_sensor_types type,
> >       switch (type) {
> >       case hwmon_pwm:
> >               if (attr =3D=3D hwmon_pwm_input) {
> > -                     if (!is_victus_s_thermal_profile())
> > +                     if (!hp_wmi_fan_control_supported())
> >                               return -EOPNOTSUPP;
> >                       /* PWM input is invalid when not in manual mode *=
/
> >                       if (priv->mode !=3D PWM_MODE_MANUAL)
> > @@ -2518,13 +2599,13 @@ static int hp_wmi_hwmon_write(struct device *de=
v, enum hwmon_sensor_types type,
> >                       priv->mode =3D PWM_MODE_MAX;
> >                       return hp_wmi_apply_fan_settings(priv);
> >               case PWM_MODE_MANUAL:
> > -                     if (!is_victus_s_thermal_profile())
> > +                     if (!hp_wmi_fan_control_supported())
> >                               return -EOPNOTSUPP;
> >                       /*
> >                        * When switching to manual mode, set fan speed t=
o
> >                        * current RPM values to ensure a smooth transiti=
on.
> >                        */
> > -                     rpm =3D hp_wmi_get_fan_speed_victus_s(channel);
> > +                     rpm =3D hp_wmi_get_active_fan_speed(channel);
> >                       if (rpm < 0)
> >                               return rpm;
> >                       priv->pwm =3D rpm_to_pwm(rpm / 100, priv);
> > @@ -2585,13 +2666,14 @@ static int hp_wmi_setup_fan_settings(struct hp_=
wmi_hwmon_priv *priv)
> >       u8 min_rpm, max_rpm;
> >       u8 cpu_rpm, gpu_rpm, noise_db;
> >       int gpu_delta, i, num_entries, ret;
> > +     bool gpu_delta_found =3D false;
> >       size_t header_size, entry_size;
> >
> >       /* Default behaviour on hwmon init is automatic mode */
> >       priv->mode =3D PWM_MODE_AUTO;
> >
> > -     /* Bypass all non-Victus S devices */
> > -     if (!is_victus_s_thermal_profile())
> > +     /* Bypass devices without fan control support. */
> > +     if (!hp_wmi_fan_table_supported())
> >               return 0;
> >
> >       ret =3D hp_wmi_perform_query(HPWMI_VICTUS_S_GET_FAN_TABLE_QUERY,
> > @@ -2625,12 +2707,15 @@ static int hp_wmi_setup_fan_settings(struct hp_=
wmi_hwmon_priv *priv)
> >                       min_rpm =3D cpu_rpm;
> >               if (cpu_rpm > max_rpm)
> >                       max_rpm =3D cpu_rpm;
> > +             if (!gpu_delta_found && gpu_rpm > 0) {
> > +                     gpu_delta =3D gpu_rpm - cpu_rpm;
> > +                     gpu_delta_found =3D true;
> > +             }
> >       }
> >
> > -     if (min_rpm =3D=3D U8_MAX || max_rpm =3D=3D 0)
> > +     if (min_rpm =3D=3D U8_MAX || max_rpm =3D=3D 0 || !gpu_delta_found=
)
> >               return -EINVAL;
> >
> > -     gpu_delta =3D fan_table->entries[0].gpu_rpm - fan_table->entries[=
0].cpu_rpm;
> >       priv->min_rpm =3D min_rpm;
> >       priv->max_rpm =3D max_rpm;
> >       priv->gpu_delta =3D gpu_delta;
> > @@ -2673,24 +2758,25 @@ static int hp_wmi_hwmon_init(void)
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
> > @@ -2725,10 +2811,10 @@ static int __init hp_wmi_init(void)
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

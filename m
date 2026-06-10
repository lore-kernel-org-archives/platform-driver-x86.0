Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966E33ED5A3
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jun 2026 10:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781086728; cv=pass; b=YQVdUA94ncyDjuILcb+rUKcWqXXK9KOSAlhwEw/AZWdBmqRzfcxnCRNfbSzgP8K1bKZfrLjf92IpZLLIMVCFcfOh2Tl5m63Cg+GJ1wFxCbDIvRSw7xAzX4HXLoijAFaLZ3ud6Z4K+3Mj7JN3grPBTv59pOmn8d5PguVSQ/oUiQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781086728; c=relaxed/simple;
	bh=LIGwpdZHI5/HNe972YHkoYKa2j1sEk3KTwfR+ftcwIk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rf+3inS5CFTpGVzxkk+eHukWumtFth/XVooP7aOy6BdLy5EwTtEBs6T866kF+NrlyWkZe33uaLhDv182b11kzNBbD3VbnnNu2A+/7X9geCc5Mesz7i55Bfq4kI1j32Pb6BKJPYQPazx10v5yqWBF+6CgCvpT45kDJ4r0XCsq55s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P5TGVNIH; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P5TGVNIH"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-68bac6e24fdso8854529a12.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jun 2026 03:18:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781086725; cv=none;
        d=google.com; s=arc-20240605;
        b=k3D1aE1PwPcx/oXeAprveuny13EuK/O6ivyMiV8HsD5VEisMta/byoAsyc3vEO3kA3
         xP/0Zi3N6phON/yFuLFSqzOSo9afCb8abGFa8fLUmPsmjgwzZjedoDN1QSo5VSGOMlU3
         c0YgWuMzfcMgBSaPEIaQq5Mddh+Q3IcagC6YObQGF5IvjqA9g4uPYgK09GQw4Z7s6zh3
         4h93UZ6L0SnOsd95EMWexVpfoR/hjKAk7R31YhMzIBusc36j2JNskf8Z5cGDQKoHu550
         UVUpqR/JVsOyZI7OaaSX3Lrl0ORVS4ttnToL1sFt8ThscPB25zj0/Y7eZU4uKieyJuM2
         kWYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vxnkWMFtI2KAnO5XvI2L9UdOV5BIhHK+AifgphcUNvU=;
        fh=audd8TrHKq5asRuOjdUVKwU8xgPLGnsU7WNlh3e/R2k=;
        b=QbTy/P5qLhRQ8vtCrpfP8zfDgjwi9FcmGbgzTgDop7H2CS25WX/bG5uAc/zuC9yJSR
         D+nX6VVJda2dEIH0iD+VF0hv5QEMJrTuQBwMYJ8xLXEU15WshLeJorHt3EN2KUxre6Dw
         8eoomDS7mwZGBzfaAS/K0LkMjk0Lq+1FnHa+SRpLJOKJgd0xJQzEFDM8EL15a9qXMU4o
         KH4dWbDm4R3Z+xHdc/ysM89UjeGBljjgHkeedAU7Pqf5Jwml/zIP7euAfDcJ6l9F3m1g
         MAGFrCWtEXHGLokSDuy98uxDONV3M9enyY96T7nV4OGyOhOM28MRpAkPOsHeJaj23uOn
         b0og==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086725; x=1781691525; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxnkWMFtI2KAnO5XvI2L9UdOV5BIhHK+AifgphcUNvU=;
        b=P5TGVNIH5+Vmg4yeaI3tLZsCUCcspmNN3ufAv7RKGMCYJFdqBK501vbjMq6GmPR7c6
         gKStk8p+uGa1d2WhMc/QkQwhTEZ1teqcRShIc/+Cld59wydO4KqpMaQGZGDwi/TcUA9G
         zeamMxyXR4PRrXAvhYr/xNBwjwwMpGcBnTkz5W2RLc+OLIbmTkkndC5HPCdv/kQMD0HC
         j41WXHKfyEgVVxeQKQtLo923mW/uHBtYgE5QTyE1n0HndSwPbauac7VMoesMc9ZWlYhB
         mzMYn1ydibgfvWij+tFfYfIRG73NvT1Xc4irvudmMpQcyLcvCSYvHk9ihEgc8alDjlvj
         Ne2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086725; x=1781691525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vxnkWMFtI2KAnO5XvI2L9UdOV5BIhHK+AifgphcUNvU=;
        b=OBSpmWoVHei1coS4LqYoUZDB9ZlP+t4dXUhWZ22LERxsWtqR0jWh00+IZBrS5mL1tV
         qImL381wUbxbm8TYVixIKeMZ2TGTCyZ/A0Eitn3u90x0IQXM4cb7ima6M+K6P6VxtlFy
         xSjp/9qC0ohOtOIv7BOWurI0uoR7a0k6VNB7finuZbe+JBEr9/x+w+iqLVutsbrA9NNI
         fa/0IguRZA4N15dsUv/EVraKm8NACG5ToKgBpDRcFhDpSgjHtHdiiHsVm0j9PDSKRViA
         x7k10D2CDcYUm4WbFGNDobzjTx0hAxTpuhJ7VhewMsTNsV6wKeRnu8HRWaXoufg68rbX
         TH+Q==
X-Gm-Message-State: AOJu0YxsKr+EMhbFXUiqlC7CrRcGILnjk3O2sd4Yn0MMBflUuhm2/4sX
	t/CKCp1ELw4h8ue1wZD6AOQOKC5kyT2YCq5uRSis3NXQ71AKmx/LXBqcYteDiFPWLUxgLhOrYgF
	GOWXPcr5Jre3p3raC8yb5536J/DxMYMhu5lXT
X-Gm-Gg: Acq92OHMCY7brfiMjOg37BX4IZ+jJqP4zqNo7siFHdorb5B0BvBOTM2rznG2XpP8Gv4
	wiM7FhP2bbqi1OGzQcCMV1/3vobvR7k9AeP8Ei98PVgkuHEKoKNMJQQ9f87dJZ6cDHiwQcajIwk
	PS99CBRUUDrT3ECd+8wMmzSi+v7wSV4vwKwkSg2iaPM40Rf8Eto/b+0aaXSg/2+zsVUjkr3NxYW
	wVlB3toj0VWYBn24oIvE3vkhBYG/aq0yz6bq9uUALpbxqoqGgxVSS7tgyVj5gqVH2Dqs6oVfzb7
	SZi1w1GAzJqXAgatYAeW07ywBBZpDGW1JmXtRiqeuAAiaX1v+DSndWoT7Fkqog==
X-Received: by 2002:a17:907:986:b0:bed:5774:7c17 with SMTP id
 a640c23a62f3a-bf3701806abmr1202498366b.5.1781086724820; Wed, 10 Jun 2026
 03:18:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260606080204.724444-1-radheykalra901@gmail.com>
 <20260606080204.724444-4-radheykalra901@gmail.com> <c581954f-8fd2-6b19-8444-e6fdaa269f30@linux.intel.com>
In-Reply-To: <c581954f-8fd2-6b19-8444-e6fdaa269f30@linux.intel.com>
From: Radhey Kalra <radheykalra901@gmail.com>
Date: Wed, 10 Jun 2026 15:48:31 +0530
X-Gm-Features: AVVi8Cckmz1jN9_o-LHRLBKn9WxiwF0tFRxdUvXb9CT-NBO2ZFT_Ng3-gw2r-2E
Message-ID: <CAJ5VyXLu-PYMiOE1-32nacV1ccN530-dT-p8DG9Gyh+cTb_Uyw@mail.gmail.com>
Subject: Re: [PATCH v9 3/3] platform/x86: hp-wmi: Add Victus 15-fb0xxx support
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
	krishna.chomal108@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ilpo,

Got it. I'll re-sort them to ensure 8902 comes before 8A3D in the final ser=
ies.

Thanks, Radhey

On Wed, Jun 10, 2026 at 2:51=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Sat, 6 Jun 2026, Radhey Kalra wrote:
>
> > HP Victus 15-fb0xxx board 8A3D exposes the Victus fan table and accepts
> > the existing Victus fan-speed WMI control path. Add board data for the
> > Victus S thermal-profile path and fan-control support.
> >
> > Signed-off-by: Radhey Kalra <radheykalra901@gmail.com>
> > ---
> >  drivers/platform/x86/hp/hp-wmi.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp=
/hp-wmi.c
> > index 91578e7..c124ad0 100644
> > --- a/drivers/platform/x86/hp/hp-wmi.c
> > +++ b/drivers/platform/x86/hp/hp-wmi.c
> > @@ -170,6 +170,11 @@ static const struct hp_wmi_board_params omen_v1_no=
_ec_board_params =3D {
> >       .fan_profile            =3D &victus_s_fan_profile_params,
> >  };
> >
> > +static const struct hp_wmi_board_params victus_8a3d_board_params =3D {
> > +     .thermal_profile        =3D &victus_s_thermal_params,
> > +     .fan_profile            =3D &victus_s_fan_profile_params,
> > +};
> > +
> >  static const struct hp_wmi_board_params *active_board_params;
> >
> >  static const struct thermal_profile_params *hp_wmi_thermal_profile(voi=
d)
> > @@ -230,6 +235,10 @@ static const char * const victus_thermal_profile_b=
oards[] =3D {
> >
> >  /* DMI board-specific feature data for Omen and Victus laptops. */
> >  static const struct dmi_system_id hp_wmi_feature_boards[] __initconst =
=3D {
> > +     {
> > +             .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8A3D") },
> > +             .driver_data =3D (void *)&victus_8a3d_board_params,
> > +     },
> >       {
> >               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8902") },
>
> Lets try to keep these in order (8902 < 8A3D).
>
> >               .driver_data =3D (void *)&omen_v1_legacy_board_params,
> >
>
> --
>  i.
>

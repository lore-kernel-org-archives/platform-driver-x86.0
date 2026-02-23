Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDEC2773F0
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Feb 2026 14:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771855499; cv=none; b=k336pKtdSYEqf8Kso6dRda2brCmNICpBOwnwg3oMHxlHLlJzgf8W/nozbefiywSiZeqGLhvc2wL3vny1jlhxyGbN/AmbBC4vOUrMFC0fn1xpTMdzEON7PG1dgkVHPWJ/f256vcSBHj/VuJs9ZMjhzO/ACbnwh3wSrvDT2pFQdMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771855499; c=relaxed/simple;
	bh=zdihtlMRaS4PB7+X7gg3PoLZQvaljfdYFA/wV3kAuJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WGJXxs7BaNfMtKiVBsHhRfvlNcBC885Tnq3Dm/6efoAFm4ftzQ7XAKW+HNis6GUMVTYpwTdknbwGXfESZ1Sk72KHr+Tfxlr94v1J97QiaV+Wny7bSkyh1vjIafc74Aqlq/r5E0cwxbl+brjvNhnolTZMpzqcCXVhkE+Y+h/WZDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=beVv/6ac; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="beVv/6ac"
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id 4672CC4A32
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Feb 2026 16:04:54 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id C11FEC4879
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Feb 2026 16:04:53 +0200 (EET)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 38FC71FDF8F
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Feb 2026 16:04:53 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1771855493;
	bh=cxptIDuJPE4cECxtMpwGjd0jgd9uujATGYPYaaW5HpE=;
	h=Received:From:Subject:To;
	b=beVv/6ac+RCOfRrBVLtAiwqMyCN0CZymENMOw+Qru8rh1NcOe7R17YMDicy9Zbwue
	 83gG89CNiFSCOwlnIZC9wSg64zxxggAEpIL99oBY5p9UaOpsfVVJUSeDnU5cNkfQsL
	 KPZQ3ONSvfOFeGiEnEepnCT5shtIsMqn6naJbcZRtS381H1ms0iv0clcOdAZCMjHsQ
	 W8fUNy2fGop/y9HMIQcdSjKa6RnSXEekg9+lyQXZoEmul6TxJh/Zbs63JP9IF/6H0f
	 +RIOEOquKYlVxlFXC/QbYhVtKmP3Zmy7kM7kgJP8PKa0Ka42S5SLh6UvMxqFx1zV0i
	 0vH31eRiT3czQ==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.215.181) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pg1-f181.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-c70b4a69bc7so644759a12.0
        for <platform-driver-x86@vger.kernel.org>;
 Mon, 23 Feb 2026 06:04:53 -0800 (PST)
X-Gm-Message-State: AOJu0YxdhAxNi/E3lsyEkZz0cmXZY0m0qebi/r+jLWvWkHfqBD5jGOsI
	tPm+cn9EMv2rGdKM8Pn9yPGPW97SKr6vYsaVDQXCQd4oQ+LjTvzGK5N1Vs0ePzesO9wuPHL70Io
	voHjLKsCiSYDcQJt+E4gsegaj2RS02kI=
X-Received: by 2002:a17:903:244a:b0:2a0:c92e:a378 with SMTP id
 d9443c01a7336-2ad741e15a8mr80875195ad.7.1771855491782; Mon, 23 Feb 2026
 06:04:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260218214919.449636-1-lkml@antheas.dev>
 <20260218214919.449636-2-lkml@antheas.dev>
 <6bc7e9df-303b-7f3d-e3b3-eefd6afcc074@linux.intel.com>
In-Reply-To: <6bc7e9df-303b-7f3d-e3b3-eefd6afcc074@linux.intel.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 23 Feb 2026 15:04:40 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwHQ1pu_hD6MvCxskaF8A=kiMNOAAUpgD=7AAu=VXDB0Pg@mail.gmail.com>
X-Gm-Features: AaiRm51XgkE96u9HqJubHUPkAYtigi7tjkGD0DmGTAm-_70JeI4uxa1wVZew9c0
Message-ID: 
 <CAGwozwHQ1pu_hD6MvCxskaF8A=kiMNOAAUpgD=7AAu=VXDB0Pg@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] platform/x86: oxpec: Add support for OneXPlayer
 APEX
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Derek John Clark <derekjohn.clark@gmail.com>,
	=?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
	Hans de Goede <hansg@kernel.org>, Eileen <eileen@one-netbook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <177185549345.4185379.7806206431457406481@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Mon, 23 Feb 2026 at 15:03, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Wed, 18 Feb 2026, Antheas Kapenekakis wrote:
>
> > This is a new Strix Halo handheld by OneXPlayer. Uses the same register=
s
> > as the OneXPlayer Fly devices.
>
> Hi,
>
> The changelog bodies should be fully readable and understandable without
> the shortlog (in the Subject) so you cannot start with "This is ...".
>
> The same problem was in some other patch of this series as well.

Hi,
I will review and send a V2 later today.

Thanks,
Antheas

> --
>  i.
>
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
> >  drivers/platform/x86/oxpec.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/platform/x86/oxpec.c b/drivers/platform/x86/oxpec.=
c
> > index 144a454103b9..59d6f9d9a905 100644
> > --- a/drivers/platform/x86/oxpec.c
> > +++ b/drivers/platform/x86/oxpec.c
> > @@ -11,7 +11,7 @@
> >   *
> >   * Copyright (C) 2022 Joaqu=C3=ADn I. Aramend=C3=ADa <samsagax@gmail.c=
om>
> >   * Copyright (C) 2024 Derek J. Clark <derekjohn.clark@gmail.com>
> > - * Copyright (C) 2025 Antheas Kapenekakis <lkml@antheas.dev>
> > + * Copyright (C) 2025-2026 Antheas Kapenekakis <lkml@antheas.dev>
> >   */
> >
> >  #include <linux/acpi.h>
> > @@ -142,6 +142,13 @@ static const struct dmi_system_id dmi_table[] =3D =
{
> >               },
> >               .driver_data =3D (void *)oxp_2,
> >       },
> > +     {
> > +             .matches =3D {
> > +                     DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER APEX"=
),
> > +             },
> > +             .driver_data =3D (void *)oxp_fly,
> > +     },
> >       {
> >               .matches =3D {
> >                       DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> >


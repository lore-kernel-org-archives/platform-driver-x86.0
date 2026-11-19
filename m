Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=78.46.171.57
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081059;
	b=WB7AmMV59dhMX/obhWCGT9yWVButZ5vrJ3M54PTz0h29H6Gtwi7Jm3ayJZdJENuWPibg
	 FMxvGp1/oo4qe6S/nrtZIpqU7RgCEiBvVjM/yL1AVFrb6Z7umc4SiTOZ93mM3r7paWgpI
	 PMbGAe1NO4E7ErJxun5y7Iii/UyYNrSw4aKl0Op9TC3rPPYTK/a4Pqfi4oaZuNZC+Xid5
	 3+yf2xv/05GxcMEe4P+V1xaUgbxMns5WRF+HfQjfszbFlLRt9T9aUgekn/+30v4IUwUoD
	 /A/cnxi8DHQGtEdkiVPyZ5xpq2r78wxXF2q9uYv3ntvK5qTnLMIHjJrbKd/JRaM/xhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081059;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Received-SPF:
	 Received:X-Gm-Message-State:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-PPP-Message-ID:X-PPP-Vhost:X-Virus-Scanned:X-Virus-Status;
	bh=6FrbWPPlNlcwMD6BYH6SsTP7dW80JjmRtM73J1oZK1E=;
	b=HSFB2R/rh3Rzv6PKJapj9CCfMQQPeDebWXMgjpSE7iCnjDV2kM6UB95s48c6sXmc7+gs
	 +EjAHfuCMweUBcRwrzj7O/KVPJSuN7cWj8rdidVygr0hcoZVMfkvqZZqXNInqbdsJnZ29
	 4EhYaMxlBQ6ypkRIogkG2YpQYU97GbiFrcZt6iuygTcteqDQKa93PXe9YTBbopSTUepxY
	 PF54DQpmfO86lk+fwv49+n/TTdma5fW5mx99Yr3cB3JzPeWp0+zJhKiZm293I0w8yJsSv
	 ZDnk6DD8hAlYiWc2iLTBhQE14DYnONboAo5eSuLg0iz4nOBpZ5BhB72cJprLNhIT/5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=antheas.dev;
	spf=pass smtp.mailfrom=antheas.dev;
	dkim=pass header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=h4syMKoz;
	arc=none smtp.remote-ip=78.46.171.57
Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA903606A337
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 09:37:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA903606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=h4syMKoz
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id 02558BF119
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 11:37:30 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id D936BBF107
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 11:37:28 +0200 (EET)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 278031FF512
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 11:37:28 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1795081048;
	bh=6FrbWPPlNlcwMD6BYH6SsTP7dW80JjmRtM73J1oZK1E=;
	h=Received:From:Subject:To;
	b=h4syMKozoXHdE8pZcZqveN4A2cR4hnwbZtSw4QqIPqGfQyG57NH784wCfiBAxqJeC
	 GnZF4M+TxZfEBIbaznui1mGg0llp98NEstv3uG8uO1yzG6b8p6uhPG0z9vurt5t/Pf
	 NSfy+u9bArPwFKHN6Hu6HlO7SrdLLd//mT5O7DeMdJRJHUdR7kIZmVS7TEo9VaAMCW
	 P6W3dMc33Yrr9YxEKumnyXqWNzqprE84OF6t4jZP8JszrE+r/sF8aFZI0BRG1OU/9x
	 ZiO7Jqv9AB94jnfLbCBqAEQZp1pEsYqaJh/wLmNbGyqp0uZ/iXtSFZHs50YQn3gdYG
	 57kiVJv2qolaQ==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.215.175) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pg1-f175.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-cddac941ed1so881590a12.2
        for <platform-driver-x86@vger.kernel.org>;
 Thu, 19 Nov 2026 01:37:28 -0800 (PST)
X-Gm-Message-State: APuU4Z96AfcXLTcNKcUVwDJaiaQolGNqpwqs/U3qqmVd8npdlDHl7qXt
	1mR6kUpAmtgWtf4dnvgZIrWW8j1m2yRtomeJNQYkQDS24vY3y9k6fqaI5ehb2aKdb0Z/E9b1lU7
	QDoGzHCn8H54sbAsVPIPhFrKPiAnLiwU=
X-Received: by 2002:a05:6a21:6f0d:b0:3fe:77f8:8931 with SMTP id
 adf61e73a8af0-3fe986ea17dmr4979546637.77.1795081046624; Thu, 19 Nov 2026
 01:37:26 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118052557.143089-1-jeff@aletheia.io>
 <CAGwozwELhT8WFiPNQ_GxQBgE=iwh9ZoL1idb+b3vq9wMskG6Cg@mail.gmail.com>
 <CAHc3qfEW-wq2-gGikxR-Bi_htrCyRbiOnXF_3C+WKPwJr=mecg@mail.gmail.com>
 <CAGwozwFbvBa5Ea4uYa2FUa1YhPj5Ei9KsSAR_v_ingCT=43+xA@mail.gmail.com>
 <CAHc3qfHM5O_DZSWH3wrNaG2rR8ku9UL12WUMFCUfAjKdqZSj-w@mail.gmail.com>
In-Reply-To: 
 <CAHc3qfHM5O_DZSWH3wrNaG2rR8ku9UL12WUMFCUfAjKdqZSj-w@mail.gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Thu, 19 Nov 2026 10:37:15 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwHNM2zQo95UC4mb0T2rq8mW-zbD132os_x-ZCqQooteRg@mail.gmail.com>
X-Gm-Features: AclHuK-6-d8SqZqfjTmnqj_kAOBmuYiFrSSX7XV8mmPIMykNq5fHR0zEo_EL4BU
Message-ID: 
 <CAGwozwHNM2zQo95UC4mb0T2rq8mW-zbD132os_x-ZCqQooteRg@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: oxpec: Use the APEX charge registers on X2
 Mini Pro
To: Jeff Hagadorn <jeff@aletheia.io>
Cc: platform-driver-x86@vger.kernel.org,
	Derek John Clark <derekjohn.clark@gmail.com>,
	=?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <179508104844.519908.1268558325357674428@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

On Thu, 19 Nov 2026 at 00:47, Jeff Hagadorn <jeff@aletheia.io> wrote:
>
> Regarding the X2 Mini Pro charge limit and whether a BIOS update moved
> the registers: I retested on the newest BIOS and it's the same on both
> versions, as I was curious if it would make a difference.
>
> Hardware and firmware: X2 Mini Pro, kernel 7.3.4. Tested first on BIOS
> 0.22, then again today on BIOS 0.25 (10/28/2026, EC firmware 0.13).
>
> What the registers hold: with the stock oxpec, 0xA3 reads back
> whatever limit was written (62 on my install). The pack still charged
> to 96%. 0xE5 (the APEX limit register) read 100 on both BIOS versions.
>
> Method: I drained the pack to 88% first, because the EC doesn't start
> charging again until the pack is below 90%. Then I plugged in,
> confirmed it was charging at about 42 W on power_now, and changed one
> setting at a time.
>
> oxpec with the X2 Mini Pro entry switched to oxp_apex:
> - limit 85 =E2=86=92 0 W within 10 s; 100 =E2=86=92 back to 42 W;
> - inhibit-charge =E2=86=92 0 W within 20 s; auto =E2=86=92 back to 42 W.
> Stock oxpec (0xA3/0xA4):
> -  limit 85 for 40 s, then inhibit-charge for 30 s. It kept charging
> at about 42 W the whole time and went past the limit.
>
> So the EC on this board takes the APEX registers, per the patch I sent.
>
> As for nobody mentioning the failure, it is quiet:
>
> - the sysfs threshold reads back what you wrote;
> - KDE and UPower show it as the configured limit;
> - status reads "Charging" whether current flows or not.

Yeah, a user reported it indeed does not work. I had just missed it.
This is good to merge.

Thanks,
Antheas

> The only sign is a pack that ends up above its limit. With the 90%
> recharge rule on top, most people would never connect the two.
>
> On Wed, Nov 18, 2026 at 2:34=E2=80=AFPM Antheas Kapenekakis <lkml@antheas=
.dev> wrote:
> >
> > On Wed, 18 Nov 2026 at 16:09, Jeff Hagadorn <jeff@aletheia.io> wrote:
> > >
> > > Hello! It never worked.
> > >
> > > Changing the register made setting a charge limit function properly. =
The bios version was included for reference only to show that I tested on r=
eal hardware, and what my environment was at the time.
> >
> > Happens. I will ask around because no X2 Mini Pro user has reported
> > issues. It's a more popular device than Apex and I was pretty sure I
> > had feedback it worked properly before too. That's why I asked for
> > BIOS information.
> >
> > @Ilpo give it a few days before you merge it, if I don't come back to
> > it it should be good
> >
> > Other than that, commit description is a bit verbose but that is not
> > too much of an issue
> >
> > Reviewed-by: Antheas Kapenekakis <lkml@antheas.dev>
> >
> > Antheas
> >
> >
> > > On Wed, Nov 18, 2026 at 1:46=E2=80=AFAM Antheas Kapenekakis <lkml@ant=
heas.dev> wrote:
> > >>
> > >> On Wed, 18 Nov 2026 at 06:26, Jeff Hagadorn <jeff@aletheia.io> wrote=
:
> > >> >
> > >> > The OneXPlayer X2 Mini Pro was added as oxp_fly because it ships t=
he
> > >> > same system board as the OneXPlayer APEX, which was oxp_fly at the=
 time.
> > >> > Commit 0ccdf9a1381c ("platform/x86: oxpec: Fix Apex charge limit
> > >> > control") then gave the APEX its own board type, because its EC ke=
eps
> > >> > the charge limit and charge bypass at 0xE5/0xE6 rather than 0xA3/0=
xA4.
> > >> > The X2 Mini Pro's EC does the same: values written to 0xA3/0xA4 re=
ad
> > >> > back, but have no effect on charging, so the charge limit and
> > >> > charge_behaviour are not enforced.
> > >> >
> > >> > Tested on an X2 Mini Pro (BIOS 0.22) on AC power, at 88% charge wi=
th
> > >> > the battery charging at 42 W. With this change, setting
> > >> > charge_control_end_threshold to 85 stopped charging within 20 seco=
nds,
> > >> > and setting it back to 100 resumed it. Setting charge_behaviour to
> > >> > inhibit-charge stopped charging, and auto resumed it. Without this
> > >> > change, neither write affected the charge rate.
> > >> >
> > >> > Switch the X2 Mini Pro to oxp_apex, which applies the oxp_fly quir=
ks
> > >> > with the APEX charge registers.
> > >>
> > >> Hi Jeff,
> > >> implied in the Apex commit were BIOS versions. Apex is a device that
> > >> is a lot less popular than the X2 Mini Pro so I just replaced the
> > >> quirk because disambiguating bios
> > >>
> > >> I have not gotten any reports from X2 Mini Pro users about the batte=
ry
> > >> limit, I will ask around
> > >>
> > >> Did it never work for you or did you not test it before? Did it stop
> > >> working after a BIOS update?
> > >>
> > >> Best,
> > >> Antheas
> > >>
> > >> > Fixes: 1b3c0028dc06 ("platform/x86: oxpec: Add support for OneXPla=
yer X2 Mini Pro")
> > >> > Cc: stable@vger.kernel.org
> > >> > Signed-off-by: Jeff Hagadorn <jeff@aletheia.io>
> > >> > ---
> > >> >  drivers/platform/x86/oxpec.c | 2 +-
> > >> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >> >
> > >> > diff --git a/drivers/platform/x86/oxpec.c b/drivers/platform/x86/o=
xpec.c
> > >> > index c4c4bab..a7d21eb 100644
> > >> > --- a/drivers/platform/x86/oxpec.c
> > >> > +++ b/drivers/platform/x86/oxpec.c
> > >> > @@ -305,7 +305,7 @@ static const struct dmi_system_id dmi_table[] =
=3D {
> > >> >                         DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK")=
,
> > >> >                         DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYE=
R X2Mini PRO"),
> > >> >                 },
> > >> > -               .driver_data =3D (void *)oxp_fly,
> > >> > +               .driver_data =3D (void *)oxp_apex,
> > >> >         },
> > >> >         {},
> > >> >  };
> > >> > --
> > >> > 2.56.1
> > >> >
> > >> >
> > >>
> >
>


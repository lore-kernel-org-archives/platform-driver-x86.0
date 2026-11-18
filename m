Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.156.171.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795041255;
	b=ZfSkDAydsqLv2Gni87K4wr69rRC9zzw/1qexUh41/xQsAv41rXx/XTH3fNH1MUAMIwSV
	 lr45aPVjaI2NxwCm4+5uqGRFGR3cFfs16hcfv42QBMyCzUPAJrceiMHUoz8XaTAQS60/J
	 lgGaWPfze7LxbTPiXrIxt7GMUNOVvu+RbMdj4BR1CPpi0zwk3fVNUOzcAkfWK8HAMeGds
	 eLpQZ/eT5oUHnOzn8IulwoSu5GL6zpZxRmHK2EO8vgILxjFtvt5Q5x35LzDl5Q2faZ9Cj
	 C4qH1RM7QvEk+vg9fgW1Rjv0SLReMxoYADsOfl8XSoTQ+Alq/AQjdWvPYtrY1zwuVqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795041255;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Received-SPF:
	 Received:X-Gm-Message-State:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-PPP-Message-ID:X-PPP-Vhost:X-Virus-Scanned:X-Virus-Status;
	bh=Rc2CpwGBl3dAObStobp6zrPjja86gYDLAmsRZwbM4kk=;
	b=KVHmaONbkqyo1zaoxbRLCmde/VoktxkV/UhUGA5eXpw9Hjq4BCyHsBvCgGO0eB4SdCi9
	 WXIYkIl4rw3p9YSS0Xgh27LOKoL1tVzxaaCn/7srm/V3XBD61TJl2lvLfO1iH3625BN7n
	 HzP1m3yHsI0/04VXHe4rEo8uKRU/kSAj4/xX5y7+BappUS8oengLgvn5neU7KhnULBk2c
	 3e/WTuCs1X3G7WsiWEUMvXohM6yOYxO7SXOEj1XcAZbjN3SNWLh0664CEmRy4ovl/GGl0
	 3OAesBpnyGMvzknSdprcI6UDiDLe7vWsVNAhuAw0qMqVaWpLUrLHSaDKSAD4ayTNltA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=antheas.dev;
	spf=pass smtp.mailfrom=antheas.dev;
	dkim=pass header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=OJCWonNB;
	arc=none smtp.remote-ip=178.156.171.147
Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3871A606A31C
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 22:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3871A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=OJCWonNB
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id 6F45E5E4B4
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 00:34:07 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id 5A0AD5E582
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 00:34:06 +0200 (EET)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 1BDFD1FF89D
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 00:34:05 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1795041245;
	bh=Rc2CpwGBl3dAObStobp6zrPjja86gYDLAmsRZwbM4kk=;
	h=Received:From:Subject:To;
	b=OJCWonNBYkGbKIvvBKHZMiEdiUw/6Y28oulOtPZhrE3DMZeaQse+edQ+CoEgJv6w7
	 tXpLF3aZOddq+w2V6w6h2POIpzosRzR8rrfzOeSvdF6W7Kuo4NGtHWWkG3M8fqm4YY
	 ykeo4OZyanvnar6Y+bRlijDpExIxFPcxVYEmw4bHhyXDbogrUcgMa+W3i3D9coqFi9
	 xKXZ9drhtWIaju5UpZJwFTdlh16s/gXs36SE2WlIU9tVRBIMyvDVJFccbJrBf6z/M3
	 NGn0CrR63q9kd0cKDL9k0wSws/DeSFxkshgJtA2DKQVdFh95nUziu5q2gFqw91G+3M
	 +An58rJ2dlbSg==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.214.174) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pl1-f174.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2f020d0169eso917845ad.0
        for <platform-driver-x86@vger.kernel.org>;
 Wed, 18 Nov 2026 14:34:05 -0800 (PST)
X-Gm-Message-State: APuU4Z/cPufDFgMtNEp1Vlm4zVXkw+Mvdth5sTjT/AVj5Nvm7MIu4kB9
	RjIGJ1y5OsD6paNP6lzVldt/r5jJBZAKTfSdxYKLNC67CsD6Me5EMaWLVGkvWsLU+GkGwKNrDmX
	wFBGDfdOUXaRmQ+lC8h76QyQkP1e1X3s=
X-Received: by 2002:a17:902:fc84:b0:2ef:a639:8b2e with SMTP id
 d9443c01a7336-2eff7566becmr40487175ad.33.1795041243634; Wed, 18 Nov 2026
 14:34:03 -0800 (PST)
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
In-Reply-To: 
 <CAHc3qfEW-wq2-gGikxR-Bi_htrCyRbiOnXF_3C+WKPwJr=mecg@mail.gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Wed, 18 Nov 2026 23:33:52 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwFbvBa5Ea4uYa2FUa1YhPj5Ei9KsSAR_v_ingCT=43+xA@mail.gmail.com>
X-Gm-Features: AclHuK9KYD-ilYm75f9Nifx7_UyMeJtzyv075uzmeFKRszioPn8VMQhYdH0QUKU
Message-ID: 
 <CAGwozwFbvBa5Ea4uYa2FUa1YhPj5Ei9KsSAR_v_ingCT=43+xA@mail.gmail.com>
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
 <179504124540.3442409.7072367001879271363@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

On Wed, 18 Nov 2026 at 16:09, Jeff Hagadorn <jeff@aletheia.io> wrote:
>
> Hello! It never worked.
>
> Changing the register made setting a charge limit function properly. The =
bios version was included for reference only to show that I tested on real =
hardware, and what my environment was at the time.

Happens. I will ask around because no X2 Mini Pro user has reported
issues. It's a more popular device than Apex and I was pretty sure I
had feedback it worked properly before too. That's why I asked for
BIOS information.

@Ilpo give it a few days before you merge it, if I don't come back to
it it should be good

Other than that, commit description is a bit verbose but that is not
too much of an issue

Reviewed-by: Antheas Kapenekakis <lkml@antheas.dev>

Antheas


> On Wed, Nov 18, 2026 at 1:46=E2=80=AFAM Antheas Kapenekakis <lkml@antheas=
.dev> wrote:
>>
>> On Wed, 18 Nov 2026 at 06:26, Jeff Hagadorn <jeff@aletheia.io> wrote:
>> >
>> > The OneXPlayer X2 Mini Pro was added as oxp_fly because it ships the
>> > same system board as the OneXPlayer APEX, which was oxp_fly at the tim=
e.
>> > Commit 0ccdf9a1381c ("platform/x86: oxpec: Fix Apex charge limit
>> > control") then gave the APEX its own board type, because its EC keeps
>> > the charge limit and charge bypass at 0xE5/0xE6 rather than 0xA3/0xA4.
>> > The X2 Mini Pro's EC does the same: values written to 0xA3/0xA4 read
>> > back, but have no effect on charging, so the charge limit and
>> > charge_behaviour are not enforced.
>> >
>> > Tested on an X2 Mini Pro (BIOS 0.22) on AC power, at 88% charge with
>> > the battery charging at 42 W. With this change, setting
>> > charge_control_end_threshold to 85 stopped charging within 20 seconds,
>> > and setting it back to 100 resumed it. Setting charge_behaviour to
>> > inhibit-charge stopped charging, and auto resumed it. Without this
>> > change, neither write affected the charge rate.
>> >
>> > Switch the X2 Mini Pro to oxp_apex, which applies the oxp_fly quirks
>> > with the APEX charge registers.
>>
>> Hi Jeff,
>> implied in the Apex commit were BIOS versions. Apex is a device that
>> is a lot less popular than the X2 Mini Pro so I just replaced the
>> quirk because disambiguating bios
>>
>> I have not gotten any reports from X2 Mini Pro users about the battery
>> limit, I will ask around
>>
>> Did it never work for you or did you not test it before? Did it stop
>> working after a BIOS update?
>>
>> Best,
>> Antheas
>>
>> > Fixes: 1b3c0028dc06 ("platform/x86: oxpec: Add support for OneXPlayer =
X2 Mini Pro")
>> > Cc: stable@vger.kernel.org
>> > Signed-off-by: Jeff Hagadorn <jeff@aletheia.io>
>> > ---
>> >  drivers/platform/x86/oxpec.c | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/platform/x86/oxpec.c b/drivers/platform/x86/oxpec=
.c
>> > index c4c4bab..a7d21eb 100644
>> > --- a/drivers/platform/x86/oxpec.c
>> > +++ b/drivers/platform/x86/oxpec.c
>> > @@ -305,7 +305,7 @@ static const struct dmi_system_id dmi_table[] =3D =
{
>> >                         DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
>> >                         DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X2=
Mini PRO"),
>> >                 },
>> > -               .driver_data =3D (void *)oxp_fly,
>> > +               .driver_data =3D (void *)oxp_apex,
>> >         },
>> >         {},
>> >  };
>> > --
>> > 2.56.1
>> >
>> >
>>


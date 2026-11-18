Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795045632;
	b=1gce58uiCXhphsXxle0RlIZKsfN7qFfiT5Ea3iWcHbgioo8ndhs70HOl11Q968tpWcIT
	 Pw5Jhh2kfPt99mwlcdc2CYETyLnjtZA59mKgXVSqfzazuZ24Ky+QLj8tp53w46zF8TpQr
	 X517PkFmu/dHIMeugYMhH/DlHAxzOCJHel1nv9ee7AmAq/U1Ha8fYB19UFjMJra2uHDJA
	 veMMejHpEuPUo7dtbR6LeYoXs4weZs7r8MBRTDLTA+SI9qIS0NlBjMDu4tiMxT6zyjiku
	 uA2Dj70bwSE3PUnhFaX3o/lLGaV1wQt8lelFwaHI32SJUgmxPX8Vw3KW39YhuJYD4rQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795045632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BTuRP+1Zq6Zr8IcKlAPeLhsC/XO0ANQXmcCMoRuz0i4=;
	b=QRrjW8z1r87CSmCDz1ETUH4GaIPTI7AQTmibDqacadFhHKjZ1ybUehhG334FiosHXEId
	 OO08hqhcTI22hnCuMIeMxGypLKX/HrEFX6sKBePCLErjjYm/bOCY13f+3ekcdxHWham9i
	 pMIrg3n/n23TNrIqndnOOj8zj1Cl/iS7zUJxC9TpkhzB9RmhzjMKSCknAMPBd5whhBGvI
	 k6mC6rnzQxt1B/SHT+i6uvF6YF9Yb4jHmLVNjLwxEdv3qeQBtqcZmj+QxEUDeVBwD3jA3
	 Le7C3cvpnx/gyq5zzq+dJI/rB5cYA1V0fGyXauQ+ga/4Hx4+VzuhflLP6YEgAl0O3fQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aletheia.io;
	spf=pass smtp.mailfrom=digital-apathy.net;
	dkim=pass header.d=aletheia.io header.i=@aletheia.io header.a=rsa-sha256 header.s=google header.b=kXvfKswX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95550606A331
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 23:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95550606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aletheia.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digital-apathy.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=aletheia.io header.i=@aletheia.io header.a=rsa-sha256 header.s=google header.b=kXvfKswX
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b547d6c07bso2125733a12.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 15:47:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795045630; cv=none;
        d=google.com; s=arc-20260327;
        b=kDgo1WfZAA59wp650jpgak9h1pSpjTduP9GIMSrgAXTzdFZhApc1OM6cHb3lT2fR0z
         rfOdXn6nelbd7Y0GNW9dPS2rKNAGZH7waKp4R6Bc44l/hJ8WCbnCGki58ybG8UaMbA0V
         AR/wLKiMlK8IZHo0UvZhmBnHE0rSu4nEk2m/AYNNsNxMbSRPCReg5CKJNSDKSfv+50iE
         Jwb0nvGCc6J/fmik4pVVQbrFA7h+1PMsb6N6LjaL3uN68jgjfhkPfFFb7hkgPHeO0iFX
         bFjMobuQrgufj6rDjv0UNmoKPMop9Rpk4D0EwtUtqnAuhMwSyavXvWLs8gU8hEhf+cQm
         AX9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BTuRP+1Zq6Zr8IcKlAPeLhsC/XO0ANQXmcCMoRuz0i4=;
        fh=fy1x1EMKyDjt0nKk95nIotetFce+97BlJreELcJwzzg=;
        b=q+giC4pihiAEWJ04VjgOflTFV/8K6iiiGep8buWXmuygGSdflFBAEg4B7TUctMD+we
         XpBFsMPSoVNlnJgS+oocM56EPz6s89iiTL9LCldsDio4YxkHdQKnsK3p9K+nneplNm/x
         hTVXtISQ6RN4TNJdpbYjXhGyLL1InEk/sOaBpd3GPqmGVup0Os63uL+mYDldBr/QDwTn
         X+wQhIVrxPwGNaziyrzuSsMN4WnwCWj1skhpvCYc5C7X5hLd/d8ow+k6vs0OkejcuDdP
         fg9Pju8H/0KVRHaCs71C+ZTXIWmeGjymb5AZ0a49RMEBSGyyjN9jP672tPw/si4I+lTT
         pcRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aletheia.io; s=google; t=1795045630; x=1795650430; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BTuRP+1Zq6Zr8IcKlAPeLhsC/XO0ANQXmcCMoRuz0i4=;
        b=kXvfKswXOlFgwNlecHjzlkghn45y+iPsCW1jDHtxVFirs055hXJBWTrktQQfGvFEqN
         wfyBVkzx6gtuhzf3Aw9spS3BLwbj0FxYkl09gRCJyp7OxpAGodq18EuP3cYA1tIjiiro
         5zlBkZmlgpW89caoag1I6P8S5aV5MQTd6gIC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795045630; x=1795650430;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BTuRP+1Zq6Zr8IcKlAPeLhsC/XO0ANQXmcCMoRuz0i4=;
        b=WusmgxbZwc1cT9F5FcqFaLKqlMG8JQTu+hnyTs16WCwEo7u65FDiFVZ4wZtKg36+9b
         aA2Jyo9s81PVKEniFb+d96AaxHABX0YuufYU12/v5LExWBlIVw1WNXCX7XqjLhFZaZaV
         QETNIcq8ZEBZzIkY4zkxUETvfcS695vQPgcvkiF18p9p4VXAfMkmfSvTDnGgJLaq5Ru2
         cL/UI8rQ16NQ/Q3C5nGhYuJ1ooCJ6q3ZGvhp08i/I48YwbHkKxl44Y9lUC/GLLwCAyvR
         52CA4+2h4SC+zAjUO4iqpxWBIYypO4ZgnQ5S/zvS+F0QJnISHLRLVk7x0sIp8b48T6Jf
         /xmw==
X-Forwarded-Encrypted: i=1; AL+hErE74og8HQWyxHr/AfdMUvJNFxdKR50FNNV2ZBFTQD+MdU2jnhfcn63Y+yOXoFzn5WBEobTqIhzyG0MbwIPVB2iwbglK@vger.kernel.org
X-Gm-Message-State: APuU4Z/eOHdy+M8/QQRvt2vbjo+mZiQofQLmRGZyqu/hzSvb6qIRTVC2
	tbLQchy+GbaAFF9CDWz+kkgfyNYyPQlHHzmK16TF69BcmBi+LOGEDPdlssv6Jvqp3q1E88WNeyt
	MDa73vP8CcqUeOUVbPlimW26B/1BbRpMAW63kA/+ulg==
X-Gm-Gg: AYBFou15M2zlUU3zvnSzZc6PJTwhQ4eJuTgYlvL6QCBD8vwWlF8Ry5DBnj5IVu3zOvM
	HuIYIza0RquN1M7XHeOyg5nwuYjTpMMgH2pMQ32QpO5rsoh2fKZGwrZnU6cAF+A0IUa0370zpiX
	JZ8t5JuRFyXZZPMci5utwhaR1qm4ats5VZ0IzMdI84UVJ5MqVZAbUuxkhWcyOSIKXD0Rxdpr/m8
	F9mf8a1AEdLQLWEsU1M5NjRdPDEq/TRBTnPlP+bqqDyE5hB7KWYn3G8OCX1P93wIdBJlg0NdBgq
	+8mlnyufer1QYUAu4cWqicZdDi7LhCO8YTMai14QRzu2An4imz1/ydgSeaK5+pO/eKeu4gTJHMt
	A05OgwcDXS/AeLfbRPFnKB7+e5llLCm1rT+DA
X-Received: by 2002:a05:6402:2115:b0:6ba:1266:cd9c with SMTP id
 4fb4d7f45d1cf-6ba1266d034mr260318a12.8.1795045629295; Wed, 18 Nov 2026
 15:47:09 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118052557.143089-1-jeff@aletheia.io> <CAGwozwELhT8WFiPNQ_GxQBgE=iwh9ZoL1idb+b3vq9wMskG6Cg@mail.gmail.com>
 <CAHc3qfEW-wq2-gGikxR-Bi_htrCyRbiOnXF_3C+WKPwJr=mecg@mail.gmail.com> <CAGwozwFbvBa5Ea4uYa2FUa1YhPj5Ei9KsSAR_v_ingCT=43+xA@mail.gmail.com>
In-Reply-To: <CAGwozwFbvBa5Ea4uYa2FUa1YhPj5Ei9KsSAR_v_ingCT=43+xA@mail.gmail.com>
From: Jeff Hagadorn <jeff@aletheia.io>
Date: Wed, 18 Nov 2026 15:46:58 -0800
X-Gm-Features: AclHuK8giP0Ij5IHnjS3tIGd_k7990lmnkciP6flCeleh1Vyw92dCMCggMWpsGo
Message-ID: <CAHc3qfHM5O_DZSWH3wrNaG2rR8ku9UL12WUMFCUfAjKdqZSj-w@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: oxpec: Use the APEX charge registers on X2
 Mini Pro
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: Jeff Hagadorn <jeff@aletheia.io>, platform-driver-x86@vger.kernel.org, 
	Derek John Clark <derekjohn.clark@gmail.com>, 
	=?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Regarding the X2 Mini Pro charge limit and whether a BIOS update moved
the registers: I retested on the newest BIOS and it's the same on both
versions, as I was curious if it would make a difference.

Hardware and firmware: X2 Mini Pro, kernel 7.3.4. Tested first on BIOS
0.22, then again today on BIOS 0.25 (10/28/2026, EC firmware 0.13).

What the registers hold: with the stock oxpec, 0xA3 reads back
whatever limit was written (62 on my install). The pack still charged
to 96%. 0xE5 (the APEX limit register) read 100 on both BIOS versions.

Method: I drained the pack to 88% first, because the EC doesn't start
charging again until the pack is below 90%. Then I plugged in,
confirmed it was charging at about 42 W on power_now, and changed one
setting at a time.

oxpec with the X2 Mini Pro entry switched to oxp_apex:
- limit 85 =E2=86=92 0 W within 10 s; 100 =E2=86=92 back to 42 W;
- inhibit-charge =E2=86=92 0 W within 20 s; auto =E2=86=92 back to 42 W.
Stock oxpec (0xA3/0xA4):
-  limit 85 for 40 s, then inhibit-charge for 30 s. It kept charging
at about 42 W the whole time and went past the limit.

So the EC on this board takes the APEX registers, per the patch I sent.

As for nobody mentioning the failure, it is quiet:

- the sysfs threshold reads back what you wrote;
- KDE and UPower show it as the configured limit;
- status reads "Charging" whether current flows or not.

The only sign is a pack that ends up above its limit. With the 90%
recharge rule on top, most people would never connect the two.

On Wed, Nov 18, 2026 at 2:34=E2=80=AFPM Antheas Kapenekakis <lkml@antheas.d=
ev> wrote:
>
> On Wed, 18 Nov 2026 at 16:09, Jeff Hagadorn <jeff@aletheia.io> wrote:
> >
> > Hello! It never worked.
> >
> > Changing the register made setting a charge limit function properly. Th=
e bios version was included for reference only to show that I tested on rea=
l hardware, and what my environment was at the time.
>
> Happens. I will ask around because no X2 Mini Pro user has reported
> issues. It's a more popular device than Apex and I was pretty sure I
> had feedback it worked properly before too. That's why I asked for
> BIOS information.
>
> @Ilpo give it a few days before you merge it, if I don't come back to
> it it should be good
>
> Other than that, commit description is a bit verbose but that is not
> too much of an issue
>
> Reviewed-by: Antheas Kapenekakis <lkml@antheas.dev>
>
> Antheas
>
>
> > On Wed, Nov 18, 2026 at 1:46=E2=80=AFAM Antheas Kapenekakis <lkml@anthe=
as.dev> wrote:
> >>
> >> On Wed, 18 Nov 2026 at 06:26, Jeff Hagadorn <jeff@aletheia.io> wrote:
> >> >
> >> > The OneXPlayer X2 Mini Pro was added as oxp_fly because it ships the
> >> > same system board as the OneXPlayer APEX, which was oxp_fly at the t=
ime.
> >> > Commit 0ccdf9a1381c ("platform/x86: oxpec: Fix Apex charge limit
> >> > control") then gave the APEX its own board type, because its EC keep=
s
> >> > the charge limit and charge bypass at 0xE5/0xE6 rather than 0xA3/0xA=
4.
> >> > The X2 Mini Pro's EC does the same: values written to 0xA3/0xA4 read
> >> > back, but have no effect on charging, so the charge limit and
> >> > charge_behaviour are not enforced.
> >> >
> >> > Tested on an X2 Mini Pro (BIOS 0.22) on AC power, at 88% charge with
> >> > the battery charging at 42 W. With this change, setting
> >> > charge_control_end_threshold to 85 stopped charging within 20 second=
s,
> >> > and setting it back to 100 resumed it. Setting charge_behaviour to
> >> > inhibit-charge stopped charging, and auto resumed it. Without this
> >> > change, neither write affected the charge rate.
> >> >
> >> > Switch the X2 Mini Pro to oxp_apex, which applies the oxp_fly quirks
> >> > with the APEX charge registers.
> >>
> >> Hi Jeff,
> >> implied in the Apex commit were BIOS versions. Apex is a device that
> >> is a lot less popular than the X2 Mini Pro so I just replaced the
> >> quirk because disambiguating bios
> >>
> >> I have not gotten any reports from X2 Mini Pro users about the battery
> >> limit, I will ask around
> >>
> >> Did it never work for you or did you not test it before? Did it stop
> >> working after a BIOS update?
> >>
> >> Best,
> >> Antheas
> >>
> >> > Fixes: 1b3c0028dc06 ("platform/x86: oxpec: Add support for OneXPlaye=
r X2 Mini Pro")
> >> > Cc: stable@vger.kernel.org
> >> > Signed-off-by: Jeff Hagadorn <jeff@aletheia.io>
> >> > ---
> >> >  drivers/platform/x86/oxpec.c | 2 +-
> >> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >> >
> >> > diff --git a/drivers/platform/x86/oxpec.c b/drivers/platform/x86/oxp=
ec.c
> >> > index c4c4bab..a7d21eb 100644
> >> > --- a/drivers/platform/x86/oxpec.c
> >> > +++ b/drivers/platform/x86/oxpec.c
> >> > @@ -305,7 +305,7 @@ static const struct dmi_system_id dmi_table[] =
=3D {
> >> >                         DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> >> >                         DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER =
X2Mini PRO"),
> >> >                 },
> >> > -               .driver_data =3D (void *)oxp_fly,
> >> > +               .driver_data =3D (void *)oxp_apex,
> >> >         },
> >> >         {},
> >> >  };
> >> > --
> >> > 2.56.1
> >> >
> >> >
> >>
>

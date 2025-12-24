Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D06199920
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Dec 2025 23:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766619818; cv=none; b=QqjgcciQEVdMMDa5bs7SH7AwCYj5zhj8Lkn+iDMvcQrR0/bZLsAPPDiZAhQi9GpXBOgCS1x1hB3KzqlL1VW8BJAZ26Evnlqk7GpIZDbV1QCASwFH/JVrj6LgsP0wzLoLGgoLrwcn0OeJQzVhC/uafK/szv2eLY7VgqPQ4VggvL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766619818; c=relaxed/simple;
	bh=QAaSO/UcHKq5gD6bZtPiFTkODw5chg/U2lHrJPbARo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rD8Tsu1u1TrhjXg7UdNBvjCJSL3J8wrO+QbgRifldx0x8G3J7yOd549wblh0sgswLY2XmRgNtedMnx2SWglYm0CrOYv9zcQio4mhy4+jLyMXKFOjwp/jF+D3oTdNsjBdnCApDTUwjeHNxgLu3o0FNgFz1/dVBChhOZZGEq67T4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lu/OAba3; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lu/OAba3"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-64d0d41404cso6230494a12.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Dec 2025 15:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766619815; x=1767224615; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZVHrRNJ5OMPZvv1SOMmZnryYCT79VwPb7UryFDPikI=;
        b=Lu/OAba3OXcoTi3StGJsjKm/DYQ1ngvvWz76esL6MEvh4xjAKCEraQuJSdKaYRUuAS
         +b6F6XuU9i/nUNlDF8HyqhMrgDyK5ve/PTEJIkRQ0gHwfT65PNvsBc8FVprldJ5S3224
         VxnCDVCikNjmaH5Ybq5xIVpU73wpEV3pVE/h2Sez4Uc4mj6WEzM7A3pQAM0TCQ7EKfzH
         rU/NBxe8jTGefGVMByMEYqsayD4Ex2q7NLmY9P3vpxP9+ovLWPELDG4pZ7AWZVA/211h
         GbkxmQ3lN1B9u0RYwCDORiHUlDRp+iNgjNIGxuK7RhT1qOKdIQ4cWYGj+pbpqsfvd54q
         3Jdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766619815; x=1767224615;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FZVHrRNJ5OMPZvv1SOMmZnryYCT79VwPb7UryFDPikI=;
        b=EvWf2Q7Y3lJgmY3yHsCm42Ga8CJJmNDrQ2aiNC2/XAmJe7byrMCPOFhY68jwOMjhUV
         b+ohLXPz3glTr6GGsBcHxHcimQr+imp21miobM8mMEdaGO/w3vQbo0j12ZNMsU+/AdBC
         Q7IvpjEWWldwT8sJ/kRQovPze5z0xeVcFYRQHyottiY2AA+dD2+No+cpjh5TPTSPqYlC
         vbpPrPSGtg142pQMXFzResoTQuFlhO9jEaDheQMMfC7GLUtsmy9Z7zw6psmO8orx9HQ2
         ZItKF+LieG0f3MUuv9cWJxW/kuH6EbeDgKM2gLwmjI9G1YFYFEqzm6oPr1y7PsyvH4ix
         F3JA==
X-Forwarded-Encrypted: i=1; AJvYcCXAtzbwsuOecALo7qCaYrBppncI4tf7UCM8RbynG5oHfRDys0SFHtgTb0F50OQJy/iKkCdsJueeu+bL4GsvYooWBYe1@vger.kernel.org
X-Gm-Message-State: AOJu0Yxux6Ja9ah7ar2ABcM5a8+a1vdqIJ/1w4nlzszWJAyvf1Dg2feQ
	sTTuZEMxjaaL/UukdXWPWXv3XPhiegrkKnp8Z9ADzRc5SFrOMi6qHA5nQwhPWp1GH29dLmHo6G8
	r1MkngSJ/b7THOqc0oFa1RQsX67rNvPqHsQ==
X-Gm-Gg: AY/fxX5SNLZgJ2z4BPKH28Wk4pjVstdhbIW6BO5FRlWJQB5HsZNt/llMXpYiTRUd/Vv
	iPz7HwHILsBAvrXvoG3X+z4xtw2FuNc4UkG86fQ1Xq+MpAU5boX3X3qHIhmAiFrMhHHRucp3y5u
	zdZ0Dx8poLCq4QoKZYfVQIac2xOShkMTkT/up5yzJchORvIxT1PlwYxYbgVrHaU1Ol/7bHowykj
	KqBuRPd6Pk9r7m8sVXqQDA4N1Jlu+NlrpQM8+HKz/goVdSEaZVEiJzT1QpYYHNxNQ4Ew/IEcSSJ
	DGPP9I1WD4v4AbuMh/yeiqnZAA==
X-Google-Smtp-Source: AGHT+IGm9xQwpG4iH+fmv6Sq3cC2vZW9br+qLpJORj6KYAqkvy7CxGcd9ngDOkWFvVxsMNLOUaqEtYuYVpUQrkoURyU=
X-Received: by 2002:a05:6402:146c:b0:64b:6dfc:dd34 with SMTP id
 4fb4d7f45d1cf-64b8e3a95a6mr21076823a12.0.1766619814855; Wed, 24 Dec 2025
 15:43:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251221210218.12274-1-timwassink.dev@gmail.com>
 <b02a7c96-9653-4ab2-ac4a-86d365af1a2d@gmail.com> <CAD4HHcVKCL-9CV5kWH_6oz0jmh=+eXP-xU7cm2FvAHHucrPF7w@mail.gmail.com>
 <74f1a53d-3556-4e67-8dc2-2a86d6c52365@gmail.com>
In-Reply-To: <74f1a53d-3556-4e67-8dc2-2a86d6c52365@gmail.com>
From: Tim Wassink <timwassink.dev@gmail.com>
Date: Thu, 25 Dec 2025 00:43:25 +0100
X-Gm-Features: AQt7F2rEoXRQSxz3ucGF9twt8G7kEsLlu7J9v13lf0TGGFHKO7Wr20c2f_pIqmU
Message-ID: <CAD4HHcXvyC+xFGZ+PgFRv3F+tYwsfp6cxDh9ZOpquZOg29VOBQ@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: asus-nb-wmi: add quirk_asus_ignore_fan for UX3405MA
To: Denis Benato <benato.denis96@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones" <luke@ljones.dev>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

yes the only problem is the error in dmesg, the rest seems to work.

On Tue, Dec 23, 2025 at 2:50=E2=80=AFPM Denis Benato <benato.denis96@gmail.=
com> wrote:
>
>
> On 12/22/25 11:44, Tim Wassink wrote:
> > On Sun, Dec 21, 2025 at 10:01 PM Denis Benato <denis.benato@somemail.co=
m> wrote:
> >> On 12/21/25 22:01, Tim Wassink wrote:
> >>> The ASUS Zenbook 14 (UX3405MA) uses a newer WMI interface for thermal
> >>> management that does not support the legacy WMI fan control methods.
> >>> Currently, this results in ENODEV (-19) errors in dmesg when the driv=
er
> >>> attempts to fetch factory fan curve defaults.
> >>>
> >>> Add a quirk to use quirk_asus_ignore_fan to silence these errors and
> >>> signal that legacy fan control is intentionally unsupported, as therm=
al
> >>> policies are handled through the platform_profile interface.
> >> It is my understanding that this patch suppresses the error,
> >> while maintaining the current behavior in every other aspect,
> >> correct?
> > I am actually not sure anymore if this patch is ok, as it introduces a
> > trade-off regarding telemetry.
> >
> > While the patch successfully silences the ENODEV (-19) errors, I have
> > verified locally that it also inhibits the registration of the fan
> > telemetry in hwmon. This means the read-only 'fan1_input' (RPM) is no
> > longer available to the user.
> >
> > I initially followed the precedent of commit 82cc5c6c624c ("platform/x8=
6:
> > asus-wmi: Ignore fan on E410MA"), which can be found here:
> > https://lore.kernel.org/all/20221221-asus-fan-v1-2-e07f3949725b@weisssc=
huh.net/
> >
> > Now I realize that case was specifically for a fanless system. The
> > UX3405MA does have a physical fan
> > which remains functional via the platform_profile (AIPT) interface
> > after this patch, as confirmed by stress testing.
> >
> > I thought this quirk was the standard way to handle it, but I am not
> > so sure anymore.
> Hi,
>
> I think what's happening is that asus-nb-wmi is binding multiple devices:=
 for those
> that are unsupported the driver returns -ENODEV and the kernel, as a resu=
lt,
> probes successive drivers for those devices that can't be bound.
>
> It's very likely that using that quirk prevents asus-nb-wmi to bind all d=
evices,
> and this can very well result in what you are seeing...
>
> The only runtime problem is that an error appears in dmesg, right? The re=
st is
> working from what I can understand from your messages.
> > Best regards,
> > Tim
> >
> > On Mon, Dec 22, 2025 at 3:54=E2=80=AFAM Denis Benato <benato.denis96@gm=
ail.com> wrote:
> >>
> >> On 12/21/25 22:01, Tim Wassink wrote:
> >>> The ASUS Zenbook 14 (UX3405MA) uses a newer WMI interface for thermal
> >>> management that does not support the legacy WMI fan control methods.
> >>> Currently, this results in ENODEV (-19) errors in dmesg when the driv=
er
> >>> attempts to fetch factory fan curve defaults.
> >>>
> >>> Add a quirk to use quirk_asus_ignore_fan to silence these errors and
> >>> signal that legacy fan control is intentionally unsupported, as therm=
al
> >>> policies are handled through the platform_profile interface.
> >> It is my understanding that this patch suppresses the error,
> >> while maintaining the current behavior in every other aspect,
> >> correct?
> >>> Signed-off-by: Tim Wassink <timwassink.dev@gmail.com>
> >>> ---
> >>>  drivers/platform/x86/asus-nb-wmi.c | 9 +++++++++
> >>>  1 file changed, 9 insertions(+)
> >>>
> >>> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x8=
6/asus-nb-wmi.c
> >>> index 6a62bc5b02fd..eaa8abe506cb 100644
> >>> --- a/drivers/platform/x86/asus-nb-wmi.c
> >>> +++ b/drivers/platform/x86/asus-nb-wmi.c
> >>> @@ -544,6 +544,15 @@ static const struct dmi_system_id asus_quirks[] =
=3D {
> >>>               },
> >>>               .driver_data =3D &quirk_asus_zenbook_duo_kbd,
> >>>       },
> >>> +     {
> >>> +             .callback =3D dmi_matched,
> >>> +             .ident =3D "ASUS Zenbook 14 UX3405MA",
> >>> +             .matches =3D {
> >>> +                     DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC=
."),
> >>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "UX3405MA"),
> >>> +             },
> >>> +             .driver_data =3D &quirk_asus_ignore_fan,
> >>> +     },
> >>>       {
> >>>               .callback =3D dmi_matched,
> >>>               .ident =3D "ASUS ROG Z13",

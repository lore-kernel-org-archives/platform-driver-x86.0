Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C975464F
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Oct 2025 10:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760610256; cv=none; b=SnjKRZhbBIBeEqQhdz62HEv1VngOGDzUkhS8m51+I854LGuZ3iYLk3MZ8HbqCzHjV/cEd2Hle8pWVo2MoeFZ2x06IjFZYlSGbxiNtEbvoVfqNEtspbzglrpY965u6hoXwvDGkvD9MCgJOOEebcKeyuqWcECVwD+tEGufI34HaZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760610256; c=relaxed/simple;
	bh=qp+KeUy96QuR5ckUkOoqptYM3jA5RP4mf69cvLhzuUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tbIe99l20nT4RKXshtK3qDWBCfDodTiqIzglfunqMqIpBrVnNoDxNB6bx8ceCKJOKQfxK7v9HJ3VXqvDpYCH+YgdYDJYa+ItUXhPMEB5u0PF4MVT5+FckslZQdtlR0pHdTieS3SaWZhPOl1JIpY8zOlWVtoR50AGLqW6dpqXSsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=BiyKyfJa; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="BiyKyfJa"
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id 2DA315E52F
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Oct 2025 13:24:06 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id AEDC45DF1B
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Oct 2025 13:24:04 +0300 (EEST)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id A28A21FF782
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Oct 2025 13:24:02 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1760610243;
	bh=gV/v90xa2SLKdmP/pBZ8wq4Q7F0yp1HfJIwXljec+TI=;
	h=Received:From:Subject:To;
	b=BiyKyfJadssB+wq8uUKFVh9mrIDXjMY16tejU8OqHX03uddB2TpEOCGuclfG+CO4R
	 sStLyMUr5/pzde1MxEaxkCVme2HDpa1ckQXIjHWI8TaSa98knX70pywVRoj+CWoZ+o
	 qPDxjYy2MgOJTq8QGs2AUP6aVvVPAdV2iRty4+wE13m14+VUAxB7NRF5Vf6lvnxhdF
	 /dkUF8V6npKj4IvPQhlGvnFvTOAeehJrBc+3ADJ77fUzuApYqUlNmlXjT4s1V1k7ke
	 YPu5Gc7LNPB/suom4sFfYEVmZqyfE2lFjAgDNEdLaw8MzIQNnZ9aGROwP6ilxXdtt1
	 QjmLjQoagrKow==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.176) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f176.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-367874aeeacso5014021fa.1
        for <platform-driver-x86@vger.kernel.org>;
 Thu, 16 Oct 2025 03:24:02 -0700 (PDT)
X-Gm-Message-State: AOJu0YwBb/b4dP9mHoHxHyiy50EvoHxiS3JuBSAJjbocUbiQK8fd0jUV
	J3LkNGvW2hROd99FyB5yZsJYrW70C0cIguHj6fL7bvpptDxPs6inHLEPrrzxlvsP+9AK3J7S269
	TWBdkIH5HdSCPS/Sp1vorBxzMoZDtDSE=
X-Google-Smtp-Source: 
 AGHT+IH5R/hNpzYEzewPipSZJMkHM5BoUT9HVwv+Z4NmQpb8O+7YzOMwKwR3vaNGi5bMleyf6xqrVpsn/dsjmevG4UM=
X-Received: by 2002:a2e:bccc:0:b0:36b:693d:1244 with SMTP id
 38308e7fff4ca-37609ef126bmr84862431fa.30.1760610241765; Thu, 16 Oct 2025
 03:24:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013201535.6737-1-lkml@antheas.dev>
 <20251013201535.6737-4-lkml@antheas.dev>
 <cf0ca840-6e0d-2d99-cb23-eabf0ac5263b@linux.intel.com>
 <CAGwozwFBQ4DWS5s-La5f-6H=ZQvQFjU3=7U2RiJStGxO1sM+bQ@mail.gmail.com>
 <cf824f48-58b4-2400-9acf-796bb76d6b28@linux.intel.com>
In-Reply-To: <cf824f48-58b4-2400-9acf-796bb76d6b28@linux.intel.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Thu, 16 Oct 2025 12:23:50 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwEo+Mx8fv_ohQQ9Ha6p=bJcJmfj==aRGcgoqQXzXEZmVw@mail.gmail.com>
X-Gm-Features: AS18NWBuPZc56lDSGKACDIJ6VO20ByZypxxronk974sOSAippwxgCHKH754emac
Message-ID: 
 <CAGwozwEo+Mx8fv_ohQQ9Ha6p=bJcJmfj==aRGcgoqQXzXEZmVw@mail.gmail.com>
Subject: Re: [PATCH v6 3/7] platform/x86: asus-wmi: Add support for multiple
 kbd RGB handlers
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>,
	Denis Benato <benato.denis96@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <176061024328.2757625.6516085448003870331@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Thu, 16 Oct 2025 at 12:19, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Wed, 15 Oct 2025, Antheas Kapenekakis wrote:
>
> > On Wed, 15 Oct 2025 at 13:59, Ilpo J=C3=A4rvinen
> > <ilpo.jarvinen@linux.intel.com> wrote:
> > >
> > > On Mon, 13 Oct 2025, Antheas Kapenekakis wrote:
> > >
> > > > Some devices, such as the Z13 have multiple AURA devices connected
> > > > to them by USB. In addition, they might have a WMI interface for
> > > > RGB. In Windows, Armoury Crate exposes a unified brightness slider
> > > > for all of them, with 3 brightness levels.
> > > >
> > > > Therefore, to be synergistic in Linux, and support existing tooling
> > > > such as UPower, allow adding listeners to the RGB device of the WMI
> > > > interface. If WMI does not exist, lazy initialize the interface.
> > > >
> > > > Reviewed-by: Luke D. Jones <luke@ljones.dev>
> > > > Tested-by: Luke D. Jones <luke@ljones.dev>
> > > > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > > > ---
> > > >  drivers/platform/x86/asus-wmi.c            | 118 +++++++++++++++++=
+---
> > > >  include/linux/platform_data/x86/asus-wmi.h |  16 +++
> > > >  2 files changed, 121 insertions(+), 13 deletions(-)
> > > >
> > > > diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86=
/asus-wmi.c
> > > > index e72a2b5d158e..a2a7cd61fd59 100644
> > > > --- a/drivers/platform/x86/asus-wmi.c
> > > > +++ b/drivers/platform/x86/asus-wmi.c
> > > > @@ -258,6 +258,8 @@ struct asus_wmi {
> > > >       int tpd_led_wk;
> > > >       struct led_classdev kbd_led;
> > > >       int kbd_led_wk;
> > > > +     bool kbd_led_avail;
> > > > +     bool kbd_led_registered;
> > > >       struct led_classdev lightbar_led;
> > > >       int lightbar_led_wk;
> > > >       struct led_classdev micmute_led;
> > > > @@ -1530,6 +1532,53 @@ static void asus_wmi_battery_exit(struct asu=
s_wmi *asus)
> > > >
> > > >  /* LEDs **********************************************************=
*************/
> > > >
> > > > +struct asus_hid_ref {
> > > > +     struct list_head listeners;
> > > > +     struct asus_wmi *asus;
> > > > +     spinlock_t lock;
> > >
> > > Please always document what a lock protects.
> > >
> > > I started wonder why it needs to be spinlock?
> > >
> > > It would seem rwsem is more natural for it as write is only needed at
> > > probe/remove time (if there's no good reason for using a spinlock).
> > >
> > > You're also missing include.
> >
> > I went through the comments. Thanks. The reason that it is a spinlock
> > is that both hid-asus and asus-wmi interact with the primitives to
> > register and unregister listeners, either of which can prompt the
> > creation of the led device which has to be atomic. And they do so from
> > IRQs too.
>
> Please note in the changelog how it can happen from IRQs as I tried but
> couldn't find anything. Admittedly, I didn't try to follow the callchains
> that deeply. The justification should be clear enough to anyone who
> looks this commit later so better have it in the changelog.

The initial versions used a mutex, and we found kernel hangs under
IRQs, so it was converted to a spinlock. I will try to reword.
Specifically, I think the errors came when holding the lock when
changing brightness.

I recall one of them was brightness hotkey (second to last patch)
triggers an IRQ -> event goes to asus-wmi -> calls brightness handler
-> tries to hold lock -> crashes. Lock needs to be held because
hid-asus can choose to unregister a listener.


> > Perhaps the driver could be refactored to use rwsem, I am not sure.
>
> Just leave it spinlock.
>
> > The fixed version can be found here[1]. I will give it 1-2 more days
> > in case someone else wants to chime in and resend.
>
>
>
> --
>  i.


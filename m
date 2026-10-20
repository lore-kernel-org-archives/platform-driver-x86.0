Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=88.99.38.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792533199;
	b=nqhJOLXpc8s1EgLm7IHe6Ms6vp33f4Fz49WWVWs2eoKDWMCTl3LCpdbdlPJsXDmNFndx
	 z7LUgwFrdVRXM4rg5fpvyffu1pw8Mrxc8aTnXcDOHYoslIaFmwsGo1zLDIBVf2IZ/zB9y
	 t1ndx+b6b+Jo9ZhYPYwhiOAGfp0WnOwAZVfF/ULqRn2B2J1qCXNCmJNyT2mlKI4QOhoxK
	 wk71ANGlPpnb/ddIIXtGV78H9+I8mfrruw0XRTXeEFzBA8/eH+0q5/SnCsl1ZLpsqrrc1
	 PJjjyi2BvjZPM8fR7Zi42n7JTUDcXcuxpOGrpq9BONBhRH2l93oIGSE4zV/v9XBvr0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792533199;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Received-SPF:
	 Received:X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding:X-PPP-Message-ID:X-PPP-Vhost:
	 X-Virus-Scanned:X-Virus-Status;
	bh=Q36YX3yioX5PhNiWAlX2IMcnnOhUaYruhBYCSPIOZgE=;
	b=Sc35EjPP5L6YEaMNxPfnegdGYJo1BBbPl/GEkA53yYoNd1NzhxLZmJON1p2OSGNOVxIk
	 0XLtibGXg2j5Y4LPttHl6iPJS9vpK2BmIKN/pW5sS3AtXnzohZ/Cmc3fj/xW43o/RrImg
	 pWe7Zt1rr2w6GlzWZXBnb0Pt7LVZUZgP5SeB5wEKKVBloIwGETwXfBfuB29jyodEnBKXn
	 XL/ClhyWeZ9a6JCAJaH8/bfiMIseJxNSWUBeNOy/Pr9/pZVPMduksqtnMTQykm8oKKxvh
	 8SicXNTQiswBtWkNSFRmZ577gad3VUUGoIun3KnzfsxqlLRS3tUVMKn//O0pNWzsvNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=antheas.dev;
	spf=pass smtp.mailfrom=antheas.dev;
	dkim=pass header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b="XLEr/SCx";
	arc=none smtp.remote-ip=88.99.38.195
Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E11A606A31A
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 21:53:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E11A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=XLEr/SCx
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id F2BABBE1A3
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Oct 2026 00:53:08 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id 653E1BDFAC
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Oct 2026 00:53:08 +0300 (EEST)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 757751FF9F2
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Oct 2026 00:53:07 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1792533187;
	bh=Q36YX3yioX5PhNiWAlX2IMcnnOhUaYruhBYCSPIOZgE=;
	h=Received:From:Subject:To;
	b=XLEr/SCxE/h0PaZxOMWrixylSk7mP3yMFq1mSDmbQlXNPUieDSSJ0HhkER2gFRWkV
	 bkAO3Tpk93U4fGzIAOLFM4keZAgbanVuhXJEQDz68OWv0HlsDrmP7NCwVHvOmUlO9W
	 5scy1C1Zp4BH/VOt0tX0UHmp7eVka8QC56b4kc6Myr2MjE/n3Okna9lAobePxRn+3E
	 7D5qbE2QPu10owEFAecyt8JK6w+lok0tlS7GC7z4+OOeOOBachfIrG7mUCTRXk2D6l
	 q+XFxl1/p5aKXPL9YsBfsbSRhthSj8h+TvjwjSuoegkuEi2CpMLRtg15wsXwuI/5Sl
	 MlfpoQH7NtQUg==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.214.176) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pl1-f176.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2e987b4a710so5947435ad.1
        for <platform-driver-x86@vger.kernel.org>;
 Tue, 20 Oct 2026 14:53:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBzwaZCXj3TW9lhCztsff4yADSShAWS+KlbbhTFbcMClsOQez8FRw3xh4RoOmUWUF9kaRPvryEBflO/s8Z6E+fVOBICK@vger.kernel.org
X-Gm-Message-State: AFq9FYI5lB87wt/s+YEAnTrewB/5tv2CWe+i6cd5fXtqAA2PI6i3u61N
	DsbizRdhdhArlQaIkSPz9NAo1lxZ1cMxF92m7jBovbCZjilgPuXuCC5l6yT6JLzJaSOsqdHAMhm
	AD9YVZ34DVD4fjclKDoNjU+c4RujCQts=
X-Received: by 2002:a17:902:e548:b0:2e9:4f49:111c with SMTP id
 d9443c01a7336-2ea1dd04761mr22807325ad.27.1792533185889; Tue, 20 Oct 2026
 14:53:05 -0700 (PDT)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20250511204427.327558-1-lkml@antheas.dev>
 <20260803221614.59324-1-derekjohn.clark@gmail.com>
 <20260803221614.59324-2-derekjohn.clark@gmail.com>
 <f8b2c85a-2800-c9a3-4e56-7af4c53823e5@linux.intel.com>
 <58a9c644-98c2-47ee-b083-0d5b19fa5053@roeck-us.net>
 <CAGwozwGdwhE6Sm6oa2uxx_sHfFNQ6fHYnAhYHkEPQcp_Yb=Z6w@mail.gmail.com>
In-Reply-To: 
 <CAGwozwGdwhE6Sm6oa2uxx_sHfFNQ6fHYnAhYHkEPQcp_Yb=Z6w@mail.gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Tue, 20 Oct 2026 23:52:53 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwFUTagam+dr0SXyziAMz1MJKcYMYUgrogFcmvEaE1X0UQ@mail.gmail.com>
X-Gm-Features: AclHuK9jLmnj5XD9NNmx0ULw93cvry9tRRHsfv7i6vb3Lkle29Ysvo4RB4szGUU
Message-ID: 
 <CAGwozwFUTagam+dr0SXyziAMz1MJKcYMYUgrogFcmvEaE1X0UQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] platform/x86: msi-wmi-platform: Move guard out of
 switch in platform_write()
To: Guenter Roeck <linux@roeck-us.net>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>, W_Armin@gmx.de, corbet@lwn.net,
	jdelvare@suse.com, kuurtb@gmail.com, linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <179253318781.1186819.16566335289821031206@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

On Tue, 18 Aug 2026 at 17:26, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>
> On Tue, 18 Aug 2026 at 16:42, Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > On 8/18/26 07:12, Ilpo J=C3=A4rvinen wrote:
> > > On Mon, 3 Aug 2026, Derek J. Clark wrote:
> > >
> > >> The ML patch set uses a guard within a switch case that violates cle=
anup
> > >> rules. Move the guard outside the switch so all return paths are cov=
ered.
> > >>
> > >> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > >> ---
> > >>   drivers/platform/x86/msi-wmi-platform.c | 2 +-
> > >>   1 file changed, 1 insertion(+), 1 deletion(-)
> > >>
> > >> diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platf=
orm/x86/msi-wmi-platform.c
> > >> index dfb65ac8fbf6..33acd448f674 100644
> > >> --- a/drivers/platform/x86/msi-wmi-platform.c
> > >> +++ b/drivers/platform/x86/msi-wmi-platform.c
> > >> @@ -675,11 +675,11 @@ static int msi_wmi_platform_write(struct devic=
e *dev, enum hwmon_sensor_types ty
> > >>      u8 buffer[32] =3D { };
> > >>      int ret;
> > >>
> > >> +    guard(mutex)(&data->wmi_lock);
> > >>      switch (type) {
> > >>      case hwmon_pwm:
> > >>              switch (attr) {
> > >>              case hwmon_pwm_enable:
> > >> -                    guard(mutex)(&data->wmi_lock);
> > >
> > > While I cannot see the code easily, one could also add braces to insi=
de
> > > the case to avoid this problem.
> > >
> >
> > I don't see the code either, but wouldn't this be a use case for
> > scoped_guard() ?
>
> Hi, not explicitly stated in the cover letter, but this is essentially
> a series on top of the series I sent last year but I did not clean up
> due to a variety of issues with MSI firmware that would have made the
> driver unsuitable for upstreaming (to my standards at least). These
> issues span Intel driver problems, HID controller instability, and
> varying WMI implementations esp. in regards to PLx setting between AMD
> / Intel variants, shift mode behavior not acting correctly, and fan
> curve application / resetting being weird (the fan curve on off bit
> does not seem to change whether an automatic curve is used but how
> close the device alings to the set curve? requiring us to back up and
> restore the original curve? half of the devices keep the curve during
> sleep and half don't? but if the fan curve is so finicky do we really
> want a resume handler for it? Perhaps we can kick the timing quirks to
> userspace)
>
> For this reason, I focused on other manufacturers such as Ayaneo and
> OneXPlayer. I will revisit this series per request from Derek as he
> seems to want this for steamos and hid-msi is already queued for 7.3?
> Although, to be honest, compared to the controller firmware issues,
> the WMI implementation is pristine.
>
> So I will need to go through these issues 1 by 1 and see which can be
> fixed and either drop certain features in the beginning.
>
> Particularly for the fan curves, if we say that resume handlers are
> required to be in the kernel moving forward, I do not know how
> realistic it is to make those reliable for this WMI device family.

This driver still needs work. I am getting bug reports about
inconsistent TDP application on the EX. A8 is broken as well. Even
with your patches Derek. I need to grab a new version of center M and
see what they are doing.

Does this driver work in your experience? What is that SMT toggle you added

Antheas

> Best,
> Antheas
>
>
> > Guenter
> >
> > >>
> > >>                      buffer[0] =3D MSI_PLATFORM_AP_SUBFEATURE_FAN_MO=
DE;
> > >>                      ret =3D msi_wmi_platform_query_unlocked(
> > >>
> > >
> >
> >


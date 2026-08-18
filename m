Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7D633B6DA
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Aug 2026 15:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.27.248.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787067204; cv=none; b=OoKDZB7AmoqvWRDq+2cEFqeuuB3FCUflBjaqzg1SQZNbVGB+SDKIb478sMZKZhT81VlAUKyvX1kFdmGT/GMpoAQ86nv8yQShgXEDtADQwPONI3qFgE/KgeXM0B1QLRcf5LiuB0RaYjxaN/srvmAE+cpxycBdY/uDrvo0JpYD3S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787067204; c=relaxed/simple;
	bh=6HnqJVNnO8fbVCbtUOQtItNQMwwlBtU8Xk8AKwaY/R8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XGoSK6Zhy04KZcwAuC867DOrMTNnjSSpQugwLvEsouQ1X6WomF77QQhtidQ1LwISeB8d8Z3Qsf6FjbAl2mlS0A3888NHEhE8rX9XxmXqgjJltL+4VutqkRsSWYV7NuyPJuxhyZN4wyb6pl6pir/lUdCK1ILDyucnjerEMBvRB0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=ijgd7z9U; arc=none smtp.client-ip=37.27.248.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="ijgd7z9U"
Received: from relay10 (localhost.localdomain [127.0.0.1])
	by relay10.grserver.gr (Proxmox) with ESMTP id 9E17442555
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Aug 2026 18:26:44 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay10.grserver.gr (Proxmox) with ESMTPS id CF8BF3FE33
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Aug 2026 18:26:43 +0300 (EEST)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id D9A761FFA25
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Aug 2026 18:26:42 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1787066803;
	bh=aOuj/+W84x2+rIHLSDGB0H4BsSYWB02IXh4muXkVl4o=;
	h=Received:From:Subject:To;
	b=ijgd7z9U21VqKkWODPgYS4GoHlMixX6HP32JjXmWfYl34TQodpCur+G3PlLKJP33h
	 sBQ1m+HvL19bpct1sbOjouEf3XGa6FcV3XKZhJDWKw2i0cSksvSUiktdSSqe/zxYTr
	 oIKY/+rRHJjjYvbkGLJe6e/0/zfJbI2k7wnW8q1PwcxegSoLcDqxmKSNafk7W2kGnd
	 acg8sEt8sRaOV1nauC9A5ubF6QBbc6ozlox+nCrmcJoIsWCsgNr+sEP1xh7zywj1sG
	 Vx7rL7YZp5zYRJaf7aA62of+EpihZWwv+rklPPcrgfIXD6ruzBVaUAf9IMqEamQeZY
	 1W8L+gU2FAqMA==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.215.169) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pg1-f169.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-c9e7391839cso4662470a12.0
        for <platform-driver-x86@vger.kernel.org>;
 Tue, 18 Aug 2026 08:26:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AHgh+RqiCeHexA7U5xxDbaQEj846It2u2qDr0CIFs40qQN4AbDy1gwozkW3kWGM4RwtcQgnTsq7JKCskz269FJ4be47k1Cyk@vger.kernel.org
X-Gm-Message-State: AOJu0YzGKbtT3cudqiJXQLQmjR63gaXF+hVy92CGOed+518c+Q06Wb9T
	jrXJLWpHTb575mYI4CRTFmJ1JeOksO3IP/Ww1y5gOIcjA52w8loIl/YJKRdpBcXGCSO/VHFhrrf
	fKfvOOio2qSMsBttbSiF6HTaEQUhwiuQ=
X-Received: by 2002:a05:6a21:2d4b:b0:3b2:a809:ffe with SMTP id
 adf61e73a8af0-3cc71a2d522mr45452060637.14.1787066801283; Tue, 18 Aug 2026
 08:26:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250511204427.327558-1-lkml@antheas.dev>
 <20260803221614.59324-1-derekjohn.clark@gmail.com>
 <20260803221614.59324-2-derekjohn.clark@gmail.com>
 <f8b2c85a-2800-c9a3-4e56-7af4c53823e5@linux.intel.com>
 <58a9c644-98c2-47ee-b083-0d5b19fa5053@roeck-us.net>
In-Reply-To: <58a9c644-98c2-47ee-b083-0d5b19fa5053@roeck-us.net>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Tue, 18 Aug 2026 17:26:29 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwGdwhE6Sm6oa2uxx_sHfFNQ6fHYnAhYHkEPQcp_Yb=Z6w@mail.gmail.com>
X-Gm-Features: AcwNN1UhVCaNOkZFdVfL73RRF7zncaDflReojJs4T1XIHAhKKPfu3HJk5Tqo7yM
Message-ID: 
 <CAGwozwGdwhE6Sm6oa2uxx_sHfFNQ6fHYnAhYHkEPQcp_Yb=Z6w@mail.gmail.com>
Subject: Re: [PATCH 1/6] platform/x86: msi-wmi-platform: Move guard out of
 switch in platform_write()
To: Guenter Roeck <linux@roeck-us.net>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>, W_Armin@gmx.de, corbet@lwn.net,
	hdegoede@redhat.com, jdelvare@suse.com, kuurtb@gmail.com,
	linux-doc@vger.kernel.org, linux-hwmon@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <178706680320.724217.13470072612999598719@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

On Tue, 18 Aug 2026 at 16:42, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 8/18/26 07:12, Ilpo J=C3=A4rvinen wrote:
> > On Mon, 3 Aug 2026, Derek J. Clark wrote:
> >
> >> The ML patch set uses a guard within a switch case that violates clean=
up
> >> rules. Move the guard outside the switch so all return paths are cover=
ed.
> >>
> >> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> >> ---
> >>   drivers/platform/x86/msi-wmi-platform.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platfor=
m/x86/msi-wmi-platform.c
> >> index dfb65ac8fbf6..33acd448f674 100644
> >> --- a/drivers/platform/x86/msi-wmi-platform.c
> >> +++ b/drivers/platform/x86/msi-wmi-platform.c
> >> @@ -675,11 +675,11 @@ static int msi_wmi_platform_write(struct device =
*dev, enum hwmon_sensor_types ty
> >>      u8 buffer[32] =3D { };
> >>      int ret;
> >>
> >> +    guard(mutex)(&data->wmi_lock);
> >>      switch (type) {
> >>      case hwmon_pwm:
> >>              switch (attr) {
> >>              case hwmon_pwm_enable:
> >> -                    guard(mutex)(&data->wmi_lock);
> >
> > While I cannot see the code easily, one could also add braces to inside
> > the case to avoid this problem.
> >
>
> I don't see the code either, but wouldn't this be a use case for
> scoped_guard() ?

Hi, not explicitly stated in the cover letter, but this is essentially
a series on top of the series I sent last year but I did not clean up
due to a variety of issues with MSI firmware that would have made the
driver unsuitable for upstreaming (to my standards at least). These
issues span Intel driver problems, HID controller instability, and
varying WMI implementations esp. in regards to PLx setting between AMD
/ Intel variants, shift mode behavior not acting correctly, and fan
curve application / resetting being weird (the fan curve on off bit
does not seem to change whether an automatic curve is used but how
close the device alings to the set curve? requiring us to back up and
restore the original curve? half of the devices keep the curve during
sleep and half don't? but if the fan curve is so finicky do we really
want a resume handler for it? Perhaps we can kick the timing quirks to
userspace)

For this reason, I focused on other manufacturers such as Ayaneo and
OneXPlayer. I will revisit this series per request from Derek as he
seems to want this for steamos and hid-msi is already queued for 7.3?
Although, to be honest, compared to the controller firmware issues,
the WMI implementation is pristine.

So I will need to go through these issues 1 by 1 and see which can be
fixed and either drop certain features in the beginning.

Particularly for the fan curves, if we say that resume handlers are
required to be in the kernel moving forward, I do not know how
realistic it is to make those reliable for this WMI device family.

Best,
Antheas


> Guenter
>
> >>
> >>                      buffer[0] =3D MSI_PLATFORM_AP_SUBFEATURE_FAN_MODE=
;
> >>                      ret =3D msi_wmi_platform_query_unlocked(
> >>
> >
>
>


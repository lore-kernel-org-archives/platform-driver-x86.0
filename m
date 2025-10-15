Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A86E31A078
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Oct 2025 09:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760519834; cv=none; b=QuNP7K0SbS5/ftN8pIkU91cDojvWGs4gEDmlomXhWVgns2GAKz4yK/gKewWLhuiRDBs7BGOOfE8uCpTaCW4UpoMYmS7zTfUAI2DgjWVUDAmchorwyqaiQ6QuGPoKMkF6VEdk502pQrnYHEx+9yyGfMkx3t/9nHCfZ9ZRitncc2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760519834; c=relaxed/simple;
	bh=BbgK//hwlyr8zf1tpJICvPbrydkFnJrCzjJqBw0CBhE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NtxxIFY5FfRdt8A2vsHPDUrFtHnPEBxIoE/ijHMIEmdYpwCgk0oIREfRrMvgzD8UE8d6ZpOKNuN4AAhQM1LLyqSAOjmLm5FP6ith3Tyq/IzrmW84QauzyXcFkyKrGqwPaJcCZe2Ky5gKViKE2GWp2n2VuFqSfuto4G35MOmujuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=Q2GwbQ7F; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="Q2GwbQ7F"
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id 42D745E665
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Oct 2025 12:17:10 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id 9480A5E6C1
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Oct 2025 12:17:08 +0300 (EEST)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 3BC85200BDF
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Oct 2025 12:17:07 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1760519827;
	bh=C0F8O8OZo2bWBfgr1SJOmX/dH9/bfIl26RPPqESx0EY=;
	h=Received:From:Subject:To;
	b=Q2GwbQ7FGElj1rF3Zk6dhMqHVW6+jWYugSJOd83rpTNVHf64xvOAwt0i4lFRF/qPl
	 LcbPb67sHlcw6a6b3VhXbAGZmmMYgm6RrWUNuf5L5l79zqIMRDvx584TLfaDIE1XDv
	 E1VCVyuBjyeVI3XjJIydeEwdLZqrANWQROaO9GdnXsTyH5ELbFKcsPwzcqG36JlnfQ
	 2VnLUqaSCaagUgHisXFCqkmke3+DgIRZqhilBLbO1xgcc4MDeymSAZIaht2sEv3Mno
	 tlnj4CxAyHmYrrZeGV/mjI2bBByMV+g1PcT/Z0Dg27sNiArdb2c7eLuzh9/Byijd9Q
	 R8PUL8uAlFgEQ==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.180) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f180.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-36d77ae9de5so51759921fa.2
        for <platform-driver-x86@vger.kernel.org>;
 Wed, 15 Oct 2025 02:17:07 -0700 (PDT)
X-Gm-Message-State: AOJu0YwbUsdNiBu3JOHDuDMbYVsJ/ktU6HKY92adr5RjdDlgqiDCq5YN
	fiLqq3VxrkC28chxguKbD4I4IMRXncZXOy9ZhtzPboijdHYTkuHhS3T8EkjydG9ffD2iSs9DwXZ
	zXAt+03aXEJqbnN4OadAY+eN+Hu3WiDs=
X-Google-Smtp-Source: 
 AGHT+IGl3UWVJ+CA/0GtuT6iRgW30haNCjgI/9v0CtcqqMSu1p+I2OodAmJFPkdTjJOLIuOaPpsRutFjsSa1yNSJfy8=
X-Received: by 2002:a05:651c:438c:20b0:376:455c:17f9 with SMTP id
 38308e7fff4ca-376455c1baamr35791021fa.48.1760519826563; Wed, 15 Oct 2025
 02:17:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015084414.1391595-1-lkml@antheas.dev>
 <20251015084414.1391595-7-lkml@antheas.dev>
 <de1f9cd3-183e-7b01-72aa-23fa4d30334e@linux.intel.com>
In-Reply-To: <de1f9cd3-183e-7b01-72aa-23fa4d30334e@linux.intel.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Wed, 15 Oct 2025 11:16:53 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwHsMErRA+eDSCH+3XU6Q4Up7qTSqJ5y29-SdP0aMErUTg@mail.gmail.com>
X-Gm-Features: AS18NWDQYQFa2ndXF6O_xFGQCI8NwCpzxBFp9glkhl6kR4sG8KXPxg4L4HsN1VE
Message-ID: 
 <CAGwozwHsMErRA+eDSCH+3XU6Q4Up7qTSqJ5y29-SdP0aMErUTg@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] platform/x86: ayaneo-ec: Add suspend hook
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	linux-hwmon@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
	Derek John Clark <derekjohn.clark@gmail.com>,
	=?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <176051982766.1073773.10429569145482834993@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Wed, 15 Oct 2025 at 11:11, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Wed, 15 Oct 2025, Antheas Kapenekakis wrote:
>
> > The Ayaneo EC resets after hibernation, losing the charge control state=
.
> > Add a small PM hook to restore this state on hibernation resume.
> >
> > The fan speed is also lost during hibernation, but since hibernation
> > failures are common with this class of devices, setting a low fan speed
> > when the userspace program controlling the fan will potentially not
> > take over could cause the device to overheat, so it is not restored.
> >
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
> >  drivers/platform/x86/ayaneo-ec.c | 42 ++++++++++++++++++++++++++++++++
> >  1 file changed, 42 insertions(+)
> >
> > diff --git a/drivers/platform/x86/ayaneo-ec.c b/drivers/platform/x86/ay=
aneo-ec.c
> > index 73e9dd39c703..8529f6f8dc69 100644
> > --- a/drivers/platform/x86/ayaneo-ec.c
> > +++ b/drivers/platform/x86/ayaneo-ec.c
> > @@ -37,6 +37,8 @@
> >  #define AYANEO_MODULE_LEFT   BIT(0)
> >  #define AYANEO_MODULE_RIGHT  BIT(1)
> >
> > +#define AYANEO_CACHE_LEN     1
> > +
> >  struct ayaneo_ec_quirk {
> >       bool has_fan_control;
> >       bool has_charge_control;
> > @@ -47,6 +49,8 @@ struct ayaneo_ec_platform_data {
> >       struct platform_device *pdev;
> >       struct ayaneo_ec_quirk *quirks;
> >       struct acpi_battery_hook battery_hook;
> > +
> > +     u8 cache[AYANEO_CACHE_LEN];
> >  };
> >
> >  static const struct ayaneo_ec_quirk quirk_fan =3D {
> > @@ -464,10 +468,48 @@ static int ayaneo_ec_probe(struct platform_device=
 *pdev)
> >       return 0;
> >  }
> >
> > +static int ayaneo_freeze(struct device *dev)
> > +{
> > +     struct platform_device *pdev =3D to_platform_device(dev);
> > +     struct ayaneo_ec_platform_data *data =3D platform_get_drvdata(pde=
v);
> > +     int ret, i =3D 0;
> > +
> > +     if (data->quirks->has_charge_control) {
> > +             ret =3D ec_read(AYANEO_CHARGE_REG, &data->cache[i]);
> > +             if (ret)
> > +                     return ret;
> > +             i++;
>
> What is this for?

Adding additional registers to restore. Currently, there is only one
so it looks out of place.

> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int ayaneo_thaw(struct device *dev)
> > +{
> > +     struct platform_device *pdev =3D to_platform_device(dev);
> > +     struct ayaneo_ec_platform_data *data =3D platform_get_drvdata(pde=
v);
> > +     int ret, i =3D 0;
> > +
> > +     if (data->quirks->has_charge_control) {
> > +             ret =3D ec_write(AYANEO_CHARGE_REG, data->cache[i]);
> > +             if (ret)
> > +                     return ret;
> > +             i++;
>
> Same question here.
>
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct dev_pm_ops ayaneo_pm_ops =3D {
> > +     .freeze =3D ayaneo_freeze,
> > +     .thaw =3D ayaneo_thaw,
> > +};
> > +
> >  static struct platform_driver ayaneo_platform_driver =3D {
> >       .driver =3D {
> >               .name =3D "ayaneo-ec",
> >               .dev_groups =3D ayaneo_ec_groups,
> > +             .pm =3D &ayaneo_pm_ops,
> >       },
> >       .probe =3D ayaneo_ec_probe,
> >  };
> >
>
> --
>  i.
>
>


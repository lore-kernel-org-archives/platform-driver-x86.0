Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E611A23A6
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Nov 2025 18:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762109934; cv=none; b=aaPE54wnBo1zW7u5nd93rhrP6/SjSxbQT+Qsjfy8QwxT5AypNa/q8eGiGnjtjhHJ6DJNBjSSP+MXSOhsORHrNNpNpzQwZuIrHn4DakwjoVOvtv1TWyWdGGVH4vxxFEPWMHeEYWkLyp3G/FXWIWZn/5oYB9lKj51f2NgWkRF3oSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762109934; c=relaxed/simple;
	bh=O5byDhIM4xXP7nYCPiVNi1NMKiTdBuDG5vqilpGyyX0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qmA+nBWZmobcMKdG7wONhpMXgeYYZqcQusn+9Q3kRb/WoyVgXXQmMwb6lclS6+KbMd+Sf/+oVBIteu8R4XQbajkb1mOk3XUd2pKdI4MGbJFEpc29RSO8mlB3a4QAT9k8ncuhffr+qtss5rDNyZnx6dXb4gdykPw0I6m4OErtXVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=j0QMBxxm; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="j0QMBxxm"
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id 93A225E4DB
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Nov 2025 20:58:51 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id E04D65E4FE
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Nov 2025 20:58:50 +0200 (EET)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 036A1201DD2
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Nov 2025 20:58:48 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1762109930;
	bh=LvSn2OY5sUy5n77D3rasurUxwOUUW3/DZFmtYqiWg98=;
	h=Received:From:Subject:To;
	b=j0QMBxxmW3k5zRgEEM9lG8OBtWRwWR1a27m6FW4nNSdH1k1Bo1+d8Xx/cPTZfyHqe
	 +iUf/WJSXCtgz1KXEv0Sdr6A5I9HZ0irQ3WWjCCJI1kxTdTrGUxfr9+rQrPCEhg6RH
	 AgbOAnJlkXpDJ6t7zvf7/GKUTkqAOoC4HiXwdGQ3eoRYr5mAvU7QojNE1zKY2Q5Sgq
	 6O1ojDv0lPp3aVmwCTzcRO1LjQis0RuaXG29L+j/n20BpMvIqwZ+jSIrGq99GlP5aX
	 VcrffpuMY1GMOF2hOWibopBnEAmplhxXWlOk/o2fcc1JtEVQDPPkRiScCoSE/byErZ
	 gDpGWLJ+hgG1Q==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.172) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f172.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-37a2dcc52aeso12495061fa.0
        for <platform-driver-x86@vger.kernel.org>;
 Sun, 02 Nov 2025 10:58:48 -0800 (PST)
X-Gm-Message-State: AOJu0YzxBvTKZnqJr0P/jansyscOhlpRQKytkWzmJXP1IF9J+pYqoYJc
	wDatyS/38jl8Opg1GyS0cLlmVPe564Nn5iY0saVyHDcqj7MR3Zsy61JwGstTMlKmhMPKF4zDz5B
	XAEr1shuipoAtCPqhM+kOhDYkJzp4viQ=
X-Google-Smtp-Source: 
 AGHT+IFm9OqemQtDTShLZgSdBQpfxnoHF3tEMoBzslSjkRYDULekWS0aX900UnebgbGyXPdCmuXzyP+n6EGRcCs/Mp8=
X-Received: by 2002:a2e:80d7:0:b0:378:d540:4d57 with SMTP id
 38308e7fff4ca-37a18d930f0mr25156591fa.20.1762109927869; Sun, 02 Nov 2025
 10:58:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251031163651.1465981-1-lkml@antheas.dev>
 <20251031163651.1465981-7-lkml@antheas.dev>
 <83b004ce-b34e-41a4-b35d-1f24056ac60a@gmx.de>
In-Reply-To: <83b004ce-b34e-41a4-b35d-1f24056ac60a@gmx.de>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sun, 2 Nov 2025 19:58:36 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwFJKeU-pWzNTkryoUpD63LFuJVSB6=y4C_22+4qat05eA@mail.gmail.com>
X-Gm-Features: AWmQ_bndNQUf7aBPmkK5CLjyyyNleSIE_pG1MpK_SSrr7VUq3QdzIFAtw_oxv9M
Message-ID: 
 <CAGwozwFJKeU-pWzNTkryoUpD63LFuJVSB6=y4C_22+4qat05eA@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] platform/x86: ayaneo-ec: Add suspend hook
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Derek John Clark <derekjohn.clark@gmail.com>,
	=?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <176210992981.2005374.2540203055627261054@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Sun, 2 Nov 2025 at 19:35, Armin Wolf <W_Armin@gmx.de> wrote:
>
> Am 31.10.25 um 17:36 schrieb Antheas Kapenekakis:
>
> > The Ayaneo EC resets after hibernation, losing the charge control state.
> > Add a small PM hook to restore this state on hibernation resume.
> >
> > The fan speed is also lost during hibernation, but since hibernation
> > failures are common with this class of devices, setting a low fan speed
> > when the userspace program controlling the fan will potentially not
> > take over could cause the device to overheat, so it is not restored.
>
> Please update the patch description.
>
> >
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
> >   drivers/platform/x86/ayaneo-ec.c | 73 ++++++++++++++++++++++++++++++++
> >   1 file changed, 73 insertions(+)
> >
> > diff --git a/drivers/platform/x86/ayaneo-ec.c b/drivers/platform/x86/ayaneo-ec.c
> > index 9548e3d22093..e1ad5968d3b4 100644
> > --- a/drivers/platform/x86/ayaneo-ec.c
> > +++ b/drivers/platform/x86/ayaneo-ec.c
> > @@ -41,6 +41,8 @@
> >   #define AYANEO_MODULE_LEFT  BIT(0)
> >   #define AYANEO_MODULE_RIGHT BIT(1)
> >
> > +#define AYANEO_CACHE_LEN     1
> > +
> >   struct ayaneo_ec_quirk {
> >       bool has_fan_control;
> >       bool has_charge_control;
> > @@ -51,6 +53,9 @@ struct ayaneo_ec_platform_data {
> >       struct platform_device *pdev;
> >       struct ayaneo_ec_quirk *quirks;
> >       struct acpi_battery_hook battery_hook;
> > +
> > +     bool restore_charge_limit;
> > +     bool restore_pwm;
> >   };
> >
> >   static const struct ayaneo_ec_quirk quirk_fan = {
> > @@ -207,10 +212,14 @@ static int ayaneo_ec_read(struct device *dev, enum hwmon_sensor_types type,
> >   static int ayaneo_ec_write(struct device *dev, enum hwmon_sensor_types type,
> >                          u32 attr, int channel, long val)
> >   {
> > +     struct ayaneo_ec_platform_data *data = platform_get_drvdata(
> > +             to_platform_device(dev));
> > +     int ret;
> >       switch (type) {
> >       case hwmon_pwm:
> >               switch (attr) {
> >               case hwmon_pwm_enable:
> > +                     data->restore_pwm = false;
> >                       switch (val) {
> >                       case 1:
> >                               return ec_write(AYANEO_PWM_ENABLE_REG,
> > @@ -224,6 +233,15 @@ static int ayaneo_ec_write(struct device *dev, enum hwmon_sensor_types type,
> >               case hwmon_pwm_input:
> >                       if (val < 0 || val > 255)
> >                               return -EINVAL;
> > +                     if (data->restore_pwm) {
> > +                             // Defer restoring PWM control to after
> > +                             // userspace resumes successfully
> > +                             ret = ec_write(AYANEO_PWM_ENABLE_REG,
> > +                                            AYANEO_PWM_MODE_MANUAL);
> > +                             if (ret)
> > +                                     return ret;
> > +                             data->restore_pwm = false;
>
> I suspect that you need to use a mutex to protect the restore sequence.

This is indeed true. I can respin the last patch with a mutex and fix
the description.

If the date on the control modules patch is the only issue, I can skip
re-sending the first 5.


> Thanks,
> Armin Wolf
>
> > +                     }
> >                       return ec_write(AYANEO_PWM_REG, (val * 100) / 255);
> >               default:
> >                       break;
> > @@ -474,10 +492,65 @@ static int ayaneo_ec_probe(struct platform_device *pdev)
> >       return 0;
> >   }
> >
> > +static int ayaneo_freeze(struct device *dev)
> > +{
> > +     struct platform_device *pdev = to_platform_device(dev);
> > +     struct ayaneo_ec_platform_data *data = platform_get_drvdata(pdev);
> > +     int ret;
> > +     u8 tmp;
> > +
> > +     if (data->quirks->has_charge_control) {
> > +             ret = ec_read(AYANEO_CHARGE_REG, &tmp);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             data->restore_charge_limit = tmp == AYANEO_CHARGE_VAL_INHIBIT;
> > +     }
> > +
> > +     if (data->quirks->has_fan_control) {
> > +             ret = ec_read(AYANEO_PWM_ENABLE_REG, &tmp);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             data->restore_pwm = tmp == AYANEO_PWM_MODE_MANUAL;
> > +
> > +             // Release the fan when entering hibernation to avoid
> > +             // overheating if hibernation fails and hangs
> > +             if (data->restore_pwm) {
> > +                     ret = ec_write(AYANEO_PWM_ENABLE_REG, AYANEO_PWM_MODE_AUTO);
> > +                     if (ret)
> > +                             return ret;
> > +             }
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int ayaneo_restore(struct device *dev)
> > +{
> > +     struct platform_device *pdev = to_platform_device(dev);
> > +     struct ayaneo_ec_platform_data *data = platform_get_drvdata(pdev);
> > +     int ret;
> > +
> > +     if (data->quirks->has_charge_control && data->restore_charge_limit) {
> > +             ret = ec_write(AYANEO_CHARGE_REG, AYANEO_CHARGE_VAL_INHIBIT);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct dev_pm_ops ayaneo_pm_ops = {
> > +     .freeze = ayaneo_freeze,
> > +     .restore = ayaneo_restore,
> > +};
> > +
> >   static struct platform_driver ayaneo_platform_driver = {
> >       .driver = {
> >               .name = "ayaneo-ec",
> >               .dev_groups = ayaneo_ec_groups,
> > +             .pm = &ayaneo_pm_ops,
> >       },
> >       .probe = ayaneo_ec_probe,
> >   };
>


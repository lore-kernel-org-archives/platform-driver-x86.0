Received: from relay14.grserver.gr (relay14.grserver.gr [46.224.16.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EED4309DDC
	for <platform-driver-x86@vger.kernel.org>; Sun, 16 Nov 2025 16:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.224.16.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763309978; cv=none; b=Bv1XKOANAMBU3F7RNXSw5pPhLlnBWllvIymWtc7WYDYRCk2kNo2h0nek127ai3+BAMmsKe4vwkPWGeNFK5kkT3tnRL9fNqXyQNK6mTs6tYpn2E7VMooxaeh+tS9r4b+s6yA/QrnHvWb5+LX4XUlLrPXCdVEM3Rm3Q9An7xJpz/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763309978; c=relaxed/simple;
	bh=IHGFwEp9Y/P161Ft0v5B6FtzpdqFqvQ3pQa5Tqhop+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bRF7WkK1Swmj5X+t4ofFRvKmjLsyvBI/U074y+AzCXWVbj+XT3VMVn/fAM7lFHA2H2LTCgaGL+PLYztBBqnCzlVw8cyOR1xVtgN7hnbCrYEfcP2afPJBySr8Bwwq/YS2jpF+T2Spt+LN7KOuMIZCptK8L9V3b1pYi5qy5LCEf6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=jGYWPuQ+; arc=none smtp.client-ip=46.224.16.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="jGYWPuQ+"
Received: from relay14 (localhost [127.0.0.1])
	by relay14.grserver.gr (Proxmox) with ESMTP id 8C43B43FB7
	for <platform-driver-x86@vger.kernel.org>; Sun, 16 Nov 2025 16:19:27 +0000 (UTC)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay14.grserver.gr (Proxmox) with ESMTPS id DD70643FBB
	for <platform-driver-x86@vger.kernel.org>; Sun, 16 Nov 2025 16:19:26 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id CB065201DED
	for <platform-driver-x86@vger.kernel.org>; Sun, 16 Nov 2025 18:19:24 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1763309966;
	bh=gXDZ9zl2F82pJQrJHpKyPIEMGNbs5Tvll+oAAd3+iGg=;
	h=Received:From:Subject:To;
	b=jGYWPuQ+S25MEJIF2v/qEQh3MqoHd/av1MH3LcMhS3YPdHGfkGPFyljlGRPNaPAwi
	 gMCVaWVhJ1139w9tznr9rSKQ/qqAOo+JEjKt8v997bYXI3RrIXW0xMSwWkM+DQj16F
	 avuEp5Xb8fVLwCbHiOiK7H9I964W53ql3A+4+A1a0dwO0DzInWffpTk33OqlxJwdXc
	 UO4r4gamfFNjEetSwWuxriVhbiyrnwwgeXGv5HyKlLYbPOH+zAw5bhy7114T4f8QJV
	 UyUsAZjps680qxch/l6A1qmXhlledyG5YCU9WYPq16E1S/45f95AI042TrETOcQ0qo
	 NVv8XoBsYZvyg==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.176) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f176.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-37a3d86b773so33411351fa.0
        for <platform-driver-x86@vger.kernel.org>;
 Sun, 16 Nov 2025 08:19:24 -0800 (PST)
X-Gm-Message-State: AOJu0YxN+Ya/KJfVWcuIf1SmpgX/h6Gz+vhpISFZ2cat3cLCsP1boHjl
	hQkTQtBib8TEg1YLSBSf0LXyfXJuR+uKzrQZQael8KVjZIbylnXAR6tWjfeTdfgCnFvsBsxiULz
	pPI71L6g7qIyOf5tKlVwqQx+EKkfOseQ=
X-Google-Smtp-Source: 
 AGHT+IG4g34ueW0wXRmE3lb2ko4VC4WwlLnuogVuhLAWDhhzhwpsF4CgE2XUWJ7SF2l7myWq5lEhdFWr9/vJsW1+bvk=
X-Received: by 2002:a05:651c:4094:b0:37b:aaf7:f022 with SMTP id
 38308e7fff4ca-37babd7f7ffmr18049061fa.35.1763309963642; Sun, 16 Nov 2025
 08:19:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251113212221.456875-1-lkml@antheas.dev>
 <20251113212221.456875-7-lkml@antheas.dev>
 <c329d8c7-1dfd-4168-a267-cc7fcc66aeb7@gmx.de>
In-Reply-To: <c329d8c7-1dfd-4168-a267-cc7fcc66aeb7@gmx.de>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sun, 16 Nov 2025 17:19:12 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwExxbcrTQP5G6cc3sjayiW+crCXTfG4VHi85QrMqFtpBQ@mail.gmail.com>
X-Gm-Features: AWmQ_blfw8hRnMk7tlJTd_aPUJBzqQIcDoj5HB35ZWAQJMuMq4RGwo4g_qnlIKM
Message-ID: 
 <CAGwozwExxbcrTQP5G6cc3sjayiW+crCXTfG4VHi85QrMqFtpBQ@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] platform/x86: ayaneo-ec: Add suspend hook
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Derek John Clark <derekjohn.clark@gmail.com>,
	=?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <176330996633.478967.2022147484021350295@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Sun, 16 Nov 2025 at 17:05, Armin Wolf <W_Armin@gmx.de> wrote:
>
> Am 13.11.25 um 22:22 schrieb Antheas Kapenekakis:
>
> > The Ayaneo EC resets after hibernation, losing the charge control state.
> > Add a small PM hook to restore this state on hibernation resume.
> >
> > The fan speed is also lost during hibernation, but since hibernation
> > failures are common with this class of devices, setting a low fan speed
> > when the userspace program controlling the fan will potentially not
> > take over could cause the device to overheat, so it is not restored.
> >
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
> >   drivers/platform/x86/ayaneo-ec.c | 84 +++++++++++++++++++++++++++++++-
> >   1 file changed, 83 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/platform/x86/ayaneo-ec.c b/drivers/platform/x86/ayaneo-ec.c
> > index 814f7f028710..3f40429acbd4 100644
> > --- a/drivers/platform/x86/ayaneo-ec.c
> > +++ b/drivers/platform/x86/ayaneo-ec.c
> > @@ -52,6 +52,11 @@ struct ayaneo_ec_platform_data {
> >       struct platform_device *pdev;
> >       struct ayaneo_ec_quirk *quirks;
> >       struct acpi_battery_hook battery_hook;
> > +
> > +     // Protects access to restore_pwm
> > +     struct mutex hwmon_lock;
> > +     bool restore_charge_limit;
> > +     bool restore_pwm;
> >   };
> >
> >   static const struct ayaneo_ec_quirk quirk_fan = {
> > @@ -208,10 +213,16 @@ static int ayaneo_ec_read(struct device *dev, enum hwmon_sensor_types type,
> >   static int ayaneo_ec_write(struct device *dev, enum hwmon_sensor_types type,
> >                          u32 attr, int channel, long val)
> >   {
> > +     struct ayaneo_ec_platform_data *data = dev_get_drvdata(dev);
> > +     int ret;
> > +
> > +     guard(mutex)(&data->hwmon_lock);
> > +
> >       switch (type) {
> >       case hwmon_pwm:
> >               switch (attr) {
> >               case hwmon_pwm_enable:
> > +                     data->restore_pwm = false;
> >                       switch (val) {
> >                       case 1:
> >                               return ec_write(AYANEO_PWM_ENABLE_REG,
> > @@ -225,6 +236,17 @@ static int ayaneo_ec_write(struct device *dev, enum hwmon_sensor_types type,
> >               case hwmon_pwm_input:
> >                       if (val < 0 || val > 255)
> >                               return -EINVAL;
> > +                     if (data->restore_pwm) {
> > +                             /*
> > +                              * Defer restoring PWM control to after
> > +                              * userspace resumes successfully
> > +                              */
> > +                             ret = ec_write(AYANEO_PWM_ENABLE_REG,
> > +                                            AYANEO_PWM_MODE_MANUAL);
> > +                             if (ret)
> > +                                     return ret;
> > +                             data->restore_pwm = false;
> > +                     }
> >                       return ec_write(AYANEO_PWM_REG, (val * 100) / 255);
> >               default:
> >                       break;
> > @@ -454,11 +476,14 @@ static int ayaneo_ec_probe(struct platform_device *pdev)
> >
> >       data->pdev = pdev;
> >       data->quirks = dmi_entry->driver_data;
> > +     ret = devm_mutex_init(&pdev->dev, &data->hwmon_lock);
> > +     if (ret)
> > +             return ret;
> >       platform_set_drvdata(pdev, data);
> >
> >       if (data->quirks->has_fan_control) {
> >               hwdev = devm_hwmon_device_register_with_info(&pdev->dev,
> > -                     "ayaneo_ec", NULL, &ayaneo_ec_chip_info, NULL);
> > +                     "ayaneo_ec", data, &ayaneo_ec_chip_info, NULL);
> >               if (IS_ERR(hwdev))
> >                       return PTR_ERR(hwdev);
> >       }
> > @@ -475,10 +500,67 @@ static int ayaneo_ec_probe(struct platform_device *pdev)
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
> > +             /*
> > +              * Release the fan when entering hibernation to avoid
> > +              * overheating if hibernation fails and hangs.
> > +              */
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
>
> Maybe you should use pm_sleep_ptr() here. With that being fixed:

True, i conflated that with using a sleep define so I skipped it.
Seems it is a ternary that checks CONFIG_PM_SLEEP

@Ilpo lmk if I should resend this before the merge window or it's
small enough to edit inplace

Antheas

> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
>
> >       },
> >       .probe = ayaneo_ec_probe,
> >   };
>


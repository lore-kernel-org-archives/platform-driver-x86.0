Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C93A4C64EC4
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Mar 2023 06:26:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbjCHG0C (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Mar 2023 01:26:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbjCHG0B (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Mar 2023 01:26:01 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9855A8392
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Mar 2023 22:25:59 -0800 (PST)
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 0DE653F1F2
        for <platform-driver-x86@vger.kernel.org>; Wed,  8 Mar 2023 06:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1678256758;
        bh=ay6ZKa7Tg72PuDk32HxgWNWnSno0ChydUsA4JwYm9Lk=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=RYwYftay83NUb+LL/SljubOWcbZ+gxtmr6rGPqL+PA5G2gqVluUjAJbLex7wUgcD0
         OJXJ6Hi0cVB/tDV1U7hkB+3Nt0A/5rtscWlbur7j93jSFyWHwIRK5uM1AeMWifIm6r
         dhOCDI789rcPwj+LoxX2q5hPkp35/S3IZH84ptw27ezwAwv7mSa/75TKeWkygowypV
         xaBwBeOGuXcu8lYg1CfUAYzbWDHhPoQSpOkDIodDP/qlju5GW51+azHb9d/tp4QxLP
         //8S3pY6M6TqztwMEwmH1caWtSvAzmDOB9COtFI9ti53/MC+hj+dsHVFtAAXKALT/9
         9gFJFMXk3Uamw==
Received: by mail-pl1-f198.google.com with SMTP id la3-20020a170902fa0300b0019ca5ddecedso8900327plb.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Mar 2023 22:25:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678256756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ay6ZKa7Tg72PuDk32HxgWNWnSno0ChydUsA4JwYm9Lk=;
        b=6zbkZaAzf+Le6sJ9F9SYlMn4vBl/bK5wSVq2T+7Vl1ergifn8Gt16inPP9SCRe3Nvk
         +jedMrD6NSufxFOHBQg4ZAFFZtbOAyKUALJCWfW20MQ4dQ3YG+K8evdBwANVSI147Kl0
         3P2NcQC3/29IG7zd+VkkGS3IaHJ+SSN9+ShjllDrZVoDExb2DaS+AXIlRyvYHPLqupkm
         1KWj+AvW9hvPskuia5tIXk4FgHVO/+J+2SOE8S92HLCJ0dfBUGXxnRCKgsEJLfjGEH4f
         PViCfyfYDDouOIPBN0uIyJ+z4GLGmgY/OQw6n5WyNiJ9Ws0ZC5+J7cPncLuEIs0Y168H
         zBzA==
X-Gm-Message-State: AO0yUKWAJKKhbYR+RW8cwxq7l0vDhfdG8cWlH5bydnAppSLcrQlqEQ0e
        Sx6zEGh/3eA+e0sfBZ08XhgzPQ+iF1Qj5iC3v94bTlt30YXd9Qs66qZ69wO1yY4eGE/R51CpeN6
        +srbHydET5IPrpljmTf0WHiKT68YpmQy7vfaOpHEnXSmjVhmtO/C5N1zTPGAUYIenE3o=
X-Received: by 2002:a17:90a:ec14:b0:231:1da0:dfce with SMTP id l20-20020a17090aec1400b002311da0dfcemr6011214pjy.3.1678256756313;
        Tue, 07 Mar 2023 22:25:56 -0800 (PST)
X-Google-Smtp-Source: AK7set9J/bss+n+FmfnvRWBEazewQBhSsabCnB8JBItXmoxS20MAETu1QTDyhFvR4xmeSPpw2pPROEwS82nh86dFnHY=
X-Received: by 2002:a17:90a:ec14:b0:231:1da0:dfce with SMTP id
 l20-20020a17090aec1400b002311da0dfcemr6011210pjy.3.1678256755883; Tue, 07 Mar
 2023 22:25:55 -0800 (PST)
MIME-Version: 1.0
References: <20230306142454.722020-1-koba.ko@canonical.com> <a83d9acd-a2c5-85ce-36dc-c6a8f0e11a66@redhat.com>
In-Reply-To: <a83d9acd-a2c5-85ce-36dc-c6a8f0e11a66@redhat.com>
From:   Koba Ko <koba.ko@canonical.com>
Date:   Wed, 8 Mar 2023 14:25:44 +0800
Message-ID: <CAJB-X+X83dLFsOyYON9zLQxOVukg7bcrikRohn4sRR6UiSUbOQ@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: dell-laptop: Register ctl-led for speaker-mute
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Mar 7, 2023 at 8:10=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> Hi,
>
> On 3/6/23 15:24, Koba Ko wrote:
> > Some platforms have the speaker-mute led and
> > current driver doesn't control it.
> >
> > If the platform support the control of speaker-mute led, register it
> >
> > Signed-off-by: Koba Ko <koba.ko@canonical.com>
>
> Thank you for your patch, one small remark below.
>
> > ---
> >  drivers/platform/x86/dell/dell-laptop.c | 43 +++++++++++++++++++++++++
> >  drivers/platform/x86/dell/dell-smbios.h |  2 ++
> >  2 files changed, 45 insertions(+)
> >
> > diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform=
/x86/dell/dell-laptop.c
> > index 1321687d923ed..38d95bae8e3ab 100644
> > --- a/drivers/platform/x86/dell/dell-laptop.c
> > +++ b/drivers/platform/x86/dell/dell-laptop.c
> > @@ -97,6 +97,7 @@ static struct rfkill *bluetooth_rfkill;
> >  static struct rfkill *wwan_rfkill;
> >  static bool force_rfkill;
> >  static bool micmute_led_registered;
> > +static bool mute_led_registered;
> >
> >  module_param(force_rfkill, bool, 0444);
> >  MODULE_PARM_DESC(force_rfkill, "enable rfkill on non whitelisted model=
s");
> > @@ -2177,6 +2178,34 @@ static struct led_classdev micmute_led_cdev =3D =
{
> >       .default_trigger =3D "audio-micmute",
> >  };
> >
> > +static int mute_led_set(struct led_classdev *led_cdev,
> > +                        enum led_brightness brightness)
> > +{
> > +     struct calling_interface_buffer buffer;
> > +     struct calling_interface_token *token;
> > +     int state =3D brightness !=3D LED_OFF;
> > +
> > +     if (state =3D=3D 0)
> > +             token =3D dell_smbios_find_token(GLOBAL_MUTE_DISABLE);
> > +     else
> > +             token =3D dell_smbios_find_token(GLOBAL_MUTE_ENABLE);
> > +
> > +     if (!token)
> > +             return -ENODEV;
> > +
> > +     dell_fill_request(&buffer, token->location, token->value, 0, 0);
> > +     dell_send_request(&buffer, CLASS_TOKEN_WRITE, SELECT_TOKEN_STD);
> > +
> > +     return 0;
> > +}
> > +
> > +static struct led_classdev mute_led_cdev =3D {
> > +     .name =3D "platform::mute",
> > +     .max_brightness =3D 1,
> > +     .brightness_set_blocking =3D mute_led_set,
> > +     .default_trigger =3D "audio-mute",
> > +};
> > +
> >  static int __init dell_init(void)
> >  {
> >       struct calling_interface_token *token;
> > @@ -2230,6 +2259,16 @@ static int __init dell_init(void)
> >               micmute_led_registered =3D true;
> >       }
> >
> > +     if (dell_smbios_find_token(GLOBAL_MUTE_DISABLE) &&
> > +         dell_smbios_find_token(GLOBAL_MUTE_ENABLE) &&
> > +         !dell_privacy_has_mic_mute()) {
>
> Since this is a speaker mute LED and since the Dell hw privacy
> stuff does not deal with the speaker at all, I believe that you
> should drop the "&& !dell_privacy_has_mic_mute()" part of
> the if condition here ?
>
> Can you please send a new version with this dropped?

Sure, have sent v2 with dell_privacy_has_mic_mute dropped
Thanks

>
> Regards,
>
> Hans
>
>
> > +             mute_led_cdev.brightness =3D ledtrig_audio_get(LED_AUDIO_=
MUTE);
> > +             ret =3D led_classdev_register(&platform_device->dev, &mut=
e_led_cdev);
> > +             if (ret < 0)
> > +                     goto fail_led;
> > +             mute_led_registered =3D true;
> > +     }
> > +
> >       if (acpi_video_get_backlight_type() !=3D acpi_backlight_vendor)
> >               return 0;
> >
> > @@ -2277,6 +2316,8 @@ static int __init dell_init(void)
> >  fail_backlight:
> >       if (micmute_led_registered)
> >               led_classdev_unregister(&micmute_led_cdev);
> > +     if (mute_led_registered)
> > +             led_classdev_unregister(&mute_led_cdev);
> >  fail_led:
> >       dell_cleanup_rfkill();
> >  fail_rfkill:
> > @@ -2299,6 +2340,8 @@ static void __exit dell_exit(void)
> >       backlight_device_unregister(dell_backlight_device);
> >       if (micmute_led_registered)
> >               led_classdev_unregister(&micmute_led_cdev);
> > +     if (mute_led_registered)
> > +             led_classdev_unregister(&mute_led_cdev);
> >       dell_cleanup_rfkill();
> >       if (platform_device) {
> >               platform_device_unregister(platform_device);
> > diff --git a/drivers/platform/x86/dell/dell-smbios.h b/drivers/platform=
/x86/dell/dell-smbios.h
> > index 75fa8ea0476dc..eb341bf000c67 100644
> > --- a/drivers/platform/x86/dell/dell-smbios.h
> > +++ b/drivers/platform/x86/dell/dell-smbios.h
> > @@ -34,6 +34,8 @@
> >  #define KBD_LED_AUTO_100_TOKEN       0x02F6
> >  #define GLOBAL_MIC_MUTE_ENABLE       0x0364
> >  #define GLOBAL_MIC_MUTE_DISABLE      0x0365
> > +#define GLOBAL_MUTE_ENABLE   0x058C
> > +#define GLOBAL_MUTE_DISABLE  0x058D
> >
> >  struct notifier_block;
> >
>

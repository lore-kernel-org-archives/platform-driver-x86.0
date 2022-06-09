Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97296C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu,  9 Jun 2022 13:50:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233850AbiFINuh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 9 Jun 2022 09:50:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234919AbiFINug (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Jun 2022 09:50:36 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D709836B78
        for <platform-driver-x86@vger.kernel.org>; Thu,  9 Jun 2022 06:50:32 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id i39so13845001ybj.9
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Jun 2022 06:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K/YE8iznSPylm6UHbBOpI02CIUSHsHzgI/z31KZYKqo=;
        b=mxks3fkU2jxWX0s3p3Br6sRgVoifitzZJPvwzvc4NzfyV8Xv4Y/KEAN/du58ZvrMkF
         VnIIuUpmf+Jj6x0418YkivpsLVIEo1qsZjJ18U+lXogqLISvgncOcCw6c57ZD2fvhUqq
         UlE0DDluCFiTukyzuHiyAZzjrb096CbyTzMKcc99gwACj2FOfkX8gbq55EzLWpkZ7MTt
         rGP2DBjpOBgta+hqIzMCFS/B+1qPF+mg/kPvGLiaFhPVLX1p+SRW6DUztDHSuUJ2JmzH
         f1ExBhjRIdJs/Pq9a4wymEJFdgf+GsoduyBfLqxfrV0m/09DHOBbIo0TRWO8DgboSc3y
         Dqnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K/YE8iznSPylm6UHbBOpI02CIUSHsHzgI/z31KZYKqo=;
        b=qsyxOgtxpdteqPPTig8M2t9OYvg1WoIcsQVs5OFB0db8ewECl7KerW1PQLFYvaHdDF
         WzYNyzKPcmzX3Q7IBCY186i4HNtONf2YBCvUwLO94LAjlyvo5b1xy9JjPmYIkAUGiLY9
         vhmhPVcCTMJ7IIO/ZKOksUJ97PMbqhig9AwVL4fIVQYgo/KgZLIwFbQ4+dWT5WpCE48E
         rq88gmNzU4pOu76hjvx7S5/a+3PjQYSJg68opMa64JY9w9W66X1MnWAVbo8uJfEO08qw
         PLtRao4UoCfbTfWLPdkaKCaG53blDxEWqmkQ4zQlUO0PqQxwilScX3jEtjMgpFOIqhcV
         k8rw==
X-Gm-Message-State: AOAM532sEEyFiTgafztIQQ5BTV3F2bFrSYqJHnwfEtSDZByiVTBjDuG0
        DDTnNmwg62spDq/fBJVMZibAkDmm0ieFwrgQXwo=
X-Google-Smtp-Source: ABdhPJzhJkQ6Qc8BBxfp5gkIT+3ZKo4ddAWvABOXBkceG0LFneqwEIg+Kdnbb5c5cSZgNuJEIE+YzXoeQMpvksSdLUY=
X-Received: by 2002:a05:6902:124a:b0:65d:3798:202f with SMTP id
 t10-20020a056902124a00b0065d3798202fmr41695093ybu.368.1654782631805; Thu, 09
 Jun 2022 06:50:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220607132428.7221-1-bedant.patnaik@gmail.com>
 <094f73b7-f618-aa12-762b-3b1a1f4556d2@redhat.com> <CAOOmCE8QYEwh6TrgA=_sTcm4spkuk3rjMS4g78nbBbWXWUB2aQ@mail.gmail.com>
 <fd1b71fe-d9a7-65bb-314c-f11b7d550fe8@redhat.com> <CAOOmCE-NN6cQ-hcG5Tyd8P8AjounN5aVZTD=AouX-isWNqe4dA@mail.gmail.com>
 <ca2bb15600cd7d101153eb4ee4a62ef5d8f0df72.camel@gmail.com>
 <CAOOmCE8LO5ns8pf4fhXWrDiBwYUHsvEtmqcSfEiw5nsKYKhSNw@mail.gmail.com>
 <41be46743d21c78741232a47bbb5f1cdbcc3d21e.camel@gmail.com> <acafed286e86158cec3ad5f0ddf9e52b912db996.camel@gmail.com>
In-Reply-To: <acafed286e86158cec3ad5f0ddf9e52b912db996.camel@gmail.com>
From:   Jorge Lopez <jorgealtxwork@gmail.com>
Date:   Thu, 9 Jun 2022 08:50:21 -0500
Message-ID: <CAOOmCE-N+cZtv95yjtMgWcY_Nrth_9BLu5uzDJWBM9STR9QLyA@mail.gmail.com>
Subject: Re: [RFC] platform/x86: hp-wmi: make hp_wmi_perform_query() work with
 certain devices
To:     Bedant Patnaik <bedant.patnaik@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        "markgross@kernel.org" <markgross@kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Jun 8, 2022 at 2:42 PM Bedant Patnaik <bedant.patnaik@gmail.com> wrote:
>
> Greetings Hans, Jorge,
>
> I have sent the zero_if_supp() patch that can be applied over Jorge's buffer size patch in the mail that I'm replying to.
> This *should* be enough as the final patch. Please let me know if anything needs to be rectified.

The patch looks good to me.  It matches the one tested earlier.  Thank you
>
> All your input is welcome.
>
> Thank you.
>
> On Thu, 2022-06-09 at 00:58 +0530, Bedant Patnaik wrote:
> > From 26f84d835819fa38872c673f49f1b77774927568 Mon Sep 17 00:00:00 2001
> > From: Bedant Patnaik <bedant.patnaik@gmail.com>
> > Date: Thu, 9 Jun 2022 00:50:53 +0530
> > Subject: [PATCH] Use zero insize parameter only when supported
> >
> > be9d73e64957bbd31ee9a0d11adc0f720974c558 ("platform/x86: hp-wmi: Fix 0x05 error code reported by several WMI calls")
> > and 12b19f14a21a2ee6348825d95b642ef2cd16794f ("platform/x86: hp-wmi: Fix hp_wmi_read_int() reporting error (0x05)")
> > cause ACPI BIOS Error (bug): Attempt to CreateField of length zero (20211217/dsopcode-133) because of the ACPI
> > method HWMC, which unconditionally creates a Field of size (insize*8) bits:
> >         CreateField (Arg1, 0x80, (Local5 * 0x08), DAIN)
> > In cases where args->insize = 0, the Field size is 0, resulting in an error.
> > Fix: use zero insize only if 0x5 error code is returned
> >
> > Tested on Omen 15 AMD (2020) board ID: 8786.
> >
> > Signed-off-by: Bedant Patnaik <bedant.patnaik@gmail.com>
> > ---
> >  drivers/platform/x86/hp-wmi.c | 23 +++++++++++++++--------
> >  1 file changed, 15 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
> > index 277397de5..0e07581b8 100644
> > --- a/drivers/platform/x86/hp-wmi.c
> > +++ b/drivers/platform/x86/hp-wmi.c
> > @@ -38,6 +38,7 @@ MODULE_ALIAS("wmi:5FB7F034-2C63-45e9-BE91-3D44E2C707E4");
> >  #define HPWMI_EVENT_GUID "95F24279-4D7B-4334-9387-ACCDC67EF61C"
> >  #define HPWMI_BIOS_GUID "5FB7F034-2C63-45e9-BE91-3D44E2C707E4"
> >  #define HP_OMEN_EC_THERMAL_PROFILE_OFFSET 0x95
> > +#define zero_if_sup(tmp) (zero_insize_support?0:sizeof(tmp)) // use when zero insize is required
> >
> >  /* DMI board names of devices that should use the omen specific path for
> >   * thermal profiles.
> > @@ -220,6 +221,7 @@ static struct input_dev *hp_wmi_input_dev;
> >  static struct platform_device *hp_wmi_platform_dev;
> >  static struct platform_profile_handler platform_profile_handler;
> >  static bool platform_profile_support;
> > +static bool zero_insize_support;
> >
> >  static struct rfkill *wifi_rfkill;
> >  static struct rfkill *bluetooth_rfkill;
> > @@ -376,7 +378,7 @@ static int hp_wmi_read_int(int query)
> >         int val = 0, ret;
> >
> >         ret = hp_wmi_perform_query(query, HPWMI_READ, &val,
> > -                                  0, sizeof(val));
> > +                                  zero_if_sup(val), sizeof(val));
> >
> >         if (ret)
> >                 return ret < 0 ? ret : -EINVAL;
> > @@ -412,7 +414,8 @@ static int hp_wmi_get_tablet_mode(void)
> >                 return -ENODEV;
> >
> >         ret = hp_wmi_perform_query(HPWMI_SYSTEM_DEVICE_MODE, HPWMI_READ,
> > -                                  system_device_mode, 0, sizeof(system_device_mode));
> > +                                  system_device_mode, zero_if_sup(system_device_mode),
> > +                                  sizeof(system_device_mode));
> >         if (ret < 0)
> >                 return ret;
> >
> > @@ -499,7 +502,7 @@ static int hp_wmi_fan_speed_max_get(void)
> >         int val = 0, ret;
> >
> >         ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_MAX_GET_QUERY, HPWMI_GM,
> > -                                  &val, 0, sizeof(val));
> > +                                  &val, zero_if_sup(val), sizeof(val));
> >
> >         if (ret)
> >                 return ret < 0 ? ret : -EINVAL;
> > @@ -511,7 +514,7 @@ static int __init hp_wmi_bios_2008_later(void)
> >  {
> >         int state = 0;
> >         int ret = hp_wmi_perform_query(HPWMI_FEATURE_QUERY, HPWMI_READ, &state,
> > -                                      0, sizeof(state));
> > +                                      zero_if_sup(state), sizeof(state));
> >         if (!ret)
> >                 return 1;
> >
> > @@ -522,7 +525,7 @@ static int __init hp_wmi_bios_2009_later(void)
> >  {
> >         u8 state[128];
> >         int ret = hp_wmi_perform_query(HPWMI_FEATURE2_QUERY, HPWMI_READ, &state,
> > -                                      0, sizeof(state));
> > +                                      zero_if_sup(state), sizeof(state));
> >         if (!ret)
> >                 return 1;
> >
> > @@ -600,7 +603,7 @@ static int hp_wmi_rfkill2_refresh(void)
> >         int err, i;
> >
> >         err = hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, HPWMI_READ, &state,
> > -                                  0, sizeof(state));
> > +                                  zero_if_sup(state), sizeof(state));
> >         if (err)
> >                 return err;
> >
> > @@ -1009,7 +1012,7 @@ static int __init hp_wmi_rfkill2_setup(struct platform_device *device)
> >         int err, i;
> >
> >         err = hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, HPWMI_READ, &state,
> > -                                  0, sizeof(state));
> > +                                  zero_if_sup(state), sizeof(state));
> >         if (err)
> >                 return err < 0 ? err : -EINVAL;
> >
> > @@ -1485,11 +1488,15 @@ static int __init hp_wmi_init(void)
> >  {
> >         int event_capable = wmi_has_guid(HPWMI_EVENT_GUID);
> >         int bios_capable = wmi_has_guid(HPWMI_BIOS_GUID);
> > -       int err;
> > +       int err, tmp = 0;
> >
> >         if (!bios_capable && !event_capable)
> >                 return -ENODEV;
> >
> > +       if (hp_wmi_perform_query(HPWMI_HARDWARE_QUERY, HPWMI_READ, &tmp,
> > +                                sizeof(tmp), sizeof(tmp)) == HPWMI_RET_INVALID_PARAMETERS)
> > +               zero_insize_support = true;
> > +
> >         if (event_capable) {
> >                 err = hp_wmi_input_setup();
> >                 if (err)
>

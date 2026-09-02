Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774D046982F
	for <platform-driver-x86@vger.kernel.org>; Wed,  2 Sep 2026 10:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788345992; cv=pass; b=GQlExqXaZe4OmBUOizjhkq2XrpBXsip+aUOrR1q7tMHW3BPmybjFM//9+gIrEUZ6R4FmBtIhzjXSHyFKiHad8WQSfq3Ay5IYocer3KcTXdSaLQxRfR8SaSbmRLwfDhPTjzsaX5UKaOM+kwf6qn1nKEeuwVTHLSFwDRk+u0f+h2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788345992; c=relaxed/simple;
	bh=kVNfe+6q5mTRfGOeFMVqumQmkz7iGMhPBDKDnA+QXA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V4JqUVIpeZAwBLN2BYfIlXPcwchkHyjUu0tXka7IyT8byuxLTXNPb3odpz468ID4THLAuQuylCsO0pGTPfkMr/Z0kpTYOvL+0pWCpkZW1UDsmrpkVnoi3dbY9w6pDfXfKxdw1jsczA1OI7w0DaLpqBTaFxuWw5kjtbUS1ISyi4M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n26YH9rn; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n26YH9rn"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c25344a8c6cso109679266b.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 02 Sep 2026 03:46:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788345976; cv=none;
        d=google.com; s=arc-20260327;
        b=j/LYW/oY+NIW94+XyQlXMOH3ohQ2JWphUDEICWMyjjvIGtAO6b3rDzvBQrVhAm8IKk
         L1vc1Ldtvjm3REM8rp8AIIkG4oXxheZOc9dy/pfPcRAzJCFZCtW4MMtPuVlw9WJIOegg
         ow9e+DEEVvvxB3BGbX//5ANow85MXMOc5z1sSse9B3ChPHZqITrBFTqL33ZATYKTeu/C
         Fo0vqeiBpzd8KWW9s6c0DdJBjDqmUrM613VAmc1D4JGbGP05myOIuFofIpzKJEr4yy28
         atrQzqZH+5axhn5pfFJFAm7fwbvGFVbP8itE4nhByT4qfnftAU3sjEnT3Yt7+eK6RUPf
         1Tiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OTz0t3n1QqLxKiOigrC3g5ZZ4pvXb24k5OSrPzNavSI=;
        fh=k+ODSOBnhiKVkhna8DVezMghyBlACBQgRZrqX98jEOw=;
        b=nBx9HH0H3qBbIt9qgsM+HmH7Gjb+4bvB4k+o119LbPOo4a2EOLq4SgPD+Sbj4xWlce
         s9D9BI5ADSEscMBctVvEnNmu79/vGEZaLh1wa6iG42d4bhtzTgCO8SLAGRB28s2Er4ZW
         eOi9mfSW4pYeUYU6p4UW4BlXDLUPsj++kkO9XCNXvQn2Z/nasC0wDiuA6dJzfZeQ5l1B
         bfdtY6SmOyLeCQVcldUjt6ponTCjdid/ucIgcBweAlovzDGuprPyEhM5DKTJVeGj1tCP
         hzmPIAGi7DUd7Y/0v7qnTPmVaxEMLBN50qyWlUf+hkPl2Z8T9/Zz4PGOo2UCGHO+WGuV
         E9zA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788345976; x=1788950776; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OTz0t3n1QqLxKiOigrC3g5ZZ4pvXb24k5OSrPzNavSI=;
        b=n26YH9rnC/IFEmLDF1CJtS/y5ZEEhQgHX6jzevVN9qC8hZD2lwycsjMSatTt87xrQz
         5NI7eYJRstQQ5XaQq69wxm8OByK9hvg281q5zEb2AY+7AeBavVZLo6g3OnYXDy4PhuJS
         A3lSESFCIWxKnyvoJm5xRWIn7K+gIs2+SoHJnsZlcWlt0byM5M07pY8JHDZASQbZ/kJz
         rsiNTZMlkZDF+84nkAURtOdZLtWP+V5mHbxXADmgHNPX4DJiSMBaaYCJkksYQSMazVYc
         Nh3CcyauTP3jI6SfIFvrkeDKEZce5wVRTtST8QUy3FZD9xn9MJ8HdYAfAru/YRwIFqnU
         WK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788345976; x=1788950776;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OTz0t3n1QqLxKiOigrC3g5ZZ4pvXb24k5OSrPzNavSI=;
        b=ZcynPIAF1Aa0xszHMj+Jbdtsb2UW7V7viG6WPyFpPIfq8/2XEUueQKcEiSTRfz1wCJ
         TFKiyaxmJO+M4mKO4HRyOamTKQFeKMtdgUzFFRqVxjyn6P8M1FYj2NcwOwoLuVx+RoIL
         pJk2FUJp3yLF/KMce7SLfdcddyMbGlFZJC8kCb9vn8gOoLKWNy28bT4xopcH//9KVYCO
         XoxmBdbkwDx/vusVIfemvV4uxyIncSMt9lqlo1VFNpX28X9Mxb58+kMt0eXRUs93/m0Z
         ABYrIlUZXZun/E49PbkK613DgKMLw+mkA7kTX/stG7pEG8bfTPCaZ5/Wxvwqps+bxZS0
         q8JQ==
X-Forwarded-Encrypted: i=1; AKwUvBzec4n7PjFZeC5YEgWzoBTpmt+irgmZrQkn1rHHZQVSp6sF+XoTM0HsnEDF3cI2pgNdApaFmmHePlPCJElT7Fwdnpd3@vger.kernel.org
X-Gm-Message-State: AFuF++kHpVJ0Kz/N9iUqIR6/wf84APoLMlVx4crnVRR0PT+ANgF0pPMi
	9dmE8vjVsnjnXyfG0gpQ5SlADHRZ+6Vl9ScMQlyX8NNWTtdDXs3XdUCGt+rXZPO14ok/r1Op1Kl
	lR2Kr/1OFE3qSe/+m/aKMvUNrL3N31b8=
X-Gm-Gg: AYBFou1K9C+SL9L1wFVDDMFFCnVA1QLAWt70t3HqKWm74uXaAuj92Xm0rzj0DVu23ow
	dzrolslBwEfDthNDjHM5gyj8UZOFCQkpCkj4xMF0YbgwZ369vVn1+MYjuVfp1uVCQ74Mae8nOEF
	d3YYIKD/Jf1HJ8l+8MLBZFgVGFjtCX6rLK0t4kuoLJAyRBZmM8yHrvo9N6BRK11Lsui21R9U6V8
	GTUxlEvJjkg85x2rubWIahyAYAyQbtmxe9PP0b0jZV6pYZOY/yiUGfhD61j4JlfHSvzsInexC6t
	3PrbOtkOivs6eSK9BcbDqMGU6EGX8pK7UP0yXDuBrQaT
X-Received: by 2002:a17:906:c142:b0:c20:3679:a2e6 with SMTP id
 a640c23a62f3a-c25d53e43fbmr250885766b.10.1788345975815; Wed, 02 Sep 2026
 03:46:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902032353.16106-1-idotohors@gmail.com> <b8cdf49b-91d4-2e86-a8ea-04d1db119225@linux.intel.com>
In-Reply-To: <b8cdf49b-91d4-2e86-a8ea-04d1db119225@linux.intel.com>
From: ido <idotohors@gmail.com>
Date: Wed, 2 Sep 2026 17:46:04 +0700
X-Gm-Features: AcwNN1XVCJpMZPZJzwZyPRRp2o1kacQFWl2WFwFKapbv1l1DXtf_LMmgx5DU7Mg
Message-ID: <CAF-TU9Y22LYDkwes3YK9xCq6J3J9E4KtHqg3L45rM9TEkohtqQ@mail.gmail.com>
Subject: Re: [PATCH v2] platform/x86: asus-wmi: fix FA401 series keyboard
 sleep strobe
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones" <luke@ljones.dev>, 
	Denis Benato <denis.benato@linux.dev>, Hans de Goede <hansg@kernel.org>, 
	platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review. Yeah, that makes complete sense.

I will split this into a two-patch series for v3:
1. A preparatory patch defining named bitmasks and converting
kbd_rgb_state_store() to use bitfield helpers / FIELD_PREP().
2. The functional fix adding the DMI quirk and suspend handling on top
of the clean definitions.

Will send v3 shortly.

Thanks,
Ido


On Wed, Sep 2, 2026 at 4:43=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Wed, 2 Sep 2026, Idotoho Reimon Simanjuntak wrote:
>
> > The FA401 series accepts the TUF keyboard RGB power-state command but d=
oes
> > not advertise the device through the normal DSTS presence probe. Regist=
er
> > the state attributes for this series and re-assert keyboard brightness =
in
> > the PM prepare callback so the EC enters S0ix with the correct state.
> >
> > Without the brightness re-assertion, the display server blanks the keyb=
oard
> > before the kernel suspend path runs, leaving the EC with brightness=3D0=
 and
> > preventing the sleep strobe from activating. Because kbd_led_wk may alr=
eady
> > be zeroed by the display server at prepare time, always re-assert level=
 3
> > (max) brightness when sleep backlight is enabled.
> >
> > Use a quirk flag (kbd_rgb_state_quirk) set via DMI match table rather t=
han
> > ad-hoc dmi_match() calls. Cache power-state flags from sysfs writes and
> > initialize the cache to the default enabled state during probe, so the
> > workaround also applies before userspace writes the attribute. Do not a=
dd
> > a module parameter; the sysfs power-state setting is authoritative.
> > Use the standard dev_pm_ops .prepare callback rather than overloading t=
he
> > Ally-specific LPS0 ops. Define self-documenting macros for the TUF RGB
> > state bitfields at file scope.
> >
> > Signed-off-by: Idotoho Reimon Simanjuntak <idotohors@gmail.com>
> > ---
> > Changes in v2:
> >  - Cache RGB power state flags from sysfs writes instead of attempting =
DSTS read.
> >  - Initialize state flags to enable all modes during driver probe.
> >  - Move TUF_RGB_STATE_* bitfield macros to file scope.
> >  - Drop module parameter in favor of DMI quirk + sysfs control.
> >  drivers/platform/x86/asus-nb-wmi.c | 14 +++++++
> >  drivers/platform/x86/asus-wmi.c    | 61 +++++++++++++++++++++++++++++-
> >  drivers/platform/x86/asus-wmi.h    |  1 +
> >  3 files changed, 75 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/=
asus-nb-wmi.c
> > index aeb461b16..fb06013ca 100644
> > --- a/drivers/platform/x86/asus-nb-wmi.c
> > +++ b/drivers/platform/x86/asus-nb-wmi.c
> > @@ -155,6 +155,11 @@ static struct quirk_entry quirk_asus_z13 =3D {
> >       .tablet_switch_mode =3D asus_wmi_kbd_dock_devid,
> >  };
> >
> > +static struct quirk_entry quirk_asus_fa401 =3D {
> > +     .wapf =3D 0,
> > +     .kbd_rgb_state_quirk =3D true,
> > +};
> > +
> >  static int dmi_matched(const struct dmi_system_id *dmi)
> >  {
> >       pr_info("Identified laptop model '%s'\n", dmi->ident);
> > @@ -163,6 +168,15 @@ static int dmi_matched(const struct dmi_system_id =
*dmi)
> >  }
> >
> >  static const struct dmi_system_id asus_quirks[] =3D {
> > +     {
> > +             .callback =3D dmi_matched,
> > +             .ident =3D "ASUSTeK COMPUTER INC. FA401",
> > +             .matches =3D {
> > +                     DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."=
),
> > +                     DMI_MATCH(DMI_BOARD_NAME, "FA401"),
> > +             },
> > +             .driver_data =3D &quirk_asus_fa401,
> > +     },
> >       {
> >               .callback =3D dmi_matched,
> >               .ident =3D "ASUSTeK COMPUTER INC. Q500A",
> > diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asu=
s-wmi.c
> > index a65090429..a0b678272 100644
> > --- a/drivers/platform/x86/asus-wmi.c
> > +++ b/drivers/platform/x86/asus-wmi.c
> > @@ -129,6 +129,18 @@ module_param(fnlock_default, bool, 0444);
> >  #define ASUS_SCREENPAD_BRIGHT_MAX 255
> >  #define ASUS_SCREENPAD_BRIGHT_DEFAULT 60
> >
> > +/* TUF RGB power state bitfields for DEVS(ASUS_WMI_DEVID_TUF_RGB_STATE=
) */
> > +#define TUF_RGB_STATE_CMD            0xbd
> > +#define TUF_RGB_STATE_SAVE           BIT(8)
> > +#define TUF_RGB_STATE_BOOT           (0x03 << 16)
> > +#define TUF_RGB_STATE_AWAKE          (0x0c << 16)
> > +#define TUF_RGB_STATE_SLEEP          (0x30 << 16)
> > +#define TUF_RGB_STATE_KEYBOARD               (0xc0 << 16)
> > +#define TUF_RGB_STATE_ALL_MODES              (TUF_RGB_STATE_BOOT | \
> > +                                      TUF_RGB_STATE_AWAKE | \
> > +                                      TUF_RGB_STATE_SLEEP | \
> > +                                      TUF_RGB_STATE_KEYBOARD)
> > +
> >  #define ASUS_MINI_LED_MODE_MASK              0x03
> >  /* Standard modes for devices with only on/off */
> >  #define ASUS_MINI_LED_OFF            0x00
> > @@ -308,6 +320,8 @@ struct asus_wmi {
> >       u32 nv_temp_target;
> >
> >       u32 kbd_rgb_dev;
> > +     u32 kbd_rgb_state_flags;
> > +     bool kbd_rgb_state_valid;
> >       bool kbd_rgb_state_available;
> >       bool oobe_state_available;
> >
> > @@ -1120,8 +1134,13 @@ static ssize_t kbd_rgb_state_store(struct device=
 *dev,
> >                                const char *buf, size_t count)
> >  {
> >       u32 flags, cmd, boot, awake, sleep, keyboard;
> > +     struct led_classdev *led;
> > +     struct asus_wmi *asus;
> >       int err;
> >
> > +     led =3D dev_get_drvdata(dev);
> > +     asus =3D container_of(led, struct asus_wmi, kbd_led);
> > +
> >       if (sscanf(buf, "%d %d %d %d %d", &cmd, &boot, &awake, &sleep, &k=
eyboard) !=3D 5)
> >               return -EINVAL;
> >
> > @@ -1138,6 +1157,9 @@ static ssize_t kbd_rgb_state_store(struct device =
*dev,
> >       if (keyboard)
> >               flags |=3D BIT(7);
> >
> > +     asus->kbd_rgb_state_flags =3D flags << 16;
> > +     asus->kbd_rgb_state_valid =3D true;
> > +
> >       /* 0xbd is the required default arg0 for the method. Nothing happ=
ens otherwise */
> >       err =3D asus_wmi_evaluate_method3(ASUS_WMI_METHODID_DEVS,
> >                       ASUS_WMI_DEVID_TUF_RGB_STATE, 0xbd | cmd << 8 | (=
flags << 16), 0, NULL);
>
> Interesting, is this using TUF_RGB_STATE_CMD as literal? Perhaps you
> should expand this into a patch series and make that conversion in
> preparatory patch.
>
> > @@ -5153,7 +5175,6 @@ static int asus_wmi_add(struct platform_device *p=
dev)
> >
> >       asus->egpu_enable_available =3D asus_wmi_dev_is_present(asus, ASU=
S_WMI_DEVID_EGPU);
> >       asus->dgpu_disable_available =3D asus_wmi_dev_is_present(asus, AS=
US_WMI_DEVID_DGPU);
> > -     asus->kbd_rgb_state_available =3D asus_wmi_dev_is_present(asus, A=
SUS_WMI_DEVID_TUF_RGB_STATE);
> >
> >       if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_MINI_LED_MODE))
> >               asus->mini_led_dev_id =3D ASUS_WMI_DEVID_MINI_LED_MODE;
> > @@ -5166,6 +5187,19 @@ static int asus_wmi_add(struct platform_device *=
pdev)
> >               asus->gpu_mux_dev =3D ASUS_WMI_DEVID_GPU_MUX_VIVO;
> >  #endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
> >
> > +     /*
> > +      * FA401 series accepts the TUF RGB-state DEVS command but does n=
ot
> > +      * advertise the device through DSTS. Keep the normal DSTS probe =
for
> > +      * other models and force registration when the quirk is set.
> > +      */
> > +     asus->kbd_rgb_state_available =3D
> > +             asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_STAT=
E) ||
> > +             asus->driver->quirks->kbd_rgb_state_quirk;
> > +     if (asus->driver->quirks->kbd_rgb_state_quirk) {
> > +             asus->kbd_rgb_state_flags =3D TUF_RGB_STATE_ALL_MODES;
> > +             asus->kbd_rgb_state_valid =3D true;
> > +     }
> > +
> >       asus->oobe_state_available =3D asus_wmi_dev_is_present(asus, ASUS=
_WMI_DEVID_OOBE);
> >
> >       if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_THROTTLE_THERMAL=
_POLICY))
> > @@ -5396,11 +5430,36 @@ static int asus_hotk_restore(struct device *dev=
ice)
> >
> >  static int asus_hotk_prepare(struct device *device)
> >  {
> > +     struct asus_wmi *asus =3D dev_get_drvdata(device);
> > +
> >       if (use_ally_mcu_hack =3D=3D ASUS_WMI_ALLY_MCU_HACK_ENABLED) {
> >               acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE,
> >                                          ASUS_USB0_PWR_EC0_CSEE_OFF);
> >               msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
> >       }
> > +
> > +     /*
> > +      * The display server may blank the keyboard backlight before the
> > +      * kernel suspend path runs. Re-assert brightness and power-state
> > +      * flags so the EC enters S0ix with the correct state. Always use
> > +      * level 3 (max) because kbd_led_wk may already be zeroed by the
> > +      * display server at this point, and the sleep strobe requires a
> > +      * non-zero brightness to activate.
> > +      */
> > +     if (asus && asus->driver->quirks->kbd_rgb_state_quirk &&
> > +         asus->kbd_rgb_state_available && asus->kbd_rgb_state_valid &&
> > +         (asus->kbd_rgb_state_flags & TUF_RGB_STATE_SLEEP)) {
> > +             u8 brightness =3D 0x80 | 0x03; /* level 3 (max) + light-o=
n bit */
> > +
> > +             asus_wmi_set_devstate(ASUS_WMI_DEVID_KBD_BACKLIGHT,
> > +                                   brightness, NULL);
> > +             asus_wmi_evaluate_method3(ASUS_WMI_METHODID_DEVS,
> > +                                       ASUS_WMI_DEVID_TUF_RGB_STATE,
> > +                                       TUF_RGB_STATE_CMD | TUF_RGB_STA=
TE_SAVE |
> > +                                       asus->kbd_rgb_state_flags,
>
> This makes things more confusing overall.
>
> One should use FIELD_PREP() consistently for bitfields where a shift is
> needed but here you write a pre-shifted value. In the other place, this
> driver shifts (which should be converted to FIELD_PREP()) while making th=
e
> evaluate call.
>
> > +                                       0, NULL);
> > +     }
> > +
> >       return 0;
> >  }
> >
> > diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asu=
s-wmi.h
> > index 5cd4392b9..69d224774 100644
> > --- a/drivers/platform/x86/asus-wmi.h
> > +++ b/drivers/platform/x86/asus-wmi.h
> > @@ -52,6 +52,7 @@ struct quirk_entry {
> >        */
> >       int no_display_toggle;
> >       u32 xusb2pr;
> > +     bool kbd_rgb_state_quirk;
> >  };
> >
> >  struct asus_wmi_driver {
> >
>
> --
>  i.
>

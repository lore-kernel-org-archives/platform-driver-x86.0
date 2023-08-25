Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C06C6787B
	for <platform-driver-x86@archiver.kernel.org>; Fri, 25 Aug 2023 16:43:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343884AbjHYQmq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 25 Aug 2023 12:42:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344045AbjHYQmh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 25 Aug 2023 12:42:37 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05A962121
        for <platform-driver-x86@vger.kernel.org>; Fri, 25 Aug 2023 09:42:34 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-99c0cb7285fso147392466b.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 25 Aug 2023 09:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692981752; x=1693586552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7hzjj9qfljlh0ssSNceZGohx14cPqffd0BEz2Ktryqo=;
        b=a3DF44KcILWe72fjr2p6mjIGofiCqT60b4I7rgnbrlXUNtwwRqR0kB2zXxgrTj2O7R
         vrKszUkBzBfYaGFS16M1mFxOGYScqriQ2rkOQd7FUE5a9hokDCjXxO7JM+xpiBcySvrE
         9EPGx4LG8oPbQAEZPM+3AhUrqUy2ViSLyAO+CZeNhmQ1Y4rJB5pA5I7vi+qCJN5HQZSe
         su/Tnlh5RHFHtXsl36ODs+6rVnq0jajFEWZ2EQFo4LzP1bTXP55AS/nvMK3VYNwUta18
         dtvE6qvjtP8qhByK+2y2XIo2DKPMvhQlu6T79avpLgt/FBkpfs4w2SwWOIWQSpaHhuVS
         PzTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692981752; x=1693586552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7hzjj9qfljlh0ssSNceZGohx14cPqffd0BEz2Ktryqo=;
        b=O0mpVQVQWtx15fnS07k7zL9m0ANKo4z6r0Hvg/ibx++48pg0JCClBsHxyykU4a+Y1U
         HjxRodEYjKz6TlBAT20SUuF25yH+jvVNuGVfpZe85Ll/h3AyPmfMeLhNcVMaV+B+Xonb
         i0eG47oYeP+XgYcq2MuaHXCgXaNsHWcpZbRFIx2FrG1l5p3wuX/nUzQc5te6hx0Pd+30
         t4KzM4zhUHfy4F76S+2kVbiMtsojlJEs7Q4e3XXFTriLIYhAmNEDHJX0wE7Cqtpx7W3G
         Rua/BWj/k7qp+buchsvQiZjvPqAL9J+GUZ54JVtFE4LrsHs/ULujZwvvbNuI8y0yxv5K
         dR7g==
X-Gm-Message-State: AOJu0YxIqbCDYiPwGwcKcGfMW6xO54EpWMCwzI+os1AYkGYWGOnCieDy
        0OgjfR6YrKKIZ7pLqMsV3zLTGv4BBcHEYjufT3A=
X-Google-Smtp-Source: AGHT+IGZsxcojEd+oik5JaofL3bn1As60PUHflab1ivtNVHZ9MTG5Ffzdix9SHXGoePdEDGLVB9AdtqXA7G+iXMuZDk=
X-Received: by 2002:a17:906:3145:b0:9a1:e58d:73b8 with SMTP id
 e5-20020a170906314500b009a1e58d73b8mr5869989eje.72.1692981752231; Fri, 25 Aug
 2023 09:42:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230825122925.7941-1-stuart.a.hayhurst@gmail.com> <6b50fffa-57df-032-9418-206a919ab828@linux.intel.com>
In-Reply-To: <6b50fffa-57df-032-9418-206a919ab828@linux.intel.com>
From:   Stuart <stuart.a.hayhurst@gmail.com>
Date:   Fri, 25 Aug 2023 17:42:21 +0100
Message-ID: <CALTg27=QFgAqd5irDmg2E-=wnOb4RkDSUUdboEHVm5Ut2z+q8A@mail.gmail.com>
Subject: Re: [PATCH 1/1] platform/x86: ideapad-laptop: Add support for
 keyboard backlights using KBLC ACPI symbol
To:     =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Mark Gross <markgross@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Ike Panhc <ike.pan@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thanks for the quick review, I've addressed most of the comments for
V2, do you want that submitted in this thread, or should I create a
new one?

> Could these bits too be named with defines, it would be helpful for those
> reading the code?

> (If you can add the names to all these other bits too, it should be put
> into own patch and not into this one.)

Sorry, I have no idea about the other events. I can do this one if
you'd like, or leave a comment for the future if you'd rather they all
be done together.

On Fri, Aug 25, 2023 at 2:01=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Fri, 25 Aug 2023, Stuart Hayhurst wrote:
>
> > Newer Lenovo laptops seem to use the KBLC symbol to control the backlig=
ht
> > Add support for handling the keyboard backlight on these devices
> >
> > Signed-off-by: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
> > ---
> >
> > This has been tested on both new types of keyboard backlight being supp=
orted.
> > KBD_BL_TRISTATE_AUTO is used for keyboards that support automatic brigh=
tness.
> > AUTO is reported as '0' with this patch, as it doesn't fit numerically,=
 I'm not sure how else to
> > report AUTO, hopefully someone has some insight :)
> >
> > ---
> >  drivers/platform/x86/ideapad-laptop.c | 107 ++++++++++++++++++++++++--
> >  1 file changed, 100 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x=
86/ideapad-laptop.c
> > index d2fee9a3e239..0e4cdd471a4a 100644
> > --- a/drivers/platform/x86/ideapad-laptop.c
> > +++ b/drivers/platform/x86/ideapad-laptop.c
> > @@ -85,6 +85,21 @@ enum {
> >       SALS_FNLOCK_OFF       =3D 0xf,
> >  };
> >
> > +/*
> > + * These correspond to the number of supported states - 1
> > + * Future keyboard types may need a new system, if there's a collision
> > + * KBD_BL_TRISTATE_AUTO has no way to report or set the auto state
> > + * so it effectively has 3 states, but needs to handle 4
> > + */
> > +enum {
> > +     KBD_BL_STANDARD      =3D 1,
> > +     KBD_BL_TRISTATE      =3D 2,
> > +     KBD_BL_TRISTATE_AUTO =3D 3,
> > +};
> > +
> > +#define KBD_BL_COMMAND_GET 0x2
> > +#define KBD_BL_COMMAND_SET 0x3
> > +
> >  struct ideapad_dytc_priv {
> >       enum platform_profile_option current_profile;
> >       struct platform_profile_handler pprof;
> > @@ -122,6 +137,7 @@ struct ideapad_private {
> >       } features;
> >       struct {
> >               bool initialized;
> > +             int type;
> >               struct led_classdev led;
> >               unsigned int last_brightness;
> >       } kbd_bl;
> > @@ -242,6 +258,16 @@ static int exec_sals(acpi_handle handle, unsigned =
long arg)
> >       return exec_simple_method(handle, "SALS", arg);
> >  }
> >
> > +static int exec_kblc(acpi_handle handle, unsigned long arg)
> > +{
> > +     return exec_simple_method(handle, "KBLC", arg);
> > +}
> > +
> > +static int eval_kblc(acpi_handle handle, unsigned long cmd, unsigned l=
ong *res)
> > +{
> > +     return eval_int_with_arg(handle, "KBLC", cmd, res);
> > +}
> > +
> >  static int eval_dytc(acpi_handle handle, unsigned long cmd, unsigned l=
ong *res)
> >  {
> >       return eval_int_with_arg(handle, "DYTC", cmd, res);
> > @@ -1272,14 +1298,42 @@ static void ideapad_backlight_notify_brightness=
(struct ideapad_private *priv)
> >   */
> >  static int ideapad_kbd_bl_brightness_get(struct ideapad_private *priv)
> >  {
> > -     unsigned long hals;
> > +     unsigned long value;
> >       int err;
> >
> > -     err =3D eval_hals(priv->adev->handle, &hals);
> > +     if (priv->kbd_bl.type =3D=3D KBD_BL_TRISTATE ||
> > +         priv->kbd_bl.type =3D=3D KBD_BL_TRISTATE_AUTO) {
> > +             err =3D eval_kblc(priv->adev->handle,
> > +                             (priv->kbd_bl.type << 4) | KBD_BL_COMMAND=
_GET,
> > +                             &value);
> > +
> > +             if (err)
> > +                     return err;
> > +
> > +             /* Convert returned value to brightness level */
> > +             value =3D (value & 0xFFFF) >> 1;
>
> You should define a field for thiswith GENMASK() and use FIELD_GET()
> instead of manual masking and shifting.
>
> > +
> > +             if (value >=3D 0 && value <=3D 2) {
>
> How can unsigned long be < 0??
>
> If that 2 is the same as priv->kbd_bl.led.max_brightness, it would make
> sense to use it rather than literal.
>
> > +                     /* Off, low or high */
> > +                     return value;
> > +             } else if (value =3D=3D 3) {
> > +                     /* Auto, report as off */
> > +                     return 0;
> > +             } else {
>
> Since those blocks above return, the elses are unnecessary.
>
> > +                     /* Unknown value */
> > +                     dev_warn(&priv->platform_device->dev,
> > +                              "Unknown keyboard backlight value: %i",
> > +                              value);
> > +                     return -EINVAL;
> > +             }
> > +     }
> > +
> > +
>
> Remove one of the newlines.
>
> > +     err =3D eval_hals(priv->adev->handle, &value);
> >       if (err)
> >               return err;
> >
> > -     return !!test_bit(HALS_KBD_BL_STATE_BIT, &hals);
> > +     return !!test_bit(HALS_KBD_BL_STATE_BIT, &value);
> >  }
> >
> >  static enum led_brightness ideapad_kbd_bl_led_cdev_brightness_get(stru=
ct led_classdev *led_cdev)
> > @@ -1291,13 +1345,27 @@ static enum led_brightness ideapad_kbd_bl_led_c=
dev_brightness_get(struct led_cla
> >
> >  static int ideapad_kbd_bl_brightness_set(struct ideapad_private *priv,=
 unsigned int brightness)
> >  {
> > -     int err =3D exec_sals(priv->adev->handle, brightness ? SALS_KBD_B=
L_ON : SALS_KBD_BL_OFF);
> > +     int err;
> > +     unsigned long value;
> > +     int type =3D priv->kbd_bl.type;
> > +
> > +     if (type =3D=3D KBD_BL_TRISTATE ||
> > +         type =3D=3D KBD_BL_TRISTATE_AUTO) {
> > +             if (brightness >=3D 0 && brightness <=3D 2) {
>
> Brightness is unsigned int so no need for < 0 check.
>
> Reverse the logic here:
>
>                 if (brightness > 2)
>                         return -EINVAL;
>
> ...as it avoid the need to use else.
>
> Consider using .max_brightness here too.
>
> > +                     value =3D (brightness << 16) | (type << 4) | KBD_=
BL_COMMAND_SET;
>
> There would also be a readability benefit for these if you define these
> as fields and use FIELD_PREP().
>
> > +             } else {
> > +                     return -EINVAL;
> > +             }
> > +
> > +             err =3D exec_kblc(priv->adev->handle, value);
> > +     } else {
> > +             err =3D exec_sals(priv->adev->handle, brightness ? SALS_K=
BD_BL_ON : SALS_KBD_BL_OFF);
> > +     }
> >
> >       if (err)
> >               return err;
> >
> >       priv->kbd_bl.last_brightness =3D brightness;
> > -
>
> Stray change.
>
> >       return 0;
> >  }
> >
> > @@ -1344,8 +1412,14 @@ static int ideapad_kbd_bl_init(struct ideapad_pr=
ivate *priv)
> >
> >       priv->kbd_bl.last_brightness =3D brightness;
> >
> > +     if (priv->kbd_bl.type =3D=3D KBD_BL_TRISTATE ||
> > +         priv->kbd_bl.type =3D=3D KBD_BL_TRISTATE_AUTO) {
>
> Please add a helper for this check as it seems to appear multiple times i=
n
> this patch.
>
> > +             priv->kbd_bl.led.max_brightness =3D 2;
> > +     } else {
> > +             priv->kbd_bl.led.max_brightness =3D 1;
> > +     }
> > +
> >       priv->kbd_bl.led.name                    =3D "platform::" LED_FUN=
CTION_KBD_BACKLIGHT;
> > -     priv->kbd_bl.led.max_brightness          =3D 1;
> >       priv->kbd_bl.led.brightness_get          =3D ideapad_kbd_bl_led_c=
dev_brightness_get;
> >       priv->kbd_bl.led.brightness_set_blocking =3D ideapad_kbd_bl_led_c=
dev_brightness_set;
> >       priv->kbd_bl.led.flags                   =3D LED_BRIGHT_HW_CHANGE=
D;
> > @@ -1456,6 +1530,7 @@ static void ideapad_acpi_notify(acpi_handle handl=
e, u32 event, void *data)
> >               case 2:
> >                       ideapad_backlight_notify_power(priv);
> >                       break;
> > +             case 12:
>
> Could these bits too be named with defines, it would be helpful for those
> reading the code?
>
> (If you can add the names to all these other bits too, it should be put
> into own patch and not into this one.)
>
> >               case 1:
> >                       /*
> >                        * Some IdeaPads report event 1 every ~20
> > @@ -1557,13 +1632,31 @@ static void ideapad_check_features(struct ideap=
ad_private *priv)
> >                       if (test_bit(HALS_FNLOCK_SUPPORT_BIT, &val))
> >                               priv->features.fn_lock =3D true;
> >
> > -                     if (test_bit(HALS_KBD_BL_SUPPORT_BIT, &val))
> > +                     if (test_bit(HALS_KBD_BL_SUPPORT_BIT, &val)) {
> >                               priv->features.kbd_bl =3D true;
> > +                             priv->kbd_bl.type =3D KBD_BL_STANDARD;
> > +                     }
> >
> >                       if (test_bit(HALS_USB_CHARGING_SUPPORT_BIT, &val)=
)
> >                               priv->features.usb_charging =3D true;
> >               }
> >       }
> > +
> > +     if (acpi_has_method(handle, "KBLC")) {
> > +             if (!eval_kblc(priv->adev->handle, 0x1, &val)) {
> > +                     if (val =3D=3D 0x5) {
> > +                             priv->features.kbd_bl =3D true;
> > +                             priv->kbd_bl.type =3D KBD_BL_TRISTATE;
> > +                     } else if (val =3D=3D 0x7) {
>
> Name these three literals with defines.
>
> > +                             priv->features.kbd_bl =3D true;
> > +                             priv->kbd_bl.type =3D KBD_BL_TRISTATE_AUT=
O;
> > +                     } else {
> > +                             dev_warn(&priv->platform_device->dev,
> > +                                      "Unknown keyboard type: %i",
> > +                                      val);
> > +                     }
> > +             }
> > +     }
> >  }
> >
> >  #if IS_ENABLED(CONFIG_ACPI_WMI)
> >
>
> --
>  i.
>

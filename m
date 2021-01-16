Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 182DEC433DB
	for <platform-driver-x86@archiver.kernel.org>; Sat, 16 Jan 2021 22:45:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D6E26206D8
	for <platform-driver-x86@archiver.kernel.org>; Sat, 16 Jan 2021 22:45:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726788AbhAPWpP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 16 Jan 2021 17:45:15 -0500
Received: from mail-40131.protonmail.ch ([185.70.40.131]:21265 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726785AbhAPWpO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 16 Jan 2021 17:45:14 -0500
Date:   Sat, 16 Jan 2021 22:44:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1610837072;
        bh=x+bi2ZHdqXJ4gnLKnwIwTsH4THY5AwTSumZOATZC0d4=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=udHQbg46LDoFedHixQ0h5xm6zn2kav9M9LCvkv1O4uNGKoS4Lzy0yWUxB/H+MB+uO
         AlkxC8X6gmaIAdQWmHYJzCTnyDqtc2KU6btS/WKFo4q3oM6UzfkTIH2OpO+xhefXqp
         Y70cBNzRVgMnCxqo1+0oVLcxk7H/QbHyZI0Ij9Wk=
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH v2 21/24] platform/x86: ideapad-laptop: add keyboard backlight control support
Message-ID: <IsMD9D-Q_PWUoLKzhXMQ8VK3xxRZJ9KYw1N6Yx3ClQerrFdp7KaGK0EZGbIPpIBHJ5sFYoUpJGE_mY2WFtDy_st4EgJw2AuX7gOgueO_Nqw=@protonmail.com>
In-Reply-To: <CAHp75VcSnygW5TgZePcF96uMk9et25doqxmWieMdbtaRb5hS4w@mail.gmail.com>
References: <20210113182016.166049-22-pobrn@protonmail.com> <CAHp75VcSnygW5TgZePcF96uMk9et25doqxmWieMdbtaRb5hS4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi


Thanks for the review.

2021. janu=C3=A1r 16., szombat 21:07 keltez=C3=A9ssel, Andy Shevchenko =
=C3=ADrta:

> On Wed, Jan 13, 2021 at 8:25 PM Barnab=C3=A1s P=C5=91cze wrote:
> >
> > On certain models it is possible to control/query the keyboard backligh=
t
> > via the SALS/HALS ACPI methods. Add support for that, and register an L=
ED
> > class device to expose this functionality.
> > Tested on: Lenovo YOGA 520-14IKB 80X8
>
> ...
>
> > +       struct {
> > +               bool initialized;
> > +               struct led_classdev led;
> > +               unsigned int last_brightness;
> > +       } kbd_bl;
>
> Data structure without sense.
>

It makes a lot of sense to me, it groups the members which are concerned wi=
th
keyboard backlight control. Do you have any specific issues with it? And
what would you suggest instead?


> ...
>
> > +static int ideapad_kbd_bl_brightness_get(struct ideapad_private *priv)
> > +{
> > +       unsigned long hals;
> > +       int err;
> > +
> > +       err =3D eval_hals(priv->adev->handle, &hals);
> > +       if (err)
> > +               return err;
> > +
> > +       return test_bit(HALS_KBD_BL_STATE_BIT, &hals);
>
> On some architectures IIRC it returns long (or unsigned long). Is it a pr=
oblem?
>

Potentially it is, but since it's an x86 platform driver, I failed to consi=
der
other architectures. Nonetheless, I will fix this in the next version.


> > +}
>
> ...
>
> > +static int ideapad_kbd_bl_init(struct ideapad_private *priv)
> > +{
> > +       int err;
> > +
> > +       if (!priv->features.kbd_bl)
> > +               return -ENODEV;
> > +
> > +       err =3D ideapad_kbd_bl_brightness_get(priv);
>
> > +       if (err < 0)
>
> Just to be sure, what positive code means here?
>

Non-zero return value is the brightness, negative return value is an error =
code.
I realize the name `err` is arguably not be the best, but if I were to rena=
me it to
`brightness`, then the `led_classdev_register()` call would look odd in my
opinion, and I wanted to avoid introducing two variables. But I think I'll =
do
just that in the next version.


> > +               return err;
> > +
> > +       priv->kbd_bl.last_brightness =3D err;
> > +
> > +       priv->kbd_bl.led.name                    =3D "platform::" LED_F=
UNCTION_KBD_BACKLIGHT;
> > +       priv->kbd_bl.led.max_brightness          =3D 1;
> > +       priv->kbd_bl.led.brightness_get          =3D ideapad_kbd_bl_led=
_cdev_brightness_get;
> > +       priv->kbd_bl.led.brightness_set_blocking =3D ideapad_kbd_bl_led=
_cdev_brightness_set;
> > +       priv->kbd_bl.led.flags                   =3D LED_BRIGHT_HW_CHAN=
GED;
> > +
> > +       err =3D led_classdev_register(&priv->platform_device->dev, &pri=
v->kbd_bl.led);
> > +       if (err)
> > +               return err;
> > +
> > +       priv->kbd_bl.initialized =3D true;
> > +
> > +       return 0;
> > +}
> [...]


Thanks,
Barnab=C3=A1s P=C5=91cze

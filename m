Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7325C433DB
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Jan 2021 20:43:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A045A23133
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Jan 2021 20:43:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727049AbhAFUnS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 6 Jan 2021 15:43:18 -0500
Received: from mail-40131.protonmail.ch ([185.70.40.131]:24994 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727347AbhAFUnS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 Jan 2021 15:43:18 -0500
Date:   Wed, 06 Jan 2021 20:42:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1609965756;
        bh=eHKvOafWM2PyzTxG+T/rUtZ+/x55b3/AOJZ00F5SXb0=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=kkPRphEI8oOzDWhiv2Wn6GJnQYN13f443RiePscSVkWjewSwq07R+ywKmo0KK7n6w
         DioPcMkxY1uZbmuaV/VihCFvrc3rCG9qs3ljXZKPD+PHVBLOPGWKTMbVAQyIg15Hix
         7L/4OxyEb1COttskSuzY53bPWtOEUM7DQ8aWHrdU=
To:     Hans de Goede <hdegoede@redhat.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH 00/24] platform/x86: ideapad-laptop: cleanup, keyboard backlight and "always on USB charging" control support, reenable touchpad control
Message-ID: <VyEaBfybpxjXgRWI6K6T6qT43oltoKntltcnoY4Q7TZZuOLauSxnMHHeQPVLLSTl0CIG6PDaOp_DJ1ZH1RVBFUqApVBLhKW91WDi8uEHHTc=@protonmail.com>
In-Reply-To: <d7fbc7ed-801e-0cc2-7433-a829e48f4ec8@redhat.com>
References: <20201216013857.360987-1-pobrn@protonmail.com> <d7fbc7ed-801e-0cc2-7433-a829e48f4ec8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi


2021. janu=C3=A1r 6., szerda 19:23 keltez=C3=A9ssel, Hans de Goede =C3=
=ADrta:

> [...]
> >  #include <acpi/video.h>
> > +#include <dt-bindings/leds/common.h>
> >  #include <linux/acpi.h>
> >  #include <linux/backlight.h>
> >  #include <linux/bitops.h>
> > @@ -22,6 +23,7 @@
> >  #include <linux/input/sparse-keymap.h>
> >  #include <linux/jiffies.h>
> >  #include <linux/kernel.h>
> > +#include <linux/leds.h>
> >  #include <linux/module.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/rfkill.h>
>
> I guess you need a "depends on LEDS_CLASS" in the Kconfig for this?
>

You're right, I was under the impression for some reason that leds.h define=
s
stub functions when LED support is disabled, it turns out that's not the ca=
se
(at least not for all functions). Interestingly, some other drivers "select=
"
LEDS_CLASS (e.g. thinkpad_acpi), others "depend" on it (e.g. alienware-wmi)=
...
I'm unsure about what should be done here.


> [...]
> > +static void ideapad_kbd_bl_notify(struct ideapad_private *priv)
> > +{
> > +=09int brightness;
> > +
> > +=09if (!priv->kbd_bl.initialized)
> > +=09=09return;
> > +
> > +=09brightness =3D ideapad_kbd_bl_brightness_get(priv);
> > +=09if (brightness < 0)
> > +=09=09return;
> > +
> > +=09if (brightness =3D=3D priv->kbd_bl.last_brightness)
> > +=09=09return;
> > +
> > +=09priv->kbd_bl.last_brightness =3D brightness;
> > +
> > +=09led_classdev_notify_brightness_hw_changed(&priv->kbd_bl.led, bright=
ness);
> > +}
>
> So I guess that there is some hotkey combo on the laptops keyboards which
> directly changes the state of the kbd backlight "underneath" us and that
> is why this is necessary ?
>

Yes, more specifically, Fn + space on the machine I tested it.


> > +
> > +static int ideapad_kbd_bl_init(struct ideapad_private *priv)
> > +{
> > +=09unsigned long hals;
> > +=09int err;
> > +
> > +=09err =3D eval_hals(priv->adev->handle, &hals);
> > +=09if (err)
> > +=09=09return err;
>
> So you are checking for presence of the HALS method here, but not
> for SALS which is being used in ideapad_kbd_bl_led_cdev_brightness_set()
> and you are needlessly re-evaluating HALS here. Would it not be better
> to add a features.kbd_bl flag and set that from ideapad_check_features()
> as done for other features ? That would avoid an extra evaluation of
> the HALS method and also check for SALS.
> [...]

You're right, it would be better.


Regards,
Barnab=C3=A1s P=C5=91cze

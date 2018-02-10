From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH][RfC] Some buttons on the Fujitsu u7[25]7 laptops are not
 working
Date: Sat, 10 Feb 2018 22:23:30 +0100
Message-ID: <20180210212330.GD2070@larwa.localdomain>
References: <69f33335-962b-f3be-da8e-2eeff1ae2a49@fbihome.de>
 <20180119234547.GB24590@marvin.atrad.com.au>
 <84b872ec-ba48-6423-cb7b-48f2c3ef30d2@fbihome.de>
 <e69cad3d-067b-5a22-0f4d-0c29691037c7@fbihome.de>
 <20180209113144.GC23589@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:32905 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751115AbeBJVXe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 10 Feb 2018 16:23:34 -0500
Received: by mail-lf0-f65.google.com with SMTP id t139so15751061lff.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 10 Feb 2018 13:23:33 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20180209113144.GC23589@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Jan-Marek Glogowski <glogow@fbihome.de>, platform-driver-x86@vger.kernel.org

> > > I don't know yet how to distinguish between a separate ECO button and the Fn button here.
> > > Have to recheck with the old HW to see, if some support flags are different now. The button is definitely not in the BTNI mask:
> > 
> > For the new u757 I get:
> > > [259964.060356] fujitsu_laptop: Flags supported: 0x26020320
> > > [259964.065143] fujitsu_laptop: BTNI: [0x10001]
> > 
> > For the old e736 I get:
> > > [ 3030.845786] fujitsu_laptop: Flag supported: 0x6020320
> > > [ 3030.850631] fujitsu_laptop: BTNI: [0x1010001]
> > 
> > BTNI difference seems to be the change from an RFKILL button to function
> > key, but that is just a guess.  The difference is actually two "button to
> > key" changes, but since ECO still emits a button press event, maybe that's
> > the single bit.
> 
> I cannot be sure since I only have a single example of Fujitsu hardware to
> work with.  It seems entirely feasible that the bit change in BTNI is due to
> the loss of the RFKILL button as a dedicated button.

This bit was already set on older models which did have a "dedicated"
radio toggle button.  See e.g. log message for commit 4f62568c1fcf
("fujitsu-laptop: Support radio LED").

Bit 29 in flags_supported looks promising, though.  I have not seen it
set on any older model, so it might denote models without any
"dedicated" hardware hotkeys.

> > >From e599b80cc23810cad7837b71cdc3dba0a5334443 Mon Sep 17 00:00:00 2001
> > From: Jan-Marek Glogowski <glogow@fbihome.de>
> > Date: Fri, 19 Jan 2018 21:48:22 +0100
> > Subject: [PATCH] Emit MICMUTE and RFKILL key events
> > 
> > Seems Fujitsu continues to move HW functionality into software.
> > These are my observations from the U727 and U757.
> > 
> > Fn+F1 is now a button to mute the microphone.
> > Fn+F5 is now the rfkill button.
> > Fn+F9 is now labeled ECO and emits a FUNC 0x1002 (args 0x1, 0x0,
> > 0x0) returned 0x40000413
> > 
> > So in addition to the still working KEY_TOUCHPAD_TOGGLE, we now
> > have to emit KEY_RFKILL for BIT(5) and KEY_MICMUTE for BIT(29).
> > 
> > Emitting the KEY_RFKILL will also correctly toggles the
> > corresponding led.
> > 
> > Signed-of-by: Jan-Marek Glogowski <glogow@fbihome.de>
> > ---
> >  drivers/platform/x86/fujitsu-laptop.c | 16 ++++++++++++----
> >  1 file changed, 12 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> > index 2cfbd3f..088cc10 100644
> > --- a/drivers/platform/x86/fujitsu-laptop.c
> > +++ b/drivers/platform/x86/fujitsu-laptop.c
> > @@ -455,7 +455,9 @@ static const struct key_entry keymap_default[] = {
> >  	{ KE_KEY, KEY3_CODE, { KEY_PROG3 } },
> >  	{ KE_KEY, KEY4_CODE, { KEY_PROG4 } },
> >  	{ KE_KEY, KEY5_CODE, { KEY_RFKILL } },
> > +	{ KE_KEY, BIT(5),    { KEY_RFKILL } },
> >  	{ KE_KEY, BIT(26),   { KEY_TOUCHPAD_TOGGLE } },
> > +	{ KE_KEY, BIT(29),   { KEY_MICMUTE } },
> >  	{ KE_END, 0 }
> >  };
> >  
> > @@ -899,7 +901,7 @@ static void acpi_fujitsu_laptop_release(struct acpi_device *device)
> >  static void acpi_fujitsu_laptop_notify(struct acpi_device *device, u32 event)
> >  {
> >  	struct fujitsu_laptop *priv = acpi_driver_data(device);
> > -	int scancode, i = 0;
> > +	int scancode, i = 0, funcret;
> >  	unsigned int irb;
> >  
> >  	if (event != ACPI_FUJITSU_NOTIFY_CODE1) {
> > @@ -930,9 +932,15 @@ static void acpi_fujitsu_laptop_notify(struct acpi_device *device, u32 event)
> >  	 * E736/E746/E756), the touchpad toggle hotkey (Fn+F4) is
> >  	 * handled in software; its state is queried using FUNC_FLAGS
> >  	 */
> > -	if ((priv->flags_supported & BIT(26)) &&
> > -	    (call_fext_func(device, FUNC_FLAGS, 0x1, 0x0, 0x0) & BIT(26)))
> > -		sparse_keymap_report_event(priv->input, BIT(26), 1, true);
> > +	if (priv->flags_supported & (BIT(5) | BIT(26) | BIT(29))) {
> > +		funcret = call_fext_func(device, FUNC_FLAGS, 0x1, 0x0, 0x0);
> > +		if (funcret & BIT(5))
> > +			sparse_keymap_report_event(priv->input, BIT(5), 1, true);
> > +		if (funcret & BIT(26))
> > +			sparse_keymap_report_event(priv->input, BIT(26), 1, true);
> > +		if (funcret & BIT(29))
> > +			sparse_keymap_report_event(priv->input, BIT(29), 1, true);
> > +	}
> >  }
> >  
> >  /* Initialization */
> 
> With the minor changes in place I do not think this patch will cause any
> regressions for other Fujitsu systems since it is only adding meaning to
> bits of the flags_supported field, and older system do not have those bits
> set.  Any comments Michel?

While the patch does not seem to break anything, I cannot say I like how
we are approaching this.

All Jan-Marek wrote suggests that Fujitsu decided to transition from one
way of handling hotkeys to another.  We need to handle both of them.
Until we learned about the new U series models, it looked like the
touchpad toggle hotkey was an exception to the rule.  Given what we know
now, it looks more like a harbinger of further changes.

For me, adding support for the new systems in an elegant way would mean:

  - detecting models without dedicated hotkeys and forcing an immediate
    release event when a "press" is detected on such models; we can take
    a shot at bit 29 being the indicator, the worst that is going to
    happen is that we will get double release events on some machines,

  - keeping GIRB and S000 keymaps separate as these two hotkey handling
    methods are completely different: the former utilizes a ring buffer,
    the latter relies on setting bits in the return value of a function
    and clearing them after they have been "retrieved"; the two keymaps
    would then have to be merged into a single sparse keymap upon device
    instantiation.

However, it is Jonathan who is the module maintainer and Jan-Marek's
patch does not break stuff.  I am thus happy to present my vision after
this patch gets merged.

And just to repeat what I wrote in another message, I would really like
to take a look at the acpidump from one of these new laptops.

By the way, sorry about being late to the party, but severe lack of
spare time pretty much prevents me from following this list.  CC'ing me
directly increases the odds of eliciting a response.

-- 
Best regards,
Michał Kępień

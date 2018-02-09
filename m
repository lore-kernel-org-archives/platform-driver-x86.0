From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH][RfC] Some buttons on the Fujitsu u7[25]7 laptops are not
 working
Date: Fri, 9 Feb 2018 22:01:44 +1030
Message-ID: <20180209113144.GC23589@marvin.atrad.com.au>
References: <69f33335-962b-f3be-da8e-2eeff1ae2a49@fbihome.de>
 <20180119234547.GB24590@marvin.atrad.com.au>
 <84b872ec-ba48-6423-cb7b-48f2c3ef30d2@fbihome.de>
 <e69cad3d-067b-5a22-0f4d-0c29691037c7@fbihome.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:60832 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750961AbeBILcD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 9 Feb 2018 06:32:03 -0500
Content-Disposition: inline
In-Reply-To: <e69cad3d-067b-5a22-0f4d-0c29691037c7@fbihome.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jan-Marek Glogowski <glogow@fbihome.de>
Cc: Micha?? K??pie?? <kernel@kempniu.pl>, platform-driver-x86@vger.kernel.org

On Fri, Feb 09, 2018 at 12:02:57PM +0100, Jan-Marek Glogowski wrote:
> Am 22.01.2018 um 11:16 schrieb Jan-Marek Glogowski:
> >> Does your new hardware emit keycodes for the volume buttons (which would
> >> presumedly be picked up by ACPI)?  If so it's a bit odd that they'd include
> >> this functionality and yet leave the mute out of it.  Still, if that's what
> >> they've done then that's what we have to work with.
> > 
> > It does. Normal volume keys are handled by the keyboard driver, so probably some userspace program handles this.
> > 
> >> I guess the question is whether it is necessary to add the mute handling to
> >> fujitsu-laptop, or whether a more appropriate change is to allow APCI to
> >> handle it natively.  That in turn comes down to what the hardware can
> >> actually do.
> 
> I'm still not following this. What you mean by "what the hardware can do"?

It's just a comment about how the mute button should be handled.  Since ACPI
appears to already handle the volume function without kernel intervention,
the question is whether it could also handle the mute function.  One would
be tempted to conclude that it can't or else the button events would already
be passed through (as are the volume buttons), but history has shown that
this may not necessarily be the case.

> > The main remaining problem is the missing release event for the ECO / KEY_PROG4.
> > Like all buttons the ACPI events are generated on release.
> > When releasing the button it, this results in:
> > 
> > [Mo Jan 22 08:37:09 2018] ACPI: \_SB_.FEXT: fujitsu_laptop: FUNC 0x1000 (args 0x4, 0x0, 0x0) returned 0x320
> > [Mo Jan 22 08:37:09 2018] ACPI: \_SB_.FEXT: fujitsu_laptop: Flags state     0x00000320
> > [Mo Jan 22 08:37:09 2018] ACPI: \_SB_.FEXT: fujitsu_laptop: FUNC 0x1002 (args 0x1, 0x0, 0x0) returned 0x40000413
> > [Mo Jan 22 08:37:09 2018] input input21: Push scancode into ringbuffer [0x413]
> > [Mo Jan 22 08:37:09 2018] ACPI: \_SB_.FEXT: fujitsu_laptop: FUNC 0x1002 (args 0x1, 0x0, 0x0) returned 0x0
> > [Mo Jan 22 08:37:09 2018] ACPI: \_SB_.FEXT: fujitsu_laptop: FUNC 0x1000 (args 0x1, 0x0, 0x0) returned 0x0
> > 
> > I don't know yet how to distinguish between a separate ECO button and the Fn button here.
> > Have to recheck with the old HW to see, if some support flags are different now. The button is definitely not in the BTNI mask:
> 
> For the new u757 I get:
> > [259964.060356] fujitsu_laptop: Flags supported: 0x26020320
> > [259964.065143] fujitsu_laptop: BTNI: [0x10001]
> 
> For the old e736 I get:
> > [ 3030.845786] fujitsu_laptop: Flag supported: 0x6020320
> > [ 3030.850631] fujitsu_laptop: BTNI: [0x1010001]
> 
> BTNI difference seems to be the change from an RFKILL button to function
> key, but that is just a guess.  The difference is actually two "button to
> key" changes, but since ECO still emits a button press event, maybe that's
> the single bit.

I cannot be sure since I only have a single example of Fujitsu hardware to
work with.  It seems entirely feasible that the bit change in BTNI is due to
the loss of the RFKILL button as a dedicated button.

> And I realized we never use the value from BTNI, except when deciding to
> register the "fujitsu::kblamps" led, FWIW.

It's useful for that purpose.

> > And pressing the brightness-up or -down buttons doesn't change the backlight in KDE5.
> > Guess I'm facing the "Xorg modeset = no backlight" problem everyone has (since 2016-06): https://bugs.freedesktop.org/show_bug.cgi?id=96572
> 
> I fixed this for me (4.4 Ubuntu kernel) by using the old CADL patchset
> backported for 4.4 from Jani Nikular.  The link is just an reference, as I
> have four patches from the original development:
> https://lists.freedesktop.org/archives/intel-gfx/2016-August/105351.html
> 
> Then I need some additional HDA pin quirks for the headset microphone:
> http://mailman.alsa-project.org/pipermail/alsa-devel/2018-January/131049.html
> 
> And I'll hopefully get a "rfkill-any" backport into Ubuntu 4.4:
> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1745130

So where does this leave us with fujitsu-laptop?  I *think* the backlight
issue is beyond our control.  Is that your take on the subject?

> >From e599b80cc23810cad7837b71cdc3dba0a5334443 Mon Sep 17 00:00:00 2001
> From: Jan-Marek Glogowski <glogow@fbihome.de>
> Date: Fri, 19 Jan 2018 21:48:22 +0100
> Subject: [PATCH] Emit MICMUTE and RFKILL key events
> 
> Seems Fujitsu continues to move HW functionality into software.
> These are my observations from the U727 and U757.
> 
> Fn+F1 is now a button to mute the microphone.
> Fn+F5 is now the rfkill button.
> Fn+F9 is now labeled ECO and emits a FUNC 0x1002 (args 0x1, 0x0,
> 0x0) returned 0x40000413
> 
> So in addition to the still working KEY_TOUCHPAD_TOGGLE, we now
> have to emit KEY_RFKILL for BIT(5) and KEY_MICMUTE for BIT(29).
> 
> Emitting the KEY_RFKILL will also correctly toggles the
> corresponding led.
> 
> Signed-of-by: Jan-Marek Glogowski <glogow@fbihome.de>
> ---
>  drivers/platform/x86/fujitsu-laptop.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> index 2cfbd3f..088cc10 100644
> --- a/drivers/platform/x86/fujitsu-laptop.c
> +++ b/drivers/platform/x86/fujitsu-laptop.c
> @@ -455,7 +455,9 @@ static const struct key_entry keymap_default[] = {
>  	{ KE_KEY, KEY3_CODE, { KEY_PROG3 } },
>  	{ KE_KEY, KEY4_CODE, { KEY_PROG4 } },
>  	{ KE_KEY, KEY5_CODE, { KEY_RFKILL } },
> +	{ KE_KEY, BIT(5),    { KEY_RFKILL } },
>  	{ KE_KEY, BIT(26),   { KEY_TOUCHPAD_TOGGLE } },
> +	{ KE_KEY, BIT(29),   { KEY_MICMUTE } },
>  	{ KE_END, 0 }
>  };
>  
> @@ -899,7 +901,7 @@ static void acpi_fujitsu_laptop_release(struct acpi_device *device)
>  static void acpi_fujitsu_laptop_notify(struct acpi_device *device, u32 event)
>  {
>  	struct fujitsu_laptop *priv = acpi_driver_data(device);
> -	int scancode, i = 0;
> +	int scancode, i = 0, funcret;
>  	unsigned int irb;
>  
>  	if (event != ACPI_FUJITSU_NOTIFY_CODE1) {
> @@ -930,9 +932,15 @@ static void acpi_fujitsu_laptop_notify(struct acpi_device *device, u32 event)
>  	 * E736/E746/E756), the touchpad toggle hotkey (Fn+F4) is
>  	 * handled in software; its state is queried using FUNC_FLAGS
>  	 */
> -	if ((priv->flags_supported & BIT(26)) &&
> -	    (call_fext_func(device, FUNC_FLAGS, 0x1, 0x0, 0x0) & BIT(26)))
> -		sparse_keymap_report_event(priv->input, BIT(26), 1, true);
> +	if (priv->flags_supported & (BIT(5) | BIT(26) | BIT(29))) {
> +		funcret = call_fext_func(device, FUNC_FLAGS, 0x1, 0x0, 0x0);
> +		if (funcret & BIT(5))
> +			sparse_keymap_report_event(priv->input, BIT(5), 1, true);
> +		if (funcret & BIT(26))
> +			sparse_keymap_report_event(priv->input, BIT(26), 1, true);
> +		if (funcret & BIT(29))
> +			sparse_keymap_report_event(priv->input, BIT(29), 1, true);
> +	}
>  }
>  
>  /* Initialization */

With the minor changes in place I do not think this patch will cause any
regressions for other Fujitsu systems since it is only adding meaning to
bits of the flags_supported field, and older system do not have those bits
set.  Any comments Michel?

Reviewed-by: Jonathan Woithe <jwoithe@just42.net>

Regards
  jonathan

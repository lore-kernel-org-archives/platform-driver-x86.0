From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: Some buttons on the Fujitsu u7[25]7 laptops are not working
Date: Sat, 20 Jan 2018 10:15:47 +1030
Message-ID: <20180119234547.GB24590@marvin.atrad.com.au>
References: <69f33335-962b-f3be-da8e-2eeff1ae2a49@fbihome.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:42294 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755132AbeATACF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 19 Jan 2018 19:02:05 -0500
Content-Disposition: inline
In-Reply-To: <69f33335-962b-f3be-da8e-2eeff1ae2a49@fbihome.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jan-Marek Glogowski <glogow@fbihome.de>
Cc: platform-driver-x86@vger.kernel.org

Hi Jan-Marek

On Fri, Jan 19, 2018 at 11:40:11PM +0100, Jan-Marek Glogowski wrote:
> I (not so) recently got new Fujitsu Skylake hardware (u7[25]7) from our HW
> service provider to replace the e7x6 series and finally found some time to
> start fixing the issues on Linux.  So just like 1 1/2 years ago some
> buttons don't work.
> 
> And again the brightness buttons are broken - that's on current Ubuntu
> Bionic AKA some 4.13 kernel, which should have all the i915 patches I
> backported to fix these problems for us (AKA LiMux) in 2016.
> 
> But the appended patch at least fixes the rfkill button and emits a
> keycode for the microphone mute button.
> 
> I'm still pondering about the microphone mute.  Should this be handled
> like the all the other volume buttons, which seem to work without touching
> the fujitsu-laptop.c driver?  I have no idea how these other buttons are
> forwarded to the sound drivers.  And I'm still wondering about the ECO
> button, which is still handled via FUNC 0x1002, which was previously just
> used for extra HW buttons.

Regarding the volume buttons, as you have observed fujitsu-laptop hasn't
ever had to deal with them before.  On the Fujitsu hardware I have access to
the volume and mute buttons are handled through the standard ACPI subsystem:
fujitsu-laptop doesn't play any part.  The ACPI actions generated are
"volumeup", "volumedown" and "mute".  These can be bound to userspace mixer
tools to effect the desired outcome.

Does your new hardware emit keycodes for the volume buttons (which would
presumedly be picked up by ACPI)?  If so it's a bit odd that they'd include
this functionality and yet leave the mute out of it.  Still, if that's what
they've done then that's what we have to work with.

I guess the question is whether it is necessary to add the mute handling to
fujitsu-laptop, or whether a more appropriate change is to allow APCI to
handle it natively.  That in turn comes down to what the hardware can
actually do.

> So please have a look at my preliminary patch.  I don't have the HW with
> me on the weekend, so won't be able to answer questions regarding the HW
> before Monday.

I would be interested to read Michel's take on the apparent need for these
changes too.

> P.S.  this patch not only toggles the rfkill led but correctly sets the
> software rfkill status (which IMHO is as important as the correct led
> status).

Agreed.

> P.P.S.  if someone has a good idea how to "route" the touchpad toggle key
> to the touchpad drivers without involving the userspace via evrouter, that
> would be nice too.

Sorry, I can't help with that.

> From: Jan-Marek Glogowski <glogow@fbihome.de>
> Date: Fri, 19 Jan 2018 21:48:22 +0100
> Subject: [PATCH] Emit some more button events
> 
> Seems Fujitsu continues to move HW functionality into software.
> These are my observations from the U727.
> 
> Fn+F1 is now a button to mute the microphone.
> Fn+F5 is now the rfkill button.
> Fn+F9 is now labeled ECO and emits a FUNC 0x1002 (args 0x1, 0x0,
> 0x0) returned 0x40000413

For reference, on the S7020 F1 and F5 have no "Fn" function while F9 is
"volume up.  There is no ambiguity regarding F1 and F5 at least with this
hardware so this patch shouldn't create conflict there.  If the newly moved
ECO function were to be hooked it would probably need to be done dependent
on model.

> So in addition to the still working KEY_TOUCHPAD_TOGGLE, we now
> have to emit KEY_RFKILL for BIT(5) and KEY_MICMUTE for BIT(29).
> 
> Emitting the KEY_RFKILL will also correctly toggle the
> corresponding led.
> ---
>  fujitsu-laptop.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/fujitsu-laptop.c b/fujitsu-laptop.c
> index e31ecfa..f784e89 100644
> --- a/fujitsu-laptop.c
> +++ b/fujitsu-laptop.c
> @@ -462,6 +462,8 @@ static const struct key_entry keymap_default[] = {
>         { KE_KEY, KEY4_CODE, { KEY_PROG4 } },
>         { KE_KEY, KEY5_CODE, { KEY_RFKILL } },
>         { KE_KEY, BIT(26),   { KEY_TOUCHPAD_TOGGLE } },
> +       { KE_KEY, BIT(5),    { KEY_RFKILL } },
> +       { KE_KEY, BIT(29),   { KEY_MICMUTE } },
>         { KE_END, 0 }
>  };
> 
> @@ -915,7 +917,7 @@ static void acpi_fujitsu_laptop_release(struct acpi_device *device)
>  static void acpi_fujitsu_laptop_notify(struct acpi_device *device, u32 event)
>  {
>         struct fujitsu_laptop *priv = acpi_driver_data(device);
> -       int scancode, i = 0;
> +       int scancode, i = 0, funcret;
>         unsigned int irb;
> 
>         if (event != ACPI_FUJITSU_NOTIFY_CODE1) {
> @@ -949,9 +951,15 @@ static void acpi_fujitsu_laptop_notify(struct acpi_device *device, u32 event)
>          * E736/E746/E756), the touchpad toggle hotkey (Fn+F4) is
>          * handled in software; its state is queried using FUNC_FLAGS
>          */
> -       if ((priv->flags_supported & BIT(26)) &&
> -           (call_fext_func(device, FUNC_FLAGS, 0x1, 0x0, 0x0) & BIT(26)))
> -               sparse_keymap_report_event(priv->input, BIT(26), 1, true);
> +       if (priv->flags_supported & (BIT(26) | BIT(5) | BIT(29))) {
> +               funcret = call_fext_func(device, FUNC_FLAGS, 0x1, 0x0, 0x0);
> +               if (funcret & BIT(29))
> +                       sparse_keymap_report_event(priv->input, BIT(29), 1, true);
> +               else if (funcret & BIT(26))
> +                       sparse_keymap_report_event(priv->input, BIT(26), 1, true);
> +               else if (funcret & BIT(5))
> +                       sparse_keymap_report_event(priv->input, BIT(5), 1, true);
> +       }
>  }

This looks reaonable to me.  However, I'm wondering whether the "else if"
construct is the right thing to use here.  If it were possible for the
hardware to flag more than one of these buttons at once then "funcret"
will obviously have more than one of the bits set.  The code above would
only report the key corresponding to the highest set bit.

Previously we only had to handle a single key so we have no prior experience
to draw on.

Regards
  jonathan

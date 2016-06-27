From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH] fujitsu-laptop: Support touchpad toggle hotkey on
 Skylake-based models
Date: Mon, 27 Jun 2016 22:18:21 +0930
Message-ID: <20160627124821.GB1544@marvin.atrad.com.au>
References: <20160625091522.GA6423@eudyptula.hq.kempniu.pl>
 <1466926895-7830-1-git-send-email-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:54306 "EHLO
	server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751673AbcF0MvU (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 27 Jun 2016 08:51:20 -0400
Content-Disposition: inline
In-Reply-To: <1466926895-7830-1-git-send-email-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, Jan-Marek Glogowski <glogow@fbihome.de>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Jun 26, 2016 at 09:41:35AM +0200, Micha?? K??pie?? wrote:
> Haswell-based Fujitsu laptops (Lifebook E734/E744/E754) have a touchpad
> toggle hotkey (Fn+F4) which is handled transparently to the operating
> system: while an ACPI notification is sent to FUJ02B1 when Fn+F4 is
> pressed, touchpad state is properly toggled without any explicit support
> for this operation in fujitsu-laptop.
> :

I am happy with the patch code once the one-line fix from Jan-Marek is
included.  However, given the rather non-intuitive behaviour that the patch
is dealing with I wonder whether a short (2 line) comment in the code might
be justified.  There is otherwise no obvious reason why the touchpad button
code must interact with the rf kill hardware.

Please respin the patch with the above in mind (and inlude Jan-Marek's fix).

Regards
  jonathan

> Skylake-based models (Lifebook E736/E746/E756) also have that hotkey,
> but the touchpad is not toggled transparently to the operating system.
> When Fn+F4 is pressed, an ACPI notification is sent to FUJ02E3.  A
> subsequent call to S000 (FUNC_RFKILL) can be used to determine whether
> the touchpad toggle hotkey was pressed so that an input event can be
> sent to userspace.
> 
> Relevant ACPI code:
> 
>     Method (_L21, 0, NotSerialized)
>     {
>         ...
>         If (AHKF)
>         {
>             Notify (\_SB.FEXT, 0x80)
>         }
>         ...
>     }
> 
>     Method (S000, 3, Serialized)
>     {
>         Name (_T_0, Zero)
>         Local0 = Zero
>         While (One)
>         {
>             _T_0 = Arg0
>             If (_T_0 == Zero)
>             {
>                 Local0 |= 0x04000000
>                 Local0 |= 0x02000000
>                 Local0 |= 0x00020000
>                 Local0 |= 0x0200
>                 Local0 |= 0x0100
>                 Local0 |= 0x20
>             }
>             ElseIf (_T_0 == One)
>             {
>                 ...
>                 If (AHKF & 0x08)
>                 {
>                 Local0 |= 0x04000000
>                 AHKF ^= 0x08
>                 }
>                 ...
>             } ...
>             Break
>         }
>         Return (Local0)
>     }
> 
> Pressing Fn+F4 raises GPE 0x21 and sets bit 3 in AHKF.  This in turn
> results in bit 26 being set in the value returned by FUNC_RFKILL called
> with 1 as its first argument.  On Skylake-based models, bit 26 is also
> set in the value returned by FUNC_RFKILL called with 0 as its first
> argument (this value is saved in fujitsu_hotkey->rfkill_supported upon
> module initialization), which suggests that this bit is set on models
> which do not handle touchpad toggling transparently to the operating
> system.
> 
> Note that bit 3 is cleared in AHKF once FUNC_RFKILL is called with 1 as
> its first argument, which requires fujitsu-laptop to handle this hotkey
> in a different manner than the other, GIRB-based hotkeys: two input
> events (press and release) are immediately sent once Fn+F4 is pressed.
> 
> Reported-by: Jan-Marek Glogowski <glogow@fbihome.de>
> Signed-off-by: Micha?? K??pie?? <kernel@kempniu.pl>
> ---
> 
> Darren, this patch needs both an Acked-by from Jonathan and a Tested-by
> from Jan-Marek before merging as I do not have the hardware to test it.
> 
>  drivers/platform/x86/fujitsu-laptop.c |    9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> index ce41bc3..ef28447 100644
> --- a/drivers/platform/x86/fujitsu-laptop.c
> +++ b/drivers/platform/x86/fujitsu-laptop.c
> @@ -1060,6 +1060,15 @@ static void acpi_fujitsu_hotkey_notify(struct acpi_device *device, u32 event)
>  			}
>  		}
>  
> +		if ((fujitsu_hotkey->rfkill_supported & BIT(26)) &&
> +		    (call_fext_func(FUNC_RFKILL, 0x1, 0x0, 0x0) & BIT(26))) {
> +			keycode = KEY_TOUCHPAD_TOGGLE;
> +			input_report_key(input, keycode, 1);
> +			input_sync(input);
> +			input_report_key(input, keycode, 0);
> +			input_sync(input);
> +		}
> +
>  		break;
>  	default:
>  		keycode = KEY_UNKNOWN;
> -- 
> 1.7.10.4

-- 

From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH v3] fujitsu-laptop: Support touchpad toggle hotkey on
 Skylake-based models
Date: Tue, 28 Jun 2016 20:49:22 +0930
Message-ID: <20160628111922.GA4256@marvin.atrad.com.au>
References: <20160628010609.GC26713@marvin.atrad.com.au>
 <1467098750-2742-1-git-send-email-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:54646 "EHLO
	server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752095AbcF1LUK (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 28 Jun 2016 07:20:10 -0400
Content-Disposition: inline
In-Reply-To: <1467098750-2742-1-git-send-email-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, Jan-Marek Glogowski <glogow@fbihome.de>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jun 28, 2016 at 09:25:50AM +0200, Micha?? K??pie?? wrote:
> Haswell-based Fujitsu laptops (Lifebook E734/E744/E754) have a touchpad
> toggle hotkey (Fn+F4) which is handled transparently to the operating
> system: while an ACPI notification is sent to FUJ02B1 when Fn+F4 is
> pressed, touchpad state is properly toggled without any explicit support
> for this operation in fujitsu-laptop.
> 
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
> Reported-and-tested-by: Jan-Marek Glogowski <glogow@fbihome.de>
> Signed-off-by: Micha?? K??pie?? <kernel@kempniu.pl>

Thanks for the revision and your patience.

Acked-by: Jonathan Woithe <jwoithe@just42.net>

Regards
  jonathan

> ---
> 
> Changes from v2:
> 
>   - edited code comment so that it defines "some models" more precisely.
> 
> Changes from v1:
> 
>   - added KEY_TOUCHPAD_TOGGLE to the FUJ02E3 input device's key bitmap,
> 
>   - added code comment.
> 
>  drivers/platform/x86/fujitsu-laptop.c |   14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> index ce41bc3..36cd743 100644
> --- a/drivers/platform/x86/fujitsu-laptop.c
> +++ b/drivers/platform/x86/fujitsu-laptop.c
> @@ -856,6 +856,7 @@ static int acpi_fujitsu_hotkey_add(struct acpi_device *device)
>  	set_bit(fujitsu->keycode3, input->keybit);
>  	set_bit(fujitsu->keycode4, input->keybit);
>  	set_bit(fujitsu->keycode5, input->keybit);
> +	set_bit(KEY_TOUCHPAD_TOGGLE, input->keybit);
>  	set_bit(KEY_UNKNOWN, input->keybit);
>  
>  	error = input_register_device(input);
> @@ -1060,6 +1061,19 @@ static void acpi_fujitsu_hotkey_notify(struct acpi_device *device, u32 event)
>  			}
>  		}
>  
> +		/* On some models (first seen on the Skylake-based Lifebook
> +		 * E736/E746/E756), the touchpad toggle hotkey (Fn+F4) is
> +		 * handled in software; its state is queried using FUNC_RFKILL
> +		 */
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

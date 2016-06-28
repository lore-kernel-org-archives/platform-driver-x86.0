From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH v2] fujitsu-laptop: Support touchpad toggle hotkey on
 Skylake-based models
Date: Tue, 28 Jun 2016 10:36:09 +0930
Message-ID: <20160628010609.GC26713@marvin.atrad.com.au>
References: <20160627124821.GB1544@marvin.atrad.com.au>
 <1467033581-2865-1-git-send-email-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:54471 "EHLO
	server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752020AbcF1BHB (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 27 Jun 2016 21:07:01 -0400
Content-Disposition: inline
In-Reply-To: <1467033581-2865-1-git-send-email-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, Jan-Marek Glogowski <glogow@fbihome.de>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Jun 27, 2016 at 03:19:41PM +0200, Micha?? K??pie?? wrote:
> Haswell-based Fujitsu laptops (Lifebook E734/E744/E754) have a touchpad
> toggle hotkey (Fn+F4) which is handled transparently to the operating
> system: while an ACPI notification is sent to FUJ02B1 when Fn+F4 is
> pressed, touchpad state is properly toggled without any explicit support
> for this operation in fujitsu-laptop.
> 
> Skylake-based models (Lifebook E736/E746/E756) also have that hotkey,
> but the touchpad is not toggled transparently to the operating system.
> :
> Reported-and-tested-by: Jan-Marek Glogowski <glogow@fbihome.de>
> Signed-off-by: Micha?? K??pie?? <kernel@kempniu.pl>

A nitpick: in the patch, rather than "some models", perhaps explicitly
mention some of them.  For example:

  On some models (first seen on the Skylake-based Lifebook E736/E746/E756),
  the touchpad ...

I know this pushes the comment to 3 lines, but it results in a solid
indication in the code as to where and why the change was first needed.

Otherwise, all good.

Regards
  jonathan

> ---
> 
> Changes from v1:
> 
>   - added KEY_TOUCHPAD_TOGGLE to the FUJ02E3 input device's key bitmap,
> 
>   - added code comment.
> 
>  drivers/platform/x86/fujitsu-laptop.c |   13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> index ce41bc3..37ef75e 100644
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
> @@ -1060,6 +1061,18 @@ static void acpi_fujitsu_hotkey_notify(struct acpi_device *device, u32 event)
>  			}
>  		}
>  
> +		/* On some models, the touchpad toggle hotkey (Fn+F4) is
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

From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH 1/4] platform/x86: fujitsu-laptop: decrease indentation
 in acpi_fujitsu_hotkey_notify()
Date: Fri, 13 Jan 2017 23:08:13 +1030
Message-ID: <20170113123813.GC9036@marvin.atrad.com.au>
References: <20170111085933.2486-1-kernel@kempniu.pl>
 <20170111085933.2486-2-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:36166 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751516AbdAMMu3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 13 Jan 2017 07:50:29 -0500
Content-Disposition: inline
In-Reply-To: <20170111085933.2486-2-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jan 11, 2017 at 09:59:30AM +0100, Micha?? K??pie?? wrote:
> acpi_fujitsu_hotkey_notify() is pretty deeply nested, which hurts
> readability.  Strip off one level of indentation by returning early when
> the event code supplied as argument is not ACPI_FUJITSU_NOTIFY_CODE1.
> 
> Signed-off-by: Micha?? K??pie?? <kernel@kempniu.pl>

Acked-by: Jonathan Woithe <jwoithe@just42.net>

> ---
> Changes introduced by this patch are best viewed when whitespace changes
> are ignored.
> 
>  drivers/platform/x86/fujitsu-laptop.c | 152 +++++++++++++++++-----------------
>  1 file changed, 75 insertions(+), 77 deletions(-)
> 
> diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> index b725a907a91f..c2022f8af51b 100644
> --- a/drivers/platform/x86/fujitsu-laptop.c
> +++ b/drivers/platform/x86/fujitsu-laptop.c
> @@ -1039,98 +1039,96 @@ static void acpi_fujitsu_hotkey_notify(struct acpi_device *device, u32 event)
>  
>  	input = fujitsu_hotkey->input;
>  
> +	if (event != ACPI_FUJITSU_NOTIFY_CODE1) {
> +		keycode = KEY_UNKNOWN;
> +		vdbg_printk(FUJLAPTOP_DBG_WARN,
> +			    "Unsupported event [0x%x]\n", event);
> +		input_report_key(input, keycode, 1);
> +		input_sync(input);
> +		input_report_key(input, keycode, 0);
> +		input_sync(input);
> +		return;
> +	}
> +
>  	if (fujitsu_hotkey->rfkill_supported)
>  		fujitsu_hotkey->rfkill_state =
>  			call_fext_func(FUNC_RFKILL, 0x4, 0x0, 0x0);
>  
> -	switch (event) {
> -	case ACPI_FUJITSU_NOTIFY_CODE1:
> -		i = 0;
> -		while ((irb =
> -			call_fext_func(FUNC_BUTTONS, 0x1, 0x0, 0x0)) != 0
> -				&& (i++) < MAX_HOTKEY_RINGBUFFER_SIZE) {
> -			switch (irb & 0x4ff) {
> -			case KEY1_CODE:
> -				keycode = fujitsu->keycode1;
> -				break;
> -			case KEY2_CODE:
> -				keycode = fujitsu->keycode2;
> -				break;
> -			case KEY3_CODE:
> -				keycode = fujitsu->keycode3;
> -				break;
> -			case KEY4_CODE:
> -				keycode = fujitsu->keycode4;
> -				break;
> -			case KEY5_CODE:
> -				keycode = fujitsu->keycode5;
> -				break;
> -			case 0:
> -				keycode = 0;
> -				break;
> -			default:
> +	i = 0;
> +	while ((irb =
> +		call_fext_func(FUNC_BUTTONS, 0x1, 0x0, 0x0)) != 0
> +			&& (i++) < MAX_HOTKEY_RINGBUFFER_SIZE) {
> +		switch (irb & 0x4ff) {
> +		case KEY1_CODE:
> +			keycode = fujitsu->keycode1;
> +			break;
> +		case KEY2_CODE:
> +			keycode = fujitsu->keycode2;
> +			break;
> +		case KEY3_CODE:
> +			keycode = fujitsu->keycode3;
> +			break;
> +		case KEY4_CODE:
> +			keycode = fujitsu->keycode4;
> +			break;
> +		case KEY5_CODE:
> +			keycode = fujitsu->keycode5;
> +			break;
> +		case 0:
> +			keycode = 0;
> +			break;
> +		default:
> +			vdbg_printk(FUJLAPTOP_DBG_WARN,
> +				    "Unknown GIRB result [%x]\n", irb);
> +			keycode = -1;
> +			break;
> +		}
> +		if (keycode > 0) {
> +			vdbg_printk(FUJLAPTOP_DBG_TRACE,
> +				"Push keycode into ringbuffer [%d]\n",
> +				keycode);
> +			status = kfifo_in_locked(&fujitsu_hotkey->fifo,
> +					   (unsigned char *)&keycode,
> +					   sizeof(keycode),
> +					   &fujitsu_hotkey->fifo_lock);
> +			if (status != sizeof(keycode)) {
>  				vdbg_printk(FUJLAPTOP_DBG_WARN,
> -					    "Unknown GIRB result [%x]\n", irb);
> -				keycode = -1;
> -				break;
> +				    "Could not push keycode [0x%x]\n",
> +				    keycode);
> +			} else {
> +				input_report_key(input, keycode, 1);
> +				input_sync(input);
>  			}
> -			if (keycode > 0) {
> +		} else if (keycode == 0) {
> +			while ((status =
> +				kfifo_out_locked(
> +				 &fujitsu_hotkey->fifo,
> +				 (unsigned char *) &keycode_r,
> +				 sizeof(keycode_r),
> +				 &fujitsu_hotkey->fifo_lock))
> +				 == sizeof(keycode_r)) {
> +				input_report_key(input, keycode_r, 0);
> +				input_sync(input);
>  				vdbg_printk(FUJLAPTOP_DBG_TRACE,
> -					"Push keycode into ringbuffer [%d]\n",
> -					keycode);
> -				status = kfifo_in_locked(&fujitsu_hotkey->fifo,
> -						   (unsigned char *)&keycode,
> -						   sizeof(keycode),
> -						   &fujitsu_hotkey->fifo_lock);
> -				if (status != sizeof(keycode)) {
> -					vdbg_printk(FUJLAPTOP_DBG_WARN,
> -					    "Could not push keycode [0x%x]\n",
> -					    keycode);
> -				} else {
> -					input_report_key(input, keycode, 1);
> -					input_sync(input);
> -				}
> -			} else if (keycode == 0) {
> -				while ((status =
> -					kfifo_out_locked(
> -					 &fujitsu_hotkey->fifo,
> -					 (unsigned char *) &keycode_r,
> -					 sizeof(keycode_r),
> -					 &fujitsu_hotkey->fifo_lock))
> -					 == sizeof(keycode_r)) {
> -					input_report_key(input, keycode_r, 0);
> -					input_sync(input);
> -					vdbg_printk(FUJLAPTOP_DBG_TRACE,
> -					  "Pop keycode from ringbuffer [%d]\n",
> -					  keycode_r);
> -				}
> +				  "Pop keycode from ringbuffer [%d]\n",
> +				  keycode_r);
>  			}
>  		}
> +	}
>  
> -		/* On some models (first seen on the Skylake-based Lifebook
> -		 * E736/E746/E756), the touchpad toggle hotkey (Fn+F4) is
> -		 * handled in software; its state is queried using FUNC_RFKILL
> -		 */
> -		if ((fujitsu_hotkey->rfkill_supported & BIT(26)) &&
> -		    (call_fext_func(FUNC_RFKILL, 0x1, 0x0, 0x0) & BIT(26))) {
> -			keycode = KEY_TOUCHPAD_TOGGLE;
> -			input_report_key(input, keycode, 1);
> -			input_sync(input);
> -			input_report_key(input, keycode, 0);
> -			input_sync(input);
> -		}
> -
> -		break;
> -	default:
> -		keycode = KEY_UNKNOWN;
> -		vdbg_printk(FUJLAPTOP_DBG_WARN,
> -			    "Unsupported event [0x%x]\n", event);
> +	/* On some models (first seen on the Skylake-based Lifebook
> +	 * E736/E746/E756), the touchpad toggle hotkey (Fn+F4) is
> +	 * handled in software; its state is queried using FUNC_RFKILL
> +	 */
> +	if ((fujitsu_hotkey->rfkill_supported & BIT(26)) &&
> +	    (call_fext_func(FUNC_RFKILL, 0x1, 0x0, 0x0) & BIT(26))) {
> +		keycode = KEY_TOUCHPAD_TOGGLE;
>  		input_report_key(input, keycode, 1);
>  		input_sync(input);
>  		input_report_key(input, keycode, 0);
>  		input_sync(input);
> -		break;
>  	}
> +
>  }
>  
>  /* Initialization */
> -- 
> 2.11.0

-- 

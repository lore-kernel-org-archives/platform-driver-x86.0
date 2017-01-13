From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH 2/4] platform/x86: fujitsu-laptop: move keycode
 processing to separate functions
Date: Fri, 13 Jan 2017 23:08:29 +1030
Message-ID: <20170113123829.GD9036@marvin.atrad.com.au>
References: <20170111085933.2486-1-kernel@kempniu.pl>
 <20170111085933.2486-3-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:36166 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751444AbdAMMu1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 13 Jan 2017 07:50:27 -0500
Content-Disposition: inline
In-Reply-To: <20170111085933.2486-3-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jan 11, 2017 at 09:59:31AM +0100, Micha?? K??pie?? wrote:
> acpi_fujitsu_hotkey_notify() is pretty deeply nested, which hurts
> readability.  Move the keycode processing part to two separate functions
> to make the code easier to understand and save a few line breaks.
> Rename variable keycode_r to keycode as there is no longer any need to
> differentiate between the two.  Tweak indentations to make checkpatch
> happy.
> 
> Signed-off-by: Micha?? K??pie?? <kernel@kempniu.pl>

Acked-by: Jonathan Woithe <jwoithe@just42.net>

> ---
>  drivers/platform/x86/fujitsu-laptop.c | 76 ++++++++++++++++++++---------------
>  1 file changed, 43 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> index c2022f8af51b..e57d3724d2ce 100644
> --- a/drivers/platform/x86/fujitsu-laptop.c
> +++ b/drivers/platform/x86/fujitsu-laptop.c
> @@ -1030,12 +1030,48 @@ static int acpi_fujitsu_hotkey_remove(struct acpi_device *device)
>  	return 0;
>  }
>  
> +static void acpi_fujitsu_hotkey_press(int keycode)
> +{
> +	struct input_dev *input = fujitsu_hotkey->input;
> +	int status;
> +
> +	vdbg_printk(FUJLAPTOP_DBG_TRACE,
> +		    "Push keycode into ringbuffer [%d]\n", keycode);
> +	status = kfifo_in_locked(&fujitsu_hotkey->fifo,
> +				 (unsigned char *)&keycode, sizeof(keycode),
> +				 &fujitsu_hotkey->fifo_lock);
> +	if (status != sizeof(keycode)) {
> +		vdbg_printk(FUJLAPTOP_DBG_WARN,
> +			    "Could not push keycode [0x%x]\n", keycode);
> +	} else {
> +		input_report_key(input, keycode, 1);
> +		input_sync(input);
> +	}
> +}
> +
> +static void acpi_fujitsu_hotkey_release(void)
> +{
> +	struct input_dev *input = fujitsu_hotkey->input;
> +	int keycode, status;
> +
> +	while ((status = kfifo_out_locked(&fujitsu_hotkey->fifo,
> +					  (unsigned char *)&keycode,
> +					  sizeof(keycode),
> +					  &fujitsu_hotkey->fifo_lock))
> +					  == sizeof(keycode)) {
> +		input_report_key(input, keycode, 0);
> +		input_sync(input);
> +		vdbg_printk(FUJLAPTOP_DBG_TRACE,
> +			    "Pop keycode from ringbuffer [%d]\n", keycode);
> +	}
> +}
> +
>  static void acpi_fujitsu_hotkey_notify(struct acpi_device *device, u32 event)
>  {
>  	struct input_dev *input;
> -	int keycode, keycode_r;
> +	int keycode;
>  	unsigned int irb = 1;
> -	int i, status;
> +	int i;
>  
>  	input = fujitsu_hotkey->input;
>  
> @@ -1083,37 +1119,11 @@ static void acpi_fujitsu_hotkey_notify(struct acpi_device *device, u32 event)
>  			keycode = -1;
>  			break;
>  		}
> -		if (keycode > 0) {
> -			vdbg_printk(FUJLAPTOP_DBG_TRACE,
> -				"Push keycode into ringbuffer [%d]\n",
> -				keycode);
> -			status = kfifo_in_locked(&fujitsu_hotkey->fifo,
> -					   (unsigned char *)&keycode,
> -					   sizeof(keycode),
> -					   &fujitsu_hotkey->fifo_lock);
> -			if (status != sizeof(keycode)) {
> -				vdbg_printk(FUJLAPTOP_DBG_WARN,
> -				    "Could not push keycode [0x%x]\n",
> -				    keycode);
> -			} else {
> -				input_report_key(input, keycode, 1);
> -				input_sync(input);
> -			}
> -		} else if (keycode == 0) {
> -			while ((status =
> -				kfifo_out_locked(
> -				 &fujitsu_hotkey->fifo,
> -				 (unsigned char *) &keycode_r,
> -				 sizeof(keycode_r),
> -				 &fujitsu_hotkey->fifo_lock))
> -				 == sizeof(keycode_r)) {
> -				input_report_key(input, keycode_r, 0);
> -				input_sync(input);
> -				vdbg_printk(FUJLAPTOP_DBG_TRACE,
> -				  "Pop keycode from ringbuffer [%d]\n",
> -				  keycode_r);
> -			}
> -		}
> +
> +		if (keycode > 0)
> +			acpi_fujitsu_hotkey_press(keycode);
> +		else if (keycode == 0)
> +			acpi_fujitsu_hotkey_release();
>  	}
>  
>  	/* On some models (first seen on the Skylake-based Lifebook
> -- 
> 2.11.0

-- 

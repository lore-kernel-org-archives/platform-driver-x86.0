From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH] fujitsu-laptop: Support radio toggle button
Date: Thu, 25 Feb 2016 08:45:33 +1030
Message-ID: <20160224221533.GA8860@marvin.atrad.com.au>
References: <1456320212-18127-1-git-send-email-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:42957 "EHLO
	server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756716AbcBXWgP (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 24 Feb 2016 17:36:15 -0500
Content-Disposition: inline
In-Reply-To: <1456320212-18127-1-git-send-email-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Feb 24, 2016 at 02:23:32PM +0100, Micha?? K??pie?? wrote:
> Lifebook E734/E744/E754 has a radio toggle button which uses code 0x420.
> Map it to KEY_RFKILL.
> 
> Signed-off-by: Micha?? K??pie?? <kernel@kempniu.pl>

Acked-by: Jonathan Woithe <jwoithe@just42.net>

> ---
> Tested on a Lifebook E744.
> 
>  drivers/platform/x86/fujitsu-laptop.c |    8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> index 1c62caf..ffc84cc 100644
> --- a/drivers/platform/x86/fujitsu-laptop.c
> +++ b/drivers/platform/x86/fujitsu-laptop.c
> @@ -114,6 +114,7 @@
>  #define KEY2_CODE	0x411
>  #define KEY3_CODE	0x412
>  #define KEY4_CODE	0x413
> +#define KEY5_CODE	0x420
>  
>  #define MAX_HOTKEY_RINGBUFFER_SIZE 100
>  #define RINGBUFFERSIZE 40
> @@ -149,7 +150,7 @@ struct fujitsu_t {
>  	char phys[32];
>  	struct backlight_device *bl_device;
>  	struct platform_device *pf_device;
> -	int keycode1, keycode2, keycode3, keycode4;
> +	int keycode1, keycode2, keycode3, keycode4, keycode5;
>  
>  	unsigned int max_brightness;
>  	unsigned int brightness_changed;
> @@ -823,6 +824,7 @@ static int acpi_fujitsu_hotkey_add(struct acpi_device *device)
>  	set_bit(fujitsu->keycode2, input->keybit);
>  	set_bit(fujitsu->keycode3, input->keybit);
>  	set_bit(fujitsu->keycode4, input->keybit);
> +	set_bit(fujitsu->keycode5, input->keybit);
>  	set_bit(KEY_UNKNOWN, input->keybit);
>  
>  	error = input_register_device(input);
> @@ -962,6 +964,9 @@ static void acpi_fujitsu_hotkey_notify(struct acpi_device *device, u32 event)
>  			case KEY4_CODE:
>  				keycode = fujitsu->keycode4;
>  				break;
> +			case KEY5_CODE:
> +				keycode = fujitsu->keycode5;
> +				break;
>  			case 0:
>  				keycode = 0;
>  				break;
> @@ -1072,6 +1077,7 @@ static int __init fujitsu_init(void)
>  	fujitsu->keycode2 = KEY_PROG2;
>  	fujitsu->keycode3 = KEY_PROG3;
>  	fujitsu->keycode4 = KEY_PROG4;
> +	fujitsu->keycode5 = KEY_RFKILL;
>  	dmi_check_system(fujitsu_dmi_table);
>  
>  	result = acpi_bus_register_driver(&acpi_fujitsu_driver);
> -- 
> 1.7.10.4

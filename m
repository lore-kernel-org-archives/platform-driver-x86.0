From: jlee@suse.com
Subject: Re: [PATCH v4 2/2] platform/x86: acer-wmi: add another KEY_WLAN
 keycode
Date: Tue, 14 Feb 2017 08:35:15 +0800
Message-ID: <20170214003515.trhbvkxy6tq2bpsp@linux-rasp2>
References: <20170208135141.2105-1-drake@endlessm.com>
 <20170208135141.2105-2-drake@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:49665 "EHLO
        smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751694AbdBNAfc (ORCPT
        <rfc822;groupwise-platform-driver-x86@vger.kernel.org:0:0>);
        Mon, 13 Feb 2017 19:35:32 -0500
Content-Disposition: inline
In-Reply-To: <20170208135141.2105-2-drake@endlessm.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Daniel Drake <drake@endlessm.com>
Cc: dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux@endlessm.com, chiu@endlessm.com

On Wed, Feb 08, 2017 at 07:51:41AM -0600, Daniel Drake wrote:
> From: Chris Chiu <chiu@endlessm.com>
> 
> Now that we have informed the firmware that the RF Button driver is
> active, laptops such as the Acer TravelMate P238-M will generate
> a WMI key event with code 0x86 when the Fn+F3 airplane mode key is
> pressed.
> 
> Add this keycode to the table so that it is converted to an appropriate
> input event.
> 
> Signed-off-by: Chris Chiu <chiu@endlessm.com>
> Signed-off-by: Daniel Drake <drake@endlessm.com>

Reviewed-by: Lee, Chun-Yi <jlee@suse.com>


Thanks for your patches!

Joey Lee

> ---
>  drivers/platform/x86/acer-wmi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> v3: split off this change from the original patch
> 
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> index 3795d3f..0568c1a 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -128,6 +128,7 @@ static const struct key_entry acer_wmi_keymap[] __initconst = {
>  	{KE_KEY, KEY_TOUCHPAD_OFF, {KEY_TOUCHPAD_OFF} },
>  	{KE_IGNORE, 0x83, {KEY_TOUCHPAD_TOGGLE} },
>  	{KE_KEY, 0x85, {KEY_TOUCHPAD_TOGGLE} },
> +	{KE_KEY, 0x86, {KEY_WLAN} },
>  	{KE_END, 0}
>  };
>  
> -- 
> 2.9.3
> 

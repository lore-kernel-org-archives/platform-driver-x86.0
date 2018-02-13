From: Laszlo Toth <laszlth@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-laptop: merge fill_request and
 send_request
Date: Tue, 13 Feb 2018 22:32:14 +0100
Message-ID: <20180213213214.GA7419@laszlth>
References: <20180213211617.GA7117@laszlth>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:37594 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965749AbeBMVcR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Feb 2018 16:32:17 -0500
Received: by mail-wm0-f65.google.com with SMTP id v71so18510478wmv.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Feb 2018 13:32:16 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20180213211617.GA7117@laszlth>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Mario Limonciello <mario.limonciello@dell.com>, platform-driver-x86@vger.kernel.org

On Tue, Feb 13, 2018 at 10:16:17PM +0100, Laszlo Toth wrote:
> Merged fill_request and send_request as they're used in pairs anyway so
> it's easier to check and harder to change the request values by mistake.
> 
> In a later commit the parameter count can be reduced.
> 
> Signed-off-by: Laszlo Toth <laszlth@gmail.com>
> ---
>  drivers/platform/x86/dell-laptop.c | 117 ++++++++++++++++++++-----------------
>  1 file changed, 65 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
> index a37cff9..30e6987 100644
> --- a/drivers/platform/x86/dell-laptop.c
> +++ b/drivers/platform/x86/dell-laptop.c
> @@ -321,20 +321,17 @@ static const struct dmi_system_id dell_quirks[] __initconst = {
>  	{ }
>  };
>  
> -static void dell_fill_request(struct calling_interface_buffer *buffer,
> -			       u32 arg0, u32 arg1, u32 arg2, u32 arg3)
> +static int dell_send_request(struct calling_interface_buffer *buffer,
> +			     u16 class, u16 select,
> +			     u32 arg0, u32 arg1, u32 arg2, u32 arg3)
>  {
> +	int ret;
> +
>  	memset(buffer, 0, sizeof(struct calling_interface_buffer));
>  	buffer->input[0] = arg0;
>  	buffer->input[1] = arg1;
>  	buffer->input[2] = arg2;
>  	buffer->input[3] = arg3;
> -}
> -
> -static int dell_send_request(struct calling_interface_buffer *buffer,
> -			     u16 class, u16 select)
> -{
> -	int ret;
>  
>  	buffer->cmd_class = class;
>  	buffer->cmd_select = select;
> @@ -474,14 +471,16 @@ static int dell_rfkill_set(void *data, bool blocked)
>  	int status;
>  	int ret;
>  
> -	dell_fill_request(&buffer, 0, 0, 0, 0);
> -	ret = dell_send_request(&buffer, CLASS_INFO, SELECT_RFKILL);
> +	ret = dell_send_request(&buffer,
> +				CLASS_INFO, SELECT_RFKILL,
> +				0, 0, 0, 0);
>  	if (ret)
>  		return ret;
>  	status = buffer.output[1];
>  
> -	dell_fill_request(&buffer, 0x2, 0, 0, 0);
> -	ret = dell_send_request(&buffer, CLASS_INFO, SELECT_RFKILL);
> +	ret = dell_send_request(&buffer,
> +				CLASS_INFO, SELECT_RFKILL,
> +				0x2, 0, 0, 0);
>  	if (ret)
>  		return ret;
>  	hwswitch = buffer.output[1];
> @@ -492,8 +491,9 @@ static int dell_rfkill_set(void *data, bool blocked)
>  	    (status & BIT(0)) && !(status & BIT(16)))
>  		disable = 1;
>  
> -	dell_fill_request(&buffer, 1 | (radio<<8) | (disable << 16), 0, 0, 0);
> -	ret = dell_send_request(&buffer, CLASS_INFO, SELECT_RFKILL);
> +	ret = dell_send_request(&buffer,
> +				CLASS_INFO, SELECT_RFKILL,
> +				1 | (radio << 8) | (disable << 16), 0, 0, 0);
>  	return ret;
>  }
>  
> @@ -504,9 +504,9 @@ static void dell_rfkill_update_sw_state(struct rfkill *rfkill, int radio,
>  		/* Has hw-switch, sync sw_state to BIOS */
>  		struct calling_interface_buffer buffer;
>  		int block = rfkill_blocked(rfkill);
> -		dell_fill_request(&buffer,
> -				   1 | (radio << 8) | (block << 16), 0, 0, 0);
> -		dell_send_request(&buffer, CLASS_INFO, SELECT_RFKILL);
> +		dell_send_request(&buffer,
> +				  CLASS_INFO, SELECT_RFKILL,
> +				  1 | (radio << 8) | (block << 16), 0, 0, 0);
>  	} else {
>  		/* No hw-switch, sync BIOS state to sw_state */
>  		rfkill_set_sw_state(rfkill, !!(status & BIT(radio + 16)));
> @@ -528,16 +528,18 @@ static void dell_rfkill_query(struct rfkill *rfkill, void *data)
>  	int status;
>  	int ret;
>  
> -	dell_fill_request(&buffer, 0, 0, 0, 0);
> -	ret = dell_send_request(&buffer, CLASS_INFO, SELECT_RFKILL);
> +	ret = dell_send_request(&buffer,
> +				CLASS_INFO, SELECT_RFKILL,
> +				0, 0, 0, 0);
>  	status = buffer.output[1];
>  
>  	if (ret != 0 || !(status & BIT(0))) {
>  		return;
>  	}
>  
> -	dell_fill_request(&buffer, 0, 0x2, 0, 0);
> -	ret = dell_send_request(&buffer, CLASS_INFO, SELECT_RFKILL);
> +	ret = dell_send_request(&buffer,
> +				CLASS_INFO, SELECT_RFKILL,
> +				0, 0x2, 0, 0);
>  	hwswitch = buffer.output[1];
>  
>  	if (ret != 0)
> @@ -561,14 +563,16 @@ static int dell_debugfs_show(struct seq_file *s, void *data)
>  	int status;
>  	int ret;
>  
> -	dell_fill_request(&buffer, 0, 0, 0, 0);
> -	ret = dell_send_request(&buffer, CLASS_INFO, SELECT_RFKILL);
> +	ret = dell_send_request(&buffer,
> +				CLASS_INFO, SELECT_RFKILL,
> +				0, 0, 0, 0);
>  	if (ret)
>  		return ret;
>  	status = buffer.output[1];
>  
> -	dell_fill_request(&buffer, 0, 0x2, 0, 0);
> -	hwswitch_ret = dell_send_request(&buffer, CLASS_INFO, SELECT_RFKILL);
> +	hwswitch_ret = dell_send_request(&buffer,
> +					 CLASS_INFO, SELECT_RFKILL,
> +					 0, 0x2, 0, 0);
>  	if (hwswitch_ret)
>  		return hwswitch_ret;
>  	hwswitch_state = buffer.output[1];
> @@ -645,15 +649,17 @@ static void dell_update_rfkill(struct work_struct *ignored)
>  	int status;
>  	int ret;
>  
> -	dell_fill_request(&buffer, 0, 0, 0, 0);
> -	ret = dell_send_request(&buffer, CLASS_INFO, SELECT_RFKILL);
> +	ret = dell_send_request(&buffer,
> +				CLASS_INFO, SELECT_RFKILL,
> +				0, 0, 0, 0);
>  	status = buffer.output[1];
>  
>  	if (ret != 0)
>  		return;
>  
> -	dell_fill_request(&buffer, 0, 0x2, 0, 0);
> -	ret = dell_send_request(&buffer, CLASS_INFO, SELECT_RFKILL);
> +	ret = dell_send_request(&buffer,
> +				CLASS_INFO, SELECT_RFKILL,
> +				0, 0x2, 0, 0);
>  
>  	if (ret == 0 && (status & BIT(0)))
>  		hwswitch = buffer.output[1];
> @@ -730,8 +736,9 @@ static int __init dell_setup_rfkill(void)
>  	if (!force_rfkill && !whitelisted)
>  		return 0;
>  
> -	dell_fill_request(&buffer, 0, 0, 0, 0);
> -	ret = dell_send_request(&buffer, CLASS_INFO, SELECT_RFKILL);
> +	ret = dell_send_request(&buffer,
> +				CLASS_INFO, SELECT_RFKILL,
> +				0, 0, 0, 0);
>  	status = buffer.output[1];
>  
>  	/* dell wireless info smbios call is not supported */
> @@ -893,14 +900,16 @@ static int dell_send_intensity(struct backlight_device *bd)
>  	if (!token)
>  		return -ENODEV;
>  
> -	dell_fill_request(&buffer,
> -			   token->location, bd->props.brightness, 0, 0);
>  	if (power_supply_is_system_supplied() > 0)
>  		ret = dell_send_request(&buffer,
> -					CLASS_TOKEN_WRITE, SELECT_TOKEN_AC);
> +					CLASS_TOKEN_WRITE, SELECT_TOKEN_AC,
> +					token->location, bd->props.brightness,
> +					0, 0);
>  	else
>  		ret = dell_send_request(&buffer,
> -					CLASS_TOKEN_WRITE, SELECT_TOKEN_BAT);
> +					CLASS_TOKEN_WRITE, SELECT_TOKEN_BAT,
> +					token->location, bd->props.brightness,
> +					0, 0);
>  
>  	return ret;
>  }
> @@ -915,13 +924,14 @@ static int dell_get_intensity(struct backlight_device *bd)
>  	if (!token)
>  		return -ENODEV;
>  
> -	dell_fill_request(&buffer, token->location, 0, 0, 0);
>  	if (power_supply_is_system_supplied() > 0)
>  		ret = dell_send_request(&buffer,
> -					CLASS_TOKEN_READ, SELECT_TOKEN_AC);
> +					CLASS_TOKEN_READ, SELECT_TOKEN_AC,
> +					token->location, 0, 0, 0);
>  	else
>  		ret = dell_send_request(&buffer,
> -					CLASS_TOKEN_READ, SELECT_TOKEN_BAT);
> +					CLASS_TOKEN_READ, SELECT_TOKEN_BAT,
> +					token->location, 0, 0, 0);
>  
>  	if (ret == 0)
>  		ret = buffer.output[1];
> @@ -1194,9 +1204,9 @@ static int kbd_get_info(struct kbd_info *info)
>  	u8 units;
>  	int ret;
>  
> -	dell_fill_request(&buffer, 0, 0, 0, 0);
>  	ret = dell_send_request(&buffer,
> -				CLASS_KBD_BACKLIGHT, SELECT_KBD_BACKLIGHT);
> +				CLASS_KBD_BACKLIGHT, SELECT_KBD_BACKLIGHT,
> +				0, 0, 0, 0);
>  	if (ret)
>  		return ret;
>  
> @@ -1279,9 +1289,9 @@ static int kbd_get_state(struct kbd_state *state)
>  	struct calling_interface_buffer buffer;
>  	int ret;
>  
> -	dell_fill_request(&buffer, 0x1, 0, 0, 0);
>  	ret = dell_send_request(&buffer,
> -				CLASS_KBD_BACKLIGHT, SELECT_KBD_BACKLIGHT);
> +				CLASS_KBD_BACKLIGHT, SELECT_KBD_BACKLIGHT,
> +				0x1, 0, 0, 0);
>  	if (ret)
>  		return ret;
>  
> @@ -1316,9 +1326,9 @@ static int kbd_set_state(struct kbd_state *state)
>  	input2 |= (state->level & 0xFF) << 16;
>  	input2 |= (state->timeout_value_ac & 0x3F) << 24;
>  	input2 |= (state->timeout_unit_ac & 0x3) << 30;
> -	dell_fill_request(&buffer, 0x2, input1, input2, 0);
>  	ret = dell_send_request(&buffer,
> -				CLASS_KBD_BACKLIGHT, SELECT_KBD_BACKLIGHT);
> +				CLASS_KBD_BACKLIGHT, SELECT_KBD_BACKLIGHT,
> +				0x2, input1, input2, 0);
>  
>  	return ret;
>  }
> @@ -1356,8 +1366,9 @@ static int kbd_set_token_bit(u8 bit)
>  	if (!token)
>  		return -EINVAL;
>  
> -	dell_fill_request(&buffer, token->location, token->value, 0, 0);
> -	ret = dell_send_request(&buffer, CLASS_TOKEN_WRITE, SELECT_TOKEN_STD);
> +	ret = dell_send_request(&buffer,
> +				CLASS_TOKEN_WRITE, SELECT_TOKEN_STD,
> +				token->location, token->value, 0, 0);
>  
>  	return ret;
>  }
> @@ -1376,8 +1387,9 @@ static int kbd_get_token_bit(u8 bit)
>  	if (!token)
>  		return -EINVAL;
>  
> -	dell_fill_request(&buffer, token->location, 0, 0, 0);
> -	ret = dell_send_request(&buffer, CLASS_TOKEN_READ, SELECT_TOKEN_STD);
> +	ret = dell_send_request(&buffer,
> +				CLASS_TOKEN_READ, SELECT_TOKEN_STD,
> +				token->location, 0, 0, 0);
>  	val = buffer.output[1];
>  
>  	if (ret)
> @@ -2127,8 +2139,9 @@ int dell_micmute_led_set(int state)
>  	if (!token)
>  		return -ENODEV;
>  
> -	dell_fill_request(&buffer, token->location, token->value, 0, 0);
> -	dell_send_request(&buffer, CLASS_TOKEN_WRITE, SELECT_TOKEN_STD);
> +	dell_send_request(&buffer,
> +			  CLASS_TOKEN_WRITE, SELECT_TOKEN_STD,
> +			  token->location, token->value, 0, 0);
>  
>  	return state;
>  }
> @@ -2185,9 +2198,9 @@ static int __init dell_init(void)
>  	if (token) {
>  		struct calling_interface_buffer buffer;
>  
> -		dell_fill_request(&buffer, token->location, 0, 0, 0);
>  		ret = dell_send_request(&buffer,
> -					CLASS_TOKEN_READ, SELECT_TOKEN_AC);
> +					CLASS_TOKEN_READ, SELECT_TOKEN_AC,
> +					token->location, 0, 0, 0);
>  		if (ret)
>  			max_intensity = buffer.output[3];
>  	}
> -- 
> 2.7.4
> 

Answer to Pali from the prev. thread (before splitting):

"Hi!
I agree, there are a lot of 0s just to overwrite a 0 with 0
after memset.
So filling the buffer args could be improved regardless of my patch,
after that the merged function wouldn't have so many.
But for now I just changed them to one call. This way it won't have
to pass buffer ptr twice to 2 functions "chained" together and
already full of params to send a request.
There is one called and job done.

You're right in general, but this one is kinda special:
it does what you want _and_ holds the values you need to do that, too.
So this isn't a heavily used and modified function call I think, more
like a define without an actual define.

With these in mind I think it's better like this, you just check the
last line and done. That's how I found the typo in the other commit
as after &buffer it was invisible. I thought it might help."

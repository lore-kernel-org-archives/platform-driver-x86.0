From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Subject: Re: [PATCH v2 2/3] platform/x86: dell-wmi: add new keymap type 0x0012
Date: Tue, 9 Jun 2020 01:33:03 +0200
Message-ID: <20200608233303.57ubv4rxo4tnaaxa@pali>
References: <cover.1591584631.git.y.linux@paritcher.com>
 <cover.1591656154.git.y.linux@paritcher.com>
 <74fdb288757cf5970a558f920f531b3bd1c51b47.1591656154.git.y.linux@paritcher.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <74fdb288757cf5970a558f920f531b3bd1c51b47.1591656154.git.y.linux@paritcher.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Y Paritcher <y.linux@paritcher.com>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, Mario.Limonciello@dell.com
List-Id: platform-driver-x86.vger.kernel.org

On Monday 08 June 2020 19:05:29 Y Paritcher wrote:
> These are events with extended data. The extended data is
> currently ignored as userspace does not have a way to deal
> it.
> 
> Ignore event with a type of 0x0012 and a code of 0xe035, as
> the keyboard controller takes care of Fn lock events by itself.

Nice! This is information which is really important and need to have it
documented.

> This silences the following messages being logged when
> pressing the Fn-lock key on a Dell Inspiron 5593:
> 
> dell_wmi: Unknown WMI event type 0x12
> dell_wmi: Unknown key with type 0x0012 and code 0xe035 pressed
> 
> This is consistent with the behavior for the Fn-lock key
> elsewhere in this file.
> 
> Signed-off-by: Y Paritcher <y.linux@paritcher.com>

I'm fine with this patch now.

Reviewed-by: Pali Rohár <pali@kernel.org>

> ---
>  drivers/platform/x86/dell-wmi.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
> index 0b2edfe2767d..6b510f8431a3 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c
> @@ -334,6 +334,15 @@ static const struct key_entry dell_wmi_keymap_type_0011[] = {
>  	{ KE_IGNORE, KBD_LED_AUTO_100_TOKEN, { KEY_RESERVED } },
>  };
>  
> +/*
> + * Keymap for WMI events of type 0x0012
> + * They are events with extended data
> + */
> +static const struct key_entry dell_wmi_keymap_type_0012[] = {
> +	/* Fn-lock button pressed */
> +	{ KE_IGNORE, 0xe035, { KEY_RESERVED } },
> +};
> +
>  static void dell_wmi_process_key(struct wmi_device *wdev, int type, int code)
>  {
>  	struct dell_wmi_priv *priv = dev_get_drvdata(&wdev->dev);
> @@ -418,10 +427,11 @@ static void dell_wmi_notify(struct wmi_device *wdev,
>  
>  		switch (buffer_entry[1]) {
>  		case 0x0000: /* One key pressed or event occurred */
> +		case 0x0012: /* Event with extended data occurred */

Mario, are you able to get some official documentation for these 0x0012
event types? I think it could be really useful for community so they can
understand and add easily new type of code and events. Because currently
we are just guessing what it could be. (It is sequence? Or single event?
Or single event with extended data? It is generic event? Or it is real
keypress? etc...)

>  			if (len > 2)
>  				dell_wmi_process_key(wdev, 0x0000,
>  						     buffer_entry[2]);
> -			/* Other entries could contain additional information */
> +			/* Extended data is currently ignored */
>  			break;
>  		case 0x0010: /* Sequence of keys pressed */
>  		case 0x0011: /* Sequence of events occurred */
> @@ -556,6 +566,7 @@ static int dell_wmi_input_setup(struct wmi_device *wdev)
>  			 ARRAY_SIZE(dell_wmi_keymap_type_0000) +
>  			 ARRAY_SIZE(dell_wmi_keymap_type_0010) +
>  			 ARRAY_SIZE(dell_wmi_keymap_type_0011) +
> +			 ARRAY_SIZE(dell_wmi_keymap_type_0012) +
>  			 1,
>  			 sizeof(struct key_entry), GFP_KERNEL);
>  	if (!keymap) {
> @@ -600,6 +611,13 @@ static int dell_wmi_input_setup(struct wmi_device *wdev)
>  		pos++;
>  	}
>  
> +	/* Append table with events of type 0x0012 */
> +	for (i = 0; i < ARRAY_SIZE(dell_wmi_keymap_type_0012); i++) {
> +		keymap[pos] = dell_wmi_keymap_type_0012[i];
> +		keymap[pos].code |= (0x0012 << 16);
> +		pos++;
> +	}
> +
>  	/*
>  	 * Now append also table with "legacy" events of type 0x0000. Some of
>  	 * them are reported also on laptops which have scancodes in DMI.
> -- 
> 2.27.0
> 

From: Anisse Astier <anisse@astier.eu>
Subject: Re: [PATCH v4 11/12] msi-wmi: Introduced quirk_last_pressed
Date: Thu, 20 Dec 2012 18:02:20 +0100
Message-ID: <20121220180220.627277d2@destiny.ordissimo>
References: <1355592696-15454-1-git-send-email-maxtram95@gmail.com>
	<1355592696-15454-12-git-send-email-maxtram95@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:32901 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751035Ab2LTRKp (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 20 Dec 2012 12:10:45 -0500
Received: by mail-wi0-f178.google.com with SMTP id hn3so2152798wib.17
        for <platform-driver-x86@vger.kernel.org>; Thu, 20 Dec 2012 09:10:44 -0800 (PST)
In-Reply-To: <1355592696-15454-12-git-send-email-maxtram95@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Maxim Mikityanskiy <maxtram95@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, jlee@suse.com

On Sat, 15 Dec 2012 19:31:35 +0200, Maxim Mikityanskiy <maxtram95@gmail.com> wrote :

> Introduced quirk_last_pressed variable that would indicate if
> last_pressed is used or not. Also converted last_pressed to simple
> variable in order to allow keymap to be non-contiguous.
> 
> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
Acked-by: Anisse Astier <anisse@astier.eu>
> ---
>  drivers/platform/x86/msi-wmi.c | 54 ++++++++++++++++++++++--------------------
>  1 file changed, 28 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/platform/x86/msi-wmi.c b/drivers/platform/x86/msi-wmi.c
> index 3a60619..739bd4d 100644
> --- a/drivers/platform/x86/msi-wmi.c
> +++ b/drivers/platform/x86/msi-wmi.c
> @@ -43,8 +43,7 @@ MODULE_ALIAS("wmi:" MSIWMI_BIOS_GUID);
>  MODULE_ALIAS("wmi:" MSIWMI_EVENT_GUID);
>  
>  enum msi_scancodes {
> -	MSI_SCANCODE_BASE	= 0xD0,
> -	MSI_KEY_BRIGHTNESSUP	= MSI_SCANCODE_BASE,
> +	MSI_KEY_BRIGHTNESSUP	= 0xD0,
>  	MSI_KEY_BRIGHTNESSDOWN,
>  	MSI_KEY_VOLUMEUP,
>  	MSI_KEY_VOLUMEDOWN,
> @@ -58,7 +57,9 @@ static struct key_entry msi_wmi_keymap[] = {
>  	{ KE_KEY, MSI_KEY_MUTE,			{KEY_MUTE} },
>  	{ KE_END, 0 }
>  };
> -static ktime_t last_pressed[ARRAY_SIZE(msi_wmi_keymap) - 1];
> +
> +static ktime_t last_pressed;
> +static bool quirk_last_pressed;
>  
>  static const char *event_wmi_guid;
>  
> @@ -153,7 +154,6 @@ static void msi_wmi_notify(u32 value, void *context)
>  	struct acpi_buffer response = { ACPI_ALLOCATE_BUFFER, NULL };
>  	static struct key_entry *key;
>  	union acpi_object *obj;
> -	ktime_t cur;
>  	acpi_status status;
>  
>  	status = wmi_get_event_data(value, &response);
> @@ -169,12 +169,15 @@ static void msi_wmi_notify(u32 value, void *context)
>  		pr_debug("Eventcode: 0x%x\n", eventcode);
>  		key = sparse_keymap_entry_from_scancode(msi_wmi_input_dev,
>  				eventcode);
> -		if (key) {
> -			ktime_t diff;
> -			cur = ktime_get_real();
> -			diff = ktime_sub(cur, last_pressed[key->code -
> -					MSI_SCANCODE_BASE]);
> -			/* Ignore event if the same event happened in a 50 ms
> +		if (!key) {
> +			pr_info("Unknown key pressed - %x\n", eventcode);
> +			goto msi_wmi_notify_exit;
> +		}
> +
> +		if (quirk_last_pressed) {
> +			ktime_t cur = ktime_get_real();
> +			ktime_t diff = ktime_sub(cur, last_pressed);
> +			/* Ignore event if any event happened in a 50 ms
>  			   timeframe -> Key press may result in 10-20 GPEs */
>  			if (ktime_to_us(diff) < 1000 * 50) {
>  				pr_debug("Suppressed key event 0x%X - "
> @@ -182,21 +185,19 @@ static void msi_wmi_notify(u32 value, void *context)
>  					 key->code, ktime_to_us(diff));
>  				goto msi_wmi_notify_exit;
>  			}
> -			last_pressed[key->code - MSI_SCANCODE_BASE] = cur;
> -
> -			if (key->type == KE_KEY &&
> -			/* Brightness is served via acpi video driver */
> -			(backlight ||
> -			(key->code != MSI_KEY_BRIGHTNESSUP &&
> -			key->code != MSI_KEY_BRIGHTNESSDOWN))) {
> -				pr_debug("Send key: 0x%X - "
> -					 "Input layer keycode: %d\n",
> -					 key->code, key->keycode);
> -				sparse_keymap_report_entry(msi_wmi_input_dev,
> -						key, 1, true);
> -			}
> -		} else
> -			pr_info("Unknown key pressed - %x\n", eventcode);
> +			last_pressed = cur;
> +		}
> +
> +		if (key->type == KE_KEY &&
> +		/* Brightness is served via acpi video driver */
> +		(backlight ||
> +		(key->code != MSI_KEY_BRIGHTNESSUP &&
> +		key->code != MSI_KEY_BRIGHTNESSDOWN))) {
> +			pr_debug("Send key: 0x%X - Input layer keycode: %d\n",
> +				 key->code, key->keycode);
> +			sparse_keymap_report_entry(msi_wmi_input_dev, key, 1,
> +						   true);
> +		}
>  	} else
>  		pr_info("Unknown event received\n");
>  
> @@ -250,7 +251,7 @@ static int __init msi_wmi_input_setup(void)
>  	if (err)
>  		goto err_free_keymap;
>  
> -	memset(last_pressed, 0, sizeof(last_pressed));
> +	last_pressed = ktime_set(0, 0);
>  
>  	return 0;
>  
> @@ -281,6 +282,7 @@ static int __init msi_wmi_init(void)
>  
>  		pr_debug("Event handler installed\n");
>  		event_wmi_guid = MSIWMI_EVENT_GUID;
> +		quirk_last_pressed = true;
>  	}
>  
>  	if (wmi_has_guid(MSIWMI_BIOS_GUID) && !acpi_video_backlight_support()) {

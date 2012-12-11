From: Anisse Astier <anisse@astier.eu>
Subject: Re: [PATCH v3 11/12] msi-wmi: Introduced quirk_last_pressed
Date: Tue, 11 Dec 2012 17:29:30 +0100
Message-ID: <20121211172930.0490654a@destiny.ordissimo>
References: <1354888162-12109-1-git-send-email-maxtram95@gmail.com>
	<1354888162-12109-12-git-send-email-maxtram95@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:36647 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752962Ab2LKQ3s (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 11 Dec 2012 11:29:48 -0500
Received: by mail-bk0-f46.google.com with SMTP id q16so1713713bkw.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Dec 2012 08:29:47 -0800 (PST)
In-Reply-To: <1354888162-12109-12-git-send-email-maxtram95@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Maxim Mikityanskiy <maxtram95@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, jlee@suse.com

On Fri,  7 Dec 2012 15:49:21 +0200, Maxim Mikityanskiy <maxtram95@gmail.com> wrote :

> Introduced quirk_last_pressed variable that would indicate if
> last_pressed is used or not. Made it work even if scancode sequence is
> sparse.
> 
> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
> ---
>  drivers/platform/x86/msi-wmi.c | 43 ++++++++++++++++++++++--------------------
>  1 file changed, 23 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/platform/x86/msi-wmi.c b/drivers/platform/x86/msi-wmi.c
> index 3a60619..273f647 100644
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
> @@ -59,6 +58,7 @@ static struct key_entry msi_wmi_keymap[] = {
>  	{ KE_END, 0 }
>  };
>  static ktime_t last_pressed[ARRAY_SIZE(msi_wmi_keymap) - 1];
> +static bool quirk_last_pressed;
>  
>  static const char *event_wmi_guid;
>  
> @@ -169,11 +169,15 @@ static void msi_wmi_notify(u32 value, void *context)
>  		pr_debug("Eventcode: 0x%x\n", eventcode);
>  		key = sparse_keymap_entry_from_scancode(msi_wmi_input_dev,
>  				eventcode);
> -		if (key) {
> +		if (!key) {
> +			pr_info("Unknown key pressed - %x\n", eventcode);
> +			goto msi_wmi_notify_exit;
> +		}
> +		if (quirk_last_pressed) {
> +			size_t key_index = key - msi_wmi_keymap;
Do you mean key->code - MSI_SCANCODE_BASE ? I'm not sure I understand the
intent here otherwise.


>  			ktime_t diff;
>  			cur = ktime_get_real();
> -			diff = ktime_sub(cur, last_pressed[key->code -
> -					MSI_SCANCODE_BASE]);
> +			diff = ktime_sub(cur, last_pressed[key_index]);
>  			/* Ignore event if the same event happened in a 50 ms
>  			   timeframe -> Key press may result in 10-20 GPEs */
>  			if (ktime_to_us(diff) < 1000 * 50) {
> @@ -182,21 +186,19 @@ static void msi_wmi_notify(u32 value, void *context)
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
> +			last_pressed[key_index] = cur;
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
> @@ -281,6 +283,7 @@ static int __init msi_wmi_init(void)
>  
>  		pr_debug("Event handler installed\n");
>  		event_wmi_guid = MSIWMI_EVENT_GUID;
> +		quirk_last_pressed = true;
>  	}
>  
>  	if (wmi_has_guid(MSIWMI_BIOS_GUID) && !acpi_video_backlight_support()) {

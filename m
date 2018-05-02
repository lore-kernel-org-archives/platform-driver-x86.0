From: "Puma D." <puma.d@web.de>
Subject: Re: [PATCH] platform/x86: asus-wmi: Add keyboard backlight toggle
 support
Date: Wed, 2 May 2018 16:29:25 +0200
Message-ID: <09b12fe1-3023-5e16-7c80-e73a8c3634fd@web.de>
References: <20180502060224.44903-1-chiu@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180502060224.44903-1-chiu@endlessm.com>
Content-Language: de-DE
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Chiu <chiu@endlessm.com>, corentin.chary@gmail.com, dvhart@infradead.org, andy@infradead.org
Cc: acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux@endlessm.com
List-Id: platform-driver-x86.vger.kernel.org

On 02.05.2018 08:02, Chris Chiu wrote:
> Some Asus laptops like UX550GE has hotkey (Fn+F7) for keyboard
> backlight toggle. In this UX550GE, the hotkey incremet the level
> of brightness for each keypress from 1 to 3, and then switch it
> off when the brightness has been the max. This commit interprets
> the code 0xc7 generated from hotkey to KEY_KBDILLUMUP to increment
> the brightness, then pass KEY_KBDILLUMTOGGLE to user space after
> the brightness max been reached for switching the led off.
>
> https://phabricator.endlessm.com/T21390
>
> Signed-off-by: Chris Chiu <chiu@endlessm.com>
> ---
>   drivers/platform/x86/asus-nb-wmi.c | 1 +
>   drivers/platform/x86/asus-wmi.c    | 8 ++++++++
>   2 files changed, 9 insertions(+)
>
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> index 136ff2b..14c502e 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -496,6 +496,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
>   	{ KE_KEY, 0xC4, { KEY_KBDILLUMUP } },
>   	{ KE_KEY, 0xC5, { KEY_KBDILLUMDOWN } },
>   	{ KE_IGNORE, 0xC6, },  /* Ambient Light Sensor notification */
> +	{ KE_KEY, 0xC7, { KEY_KBDILLUMTOGGLE } },
>   	{ KE_END, 0},
>   };
>   
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 1f6e68f..b64ff90 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -67,6 +67,7 @@ MODULE_LICENSE("GPL");
>   #define NOTIFY_BRNDOWN_MAX		0x2e
>   #define NOTIFY_KBD_BRTUP		0xc4
>   #define NOTIFY_KBD_BRTDWN		0xc5
> +#define NOTIFY_KBD_BRTTOGGLE		0xc7
>   
>   /* WMI Methods */
>   #define ASUS_WMI_METHODID_SPEC	        0x43455053 /* BIOS SPECification */
> @@ -1745,6 +1746,13 @@ static void asus_wmi_notify(u32 value, void *context)
>   		}
>   	}
>   
> +	if (code == NOTIFY_KBD_BRTTOGGLE) {
> +		if (asus->kbd_led_wk < asus->kbd_led.max_brightness)
> +			code = NOTIFY_KBD_BRTUP;
> +		else
> +			code = NOTIFY_KBD_BRTTOGGLE;
> +	}
Did you intend the else branch to be a noop?

> +
>   	if (is_display_toggle(code) &&
>   	    asus->driver->quirks->no_display_toggle)
>   		goto exit;

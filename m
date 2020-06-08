From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Subject: Re: [PATCH 1/3] platform/x86: dell-wmi: add new backlight events
Date: Mon, 8 Jun 2020 10:35:03 +0200
Message-ID: <20200608083503.l5g5iq52ezxkobvv@pali>
References: <cover.1591584631.git.y.linux@paritcher.com>
 <7dbe4e9e5ed64e4704b1c4ae13ac84df644ccc13.1591584631.git.y.linux@paritcher.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7dbe4e9e5ed64e4704b1c4ae13ac84df644ccc13.1591584631.git.y.linux@paritcher.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Y Paritcher <y.linux@paritcher.com>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>
List-Id: platform-driver-x86.vger.kernel.org

On Monday 08 June 2020 00:22:24 Y Paritcher wrote:
> Ignore events with a type of 0x0010 and a code of 0x57 / 0x58,
> this silences the following messages being logged on a
> Dell Inspiron 5593:
> 
> dell_wmi: Unknown key with type 0x0010 and code 0x0057 pressed
> dell_wmi: Unknown key with type 0x0010 and code 0x0058 pressed
> 
> Signed-off-by: Y Paritcher <y.linux@paritcher.com>
> ---
>  drivers/platform/x86/dell-wmi.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
> index c25a4286d766..0b4f72f923cd 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c
> @@ -252,6 +252,10 @@ static const struct key_entry dell_wmi_keymap_type_0010[] = {
>  	/* Fn-lock switched to multimedia keys */
>  	{ KE_IGNORE, 0x1, { KEY_RESERVED } },
>  
> +	/* Backlight brightness level */
> +	{ KE_KEY,    0x57, { KEY_BRIGHTNESSDOWN } },
> +	{ KE_KEY,    0x58, { KEY_BRIGHTNESSUP } },
> +
>  	/* Keyboard backlight change notification */
>  	{ KE_IGNORE, 0x3f, { KEY_RESERVED } },

Please, keep codes sorted.

>  
> -- 
> 2.27.0
> 

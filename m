From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Subject: Re: [PATCH 3/3] platform/x86: dell-wmi: add keys to
 bios_to_linux_keycode
Date: Mon, 8 Jun 2020 11:00:17 +0200
Message-ID: <20200608090017.4qgtbosz7oullex2@pali>
References: <cover.1591584631.git.y.linux@paritcher.com>
 <13951508596a3f654c6d47f5380ddb4f38e2f6b5.1591584631.git.y.linux@paritcher.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <13951508596a3f654c6d47f5380ddb4f38e2f6b5.1591584631.git.y.linux@paritcher.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Y Paritcher <y.linux@paritcher.com>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>
List-Id: platform-driver-x86.vger.kernel.org

Hello!

On Monday 08 June 2020 00:22:26 Y Paritcher wrote:
> Increase length of bios_to_linux_keycode to 2 bytes to allow for a new
> keycode 0xffff, this silences the following messages being logged at
> startup on a Dell Inspiron 5593
> 
> dell_wmi: firmware scancode 0x48 maps to unrecognized keycode 0xffff
> dell_wmi: firmware scancode 0x50 maps to unrecognized keycode 0xffff
> 
> Signed-off-by: Y Paritcher <y.linux@paritcher.com>
> ---
>  drivers/platform/x86/dell-wmi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
> index f37e7e9093c2..5ef716e3034f 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c
> @@ -196,7 +196,7 @@ struct dell_dmi_results {
>  };
>  
>  /* Uninitialized entries here are KEY_RESERVED == 0. */
> -static const u16 bios_to_linux_keycode[256] = {
> +static const u16 bios_to_linux_keycode[65536] = {

This change dramatically increase memory usage. I guess other that
maintainers would not like such change.

>  	[0]	= KEY_MEDIA,
>  	[1]	= KEY_NEXTSONG,
>  	[2]	= KEY_PLAYPAUSE,
> @@ -237,6 +237,7 @@ static const u16 bios_to_linux_keycode[256] = {
>  	[37]	= KEY_UNKNOWN,
>  	[38]	= KEY_MICMUTE,
>  	[255]	= KEY_PROG3,
> +	[65535]	= KEY_UNKNOWN,

Also it seems that this change is not complete. It looks like that you
map two different scancodes (0x48 and 0x50) to same keycodes, moreover
both are unknown.

Could you please describe which key presses (or events) generate
delivering these WMI scancode events?

Note that purpose of printing unknown/unrecognized keys messages is to
inform that current pressed key was not processed or that it was
ignored.

For me it looks like this just just hide information that key was not
processed correctly as this change does not implement correct processing
of this key.

Also, could you share documentation about these 0x48/0x50 events? Or it
is under NDA?

>  };
>  
>  /*
> -- 
> 2.27.0
> 

From: Bastien Nocera <hadess@hadess.net>
Subject: Re: [patch 2/2] thinkpad_acpi: off by one in
 adaptive_keyboard_hotkey_notify_hotkey()
Date: Wed, 11 Mar 2015 11:26:09 +0100
Message-ID: <1426069569.17946.10.camel@hadess.net>
References: <20150311093607.GB3564@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <20150311093607.GB3564@mwanda>
Sender: kernel-janitors-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, 2015-03-11 at 12:36 +0300, Dan Carpenter wrote:
> This should be >= instead of > because otherwise we read one element 
> past the end of the hotkey_keycode_map[] array.
> 
> The hotkey_keycode_map[] array has TPACPI_HOTKEY_MAP_LEN elements.
> 
> Fixes: 6a68d8557084 ('thinkpad_acpi: Add support for more adaptive 
> kbd buttons')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-By: Bastien Nocera <hadess@hadess.net>

> diff --git a/drivers/platform/x86/thinkpad_acpi.c 
> b/drivers/platform/x86/thinkpad_acpi.c
> index 024861d..7769575 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -3656,8 +3656,9 @@ static bool 
> adaptive_keyboard_hotkey_notify_hotkey(unsigned int scancode)
>                 return true;
>  
>         default:
> -               if (scancode < FIRST_ADAPTIVE_KEY || scancode > 
> FIRST_ADAPTIVE_KEY +
> -                               TPACPI_HOTKEY_MAP_LEN - 
> ADAPTIVE_KEY_OFFSET) {
> +               if (scancode < FIRST_ADAPTIVE_KEY ||
> +                                               scancode >= 
> FIRST_ADAPTIVE_KEY + TPACPI_HOTKEY_MAP_LEN -
> +                               ADAPTIVE_KEY_OFFSET) {
>                         pr_info("Unhandled adaptive keyboard key: 
> 0x%x\n",
>                                         scancode);
>                         return false;

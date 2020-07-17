From: Bastien Nocera <hadess@hadess.net>
Subject: Re: [PATCH 3/3] platform/x86: thinkpad_acpi: Map Clipping tool
 hotkey to KEY_SELECTIVE_SCREENSHOT
Date: Fri, 17 Jul 2020 14:21:05 +0200
Message-ID: <636026bb5c1a1ea8753c0b145b93b3e542720456.camel@hadess.net>
References: <20200717114155.56222-1-hdegoede@redhat.com>
         <20200717114155.56222-4-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <20200717114155.56222-4-hdegoede@redhat.com>
Sender: linux-input-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
Cc: linux-input@vger.kernel.org, Marco Trevisan <marco.trevisan@canonical.com>, Mark Pearson <mpearson@lenovo.com>, Christian Kellner <ckellner@redhat.com>, Benjamin Berg <bberg@redhat.com>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Fri, 2020-07-17 at 13:41 +0200, Hans de Goede wrote:
> Commit 696c6523ec8f ("platform/x86: thinkpad_acpi: add mapping for
> new
> hotkeys") added support for a bunch of new hotkeys, but the
> clipping/snipping tool hotkey got ignored because there was no good
> key-code to map it to.
> 
> Recently a new KEY_SELECTIVE_SCREENSHOT keycode was added by commit
> 3b059da9835c ("Input: allocate keycode for "Selective Screenshot"
> key")
> quoting from the commit message:
> 
> "New Chrome OS keyboards have a "snip" key that is basically a
> selective
> screenshot (allows a user to select an area of screen to be copied).
> Allocate a keycode for it."
> 
> Support for this "snip" key seems like it is also a good match for
> the
> clipping/snipping tool hotkey, so map this hotkey to the new
> KEY_SELECTIVE_SCREENSHOT key-code.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Added 5 years ago for the Carbon X1 2014, and finally getting
a keycode ;)

Reviewed-by: Bastien Nocera <hadess@hadess.net>

> ---
>  drivers/platform/x86/thinkpad_acpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c
> b/drivers/platform/x86/thinkpad_acpi.c
> index 7fc44b6f8370..70d533b0c907 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -3436,7 +3436,7 @@ static int __init hotkey_init(struct
> ibm_init_struct *iibm)
>  		KEY_UNKNOWN,
>  
>  		KEY_BOOKMARKS,			/* Favorite app,
> 0x311 */
> -		KEY_RESERVED,			/* Clipping tool */
> +		KEY_SELECTIVE_SCREENSHOT,	/* Clipping tool */
>  		KEY_CALC,			/* Calculator (above numpad,
> P52) */
>  		KEY_BLUETOOTH,			/* Bluetooth */
>  		KEY_KEYBOARD,			/* Keyboard, 0x315 */

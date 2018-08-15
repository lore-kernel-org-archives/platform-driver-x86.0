From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: asus-wmi: Add keymap entry for lid flip
 action on Asus UX360
Date: Wed, 15 Aug 2018 13:15:52 +0300
Message-ID: <CAHp75VcMxMMgLS5y1=k2wMHy5HNbBVgJFMNJ0gErsExss4K65Q@mail.gmail.com>
References: <04607a59-7e47-5463-7ff6-cb1aae7e3626@vaolix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <04607a59-7e47-5463-7ff6-cb1aae7e3626@vaolix.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Aleh Filipovich <aleh@vaolix.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Aug 10, 2018 at 11:07 PM, Aleh Filipovich <aleh@vaolix.com> wrote:
> Add entry to WMI keymap for lid flip event on Asus UX360.
>
> On Asus Zenbook ux360 flipping lid from/to tablet mode triggers
> keyscan code 0xfa which cannot be handled and results in kernel
> log message "Unknown key fa pressed".
>
>

Pushed to my review and testing queue, thanks!

P.S. your patch is mangled, please, pay attention to the format next time.

> Signed-off-by: Aleh Filipovich<aleh@appnexus.com>
> ---
>  drivers/platform/x86/asus-nb-wmi.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/platform/x86/asus-nb-wmi.c
> b/drivers/platform/x86/asus-nb-wmi.c
> index 136ff2b4cce5..db2af09067db 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -496,6 +496,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
>         { KE_KEY, 0xC4, { KEY_KBDILLUMUP } },
>         { KE_KEY, 0xC5, { KEY_KBDILLUMDOWN } },
>         { KE_IGNORE, 0xC6, },  /* Ambient Light Sensor notification */
> +       { KE_KEY, 0xFA, { KEY_PROG2 } },           /* Lid flip action */
>         { KE_END, 0},
>  };
>
> --
> 2.18.0
>



-- 
With Best Regards,
Andy Shevchenko

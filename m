From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [v3][PATCH] platform/x86: thinkpad_acpi: not loading
 brightness_init when _BCL invalid
Date: Fri, 10 Jul 2020 23:38:50 +0300
Message-ID: <CAHp75Ve9KGS+3PWCt20=vshfsw5EEjw42FjDAnKE8gwLVpRB6Q@mail.gmail.com>
References: <20200702085520.16901-1-aaron.ma@canonical.com> <20200710015614.3854-1-aaron.ma@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200710015614.3854-1-aaron.ma@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Aaron Ma <aaron.ma@canonical.com>
Cc: mapengyu@gmail.com, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Jul 10, 2020 at 4:56 AM Aaron Ma <aaron.ma@canonical.com> wrote:
>
> When _BCL invalid, disable thinkpad_acpi backlight brightness control.
>
> brightness_enable is already checked at the beginning.
> Most new thinkpads are using GPU driver to control brightness now,
> print notice when enabled brightness control even when brightness_enable = 1.
>

Pushed to my review and testing queue, thanks!

> Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index ff7f0a4f2475..2b36d5416a3b 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -6955,10 +6955,13 @@ static int __init brightness_init(struct ibm_init_struct *iibm)
>                         pr_warn("Cannot enable backlight brightness support, ACPI is already handling it.  Refer to the acpi_backlight kernel parameter.\n");
>                         return 1;
>                 }
> -       } else if (tp_features.bright_acpimode && brightness_enable > 1) {
> -               pr_notice("Standard ACPI backlight interface not available, thinkpad_acpi native brightness control enabled\n");
> +       } else if (!tp_features.bright_acpimode) {
> +               pr_notice("ACPI backlight interface not available\n");
> +               return 1;
>         }
>
> +       pr_notice("ACPI native brightness control enabled\n");
> +
>         /*
>          * Check for module parameter bogosity, note that we
>          * init brightness_mode to TPACPI_BRGHT_MODE_MAX in order to be
> --
> 2.26.2
>


-- 
With Best Regards,
Andy Shevchenko

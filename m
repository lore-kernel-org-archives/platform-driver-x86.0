From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Read EC information on newer models
Date: Fri, 5 Apr 2019 17:38:12 +0300
Message-ID: <CAHp75VeJgLf7DNVy3=tAqwput3EJ2CqcGwCkNCWt820B3QK0gw@mail.gmail.com>
References: <20190308131426.10254-1-jiaxun.yang@flygoat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190308131426.10254-1-jiaxun.yang@flygoat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Mar 8, 2019 at 3:15 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
> Newer ThinkPads have a totally different EC program information DMI
> table. And thermal subdriver can't work without correct EC version.
>
> Read from this entry if the old method failed to get EC information.
>

Thank you for the patch. See my comments below.

> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 62 ++++++++++++++++++++++------
>  1 file changed, 49 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 2e24ee42a3c6..17fd2065000b 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -9959,6 +9959,37 @@ static char __init tpacpi_parse_fw_id(const char * const s,
>         return '\0';
>  }
>
> +static void find_new_ec_fwstr(const struct dmi_header *dm, void *private)
> +{

Today it's a new one, tomorrow something else might come. Care to use
versioning instead?
Something line find_ec_fwstr_vXYZ().

> +}

> -                       tp->ec_version_str = kstrdup(ec_fw_string, GFP_KERNEL);
> -                       if (!tp->ec_version_str)
> -                               return -ENOMEM;

>
> -                       t = tpacpi_parse_fw_id(ec_fw_string,
> -                                              &tp->ec_model, &tp->ec_release);
> -                       if (t != 'H') {
> -                               pr_notice("ThinkPad firmware release %s doesn't match the known patterns\n",
> -                                         ec_fw_string);
> -                               pr_notice("please report this to %s\n",
> -                                         TPACPI_MAIL);
> -                       }

Seems to me that this is the same to below. Can you leave indentation
in place and fix it in a separate (following) patch?

> -                       break;
> +       if (ec_fw_string[0]) {
> +               tp->ec_version_str = kstrdup(ec_fw_string, GFP_KERNEL);
> +               if (!tp->ec_version_str)
> +                       return -ENOMEM;
> +
> +               t = tpacpi_parse_fw_id(ec_fw_string,
> +                        &tp->ec_model, &tp->ec_release);
> +               if (t != 'H') {
> +                       pr_notice("ThinkPad firmware release %s doesn't match the known patterns\n",
> +                                 ec_fw_string);
> +                       pr_notice("please report this to %s\n", TPACPI_MAIL);
>                 }
>         }


-- 
With Best Regards,
Andy Shevchenko

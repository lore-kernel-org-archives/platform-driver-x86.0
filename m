From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: acer-wmi: Silence "unsupported" message a bit
Date: Fri, 17 Aug 2018 14:07:38 +0300
Message-ID: <CAHp75Vd1ZZDJtASfFpr=eE+zaEiOxH3ohdSOe1aTcE3qEMd_QA@mail.gmail.com>
References: <7ccdc39d7e255547e851497ef9f449715b45f8bd.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7ccdc39d7e255547e851497ef9f449715b45f8bd.camel@kernel.crashing.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: "Lee, Chun-Yi" <jlee@suse.com>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Aug 16, 2018 at 2:27 AM, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> This driver prints that "Unsupported machine..." message on every boot on
> ThinkPad X1 Carbon laptops (and I assume a number of other systems), which
> causes graphical boots to "glitch" a bit and is rather annoying ...
>
> Make it a pr_debug instead.

Thanks for the patch. Unfortunately it doesn't apply.
Please, check your mail clients and tools for formatting patch (it
produced at the end spaces instead of tabs)

>
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> ---
>
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> index 8952173dd380..7f7192e8fdab 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -2216,7 +2216,7 @@ static int __init acer_wmi_init(void)
>         if (wmi_has_guid(AMW0_GUID1) &&
>             !dmi_check_system(amw0_whitelist) &&
>             quirks == &quirk_unknown) {
> -               pr_err("Unsupported machine has AMW0_GUID1, unable to load\n");
> +               pr_debug("Unsupported machine has AMW0_GUID1, unable to load\n");
>                 return -ENODEV;
>         }
>
>



-- 
With Best Regards,
Andy Shevchenko

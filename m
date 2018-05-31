From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] ideapad-laptop: Add E42-80 to no_hw_rfkill
Date: Thu, 31 May 2018 15:10:06 +0300
Message-ID: <CAHp75VeH-UQW6UCi4_FKaDU2YqsbW=UL7Bz7qU10Mr83TC2bAA@mail.gmail.com>
References: <20180528114448.11710-1-chdy.uuid@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180528114448.11710-1-chdy.uuid@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dylanchu <chdy.uuid@gmail.com>
Cc: Ike Panhc <ike.pan@canonical.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, May 28, 2018 at 2:44 PM, dylanchu <chdy.uuid@gmail.com> wrote:
> Lenovo Zhaoyang E42-80 is another Lenovo model without
> a hw rfkill switch, resulting in wifi always reported
> as hard blocked.
>
> Add the model to the list of models without rfkill switch.
>

Pushed to my review and testing queue, thanks!

> Signed-off-by: dylanchu <chdy.uuid@gmail.com>
> ---
>  drivers/platform/x86/ideapad-laptop.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index 535199c9e6bc..6fdd70373ed3 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -1163,6 +1163,13 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
>                         DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo YOGA 920-13IKB"),
>                 },
>         },
> +       {
> +               .ident = "Lenovo Zhaoyang E42-80",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_MATCH(DMI_PRODUCT_VERSION, "ZHAOYANG E42-80"),
> +               },
> +       },
>         {}
>  };
>
> --
> 2.17.0



-- 
With Best Regards,
Andy Shevchenko

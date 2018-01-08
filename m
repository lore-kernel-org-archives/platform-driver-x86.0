From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Add Y720-15IKB to no_hw_rfkill
Date: Mon, 8 Jan 2018 19:30:21 +0200
Message-ID: <CAHp75VfcCLr_D5cW4bXP7rNMKaHsh25yPZVyqKQsdOemcTF9BQ@mail.gmail.com>
References: <20180107195312.13130-1-olle@liljenzin.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180107195312.13130-1-olle@liljenzin.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Olle Liljenzin <olle@liljenzin.se>
Cc: Ike Panhc <ike.pan@canonical.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, piotr.baranowski@osec.pl
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Jan 7, 2018 at 9:53 PM, Olle Liljenzin <olle@liljenzin.se> wrote:
> Lenovo Legion Y720-15IKB is another Lenovo model without a
> hw rfkill switch, resulting in wifi always reported as hard
> blocked.
>
> Add the model to the list of models without rfkill switch.

Pushed to my review and testing queue, thanks!

>
> Signed-off-by: Olle Liljenzin <olle@liljenzin.se>
> ---
>  drivers/platform/x86/ideapad-laptop.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index 53ab4e0f8962..c945572485ce 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -1103,6 +1103,13 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
>                         DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo Y520-15IKBN"),
>                 },
>         },
> +       {
> +               .ident = "Lenovo Legion Y720-15IKB",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo Y720-15IKB"),
> +               },
> +       },
>         {
>                 .ident = "Lenovo Legion Y720-15IKBN",
>                 .matches = {
> --
> 2.14.3
>



-- 
With Best Regards,
Andy Shevchenko

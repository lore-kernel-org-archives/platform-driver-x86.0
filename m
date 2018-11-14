From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] ideapad-laptop: Add Lenovo Yoga 2 13 to the no_hw_rfkill
 DMI list
Date: Wed, 14 Nov 2018 18:01:47 +0200
Message-ID: <CAHp75VfX+4SUcKUPfQCeVM2M6dKwD+PZpTDHP2yi4yv35prhVQ@mail.gmail.com>
References: <20181114151212.20942-1-loic.wyn@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181114151212.20942-1-loic.wyn@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Loic Wei-Yu-Neng <loic.wyn@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Ike Panhc <ike.pan@canonical.com>, Andy Shevchenko <andy@infradead.org>, Jiri Kosina <trivial@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Nov 14, 2018 at 5:13 PM Loic WEI YU NENG <loic.wyn@gmail.com> wrote:
>
> Some Lenovo ideapad models lack a physical rfkill switch.
> On Lenovo models Yoga 2 13, ideapad-laptop would wrongly report all
> radios as blocked by hardware which caused wireless network connections
> to fail.
> Add these models without an rfkill switch to the no_hw_rfkill list.
>

Pushed to my review and testing queue, thanks

> Signed-off-by: Loic WEI YU NENG <loic.wyn@gmail.com>
> ---
>  drivers/platform/x86/ideapad-laptop.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index b6489cba2985..1589dffab9fa 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -1188,6 +1188,13 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
>                         DMI_MATCH(DMI_BOARD_NAME, "Yoga2"),
>                 },
>         },
> +       {
> +               .ident = "Lenovo Yoga 2 13",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_MATCH(DMI_PRODUCT_VERSION, "Yoga 2 13"),
> +               },
> +       },
>         {
>                 .ident = "Lenovo Yoga 3 1170 / 1470",
>                 .matches = {
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko

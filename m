From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Add Ideapad 530S-14ARR to
 no_hw_rfkill list
Date: Tue, 5 Mar 2019 15:48:00 +0200
Message-ID: <CAHp75VfRGeJnggyMonVaUo-pEZV9zN-JV1rBU+ZtajDtOrAD1w@mail.gmail.com>
References: <20190305085521.25304-1-kai.heng.feng@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190305085521.25304-1-kai.heng.feng@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc: Ike Panhc <ike.pan@canonical.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Mar 5, 2019 at 10:55 AM Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
>
> This platform doesn't have hardware switch for rfkill, so add it to
> no_hw_rfkill list to prevent wireless gets hard-blocked.
>
> https://bugs.launchpad.net/bugs/1818204
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

Pushed to my review and testing queue, thanks!

> ---
>  drivers/platform/x86/ideapad-laptop.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index 1589dffab9fa..037970a1800a 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -1090,6 +1090,13 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
>                         DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad 310-15ISK"),
>                 },
>         },
> +       {
> +               .ident = "Lenovo ideapad 530S-14ARR",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad 530S-14ARR"),
> +               },
> +       },
>         {
>                 .ident = "Lenovo ideapad Y700-14ISK",
>                 .matches = {
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko

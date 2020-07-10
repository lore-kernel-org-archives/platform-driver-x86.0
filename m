From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re:
Date: Fri, 10 Jul 2020 23:36:54 +0300
Message-ID: <CAHp75VctrxoL7d_JPAOv8_t1T=vMx-GiLyfrjZ6839N8C1UrnA@mail.gmail.com>
References: <20200630175559.23966-1-rublag-ns@yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200630175559.23966-1-rublag-ns@yandex.ru>
Sender: linux-kernel-owner@vger.kernel.org
To: Vasiliy Kupriakov <rublag-ns@yandex.ru>
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "open list:ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS DRIVERS" <acpi4asus-user@lists.sourceforge.net>, "open list:ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS DRIVERS" <platform-driver-x86@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Jun 30, 2020 at 8:57 PM Vasiliy Kupriakov <rublag-ns@yandex.ru> wrote:
>
> Subject: [PATCH] platform/x86: asus-wmi: allow BAT1 battery name
>
> The battery on my laptop ASUS TUF Gaming FX706II is named BAT1.
> This patch allows battery extension to load.
>

Pushed to my review and testing queue, thanks!

> Signed-off-by: Vasiliy Kupriakov <rublag-ns@yandex.ru>
> ---
>  drivers/platform/x86/asus-wmi.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 877aade19497..8f4acdc06b13 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -441,6 +441,7 @@ static int asus_wmi_battery_add(struct power_supply *battery)
>          * battery is named BATT.
>          */
>         if (strcmp(battery->desc->name, "BAT0") != 0 &&
> +           strcmp(battery->desc->name, "BAT1") != 0 &&
>             strcmp(battery->desc->name, "BATT") != 0)
>                 return -ENODEV;
>
> --
> 2.27.0
>


-- 
With Best Regards,
Andy Shevchenko

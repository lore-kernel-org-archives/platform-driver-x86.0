From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [RFC PATCH 1/3] platform/x86: asus_wmi: Fix return value of fan_boost_mode_store
Date: Mon, 4 Nov 2019 16:31:07 +0200
Message-ID: <CAHp75VfxN-CEeMiQDfuBge81sFnDbQuOQ-W4Ksc3d2QGJCWC1w@mail.gmail.com>
References: <CAPW-Pu0KuxqbKSQ2JQaxh5AHbdZdNQZJfOgxoe_XZSxow+9e3A@mail.gmail.com>
 <CAPW-Pu0qCfNXwjDW90To5ZpwtfpXAzm93CWFaUvA_9YQW5Ke-g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPW-Pu0qCfNXwjDW90To5ZpwtfpXAzm93CWFaUvA_9YQW5Ke-g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Leon Maxx <leonmaxx@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Corentin Chary <corentin.chary@gmail.com>, Daniel Drake <drake@endlessm.com>, Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Nov 4, 2019 at 12:54 PM Leon Maxx <leonmaxx@gmail.com> wrote:
>
> Function fan_boost_mode_store should return number of bytes written
> but instead it returns return value of kstrtou8 which is 0 if
> conversion is succefull. This leads to infinite loop after any
> write to it's SysFS entry.
>

Fixes tag missing.

> Signed-off-by: Leonid Maksymchuk <leonmaxx@gmail.com>
> ---
>  drivers/platform/x86/asus-wmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 821b08e..723aa4d 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -1718,7 +1718,7 @@ static ssize_t fan_boost_mode_store(struct device *dev,
>   asus->fan_boost_mode = new_mode;
>   fan_boost_mode_write(asus);
>
> - return result;
> + return count;
>  }
>
>  // Fan boost mode: 0 - normal, 1 - overboost, 2 - silent
> --
> 1.8.3.1



-- 
With Best Regards,
Andy Shevchenko

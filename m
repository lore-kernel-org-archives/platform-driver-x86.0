From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: GPD pocket fan: fix spelling mistake:
 "Mill-celcius" -> "millicelsius"
Date: Fri, 9 Feb 2018 15:38:56 +0200
Message-ID: <CAHp75VdKxnjZHXAugA5mx9xaz30oxrdkTV7c2KsOFGahVHuqMg@mail.gmail.com>
References: <20180209115340.32347-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180209115340.32347-1-colin.king@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Colin King <colin.king@canonical.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Feb 9, 2018 at 1:53 PM, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Trivial fix to spelling mistake in MODULE_PARM_DESC text and remove
> unnecessary hyphen

Applied with a period added to my reviewing and testing queue, thanks!

>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/platform/x86/gpd-pocket-fan.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/gpd-pocket-fan.c b/drivers/platform/x86/gpd-pocket-fan.c
> index 2d645c505f81..3b923df15b9b 100644
> --- a/drivers/platform/x86/gpd-pocket-fan.c
> +++ b/drivers/platform/x86/gpd-pocket-fan.c
> @@ -19,12 +19,12 @@
>  static int temp_limits[3] = { 55000, 60000, 65000 };
>  module_param_array(temp_limits, int, NULL, 0444);
>  MODULE_PARM_DESC(temp_limits,
> -                "Milli-celcius values above which the fan speed increases");
> +                "Millicelsius values above which the fan speed increases");
>
>  static int hysteresis = 3000;
>  module_param(hysteresis, int, 0444);
>  MODULE_PARM_DESC(hysteresis,
> -                "Hysteresis in milli-celcius before lowering the fan speed");
> +                "Hysteresis in millicelsius before lowering the fan speed");
>
>  static int speed_on_ac = 2;
>  module_param(speed_on_ac, int, 0444);
> --
> 2.15.1
>



-- 
With Best Regards,
Andy Shevchenko

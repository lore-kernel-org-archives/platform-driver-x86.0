From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 2/2] platform/x86: GPD pocket fan: Allow somewhat
 lower/higher temperature limits
Date: Wed, 8 Jan 2020 14:23:11 +0200
Message-ID: <CAHp75Ve5XF-UZw6D-OUCkgOPMYH0DgT1L5uVNGRuLmZ6Cjd1KA@mail.gmail.com>
References: <20200106144219.525215-1-hdegoede@redhat.com> <20200106144219.525215-2-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200106144219.525215-2-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jason Anderson <jasona.594@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Jan 6, 2020 at 4:42 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Allow the user to configure the fan to turn on / speed-up at lower
> thresholds then before (20 degrees Celcius as minimum instead of 40) and
> likewise also allow the user to delay the fan speeding-up till the
> temperature hits 90 degrees Celcius (was 70).
>
> Cc: Jason Anderson <jasona.594@gmail.com>

> Reported-by: Jason Anderson <jasona.594@gmail.com>

My understanding of this tag that the report assumes a bug to fix
followed up with a corresponding Fixes tag.

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/gpd-pocket-fan.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/gpd-pocket-fan.c b/drivers/platform/x86/gpd-pocket-fan.c
> index 1e6a42f2ea8a..0ffcbf9bc18e 100644
> --- a/drivers/platform/x86/gpd-pocket-fan.c
> +++ b/drivers/platform/x86/gpd-pocket-fan.c
> @@ -126,7 +126,7 @@ static int gpd_pocket_fan_probe(struct platform_device *pdev)
>         int i;
>
>         for (i = 0; i < ARRAY_SIZE(temp_limits); i++) {
> -               if (temp_limits[i] < 40000 || temp_limits[i] > 70000) {
> +               if (temp_limits[i] < 20000 || temp_limits[i] > 90000) {
>                         dev_err(&pdev->dev, "Invalid temp-limit %d (must be between 40000 and 70000)\n",
>                                 temp_limits[i]);
>                         temp_limits[0] = TEMP_LIMIT0_DEFAULT;
> --
> 2.24.1
>


-- 
With Best Regards,
Andy Shevchenko

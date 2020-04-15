From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [RFC 1/8] thermal: int3400_thermal: Statically initialize
 .get_mode()/.set_mode() ops
Date: Wed, 15 Apr 2020 11:12:02 +0200
Message-ID: <7cbddc1c-0049-6b50-7bca-204bd9df2c30@samsung.com>
References: <20200407174926.23971-1-andrzej.p@collabora.com>
        <20200407174926.23971-2-andrzej.p@collabora.com>
        <CGME20200415091204eucas1p1983548c2db52d8d0c2a5367034ec80dd@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20200407174926.23971-2-andrzej.p@collabora.com>
Content-Language: en-US
Sender: linux-acpi-owner@vger.kernel.org
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: linux-pm@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, "David S . Miller" <davem@davemloft.net>, Peter Kaestle <peter@piie.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Support Opensource <support.opensource@diasemi.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amit.kucheria@verdurent.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Allison Randal <allison@lohutok.net>, Enrico Weigelt <info@metux.net>
List-Id: platform-driver-x86.vger.kernel.org


On 4/7/20 7:49 PM, Andrzej Pietrasiewicz wrote:
> int3400_thermal_ops is used inside int3400_thermal_probe() only after
> the assignments, which can just as well be made statically at struct's
> initizer.
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
>  drivers/thermal/intel/int340x_thermal/int3400_thermal.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/thermal/intel/int340x_thermal/int3400_thermal.c b/drivers/thermal/intel/int340x_thermal/int3400_thermal.c
> index efae0c02d898..634b943e9e3d 100644
> --- a/drivers/thermal/intel/int340x_thermal/int3400_thermal.c
> +++ b/drivers/thermal/intel/int340x_thermal/int3400_thermal.c
> @@ -271,6 +271,8 @@ static int int3400_thermal_set_mode(struct thermal_zone_device *thermal,
>  
>  static struct thermal_zone_device_ops int3400_thermal_ops = {
>  	.get_temp = int3400_thermal_get_temp,
> +	.get_mode = int3400_thermal_get_mode,
> +	.set_mode = int3400_thermal_set_mode,
>  };
>  
>  static struct thermal_zone_params int3400_thermal_params = {
> @@ -309,9 +311,6 @@ static int int3400_thermal_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, priv);
>  
> -	int3400_thermal_ops.get_mode = int3400_thermal_get_mode;
> -	int3400_thermal_ops.set_mode = int3400_thermal_set_mode;
> -
>  	priv->thermal = thermal_zone_device_register("INT3400 Thermal", 0, 0,
>  						priv, &int3400_thermal_ops,
>  						&int3400_thermal_params, 0, 0);
> 

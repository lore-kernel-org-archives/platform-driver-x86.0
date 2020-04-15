From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [RFC 2/8] thermal: Properly handle mode values in .set_mode()
Date: Wed, 15 Apr 2020 12:05:42 +0200
Message-ID: <be73e437-8913-25f5-4abe-cad2caedcf74@samsung.com>
References: <20200407174926.23971-1-andrzej.p@collabora.com>
        <20200407174926.23971-3-andrzej.p@collabora.com>
        <CGME20200415100543eucas1p24e24293da39844ca8791db86af5365a7@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20200407174926.23971-3-andrzej.p@collabora.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: linux-pm@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, "David S . Miller" <davem@davemloft.net>, Peter Kaestle <peter@piie.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Support Opensource <support.opensource@diasemi.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amit.kucheria@verdurent.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Allison Randal <allison@lohutok.net>, Enrico Weigelt <info@metux.net>
List-Id: platform-driver-x86.vger.kernel.org


On 4/7/20 7:49 PM, Andrzej Pietrasiewicz wrote:
> Allow only THERMAL_DEVICE_ENABLED and THERMAL_DEVICE_DISABLED as valid
> states to transition to.
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
>  drivers/net/ethernet/mellanox/mlxsw/core_thermal.c | 8 ++++++--
>  drivers/platform/x86/acerhdf.c                     | 4 ++++
>  drivers/thermal/imx_thermal.c                      | 4 +++-
>  drivers/thermal/intel/intel_quark_dts_thermal.c    | 5 ++++-
>  drivers/thermal/of-thermal.c                       | 4 +++-
>  5 files changed, 20 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mellanox/mlxsw/core_thermal.c b/drivers/net/ethernet/mellanox/mlxsw/core_thermal.c
> index ce0a6837daa3..cd435ca7adbe 100644
> --- a/drivers/net/ethernet/mellanox/mlxsw/core_thermal.c
> +++ b/drivers/net/ethernet/mellanox/mlxsw/core_thermal.c
> @@ -296,8 +296,10 @@ static int mlxsw_thermal_set_mode(struct thermal_zone_device *tzdev,
>  
>  	if (mode == THERMAL_DEVICE_ENABLED)
>  		tzdev->polling_delay = thermal->polling_delay;
> -	else
> +	else if (mode == THERMAL_DEVICE_DISABLED)
>  		tzdev->polling_delay = 0;
> +	else
> +		return -EINVAL;

Making sure that the valid parameters are passed to driver specific
->set_mode method should be handled in the higher layer (callers).

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
 
>  	mutex_unlock(&tzdev->lock);
>  
> @@ -486,8 +488,10 @@ static int mlxsw_thermal_module_mode_set(struct thermal_zone_device *tzdev,
>  
>  	if (mode == THERMAL_DEVICE_ENABLED)
>  		tzdev->polling_delay = thermal->polling_delay;
> -	else
> +	else if (mode == THERMAL_DEVICE_DISABLED)
>  		tzdev->polling_delay = 0;
> +	else
> +		return -EINVAL;
>  
>  	mutex_unlock(&tzdev->lock);
>  
> diff --git a/drivers/platform/x86/acerhdf.c b/drivers/platform/x86/acerhdf.c
> index 8cc86f4e3ac1..d5188c1d688b 100644
> --- a/drivers/platform/x86/acerhdf.c
> +++ b/drivers/platform/x86/acerhdf.c
> @@ -431,6 +431,10 @@ static int acerhdf_get_mode(struct thermal_zone_device *thermal,
>  static int acerhdf_set_mode(struct thermal_zone_device *thermal,
>  			    enum thermal_device_mode mode)
>  {
> +	if (mode != THERMAL_DEVICE_DISABLED &&
> +	    mode != THERMAL_DEVICE_ENABLED)
> +		return -EINVAL;
> +
>  	if (mode == THERMAL_DEVICE_DISABLED && kernelmode)
>  		acerhdf_revert_to_bios_mode();
>  	else if (mode == THERMAL_DEVICE_ENABLED && !kernelmode)
> diff --git a/drivers/thermal/imx_thermal.c b/drivers/thermal/imx_thermal.c
> index bb6754a5342c..014512581918 100644
> --- a/drivers/thermal/imx_thermal.c
> +++ b/drivers/thermal/imx_thermal.c
> @@ -368,7 +368,7 @@ static int imx_set_mode(struct thermal_zone_device *tz,
>  			data->irq_enabled = true;
>  			enable_irq(data->irq);
>  		}
> -	} else {
> +	} else if (mode == THERMAL_DEVICE_DISABLED) {
>  		regmap_write(map, soc_data->sensor_ctrl + REG_CLR,
>  			     soc_data->measure_temp_mask);
>  		regmap_write(map, soc_data->sensor_ctrl + REG_SET,
> @@ -381,6 +381,8 @@ static int imx_set_mode(struct thermal_zone_device *tz,
>  			disable_irq(data->irq);
>  			data->irq_enabled = false;
>  		}
> +	} else {
> +		return -EINVAL;
>  	}
>  
>  	data->mode = mode;
> diff --git a/drivers/thermal/intel/intel_quark_dts_thermal.c b/drivers/thermal/intel/intel_quark_dts_thermal.c
> index 5d33b350da1c..5f4bcc0e4fd3 100644
> --- a/drivers/thermal/intel/intel_quark_dts_thermal.c
> +++ b/drivers/thermal/intel/intel_quark_dts_thermal.c
> @@ -328,8 +328,11 @@ static int sys_set_mode(struct thermal_zone_device *tzd,
>  	mutex_lock(&dts_update_mutex);
>  	if (mode == THERMAL_DEVICE_ENABLED)
>  		ret = soc_dts_enable(tzd);
> -	else
> +	else if (mode == THERMAL_DEVICE_DISABLED)
>  		ret = soc_dts_disable(tzd);
> +	else
> +		return -EINVAL;
> +
>  	mutex_unlock(&dts_update_mutex);
>  
>  	return ret;
> diff --git a/drivers/thermal/of-thermal.c b/drivers/thermal/of-thermal.c
> index ef0baa954ff0..b7621dfab17c 100644
> --- a/drivers/thermal/of-thermal.c
> +++ b/drivers/thermal/of-thermal.c
> @@ -289,9 +289,11 @@ static int of_thermal_set_mode(struct thermal_zone_device *tz,
>  	if (mode == THERMAL_DEVICE_ENABLED) {
>  		tz->polling_delay = data->polling_delay;
>  		tz->passive_delay = data->passive_delay;
> -	} else {
> +	} else if (mode == THERMAL_DEVICE_DISABLED) {
>  		tz->polling_delay = 0;
>  		tz->passive_delay = 0;
> +	} else {
> +		return -EINVAL;
>  	}
>  
>  	mutex_unlock(&tz->lock);
> 

From: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v4 08/11] thermal: Explicitly enable non-changing
 thermal zone devices
Date: Wed, 24 Jun 2020 12:00:59 +0200
Message-ID: <0dc0796a-1559-d5e9-5297-c95281792a06@samsung.com>
References: <Message-ID: <4493c0e4-51aa-3907-810c-74949ff27ca4@samsung.com>
        <20200528192051.28034-1-andrzej.p@collabora.com>
        <CGME20200528192214eucas1p183eafb73cad6465e71e779fb68679f03@eucas1p1.samsung.com>
        <20200528192051.28034-9-andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200528192051.28034-9-andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Content-Language: en-US
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrzej Pietrasiewicz <andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-acpi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "Rafael J . Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Len Brown <lenb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Vishal Kulkarni <vishal-ut6Up61K2wZBDgjK7y7TUQ@public.gmane.org>, "David S . Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Jiri Pirko <jiri-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Ido Schimmel <idosch-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Johannes Berg <johannes.berg-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Emmanuel Grumbach <emmanuel.grumbach-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Luca Coelho <luciano.coelho-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Intel Linux Wireless <linuxwifi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Peter Kaestle <peter-p08lbbvQ7EI@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org


On 5/28/20 9:20 PM, Andrzej Pietrasiewicz wrote:
> Some thermal zone devices never change their state, so they should be
> always enabled.
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> ---
>  drivers/net/ethernet/chelsio/cxgb4/cxgb4_thermal.c     |  8 ++++++++
>  drivers/net/wireless/intel/iwlwifi/mvm/tt.c            |  9 ++++++++-
>  drivers/platform/x86/intel_mid_thermal.c               |  6 ++++++
>  drivers/power/supply/power_supply_core.c               |  9 +++++++--
>  drivers/thermal/armada_thermal.c                       |  6 ++++++
>  drivers/thermal/dove_thermal.c                         |  6 ++++++
>  .../thermal/intel/int340x_thermal/int3400_thermal.c    |  5 +++++
>  .../intel/int340x_thermal/int340x_thermal_zone.c       |  5 +++++
>  drivers/thermal/intel/intel_pch_thermal.c              |  5 +++++
>  drivers/thermal/intel/intel_soc_dts_iosf.c             |  3 +++
>  drivers/thermal/intel/x86_pkg_temp_thermal.c           |  6 ++++++
>  drivers/thermal/kirkwood_thermal.c                     |  7 +++++++
>  drivers/thermal/rcar_thermal.c                         |  9 ++++++++-
>  drivers/thermal/spear_thermal.c                        |  7 +++++++
>  drivers/thermal/st/st_thermal.c                        |  5 +++++
>  drivers/thermal/thermal_of.c                           | 10 +++++++++-
>  16 files changed, 101 insertions(+), 5 deletions(-)

[...]

> diff --git a/drivers/thermal/intel/int340x_thermal/int3400_thermal.c b/drivers/thermal/intel/int340x_thermal/int3400_thermal.c
> index 3c0397a29b8c..8e8c9af7e5f4 100644
> --- a/drivers/thermal/intel/int340x_thermal/int3400_thermal.c
> +++ b/drivers/thermal/intel/int340x_thermal/int3400_thermal.c
> @@ -485,6 +485,10 @@ static int int3400_thermal_probe(struct platform_device *pdev)
>  		goto free_art_trt;
>  	}
>  
> +	result = thermal_zone_device_enable(priv->thermal);

I'm not sure about correctness of this addition.

This driver contains ->set_mode but doesn't call it on initialization
(in v3 it was using THERMAL_DEVICE_DISABLED as .initial_mode parameter).

> +	if (result)
> +		goto free_tzd;
> +
>  	priv->rel_misc_dev_res = acpi_thermal_rel_misc_device_add(
>  							priv->adev->handle);
>  
> @@ -518,6 +522,7 @@ static int int3400_thermal_probe(struct platform_device *pdev)
>  free_rel_misc:
>  	if (!priv->rel_misc_dev_res)
>  		acpi_thermal_rel_misc_device_remove(priv->adev->handle);
> +free_tzd:
>  	thermal_zone_device_unregister(priv->thermal);
>  free_art_trt:
>  	kfree(priv->trts);

[...]

> diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
> index 43a516a35d64..011fd7f0a01e 100644
> --- a/drivers/thermal/thermal_of.c
> +++ b/drivers/thermal/thermal_of.c
> @@ -1066,7 +1066,7 @@ int __init of_parse_thermal_zones(void)
>  	for_each_available_child_of_node(np, child) {
>  		struct thermal_zone_device *zone;
>  		struct thermal_zone_params *tzp;
> -		int i, mask = 0;
> +		int i, ret, mask = 0;
>  		u32 prop;
>  
>  		tz = thermal_of_build_thermal_zone(child);
> @@ -1113,6 +1113,14 @@ int __init of_parse_thermal_zones(void)
>  			of_thermal_free_zone(tz);
>  			/* attempting to build remaining zones still */
>  		}
> +		ret = thermal_zone_device_enable(zone);

This doesn't seem correct as it is done too early and
there is already proper thermal_zone_device_enable() call
in thermal_zone_of_sensor_register().

> +		if (ret) {
> +			thermal_zone_device_unregister(zone);
> +			pr_err("Failed to enable thermal zone\n");
> +			kfree(tzp);
> +			kfree(ops);
> +			of_thermal_free_zone(tz);
> +		}
>  	}
>  	of_node_put(np);
>  

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v4 06/11] thermal: Add mode helpers
Date: Fri, 29 May 2020 08:52:06 -0700
Message-ID: <20200529155206.GA158553@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-acpi-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-acpi-owner@vger.kernel.org
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Heiko Stuebner <heiko@sntech.de>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Vishal Kulkarni <vishal@chelsio.com>, Luca Coelho <luciano.coelho@intel.com>, Miquel Raynal <miquel.raynal@bootlin.com>, kernel@collabora.com, Fabio Estevam <festevam@gmail.com>, Amit Kucheria <amit.kucheria@verdurent.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Allison Randal <allison@lohutok.net>, NXP Linux Team <linux-imx@nxp.com>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, May 28, 2020 at 09:20:46PM +0200, Andrzej Pietrasiewicz wrote:
> Prepare for making the drivers not access tzd's private members.
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
>  drivers/thermal/thermal_core.c | 53 ++++++++++++++++++++++++++++++++++
>  include/linux/thermal.h        | 13 +++++++++
>  2 files changed, 66 insertions(+)
> 
> diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core.c
> index 14d3b1b94c4f..f2a5c5ee3455 100644
> --- a/drivers/thermal/thermal_core.c
> +++ b/drivers/thermal/thermal_core.c
> @@ -459,6 +459,59 @@ static void thermal_zone_device_reset(struct thermal_zone_device *tz)
>  	thermal_zone_device_init(tz);
>  }
>  
> +int thermal_zone_device_set_mode(struct thermal_zone_device *tz,
> +				 enum thermal_device_mode mode)
> +{
> +	int ret = 0;
> +
> +	mutex_lock(&tz->lock);
> +
> +	/* do nothing if mode isn't changing */
> +	if (mode == tz->mode) {
> +		mutex_unlock(&tz->lock);
> +
Nit: unnecessary empty line.

> +		return ret;
> +	}
> +
> +	if (tz->ops->set_mode)
> +		ret = tz->ops->set_mode(tz, mode);
> +
> +	if (!ret)
> +		tz->mode = mode;
> +
> +	mutex_unlock(&tz->lock);
> +
> +	thermal_zone_device_update(tz, THERMAL_EVENT_UNSPECIFIED);
> +
> +	return ret;
> +}
> +
> +int thermal_zone_device_enable(struct thermal_zone_device *tz)
> +{
> +	return thermal_zone_device_set_mode(tz, THERMAL_DEVICE_ENABLED);
> +}
> +EXPORT_SYMBOL(thermal_zone_device_enable);

Other exports in thermal/ use EXPORT_SYMBOL_GPL.

> +
> +int thermal_zone_device_disable(struct thermal_zone_device *tz)
> +{
> +	return thermal_zone_device_set_mode(tz, THERMAL_DEVICE_DISABLED);
> +}
> +EXPORT_SYMBOL(thermal_zone_device_disable);
> +
> +int thermal_zone_device_is_enabled(struct thermal_zone_device *tz)
> +{
> +	enum thermal_device_mode mode;
> +
> +	mutex_lock(&tz->lock);
> +
> +	mode = tz->mode;
> +
> +	mutex_unlock(&tz->lock);
> +
> +	return mode == THERMAL_DEVICE_ENABLED;
> +}
> +EXPORT_SYMBOL(thermal_zone_device_is_enabled);
> +
>  void thermal_zone_device_update(struct thermal_zone_device *tz,
>  				enum thermal_notify_event event)
>  {
> diff --git a/include/linux/thermal.h b/include/linux/thermal.h
> index a808f6fa2777..df013c39ba9b 100644
> --- a/include/linux/thermal.h
> +++ b/include/linux/thermal.h
> @@ -416,6 +416,9 @@ int thermal_zone_get_offset(struct thermal_zone_device *tz);
>  
>  void thermal_cdev_update(struct thermal_cooling_device *);
>  void thermal_notify_framework(struct thermal_zone_device *, int);
> +int thermal_zone_device_enable(struct thermal_zone_device *tz);
> +int thermal_zone_device_disable(struct thermal_zone_device *tz);
> +int thermal_zone_device_is_enabled(struct thermal_zone_device *tz);
>  #else
>  static inline struct thermal_zone_device *thermal_zone_device_register(
>  	const char *type, int trips, int mask, void *devdata,
> @@ -463,6 +466,16 @@ static inline void thermal_cdev_update(struct thermal_cooling_device *cdev)
>  static inline void thermal_notify_framework(struct thermal_zone_device *tz,
>  	int trip)
>  { }
> +
> +static inline int thermal_zone_device_enable(struct thermal_zone_device *tz)
> +{ return -ENODEV; }
> +
> +static inline int thermal_zone_device_disable(struct thermal_zone_device *tz)
> +{ return -ENODEV; }
> +
> +static inline int
> +thermal_zone_device_is_enabled(struct thermal_zone_device *tz)
> +{ return -ENODEV; }
>  #endif /* CONFIG_THERMAL */
>  
>  #endif /* __THERMAL_H__ */

From: Amit Kucheria <amit.kucheria@verdurent.com>
Subject: Re: [PATCH v5 06/11] thermal: Add mode helpers
Date: Mon, 29 Jun 2020 12:34:50 +0530
Message-ID: <CAHLCerO2XOOX9akEwaTu_cjSqRycFpNmoVxkSe36L8B4ALWidA@mail.gmail.com>
References: <9cbffad6-69e4-0b33-4640-fde7c4f6a6e7@linaro.org>
 <20200626173755.26379-1-andrzej.p@collabora.com> <20200626173755.26379-7-andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20200626173755.26379-7-andrzej.p@collabora.com>
Sender: netdev-owner@vger.kernel.org
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: Linux PM list <linux-pm@vger.kernel.org>, linux-acpi@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org, lakml <linux-arm-kernel@lists.infradead.org>, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Vishal Kulkarni <vishal@chelsio.com>, "David S . Miller" <davem@davemloft.net>, Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, Johannes Berg <johannes.berg@intel.com>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Luca Coelho <luciano.coelho@intel.com>, Intel Linux Wireless <linuxwifi@intel.com>, Kalle Valo <kvalo@codeaurora.org>, Peter Kaestle <peter@piie.net>, Darr
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Jun 26, 2020 at 11:08 PM Andrzej Pietrasiewicz
<andrzej.p@collabora.com> wrote:
>
> Prepare for making the drivers not access tzd's private members.
>
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> [EXPORT_SYMBOL -> EXPORT_SYMBOL_GPL]
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
>  drivers/thermal/thermal_core.c | 53 ++++++++++++++++++++++++++++++++++
>  include/linux/thermal.h        | 13 +++++++++
>  2 files changed, 66 insertions(+)
>
> diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core.c
> index 14d3b1b94c4f..3181295075b9 100644
> --- a/drivers/thermal/thermal_core.c
> +++ b/drivers/thermal/thermal_core.c
> @@ -459,6 +459,59 @@ static void thermal_zone_device_reset(struct thermal_zone_device *tz)
>         thermal_zone_device_init(tz);
>  }
>
> +int thermal_zone_device_set_mode(struct thermal_zone_device *tz,
> +                                enum thermal_device_mode mode)

Should this be static?

> +{
> +       int ret = 0;
> +
> +       mutex_lock(&tz->lock);
> +
> +       /* do nothing if mode isn't changing */
> +       if (mode == tz->mode) {
> +               mutex_unlock(&tz->lock);
> +
> +               return ret;
> +       }
> +
> +       if (tz->ops->set_mode)
> +               ret = tz->ops->set_mode(tz, mode);
> +
> +       if (!ret)
> +               tz->mode = mode;
> +
> +       mutex_unlock(&tz->lock);
> +
> +       thermal_zone_device_update(tz, THERMAL_EVENT_UNSPECIFIED);
> +
> +       return ret;
> +}
> +
> +int thermal_zone_device_enable(struct thermal_zone_device *tz)
> +{
> +       return thermal_zone_device_set_mode(tz, THERMAL_DEVICE_ENABLED);
> +}
> +EXPORT_SYMBOL_GPL(thermal_zone_device_enable);
> +
> +int thermal_zone_device_disable(struct thermal_zone_device *tz)
> +{
> +       return thermal_zone_device_set_mode(tz, THERMAL_DEVICE_DISABLED);
> +}
> +EXPORT_SYMBOL_GPL(thermal_zone_device_disable);
> +
> +int thermal_zone_device_is_enabled(struct thermal_zone_device *tz)
> +{
> +       enum thermal_device_mode mode;
> +
> +       mutex_lock(&tz->lock);
> +
> +       mode = tz->mode;
> +
> +       mutex_unlock(&tz->lock);
> +
> +       return mode == THERMAL_DEVICE_ENABLED;
> +}
> +EXPORT_SYMBOL_GPL(thermal_zone_device_is_enabled);
> +
>  void thermal_zone_device_update(struct thermal_zone_device *tz,
>                                 enum thermal_notify_event event)
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
>         const char *type, int trips, int mask, void *devdata,
> @@ -463,6 +466,16 @@ static inline void thermal_cdev_update(struct thermal_cooling_device *cdev)
>  static inline void thermal_notify_framework(struct thermal_zone_device *tz,
>         int trip)
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
> --
> 2.17.1
>
